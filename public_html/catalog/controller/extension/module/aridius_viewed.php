<?php
class ControllerExtensionModuleAridiusViewed extends Controller {
	public function index($setting) {
		
		static $module = 0;
		
		$this->load->language('extension/module/aridius_viewed');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_quickview'] = $this->language->get('button_quickview');
		$data['button_instock'] = $this->language->get('button_instock');
        $data['button_load'] = $this->language->get('button_load');
	    $data['text_quickview'] = $this->language->get('text_quickview');
		$data['text_wish'] = $this->language->get('text_wish');
		$data['text_comp'] = $this->language->get('text_comp');
	
		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['language_id'] = $this->config->get('config_language_id');
		$data['aurus_name_sticker_product_new'] = $this->config->get('aurus_name_sticker_product_new');
		$data['aurus_name_sticker_product_top'] = $this->config->get('aurus_name_sticker_product_top');		
		$data['aurus_sticker_sale_product_auto'] = $this->config->get('aurus_sticker_sale_product_auto');	
		$data['aurus_sticker_new_product_auto'] = $this->config->get('aurus_sticker_new_product_auto');
		$data['aurus_sticker_product_new_day'] = $this->config->get('aurus_sticker_product_new_day');
		$data['aurus_sticker_product_top_rating'] = $this->config->get('aurus_sticker_product_top_rating');
		$data['aurus_sticker_product_top_viewed'] = $this->config->get('aurus_sticker_product_top_viewed');
		$data['aurus_sticker_product_top_ratinr'] = $this->config->get('aurus_sticker_product_top_ratinr');
		$data['aurus_sticker_top_product_auto'] = $this->config->get('aurus_sticker_top_product_auto');
		$data['aurus_limit_symbolst'] = $this->config->get('aurus_limit_symbolst');
		$data['aridiusinstock_status'] = $this->config->get('aridiusinstock_status');
		$data['aridius_qckview_status'] = $this->config->get('aridius_qckview_status');

		$data['rat'] = $setting['rat'];
		$data['wish'] = $setting['wish'];
		$data['comp'] = $setting['comp'];
		$data['quickview'] = $setting['quickview'];
        $data['colleft'] = $setting['colleft'];

		$data['navigation'] = $setting['navigation'];
		$data['autoplay'] = $setting['autoplay'];
		$data['autoplay_on'] = $setting['autoplay_on'];
		$data['items'] = $setting['items'];
		$data['rew_speed'] = $setting['rew_speed'];
		$data['stophover'] = $setting['stophover'];
		$data['carusel'] = $setting['carusel'];

		if ($setting['colleft'] !=1) {		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		}
   
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
		
		$data['products'] = array();
		
		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}
		
		$products = array_slice($aridius_aridius_viewedpr, 0, (int)$setting['limit']);

		foreach ($products as $product_id) {
			
			    $product_vieweed = isset($this->request->get['product_id']) ? $this->request->get['product_id'] : 0; 
			
				if ($product_id != $product_vieweed ) {
					$product_info = $this->model_catalog_product->getProduct($product_id);
				} else {
					$product_info = false;
				} 

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
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

				$data['products'][] = array(
					'dateadded'  => $product_info['date_added'],
					'viewed'     => $product_info['viewed'],
					'rating'     => $product_info['rating'],
					'quantity'   => $product_info['quantity'],	
					'price_sticker'        => $product_info['price'],
					'special_sticker'      => (isset($product_info['special']) ? $product_info['special'] : false),	
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
					'name'        => $product_info['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
			        'stickers2' => $this->model_catalog_product->getProductStickerProductId($product_info['product_id']),
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			}
		}

		$data['module'] = $module++;
		
		if ($data['products']) {
			
			return $this->load->view('extension/module/aridius_viewed', $data);
			
		}
	}
}