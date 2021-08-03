<?php
class ControllerExtensionModuleAridiusIcons extends Controller {
	
	public function index() {
		



		$data['language_id'] = $this->config->get('config_language_id');
		$data['aridius_icons_top_links'] = $this->config->get('aridius_icons_top_links');
$data['aridius_icons_colico'] = $this->config->get('aridius_icons_colico');
$data['aridius_icons_popup'] = $this->config->get('aridius_icons_popup');
$data['aridius_icons_link'] = $this->config->get('aridius_icons_link');


		return $this->load->view('extension/module/aridius_icons', $data);
		
	}
}