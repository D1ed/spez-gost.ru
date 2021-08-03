<?php
class ControllerExtensionModuleAridiusFaq extends Controller {
	
	public function index() {
		
		$this->load->language('extension/module/aridius_faq');
		


		$data['heading_title'] = $this->language->get('heading_title');

		$data['language_id'] = $this->config->get('config_language_id');
		$data['heading_title_faq'] = $this->language->get('heading_title_faq');
		$data['heading_name_faq'] = $this->language->get('heading_name_faq');
		$data['aridius_faq_top_links'] = $this->config->get('aridius_faq_top_links');
		$data['aridius_faq_status'] = $this->config->get('aridius_faq_status');
		$data['aridius_faq_description'] = $this->config->get('aridius_faq_description');
		$data['aridius_faq_description2'] = $this->config->get('aridius_faq_description2');
		$data['aridius_faq_name'] = $this->config->get('aridius_faq_name');

		return $this->load->view('extension/module/aridius_faq', $data);
		
	}
}