<?php
/**
 * @author    p0v1n0m <support@lutylab.ru>
 * @license   Commercial
 * @link      https://lutylab.ru
 */
class ModelExtensionModuleLLCDEKExchange extends Model {
	protected $code = false;
	protected $statics = false;
	protected $ll = false;

	public function __construct($registry) {
		$this->registry = $registry;

		$this->code = basename(__FILE__, '.php');

		$this->statics = new \Config();
		$this->statics->load($this->code);

		$this->ll = new LL\Core($this->registry, $this->code, $this->statics->get('type'));
	}

	public function getOrder($order_id) {
		$export_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . $this->code . "_order` WHERE order_id = " . (int)$order_id . " AND status = 0");

		if (!$export_query->num_rows) {
			return;
		}

		$order_query = $this->db->query("SELECT *, (SELECT CONCAT(c.firstname, ' ', c.lastname) FROM " . DB_PREFIX . "customer c WHERE c.customer_id = o.customer_id) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS order_status FROM `" . DB_PREFIX . "order` o WHERE o.order_id = '" . (int)$order_id . "'");

		$product_query = $this->db->query("SELECT op.*, p.shipping, p.length, p.width, p.height, p.length_class_id, p.tax_class_id, p.model, p.sku, p.upc, p.ean, p.jan, p.isbn, p.mpn FROM " . DB_PREFIX . "order_product op LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = op.product_id) WHERE order_id = '" . (int)$order_id . "'");

		$services = [];

		if ($this->config->get($this->ll->getPrefix() . '_default_services')) {
			foreach ($this->config->get($this->ll->getPrefix() . '_default_services') as $service) {
				if (in_array($export_query->row['tariff'], $service['variants']) && is_array($service['variants']) && is_array($service['services'])) {
					foreach ($service['services'] as $code) {
						$services[] = $code;
					}

					break;
				}
			}
		}

		$product_count = 0;

		foreach ($product_query->rows as $product) {
			$product_count += $product['quantity'];
		}

		// если включена упаковка и задан ее вес, прибавляем его к общему весу заказа
		$order_weight = $export_query->row['weight'];

		if ($this->config->get($this->ll->getPrefix() . '_default_product_pack')) {
			$order_weight += (float)$this->config->get($this->ll->getPrefix() . '_default_product_pack_weight');
		}

		// форматируем полученный общий вес
		$order_weight = number_format($order_weight, 2, '.', '');

		// рассчитываем средний вес одного товара, исходя из общего веса заказа,
		// полученного при расчете доставки, т.к. реального веса товара может не быть
		$product_weight = $order_weight / $product_count;

		// форматируем полученный вес одного товара
		$product_weight = number_format($product_weight, 2, '.', '');

		$total = 0; // общая стоимость заказа
		$total_cost = 0; // общая стоимость заказа в валюте договора
		$total_diff = 0; // общая сумма расхождений итого
		$total_count = 0; // общее количество единиц всех товаров
		$cod = false;
		$length = 0;
		$width = 0;
		$height = 0;

		// поддержка виртуальных платежек
		$payment_code = explode('.', $order_query->row['payment_code']);

		if (isset($payment_code[0])) {
			$payment_code = $payment_code[0];
		}

		if (is_array($this->config->get($this->ll->getPrefix() . '_cod')) && in_array($payment_code, $this->config->get($this->ll->getPrefix() . '_cod'))) {
			$cod = true;
		}

		foreach ($product_query->rows as $product) {
			$name_options = ' ';

			$options = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$product['order_product_id'] . "'");

			foreach ($options->rows as $option) {
				if ($option['type'] != 'file') {
					$name_options .= ' | ' . $option['name'] . ' - ' . $option['value'];
				}
			}

			// отнимаем от стоимости товаров сумму скидки, которая идет отдельной строкой в Итого
			// аналогично для наценки
			$product_сost = $this->currency->convert($product['price'], $this->config->get('config_currency'), $this->config->get($this->ll->getPrefix() . '_currency')); // только здесь валюта договора
			$product_payment = $cod ? $this->currency->convert($product_сost, $this->config->get($this->ll->getPrefix() . '_currency'), $order_query->row['currency_code']) : 0; // здесь и далее валюта получателя

			// определяем налоги товара
			$vat_rate = null;
			$vat_sum = null;

