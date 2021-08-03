<?php
class ControllerExtensionModuleAridiusBestSeller extends Controller {
	
	public function index($setting) {
		
		static $module = 0;
		
		$this->load->language('extension/module/aridius_bestseller');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$data['button_instock'] = $this->language->get('button_instock');
	    $data['button_load'] = $this->language->get('button_load');
	    $data['text_quickview'] = $this->language->get('text_quickview');
		$data['text_wish'] = $this->language->get('text_wish');
		$data['text_comp'] = $this->language->get('text_comp');
		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();
		
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
		$data['name'] = $setting['name'];
		$data['navigation'] = $setting['navigation'];
		$data['autoplay'] = $setting['autoplay'];
		$data['autoplay_on'] = $setting['autoplay_on'];
		$data['items'] = $setting['items'];
		$data['rew_speed'] = $setting['rew_speed'];
		$data['stophover'] = $setting['stophover'];
		$data['carusel'] = $setting['carusel'];
		
		$data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
		
		
		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
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
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'dateadded'  => $result['date_added'],
					'viewed'     => $result['viewed'],
					'rating'     => $result['rating'],
					'quantity'   => $result['quantity'],
					'price_sticker'        => $result['price'],
					'special_sticker'      => (isset($result['special']) ? $result['special'] : false),	
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
			        'stickers2' => $this->model_catalog_product->getProductStickerProductId($result['product_id']),
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}
			
            $data['module'] = $module++;

			return $this->load->view('extension/module/aridius_bestseller', $data);
		}
	}
}