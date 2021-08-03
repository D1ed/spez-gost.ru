<?php
class ControllerExtensionModuleAridiusTextHome extends Controller {
	private $error = array();

	public function index() {

	    $this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
				
		$this->load->language('extension/module/aridius_text_home');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('aridius_text_home', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

						
			if (isset($this->request->post['apply'])) {
			$this->response->redirect($this->url->link('extension/module/aridius_text_home', 'token=' . $this->session->data['token'], true));
            } else {
	        $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], true));
            }
		}

		if ($this->config->get('config_editor_default')) {
			$this->document->addScript('view/javascript/ckeditor/ckeditor.js');
			$this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
		}

		$data['ckeditor'] = $this->config->get('config_editor_default');
		$data['lang'] = $this->language->get('lang');
		$data['token'] = $this->session->data['token'];
		$data['text_footer_limit'] = $this->language->get('text_footer_limit');
		$data['text_footer_limit_height'] = $this->language->get('text_footer_limit_height');
        $data['text_description'] = $this->language->get('text_description');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_edit'] = $this->language->get('text_edit');

		if (isset($this->error['aridius_faq_name'])) {
			$data['error_name'] = $this->error['aridius_faq_name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/aridius_text_home', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/aridius_text_home', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['aridius_text_home_status'])) {
			$data['aridius_text_home_status'] = $this->request->post['aridius_text_home_status'];
		} else {
			$data['aridius_text_home_status'] = $this->config->get('aridius_text_home_status');
		}
				if (isset($this->request->post['aridius_text_home_description'])) {
			$data['aridius_text_home_description'] = $this->request->post['aridius_text_home_description'];
		} else {
			$data['aridius_text_home_description'] = $this->config->get('aridius_text_home_description');
		}
		if (isset($this->request->post['aridius_text_home_limit'])) {
			$data['aridius_text_home_limit'] = $this->request->post['aridius_text_home_limit'];
		} elseif ($this->config->has('aridius_text_home_limit')) {
			$data['aridius_text_home_limit'] = $this->config->get('aridius_text_home_limit');
		} else {
			$data['aridius_text_home_limit'] = '2200';
		}
		
		if (isset($this->request->post['aridius_text_home_height'])) {
			$data['aridius_text_home_height'] = $this->request->post['aridius_text_home_height'];
		} elseif ($this->config->has('aridius_text_home_height')) {
			$data['aridius_text_home_height'] = $this->config->get('aridius_text_home_height');
		} else {
			$data['aridius_text_home_height'] = '150';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/aridius_text_home', $data));
		
	}

	protected function validate() {
		
		if (!$this->user->hasPermission('modify', 'extension/module/aridius_letters')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}