			if ($this->config->get($this->ll->getPrefix() . '_default_product_vat_rate') == 'product' && $product['tax_class_id'] > 0) {
				$tax_rules = $this->db->query("SELECT * FROM " . DB_PREFIX . "tax_rule WHERE tax_class_id = '" . (int)$product['tax_class_id'] . "'");

				if ($tax_rules->num_rows) {
					foreach ($tax_rules->rows as $rule) {
						if ($rule['based'] == 'shipping') {
							$tax_rate = $this->db->query("SELECT * FROM " . DB_PREFIX . "tax_rate WHERE tax_rate_id = '" . (int)$rule['tax_rate_id'] . "'");

							if ($tax_rate->num_rows && $tax_rate->row['type'] == 'P' && in_array((int)$tax_rate->row['rate'], [0, 10, 20])) {
								$vat_rate = 'VAT' . (int)$tax_rate->row['rate'];

								if ($this->config->get('config_tax')) {
									// если включены цены с налогами, то просто берем размер налогов
									$vat_sum += $product['tax'];
								
								} else {
									// если выключен, то считаем
									$vat_sum += $this->currency->format($product_payment - ($product_payment / (1 + $tax_rate->row['rate'] / 100)), $order_query->row['currency_code'], '', false);
								}
							}
						}
					}
				}
			} else {
				$vat_rate = $this->config->get($this->ll->getPrefix() . '_default_product_vat_rate');
				$vat_sum = 0;
			}

			$products[] = [
				'id'               => $product['product_id'],
				'model'            => $product['model'],
				'edit'             => $this->ll->getLink('catalog/product/edit', '&product_id=' . $product['product_id']),
				'Amount'           => round($product['quantity']),
				'WareKey'          => str_replace(['«', '»'], ' ', utf8_substr($product[$this->config->get($this->ll->getPrefix() . '_default_product_article')], 0, 50)),
				'Marking'          => null,
				'Cost'             => $product_сost,
				'Payment'          => $product_payment,
				'total'            => $product_payment * $product['quantity'],
				'PaymentVATRate'   => $vat_rate,
				'PaymentVATSum'    => $vat_sum,
				'Weight'           => $product_weight,
				'Comment'          => utf8_substr($product['name'] . $name_options, 0, 255),
				'CommentEx'        => utf8_substr($product['name'] . $name_options, 0, 255),
				'WeightBrutto'     => $product_weight,
				'Link'             => ($this->request->server['HTTPS'] ? HTTPS_CATALOG : HTTP_CATALOG) . 'index.php?route=product/product&product_id=' . $product['product_id'],
			];

			$total += $product_payment * $product['quantity'];
			$total_cost += $product_сost * $product['quantity'];
			$total_count += $product['quantity'];

