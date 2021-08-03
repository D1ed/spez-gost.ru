<?php
class ControllerExtensionModuleAridiusPrReview extends Controller {
	
	public function index($setting) {
		
		static $module = 0;
		
		$this->load->language('extension/module/aridius_pr_review');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_quickview'] = $this->language->get('button_quickview');
		$data['button_instock'] = $this->language->get('button_instock');
        $data['button_more'] = $this->language->get('button_more');

		$this->load->model('catalog/product');
        $this->load->model('catalog/aridiusprreview');
		$this->load->model('tool/image');

		$data['products'] = array();

		$data['language_id'] = $this->config->get('config_language_id');
		$data['aurus_limit_symbolst'] = $this->config->get('aurus_limit_symbolst');
		$data['aridiusinstock_status'] = $this->config->get('aridiusinstock_status');
		$data['aridius_qckview_status'] = $this->config->get('aridius_qckview_status');

		$data['items'] = $setting['items'];
		$data['pag_speed'] = $setting['pag_speed'];

		$data['autoplay'] = $setting['autoplay'];
		$data['autoplay_on'] = $setting['autoplay_on'];
		$data['stophover'] = $setting['stophover'];

		$data['navigation'] = $setting['navigation'];
		$data['rat'] = $setting['rat'];
        $data['colleft'] = $setting['colleft'];

		$results = $this->model_catalog_aridiusprreview->getLastReviews($setting['limit']);

		if ($results) {
			foreach ($results as $result) {

				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
	
				$data['products'][] = array(
				'product_id'  => $result['product_id'],
				'name'    => $result['name'],
   				'rating'  => $result['rating'],
				'text'    => utf8_substr(strip_tags(html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8')), 0, 115) . '..',
        	    'stars'   => $rating,
				'thumb'   => $image, 
				'href'    => $this->url->link('product/product', 'product_id=' . $result['product_id'])
			);
			}
			
          $data['module'] = $module++;
	
		  return $this->load->view('extension/module/aridius_pr_review', $data);
		}
	}
}