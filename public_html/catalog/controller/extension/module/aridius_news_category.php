<?php
class ControllerExtensionModuleAridiusNewsCategory extends Controller {

	public function index($setting) {
		
		$this->load->language('extension/module/aridius_news_category');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_all_news'] = $this->language->get('text_all_news');
		
        $data['aridius_newslist'] = $this->url->link('information/aridius_news');

		$data['aridius_news_show_date'] = $this->config->get('aridius_news_show_date');
		$check=array();
		$check = $setting['aridius_news_category2'];

		if (isset($this->request->get['aridius_news_id'])) {
			$parts = explode('_', (string)$this->request->get['aridius_news_id']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['aridius_news_id'] = $parts[0];
		} else {
			$data['aridius_news_id'] = 0;
		}

		$this->load->model('catalog/aridiusnews');
	    $this->load->model('tool/image2');
		$data['news'] = array();

		$news = $this->model_catalog_aridiusnews->getaridius_news(0);

		foreach ($news as $new) {

	  if (isset($check) && (in_array($new['aridius_news_id'], $check ))) {	
				if ($new['image']) {
                $new['image'] = $this->model_tool_image2->resize($new['image'], $setting['width'], $setting['height']);
            } else {
                $new['image'] = '';
            }
	
			$data['news'][] = array(
				'aridius_news_id'  	=> $new['aridius_news_id'],
				'href'				=> $this->url->link('information/aridius_news', 'aridius_news_id=' . $new['aridius_news_id']),
				'title'				=> $new['title'],
				'thumb'             => $new['image'],
				'posted'   		=> date($this->language->get('date_format_short'), strtotime($new['date_added']))
			
			);
		  }
		}
		
		$this->load->model('catalog/aridiusnews');	
		$data['aridius_news_count'] = $this->model_catalog_aridiusnews->getTotalaridius_news();
	    
		if ($data['aridius_news_count'] > count($check)) {
			$data['showbutton'] = true;
		} else {
			$data['showbutton'] = false;
		}

		return $this->load->view('extension/module/aridius_news_category', $data);
	}
}