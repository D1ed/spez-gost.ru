<?php
class ControllerExtensionModuleAridiusReviewCategory extends Controller {
	
	private $error = array();

	public function index() {
		
		$this->load->language('extension/module/aridius_review_category');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('aridius_review_category', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			if (isset($this->request->post['apply'])) {
			$this->response->redirect($this->url->link('extension/module/aridius_review_category', 'token=' . $this->session->data['token'], true));
            } else {
	        $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], true));
            }
		}
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['entry_status'] = $this->language->get('entry_status');
	    $data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');	
		$data['text_edit'] = $this->language->get('text_edit');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['entry_chars'] = $this->language->get('entry_chars');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_autoplay'] = $this->language->get('entry_autoplay');
		$data['entry_autoplay_on'] = $this->language->get('entry_autoplay_on');
		$data['entry_items'] = $this->language->get('entry_items');
		$data['entry_rew_speed'] = $this->language->get('entry_rew_speed');
		$data['entry_stophover'] = $this->language->get('entry_stophover');
		$data['entry_navigation'] = $this->language->get('entry_navigation');
		$data['entry_date'] = $this->language->get('entry_date');
		$data['entry_colleft'] = $this->language->get('entry_colleft');
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['aridius_review_category_chars'])) {
			$data['error_headline_chars'] = $this->error['aridius_review_category_chars'];
		} else {
			$data['error_headline_chars'] = '';
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
				'href' => $this->url->link('extension/module/aridius_review_category', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/aridius_review_category', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}
		
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/aridius_review_category', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/aridius_review_category', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['aridius_review_category_chars'])) {
			$data['aridius_review_category_chars'] = $this->request->post['aridius_review_category_chars'];
		} elseif ($this->config->get('aridius_review_category_chars')) {
			$data['aridius_review_category_chars'] = $this->config->get('aridius_review_category_chars');
		} else {
			$data['aridius_review_category_chars'] = 160;
		}
		
		if (isset($this->request->post['aridius_review_category_limit'])) {
			$data['aridius_review_category_limit'] = $this->request->post['aridius_review_category_limit'];
		} elseif ($this->config->get('aridius_review_category_limit')) {
			$data['aridius_review_category_limit'] = $this->config->get('aridius_review_category_limit');
		} else {
		$data['aridius_review_category_limit'] = 3;
		}
		
		if (isset($this->request->post['aridius_review_category_autoplay'])) {
			$data['aridius_review_category_autoplay'] = $this->request->post['aridius_review_category_autoplay'];
		} elseif ($this->config->get('aridius_review_category_autoplay')) {
			$data['aridius_review_category_autoplay'] = $this->config->get('aridius_review_category_autoplay');
		} else {
		$data['aridius_review_category_autoplay'] = 4000;
		}

		if (isset($this->request->post['aridius_review_category_autoplayon'])) {
			$data['aridius_review_category_autoplayon'] = $this->request->post['aridius_review_category_autoplayon'];
		} elseif ($this->config->get('aridius_review_category_autoplayon')) {
			$data['aridius_review_category_autoplayon'] = $this->config->get('aridius_review_category_autoplayon');
		} else {
		$data['aridius_review_category_autoplayon'] = 0;
		}

		if (isset($this->request->post['aridius_review_category_items'])) {
			$data['aridius_review_category_items'] = $this->request->post['aridius_review_category_items'];
		} elseif ($this->config->get('aridius_review_category_items')) {
			$data['aridius_review_category_items'] = $this->config->get('aridius_review_category_items');
		} else {
		$data['aridius_review_category_items'] = 2;
		}
		
		if (isset($this->request->post['aridius_review_category_rew_speed'])) {
			$data['aridius_review_category_rew_speed'] = $this->request->post['aridius_review_category_rew_speed'];
		} elseif ($this->config->get('aridius_review_category_rew_speed')) {
			$data['aridius_review_category_rew_speed'] = $this->config->get('aridius_review_category_rew_speed');
		} else {
		$data['aridius_review_category_rew_speed'] = 4000;
		}
		
		if (isset($this->request->post['aridius_review_category_stophover'])) {
			$data['aridius_review_category_stophover'] = $this->request->post['aridius_review_category_stophover'];
		} elseif ($this->config->get('aridius_review_category_stophover')) {
			$data['aridius_review_category_stophover'] = $this->config->get('aridius_review_category_stophover');
		} else {
		$data['aridius_review_category_stophover'] = 1;
		}

		if (isset($this->request->post['aridius_review_category_navigation'])) {
			$data['aridius_review_category_navigation'] = $this->request->post['aridius_review_category_navigation'];
		} elseif ($this->config->get('aridius_review_category_navigation')) {
			$data['aridius_review_category_navigation'] = $this->config->get('aridius_review_category_navigation');
		} else {
		$data['aridius_review_category_navigation'] = 0;
		}

		if (isset($this->request->post['aridius_review_category_date'])) {
			$data['aridius_review_category_date'] = $this->request->post['aridius_review_category_date'];
		} elseif ($this->config->get('aridius_review_category_date')) {
			$data['aridius_review_category_date'] = $this->config->get('aridius_review_category_date');
		} else {
		$data['aridius_review_category_date'] = 0;
		}

		if (isset($this->request->post['aridius_review_category_colleft'])) {
			$data['aridius_review_category_colleft'] = $this->request->post['aridius_review_category_colleft'];
		} elseif (!empty($module_info)) {
			$data['aridius_review_category_colleft'] = $module_info['aridius_review_category_colleft'];
		} else {
			$data['aridius_review_category_colleft'] = 0;
		}
		
		if (isset($this->request->post['aridius_review_category_status'])) {
			$data['aridius_review_category_status'] = $this->request->post['aridius_review_category_status'];
		} else {
			$data['aridius_review_category_status'] = $this->config->get('aridius_review_category_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/aridius_review_category', $data));
	}

	protected function validate() {
		
		if (!$this->user->hasPermission('modify', 'extension/module/aridius_review_category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['aridius_review_category_chars']) {
			$this->error['aridius_review_category_chars'] = $this->language->get('error_headline_chars');
		}

		return !$this->error;
	}
}