			// собираем габариты упаковки
			if ($product['shipping']) {
				$product_length = $this->length->convert($product['length'], $product['length_class_id'], $this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_length_class_id'));
				$product_width = $this->length->convert($product['width'], $product['length_class_id'], $this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_length_class_id'));
				$product_height = $this->length->convert($product['height'], $product['length_class_id'], $this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_length_class_id'));

				$product_length = $product_length == 0 && !$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_default_type') ? (float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_default_length') : $product_length;
				$product_width = $product_width == 0 && !$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_default_type') ? (float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_default_width') : $product_width;
				$product_height = $product_height == 0 && !$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_default_type') ? (float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_default_height') : $product_height;

				if ($this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_calc_type') == 1) {
					$length += $product_length * $product['quantity'];

					if ($product_width > $width) {
						$width = $product_width;
					}

					if ($product_height > $height) {
						$height = $product_height;
					}
				} elseif ($this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_calc_type') == 2) {
					if ($product_length > $length) {
						$length = $product_length;
					}

					if ($product_width > $width) {
						$width = $product_width;
					}

					$height += $product_height * $product['quantity'];
				} else {
					if ($product_length > $length) {
						$length = $product_length;
					}

					$width += $product_width * $product['quantity'];

					if ($product_height > $height) {
						$height = $product_height;
					}
				}
			}
		}

		if ($this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_default_type')) {
			if ($product_length == 0) {
				$length = (float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_default_length');
			}

			if ($product_width == 0) {
				$width = (float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_default_width');
			}

			if ($product_height == 0) {
				$height = (float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_default_height');
			}
		}

		$helper = DIR_SYSTEM . 'helper/' . $this->m . '.php';

		if ($this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_custom_sizes') && file_exists($helper) && is_file($helper)) {
			require_once($helper);

			$custom_sizes = getCustomSizes($this->registry);
			$length = isset($custom_sizes['length']) ? $custom_sizes['length'] : $length;
			$width = isset($custom_sizes['width']) ? $custom_sizes['width'] : $width;
			$height = isset($custom_sizes['height']) ? $custom_sizes['height'] : $height;
		}

		if ((float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_box_length') > 0) {
			$length += (float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_box_length');
		}

		if ((float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_box_width') > 0) {
			$width += (float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_box_width');
		}

		if ((float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_box_height') > 0) {
			$height += (float)$this->config->get($this->ll->getPrefix('ll_cdek', 'shipping') . '_box_height');
		}

		// стоимость доставки
		$shipping_cost = $this->db->query("SELECT value FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' AND code = 'shipping'");
		$shipping_cost = $cod ? $this->currency->convert($shipping_cost->row['value'], $this->config->get('config_currency'), $order_query->row['currency_code']) : 0;
		$total += $shipping_cost;

		// определяем несоответствия итоговой стоимости из-за всяких скидок и наценок
		$order_totals = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order");
		
		foreach ($order_totals->rows as $order_total) {
			if ($order_total['code'] == 'total') {
				$order_total = $this->currency->convert($order_total['value'], $this->config->get('config_currency'), $order_query->row['currency_code']);

				if ($order_total != $total) {
					$total_diff = $order_total - $total;
				}
			}
		}

		if ($cod && $total_diff != 0) {
			$diff = $total_diff / $total_count;

			foreach ($products as $key => $product) {
				$products[$key]['Cost'] += $this->currency->convert($diff, $order_query->row['currency_code'], $this->config->get($this->ll->getPrefix() . '_currency'));
				$products[$key]['Payment'] += $diff;
				// округляем согласно настройкам валюты
				$products[$key]['Cost'] = $this->currency->format($products[$key]['Cost'], $order_query->row['currency_code'], '', false);
				$products[$key]['Payment'] = $this->currency->format($products[$key]['Payment'], $order_query->row['currency_code'], '', false);

				$products[$key]['total'] = $products[$key]['Cost'] * $product['Amount'];

			}

			$total += $total_diff;
		}

		// заменяем на фиксированную страховку
		if (((!$cod && !$this->config->get($this->ll->getPrefix() . '_merge_cost_type')) || $this->config->get($this->ll->getPrefix() . '_merge_cost_type')) && $this->config->get($this->ll->getPrefix() . '_merge_cost') > 0) {
			$fix_cost = $this->config->get($this->ll->getPrefix() . '_merge_cost') / $total_count;

			foreach ($products as $key => $product) {
				$products[$key]['Cost'] = $this->currency->format($fix_cost, $order_query->row['currency_code'], '', false);
			}
		}

		// налоги доставки
		$shipping_vat_rate = null;
		$shipping_vat_sum = null;

		if ($this->config->get('ll_cdek_tax_class_id') > 0) {
			$shipping_tax_rules = $this->db->query("SELECT * FROM " . DB_PREFIX . "tax_rule WHERE tax_class_id = '" . (int)$this->config->get('ll_cdek_tax_class_id') . "'");

			if ($shipping_tax_rules->num_rows) {
				foreach ($shipping_tax_rules->rows as $rule) {
					if ($rule['based'] == 'shipping') {
						$tax_rate = $this->db->query("SELECT * FROM " . DB_PREFIX . "tax_rate WHERE tax_rate_id = '" . (int)$rule['tax_rate_id'] . "'");

						if ($tax_rate->num_rows && $tax_rate->row['type'] == 'P' && in_array((int)$tax_rate->row['rate'], [0, 10, 20])) {
							$shipping_vat_rate = 'VAT' . (int)$tax_rate->row['rate'];

							if ($this->config->get('config_tax')) {
								// если включены цены с налогами
								$shipping_vat_sum = $this->currency->format(($shipping_cost * $tax_rate->row['rate'] / 100), $order_query->row['currency_code'], '', false);
							} else {
								// если выключены цены с налогами
								$shipping_vat_sum = $this->currency->format($shipping_cost - ($shipping_cost / (1 + $tax_rate->row['rate'] / 100)), $order_query->row['currency_code'], '', false);
							}
						}
					}
				}
			}
		}

		if ($order_query->num_rows) {
			$from_data = $this->getCity($export_query->row['from_city']);
			$to_data = $this->getCity($export_query->row['to_city']);

			// создаем преднастройки для объединения товаров
			$merge_total = $total - $shipping_cost;
			$merge_vat_rate = $this->config->get($this->ll->getPrefix() . '_merge_vat');

			if ($this->config->get($this->ll->getPrefix() . '_merge_vat') == 'VAT10') {
				$merge_vat_sum = $this->currency->format($merge_total - ($merge_total / (1 + 10 / 100)), $order_query->row['currency_code'], '', false);
			} elseif ($this->config->get($this->ll->getPrefix() . '_merge_vat') == 'VAT20') {
				$merge_vat_sum = $this->currency->format($merge_total - ($merge_total / (1 + 20 / 100)), $order_query->row['currency_code'], '', false);
			} else {
				$merge_vat_rate = null;
				$merge_vat_sum = null;
			}

			$merge = [
				'edit'             => $this->ll->getLinkExtension(),
				'Amount'           => 1,
				'WareKey'          => str_replace(['«', '»'], ' ', utf8_substr($this->config->get($this->ll->getPrefix() . '_merge_model'), 0, 50)),
				'Marking'          => null,
				'Cost'             => !$cod && $this->config->get($this->ll->getPrefix() . '_merge_cost') > 0 ? $this->config->get($this->ll->getPrefix() . '_merge_cost') : $total_cost,
				'Payment'          => $merge_total,
				'total'            => $merge_total,
				'PaymentVATRate'   => $merge_vat_rate,
				'PaymentVATSum'    => $merge_vat_sum,
				'Weight'           => $order_weight,
				'Comment'          => utf8_substr($this->config->get($this->ll->getPrefix() . '_merge_name'), 0, 255),
				'CommentEx'        => utf8_substr($this->config->get($this->ll->getPrefix() . '_merge_name'), 0, 255),
				'WeightBrutto'     => $order_weight,
				'Link'             => $this->config->get($this->ll->getPrefix() . '_merge_link'),
			];

			// автоматически объединяем товары
			if ($this->config->get($this->ll->getPrefix() . '_merge')) {
				$products = [$merge];
			}

			// объединяем товары с одинаковой моделью
			if ($this->config->get($this->ll->getPrefix() . '_merge_from_model')) {
				$models = [];

				foreach ($products as $key => $product) {
					if (isset($models[$product['model']])) {
						$products[$models[$product['model']]]['Amount'] += $product['Amount'];
						$products[$models[$product['model']]]['Cost'] += $product['Cost'];
						$products[$models[$product['model']]]['PaymentVATSum'] += $product['PaymentVATSum'];
						$products[$models[$product['model']]]['total'] += $product['total'];
						$products[$models[$product['model']]]['Comment'] = $product['model'];
						$products[$models[$product['model']]]['CommentEx'] = $product['model'];

						$unset_keys[] = $key;
					} else {
						$models[$product['model']] = $key;
					}
				}

				foreach ($unset_keys as $key) {
					unset($products[$key]);
				}
			}

			return [
				'id'                           => $order_query->row['order_id'],
				'cost_currency'                => $this->config->get($this->ll->getPrefix() . '_currency'), // валюта договора
				'payment_currency'             => $order_query->row['currency_code'], // валюта получателя
				'order_link'                   => $this->ll->getLink('sale/order/info', '&order_id=' . $order_query->row['order_id']),
				'from'                         => $from_data['CityName'] . ', ' . $from_data['OblName'] . ', ' . $from_data['CountryName'],
				'to'                           => $to_data['CityName'] . ', ' . $to_data['OblName'] . ', ' . $to_data['CountryName'],
				'pvzs'                         => $this->getPvzs($export_query->row['to_city']),
				'address'                      => $order_query->row['shipping_address_1'] . ' ' . $order_query->row['shipping_address_2'],
				'products'                     => $products,
				'total'                        => $total,
				'pack'                         => $this->config->get($this->ll->getPrefix() . '_default_product_pack'),
				'Account'                      => $this->config->get($this->ll->getPrefix() . '_api_login'),
				'Secure'                       => md5(date('Y-m-d') . '&' . $this->config->get($this->ll->getPrefix() . '_api_key')),
				'Number'                       => $order_query->row['order_id'] . date('YmdHis', strtotime($order_query->row['date_added'])),
				'Date'                         => date('Y-m-d'),
				'Order' => [
					'Number'                   => str_replace(['{{order_id}}'], ['order_id' => $order_query->row['order_id']], $this->config->get($this->ll->getPrefix() . '_default_order_number')),
					'SendCityCode'             => $export_query->row['from_city'],
					'RecCityCode'              => $export_query->row['to_city'],
					'SendCityPostCode'         => $this->getPostcode($export_query->row['from_city']),
					'RecCityPostCode'          => $this->getPostcode($export_query->row['to_city']),
					'RecipientINN'             => null,
					'DateInvoice'              => date('Y-m-d'),
					'ShipperName'              => $this->config->get($this->ll->getPrefix() . '_default_shipper_name'),
					'ShipperAddress'           => $this->config->get($this->ll->getPrefix() . '_default_shipper_address'),
					'Passport' => [
						'Series'               => null,
						'Number'               => null,
						'IssueDate'            => null,
						'IssuedBy'             => null,
						'DateBirth'            => null,
					],
					'Sender' => [
						'Company'              => $this->config->get($this->ll->getPrefix() . '_default_sender_company'),
						'Name'                 => $this->config->get($this->ll->getPrefix() . '_default_sender_name'),
						'Address' => [
							'Street'           => $this->config->get($this->ll->getPrefix() . '_default_sender_street'),
							'House'            => $this->config->get($this->ll->getPrefix() . '_default_sender_house'),
							'Flat'             => $this->config->get($this->ll->getPrefix() . '_default_sender_flat'),
						],
						'Phone'                => $this->config->get($this->ll->getPrefix() . '_default_sender_phone'),
					],
					'RecipientName'            => ($this->config->get($this->ll->getPrefix() . '_default_recipient_f') ? $order_query->row[$this->config->get($this->ll->getPrefix() . '_default_recipient_f')] : $order_query->row['lastname']) . ' ' . ($this->config->get($this->ll->getPrefix() . '_default_recipient_i') ? $order_query->row[$this->config->get($this->ll->getPrefix() . '_default_recipient_i')] : $order_query->row['firstname']),
					'RecipientEmail'           => in_array($order_query->row['email'], ['empty@empty.empty', 'none@none.none', 'null@null.null', 'localhost@localhost.localhost']) ? '' : $order_query->row['email'],
					'Phone'                    => $order_query->row['telephone'],
					'TariffTypeCode'           => $export_query->row['tariff'],
					'DeliveryRecipientCost'    => (float)$shipping_cost,
					'DeliveryRecipientVATRate' => $shipping_vat_rate,
					'DeliveryRecipientVATSum'  => (float)$shipping_vat_sum,
					'Seller' => [
						'Address'              => $this->config->get($this->ll->getPrefix() . '_default_seller_address'),
						'Name'                 => $this->config->get($this->ll->getPrefix() . '_default_seller_name'),
						'INN'                  => $this->config->get($this->ll->getPrefix() . '_default_seller_inn'),
						'Phone'                => $this->config->get($this->ll->getPrefix() . '_default_seller_phone'),
						'OwnershipForm'        => $this->config->get($this->ll->getPrefix() . '_default_seller_form'),
					],
					'Comment'                  => str_replace(['{{comment}}'], ['comment' => $order_query->row['comment']], $this->config->get($this->ll->getPrefix() . '_default_order_comment')),
					'Address' => [
						'Street'               => $this->config->get($this->ll->getPrefix() . '_default_address_street') ? $order_query->row[$this->config->get($this->ll->getPrefix() . '_default_address_street')] : $order_query->row['shipping_address_1'],
						'House'                => '',
						'Flat'                 => '',
						'PvzCode'              => in_array($export_query->row['tariff'], $this->statics->get('variants_map')) ? $export_query->row['pvz'] : false,
					],
					'Package' => [
						'Number'               => $order_query->row['order_id'] . '_package',
						'BarCode'              => $order_query->row['order_id'] . '_barcode',
						'Weight'               => $order_weight,
						'SizeA'                => $length,
						'SizeB'                => $width,
						'SizeC'                => $height,
						'Item'                 => null,
					],
					'DeliveryRecipientCostAdv' => [
						'Threshold'            => null,
						'Sum'                  => null,
						'VATRate'              => null,
						'VATSum'               => null,
					],
					'services'                 => $services,
					'service_count'            => $this->config->get($this->ll->getPrefix() . '_service_count'),
				],
				'call'                         => [
					'date'            => date('Y-m-d', strtotime('+ ' . $this->config->get($this->ll->getPrefix() . '_default_courier_date') . ' day')),
					'time_beg'        => $this->config->get($this->ll->getPrefix() . '_default_courier_time_beg'),
					'time_end'        => $this->config->get($this->ll->getPrefix() . '_default_courier_time_end'),
					'lunch_beg'       => $this->config->get($this->ll->getPrefix() . '_default_courier_lunch_beg'),
					'lunch_end'       => $this->config->get($this->ll->getPrefix() . '_default_courier_lunch_end'),
					'street'          => $this->config->get($this->ll->getPrefix() . '_default_courier_street'),
					'house'           => $this->config->get($this->ll->getPrefix() . '_default_courier_house'),
					'flat'            => $this->config->get($this->ll->getPrefix() . '_default_courier_flat'),
					'send_phone'      => $this->config->get($this->ll->getPrefix() . '_default_courier_send_phone'),
					'sender_name'     => $this->config->get($this->ll->getPrefix() . '_default_courier_sender_name'),
					'comment'         => $this->config->get($this->ll->getPrefix() . '_default_courier_comment'),
				],
				'merge'                        => $merge,
			];
		} else {
			return;
		}
	}

	public function getOrders($data) {
		$sql = "SELECT e.*, CONCAT(o.firstname, ' ', o.lastname) AS customer, o.customer_id, o.telephone, o.total, o.currency_code, o.currency_value, o.date_added, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS order_status FROM `" . DB_PREFIX . $this->code . "_order` as e LEFT JOIN `" . DB_PREFIX . "order` o ON e.order_id = o.order_id";

		if (!empty($data['filter_order_status'])) {
			$implode = [];

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} elseif ($this->config->has($this->ll->getPrefix() . '_list_order_status') && !empty($this->config->get($this->ll->getPrefix() . '_list_order_status'))) {
			$implode = [];

			foreach ($this->config->get($this->ll->getPrefix() . '_list_order_status') as $order_status_id) {
				$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND o.order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_to'])) {
			$sql .= " AND e.to_city = '" . (int)$data['filter_to'] . "'";
		}

		if (!empty($data['filter_pvz'])) {
			$sql .= " AND e.pvz LIKE '%" . $this->db->escape($data['filter_pvz']) . "%'";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND o.total = '" . (float)$data['filter_total'] . "'";
		}

		if (!empty($data['filter_tariff'])) {
			$sql .= " AND e.tariff = '" . (int)$data['filter_tariff'] . "'";
		}

		if (!empty($data['filter_number'])) {
			$sql .= " AND e.number LIKE '%" . $this->db->escape($data['filter_number']) . "%'";
		}

		if (!empty($data['filter_dispatch'])) {
			$sql .= " AND e.dispatch_number LIKE '%" . $this->db->escape($data['filter_dispatch']) . "%'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(o.firstname, ' ', o.lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(o.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (is_numeric($data['filter_cdek_status'])) {
			if ((int)$data['filter_cdek_status'] == 0) {
				$sql .= " AND e.dispatch_number is null";
			}

			$sql .= " AND e.status = '" . (int)$data['filter_cdek_status'] . "'";
		}

		$sql .= " ORDER BY e.order_id DESC LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalOrders($data) {
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . $this->code . "_order` as e LEFT JOIN `" . DB_PREFIX . "order` o ON e.order_id = o.order_id";

		if (!empty($data['filter_order_status'])) {
			$implode = [];

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} elseif ($this->config->has($this->ll->getPrefix() . '_list_order_status') && !empty($this->config->get($this->ll->getPrefix() . '_list_order_status'))) {
			$implode = [];

			foreach ($this->config->get($this->ll->getPrefix() . '_list_order_status') as $order_status_id) {
				$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND o.order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_to'])) {
			$sql .= " AND e.to_city = '" . (int)$data['filter_to'] . "'";
		}

		if (!empty($data['filter_pvz'])) {
			$sql .= " AND e.pvz LIKE '%" . $this->db->escape($data['filter_pvz']) . "%'";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND o.total = '" . (float)$data['filter_total'] . "'";
		}

		if (!empty($data['filter_tariff'])) {
			$sql .= " AND e.tariff = '" . (int)$data['filter_tariff'] . "'";
		}

		if (!empty($data['filter_number'])) {
			$sql .= " AND e.number LIKE '%" . $this->db->escape($data['filter_number']) . "%'";
		}

		if (!empty($data['filter_dispatch'])) {
			$sql .= " AND e.dispatch_number LIKE '%" . $this->db->escape($data['filter_dispatch']) . "%'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(o.firstname, ' ', o.lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(o.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (is_numeric($data['filter_cdek_status'])) {
			if ((int)$data['filter_cdek_status'] == 0) {
				$sql .= " AND e.dispatch_number is null";
			}

			$sql .= " AND e.status = '" . (int)$data['filter_cdek_status'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getOrderInfo($order_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . $this->code . "_order` as e LEFT JOIN `" . DB_PREFIX . "order` o ON e.order_id = o.order_id WHERE e.order_id = '" . (int)$order_id . "'");

		if (!$query->num_rows) {
			return;
		}

		return $query->row;
	}

	public function getOrderDispatchNumber($order_id) {
		$query = $this->db->query("SELECT dispatch_number FROM `" . DB_PREFIX . $this->code . "_order` WHERE order_id = '" . (int)$order_id . "'");

		if (isset($query->row['dispatch_number'])) {
			return $query->row['dispatch_number'];
		}
	}

	public function getOrderNumber($order_id) {
		$query = $this->db->query("SELECT `number` FROM `" . DB_PREFIX . $this->code . "_order` WHERE order_id = '" . (int)$order_id . "'");

		if (isset($query->row['number'])) {
			return $query->row['number'];
		}
	}

	public function getOrderHistories($order_id) {
		$query = $this->db->query("SELECT oh.date_added, os.name AS status, oh.comment, oh.notify FROM " . DB_PREFIX . "order_history oh LEFT JOIN " . DB_PREFIX . "order_status os ON oh.order_status_id = os.order_status_id WHERE oh.order_id = '" . (int)$order_id . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY oh.date_added DESC");

		return $query->rows;
	}

	public function getOrderStatuses($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->code . "_status WHERE order_id = '" . (int)$order_id . "' ORDER BY date DESC");

		return $query->rows;
	}

	public function getOrderStatus($order_id, $code, $date = false) {
		date_default_timezone_set($this->config->get($this->ll->getPrefix() . '_timezone'));

		$sql = "SELECT code FROM " . DB_PREFIX . $this->code . "_status WHERE order_id = '" . (int)$order_id . "' AND code = '" . (int)$code . "'";

		if ($date) {
			$sql .= " AND date = '" . date('Y-m-d H:i:s', strtotime($date)) . "'";
		}

		$query = $this->db->query($sql);

		if (isset($query->row['code'])) {
			return $query->row['code'];
		}
	}

	public function getCity($city_code) {
		$query = $this->db->query("SELECT c.CityName, r.OblName, co.CountryName FROM `" . DB_PREFIX . "ll_cdek_city` as c LEFT JOIN `" . DB_PREFIX . "ll_cdek_region` r ON c.region_id = r.id LEFT JOIN `" . DB_PREFIX . "ll_cdek_country` co ON c.CountryCode = co.CountryCode WHERE CityCode = '" . (int)$city_code . "'");

		return $query->row;
	}

	public function getCities($city_name) {
		$query = $this->db->query("SELECT CityCode AS id, CityName AS city, FullName AS full FROM `" . DB_PREFIX . "ll_cdek_city` WHERE CityName LIKE '" . $this->db->escape($city_name) . "%' ORDER BY CityCode ASC, FullName ASC LIMIT 0,7");

		return $query->rows;
	}

	public function getPostcode($city_code) {
		$query = $this->db->query("SELECT PostCodeList FROM `" . DB_PREFIX . "ll_cdek_city` WHERE CityCode = '" . (int)$city_code . "'");

		if ($query->num_rows) {
			$postcodes = explode(',', $query->row['PostCodeList']);

			return $postcodes[0];
		}
	}

	public function getPvz($pvz_code) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "ll_cdek_pvz` WHERE code = '" . $this->db->escape($pvz_code) . "'");

		return $query->row;
	}

	public function getPvzs($pvz_code) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "ll_cdek_pvz` WHERE cityCode = '" . (int)$pvz_code . "' AND isHandout = 1 ORDER BY type DESC, code ASC");

		return $query->rows;
	}

	public function updateOrderNumber($order_id, $number, $order_number, $pvz) {
		$this->db->query("UPDATE `" . DB_PREFIX . $this->code . "_order` SET number = '" .  $this->db->escape($number) . "', order_number = '" .  $this->db->escape($order_number) . "', pvz = '" .  $this->db->escape($pvz) . "' WHERE order_id = '" . (int)$order_id . "'");
	}

	public function updateOrder($order_number, $dispatch_number) {
		$this->db->query("UPDATE `" . DB_PREFIX . $this->code . "_order` SET dispatch_number = '" .  $this->db->escape($dispatch_number) . "', status = 999, date = NOW() WHERE order_number = '" . $this->db->escape($order_number) . "'");
	}

	public function changeDispatchNumber($order_id, $dispatch_number) {
		$this->db->query("UPDATE `" . DB_PREFIX . $this->code . "_order` SET dispatch_number = '" .  $this->db->escape($dispatch_number) . "' WHERE order_id = '" . (int)$order_id . "'");
	}

	public function cleanOrder($order_id) {
		$this->db->query("UPDATE `" . DB_PREFIX . $this->code . "_order` SET number = null, order_number = null, dispatch_number = null, date = NOW(), status = 0 WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . $this->code . "_status` WHERE order_id = '" . (int)$order_id . "'");
	}

	public function removeOrderFromModule($order_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . $this->code . "_order` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . $this->code . "_status` WHERE order_id = '" . (int)$order_id . "'");
	}

	public function addOrderStatus($order_id, $data) {
		date_default_timezone_set($this->config->get($this->ll->getPrefix() . '_timezone'));

		$this->db->query("INSERT IGNORE INTO `" . DB_PREFIX . $this->code . "_status` SET order_id = '" . (int)$order_id . "', date = '" . $this->db->escape(date('Y-m-d H:i:s', strtotime($data['@attributes']['Date']))) . "', code = '" . (int)$data['@attributes']['Code'] . "', description = '" . $this->db->escape($data['@attributes']['Description']) . "', city_code = '" . (int)$data['@attributes']['CityCode'] . "', city_name = '" . $this->db->escape($data['@attributes']['CityName']) . "'");
		$this->updateOrderStatus($order_id, $data);
	}

	public function updateOrderStatus($order_id, $data) {
		date_default_timezone_set($this->config->get($this->ll->getPrefix() . '_timezone'));

		$this->db->query("UPDATE `" . DB_PREFIX . $this->code . "_order` SET status = '" . (int)$data['@attributes']['Code'] . "', date = '" . $this->db->escape(date('Y-m-d H:i:s', strtotime($data['@attributes']['Date']))) . "' WHERE order_id = '" . (int)$order_id . "'");
	}

	public function install() {
		//order_id - номер заказа в магазине
		//number - номер всего отправления, который генерим мы, может быть у нескольких заказов, если они экспортировались вместе
		//order_number - номер заказа магазина при экспорте
		//dispatch_number - номер заказа сдэк
		//date - дата последнего действия/изменения
		//status - согласно приложению 5. если 0, то не создан
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . $this->code . "_order` (
			`order_id` int(11) NOT NULL,
			`number` varchar(40),
			`order_number` varchar(40),
			`dispatch_number` int(11),
			`from_city` int(11) NOT NULL,
			`to_city` int(11) NOT NULL,
			`tariff` int(11) NOT NULL,
			`pvz` varchar(10) NOT NULL,
			`weight` int(11) NOT NULL,
			`date` datetime,
			`status` int(11) NOT NULL DEFAULT '0',
			PRIMARY KEY (`order_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci"
		);

		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . $this->code . "_status` (
			`state_id` int(11) NOT NULL AUTO_INCREMENT,
			`order_id` int(11) NOT NULL,
			`date` datetime NOT NULL,
			`code` int(11) NOT NULL,
			`description` varchar(100) NOT NULL,
			`city_code` int(11) NOT NULL,
			`city_name` varchar(100) NOT NULL,
			PRIMARY KEY (`state_id`),
			KEY `order_id` (`order_id`),
			UNIQUE KEY `order_id_date_code` (`order_id`, `date`, `code`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci"
		);
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->code . "_order`;");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->code . "_status`;");
	}
}

class ModelModuleLLCDEKExchange extends ModelExtensionModuleLLCDEKExchange {}
