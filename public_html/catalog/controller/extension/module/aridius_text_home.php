<?php
class ControllerExtensionModuleAridiusTextHome extends Controller {
	
	public function index() {
	        $this->load->language('extension/module/aridius_text_home');
			$data['text_show_desc'] = $this->language->get('text_show_desc');
			$data['text_hide_desc'] = $this->language->get('text_hide_desc');

	        $data['aridius_text_home_limit'] = $this->config->get('aridius_text_home_limit');
	        $data['aridius_text_home_height'] = $this->config->get('aridius_text_home_height');
		
		    $data['description'] =  html_entity_decode ($this->config->get('aridius_text_home_description')[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

		return $this->load->view('extension/module/aridius_text_home', $data);
		
	}
}