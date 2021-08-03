<?php
class ControllerExtensionModuleAridiusReviewCategory extends Controller {

	public function index($setting) {
		
		$this->load->language('extension/module/aridius_review_category');
		$this->load->model('extension/module/aridiusstorereview');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_avr'] = $this->language->get('text_avr');
		$data['text_avr2'] = $this->language->get('text_avr2');
		$data['text_avr3'] = $this->language->get('text_avr3');
		$data['text_sum'] = $this->language->get('text_sum');
		$data['buttonlist_rew'] = $this->language->get('buttonlist_rew');

        $data['aridius_newslist'] = $this->url->link('information/aridius_news');

	    $chars = $this->config->get('aridius_review_category_chars');

	   		$data['navigation'] = $this->config->get('aridius_review_category_navigation');
	   		$data['limit'] = $this->config->get('aridius_review_category_limit');
	   		$data['autoplay'] = $this->config->get('aridius_review_category_autoplay');
			$data['autoplay_on'] = $this->config->get('aridius_review_category_autoplayon');
	   		$data['items'] = $this->config->get('aridius_review_category_items');
			$data['rew_speed'] = $this->config->get('aridius_review_category_rew_speed');
			$data['stophover'] = $this->config->get('aridius_review_category_stophover');
			$data['date'] = $this->config->get('aridius_review_category_date');
			$data['colleft'] = $this->config->get('aridius_review_category_colleft');
		
	    $data['aridius_rewlist'] = $this->url->link('extension/module/aridius_store_review');
		
		$data['reviews'] = array();
		
        $data['review_total'] = $this->model_extension_module_aridiusstorereview->getTotalReview();
		
       	$data['rating_avr'] = $this->model_extension_module_aridiusstorereview->getTotalReviewAverage();
	   
	    $results = $this->model_extension_module_aridiusstorereview->getReviewsById();
	   
	    foreach ($results as $result) {

		$aridius_review_length = strlen(utf8_decode($result['text']));

		if ($aridius_review_length > $chars) {
				$text = utf8_substr(strip_tags(html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8')), 0, $chars) . '..';
				} else {
				$text = html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8');
		}
			
            $data['reviews'][] = array(
                'author'     => $result['author'],
                'review_id'  => $result['review_id'],
                'text'       => $text,
                'rating'     => (int)$result['rating'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }

		return $this->load->view('extension/module/aridius_review_category', $data);
	}
}