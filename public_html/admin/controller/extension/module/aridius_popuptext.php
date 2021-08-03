<?php
class ControllerExtensionModuleAridiusPopuptext extends Controller {
	
	private $error = array();

	public function index() {
		
		$this->load->language('extension/module/aridius_popuptext');

	    $this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
				
		$this->load->model('extension/module');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('aridius_popuptext', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

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
		$data['text_img_help'] = $this->language->get('text_img_help');
		$data['entry_description_top'] = $this->language->get('entry_description_top');
		
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

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/aridius_popuptext', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/aridius_popuptext', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/aridius_popuptext', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/aridius_popuptext', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

	    if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		if (isset($this->request->post['aridius_popuptext_time'])) {
			$data['aridius_popuptext_time'] = $this->request->post['aridius_popuptext_time'];
		} elseif (!empty($module_info)) {
			$data['aridius_popuptext_time'] = $module_info['aridius_popuptext_time'];
		} else {
			$data['aridius_popuptext_time'] = '';
		}
		
		if (isset($this->request->post['aridius_popuptext_delay'])) {
			$data['aridius_popuptext_delay'] = $this->request->post['aridius_popuptext_delay'];
		} elseif (!empty($module_info)) {
			$data['aridius_popuptext_delay'] = $module_info['aridius_popuptext_delay'];
		} else {
			$data['aridius_popuptext_delay'] = '';
		}
		
		if (isset($this->request->post['aridius_popuptext_day'])) {
			$data['aridius_popuptext_day'] = $this->request->post['aridius_popuptext_day'];
		} elseif (!empty($module_info)) {
			$data['aridius_popuptext_day'] = $module_info['aridius_popuptext_day'];
		} else {
			$data['aridius_popuptext_day'] = '';
		}
		
		if (isset($this->request->post['aridius_popuptext_description'])) {
			$data['aridius_popuptext_description'] = $this->request->post['aridius_popuptext_description'];
		} elseif (!empty($module_info)) {
			$data['aridius_popuptext_description'] = $module_info['aridius_popuptext_description'];
		} else {
			$data['aridius_popuptext_description'] = '';
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/aridius_popuptext', $data));
		}
	
	protected function validate() {

		if (!$this->user->hasPermission('modify', 'extension/module/aridius_popuptext')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		return !$this->error;
	}
}