<?php
/**
 * @author    p0v1n0m <support@lutylab.ru>
 * @license   Commercial
 * @link      https://lutylab.ru
 */
class ModelExtensionShippingLLcdek extends Model {
	private $m = 'll_cdek';
	private $api_url = 'https://api.cdek.ru/';
	private $api_test_url = 'https://api.edu.cdek.ru/';
	private $api_version = '1';
	private $variants = ['136', '137', '138', '139', '366', '368', '10', '11', '12', '1', '361', '363', '233', '234', '378', '291', '293', '294', '295', '7', '8', '243', '245', '246', '247', '5', '15', '16', '17', '18', '57', '58', '59', '60', '61', '3', '62', '63', '118', '119', '120', '121', '122', '123', '124', '125', '126'];
	private $variants_map = ['136', '138', '366', '368', '234', '378', '291', '295', '243', '247', '361', '363', '5', '10', '12', '15', '17', '62', '63', '120', '123', '126'];
	private $variants_pvz = ['136', '138', '234', '291', '295', '243', '247', '5', '10', '12', '15', '17', '62', '63', '120', '123', '126'];
	private $variants_postamat = ['366', '368', '378', '361', '363'];
	private $pickup_city = null;
	private $delivery_city = null;
	private $active_id = null;
	private $address = null;
	private $payment_method = null;
	private $total = 0;
	private $params = null;
	private $calcs = null;
	private $prices = null;
	private $points = null;
	private $pvzs = null;
	private $postamats = null;
	private $pickups = null;
	private $active_address = null;
	private $active_full_address = null;
	private $active_phone = null;
	private $active_shedule = null;
	private $map_prefix = null;
	private $is_postamat = null;

