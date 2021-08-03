<?php
class ControllerCatalogAridiusfastorder extends Controller {
	
	private $error = array();

	public function index() {
		
		$this->language->load('extension/catalog/aridiusfastorder');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/aridiusfastorder');

		$this->getList();
	}
	
	public function edit() {
		
		$this->load->language('user/user');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/aridiusfastorder');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_aridiusfastorder->editOrder($this->request->get['order_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		
		$this->language->load('catalog/aridiusfastorder');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/aridiusfastorder');

		if ((isset($this->request->post['selected']) || isset($this->request->get['order_id'])) && ($this->validateDelete())) {
			if (isset($this->request->get['order_id'])) {
				$this->model_catalog_aridiusfastorder->deleteOrder($this->request->get['order_id']);
			} else {
				foreach ($this->request->post['selected'] as $order_id) {
					$this->model_catalog_aridiusfastorder->deleteOrder($order_id);
				}
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_order_id'])) {
				$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
			}
				if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . $this->request->get['filter_email'];
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['filter_contact'])) {
				$url .= '&filter_contact=' . urlencode(html_entity_decode($this->request->get['filter_contact'], ENT_QUOTES, 'UTF-8'));
			}
			
		    if (isset($this->request->get['filter_firstname'])) {
				$url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_product_name'])) {
				$url .= '&filter_product_name=' . urlencode(html_entity_decode($this->request->get['filter_product_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
			
			$this->response->redirect($this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		
		$data=array();
		
		$data['heading_title'] = $this->language->get('heading_title');

		$url = '';

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}
			if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}
		
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
		
		if (isset($this->request->get['filter_contact'])) {
			$url .= '&filter_contact=' . urlencode(html_entity_decode($this->request->get['filter_contact'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_firstname'])) {
			$url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_product_name'])) {
			$url .= '&filter_product_name=' . urlencode(html_entity_decode($this->request->get['filter_product_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
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
			'href' => $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'], true)
		);

		$data['cancel'] = $this->url->link('extension/extension/module/aridiusfastorder', 'token=' . $this->session->data['token'], true);
		$data['token'] = $this->session->data['token'];

		$data['module_install'] = $this->model_catalog_aridiusfastorder->tableExists();

		if ($data['module_install']) {
			if (isset($this->request->get['filter_order_id'])) {
				$filter_order_id = $this->request->get['filter_order_id'];
			} else {
				$filter_order_id = null;
	    }

		if (isset($this->request->get['filter_status'])) {
				$filter_status = $this->request->get['filter_status'];
			} else {
				$filter_status = null;
		}
			
		if (isset($this->request->get['filter_email'])) {
				$filter_email = $this->request->get['filter_email'];
			} else {
				$filter_email = null;
		}

		if (isset($this->request->get['filter_contact'])) {
				$filter_contact = $this->request->get['filter_contact'];
			} else {
				$filter_contact = null;
		}
		if (isset($this->request->get['filter_firstname'])) {
				$filter_firstname = $this->request->get['filter_firstname'];
			} else {
				$filter_firstname = null;
		}
		if (isset($this->request->get['filter_product_name'])) {
				$filter_product_name = $this->request->get['filter_product_name'];
			} else {
				$filter_product_name = null;
		}

		if (isset($this->request->get['filter_total'])) {
				$filter_total = $this->request->get['filter_total'];
			} else {
				$filter_total = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
				$filter_date_added = $this->request->get['filter_date_added'];
			} else {
				$filter_date_added = null;
		}

		if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
			} else {
				$sort = 'order_id';
		}

		if (isset($this->request->get['order'])) {
				$order = $this->request->get['order'];
			} else {
				$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

			$data['delete'] = $this->url->link('catalog/aridiusfastorder/delete', 'token=' . $this->session->data['token'] . $url, true);

			$data['orders'] = array();

			$data_filter = array(
				'filter_order_id' => $filter_order_id,
				'filter_status' => $filter_status,
				'filter_email' => $filter_email,
				'filter_contact' => $filter_contact,
				'filter_firstname' => $filter_firstname,
				'filter_product_name' => $filter_product_name,
				'filter_total' => $filter_total,
				'filter_date_added' => $filter_date_added,
				'sort' => $sort,
				'order' => $order,
				'start' 	=> ($page - 1) * $this->config->get('config_limit_admin'),
				'limit' => $this->config->get('config_limit_admin')
			);

			$order_total = $this->model_catalog_aridiusfastorder->getTotalOrders($data_filter);
			$results = $this->model_catalog_aridiusfastorder->getOrders($data_filter);

			foreach ($results as $result) {
				$action = array();

				$url .= '&order_id=' . $result['order_id'];

				$action[] = array(
					'text' => $this->language->get('button_delete'),
					'href' => $this->url->link('catalog/aridiusfastorder/delete', 'token=' . $this->session->data['token'] . $url, true),
				);

				$data['orders'][] = array(
					'order_id' => $result['order_id'],
					'contact' => $result['contact'],
                    'firstname' => $result['firstname'],				
                    'comment' => $result['comment'],
					'email' => $result['email'],
                    'comment_manager' => $result['comment_manager'],					
                    'quantity' => $result['quantity'],	
                    'status' => $result['status'],	
					'product_name' => $result['product_name'],
					'format_option' => $result['format_option'],
					'product_href' => $this->url->link('catalog/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $result['product_id'] . $url, true),
					'total' => round($result['total'], 2),
					'currency_code' => $result['currency_code'],
					'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'selected' => isset($this->request->post['selected']) && in_array($result['order_id'], $this->request->post['selected']),
					'action' => $action,
	                'edit'       => $this->url->link('catalog/aridiusfastorder/edit', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] . $url, true)				
				);
			}

			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_order_id'] = $this->language->get('text_order_id');
			$data['text_contact'] = $this->language->get('text_contact');
            $data['text_firstname'] = $this->language->get('text_firstname');
            $data['text_comment'] = $this->language->get('text_comment');
			$data['text_comment_manager'] = $this->language->get('text_comment_manager');
            $data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_product_name'] = $this->language->get('text_product_name');
			$data['text_product_option'] = $this->language->get('text_product_option');
			$data['text_total'] = $this->language->get('text_total');
			$data['text_date_added'] = $this->language->get('text_date_added');
			$data['button_module'] = $this->language->get('button_module');
			$data['title_edit'] = $this->language->get('title_edit');
			$data['text_status'] = $this->language->get('text_status');
			$data['text_wait'] = $this->language->get('text_wait');
			$data['text_email'] = $this->language->get('text_email');
			$data['text_complete'] = $this->language->get('text_complete');
			$data['text_action'] = $this->language->get('text_action');
			$data['button_delete'] = $this->language->get('button_delete');
			$data['button_filter'] = $this->language->get('button_filter');

			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
			} else {
				$data['error_warning'] = '';
			}

			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$data['success'] = '';
			}

			$url = '';

			if (isset($this->request->get['filter_order_id'])) {
				$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
			}
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
				if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . $this->request->get['filter_email'];
			}
			if (isset($this->request->get['filter_contact'])) {
				$url .= '&filter_contact=' . urlencode(html_entity_decode($this->request->get['filter_contact'], ENT_QUOTES, 'UTF-8'));
			}
			if (isset($this->request->get['filter_firstname'])) {
				$url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
			}
			if (isset($this->request->get['filter_product_name'])) {
				$url .= '&filter_product_name=' . urlencode(html_entity_decode($this->request->get['filter_product_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if ($order == 'ASC') {
				$url .= '&order=DESC';
			} else {
				$url .= '&order=ASC';
			}

	        if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		    }

			$data['sort_order'] = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . '&sort=order_id' . $url, true);
			$data['sort_status'] = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . '&sort=status' . $url, true);
			$data['sort_email'] = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . '&sort=email' . $url, true);
			$data['sort_contact'] = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . '&sort=contact' . $url, true);
	    	$data['sort_firstname'] = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . '&sort=firstname' . $url, true);	
	        $data['sort_comment'] = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . '&sort=comment' . $url, true);	
            $data['sort_quantity'] = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . '&sort=quantity' . $url, true);	
			$data['sort_product_name'] = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . '&sort=product_name' . $url, true);
			$data['sort_total'] = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . '&sort=total' . $url, true);
			$data['sort_date_added'] = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, true);

			$url = '';

			if (isset($this->request->get['filter_order_id'])) {
				$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
			}
			
	        if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			   if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . $this->request->get['filter_email'];
			}
			
			if (isset($this->request->get['filter_contact'])) {
				$url .= '&filter_contact=' . urlencode(html_entity_decode($this->request->get['filter_contact'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_firstname'])) {
				$url .= '&filter_firstname=' . urlencode(html_entity_decode($this->request->get['filter_firstname'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_product_name'])) {
				$url .= '&filter_product_name=' . urlencode(html_entity_decode($this->request->get['filter_product_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

		    $pagination = new Pagination();
		    $pagination->total = $order_total;
	    	$pagination->page = $page;
	     	$pagination->limit = $this->config->get('config_limit_admin');
		    $pagination->text = $this->language->get('text_pagination');
		    $pagination->url = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);
	    	$data['pagination'] = $pagination->render();
            $data['results'] = sprintf($this->language->get('text_pagination'), ($order_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($order_total - $this->config->get('config_limit_admin'))) ? $order_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $order_total, ceil($order_total / $this->config->get('config_limit_admin')));
	     	$data['sort'] = $sort;
		    $data['order'] = $order;
			$data['filter_order_id'] = $filter_order_id;
			$data['filter_status'] = $filter_status;
			$data['filter_email'] = $filter_email;
			$data['filter_contact'] = $filter_contact;
			$data['filter_firstname'] = $filter_firstname;
			$data['filter_product_name'] = $filter_product_name;
			$data['filter_total'] = $filter_total;
			$data['filter_date_added'] = $filter_date_added;

		} else {
			$data['text_module_not_exists'] = $this->language->get('text_module_not_exists');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/aridiusfastorder_list', $data));
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_product_name'])) {
			$this->load->model('catalog/product');

			if (isset($this->request->get['filter_product_name'])) {
				$filter_name = $this->request->get['filter_product_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];	
			} else {
				$limit = 5;	
			}			

			$data = array(
				'filter_name'  => $filter_name,
				'start'        => 0,
				'limit'        => $limit
			);

			$results = $this->model_catalog_product->getProducts($data);

			foreach ($results as $result) {
				$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	protected function getForm() {
		$this->language->load('catalog/aridiusfastorder');	
		$data['heading_title'] = $this->language->get('heading_title');
	    $data['text_firstname'] = $this->language->get('text_firstname');
        $data['text_contact'] = $this->language->get('text_contact');
        $data['text_comment'] = $this->language->get('text_comment');
		$data['text_status'] = $this->language->get('text_status');
		$data['text_wait'] = $this->language->get('text_wait');
		$data['text_complete'] = $this->language->get('text_complete');
		$data['text_email'] = $this->language->get('text_email');
		$data['button_module'] = $this->language->get('button_module');
		$data['button_save'] = $this->language->get('button_save');
		
		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['contact'])) {
			$data['error_contact'] = $this->error['contact'];
		} else {
			$data['error_contact'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['action'] = $this->url->link('catalog/aridiusfastorder/edit', 'token=' . $this->session->data['token'] . '&order_id=' . $this->request->get['order_id'] . $url, true);
		$data['cancel'] = $this->url->link('catalog/aridiusfastorder', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['order_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$order_info = $this->model_catalog_aridiusfastorder->getOrder($this->request->get['order_id']);
		}

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} elseif (!empty($order_info)) {
			$data['firstname'] = $order_info['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['contact'])) {
			$data['contact'] = $this->request->post['contact'];
		} elseif (!empty($order_info)) {
			$data['contact'] = $order_info['contact'];
		} else {
			$data['contact'] = '';
		}
		
		if (isset($this->request->post['comment_manager'])) {
			$data['comment_manager'] = $this->request->post['comment_manager'];
		} elseif (!empty($order_info)) {
			$data['comment_manager'] = $order_info['comment_manager'];
		} else {
			$data['comment_manager'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($order_info)) {
			$data['status'] = $order_info['status'];
		} else {
			$data['status'] = '';
		}
		
		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($order_info)) {
			$data['email'] = $order_info['email'];
		} else {
			$data['email'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/aridiusfastorder_form.tpl', $data));
	}

	protected function validateForm() {
		
		$this->language->load('catalog/aridiusfastorder');
		if (!$this->user->hasPermission('modify', 'catalog/aridiusfastorder')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}


		return !$this->error;
	}

	protected function validateDelete() {
		
		if (!$this->user->hasPermission('modify', 'catalog/aridiusfastorder')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}

