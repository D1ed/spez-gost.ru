<?php
class ControllerExtensionModuleAridiusPopupmail extends Controller {
	
	private $error = array();

	public function index() {
		
		$this->load->language('extension/module/aridius_popupmail');
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
        
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('aridius_popupmail', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

	   //CKEditor
       if ($this->config->get('config_editor_default')) {
        $this->document->addScript('view/javascript/ckeditor/ckeditor.js');
        $this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
       }
   
		$data['heading_title'] = $this->language->get('heading_title');
	    $data['entry_name'] = $this->language->get('entry_name');
		$data['text_edit'] = $this->language->get('text_edit');
	    $data['entry_status'] = $this->language->get('entry_status');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
        $data['text_time'] = $this->language->get('text_time');
		$data['text_delay'] = $this->language->get('text_delay');
		$data['text_day'] = $this->language->get('text_day');
		$data['all_day'] = $this->language->get('all_day');
		$data['working_day'] = $this->language->get('working_day');
		$data['weekend_day'] = $this->language->get('weekend_day');
		$data['text_mail_subject'] = $this->language->get('text_mail_subject');
		$data['text_mail_message'] = $this->language->get('text_mail_message');
		$data['text_mail_img'] = $this->language->get('text_mail_img');
        $data['text_img_help'] = $this->language->get('text_img_help');
		$data['text_btpl'] = $this->language->get('text_btpl');
		$data['text_bt'] = $this->language->get('text_bt');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['text_adddescription'] = $this->language->get('text_adddescription');
		
		$data['ckeditor'] = $this->config->get('config_editor_default');
		$data['lang'] = $this->language->get('lang');
		$data['token'] = $this->session->data['token'];
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
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
			'href' => $this->url->link('extension/module/aridius_popupmail', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/aridius_popupmail', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->post['aridius_popupmail_pl'])) {
			$data['aridius_popupmail_pl'] = $this->request->post['aridius_popupmail_pl'];
		} else {
			$data['aridius_popupmail_pl'] = $this->config->get('aridius_popupmail_pl');
		}
		
		if (isset($this->request->post['aridius_popupmail_placeholder'])) {
			$data['aridius_popupmail_placeholder'] = $this->request->post['aridius_popupmail_placeholder'];
		} else {
			$data['aridius_popupmail_placeholder'] = $this->config->get('aridius_popupmail_placeholder');
		}
		
		if (isset($this->request->post['aridius_popupmail_status'])) {
			$data['aridius_popupmail_status'] = $this->request->post['aridius_popupmail_status'];
		} else {
			$data['aridius_popupmail_status'] = $this->config->get('aridius_popupmail_status');
		}

		if (isset($this->request->post['aridius_popupmail_time'])) {
			$data['aridius_popupmail_time'] = $this->request->post['aridius_popupmail_time'];
		} else {
			$data['aridius_popupmail_time'] = $this->config->get('aridius_popupmail_time');
		}
		
		if (isset($this->request->post['aridius_popupmail_message'])) {
			$data['aridius_popupmail_message'] = $this->request->post['aridius_popupmail_message'];
		} else {
			$data['aridius_popupmail_message'] = $this->config->get('aridius_popupmail_message');
		}
		
		if (isset($this->request->post['aridius_popupmail_subject'])) {
			$data['aridius_popupmail_subject'] = $this->request->post['aridius_popupmail_subject'];
		} else {
			$data['aridius_popupmail_subject'] = $this->config->get('aridius_popupmail_subject');
		}
		
		if (isset($this->request->post['aridius_popupmail_img'])) {
			$data['aridius_popupmail_img'] = $this->request->post['aridius_popupmail_img'];
		} else {
			$data['aridius_popupmail_img'] = $this->config->get('aridius_popupmail_img');
		}
		
		if (isset($this->request->post['aridius_popupmail_delay'])) {
			$data['aridius_popupmail_delay'] = $this->request->post['aridius_popupmail_delay'];
		} else {
			$data['aridius_popupmail_delay'] = $this->config->get('aridius_popupmail_delay');
		}
		
		if (isset($this->request->post['aridius_popupmail_day'])) {
			$data['aridius_popupmail_day'] = $this->request->post['aridius_popupmail_day'];
		} else {
			$data['aridius_popupmail_day'] = $this->config->get('aridius_popupmail_day');
		}
		
		if (isset($this->request->post['aridius_popupmaildes_status'])) {
			$data['aridius_popupmaildes_status'] = $this->request->post['aridius_popupmaildes_status'];
		} else {
			$data['aridius_popupmaildes_status'] = $this->config->get('aridius_popupmaildes_status');
		}
		
		if (isset($this->request->post['aridius_popupmail_description'])) {
			$data['aridius_popupmail_description'] = $this->request->post['aridius_popupmail_description'];
		} else {
			$data['aridius_popupmail_description'] = $this->config->get('aridius_popupmail_description');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module/aridius_popupmail', $data));
		}
	
	protected function validate() {

		if (!$this->user->hasPermission('modify', 'extension/module/aridius_popupmail')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}