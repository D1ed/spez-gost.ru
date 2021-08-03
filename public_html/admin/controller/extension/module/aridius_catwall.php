<?php
class ControllerExtensionModuleAridiusCatWall extends Controller {
	
	private $error = array();

	   public function index() {

		$this->load->language('extension/module/aridius_catwall');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('aridius_catwall', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
            $this->cache->delete('product');
			$this->session->data['success'] = $this->language->get('text_success');

			if (isset($this->request->post['apply'])) {
			$this->response->redirect($this->url->link('extension/module/aridius_catwall', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true));
            } else {
	        $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
            }
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_dell'] = $this->language->get('text_dell');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_limitchild'] = $this->language->get('entry_limitchild');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_child'] = $this->language->get('entry_child');
		$data['entry_add_img'] = $this->language->get('entry_add_img');
	    $data['entry_variant'] = $this->language->get('entry_variant');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['entry_xs'] = $this->language->get('entry_xs');
		$data['entry_sm'] = $this->language->get('entry_sm');
		$data['entry_md'] = $this->language->get('entry_md');
		$data['entry_lg'] = $this->language->get('entry_lg');
		$data['entry_v1'] = $this->language->get('entry_v1');
		$data['entry_v2'] = $this->language->get('entry_v2');
		$data['entry_slides1'] = $this->language->get('entry_slides1');
		$data['entry_slides2'] = $this->language->get('entry_slides2');
		$data['entry_slides3'] = $this->language->get('entry_slides3');
		$data['entry_slides4'] = $this->language->get('entry_slides4');

		if (isset($this->error['warning'])) {
		$data['error_warning'] = $this->error['warning'];
		} else {
		$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
		$data['error_name'] = $this->error['name'];
		} else {
		$data['error_name'] = '';
		}
		
		if (isset($this->error['width'])) {
		$data['error_width'] = $this->error['width'];
		} else {
		$data['error_width'] = '';
		}

		if (isset($this->error['height'])) {
		$data['error_height'] = $this->error['height'];
		} else {
		$data['error_height'] = '';
		}
		
		if (isset($this->error['limit_child'])) {
		$data['error_limitchild'] = $this->error['limit_child'];
		} else {
		$data['error_limitchild'] = '';
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
				'href' => $this->url->link('extension/module/aridius_catwall', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/aridius_catwall', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/aridius_catwall', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/aridius_catwall', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
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

		if (isset($this->request->post['child_visible'])) {
		$data['child_visible'] = $this->request->post['child_visible'];
		} elseif (!empty($module_info)) {
		$data['child_visible'] = $module_info['child_visible'];
		} else {
		$data['child_visible'] = "1";
		}
		
		if (isset($this->request->post['variant'])) {
		$data['variant'] = $this->request->post['variant'];
		} elseif (!empty($module_info)) {
		$data['variant'] = $module_info['variant'];
		} else {
		$data['variant'] = "1";
		}

		if (isset($this->request->post['add_img'])) {
		$data['add_img'] = $this->request->post['add_img'];
		} elseif (!empty($module_info)) {
		$data['add_img'] = $module_info['add_img'];
		} else {
		$data['add_img'] = "1";
		}
		if (isset($this->request->post['width'])) {
		$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
		$data['width'] = $module_info['width'];
		} else {
		$data['width'] = 220;
		}

		if (isset($this->request->post['height'])) {
		$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
		$data['height'] = $module_info['height'];
		} else {
		$data['height'] = 130;
		}
		
		if (isset($this->request->post['limit_child'])) {
		$data['limit_child'] = $this->request->post['limit_child'];
		} elseif (!empty($module_info)) {
		$data['limit_child'] = $module_info['limit_child'];
		} else {
		$data['limit_child'] = 5;
		}

		if (isset($this->request->post['col_xs'])) {
		$data['col_xs'] = $this->request->post['col_xs'];
		} elseif (!empty($module_info)) {
		$data['col_xs'] = $module_info['col_xs'];
		} else {
		$data['col_xs'] = 1;
		}
		
		if (isset($this->request->post['col_sm'])) {
		$data['col_sm'] = $this->request->post['col_sm'];
		} elseif (!empty($module_info)) {
		$data['col_sm'] = $module_info['col_sm'];
		} else {
		$data['col_sm'] = 2;
		}

		if (isset($this->request->post['col_md'])) {
		$data['col_md'] = $this->request->post['col_md'];
		} elseif (!empty($module_info)) {
		$data['col_md'] = $module_info['col_md'];
		} else {
		$data['col_md'] = 3;
		}
		
		if (isset($this->request->post['col_lg'])) {
		$data['col_lg'] = $this->request->post['col_lg'];
		} elseif (!empty($module_info)) {
		$data['col_lg'] = $module_info['col_lg'];
		} else {
		$data['col_lg'] = 3;
		}

		if (isset($this->request->post['slides1'])) {
		$data['slides1'] = $this->request->post['slides1'];
		} elseif (!empty($module_info)) {
		$data['slides1'] = $module_info['slides1'];
		} else {
		$data['slides1'] = 2;
		}
		if (isset($this->request->post['slides2'])) {
		$data['slides2'] = $this->request->post['slides2'];
		} elseif (!empty($module_info)) {
		$data['slides2'] = $module_info['slides2'];
		} else {
		$data['slides2'] = 4;
		}
		if (isset($this->request->post['slides3'])) {
		$data['slides3'] = $this->request->post['slides3'];
		} elseif (!empty($module_info)) {
		$data['slides3'] = $module_info['slides3'];
		} else {
		$data['slides3'] = 5;
		}
		if (isset($this->request->post['slides4'])) {
		$data['slides4'] = $this->request->post['slides4'];
		} elseif (!empty($module_info)) {
		$data['slides4'] = $module_info['slides4'];
		} else {
		$data['slides4'] = 6;
		}

        $this->load->model('catalog/maincategory');
		
		$data['categories'] = $this->model_catalog_maincategory->getCategoriesByParentId(0);

		if (isset($this->request->post['aridius_catwall_cat'])) {
		$data['aridius_catwall_cat'] = $this->request->post['aridius_catwall_cat'];
		} elseif (!empty($module_info)) {
		$data['aridius_catwall_cat'] = $module_info['aridius_catwall_cat'];
		} else {
		$data['aridius_catwall_cat'] = array();
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module/aridius_catwall', $data));
		}

		protected function validate() {

		if (!$this->user->hasPermission('modify', 'extension/module/aridius_catwall')) {
		$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
		$this->error['name'] = $this->language->get('error_name');
		}
		
		if (!$this->request->post['width']) {
		$this->error['width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['height']) {
		$this->error['height'] = $this->language->get('error_height');
		}
		
		if (!$this->request->post['limit_child']) {
		$this->error['limit_child'] = $this->language->get('error_limitchild');
		}

		return !$this->error;
		}
	}