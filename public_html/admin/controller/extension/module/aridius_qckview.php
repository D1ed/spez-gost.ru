<?php
class ControllerExtensionModuleAridiusqckview extends Controller {
	
	private $error = array(); 
	
	public function index() {  
	
	    $this->load->language('extension/module/aridius_qckview');  
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');

	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('aridius_qckview', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			if (isset($this->request->post['apply'])) {
			$this->response->redirect($this->url->link('extension/module/aridius_qckview', 'token=' . $this->session->data['token'], true));
            } else {
	        $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], true));
            }
	}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
        $data['button_delete'] = $this->language->get('button_delete');
		$data['text_main_setting'] = $this->language->get('text_main_setting');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['text_show_saving'] = $this->language->get('text_show_saving');
		$data['text_show_stsale'] = $this->language->get('text_show_stsale');
		$data['text_tab_description'] = $this->language->get('text_tab_description');
		$data['text_tab_character'] = $this->language->get('text_tab_character');
		$data['text_tab_reviews'] = $this->language->get('text_tab_reviews');
		$data['text_tab_additional'] = $this->language->get('text_tab_additional');
		$data['text_button_wish'] = $this->language->get('text_button_wish');
		$data['text_button_compare'] = $this->language->get('text_button_compare');
		$data['text_rating'] = $this->language->get('text_rating');
		$data['text_short_info'] = $this->language->get('text_short_info');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_code_product'] = $this->language->get('text_code_product');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['error_warning'] = (isset($this->error['warning'])) ? $this->error['warning'] : '';

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
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
				'href' => $this->url->link('extension/module/aridius_qckview', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/aridius_qckview', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}
		
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/aridius_qckview', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/aridius_qckview', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->post['aridius_qckview_status'])) {
			$data['aridius_qckview_status'] = $this->request->post['aridius_qckview_status'];
		} else {
			$data['aridius_qckview_status'] = $this->config->get('aridius_qckview_status');
		}
			
	
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		if (isset($this->request->post['aridius_qckview_tab_description'])) {
		$data['aridius_qckview_tab_description'] = $this->request->post['aridius_qckview_tab_description'];
		} else {
		$data['aridius_qckview_tab_description'] = $this->config->get('aridius_qckview_tab_description');       
		}   
		
		if (isset($this->request->post['aridius_qckview_tab_character'])) {
		$data['aridius_qckview_tab_character'] = $this->request->post['aridius_qckview_tab_character'];
		} else {
		$data['aridius_qckview_tab_character'] = $this->config->get('aridius_qckview_tab_character');       
		}   
		
		if (isset($this->request->post['aridius_qckview_tab_reviews'])) {
		$data['aridius_qckview_tab_reviews'] = $this->request->post['aridius_qckview_tab_reviews'];
		} else {
		$data['aridius_qckview_tab_reviews'] = $this->config->get('aridius_qckview_tab_reviews');       
		}   
		
		if (isset($this->request->post['aridius_qckview_tab_additional'])) {
		$data['aridius_qckview_tab_additional'] = $this->request->post['aridius_qckview_tab_additional'];
		} else {
		$data['aridius_qckview_tab_additional'] = $this->config->get('aridius_qckview_tab_additional');       
		}   
		
		if (isset($this->request->post['aridius_qckview_button_wish'])) {
		$data['aridius_qckview_button_wish'] = $this->request->post['aridius_qckview_button_wish'];
		} else {
		$data['aridius_qckview_button_wish'] = $this->config->get('aridius_qckview_button_wish');       
		}   
		
		if (isset($this->request->post['aridius_qckview_button_compare'])) {
		$data['aridius_qckview_button_compare'] = $this->request->post['aridius_qckview_button_compare'];
		} else {
		$data['aridius_qckview_button_compare'] = $this->config->get('aridius_qckview_button_compare');       
		}   
		
		if (isset($this->request->post['aridius_qckview_rating'])) {
		$data['aridius_qckview_rating'] = $this->request->post['aridius_qckview_rating'];
		} else {
		$data['aridius_qckview_rating'] = $this->config->get('aridius_qckview_rating');       
		}   
		
		if (isset($this->request->post['aridius_qckview_short_info'])) {
		$data['aridius_qckview_short_info'] = $this->request->post['aridius_qckview_short_info'];
		} else {
		$data['aridius_qckview_short_info'] = $this->config->get('aridius_qckview_short_info');       
		}   

		if (isset($this->request->post['aridius_qckview_show_saving'])) {
		$data['aridius_qckview_show_saving'] = $this->request->post['aridius_qckview_show_saving'];
		} else {
		$data['aridius_qckview_show_saving'] = $this->config->get('aridius_qckview_show_saving');       
		}  
		if (isset($this->request->post['aridius_qckview_show_stsale'])) {
		$data['aridius_qckview_show_stsale'] = $this->request->post['aridius_qckview_show_stsale'];
		} else {
		$data['aridius_qckview_show_stsale'] = $this->config->get('aridius_qckview_show_stsale');       
		}  
		
		if (isset($this->request->post['aridius_qckview_manufacturer'])) {
		$data['aridius_qckview_manufacturer'] = $this->request->post['aridius_qckview_manufacturer'];
		} else {
		$data['aridius_qckview_manufacturer'] = $this->config->get('aridius_qckview_manufacturer');       
		}   
		
		if (isset($this->request->post['aridius_qckview_stock'])) {
		$data['aridius_qckview_stock'] = $this->request->post['aridius_qckview_stock'];
		} else {
		$data['aridius_qckview_stock'] = $this->config->get('aridius_qckview_stock');       
		}   
		
		if (isset($this->request->post['aridius_qckview_code_product'])) {
		$data['aridius_qckview_code_product'] = $this->request->post['aridius_qckview_code_product'];
		} else {
		$data['aridius_qckview_code_product'] = $this->config->get('aridius_qckview_code_product');       
		}   

		$this->response->setOutput($this->load->view('extension/module/aridius_qckview', $data));
	}

	private function validate() {
		
		if (!$this->user->hasPermission('modify', 'extension/module/aridius_qckview')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
}