	function getQuote($address) {
		$status = true;
		$method_data = [];
		$this->total = $this->cart->getTotal();
		$this->sub_total = $this->cart->getSubTotal();
		$weight = $this->cart->getWeight();
		// конвертируем в кг из дефолтных единиц магазина
		$weight = $this->weight->convert($weight, $this->config->get('config_weight_class_id'), $this->config->get($this->m . '_weight_class_id'));

		if (!$this->config->get($this->m . '_api_login') || !$this->config->get($this->m . '_api_key') || !isset($address['city'])) {
			$status = false;
		}

		if ($status && !empty($this->config->get($this->m . '_stops'))) {
			foreach ($this->config->get($this->m . '_stops') as $stop) {
				if (empty($stop['variant']) || count($stop['variant']) == count($this->variants)) {
					if (!empty($stop['customer_group']) && (!$this->customer->isLogged() || ($this->customer->isLogged() && !in_array($this->customer->getGroupId(), $stop['customer_group'])))) {
						$status = false;
						break;
					}

					if (!empty($stop['geo_zone'])) {
						$geo_zone_rows = 0;

						foreach ($stop['geo_zone'] as $geo_zone_id) {
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

							$geo_zone_rows += $query->num_rows;
						}

						if (!$geo_zone_rows) {
							$status = false;
							break;
						}
					}

					$city = mb_strtolower(trim($address['city']));

					if ($stop['city_only'] != '' && !in_array($city, explode(',', $stop['city_only']))) {
						$status = false;
						break;
					}

					if ($stop['city_exclude'] != '' && in_array($city, explode(',', $stop['city_exclude']))) {
						$status = false;
						break;
					}

					if ($stop['weight_min'] != '' && $stop['weight_min'] != 0 && (float)$weight < (float)$stop['weight_min']) {
						$status = false;
						break;
					}

					if ($stop['weight_max'] != '' && $stop['weight_max'] != 0 && (float)$weight > (float)$stop['weight_max']) {
						$status = false;
						break;
					}

					if ($stop['total_min'] != '' && $stop['total_min'] != 0 && (float)$this->total < (float)$stop['total_min']) {
						$status = false;
						break;
					}

					if ($stop['total_max'] != '' && $stop['total_max'] != 0 && (float)$this->total > (float)$stop['total_max']) {
						$status = false;
						break;
					}
				}
			}
		}

		if ($status) {
			$this->load->language('extension/shipping/' . $this->m);

			$this->address = $address;
			$this->pickup_city = $this->getPickupCity();
			$this->delivery_city = $this->getCity();
			$this->active_id = $this->getActiveId();
			$weight = 0;
			$length = 0;
			$width = 0;
			$height = 0;
			$start = true;
			$this->map_prefix = $this->config->has('ll_shipping_mapper_methods') && in_array($this->m, $this->config->get('ll_shipping_mapper_methods')) ? 'll_map' : $this->m;

			foreach ($this->cart->getProducts() as $product) {
				if ($product['shipping']) {
					$product_weight = $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get($this->m . '_weight_class_id'));
					$product_length = $this->length->convert($product['length'], $product['length_class_id'], $this->config->get($this->m . '_length_class_id'));
					$product_width = $this->length->convert($product['width'], $product['length_class_id'], $this->config->get($this->m . '_length_class_id'));
					$product_height = $this->length->convert($product['height'], $product['length_class_id'], $this->config->get($this->m . '_length_class_id'));

					$weight += (float)$product_weight;

					if ($product_weight == 0 && !$this->config->get($this->m . '_default_type')) {
						$weight += (float)$this->config->get($this->m . '_default_weight') * $product['quantity'];
					}

					$product_length = $product_length == 0 && !$this->config->get($this->m . '_default_type') ? (float)$this->config->get($this->m . '_default_length') : $product_length;
					$product_width = $product_width == 0 && !$this->config->get($this->m . '_default_type') ? (float)$this->config->get($this->m . '_default_width') : $product_width;
					$product_height = $product_height == 0 && !$this->config->get($this->m . '_default_type') ? (float)$this->config->get($this->m . '_default_height') : $product_height;

					if ($this->config->get($this->m . '_calc_type') == 1) {
						$length += $product_length * $product['quantity'];

						if ($product_width > $width) {
							$width = $product_width;
						}

						if ($product_height > $height) {
							$height = $product_height;
						}
					} elseif ($this->config->get($this->m . '_calc_type') == 2) {
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

			if ($this->config->get($this->m . '_default_type')) {
				if ($weight == 0) {
					$weight = (float)$this->config->get($this->m . '_default_weight');
				}

				if ($product_length == 0) {
					$length = (float)$this->config->get($this->m . '_default_length');
				}

				if ($product_width == 0) {
					$width = (float)$this->config->get($this->m . '_default_width');
				}

				if ($product_height == 0) {
					$height = (float)$this->config->get($this->m . '_default_height');
				}
			}

			if ($this->config->get($this->m . '_custom_sizes')) {
				$helper = DIR_SYSTEM . 'helper/' . $this->m . '.php';

				if (file_exists($helper) && is_file($helper)) {
					require_once($helper);

					$custom_sizes = getCustomSizes($this->registry);
					$weight = isset($custom_sizes['weight']) ? $custom_sizes['weight'] : $weight;
					$length = isset($custom_sizes['length']) ? $custom_sizes['length'] : $length;
					$width = isset($custom_sizes['width']) ? $custom_sizes['width'] : $width;
					$height = isset($custom_sizes['height']) ? $custom_sizes['height'] : $height;
				}
			}

			if ((float)$this->config->get($this->m . '_box_weight') > 0) {
				$weight += (float)$this->config->get($this->m . '_box_weight');
			}

			if ((float)$this->config->get($this->m . '_box_length') > 0) {
				$length += (float)$this->config->get($this->m . '_box_length');
			}

			if ((float)$this->config->get($this->m . '_box_width') > 0) {
				$width += (float)$this->config->get($this->m . '_box_width');
			}

			if ((float)$this->config->get($this->m . '_box_height') > 0) {
				$height += (float)$this->config->get($this->m . '_box_height');
			}

			$this->params = [
				'version'        => $this->api_version,
				'authLogin'      => $this->config->get($this->m . '_api_login'),
				'secure'         => $this->getSecure(),
				'dateExecute'    => date('Y-m-d'),
				'senderCityId'   => $this->pickup_city,
				'receiverCityId' => $this->delivery_city,
				'tariffId'       => 0,
			];

			$this->params['goods'][] = [
				'weight' => round($weight, 5),
				'length' => round($length, 5),
				'width'  => round($width, 5),
				'height' => round($height, 5),
			];

			$this->session->data[$this->m]['from_city'] = $this->params['senderCityId'];
			$this->session->data[$this->m]['to_city'] = $this->params['receiverCityId'];
			$this->session->data[$this->m]['weight'] = $this->params['goods'][0]['weight'];

			if ($start && $this->pickup_city) {
				$results = $this->getCost();
			}

			if (!empty($results)) {
				$quote_data = [];

				foreach ($results as $result) {
					$map = null;

					if (in_array($result['code'], $this->variants_map)) {
						// это в админке
						if (isset($this->session->data['api_id'])) {
							$map .= '<div class="input-group hidden ll_shipping" data-shipping="' . $this->m . '.' . $this->m . '_' . $result['code'] . '"><div class="input-group-addon">' . $this->config->get($this->m . '_map_button') . '</div><select class="form-control" onchange="ll_shipping_set_pickup_id(this.value);">';

							foreach ($this->points as $pvz) {
								$map .= '<option value="' . $pvz['code'] . '" ' . ($pvz['code'] == $this->active_id ? 'selected="selected"' : '') . '>' . $pvz['address'] . '</option>';
							}

							$map .= '</select></div>';
						} else {
							if ($this->config->get($this->m . '_list_' . $result['code'])) {
								if (!empty($this->pvzs) && in_array($result['code'], $this->variants_pvz)) {
									$map .= '<div style="max-width: 100%;"><select class="ll_change_point" data-onchange="reloadAll" onchange="' . $this->map_prefix . '_set_pickup_id(this.value, \'' . $this->m . '\');" style="max-width: 300px;">';

									foreach ($this->pvzs as $pvz) {
										$map .= '<option value="' . $pvz['code'] . '" ' . ($pvz['code'] == $this->active_id ? 'selected="selected"' : '') . '>' . $pvz['address'] . '</option>';
									}

									$map .= '</select>';
								} elseif (!empty($this->postamats) && in_array($result['code'], $this->variants_postamat)) {
									$map .= '<div style="max-width: 100%;"><select class="ll_change_point" data-onchange="reloadAll" onchange="' . $this->map_prefix . '_set_pickup_id(this.value, \'' . $this->m . '\');" style="max-width: 300px;">';

									foreach ($this->postamats as $postamat) {
										$map .= '<option value="' . $postamat['code'] . '" ' . ($postamat['code'] == $this->active_id ? 'selected="selected"' : '') . '>' . $postamat['address'] . '</option>';
									}

									$map .= '</select>';
								}
							}

							if ($this->config->get($this->m . '_map_type') && $this->config->get($this->m . '_map_status')) {
								$map .= '<a class="btn btn-primary ll_open_map" style="padding: 1px;" onclick="' . $this->map_prefix . '_show_modal(\'' . ($this->config->get('ll_shipping_mapper_filter') != 0 ? $this->config->get('ll_shipping_mapper_filter') : $this->m) . '\', \'' . $result['code'] . '\', \'' . (in_array($result['code'], $this->variants_postamat) ? 'POSTAMAT' : 'PVZ') . '\'); return false;">' . $this->config->get($this->m . '_map_button') . '</a>';
							}

							if ($this->config->get($this->m . '_list_' . $result['code']) && ((!empty($this->pvzs) && in_array($result['code'], $this->variants_pvz)) || (!empty($this->postamats) && in_array($result['code'], $this->variants_postamat)))) {
								$map .= '</div>';
							}
						}
					}

					$quote_data[$this->m . '_' . $result['code']] = [
						'code'         => $this->m . '.' . $this->m . '_' . $result['code'],
						'title'        => $result['title'],
						'cost'         => $this->config->get('ll_total_status') ? $result['cost_total'] : $result['cost'],
						'cost_total'   => $this->config->get('ll_total_status') ? $result['cost'] : $result['cost_total'],
						'tax_class_id' => $this->config->get($this->m . '_tax_class_id'),
						'text'         => $this->currency->format($this->tax->calculate($result['cost_total'], $this->config->get($this->m . '_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency']),
						'description'  => $result['description'] . $map,
					];

					if (!isset($this->session->data['shipping_method']['code']) && isset($this->session->data['ll_shipping_widget_active']) && $this->session->data['ll_shipping_widget_active'] == $quote_data[$this->m . '_' . $result['code']]['code']) {
						$this->session->data['shipping_method']['code'] = $quote_data[$this->m . '_' . $result['code']]['code'];
						$this->session->data['shipping_method']['title'] = $quote_data[$this->m . '_' . $result['code']]['title'];
						$this->session->data['shipping_method']['cost'] = $quote_data[$this->m . '_' . $result['code']]['cost'];
						$this->session->data['shipping_method']['tax_class_id'] = $quote_data[$this->m . '_' . $result['code']]['tax_class_id'];
						$this->session->data['shipping_method']['text'] = $quote_data[$this->m . '_' . $result['code']]['text'];
					}
				}

				$map = null;

				if (!empty($this->pickups) && !isset($this->session->data['api_id'])) {
					$this->pickups['data']['type'] = 'FeatureCollection';

					if ($this->config->has('ll_shipping_mapper_methods') && in_array($this->m, $this->config->get('ll_shipping_mapper_methods'))) {
						$this->pickups['controls'] = $this->config->get('ll_shipping_mapper_map_control') ? $this->config->get('ll_shipping_mapper_map_control') : [];
					} else {
						$this->pickups['controls'] = $this->config->get($this->m . '_map_control') ? $this->config->get($this->m . '_map_control') : [];

						if ($this->config->get($this->m . '_map_status')) {
							$map .= '<script>' . $this->map_prefix . '_init(' . json_encode($this->pickups) . ', ' . json_encode($this->config->get('ll_shipping_mapper_methods')) . ');</script>';
						}
					}

					if (!$this->config->get($this->m . '_map_type') && $this->config->get($this->m . '_map_status')) {
						$map .= '<p><a class="btn btn-primary ll_open_map" style="padding: 1px;" onclick="' . $this->map_prefix . '_show_modal(\'' . ($this->config->get('ll_shipping_mapper_filter') != 0 ? $this->config->get('ll_shipping_mapper_filter') : '') . '\', \'' . $result['code'] . '\');">' . $this->config->get($this->m . '_map_button') . '</a></p>';
					}
				}

				if (count($this->config->get($this->m . '_pickup_cities')) > 1 && !isset($this->session->data['api_id'])) {
					$map .= '<div style="margin: 10px 0;">' . $this->language->get('text_storage') . ' <select onchange="' . $this->map_prefix . '_set_pickup_city(this.value, \'' . $this->m . '\');" style="max-width: 300px;">"';

					foreach ($this->config->get($this->m . '_pickup_cities') as $city) {
						$map .= '<option value="' . $city . '" ' . ($city == $this->getPickupCity() ? 'selected="selected"' : '') . '>' . $this->getPickupCityName($city) . '</option>';
					}

					$map .= '</select></div>';
				}

				$method_data = [
					'code'       => $this->m,
					'title'      => $this->setTitle($this->config->get($this->m . '_title')) . $map,
					'quote'      => $quote_data,
					'sort_order' => $this->config->get($this->m . '_sort_order'),
					'error'      => false,
				];
			}
		}

		if (empty($method_data)) {
			$method_data = $this->getCap();
		}

		return $method_data;
	}

	protected function getCap() {
		if ($this->config->get($this->m . '_cap_status')) {
			$cost = $this->config->get($this->m . '_cap_cost') > 0 ? $this->config->get($this->m . '_cap_cost') : 0;

			$quote_data[$this->m . '_empty'] = [
				'code'         => $this->m . '.' . $this->m . '_empty',
				'title'        => $this->setTitle($this->config->get($this->m . '_cap_title')),
				'cost'         => $cost,
				'tax_class_id' => $this->config->get($this->m . '_tax_class_id'),
				'text'         => $this->currency->format($this->tax->calculate($cost, $this->config->get($this->m . '_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency']),
			];

			$method_data = [
				'code'       => $this->m,
				'title'      => $this->setTitle($this->config->get($this->m . '_title')),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get($this->m . '_sort_order'),
				'error'      => $this->config->get($this->m . '_cap_error') ? $this->setTitle($this->config->get($this->m . '_cap_title')) : false,
			];

			return $method_data;
		}
	}

	protected function getPickupCity() {
		$pickup_cities = $this->config->get($this->m . '_pickup_cities');

		if ($pickup_cities && isset($this->session->data[$this->m . '_pickup_city']) && in_array($this->session->data[$this->m . '_pickup_city'], $pickup_cities)) {
			$pickup_city = $this->session->data[$this->m . '_pickup_city'];
		} else {
			$pickup_city = $pickup_cities[0];
		}

		return $pickup_city;
	}

	protected function getPickupCityName($id) {
		$query = $this->db->query("SELECT CityName FROM `" . DB_PREFIX . $this->m . "_city` WHERE CityCode = '" . (int)$id . "'");

		return isset($query->row['CityName']) ? $query->row['CityName'] : '';
	}

	// убираем кэширование, иначе для одноименных городов показывает чужой расчет
	protected function getCity() {
		$city = trim($this->address['city']);
		$zone = $this->address['zone_id'];

		if ($city != '') {
			$data = $this->getCache('city', $city);

			if (!$data) {
				if ($zone > 0) {
					$query = $this->db->query("SELECT c.CityCode, c.FullName FROM `" . DB_PREFIX . $this->m . "_city` as c LEFT JOIN `" . DB_PREFIX . $this->m . "_region_to_zone` rz ON rz.zone_id = '" . (int)$zone . "' WHERE c.CityName LIKE '" . $this->db->escape($city) . "%' AND c.region_id = rz.region_id ORDER BY c.CityCode ASC");

					if ($query->num_rows) {
						if ($query->num_rows > 1) {
							foreach ($query->rows as $row) {
								if ((int)$data == 0 || $row['CityCode'] < (int)$data) {
									$data = $row['CityCode'];
								}

								if ($row['FullName'] == $city) {
									$data = $row['CityCode'];

									break;
								}
							}
						} else {
							$data = $query->row['CityCode'];
						}

						$this->addLog(1, 'getCity', ['city' => $city, 'zone_id' => $zone], $query->rows);

						//$this->setCache('city', $city, $data);
					} elseif (!$this->config->get($this->m . '_consider')) {
						$query = $this->db->query("SELECT CityCode, FullName FROM `" . DB_PREFIX . $this->m . "_city` WHERE CityName LIKE '" . $this->db->escape($city) . "%' ORDER BY CityCode ASC");

						if ($query->num_rows) {
							$data = $query->row['CityCode'];

							$this->addLog(1, 'getCity', ['city' => $city, 'zone_id' => $zone], $query->rows);

							//$this->setCache('city', $city, $data);
						} else {
							$this->addLog(0, 'getCity', ['city' => $city, 'zone_id' => $zone]);
						}
					} else {
						$this->addLog(0, 'getCity', ['city' => $city, 'zone_id' => $zone]);
					}
				} elseif ($zone == 0 && !$this->config->get($this->m . '_consider')) {
					$query = $this->db->query("SELECT CityCode, FullName FROM `" . DB_PREFIX . $this->m . "_city` WHERE CityName LIKE '" . $this->db->escape($city) . "%' ORDER BY CityCode ASC");

					if ($query->num_rows) {
						if ($query->num_rows > 1) {
							foreach ($query->rows as $row) {
								if ((int)$data == 0 || $row['CityCode'] < (int)$data) {
									$data = $row['CityCode'];
								}

								if ($row['FullName'] == $city) {
									$data = $row['CityCode'];

									break;
								}
							}
						} else {
							$data = $query->row['CityCode'];
						}

						$this->addLog(1, 'getCity', ['city' => $city, 'zone_id' => $zone], $query->rows);

						//$this->setCache('city', $city, $data);
					} else {
						$this->addLog(0, 'getCity', ['city' => $city, 'zone_id' => $zone]);
					}
				}
			}

			return $data;
		}
	}

	public function getCities($city) {
		$query = $this->db->query("SELECT c.CityCode AS id, c.CityName AS city, c.FullName AS full, c.PostCodeList AS postcode, r.zone_id AS zone_id, t.country_id AS country_id FROM `" . DB_PREFIX . $this->m . "_city` c LEFT JOIN `" . DB_PREFIX . $this->m . "_region_to_zone` r ON (c.region_id = r.region_id) LEFT JOIN `" . DB_PREFIX . $this->m . "_country` t ON (c.country_id = t.id) WHERE CityName LIKE '" . $this->db->escape($city) . "%' ORDER BY c.CityCode ASC, c.FullName ASC LIMIT 0,7");

		$cities = $query->rows;

		if ($query->num_rows) {
			foreach ($cities as $key => $city) {
				if (isset($city['postcode']) && strpos($city['postcode'], ',')) {
					$postcodes = explode(',', $city['postcode']);

					$cities[$key]['postcode'] = $postcodes[0];
				}
			}
		}

		return $cities;
	}

	protected function getCost() {
		$city = mb_strtolower(trim($this->address['city']));

		foreach ($this->variants as $variant) {
			$status = true;

			if (!empty($this->config->get($this->m . '_stops'))) {
				foreach ($this->config->get($this->m . '_stops') as $stop) {
					if (!empty($stop['variant']) && in_array($variant, $stop['variant'])) {
						if (!empty($stop['customer_group']) && (!$this->customer->isLogged() || ($this->customer->isLogged() && !in_array($this->customer->getGroupId(), $stop['customer_group'])))) {
							$status = false;
							break;
						}

						if (!empty($stop['geo_zone'])) {
							$geo_zone_rows = 0;

							foreach ($stop['geo_zone'] as $geo_zone_id) {
								$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "' AND country_id = '" . (int)$this->address['country_id'] . "' AND (zone_id = '" . (int)$this->address['zone_id'] . "' OR zone_id = '0')");

								$geo_zone_rows += $query->num_rows;
							}

							if (!$geo_zone_rows) {
								$status = false;
								break;
							}
						}

						if ($stop['city_only'] != '' && !in_array($city, explode(',', $stop['city_only']))) {
							$status = false;
							break;
						}

						if ($stop['city_exclude'] != '' && in_array($city, explode(',', $stop['city_exclude']))) {
							$status = false;
							break;
						}

						$weight = $this->cart->getWeight();
						// конвертируем в кг из дефолтных единиц магазина
						$weight = $this->weight->convert($weight, $this->config->get('config_weight_class_id'), $this->config->get($this->m . '_weight_class_id'));

						if ($stop['weight_min'] != '' && $stop['weight_min'] != 0 && (float)$weight < (float)$stop['weight_min']) {
							$status = false;
							break;
						}

						if ($stop['weight_max'] != '' && $stop['weight_max'] != 0 && (float)$weight > (float)$stop['weight_max']) {
							$status = false;
							break;
						}

						if ($stop['total_min'] != '' && $stop['total_min'] != 0 && (float)$this->total < (float)$stop['total_min']) {
							$status = false;
							break;
						}

						if ($stop['total_max'] != '' && $stop['total_max'] != 0 && (float)$this->total > (float)$stop['total_max']) {
							$status = false;
							break;
						}
					}
				}
			}

			if (!$status || !$this->config->get($this->m . '_status_' . $variant)) {
				continue;
			}

			if (!empty($this->config->get($this->m . '_services'))) {
				$this->params['services'] = [];

				foreach ($this->config->get($this->m . '_services') as $service) {
					if ($service == 2) {
						$param = $this->currency->convert($this->total, $this->config->get('config_currency'), $this->config->get($this->m . '_currency'));
					} elseif (in_array($service, ['24','25','32'])) {
						$param = 1;
					} else {
						$param = '';
					}

					// для постаматов доступны только эти доп. услуги
					if (in_array($variant, $this->variants_postamat) && !in_array($service, ['2','7','16','24'])) {
						continue;
					}

					$this->params['services'][] = [
						'id'    => $service,
						'param' => $param,
					];
				}
			}

			$this->params['tariffId'] = $variant;
			$data = $this->getCache('calculate' . $this->getCacheName());

			if (!$data) {
				$curl = $this->curl('calculator/calculate_price_by_json.php', $this->params);

				$result = json_decode($curl['data'], true);

				if ($curl['info']['http_code'] < 200 || $curl['info']['http_code'] >= 300) {
					$this->addLog(0, 'calculate', $this->params, $result);

					// сбрасываем расчеты после первого фейла, чтобы корзина не висела ожидая расчета всех тарифов
					if (!$curl['data']) {
						return;
					}
				} else {
					if (isset($result['result']) && !empty($result['result'])) {
						$this->addLog(1, 'calculate', $this->params, $result);

						$data = $result['result'];

						$this->setCache('calculate' . $this->getCacheName(), '', $data);
					} else {
						$this->addLog(2, 'calculate', $this->params, $result);

						// чтобы при падении api корзина не вешалась, пытаясь рассчитать. будет пересчет при обновлении кэша.
						$this->setCache('calculate' . $this->getCacheName(), '', 1);
					}
				}
			}

			if ($data) {
				$this->calcs[] = $data;
			}
		}

		// готовим методы после кэша, чтобы иметь возможность выбирать нужный пвз
		if (!empty($this->calcs)) {
			return $this->prepareVariants($this->calcs);
		}
	}

	protected function prepareVariants($results) {
		$data = [];

		foreach ($results as $result) {
			if (in_array((string)$result['tariffId'], $this->variants_postamat)) {
				$this->is_postamat = true;
			}
		}

		foreach ($results as $result) {
			if (!isset($result['price']) || $result['price'] == 0) {
				continue;
			}

			if (empty($this->pickups) && in_array($result['tariffId'], $this->variants_map)) {
				$this->prepareMap();
			}

			// скипаем, если нет постаматов
			if (!$this->postamats && in_array((string)$result['tariffId'], $this->variants_postamat)) {
				continue;
			}

			$cost = $this->prepareCost($result);

			$data[] = [
				'code'        => $result['tariffId'],
				'title'       => $this->prepareTitle($result),
				'description' => $this->prepareTitle($result, 'description'),
				'cost'        => $cost['cost'],
				'cost_total'  => $cost['cost_total'],
				'sort'        => $this->config->get($this->m . '_sort_order_' . $result['tariffId']),
			];
		}

		$keys = array_column($data, 'sort');
		array_multisort($keys, SORT_ASC, $data);

		if ($this->config->get($this->m . '_cheep')) {
			$pickups = [];
			$couriers = [];
			$price_pickup = 0;
			$price_courier = 0;

			foreach ($data as $shipping) {
				if (in_array($shipping['code'], $this->variants_map)) {
					$pickups[] = $shipping;
				} else {
					$couriers[] = $shipping;
				}
			}

			if (!empty($pickups) && count($pickups) > 1) {
				foreach ($pickups as $key => $shipping) {
					if ($key == 0 || $shipping['cost'] <= $price_pickup) {
						$price_pickup = $shipping['cost'];
						$pickups = [];
						$pickups[] = $shipping;
					}
				}

				// удаляем с карты пвз или постаматы
				if (in_array($pickups[0]['code'], $this->variants_postamat)) {
					foreach ($this->pickups['data']['features'] as $key => $point) {

						if ($point['params']['code'] == 'PVZ') {
							unset($this->pickups['data']['features'][$key]);
						}
					}

					unset($this->pickups['delivery']['PVZ']);
				} else {
					foreach ($this->pickups['data']['features'] as $key => $point) {
						if ($point['params']['code'] == 'POSTAMAT') {
							unset($this->pickups['data']['features'][$key]);
						}
					}

					unset($this->pickups['delivery']['POSTAMAT']);
				}

				$this->pickups['data']['features'] = array_values($this->pickups['data']['features']);
			}

			if (!empty($couriers) && count($couriers) > 1) {
				foreach ($couriers as $key => $shipping) {
					if ($key == 0 || $shipping['cost'] <= $price_courier) {
						$price_courier = $shipping['cost'];
						$couriers = [];
						$couriers[] = $shipping;
					}
				}
			}

			$data = array_merge($pickups, $couriers);
		}

		return $data;
	}

	protected function prepareCost($result) {
		$code = $result['tariffId'];
		$sub_total_cost = $this->sub_total; //стоимость товаров + всего Итого до блока доставки
		$total_cost = $this->total; //стоимость заказа
		$shipping_cost = $this->config->get('config_currency') == 'RUB' ? $result['price'] : $this->currency->convert($result['priceByCurrency'], $this->config->get($this->m . '_currency'), $this->config->get('config_currency')); //стоимость доставки
		$shipping_cost = $this->config->get($this->m . '_round') ? round($shipping_cost, 0) : $shipping_cost; //стоимость доставки
		$price = $shipping_cost; //модифицированная стоимость доставки
		$price_total = $shipping_cost; //модифицированная стоимость доставки в итого
		$costs = $this->config->get($this->m . '_costs');

		if (isset($this->prices[$code][$shipping_cost])) {
			return $this->prices[$code][$shipping_cost];
		}

		if (!empty($costs)) {
			foreach ($costs as $cost) {
				if (empty($cost['variant']) || !in_array($code, $cost['variant'])) {
					continue;
				}

				switch ($cost['cost_type']) {
					case 0:
						$mod_price = $sub_total_cost;
						break;
					case 1:
						$mod_price = $total_cost;
						break;
					case 2:
						$mod_price = $shipping_cost;
						break;
				}

				if ($cost['cost_from'] > 0 && $mod_price < $cost['cost_from']) {
					continue;
				}

				if ($cost['cost_to'] > 0 && $mod_price > $cost['cost_to']) {
					continue;
				}

				if (!empty($cost['customer_group']) && $this->customer->isLogged() && in_array($this->customer->getGroupId(), $cost['customer_group'])) {
					continue;
				}

				if (!empty($cost['geo_zone'])) {
					$geo_zone_rows = 0;

					foreach ($cost['geo_zone'] as $geo_zone_id) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "' AND country_id = '" . (int)$this->address['country_id'] . "' AND (zone_id = '" . (int)$this->address['zone_id'] . "' OR zone_id = '0')");

						$geo_zone_rows += $query->num_rows;
					}

					if (!$geo_zone_rows) {
						continue;
					}
				}

				$city = mb_strtolower(trim($this->address['city']));

				if ($cost['city_only'] != '' && !in_array($city, explode(',', $cost['city_only']))) {
					continue;
				}

				if ($cost['city_exclude'] != '' && in_array($city, explode(',', $cost['city_exclude']))) {
					continue;
				}

				switch ($cost['source']) {
					case 0:
						$value = (float)$cost['value'];
						break;
					case 1:
						$value = (float)($total_cost * $cost['value'] / 100);
						break;
					case 2:
						$value = (float)($sub_total_cost * $cost['value'] / 100);
						break;
					case 3:
						$value = (float)($shipping_cost * $cost['value'] / 100);
						break;
				}

				switch ($cost['action']) {
					case '+':
						$price += $value;
						break;
					case '-':
						$price -= $value;
						break;
					case '=':
						$price = $value;
						break;
				}

				if (!$cost['position']) {
					$price_total = $price;
				}
			}
		}

		$this->prices[$code][$shipping_cost] = [
			'cost'       => $price < 0 ? 0 : $price,
			'cost_total' => $price_total < 0 ? 0 : $price_total,
		];

		return $this->prices[$code][$shipping_cost];
	}

	protected function prepareTitle($result, $type = 'title') {
		$input = [
			'{{logo}}',
			'{{from_city}}',
			'{{to_city}}',
			'{{days}}',
			'{{date}}',
			'{{address}}',
			'{{full_address}}',
			'{{phone}}',
			'{{shedule}}',
			'{{code}}',
		];

		$output = [
			'logo'         => '<img src="' . ($this->request->server['HTTPS'] ? HTTPS_SERVER : HTTP_SERVER) . 'image/catalog/' . $this->m . '/logo.png" / >',
			'from_city'    => $this->getPickupCityName($this->getPickupCity()),
			'to_city'      => $this->upperFirst($this->address['city']),
			'days'         => $this->prepareDays($result),
			'date'         => $this->prepareDate($result),
			'address'      => $this->active_address,
			'full_address' => $this->active_full_address,
			'phone'        => $this->active_phone,
			'shedule'      => $this->active_shedule,
			'code'         => $this->active_id,
		];

		return html_entity_decode(str_replace($input, $output, $this->config->get($this->m . '_quote_' . $type . '_' . $result['tariffId'])));
	}

	protected function prepareDays($result) {
		$add = (int)$this->config->get($this->m . '_add_day_' . $result['tariffId']);
		$days = $result['deliveryPeriodMin'] == $result['deliveryPeriodMax'] ? $result['deliveryPeriodMin'] : $result['deliveryPeriodMin'] . '-' . $result['deliveryPeriodMax'];

		if (stripos($days, '-')) {
			$numbers = explode('-', $days);

			$last = $numbers[1];
			$days = implode('-', $numbers);
		} elseif ($this->config->get($this->m . '_daymodifier')) {
			$last = $days + 1;
			$days = $days . '-' . $last;
		} else {
			$last = $days;
		}

		if ($add > 0) {
			if (isset($numbers)) {
				$numbers[0] += $add;
				$numbers[1] += $add;
				
				if ($numbers[0] == $numbers[1]) {
					$days = $numbers[0];
				} else {
					$days = implode('-', $numbers);
				}

				$last = $numbers[1];
			} elseif (is_numeric($days)) {
				$days += $add;

				$last = $days;
			}
		}

		return $days . $this->numericСases($last);
	}

	protected function prepareDate($result) {
		$add = $this->config->get($this->m . '_add_day_' . $result['tariffId']) ? $this->config->get($this->m . '_add_day_' . $result['tariffId']) : 0;
		$min = date('d M', strtotime('+' . (int)$add . ' day', strtotime($result['deliveryDateMin'])));
		$max = date('d M', strtotime('+' . (int)$add . ' day', strtotime($result['deliveryDateMax'])));

		$months_input = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
		$months_output = ['янв', 'фев', 'мар', 'апр', 'мая', 'июн', 'июл', 'авг', 'сен', 'окт', 'ноя', 'дек'];

		$min = str_replace($months_input, $months_output, $min);
		$max = str_replace($months_input, $months_output, $max);

		return $min == $max ? $min : $min . ' - ' . $max;
	}

	protected function getActiveId() {
		if (isset($this->session->data[$this->m]['pvz'])) {
			return $this->session->data[$this->m]['pvz'];
		} else {
			return 0;
		}
	}

	protected function prepareMap() {
		$active_id = $this->active_id;
		$this->points = $this->getPvzs();
		$pikup_ids = [];

		if (!empty($this->points)) {
			foreach ($this->points as $key => $pickup) {
				$is_pvz = $pickup['type'] == 'PVZ' ? true : false;

				if ($this->config->get($this->m . '_weight_limit') && (float)$pickup['weightMin'] > 0 && $pickup['weightMin'] > $this->params['goods'][0]['weight']) {
					continue;
				}

				if ($this->config->get($this->m . '_weight_limit') && (float)$pickup['weightMax'] > 0 && $pickup['weightMax'] < $this->params['goods'][0]['weight']) {
					continue;
				}

				if (!$is_pvz) {
					if ((float)$pickup['width'] > 0 && $pickup['width'] < $this->params['goods'][0]['width']) {
						continue;
					}

					if ((float)$pickup['height'] > 0 && $pickup['height'] < $this->params['goods'][0]['height']) {
						continue;
					}

					if ((float)$pickup['depth'] > 0 && $pickup['depth'] < $this->params['goods'][0]['length']) {
						continue;
					}

					$this->postamats[] = $pickup;
				} else {
					$this->pvzs[] = $pickup;
				}

				$id = $pickup['code'];
				$icon = $is_pvz ? 'home' : 'cubes';
				$title = '<i class="fa fa-' . $icon . '" aria-hidden="true"></i> ' . $pickup['name'] . ' <span class="label label-default">' . $id . '</span>';
				$color = $is_pvz ? 'darkGreen' : 'yellow';

				if ($active_id === $id) {
					$this->active_address = $pickup['address'];
					$this->active_full_address = $pickup['fullAddress'];
					$this->active_phone = $pickup['phone'];
					$this->active_shedule = $pickup['workTime'];
				}

				$hintContent = $title;
				$balloonContentHeader = $title;
				$balloonContentBody = '<a class="btn btn-primary btn-block ll_set_point" onclick="' . $this->map_prefix . '_set_pickup_id(\'' . $id . '\', \'' . $this->m . '\');">' . $this->language->get('text_choose_pickup') . '</a>';
				$balloonContentBody .= '<i class="fa fa-map-marker fa-fw" style="color: green;"></i> ' . $pickup['address'];
				$balloonContentBody .= $pickup['phone'] == '' ? '' : '<br><i class="fa fa-phone fa-fw" style="color: green;"></i> ' . $pickup['phone'];
				$balloonContentBody .= $pickup['email'] == '' ? '' : '<br><i class="fa fa-envelope-o fa-fw" style="color: green;"></i> ' . $pickup['email'];
				$balloonContentBody .= $pickup['workTime'] == '' ? '' : '<br><i class="fa fa-clock-o fa-fw" style="color: green;"></i>' . $pickup['workTime'];
				$balloonContentBody .= '<br>' . ($pickup['allowedCod'] ? '<i class="fa fa-rub fa-fw" style="color: green;"></i> ' . $this->language->get('text_cod') : '<i class="fa fa-money fa-fw" style="color: grey;"></i> ' . $this->language->get('text_cod_no'));
				$balloonContentBody .= '<br>' . ($pickup['haveCash'] ? '<i class="fa fa-money fa-fw" style="color: green;"></i> ' . $this->language->get('text_pay') : '<i class="fa fa-money fa-fw" style="color: grey;"></i> ' . $this->language->get('text_pay_no'));
				$balloonContentBody .= '<br>' . ($pickup['haveCashless'] ? '<i class="fa fa-credit-card fa-fw" style="color: green;"></i> ' . $this->language->get('text_card') : '<i class="fa fa-credit-card fa-fw" style="color: grey;"></i> ' . $this->language->get('text_card_no'));
				$balloonContentBody .= '<br>' . ($pickup['isDressingRoom'] ? '<i class="fa fa-female fa-fw" style="color: green;"></i> ' . $this->language->get('text_dressing_room') : '<i class="fa fa-credit-card fa-fw" style="color: grey;"></i> ' . $this->language->get('text_dressing_room_no'));
				$balloonContentBody .= $pickup['metroStation'] == '' ? '' : '<br><i class="fa fa-subway fa-fw" style="color: green;"></i> ' . $pickup['metroStation'];
				$balloonContentBody .= $pickup['nearestStation'] == '' ? '' : '<br><i class="fa fa-bus fa-fw" style="color: green;"></i> ' . $pickup['nearestStation'];
				$balloonContentBody .= $pickup['addressComment'] == '' ? '' : '<br><i class="fa fa-map-o fa-fw" style="color: green;"></i> ' . $pickup['addressComment'];

				$this->pickups['data']['features'][] = [
					'type'     => 'Feature',
					'id'       => $id,
					'geometry' => [
						'type'        => 'Point',
						'coordinates' => [
							$pickup['coordY'],
							$pickup['coordX'],
						]
					],
					'properties' => [
						'hintContent'          => $hintContent,
						'balloonContentHeader' => $balloonContentHeader,
						'balloonContentBody'   => $balloonContentBody,
					],
					'options' => [
						'preset' => $id === $active_id ? 'islands#' . $color . 'DotIcon' : 'islands#' . $color . 'Icon',
					],
					'params' => [
						'code' => $pickup['type'],
					]
				];

				$pikup_ids[] = $id;

				if (!isset($this->pickups['delivery'][$pickup['type']])) {
					$this->pickups['delivery'][$pickup['type']] = [
						'code'    => $pickup['type'],
						'content' => '<i class="fa fa-' . $icon . '" aria-hidden="true" id="' . $this->m . '_filter_' . $pickup['type'] . '"></i> ' . $this->language->get('text_filter_' . $pickup['type']),
						'title'   => $this->language->get('text_filter_' . $pickup['type']),
					];
				}
			}

			// устанавливаем активный пвз, если его еще нет или он из другого города
			// чтобы адрес отображался в названии варианта самовывоза
			// оставляем ===
			if ($active_id === 0 || !in_array($active_id, $pikup_ids)) {
				$this->session->data[$this->m]['pvz'] = $this->points[0]['code'];
				$this->active_address = $this->points[0]['address'];
				$this->active_full_address = $pickup['fullAddress'];
				$this->active_phone = $this->points[0]['phone'];
				$this->active_shedule = $this->points[0]['workTime'];
			}
		}
	}

	protected function getPvzs() {
		$data = $this->getCache('pvz', $this->params['receiverCityId']);

		if (!$data) {
			$sql = "SELECT * FROM `" . DB_PREFIX . $this->m . "_pvz` WHERE cityCode = '" . (int)$this->params['receiverCityId'] . "' AND isHandout = 1";

			if (!$this->is_postamat) {
				$sql .= " AND type = 'PVZ'";
			}

			$sql .= " ORDER BY address ASC";

			$query = $this->db->query($sql);

			$data = $query->rows;

			if ($data) {
				$this->addLog(1, 'pvz', ['cityCode' => $this->params['receiverCityId']], count($data));

				$this->setCache('pvz', $this->params['receiverCityId'], $data);
			} else {
				$this->addLog(0, 'pvz', ['cityCode' => $this->params['receiverCityId']], $data);
			}
		}

		return $data;
	}

	protected function setTitle($title) {
		$input = [
			'{{logo}}',
		];

		$output = [
			'logo' => '<img src="' . ($this->request->server['HTTPS'] ? HTTPS_SERVER : HTTP_SERVER) . 'image/catalog/' . $this->m . '/logo.png" / >',
		];

		return html_entity_decode(str_replace($input, $output, $title));
	}

	protected function numericСases($num, $word = [' раб. день', ' раб. дня', ' раб. дней']) {
		return $word[ ($num%100>4 && $num%100<20)? 2: [2, 0, 1, 1, 1, 2][min($num%10, 5)] ];
	}

	protected function upperFirst($str) {
		return mb_strtoupper(mb_substr($str, 0, 1)) . mb_substr($str, 1, mb_strlen($str));
	}

	protected function getCacheName() {
		$cache_name = '.';

		$data = array_merge(
			[
				$this->config->get('config_store_id'),
				$this->config->get($this->m . '_test'),
				$this->config->get($this->m . '_currency'),
				$this->config->get($this->m . '_round'),
				$this->config->get($this->m . '_daymodifier'),
				$this->config->get($this->m . '_services'),
				$this->config->get($this->m . '_timeout'),
				$this->config->get($this->m . '_consider'),
				$this->config->get($this->m . '_title'),
				$this->config->get($this->m . '_sort_order'),
				$this->config->get($this->m . '_weight_class_id'),
				$this->config->get($this->m . '_length_class_id'),
				$this->config->get($this->m . '_default_type'),
				$this->config->get($this->m . '_default_weight'),
				$this->config->get($this->m . '_default_length'),
				$this->config->get($this->m . '_default_width'),
				$this->config->get($this->m . '_default_height'),
				$this->config->get($this->m . '_box_weight'),
				$this->config->get($this->m . '_box_length'),
				$this->config->get($this->m . '_box_width'),
				$this->config->get($this->m . '_box_height'),
				$this->config->get($this->m . '_calc_type'),
				$this->config->get($this->m . '_custom_sizes'),
				$this->config->get($this->m . '_tax_class_id'),
				$this->config->get($this->m . '_stops'),
				$this->config->get($this->m . '_costs'),
				$this->config->get($this->m . '_map_status'),
				$this->config->get($this->m . '_map_type'),
				$this->config->get($this->m . '_cap_status'),
				$this->config->get($this->m . '_cap_error'),
				$this->config->get($this->m . '_cap_title'),
				$this->config->get($this->m . '_cap_cost'),
			],
			$this->params,
			[
				$this->params['goods'][0]['weight'],
				$this->params['goods'][0]['length'],
				$this->params['goods'][0]['width'],
				$this->params['goods'][0]['height'],
			]
		);

		foreach ($data as $item) {
			if (is_numeric($item)) {
				$cache_name .= $item . '.';
			} else {
				$cache_name .= (int)$item . '.';
			}
		}

		return $cache_name;
	}

	protected function getSecure() {
		return md5(date('Y-m-d') . '&' . $this->config->get($this->m . '_api_key'));
	}

	protected function curl($type = '', $params = []) {
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_HEADER, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
		curl_setopt($ch, CURLOPT_URL, ($this->config->get($this->m . '_test') ? $this->api_test_url : $this->api_url) . $type);
		curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $this->config->get($this->m . '_timeout'));

		$result['data'] = curl_exec($ch);
		$result['info'] = curl_getinfo($ch);

		curl_close($ch);

		return $result;
	}

