<?php
class ControllerExtensionModuleAridiusTab extends Controller {
	
	public function index($setting) {

	static $module = 0;

		$this->load->language('extension/module/aridius_tab');
		
      	$data['heading_title'] = $this->language->get('heading_title');
      	$data['tab_latest'] = $this->language->get('tab_latest');
      	$data['tab_featured'] = $this->language->get('tab_featured');
      	$data['tab_bestseller'] = $this->language->get('tab_bestseller');
      	$data['tab_special'] = $this->language->get('tab_special');
        $data['tab_mostviewed'] = $this->language->get('tab_mostviewed');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['text_tax'] = $this->language->get('text_tax');
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
		
		$data['navigation'] = $setting['navigation'];
		$data['autoplay'] = $setting['autoplay'];
		$data['autoplay_on'] = $setting['autoplay_on'];
		$data['items'] = $setting['items'];
		$data['rew_speed'] = $setting['rew_speed'];
		$data['stophover'] = $setting['stophover'];
		$data['carusel'] = $setting['carusel'];

		$data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');;
		 
//Most viewed	
 
	 $data['mostviewed_products'] = array();		

		$product_data = array();
		
		if (empty($setting['limit'])) {
				$setting['limit'] = 5;
			}

		$query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.viewed DESC LIMIT " . (int)$setting['limit']);

		foreach ($query->rows as $result) { 		
			$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
		}

		if ($product_data) {
		foreach ($product_data as $result) {
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
							
			$data['mostviewed_products'][] = array(
			'dateadded'  => $result['date_added'],
			'viewed'     => $result['viewed'],
			'rating'     => $result['rating'],
            'quantity'      => $result['quantity'],			
			'price_sticker'        => $result['price'],
			'special_sticker'      => (isset($result['special']) ? $result['special'] : false),	
			'product_id'   => $result['product_id'],
			'thumb'   	   => $image,
			'name'         => $result['name'],
			'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
			'attribute' => $this->model_catalog_product->getProductAttributes($result['product_id']),
			'stickers2' => $this->model_catalog_product->getProductStickerProductId($result['product_id']),
			'price'   	   => $price,
			'special' 	   => $special,
			'tax'          => $tax,
			'rating'       => $rating,
			'href'         => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					);
				}
			}
//Latest
		
		$data['latest_products'] = array();

			$filter_data = array(
				'sort'  => 'p.date_added',
				'order' => 'DESC',
				'start' => 0,
				'limit' => $setting['limit']
			);
			
			$latest_results = $this->model_catalog_product->getProducts($filter_data);

			if ($latest_results) {
				foreach ($latest_results as $result) {
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
					$data['latest_products'][] = array(
					'dateadded'  => $result['date_added'],
					'viewed'     => $result['viewed'],
					'rating'     => $result['rating'],
                    'quantity'      => $result['quantity'],						
					'price_sticker'        => $result['price'],
					'special_sticker'      => (isset($result['special']) ? $result['special'] : false),	
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'attribute' => $this->model_catalog_product->getProductAttributes($result['product_id']),
			        'stickers2' => $this->model_catalog_product->getProductStickerProductId($result['product_id']),
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					);
				}
			}
//Specials

		$data['special_products'] = array();
     
			$special_data = array(
				'sort'  => 'pd.name',
				'order' => 'ASC',
				'start' => 0,
				'limit' => $setting['limit']
			);

			$special_results = $this->model_catalog_product->getProductSpecials($special_data);

			if ($special_results) {
				foreach ($special_results as $result) {
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

					$data['special_products'][] = array(
					'dateadded'  => $result['date_added'],
					'viewed'     => $result['viewed'],
					'rating'     => $result['rating'],
                    'quantity'      => $result['quantity'],						
					'price_sticker'        => $result['price'],
					'special_sticker'      => (isset($result['special']) ? $result['special'] : false),	
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'attribute' => $this->model_catalog_product->getProductAttributes($result['product_id']),
			        'stickers2' => $this->model_catalog_product->getProductStickerProductId($result['product_id']),
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
					);
				}
			}
	
//BestSeller

		$data['bestseller_products'] = array();

			$bestseller_results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
			
			if ($bestseller_results) {
				foreach ($bestseller_results as $result) {
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

					$data['bestseller_products'][] = array(
					'dateadded'  => $result['date_added'],
					'viewed'     => $result['viewed'],
					'rating'     => $result['rating'],
                    'quantity'      => $result['quantity'],						
					'price_sticker'        => $result['price'],
					'special_sticker'      => (isset($result['special']) ? $result['special'] : false),	
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'attribute' => $this->model_catalog_product->getProductAttributes($result['product_id']),
			        'stickers2' => $this->model_catalog_product->getProductStickerProductId($result['product_id']),
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					);
				}
			}
//Featured

		$data['featured_products'] = array();

		if(!empty($setting['product'])){

			if (empty($setting['limit'])) {
				$setting['limit'] = 5;
			}
			
			$products = array_slice($setting['product'], 0, (int)$setting['limit']);

			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

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

					$data['featured_products'][] = array(
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
					'attribute' => $this->model_catalog_product->getProductAttributes($product_info['product_id']),
			        'stickers2' => $this->model_catalog_product->getProductStickerProductId($product_info['product_id']),
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
				}
			}
		}

		$data['module'] = $module++;

		return $this->load->view('extension/module/aridius_tab', $data);
	}
}
