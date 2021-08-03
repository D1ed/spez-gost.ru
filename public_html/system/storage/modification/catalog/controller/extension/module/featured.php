<?php
class ControllerExtensionModuleFeatured extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/featured');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');

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
      
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		if (!empty($setting['product'])) {
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

					$data['products'][] = array(

					'dateadded'  => $product_info['date_added'],
					'viewed'     => $product_info['viewed'],
					'rating'     => $product_info['rating'],
					'stickers2' => $this->model_catalog_product->getProductStickerProductId($product_info['product_id']),
					'price_sticker'        => $product_info['price'],
					'special_sticker'      => (isset($product_info['special']) ? $product_info['special'] : false),	
      
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
				}
			}
		}

		if ($data['products']) {
			return $this->load->view('extension/module/featured', $data);
		}
	}
}