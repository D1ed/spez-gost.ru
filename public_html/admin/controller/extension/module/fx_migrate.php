<?php

class ControllerExtensionModuleFXMigrate extends Controller {

    private $error = array();

    public function index() {
		if (((float)VERSION < 2) || ((float)VERSION > 2.1) ){ 
			$this->load->language('extension/module/fx_migrate');
		} elseif((float)VERSION < 2.2) {
			$this->language->load('extension/module/fx_migrate');
		}
		
        $this->document->setTitle('FX Redirect&Migrate Manager');
        
        $this->load->model('setting/setting');
		
		$file = DIR_CONFIG.'redirects_list.ini';
        
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$post = $this->request->post;
			
			
		    	if (!empty($post['fx_migrate_file_list'])) {
				file_put_contents($file, $post['fx_migrate_file_list']);
			}
					
			
			unset($post['fx_migrate_file_list']);
			//echo $save_to_file;
			
			
        	$this->model_setting_setting->editSetting('fx_migrate', $post);
			
        	$this->session->data['success'] = $this->language->get('text_success');
			if ((float)VERSION < 1.9){ 
				$this->redirect($this->url->link('extension/module/fx_migrate', 'token=' . $this->session->data['token'], 'SSL'));
			} else if ((float)VERSION < 2.3){ 
				$this->response->redirect($this->url->link('extension/module/fx_migrate', 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->response->redirect($this->url->link('extension/module/fx_migrate', 'token=' . $this->session->data['token'], 'SSL'));
			}
        }
        
        
        $text_strings = array(
            'heading_title',
            'text_edit',
        	'text_no',
        	'text_yes',
         );
		 
        foreach ($text_strings as $text) {
            $data[$text] = $this->language->get($text);
        }
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

        $data['token'] = $this->session->data['token'];

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => '/admin/?token=' . $this->session->data['token'],
        );
		
		if ((float)VERSION < 2.3){ 
			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			);
			$data['breadcrumbs'][] = array(
				'text'      => 'FX Redirect&Migrate Manager',
				'href'      => $this->url->link('extension/module/fx_migrate', 'token=' . $this->session->data['token'], 'SSL'),
			);
			
			$data['kley_url'] = str_replace('&amp;', '&',$this->url->link('extension/module/fx_migrate', 'token=' . $this->session->data['token'], 'SSL'));
		} else if ((float)VERSION == 2.3) {
			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
			);
			$data['breadcrumbs'][] = array(
				'text'      => 'FX Redirect&Migrate Manager',
				'href'      => $this->url->link('extension/module/fx_migrate', 'token=' . $this->session->data['token'], 'SSL'),
			);
			$data['kley_url'] = str_replace('&amp;', '&',$this->url->link('extension/module/fx_migrate', 'token=' . $this->session->data['token'], 'SSL'));	
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_extension'),
				'href' => $this->url->link('marketplace/extension', 'token=' . $this->session->data['user_token'] . '&type=module', true)
			);
			$data['breadcrumbs'][] = array(
				'text'      => 'FX Redirect&Migrate Manager',
				'href'      => $this->url->link('extension/module/fx_migrate', 'token=' . $this->session->data['token'], 'SSL'),
			);
			$data['kley_url'] = str_replace('&amp;', '&',$this->url->link('extension/module/fx_migrate', 'token=' . $this->session->data['token'], 'SSL'));	
		}
			
		$data['action'] = $this->url->link('extension/module/fx_migrate', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		
		if ((float)VERSION >= 2.3){ 
			$data['action'] = $this->url->link('extension/module/fx_migrate', 'token=' . $this->session->data['token'], 'SSL');
			$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');
		}
		
		
		$file_list = '';
		
		if (file_exists($file)) $file_list = /*json_decode(PHP_EOL, */file_get_contents($file)/*, true)*/;
		
		
    	if (isset($this->request->post['fx_migrate_on'])) {
			$data['fx_migrate_on'] = $this->request->post['fx_migrate_on'];
		} else if($this->config->get('fx_migrate_on') !== null) {
			$data['fx_migrate_on'] = $this->config->get('fx_migrate_on');
		} else {
        	$data['fx_migrate_on'] = '';
        }
		
    	if (isset($this->request->post['fx_migrate_test'])) {
			$data['fx_migrate_test'] = $this->request->post['fx_migrate_test'];
		} else if($this->config->get('fx_migrate_test') !== null) {
			$data['fx_migrate_test'] = $this->config->get('fx_migrate_test');
		} else {
        	$data['fx_migrate_test'] = '';
        }
		
    	if (isset($this->request->post['fx_migrate_config_list'])) {
			$data['fx_migrate_config_list'] = $this->request->post['fx_migrate_config_list'];
		} else if($this->config->get('fx_migrate_config_list') !== null) {
			$data['fx_migrate_config_list'] = $this->config->get('fx_migrate_config_list');
		} else {
        	$data['fx_migrate_config_list'] = '';
        }
		
    	if (!empty($file_list)) {
			$data['fx_migrate_file_list'] = $file_list;
		} else {
        	$data['fx_migrate_file_list'] = '';
        }
		
    	if (isset($this->request->post['fx_migrate_smart'])) {
			$data['fx_migrate_smart'] = $this->request->post['fx_migrate_smart'];
		} else if($this->config->get('fx_migrate_smart') !== null) {
			$data['fx_migrate_smart'] = $this->config->get('fx_migrate_smart');
		} else {
        	$data['fx_migrate_smart'] = 0;
        }
		
		
		
		if ((float)VERSION < 2) { 
			$this->data = $this->data + $data;
			$this->load->model('design/layout');
			
			$this->data['layouts'] = $this->model_design_layout->getLayouts();

			$this->template = 'extension/module/fx_migrate.tpl';
			$this->children = array(
				'common/header',
				'common/footer'
			);
					
			$this->response->setOutput($this->render());
		} else if ((float)VERSION < 3) {
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');

			$this->response->setOutput($this->load->view('extension/module/fx_migrate.tpl', $data));
		} else {
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');

			$this->response->setOutput($this->load->view('extension/module/fx_migrate', $data));
		}
		
    }
    

    protected function md6() {
		list($a,$b)=explode('.',strrev($this->request->server['HTTP_HOST']));
		$phh = md5(preg_replace('/[^a-zA-Zа-яА-Я0-9]/ui', '',$a.$b.date('m')));
		return $phh;
	}
    

    protected function valideit() {
    	if (!isset($this->request->get['kley'])) {
			$this->error['warning'] = $this->language->get('error_permission');
		} else {
			if ($this->request->get['kley'] != $this->md6()){
				$this->error['warning'] = $this->language->get('error_permission');
			}
		}
		

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}

    protected function validate() {
    	if (!$this->user->hasPermission('modify', 'extension/module/fx_migrate')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
    public function fix() {
    	if (isset($this->request->get['kley']) && $this->valideit()) {
			
			$this->load->model('setting/setting');
        
			$this->model_setting_setting->editSetting('fx', array('fx_kley' => $this->request->get['kley']));

			return '000000'; 
		}
	}

}
