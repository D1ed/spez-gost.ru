<?php
class ControllerApiOrder extends Controller {
	public function add() {
		$this->load->language('api/order');

		$json = array();

		if (!isset($this->session->data['api_id'])) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			// Customer
			if (!isset($this->session->data['customer'])) {
				$json['error'] = $this->language->get('error_customer');
			}

			// Payment Address
			if (!isset($this->session->data['payment_address'])) {
				$json['error'] = $this->language->get('error_payment_address');
			}

			// Payment Method
			if (!$json && !empty($this->request->post['payment_method'])) {
				if (empty($this->session->data['payment_methods'])) {
					$json['error'] = $this->language->get('error_no_payment');
				} elseif (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
					$json['error'] = $this->language->get('error_payment_method');
				}

				if (!$json) {
					$this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
				}
			}

			if (!isset($this->session->data['payment_method'])) {
				$json['error'] = $this->language->get('error_payment_method');
			}

			// Shipping
			if ($this->cart->hasShipping()) {
				// Shipping Address
				if (!isset($this->session->data['shipping_address'])) {
					$json['error'] = $this->language->get('error_shipping_address');
				}

				// Shipping Method
				if (!$json && !empty($this->request->post['shipping_method'])) {
					if (empty($this->session->data['shipping_methods'])) {
						$json['error'] = $this->language->get('error_no_shipping');
					} else {
						$shipping = explode('.', $this->request->post['shipping_method']);

						if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
							$json['error'] = $this->language->get('error_shipping_method');
						}
					}

					if (!$json) {
						$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
					}
				}

				// Shipping Method
				if (!isset($this->session->data['shipping_method'])) {
					$json['error'] = $this->language->get('error_shipping_method');
				}


	/* Shiptor - агрегатор доставки */

	if (isset($this->session->data['shipping_method']['code'])) {
		if ($shiptor = $this->getShiptorValidate($this->session->data['shipping_method']['code'])) {
			$json['error'] = $shiptor;
		}
	}

	/* Shiptor - агрегатор доставки */

	
			} else {
				unset($this->session->data['shipping_address']);
				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
			}