	protected function getCache($method, $postfix = '') {
		if ($this->config->get($this->m . '_cache')) {
			return $this->cache->get($this->m . '.' . $method . '.' . base64_encode($postfix));
		}
	}

	protected function setCache($method, $postfix = '', $data) {
		if ($this->config->get($this->m . '_cache')) {
			$this->cache->set($this->m . '.' . $method . '.' . base64_encode($postfix), $data);
		}
	}

	protected function addLog($type, $method, $request, $response = []) {
		if ($this->config->get($this->m . '_email') != '' && !empty($this->config->get($this->m . '_notify'))) {
			foreach (explode(',', $this->config->get($this->m . '_email')) as $email) {
				if ($email != '' && in_array($type, $this->config->get($this->m . '_notify'))) {
					$this->notify($email, $type, $method, $request, $response);
				}
			}
		}

		if ($this->config->get($this->m . '_logging')) {
			switch ($type) {
				case 0:
					$type = 'error';
					break;
				case 1:
					$type = 'success';
					break;
				case 2:
					$type = 'info';
					break;
			}

			$this->log->write('[' . $this->m . '][' . $type . '][' . $method . '][request:' . serialize($request) . '][response:' . serialize($response) . ']');
		}
	}

	protected function notify($email, $type, $method, $request, $response) {
		$this->load->language('extension/shipping/' . $this->m);

		$subject = $this->language->get('text_subject_' . $type);

		$message = $this->language->get('text_method');
		$message .= $method;
		$message .= $this->language->get('text_request');

		foreach ($request as $key => $val) {
			if (is_array($val)) {
				foreach ($val[0] as $k => $v) {
					$message .= $k . ': ' . $v . '<br>';
				}
			} else {
				$message .= $key . ': ' . $val . '<br>';
			}
		}

		$message .= $this->language->get('text_response');

		if (isset($response)) {
			if (empty($response)) {
				$message .= $this->language->get('text_not_found');
			} elseif (is_array($response)) {
				foreach ($response as $key => $val) {
					if (is_array($val)) {
						foreach ($val as $k => $v) {
							if (is_array($v)) {
								$message .= '<b>' . $k . '</b><br>';

								foreach ($v as $kk => $vv) {
									if (is_array($vv)) {
										$message .= '<b>' . $kk . '</b><br>';

										foreach ($vv as $kkk => $vvv) {
											$message .= $kkk . ': ' . $vvv . '<br>';
										}
									} else {
										$message .= $kk . ': ' . $vv . '<br>';
									}
								}
							} else {
								$message .= $k . ': ' . $v . '<br>';
							}
						}
					} else {
						$message .= $key . ': ' . $val . '<br>';
					}
				}
			} else {
				$message .= $response;
			}
		} else {
			$message .= $this->language->get('text_response_null');
		}

		$html  = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">';
		$html .= '<html>';
		$html .= '  <head>';
		$html .= '    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">';
		$html .= '    <title>' . $subject . '</title>';
		$html .= '  </head>';
		$html .= '  <body>' . $message . '</body>';
		$html .= '</html>';

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($email);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setHtml($html);
		$mail->send();
	}
}
