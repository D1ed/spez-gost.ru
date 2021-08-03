<?php
class ControllerExtensionModuleAridiusStoreReview extends Controller {

	public function index() {
		
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
				
		$this->load->language('extension/module/aridius_store_review');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('aridius_store_review', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
						if (isset($this->request->post['apply'])) {
			$this->response->redirect($this->url->link('extension/module/aridius_store_review', 'token=' . $this->session->data['token'], true));
            } else {
	        $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], true));
            }
		}
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['entry_review_guest'] = $this->language->get('entry_review_guest');
		$data['entry_answer_button'] = $this->language->get('entry_answer_button');
		$data['entry_average_rating'] = $this->language->get('entry_average_rating');
		$data['entry_default_rating'] = $this->language->get('entry_default_rating');
		$data['entry_limite_page'] = $this->language->get('entry_limite_page');
		$data['entry_captcha'] = $this->language->get('entry_captcha');
		$data['entry_mail'] = $this->language->get('entry_mail');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['button_store_review'] = $this->language->get('button_store_review');
		$data['text_store_review'] = $this->language->get('text_store_review');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_save'] = $this->language->get('button_save');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['button_apply'] = $this->language->get('button_apply');
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

	    if (isset($this->error['review_rating'])) {
			$data['error_default_rating'] = $this->error['review_rating'];
		} else {
			$data['error_default_rating'] = '';
		}
		
	    if (isset($this->error['review_limit'])) {
			$data['error_limite_page'] = $this->error['review_limit'];
		} else {
			$data['error_limite_page'] = '';
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
			'href' => $this->url->link('extension/module/aridius_store_review', 'token=' . $this->session->data['token'], true)
		);

		$data['store_review'] = $this->url->link('catalog/aridius_store_review', 'token=' . $this->session->data['token'], true);
		$data['action'] = $this->url->link('extension/module/aridius_store_review', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->post['aridius_store_review_review_guest'])) {
			$data['aridius_store_review_review_guest'] = $this->request->post['aridius_store_review_review_guest'];
		} else {
			$data['aridius_store_review_review_guest'] = $this->config->get('aridius_store_review_review_guest');
		}
		
		if (isset($this->request->post['aridius_store_review_display_answer_button'])) {
			$data['aridius_store_review_display_answer_button'] = $this->request->post['aridius_store_review_display_answer_button'];
		} else {
			$data['aridius_store_review_display_answer_button'] = $this->config->get('aridius_store_review_display_answer_button');
		}

		if (isset($this->request->post['aridius_store_review_display_average_rating'])) {
			$data['aridius_store_review_display_average_rating'] = $this->request->post['aridius_store_review_display_average_rating'];
		} else {
			$data['aridius_store_review_display_average_rating'] = $this->config->get('aridius_store_review_display_average_rating');
		}
		
		if (isset($this->request->post['aridius_store_review_display_captcha'])) {
			$data['aridius_store_review_display_captcha'] = $this->request->post['aridius_store_review_display_captcha'];
		} else {
			$data['aridius_store_review_display_captcha'] = $this->config->get('aridius_store_review_display_captcha');
		}
		
		if (isset($this->request->post['aridius_store_review_mail'])) {
			$data['aridius_store_review_mail'] = $this->request->post['aridius_store_review_mail'];
		} else {
			$data['aridius_store_review_mail'] = $this->config->get('aridius_store_review_mail');
		}
		
		if (isset($this->request->post['aridius_store_review_default_rating'])) {
			$data['aridius_store_review_default_rating'] = $this->request->post['aridius_store_review_default_rating'];
		} elseif ($this->config->get('aridius_store_review_default_rating')) {
			$data['aridius_store_review_default_rating'] = $this->config->get('aridius_store_review_default_rating');
		} else {
			$data['aridius_store_review_default_rating'] = 1;
		}
		
		if (isset($this->request->post['aridius_store_review_limite_page'])) {
			$data['aridius_store_review_limite_page'] = $this->request->post['aridius_store_review_limite_page'];
		} elseif ($this->config->get('aridius_store_review_limite_page')) {
			$data['aridius_store_review_limite_page'] = $this->config->get('aridius_store_review_limite_page');
		} else {
			$data['aridius_store_review_limite_page'] = 20;
		}

		if (isset($this->request->post['aridius_store_review_meta_title'])) {
			$data['aridius_store_review_meta_title'] = $this->request->post['aridius_store_review_meta_title'];
		} else {
			$data['aridius_store_review_meta_title'] = $this->config->get('aridius_store_review_meta_title');
		}
		
		if (isset($this->request->post['aridius_store_review_meta_description'])) {
			$data['aridius_store_review_meta_description'] = $this->request->post['aridius_store_review_meta_description'];
		} else {
			$data['aridius_store_review_meta_description'] = $this->config->get('aridius_store_review_meta_description');
		}
		
		if (isset($this->request->post['aridius_store_review_meta_keyword'])) {
			$data['aridius_store_review_meta_keyword'] = $this->request->post['aridius_store_review_meta_keyword'];
		} else {
			$data['aridius_store_review_meta_keyword'] = $this->config->get('aridius_store_review_meta_keyword');
		}
		
		if (isset($this->request->post['aridius_store_review_status'])) {
			$data['aridius_store_review_status'] = $this->request->post['aridius_store_review_status'];
		} else {
			$data['aridius_store_review_status'] = $this->config->get('aridius_store_review_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/aridius_store_review', $data));
		
		}
		
	protected function validate() {
		
		if (!$this->user->hasPermission('modify', 'extension/module/aridius_store_review')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['aridius_store_review_default_rating']) {
			$this->error['review_rating'] = $this->language->get('error_rating');
		}
		
		if (!$this->request->post['aridius_store_review_limite_page']) {
			$this->error['review_limit'] = $this->language->get('error_limite');
		}

		return !$this->error;
	}
	
	public function install() {
		
		// create aridius_review table
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "aridius_review_store`");
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "aridius_review_store` (`review_id` int(11) NOT NULL AUTO_INCREMENT, `parent` int(11) NOT NULL, `customer_id` int(11) NOT NULL, `author` varchar(64) NOT NULL, `text` text NOT NULL, `rating` int(1) NOT NULL, `status` tinyint(1) NOT NULL DEFAULT '0', `date_added` datetime NOT NULL, `date_modified` datetime NOT NULL, PRIMARY KEY (`review_id`)) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");
	    
		// seo
		$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` (query, keyword) VALUES ('extension/module/aridius_store_review', 'review')");

		// check aridius_faq layout name
		$sql = "SELECT layout_id FROM `" . DB_PREFIX . "layout` WHERE `name` LIKE 'Review' LIMIT 1";

		$query_name = $this->db->query($sql);

		if ($query_name->num_rows == 0) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "layout` SET `name`= 'Review'");
		}

		// check aridius_faq layout route by store
		$stores = array(0);

		$sql = "SELECT store_id FROM `" . DB_PREFIX . "store`";

		$query_store = $this->db->query($sql);

		foreach ($query_store->rows as $store) {
			$stores[] = $store['store_id'];
		}

		$newRoutes = array('extension/module/aridius_store_review');

		foreach ($newRoutes as $newRoute) {
			foreach ($stores as $store_id) {
				$sql = "SELECT layout_id FROM `" . DB_PREFIX . "layout_route` WHERE `store_id`= '" . (int)$store_id . "' AND `route` LIKE '" . $newRoute . "' LIMIT 1";

				$query = $this->db->query($sql);

				if ($query->num_rows == 0) {
					$this->db->query("INSERT INTO `" . DB_PREFIX . "layout_route` SET `layout_id`= (SELECT layout_id FROM `" . DB_PREFIX . "layout` WHERE `name` LIKE 'Review' LIMIT 1), `store_id`='" . (int)$store_id . "', `route`='" . $newRoute . "'");
				}
			}
		}
	}
}