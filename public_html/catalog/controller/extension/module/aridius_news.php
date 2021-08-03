<?php
class ControllerExtensionModuleAridiusNews extends Controller {

	public function index($setting) {
		
		static $module = 0;

		$this->language->load('extension/module/aridius_news');

      	$data['heading_title'] = $this->language->get('heading_title');

		$data['header'] = $this->config->get('aridius_news_header');

		$setting['limit'] = $this->config->get('aridius_news_home_limit');
        $setting['numchars']= $this->config->get('aridius_news_home_chars');
		$data['text_more'] = $this->language->get('text_more');
		$data['text_posted'] = $this->language->get('text_posted');
		$data['buttonlist'] = $this->language->get('buttonlist');
		
		$this->load->model('catalog/aridiusnews');
		$this->load->model('tool/image');
				
		$data['aridius_news_count'] = $this->model_catalog_aridiusnews->getTotalaridius_news();

		$data['aridius_news_limit'] = $setting['limit'];

		$data['aridius_news_show_date'] = $this->config->get('aridius_news_show_date');
		$data['aridius_news_show_img'] = $this->config->get('aridius_news_show_img');
		$data['aridius_news_show_description'] = $this->config->get('aridius_news_show_description');
		$data['aridius_news_home_limit'] = $this->config->get('aridius_news_home_limit');

		if ($data['aridius_news_count'] > $data['aridius_news_limit']) {
			$data['showbutton'] = true;
		} else {
			$data['showbutton'] = false;
		}

		$data['aridius_newslist'] = $this->url->link('information/aridius_news');

		$data['show_headline'] = $this->config->get('aridius_news_headline_module');

		$data['numchars'] = $setting['numchars'];

		if (isset($data['numchars'])) {
			$chars = $data['numchars'];
		} else {
			$chars = 100;
		}

		$data['aridius_news'] = array();

		$results = $this->model_catalog_aridiusnews->getaridius_newsShort($setting['limit']);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('aridius_news_thumb_width'), $this->config->get('aridius_news_thumb_height'));
			} else {
				$image = false;
			}

			$aridius_news_length = strlen(utf8_decode($result['description']));

			if ($aridius_news_length > $chars) {
				$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $chars) . '..';
			} else {
				$description = html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8');
			}

			$data['aridius_news'][] = array(
				'title'        		=> $result['title'],
				'image'			=> $image,
				'description'	=> $description,
				'href'         		=> $this->url->link('information/aridius_news', 'aridius_news_id=' . $result['aridius_news_id']),
				'posted'   		=> date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$data['module'] = $module++;

       return $this->load->view('extension/module/aridius_news', $data);
	
	}
}