			// Cart
			if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
				$json['error'] = $this->language->get('error_stock');
			}

			// Validate minimum quantity requirements.
			$products = $this->cart->getProducts();

			foreach ($products as $product) {
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$json['error'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);

					break;
				}
			}

			if (!$json) {
				$json['success'] = $this->language->get('text_success');
				
				$order_data = array();

				// Store Details
				$order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
				$order_data['store_id'] = $this->config->get('config_store_id');
				$order_data['store_name'] = $this->config->get('config_name');
				$order_data['store_url'] = $this->config->get('config_url');

				// Customer Details
				$order_data['customer_id'] = $this->session->data['customer']['customer_id'];
				$order_data['customer_group_id'] = $this->session->data['customer']['customer_group_id'];
				$order_data['firstname'] = $this->session->data['customer']['firstname'];
				$order_data['lastname'] = $this->session->data['customer']['lastname'];
				$order_data['email'] = $this->session->data['customer']['email'];
				$order_data['telephone'] = $this->session->data['customer']['telephone'];
				$order_data['fax'] = $this->session->data['customer']['fax'];
				$order_data['custom_field'] = $this->session->data['customer']['custom_field'];

				// Payment Details
				$order_data['payment_firstname'] = $this->session->data['payment_address']['firstname'];
				$order_data['payment_lastname'] = $this->session->data['payment_address']['lastname'];
				$order_data['payment_company'] = $this->session->data['payment_address']['company'];
				$order_data['payment_address_1'] = $this->session->data['payment_address']['address_1'];
				$order_data['payment_address_2'] = $this->session->data['payment_address']['address_2'];
				$order_data['payment_city'] = $this->session->data['payment_address']['city'];
				$order_data['payment_postcode'] = $this->session->data['payment_address']['postcode'];
				$order_data['payment_zone'] = $this->session->data['payment_address']['zone'];
				$order_data['payment_zone_id'] = $this->session->data['payment_address']['zone_id'];
				$order_data['payment_country'] = $this->session->data['payment_address']['country'];
				$order_data['payment_country_id'] = $this->session->data['payment_address']['country_id'];
				$order_data['payment_address_format'] = $this->session->data['payment_address']['address_format'];
				$order_data['payment_custom_field'] = (isset($this->session->data['payment_address']['custom_field']) ? $this->session->data['payment_address']['custom_field'] : array());

				if (isset($this->session->data['payment_method']['title'])) {
					$order_data['payment_method'] = $this->session->data['payment_method']['title'];
				} else {
					$order_data['payment_method'] = '';
				}

				if (isset($this->session->data['payment_method']['code'])) {
					$order_data['payment_code'] = $this->session->data['payment_method']['code'];
				} else {
					$order_data['payment_code'] = '';
				}

				// Shipping Details
				if ($this->cart->hasShipping()) {
					$order_data['shipping_firstname'] = $this->session->data['shipping_address']['firstname'];
					$order_data['shipping_lastname'] = $this->session->data['shipping_address']['lastname'];
					$order_data['shipping_company'] = $this->session->data['shipping_address']['company'];
					$order_data['shipping_address_1'] = $this->session->data['shipping_address']['address_1'];
					$order_data['shipping_address_2'] = $this->session->data['shipping_address']['address_2'];
					$order_data['shipping_city'] = $this->session->data['shipping_address']['city'];
					$order_data['shipping_postcode'] = $this->session->data['shipping_address']['postcode'];
					$order_data['shipping_zone'] = $this->session->data['shipping_address']['zone'];
					$order_data['shipping_zone_id'] = $this->session->data['shipping_address']['zone_id'];
					$order_data['shipping_country'] = $this->session->data['shipping_address']['country'];
					$order_data['shipping_country_id'] = $this->session->data['shipping_address']['country_id'];
					$order_data['shipping_address_format'] = $this->session->data['shipping_address']['address_format'];
					$order_data['shipping_custom_field'] = (isset($this->session->data['shipping_address']['custom_field']) ? $this->session->data['shipping_address']['custom_field'] : array());

					if (isset($this->session->data['shipping_method']['title'])) {
						$order_data['shipping_method'] = $this->session->data['shipping_method']['title'];
					} else {
						$order_data['shipping_method'] = '';
					}

					if (isset($this->session->data['shipping_method']['code'])) {
						$order_data['shipping_code'] = $this->session->data['shipping_method']['code'];
					} else {
						$order_data['shipping_code'] = '';
					}
				} else {
					$order_data['shipping_firstname'] = '';
					$order_data['shipping_lastname'] = '';
					$order_data['shipping_company'] = '';
					$order_data['shipping_address_1'] = '';
					$order_data['shipping_address_2'] = '';
					$order_data['shipping_city'] = '';
					$order_data['shipping_postcode'] = '';
					$order_data['shipping_zone'] = '';
					$order_data['shipping_zone_id'] = '';
					$order_data['shipping_country'] = '';
					$order_data['shipping_country_id'] = '';
					$order_data['shipping_address_format'] = '';
					$order_data['shipping_custom_field'] = array();
					$order_data['shipping_method'] = '';
					$order_data['shipping_code'] = '';
				}

				// Products
				$order_data['products'] = array();

				foreach ($this->cart->getProducts() as $product) {
					$option_data = array();

					foreach ($product['option'] as $option) {
						$option_data[] = array(
							'product_option_id'       => $option['product_option_id'],
							'product_option_value_id' => $option['product_option_value_id'],
							'option_id'               => $option['option_id'],
							'option_value_id'         => $option['option_value_id'],
							'name'                    => $option['name'],
							'value'                   => $option['value'],
							'type'                    => $option['type']
						);
					}

					$order_data['products'][] = array(
						'product_id' => $product['product_id'],
						'name'       => $product['name'],
						'model'      => $product['model'],
						'option'     => $option_data,
						'download'   => $product['download'],
						'quantity'   => $product['quantity'],
						'subtract'   => $product['subtract'],
						'price'      => $product['price'],
						'total'      => $product['total'],
						'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
						'reward'     => $product['reward']
					);
				}

				// Gift Voucher
				$order_data['vouchers'] = array();

				if (!empty($this->session->data['vouchers'])) {
					foreach ($this->session->data['vouchers'] as $voucher) {
						$order_data['vouchers'][] = array(
							'description'      => $voucher['description'],
							'code'             => token(10),
							'to_name'          => $voucher['to_name'],
							'to_email'         => $voucher['to_email'],
							'from_name'        => $voucher['from_name'],
							'from_email'       => $voucher['from_email'],
							'voucher_theme_id' => $voucher['voucher_theme_id'],
							'message'          => $voucher['message'],
							'amount'           => $voucher['amount']
						);
					}
				}

				// Order Totals
				$this->load->model('extension/extension');

				$totals = array();
				$taxes = $this->cart->getTaxes();
				$total = 0;

				// Because __call can not keep var references so we put them into an array.
				$total_data = array(
					'totals' => &$totals,
					'taxes'  => &$taxes,
					'total'  => &$total
				);
			
				$sort_order = array();

				$results = $this->model_extension_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);
						
						// We have to put the totals in an array so that they pass by reference.
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}

				$sort_order = array();

				foreach ($total_data['totals'] as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $total_data['totals']);

				$order_data = array_merge($order_data, $total_data);

				if (isset($this->request->post['comment'])) {
					$order_data['comment'] = $this->request->post['comment'];
				} else {
					$order_data['comment'] = '';
				}

				if (isset($this->request->post['affiliate_id'])) {
					$subtotal = $this->cart->getSubTotal();

					// Affiliate
					$this->load->model('affiliate/affiliate');

					$affiliate_info = $this->model_affiliate_affiliate->getAffiliate($this->request->post['affiliate_id']);

					if ($affiliate_info) {
						$order_data['affiliate_id'] = $affiliate_info['affiliate_id'];
						$order_data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
					} else {
						$order_data['affiliate_id'] = 0;
						$order_data['commission'] = 0;
					}

					// Marketing
					$order_data['marketing_id'] = 0;
					$order_data['tracking'] = '';
				} else {
					$order_data['affiliate_id'] = 0;
					$order_data['commission'] = 0;
					$order_data['marketing_id'] = 0;
					$order_data['tracking'] = '';
				}

				$order_data['language_id'] = $this->config->get('config_language_id');
				$order_data['currency_id'] = $this->currency->getId($this->session->data['currency']);
				$order_data['currency_code'] = $this->session->data['currency'];
				$order_data['currency_value'] = $this->currency->getValue($this->session->data['currency']);
				$order_data['ip'] = $this->request->server['REMOTE_ADDR'];

				if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
					$order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
				} elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
					$order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
				} else {
					$order_data['forwarded_ip'] = '';
				}

				if (isset($this->request->server['HTTP_USER_AGENT'])) {
					$order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
				} else {
					$order_data['user_agent'] = '';
				}

				if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
					$order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
				} else {
					$order_data['accept_language'] = '';
				}

				$this->load->model('checkout/order');

				$json['order_id'] = $this->model_checkout_order->addOrder($order_data);

	
	/* Shiptor - агрегатор доставки */

	if (isset($this->session->data['shiptor']['kladr_id'], $this->session->data['shiptor']['address']['courier_id'])) {
		$this->load->model('extension/shipping/shiptor');

		$this->model_extension_shipping_shiptor->setOrder($json['order_id']);
		
		unset($this->session->data['shiptor']['address']);
	}
	
	/* Shiptor - агрегатор доставки */
	
	

				// Set the order history
				if (isset($this->request->post['order_status_id'])) {
					$order_status_id = $this->request->post['order_status_id'];
				} else {
					$order_status_id = $this->config->get('config_order_status_id');
				}

				$this->model_checkout_order->addOrderHistory($json['order_id'], $order_status_id);
				
				// clear cart since the order has already been successfully stored.
				//$this->cart->clear();
			}
		}

		if (isset($this->request->server['HTTP_ORIGIN'])) {
			$this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			$this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			$this->response->addHeader('Access-Control-Max-Age: 1000');
			$this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}



	/* Shiptor - агрегатор доставки */

	private function editShiptor($order_id) {
		$this->load->language('extension/shipping/shiptor');

		$message = array();

		if ($order_id) {
			$params = array();

			$this->load->model('extension/shipping/shiptor');

			$params['external_id'] = $order_id;

			$order = $this->model_extension_shipping_shiptor->getOrderEditShiptor($order_id);

			$params['id'] = $order['shiptor_id'];
			
			$params['delivery_time'] = $order['time'];

			$weight = trim($order['weight']);

			if ($weight && is_numeric($weight)) {
				$params['weight'] = (float)$weight;
			}

			$shipping_method = trim($order['shipping_method']);

			if ($shipping_method && is_numeric($shipping_method)) {
				$params['shipping_method'] = $shipping_method;
			} else {
				$message['error']['shipping'] = $this->language->get('error_is_shipping');
			}
			
			if(stristr($order['shipping_code'],'shiptor.russian-post-') && $order['lastname']==''){
				$message['error']['shipping'] = $this->language->get('error_is_surname');
			}

			$delivery_point = trim($order['delivery_point']);

			if ($delivery_point) {
				$params['delivery_point'] = $delivery_point;
			} else {
				if ($order['street']) {
					$params['street'] = trim($order['street']);
				} else if ($order['shipping_address_1']) {
					$this->model_extension_shipping_shiptor->editOrder($order_id, array('street' => trim($order['shipping_address_1'])));

					$params['street'] = trim($order['shipping_address_1']);
				}

				if ($order['house']) {
					$params['house'] = trim($order['house']);
				}

				if ($order['apartment']) {
					$params['apartment'] = trim($order['apartment']);
				}
				
				if ($order['shipping_postcode']) {
					$params['postal_code'] = trim($order['shipping_postcode']);
				}
			}

			if ($order['firstname']) {
				$params['name'] = $order['firstname'];
			}

			if ($order['lastname']) {
				$params['surname'] = $order['lastname']!=''?$order['lastname']:$order['firstname'];
			}
			else{
				$params['surname'] = $order['firstname'];
			}

			$email = utf8_strtolower(trim($order['email']));

			if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
				$params['email'] = $email;
			} else {
				$message['error']['email'] = $this->language->get('error_is_email');
			}

			if ($order['telephone']) {
				if (preg_match('/^(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)?$/ui', $order['telephone'])) {
					$params['phone'] = trim($order['telephone']);
				} else {
					$message['error']['telephone'] = $this->language->get('error_is_telephone');
				}
			}

			$kladr_id = trim($order['kladr_id']);

			if ($kladr_id) {
				$params['kladr_id'] = $kladr_id;
			} else {
				$message['error']['kladr_id'] = $this->language->get('error_is_kladr');
			}

			// вычисляем наложенный платеж и объявленную стоимость

			if ($order['total']) {
				$params['declared_cost'] = round($order['total'], $this->currency->getDecimalPlace($this->config->get('config_currency')));

				$params['cod'] = (false !== strpos($order['payment_code'], 'shiptor_')) ? round($order['total'], $this->currency->getDecimalPlace($this->config->get('config_currency'))) : 0;
			}

			if ($order['payment_code'] == 'shiptor_paycard') {
				$params['cashless_payment'] = 1;
			}
			
			// Пока отправляем только RU
			if ($order['country']) {
				$params['country_code'] = $order['country'];
			}
			
			if ($order['shipping_zone']) {
				$params['administrative_area'] = $order['shipping_zone'];
			}
			
			if ($order['shipping_city']) {
				$params['settlement'] = $order['shipping_city'];
			}

			// проверка наличия услуги с артикулом магазина (если нет - создаем)
			// артикул = url сайта
			
			define('HTTPS_CATALOG', 'http://opencart.shiptor.ru/2.1/');

			$shop_article = mb_substr(HTTPS_CATALOG, 0, 64);

			if (!$this->shiptor->checkServiceByArticle($shop_article)) {
				$data = array('name' => $this->language->get('text_shipping'), 'shopArticle' => $shop_article, 'price' => 0);
				$this->shiptor->addService($data);
			}

			if ($products = $this->model_extension_shipping_shiptor->productsOrder($order_id)) {
				$this->load->model('catalog/product');

				// передаем номенклатуру

				foreach ($products as $product) {
					$product_info = $this->model_catalog_product->getProduct($product['product_id']);

					// TODO: проверить, откуда данные - из product или product_info
					$shopArticle = '';
					$name = $product['name'];
					if(($this->config->get('shiptor_id_product')) && (!empty($product_info['sku']))){
						$shopArticle = $product_info['sku'];
						$product_options = $this->model_extension_shipping_shiptor->productOptionsOrder($order_id, $product['order_product_id']);
						if(!empty($product_options)){
							foreach($product_options as $option){
								$shopArticle .= '-' . $option['value'];
								$name .= '-' . $option['value'];
							}
						}
					}elseif(($this->config->get('shiptor_id_product') == 0) && (!empty($product['model']))){
						$shopArticle = $product['model'];
						$product_options = $this->model_extension_shipping_shiptor->productOptionsOrder($order_id, $product['order_product_id']);
						if(!empty($product_options)){
							foreach($product_options as $option){
								$shopArticle .= '-' . $option['value'];
								$name .= '-' . $option['value'];
							}
						}
					}elseif(!empty($product['sku'])){
						$shopArticle = $product_info['sku'];
						$product_options = $this->model_extension_shipping_shiptor->productOptionsOrder($order_id, $product['order_product_id']);
						if(!empty($product_options)){
							foreach($product_options as $option){
								$shopArticle .= '-' . $option['value'];
								$name .= '-' . $option['value'];
							}
						}
					}else{
						$shopArticle = $product['model'];
						$product_options = $this->model_extension_shipping_shiptor->productOptionsOrder($order_id, $product['order_product_id']);
						if(!empty($product_options)){
							foreach($product_options as $option){
								$shopArticle .= '-' . $option['value'];
								$name .= '-' . $option['value'];
							}
						}
					}

					$product_shiptor_params = array(
						'name'          => $name,
						'article'       => empty($product['sku']) ? '' : $product['sku'],
						'shopArticle'   => $shopArticle,
						'length'		=> empty($product['length']) ? '' : $this->length->convert($product['length'], 1, 1),
						'width'         => empty($product['width']) ? '' : $this->length->convert($product['width'],  1, 1),
						'height'        => empty($product['height']) ? '' : $this->length->convert($product['height'], 1, 1),
						'weight'        => empty($product['weight']) ? '' : $this->length->convert($product['weight'], 1, 1),
						'price'         => round($product['price'], $this->currency->getDecimalPlace($this->config->get('config_currency'))),
					);

					$this->shiptor->addProduct($product_shiptor_params);
				}

				if($this->config->get('shiptor_size')){
					$params['width'] = $this->config->get('shiptor_default_width');
					$params['length'] = $this->config->get('shiptor_default_length');
					$params['height'] = $this->config->get('shiptor_default_height');
				}elseif (1 == sizeof($products)) {
					$product = reset($products);
					
					if (1 == $product['quantity']) {
						$product_info = $this->model_catalog_product->getProduct($product['product_id']);
						$params = array_merge($params,$this->model_extension_shipping_shiptor->length($product_info));
						
						if($params['width'] > 0){
							$params['width'] = $params['width'];
						}else{
							$params['width'] = $this->config->get('shiptor_default_width');
						}
						
						if($params['length'] > 0){
							$params['length'] = $params['length'];
						}else{
							$params['length'] = $this->config->get('shiptor_default_length');
						}
						
						if($params['height'] > 0){
							$params['height'] = $params['height'];
						}else{
							$params['height'] = $this->config->get('shiptor_default_height');
						}
					}else{
						$product_info = $this->model_catalog_product->getProduct($product['product_id']);
						$params = array_merge($params,$this->model_extension_shipping_shiptor->length($product_info));
						if($params['width'] > 0){
							$width = $params['width'];
						}else{
							$width = $this->config->get('shiptor_default_width');
						}
						
						if($params['length'] > 0){
							$length = $params['length'];
						}else{
							$length = $this->config->get('shiptor_default_length');
						}
						
						if($params['height'] > 0){
							$height = $params['height'];
						}else{
							$height = $this->config->get('shiptor_default_height');
						}
						
						$array_max_volume_product[] = $height;
						$array_max_volume_product[] = $length;
						$array_max_volume_product[] = $width;
						
						$max_volume_product = max($array_max_volume_product);
						$sumV = $height*$length*$width*$product['quantity'];
						$sumVQ = pow($sumV, 1/3);
						$sumVQ = ceil($sumVQ);
						
						if($sumVQ > $max_volume_product){
							$params['height'] = $sumVQ;
							$params['length'] = $sumVQ;
							$params['width'] = $sumVQ;
						}else{
							$params['length'] = $max_volume_product;
							$params['width'] = sqrt($sumV/$max_volume_product);
							$params['height'] = sqrt($sumV/$max_volume_product);
						}
					}
				}else{
					$sumV = 0;
					
					foreach($products as $product){
						$product_info = $this->model_catalog_product->getProduct($product['product_id']);
						$params = array_merge($params,$this->model_extension_shipping_shiptor->length($product_info));
						
						if($params['width'] > 0){
							$width = $params['width'];
						}else{
							$width = $this->config->get('shiptor_default_width');
						}
						
						if($params['length'] > 0){
							$length = $params['length'];
						}else{
							$length = $this->config->get('shiptor_default_length');
						}
						
						if($params['height'] > 0){
							$height = $params['height'];
						}else{
							$height = $this->config->get('shiptor_default_height');
						}
						
						$array_max_volume_product[] = $height;
						$array_max_volume_product[] = $length;
						$array_max_volume_product[] = $width;
						
						$sumV += $height*$length*$width*$product['quantity'];
					}
					
					
					$max_volume_product = max($array_max_volume_product);
					
					$height = 0;
					$length = 0;
					$width = 0;
					
					$sumVQ = pow($sumV, 1/3);
					$sumVQ = ceil($sumVQ);
					
					if($sumVQ > $max_volume_product){
						$params['height'] = $sumVQ;
						$params['length'] = $sumVQ;
						$params['width'] = $sumVQ;
					}else{
						$params['length'] = $max_volume_product;
						$params['width'] = sqrt($sumV/$max_volume_product);
						$params['height'] = sqrt($sumV/$max_volume_product);
					}
				}
				
				$params['length'] = ceil($params['length']);
				$params['width'] = ceil($params['width']);
				$params['height'] = ceil($params['height']);

				# Cписок продуктов
				$params['products'] = array();
				
				// Coupon
				$order_total = $this->model_extension_shipping_shiptor->totalOrder($order_id);
				if(!empty($order_total)){
					preg_match('#\((.*?)\)#', $order_total['title'], $title);
					$coupon_info = $this->model_extension_shipping_shiptor->getCoupon($title[1]);
					$discount = (int)$coupon_info['discount'];
				}else{
					$coupon_info = array();
				}

				foreach ($products as $product) {
					$product_info = $this->model_catalog_product->getProduct($product['product_id']);
					$shopArticle = '';
					$price = $product['price'];
					if(!empty($coupon_info) && $discount > 0){
						if($coupon_info['type'] == 'P'){
							$price = $price*$discount/100;
						}elseif($coupon_info['type'] == 'F'){
							if($product['quantity'] > 1){
								if(($price*$product['quantity']) > $discount){
									$price = (($price*$product['quantity']) - $discount)/$product['quantity'];
									$discount = 0;
								}else{
									$discount = $discount - ($price*$product['quantity']);
									$price = 0;
								}
							}else{
								if($price > $discount){
									$price = $price - $discount;
									$discount = 0;
								}else{
									$discount = $discount - $price;
									$price = 0;
								}
							}
						}
					}
					
					if(($this->config->get('shiptor_id_product')) && (!empty($product_info['sku']))){
						$shopArticle = $product_info['sku'];
						$product_options = $this->model_extension_shipping_shiptor->productOptionsOrder($order_id, $product['order_product_id']);
						if(!empty($product_options)){
							foreach($product_options as $option){
								$shopArticle .= '-' . $option['value'];
							}
						}
					}elseif(($this->config->get('shiptor_id_product') == 0) && (!empty($product['model']))){
						$shopArticle = $product['model'];
						$product_options = $this->model_extension_shipping_shiptor->productOptionsOrder($order_id, $product['order_product_id']);
						if(!empty($product_options)){
							foreach($product_options as $option){
								$shopArticle .= '-' . $option['value'];
							}
						}
					}elseif(!empty($product['sku'])){
						$shopArticle = $product_info['sku'];
						$product_options = $this->model_extension_shipping_shiptor->productOptionsOrder($order_id, $product['order_product_id']);
						if(!empty($product_options)){
							foreach($product_options as $option){
								$shopArticle .= '-' . $option['value'];
							}
						}
					}else{
						$shopArticle = $product['model'];
						$product_options = $this->model_extension_shipping_shiptor->productOptionsOrder($order_id, $product['order_product_id']);
						if(!empty($product_options)){
							foreach($product_options as $option){
								$shopArticle .= '-' . $option['value'];
							}
						}
					}
					
					if (empty($product['quantity'])) {
						$message['error']['product'] = $this->language->get('error_is_quantity');
						continue;
					}

					if (empty($product['price'])) {
						$message['error']['product'] = $this->language->get('error_is_price');
						continue;
					}

					$params['products'][] = array(
						'shopArticle' => $shopArticle,
						'count'       => (int)$product['quantity'],
						'price'       => round($price, $this->currency->getDecimalPlace($this->config->get('config_currency')))
					);
				}
			}
			
			if (! $message) {
				$shiptor = $this->shiptor->editPackage($params);

				if (! empty($shiptor['id'])) {
					$this->model_extension_shipping_shiptor->editOrder($order_id, array('shiptor_id' => $shiptor['id']));

					$message['success'] = $this->language->get('success_shiptor');
				} else {
					$message['error']['shiptor'] = $this->language->get('error_is_shiptor');
				}
			}
		} else {
			$message['error']['order'] = $this->language->get('error_is_order');
		}
	}

	/* Shiptor - агрегатор доставки */

	
	public function edit() {
		$this->load->language('api/order');

		$json = array();

		if (!isset($this->session->data['api_id'])) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			$this->load->model('checkout/order');

			if (isset($this->request->get['order_id'])) {
				$order_id = $this->request->get['order_id'];
			} else {
				$order_id = 0;
			}

			$order_info = $this->model_checkout_order->getOrder($order_id);

			if ($order_info) {
				// Customer
				if (!isset($this->session->data['customer'])) {
					$json['error'] = $this->language->get('error_customer');
				}

				// Payment Address
				if (!isset($this->session->data['payment_address'])) {
					$json['error'] = $this->language->get('error_payment_address');
				}

				// Payment Method
				if (!$json && !empty($this->request->post['payment_method'])) {
					if (empty($this->session->data['payment_methods'])) {
						$json['error'] = $this->language->get('error_no_payment');
					} elseif (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
						$json['error'] = $this->language->get('error_payment_method');
					}

					if (!$json) {
						$this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
					}
				}

				if (!isset($this->session->data['payment_method'])) {
					$json['error'] = $this->language->get('error_payment_method');
				}

				// Shipping
				if ($this->cart->hasShipping()) {
					// Shipping Address
					if (!isset($this->session->data['shipping_address'])) {
						$json['error'] = $this->language->get('error_shipping_address');
					}

					// Shipping Method
					if (!$json && !empty($this->request->post['shipping_method'])) {
						if (empty($this->session->data['shipping_methods'])) {
							$json['error'] = $this->language->get('error_no_shipping');
						} else {
							$shipping = explode('.', $this->request->post['shipping_method']);

							if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
								$json['error'] = $this->language->get('error_shipping_method');
							}
						}

						if (!$json) {
							$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
						}
					}

					if (!isset($this->session->data['shipping_method'])) {
						$json['error'] = $this->language->get('error_shipping_method');
					}


	/* Shiptor - агрегатор доставки */

	if (isset($this->session->data['shipping_method']['code'])) {
		if ($shiptor = $this->getShiptorValidate($this->session->data['shipping_method']['code'])) {
			$json['error'] = $shiptor;
		}
	}

	/* Shiptor - агрегатор доставки */

	
				} else {
					unset($this->session->data['shipping_address']);
					unset($this->session->data['shipping_method']);
					unset($this->session->data['shipping_methods']);
				}

				// Cart
				if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
					$json['error'] = $this->language->get('error_stock');
				}

				// Validate minimum quantity requirements.
				$products = $this->cart->getProducts();

				foreach ($products as $product) {
					$product_total = 0;

					foreach ($products as $product_2) {
						if ($product_2['product_id'] == $product['product_id']) {
							$product_total += $product_2['quantity'];
						}
					}

					if ($product['minimum'] > $product_total) {
						$json['error'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);

						break;
					}
				}

				if (!$json) {
					$json['success'] = $this->language->get('text_success');
					
					$order_data = array();

					// Store Details
					$order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
					$order_data['store_id'] = $this->config->get('config_store_id');
					$order_data['store_name'] = $this->config->get('config_name');
					$order_data['store_url'] = $this->config->get('config_url');

					// Customer Details
					$order_data['customer_id'] = $this->session->data['customer']['customer_id'];
					$order_data['customer_group_id'] = $this->session->data['customer']['customer_group_id'];
					$order_data['firstname'] = $this->session->data['customer']['firstname'];
					$order_data['lastname'] = $this->session->data['customer']['lastname'];
					$order_data['email'] = $this->session->data['customer']['email'];
					$order_data['telephone'] = $this->session->data['customer']['telephone'];
					$order_data['fax'] = $this->session->data['customer']['fax'];
					$order_data['custom_field'] = $this->session->data['customer']['custom_field'];

					// Payment Details
					$order_data['payment_firstname'] = $this->session->data['payment_address']['firstname'];
					$order_data['payment_lastname'] = $this->session->data['payment_address']['lastname'];
					$order_data['payment_company'] = $this->session->data['payment_address']['company'];
					$order_data['payment_address_1'] = $this->session->data['payment_address']['address_1'];
					$order_data['payment_address_2'] = $this->session->data['payment_address']['address_2'];
					$order_data['payment_city'] = $this->session->data['payment_address']['city'];
					$order_data['payment_postcode'] = $this->session->data['payment_address']['postcode'];
					$order_data['payment_zone'] = $this->session->data['payment_address']['zone'];
					$order_data['payment_zone_id'] = $this->session->data['payment_address']['zone_id'];
					$order_data['payment_country'] = $this->session->data['payment_address']['country'];
					$order_data['payment_country_id'] = $this->session->data['payment_address']['country_id'];
					$order_data['payment_address_format'] = $this->session->data['payment_address']['address_format'];
					$order_data['payment_custom_field'] = $this->session->data['payment_address']['custom_field'];

					if (isset($this->session->data['payment_method']['title'])) {
						$order_data['payment_method'] = $this->session->data['payment_method']['title'];
					} else {
						$order_data['payment_method'] = '';
					}

					if (isset($this->session->data['payment_method']['code'])) {
						$order_data['payment_code'] = $this->session->data['payment_method']['code'];
					} else {
						$order_data['payment_code'] = '';
					}

					// Shipping Details
					if ($this->cart->hasShipping()) {
						$order_data['shipping_firstname'] = $this->session->data['shipping_address']['firstname'];
						$order_data['shipping_lastname'] = $this->session->data['shipping_address']['lastname'];
						$order_data['shipping_company'] = $this->session->data['shipping_address']['company'];
						$order_data['shipping_address_1'] = $this->session->data['shipping_address']['address_1'];
						$order_data['shipping_address_2'] = $this->session->data['shipping_address']['address_2'];
						$order_data['shipping_city'] = $this->session->data['shipping_address']['city'];
						$order_data['shipping_postcode'] = $this->session->data['shipping_address']['postcode'];
						$order_data['shipping_zone'] = $this->session->data['shipping_address']['zone'];
						$order_data['shipping_zone_id'] = $this->session->data['shipping_address']['zone_id'];
						$order_data['shipping_country'] = $this->session->data['shipping_address']['country'];
						$order_data['shipping_country_id'] = $this->session->data['shipping_address']['country_id'];
						$order_data['shipping_address_format'] = $this->session->data['shipping_address']['address_format'];
						$order_data['shipping_custom_field'] = $this->session->data['shipping_address']['custom_field'];

						if (isset($this->session->data['shipping_method']['title'])) {
							$order_data['shipping_method'] = $this->session->data['shipping_method']['title'];
						} else {
							$order_data['shipping_method'] = '';
						}

						if (isset($this->session->data['shipping_method']['code'])) {
							$order_data['shipping_code'] = $this->session->data['shipping_method']['code'];
						} else {
							$order_data['shipping_code'] = '';
						}
					} else {
						$order_data['shipping_firstname'] = '';
						$order_data['shipping_lastname'] = '';
						$order_data['shipping_company'] = '';
						$order_data['shipping_address_1'] = '';
						$order_data['shipping_address_2'] = '';
						$order_data['shipping_city'] = '';
						$order_data['shipping_postcode'] = '';
						$order_data['shipping_zone'] = '';
						$order_data['shipping_zone_id'] = '';
						$order_data['shipping_country'] = '';
						$order_data['shipping_country_id'] = '';
						$order_data['shipping_address_format'] = '';
						$order_data['shipping_custom_field'] = array();
						$order_data['shipping_method'] = '';
						$order_data['shipping_code'] = '';
					}

					// Products
					$order_data['products'] = array();

					foreach ($this->cart->getProducts() as $product) {
						$option_data = array();

						foreach ($product['option'] as $option) {
							$option_data[] = array(
								'product_option_id'       => $option['product_option_id'],
								'product_option_value_id' => $option['product_option_value_id'],
								'option_id'               => $option['option_id'],
								'option_value_id'         => $option['option_value_id'],
								'name'                    => $option['name'],
								'value'                   => $option['value'],
								'type'                    => $option['type']
							);
						}

						$order_data['products'][] = array(
							'product_id' => $product['product_id'],
							'name'       => $product['name'],
							'model'      => $product['model'],
							'option'     => $option_data,
							'download'   => $product['download'],
							'quantity'   => $product['quantity'],
							'subtract'   => $product['subtract'],
							'price'      => $product['price'],
							'total'      => $product['total'],
							'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
							'reward'     => $product['reward']
						);
					}

					// Gift Voucher
					$order_data['vouchers'] = array();

					if (!empty($this->session->data['vouchers'])) {
						foreach ($this->session->data['vouchers'] as $voucher) {
							$order_data['vouchers'][] = array(
								'description'      => $voucher['description'],
								'code'             => token(10),
								'to_name'          => $voucher['to_name'],
								'to_email'         => $voucher['to_email'],
								'from_name'        => $voucher['from_name'],
								'from_email'       => $voucher['from_email'],
								'voucher_theme_id' => $voucher['voucher_theme_id'],
								'message'          => $voucher['message'],
								'amount'           => $voucher['amount']
							);
						}
					}

					// Order Totals
					$this->load->model('extension/extension');

					$totals = array();
					$taxes = $this->cart->getTaxes();
					$total = 0;
					
					// Because __call can not keep var references so we put them into an array. 
					$total_data = array(
						'totals' => &$totals,
						'taxes'  => &$taxes,
						'total'  => &$total
					);
			
					$sort_order = array();

					$results = $this->model_extension_extension->getExtensions('total');

					foreach ($results as $key => $value) {
						$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
					}

					array_multisort($sort_order, SORT_ASC, $results);

					foreach ($results as $result) {
						if ($this->config->get($result['code'] . '_status')) {
							$this->load->model('extension/total/' . $result['code']);
							
							// We have to put the totals in an array so that they pass by reference.
							$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
						}
					}

					$sort_order = array();

					foreach ($total_data['totals'] as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
					}

					array_multisort($sort_order, SORT_ASC, $total_data['totals']);

					$order_data = array_merge($order_data, $total_data);

					if (isset($this->request->post['comment'])) {
						$order_data['comment'] = $this->request->post['comment'];
					} else {
						$order_data['comment'] = '';
					}

					if (isset($this->request->post['affiliate_id'])) {
						$subtotal = $this->cart->getSubTotal();

						// Affiliate
						$this->load->model('affiliate/affiliate');

						$affiliate_info = $this->model_affiliate_affiliate->getAffiliate($this->request->post['affiliate_id']);

						if ($affiliate_info) {
							$order_data['affiliate_id'] = $affiliate_info['affiliate_id'];
							$order_data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
						} else {
							$order_data['affiliate_id'] = 0;
							$order_data['commission'] = 0;
						}
					} else {
						$order_data['affiliate_id'] = 0;
						$order_data['commission'] = 0;
					}

					$this->model_checkout_order->editOrder($order_id, $order_data);


	/* Shiptor - агрегатор доставки */

	if (isset($this->session->data['shiptor']['kladr_id'], $this->session->data['shiptor']['address']['courier_id'])) {
		$this->load->model('extension/shipping/shiptor');

		$this->model_extension_shipping_shiptor->setOrder($order_id);
		
		unset($this->session->data['shiptor']['address']);
	}

	/* Shiptor - агрегатор доставки */

	

					// Set the order history
					if (isset($this->request->post['order_status_id'])) {
						$order_status_id = $this->request->post['order_status_id'];
					} else {
						$order_status_id = $this->config->get('config_order_status_id');
					}

					$this->model_checkout_order->addOrderHistory($order_id, $order_status_id);

	
	/* Shiptor - агрегатор доставки */
					
	if(isset($this->request->get['order_id']) && isset($this->request->get['type'])){
		if($this->request->get['type'] == 'save'){
			$this->editShiptor($this->request->get['order_id']);
		}
	} 
					
	/* Shiptor - агрегатор доставки */
	
	
				}
			} else {
				$json['error'] = $this->language->get('error_not_found');
			}
		}

		if (isset($this->request->server['HTTP_ORIGIN'])) {
			$this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			$this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			$this->response->addHeader('Access-Control-Max-Age: 1000');
			$this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}



	/* Shiptor - агрегатор доставки */

	private function getShiptorValidate($shipping_method) {
		$this->language->load('extension/shipping/shiptor');

		$this->load->model('extension/shipping/shiptor');

		if ($shipping = $this->model_extension_shipping_shiptor->getValidate($this->request->post['shipping_method'])) {			
			if ($shipping['shipping'] == 'P') {
				if (! isset($this->session->data['shiptor']['address']['courier_id']) || ! isset($this->session->data['shiptor']['address']['point_id']) || ($shipping['courier_id'] != $this->session->data['shiptor']['address']['courier_id'])) {
					return $this->language->get('error_shipping_point');
				}
			}

			if ($shipping['shipping'] == 'A') {
				unset($this->session->data['shiptor']['address']);
				$this->session->data['shiptor']['address']['courier_id'] = $shipping['courier_id'];
			}
		} else {
			unset($this->session->data['shiptor']['address']);
		}
	}

	/* Shiptor - агрегатор доставки */

	
	public function delete() {
		$this->load->language('api/order');

		$json = array();

		if (!isset($this->session->data['api_id'])) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			$this->load->model('checkout/order');

			if (isset($this->request->get['order_id'])) {
				$order_id = $this->request->get['order_id'];
			} else {
				$order_id = 0;
			}

			$order_info = $this->model_checkout_order->getOrder($order_id);

			if ($order_info) {
				$this->model_checkout_order->deleteOrder($order_id);

				$json['success'] = $this->language->get('text_success');
			} else {
				$json['error'] = $this->language->get('error_not_found');
			}
		}

		if (isset($this->request->server['HTTP_ORIGIN'])) {
			$this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			$this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			$this->response->addHeader('Access-Control-Max-Age: 1000');
			$this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function info() {
		$this->load->language('api/order');

		$json = array();

		if (!isset($this->session->data['api_id'])) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			$this->load->model('checkout/order');

			if (isset($this->request->get['order_id'])) {
				$order_id = $this->request->get['order_id'];
			} else {
				$order_id = 0;
			}

			$order_info = $this->model_checkout_order->getOrder($order_id);

			if ($order_info) {
				$json['order'] = $order_info;

				$json['success'] = $this->language->get('text_success');
			} else {
				$json['error'] = $this->language->get('error_not_found');
			}
		}

		if (isset($this->request->server['HTTP_ORIGIN'])) {
			$this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			$this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			$this->response->addHeader('Access-Control-Max-Age: 1000');
			$this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function history() {
		$this->load->language('api/order');

		$json = array();

		if (!isset($this->session->data['api_id'])) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			// Add keys for missing post vars
			$keys = array(
				'order_status_id',
				'notify',
				'override',
				'comment'
			);

			foreach ($keys as $key) {
				if (!isset($this->request->post[$key])) {
					$this->request->post[$key] = '';
				}
			}

			$this->load->model('checkout/order');

			if (isset($this->request->get['order_id'])) {
				$order_id = $this->request->get['order_id'];
			} else {
				$order_id = 0;
			}

			$order_info = $this->model_checkout_order->getOrder($order_id);

			if ($order_info) {
				$this->load->language('extension/payment/ocstore_payeer');
				if (($this->config->get('ocstore_payeer_order_later_status_id') == $this->request->post['order_status_id']) && ($order_info['payment_code'] == 'ocstore_payeer')) {
						$onpay_url = sprintf('%sindex.php/?route=extension/payment/ocstore_payeer/laterpay&order_id=%s&order_tt=%s',
												defined('HTTPS_SERVER') ? HTTPS_SERVER : HTTP_SERVER,
												$order_info['order_id'],
												$order_info['total']
						);
						$this->request->post['comment'] .= "\n" . sprintf($this->language->get('text_payeer_onpay'), $onpay_url);
				}

				$this->load->language('extension/payment/ocstore_yk');
				if (($this->config->get('ocstore_yk_order_later_status_id') == $this->request->post['order_status_id']) && (strpos($order_info['payment_code'], 'ocstore_yk') !== false)) {
					$onpay_url = sprintf('%sindex.php/?route=extension/payment/ocstore_yk/laterpay&order_id=%s&order_ttl=%s&paymentType=%s',
																isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? $this->config->get('config_ssl') : $this->config->get('config_url'),
																$order_info['order_id'],
																$order_info['total'],
																$order_info['payment_code']
															 );
					$this->request->post['comment'] .= "\n" . sprintf($this->language->get('text_yk_onpay'), $onpay_url);
				}

				$this->load->language('api/order');

				$this->model_checkout_order->addOrderHistory($order_id, $this->request->post['order_status_id'], $this->request->post['comment'], $this->request->post['notify'], $this->request->post['override']);

				$json['success'] = $this->language->get('text_success');
			} else {
				$json['error'] = $this->language->get('error_not_found');
			}
		}

		if (isset($this->request->server['HTTP_ORIGIN'])) {
			$this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			$this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			$this->response->addHeader('Access-Control-Max-Age: 1000');
			$this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}