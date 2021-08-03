<?php
class ControllerExtensionModuleAridiusLivesearch extends Controller {
	
	private $error = array();

	   public function index() {

		$this->load->language('extension/module/aridius_livesearch');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('aridius_livesearch', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
		if (isset($this->request->post['apply'])) {
			$this->response->redirect($this->url->link('extension/module/aridius_livesearch', 'token=' . $this->session->data['token'], true));
        } else {
	        $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], true));
         }
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_cancel'] = $this->language->get('button_cancel');
        $data['entry_livesearch_model'] = $this->language->get('entry_livesearch_model');
        $data['entry_livesearch_description'] = $this->language->get('entry_livesearch_description');
		$data['entry_livesearch_sku'] = $this->language->get('entry_livesearch_sku');
		$data['entry_livesearch_tag'] = $this->language->get('entry_livesearch_tag');
        $data['entry_aridius_livesearch_width'] = $this->language->get('entry_aridius_livesearch_width');
        $data['entry_aridius_livesearch_height'] = $this->language->get('entry_aridius_livesearch_height');
		$data['entry_aridius_livesearch_limit'] = $this->language->get('entry_aridius_livesearch_limit');
		$data['entry_livesearch_img'] = $this->language->get('entry_livesearch_img');
		$data['entry_livesearch_symbol'] = $this->language->get('entry_livesearch_symbol');
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['aridius_livesearch_width'])) {
		$data['error_aridius_livesearch_width'] = $this->error['aridius_livesearch_width'];
		} else {
		$data['error_aridius_livesearch_width'] = '';
		}

		if (isset($this->error['aridius_livesearch_height'])) {
		$data['error_aridius_livesearch_height'] = $this->error['aridius_livesearch_height'];
		} else {
		$data['error_aridius_livesearch_height'] = '';
		}

		if (isset($this->error['aridius_livesearch_limit'])) {
		$data['error_aridius_livesearch_limit'] = $this->error['aridius_livesearch_limit'];
		} else {
		$data['error_aridius_livesearch_limit'] = '';
		}
		
		if (isset($this->error['aridius_livesearch_symbol'])) {
		$data['error_aridius_livesearch_symbol'] = $this->error['aridius_livesearch_symbol'];
		} else {
		$data['error_aridius_livesearch_symbol'] = '';
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
			'href' => $this->url->link('extension/module/aridius_livesearch', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/aridius_livesearch', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['aridius_livesearch_status'])) {
			$data['aridius_livesearch_status'] = $this->request->post['aridius_livesearch_status'];
		} else {
			$data['aridius_livesearch_status'] = $this->config->get('aridius_livesearch_status');
		}

		if (isset($this->request->post['aridius_livesearch_width'])) {
			$data['aridius_livesearch_width'] = $this->request->post['aridius_livesearch_width'];
		} elseif ($this->config->get('aridius_livesearch_width')) {
			$data['aridius_livesearch_width'] = $this->config->get('aridius_livesearch_width');
		} else {
			$data['aridius_livesearch_width'] = 40;
		}

		if (isset($this->request->post['aridius_livesearch_height'])) {
			$data['aridius_livesearch_height'] = $this->request->post['aridius_livesearch_height'];
		} elseif ($this->config->get('aridius_livesearch_height')) {
			$data['aridius_livesearch_height'] = $this->config->get('aridius_livesearch_height');
		} else {
			$data['aridius_livesearch_height'] = 40;
		}
		
		if (isset($this->request->post['aridius_livesearch_limit'])) {
			$data['aridius_livesearch_limit'] = $this->request->post['aridius_livesearch_limit'];
		} elseif ($this->config->get('aridius_livesearch_limit')) {
			$data['aridius_livesearch_limit'] = $this->config->get('aridius_livesearch_limit');
		} else {
			$data['aridius_livesearch_limit'] = 5;
		}
		
		if (isset($this->request->post['aridius_livesearch_symbol'])) {
			$data['aridius_livesearch_symbol'] = $this->request->post['aridius_livesearch_symbol'];
		} elseif ($this->config->get('aridius_livesearch_symbol')) {
			$data['aridius_livesearch_symbol'] = $this->config->get('aridius_livesearch_symbol');
		} else {
			$data['aridius_livesearch_symbol'] = 1;
		}

		if (isset($this->request->post['aridius_livesearch_livesearch_model'])) {
			$data['aridius_livesearch_livesearch_model'] = $this->request->post['aridius_livesearch_livesearch_model'];
		} else {
			$data['aridius_livesearch_livesearch_model'] = $this->config->get('aridius_livesearch_livesearch_model');
		}
		
		if (isset($this->request->post['aridius_livesearch_description'])) {
			$data['aridius_livesearch_description'] = $this->request->post['aridius_livesearch_description'];
		} else {
			$data['aridius_livesearch_description'] = $this->config->get('aridius_livesearch_description');
		}
		
		if (isset($this->request->post['aridius_livesearch_sku'])) {
			$data['aridius_livesearch_sku'] = $this->request->post['aridius_livesearch_sku'];
		} else {
			$data['aridius_livesearch_sku'] = $this->config->get('aridius_livesearch_sku');
		}
	
	   if (isset($this->request->post['aridius_livesearch_tag'])) {
			$data['aridius_livesearch_tag'] = $this->request->post['aridius_livesearch_tag'];
		} else {
			$data['aridius_livesearch_tag'] = $this->config->get('aridius_livesearch_tag');
		}
		
	   if (isset($this->request->post['aridius_livesearch_img'])) {
			$data['aridius_livesearch_img'] = $this->request->post['aridius_livesearch_img'];
		} else {
			$data['aridius_livesearch_img'] = $this->config->get('aridius_livesearch_img');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/aridius_livesearch', $data));
		}

	protected function validate() {
		
		if (!$this->user->hasPermission('modify', 'extension/module/aridius_livesearch')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['aridius_livesearch_width']) {
		$this->error['aridius_livesearch_width'] = $this->language->get('error_aridius_livesearch_width');
		}

		if (!$this->request->post['aridius_livesearch_height']) {
		$this->error['aridius_livesearch_height'] = $this->language->get('error_aridius_livesearch_height');
		}
		
		if (!$this->request->post['aridius_livesearch_limit']) {
		$this->error['aridius_livesearch_limit'] = $this->language->get('error_aridius_livesearch_limit');
		}
		
	    if (!$this->request->post['aridius_livesearch_symbol']) {
		$this->error['aridius_livesearch_symbol'] = $this->language->get('error_aridius_livesearch_symbol');
		}
		
		return !$this->error;
	}
		}