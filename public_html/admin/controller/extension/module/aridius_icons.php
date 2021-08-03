<?php
class ControllerExtensionModuleAridiusIcons extends Controller {
	private $error = array();

	public function index() {

	    $this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
				
		$this->load->language('extension/module/aridius_icons');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('aridius_icons', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

		if (isset($this->request->post['apply'])) {
			$this->response->redirect($this->url->link('extension/module/aridius_icons', 'token=' . $this->session->data['token'], true));
        } else {
	        $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], true));
        }
		}

		if ($this->config->get('config_editor_default')) {
			$this->document->addScript('view/javascript/ckeditor/ckeditor.js');
			$this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
		}

		$data['text_section_title'] = $this->language->get('text_section_title');
		$data['tab_section'] = $this->language->get('tab_section');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
	    $data['entry_status'] = $this->language->get('entry_status');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['tab_top_link'] = $this->language->get('tab_top_link');
		$data['text_name_top_add_tabs'] = $this->language->get('text_name_top_add_tabs');
		$data['text_add_top_link'] = $this->language->get('text_add_top_link');
		$data['text_text_description'] = $this->language->get('text_text_description');
        $data['text_legend'] = $this->language->get('text_legend');
        $data['text_popup'] = $this->language->get('text_popup');
        $data['text_link'] = $this->language->get('text_link');
		$data['text_link_top'] = $this->language->get('text_link_top');
		$data['text_faicons_icons'] = $this->language->get('text_faicons_icons');
		$data['text_add_link'] = $this->language->get('text_add_link');
		$data['text_colico'] = $this->language->get('text_colico');
	    $data['button_apply'] = $this->language->get('button_apply');
	    $data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
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

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/aridius_icons', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/aridius_icons', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['aridius_icons_status'])) {
			$data['aridius_icons_status'] = $this->request->post['aridius_icons_status'];
		} else {
			$data['aridius_icons_status'] = $this->config->get('aridius_icons_status');
		}

        if (isset($this->request->post['aridius_icons_colico'])) {
			$data['aridius_icons_colico'] = $this->request->post['aridius_icons_colico'];
		} else {
			$data['aridius_icons_colico'] = $this->config->get('aridius_icons_colico');
		}

		if (isset($this->request->post['aridius_icons_popup'])) {
			$data['aridius_icons_popup'] = $this->request->post['aridius_icons_popup'];
		} else {
			$data['aridius_icons_popup'] = $this->config->get('aridius_icons_popup');
		}
		
		if (isset($this->request->post['aridius_icons_link'])) {
			$data['aridius_icons_link'] = $this->request->post['aridius_icons_link'];
		} else {
			$data['aridius_icons_link'] = $this->config->get('aridius_icons_link');
		}
	
		$data['top_links'] = array();
		if (isset($this->request->post['aridius_icons_top_links'])) {
		  $data['top_links'] = $this->request->post['aridius_icons_top_links'];
		} elseif ($this->config->get('aridius_icons_top_links')) {
		  $data['top_links'] = $this->config->get('aridius_icons_top_links');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/aridius_icons', $data));
		
	}
	
	protected function validate() {

	if (!$this->user->hasPermission('modify', 'extension/module/aridius_icons')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}


}