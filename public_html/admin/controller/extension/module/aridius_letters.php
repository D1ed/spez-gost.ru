<?php
class ControllerExtensionModuleAridiusletters extends Controller {
	
	private $error = array();

	public function index() {

		$this->load->language('extension/module/aridius_letters');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('aridius_letters', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			if (isset($this->request->post['apply'])) {
			$this->response->redirect($this->url->link('extension/module/aridius_letters', 'token=' . $this->session->data['token'], true));
            } else {
	        $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], true));
            }
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['text_bt'] = $this->language->get('text_bt');
		$data['text_btpl'] = $this->language->get('text_btpl');
		$data['text_sendletters'] = $this->language->get('text_sendletters');
		$data['text_seeemail'] = $this->language->get('text_seeemail');
		$data['text_saveletters'] = $this->language->get('text_saveletters');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_email'] = $this->language->get('button_email');
		$data['text_title'] = $this->language->get('text_title');
		$data['button_send'] = $this->language->get('button_send');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['text_adddescription'] = $this->language->get('text_adddescription');
		
		$data['ckeditor'] = $this->config->get('config_editor_default');
		$data['lang'] = $this->language->get('lang');
		$data['token'] = $this->session->data['token'];

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

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/aridius_letters', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/aridius_letters', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/aridius_letters', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/aridius_letters', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		$data['aridius_letters2'] = $this->url->link('common/aridius_letters_send', 'token=' . $this->session->data['token'], true);
		$data['aridius_letters'] = $this->url->link('common/aridius_letters', 'token=' . $this->session->data['token'], true);

		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['aridius_letters_pl'])) {
			$data['aridius_letters_pl'] = $this->request->post['aridius_letters_pl'];
		} else {
			$data['aridius_letters_pl'] = $this->config->get('aridius_letters_pl');
		}
		
		if (isset($this->request->post['aridius_letters_title'])) {
			$data['aridius_letters_title'] = $this->request->post['aridius_letters_title'];
		} else {
			$data['aridius_letters_title'] = $this->config->get('aridius_letters_title');
		}
		
		if (isset($this->request->post['aridius_letters_placeholder'])) {
			$data['aridius_letters_placeholder'] = $this->request->post['aridius_letters_placeholder'];
		} else {
			$data['aridius_letters_placeholder'] = $this->config->get('aridius_letters_placeholder');
		}
		
		if (isset($this->request->post['aridius_lettersdes_status'])) {
			$data['aridius_lettersdes_status'] = $this->request->post['aridius_lettersdes_status'];
		} else {
			$data['aridius_lettersdes_status'] = $this->config->get('aridius_lettersdes_status');
		}
		
		if (isset($this->request->post['aridius_letters_description'])) {
			$data['aridius_letters_description'] = $this->request->post['aridius_letters_description'];
		} else {
			$data['aridius_letters_description'] = $this->config->get('aridius_letters_description');
		}
		
		if (isset($this->request->post['aridius_letters_status'])) {
			$data['aridius_letters_status'] = $this->request->post['aridius_letters_status'];
		} else {
			$data['aridius_letters_status'] = $this->config->get('aridius_letters_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module/aridius_letters', $data));
	}

	protected function validate() {
		
		if (!$this->user->hasPermission('modify', 'extension/module/aridius_letters')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
	
	public function install() {
		
		$this->load->model('common/aridiusletters');
		$this->model_common_aridiusletters->install();
	}
}
