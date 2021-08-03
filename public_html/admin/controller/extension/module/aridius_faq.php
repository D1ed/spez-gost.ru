<?php
class ControllerExtensionModuleAridiusFaq extends Controller {
	private $error = array();

	public function index() {

	    $this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
				
		$this->load->language('extension/module/aridius_faq');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('aridius_faq', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

						
			if (isset($this->request->post['apply'])) {
			$this->response->redirect($this->url->link('extension/module/aridius_faq', 'token=' . $this->session->data['token'], true));
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
		$data['entry_description_top'] = $this->language->get('entry_description_top');
		$data['entry_description_bot'] = $this->language->get('entry_description_bot');		
	    $data['entry_status'] = $this->language->get('entry_status');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
        $data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['tab_top_link'] = $this->language->get('tab_top_link');
		$data['text_name_top_add_tabs'] = $this->language->get('text_name_top_add_tabs');
		$data['text_add_top_link'] = $this->language->get('text_add_top_link');
		$data['text_text_description'] = $this->language->get('text_text_description');
		$data['text_id_add_tabs'] = $this->language->get('text_id_add_tabs');
		$data['text_link_top'] = $this->language->get('text_link_top');
		$data['text_name_faq'] = $this->language->get('text_name_faq');
		$data['text_faicons_faq'] = $this->language->get('text_faicons_faq');
		$data['button_apply'] = $this->language->get('button_apply');

		$data['ckeditor'] = $this->config->get('config_editor_default');
		$data['lang'] = $this->language->get('lang');
		$data['token'] = $this->session->data['token'];
		
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
			'href' => $this->url->link('extension/module/aridius_faq', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/aridius_faq', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['aridius_faq_status'])) {
			$data['aridius_faq_status'] = $this->request->post['aridius_faq_status'];
		} else {
			$data['aridius_faq_status'] = $this->config->get('aridius_faq_status');
		}
	
		$data['top_links'] = array();
		if (isset($this->request->post['aridius_faq_top_links'])) {
		  $data['top_links'] = $this->request->post['aridius_faq_top_links'];
		} elseif ($this->config->get('aridius_faq_top_links')) {
		  $data['top_links'] = $this->config->get('aridius_faq_top_links');
		}
	
		if (isset($this->request->post['aridius_faq_description2'])) {
			$data['aridius_faq_description2'] = $this->request->post['aridius_faq_description2'];
		} else {
			$data['aridius_faq_description2'] = $this->config->get('aridius_faq_description2');
		}
	
		if (isset($this->request->post['aridius_faq_description'])) {
			$data['aridius_faq_description'] = $this->request->post['aridius_faq_description'];
		} else {
			$data['aridius_faq_description'] = $this->config->get('aridius_faq_description');
		}
	
		if (isset($this->request->post['aridius_faq_name'])) {
			$data['aridius_faq_name'] = $this->request->post['aridius_faq_name'];
		} else {
			$data['aridius_faq_name'] = $this->config->get('aridius_faq_name');
		}
		
		if (isset($this->request->post['aridius_faq_meta_title'])) {
			$data['aridius_faq_meta_title'] = $this->request->post['aridius_faq_meta_title'];
		} else {
			$data['aridius_faq_meta_title'] = $this->config->get('aridius_faq_meta_title');
		}
		
		if (isset($this->request->post['aridius_faq_meta_description'])) {
			$data['aridius_faq_meta_description'] = $this->request->post['aridius_faq_meta_description'];
		} else {
			$data['aridius_faq_meta_description'] = $this->config->get('aridius_faq_meta_description');
		}
		
		if (isset($this->request->post['aridius_faq_meta_keyword'])) {
			$data['aridius_faq_meta_keyword'] = $this->request->post['aridius_faq_meta_keyword'];
		} else {
			$data['aridius_faq_meta_keyword'] = $this->config->get('aridius_faq_meta_keyword');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/aridius_faq', $data));
		
	}
	
	protected function validate() {

	if (!$this->user->hasPermission('modify', 'extension/module/aridius_faq')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}

	public function install() {
		
	    // seo
		$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` (query, keyword) VALUES ('information/aridius_faq', 'faq')");

		// check aridius_faq layout name
		$sql = "SELECT layout_id FROM `" . DB_PREFIX . "layout` WHERE `name` LIKE 'Faq' LIMIT 1";

		$query_name = $this->db->query($sql);

		if ($query_name->num_rows == 0) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "layout` SET `name`= 'Faq'");
		}

		// check aridius_faq layout route by store
		$stores = array(0);

		$sql = "SELECT store_id FROM `" . DB_PREFIX . "store`";

		$query_store = $this->db->query($sql);

		foreach ($query_store->rows as $store) {
			$stores[] = $store['store_id'];
		}

		$newRoutes = array('information/aridius_faq');

		foreach ($newRoutes as $newRoute) {
			foreach ($stores as $store_id) {
				$sql = "SELECT layout_id FROM `" . DB_PREFIX . "layout_route` WHERE `store_id`= '" . (int)$store_id . "' AND `route` LIKE '" . $newRoute . "' LIMIT 1";

				$query = $this->db->query($sql);

				if ($query->num_rows == 0) {
					$this->db->query("INSERT INTO `" . DB_PREFIX . "layout_route` SET `layout_id`= (SELECT layout_id FROM `" . DB_PREFIX . "layout` WHERE `name` LIKE 'Faq' LIMIT 1), `store_id`='" . (int)$store_id . "', `route`='" . $newRoute . "'");
				}
			}
		}
	}
}