<?php
class ControllerCommonAridiusCart extends Controller {
	public function index() {
		$this->load->language('common/aridius_cart');

		// Totals
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
			
		// Display prices
		if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
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

			foreach ($totals as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $totals);
		}
		
        $data['aurus_cart_description'] = html_entity_decode ($this->config->get('aurus_cart_description')[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');	
		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_cart'] = $this->language->get('text_cart');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_recurring'] = $this->language->get('text_recurring');
		$data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
		$data['text_loading'] = $this->language->get('text_loading');
        $data['heading_title'] = $this->language->get('heading_title');
		$data['button_remove'] = $this->language->get('button_remove');
        $data['text_continue'] = $this->language->get('text_continue');

		$this->load->model('tool/image');
		$this->load->model('tool/upload');
		
		
		$data['aurus_cart_relpr'] = $this->config->get('aurus_cart_relpr');
		$data['aurus_cart_viewed'] = $this->config->get('aurus_cart_viewed');
		
		

		$data['products'] = array();

		foreach ($this->cart->getProducts() as $product) {
			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
			} else {
				$image = '';
			}

			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['value'];
				} else {
					$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

					if ($upload_info) {
						$value = $upload_info['name'];
					} else {
						$value = '';
					}
				}

				$option_data[] = array(
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
					'type'  => $option['type']
				);
			}

			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
				
				$price = $this->currency->format($unit_price, $this->session->data['currency']);
				$total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
			} else {
				$price = false;
				$total = false;
			}

			$data['products'][] = array(
				'cart_id'   => $product['cart_id'],
				'id'       		=> $product['product_id'],
				'minimum'    	=> $product['minimum'],
				'thumb'     => $image,
				'name'      => $product['name'],
				'model'     => $product['model'],
				'option'    => $option_data,
				'recurring' => ($product['recurring'] ? $product['recurring']['name'] : ''),
				'quantity'  => $product['quantity'],
				'price'     => $price,
				'total'     => $total,
				'stock'   	 	=> $this->config->get('config_stock_checkout'),
				'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
			);
		}
		// related start

		$show_relpr = $this->config->get('aurus_cart_relpr');

		$data['aurus_cart_continue'] = $this->config->get('aurus_cart_continue');
		$data['aurus_cart_open'] = $this->config->get('aurus_cart_open');
		if (!$show_relpr) {
	
	
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->load->model('catalog/aridiuscart');

		$data['text_tax'] = $this->language->get('text_tax');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['text_rel'] = $this->language->get('text_rel');
		$data['text_viewed'] = $this->language->get('text_viewed');
        $data['aurus_limit_symbolst'] = $this->config->get('aurus_limit_symbolst');
	
		$data['products_cart'] = array();
		
		$currency = $this->session->data['currency'];
	
		if($this->cart->getProducts()) {
			$results = array();
			$in_cart = array();

			foreach($this->cart->getProducts() as $result) {			
				
					$results_cart = $this->model_catalog_aridiuscart->getRelatedCart($result['product_id']);
					foreach($results_cart as $result_cart) {
						$results[] = $result_cart;
					}
				$in_cart[] = $result['product_id'];
			}
			
			$products = array_unique(array_diff($results, $in_cart));
			
			foreach ($products as $product_id) {
				$result = $this->model_catalog_product->getProduct($product_id);
			
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], 100, 100);
				} else {
					$image = false;
				}
				
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}
						
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
							
				$data['products_cart'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $result['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'quantity'   => $result['quantity'],
                    'tax'         => $tax,	
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}
		}
}
// related end	
// viewed start	
$show_viewed = $this->config->get('aurus_cart_viewed');

if (!$show_viewed) {
	
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->load->model('catalog/aridiuscart');
	
		$data['text_tax'] = $this->language->get('text_tax');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['text_rel'] = $this->language->get('text_rel');
		$data['text_viewed'] = $this->language->get('text_viewed');
        $data['aurus_limit_symbolst'] = $this->config->get('aurus_limit_symbolst');
	
       $aridius_aridius_viewedpr = array();

        if (isset($this->request->cookie['aridius_aridius_viewed'])) {
            $aridius_aridius_viewedpr = explode(',', $this->request->cookie['aridius_aridius_viewed']);
        } else if (isset($this->session->data['aridius_aridius_viewed'])) {
            $aridius_aridius_viewedpr = $this->session->data['aridius_aridius_viewed'];
        }

        if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/product') {
            $product_id = $this->request->get['product_id'];
            $aridius_aridius_viewedpr = array_diff($aridius_aridius_viewedpr, array($product_id));
            array_unshift($aridius_aridius_viewedpr, $product_id);
            setcookie('aridius_aridius_viewed', implode(',',$aridius_aridius_viewedpr), time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
        }
		
		$data['products_viewed'] = array();
		
		$products_viewed = array_slice($aridius_aridius_viewedpr, 0, (int)$this->config->get('aurus_cart_relprlimit'));

		foreach ($products_viewed as $product_id) {
			
			    $product_vieweed = isset($this->request->get['product_id']) ? $this->request->get['product_id'] : 0; 
			
				if ($product_id != $product_vieweed ) {
					$product_info = $this->model_catalog_product->getProduct($product_id);
				} else {
					$product_info = false;
				} 

				if ($product_info) {

				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], 100, 100);
				} else {
					$image = false;
				}

					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}

				$data['products_viewed'][] = array(
					'dateadded'  => $product_info['date_added'],
					'viewed'     => $product_info['viewed'],
					'rating'     => $product_info['rating'],
					'quantity'   => $product_info['quantity'],	
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
					'name'        => $product_info['name'],
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			}
		}
}

// viewed end	

		// Gift Voucher
		$data['vouchers'] = array();

		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $key => $voucher) {
				$data['vouchers'][] = array(
					'key'         => $key,
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency'])
				);
			}
		}

		$data['totals'] = array();

		foreach ($totals as $total) {
			$data['totals'][] = array(
				'title' => $total['title'],
				'text'  => $this->currency->format($total['value'], $this->session->data['currency']),
			);
		}
		$data['cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);

		return $this->load->view('common/aridius_cart', $data);

	}

	public function info() {
		$this->response->setOutput($this->index());
	}
	
}
