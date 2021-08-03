<?php
class ControllerInformationFishlending extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

			    $data['fishheader'] = $this->load->controller('common/fishheader');
                $data['fishcontent'] = $this->load->controller('extension/module/fish_singleclick/fishcontent');

		$this->response->setOutput($this->load->view('information/fishlending', $data));
	}
}