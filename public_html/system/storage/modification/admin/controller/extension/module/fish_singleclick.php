<?php
class ControllerExtensionModuleFishSingleclick extends Controller {

                //Multi Fish Landing 2.3.x Begin
                private $_module_info = array();
                //Multi Fish Landing 2.3.x End
            
    private $error = array(); 
    private $_data = array(); 
    private static $VERSION = '1.0';
    private static $FILE_NAME_LIC = 'fishlending.lic';
    
    public function __construct($registry) {
        parent::__construct($registry);
        //top fish menu

        $this->load->language('extension/module/fish_singleclick');
        $this->load->model('localisation/order_status');
        $this->document->setTitle($this->language->get('heading_title'));
    }

    public function index() {   
        if (!is_file(DIR_APPLICATION . self::$FILE_NAME_LIC)) {
                $this->response->redirect($this->url->link('extension/module/fish_singleclick/lic', 'token=' . $this->session->data['token'], 'SSL'));
        }

        register_shutdown_function(array($this, 'licShutdownHandler'));
        $this->load->model('extension/module/fish_singleclick');
        $this->getSettings();

    }

    public function install() {

                //Multi Fish Landing 2.3.x Begin
                $this->load->model('extension/module/multi_fish_landing');
                $this->model_extension_module_multi_fish_landing->install();
                //Multi Fish Landing 2.3.x End
            
        $this->load->model('extension/module/fish_singleclick_install');
        $this->load->model('setting/setting');

        $this->model_extension_module_fish_singleclick_install->createTable();

        $order_statuses = $this->model_localisation_order_status->getOrderStatuses();
        $default_settings = array(
            'fish_singleclick_capcha' => '1',
            'fish_singleclick_default_order_status' => $order_statuses[0]['order_status_id'],
            'fish_singleclick_phone_mask' => ''
        );

        $this->model_setting_setting->editSetting('fish_singleclick', $default_settings);
    }

    public function uninstall() {

                //Multi Fish Landing 2.3.x Begin
                $this->load->model('extension/module/multi_fish_landing');
                $this->model_extension_module_multi_fish_landing->uninstall();
                //Multi Fish Landing 2.3.x End
            
        $this->load->model('extension/module/fish_singleclick_install');
        $this->model_extension_module_fish_singleclick_install->deleteTable();
    }

    public function delete() {
        if (!is_file(DIR_APPLICATION . self::$FILE_NAME_LIC)) {
                $this->response->redirect($this->url->link('extension/module/fish_singleclick/lic', 'token=' . $this->session->data['token'], 'SSL'));
        }

        register_shutdown_function(array($this, 'licShutdownHandler'));
        $this->load->model('extension/module/fish_singleclick');

        if (isset($this->request->post['selected']) && $this->validate()) {
            foreach ($this->request->post['selected'] as $id) {
                $this->model_extension_module_fish_singleclick->delete($id);
            }
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList'));
        }

        $this->getList();
    }

    public function update() {
        if (!is_file(DIR_APPLICATION . self::$FILE_NAME_LIC)) {
                $this->response->redirect($this->url->link('extension/module/fish_singleclick/lic', 'token=' . $this->session->data['token'], 'SSL'));
        }

        register_shutdown_function(array($this, 'licShutdownHandler'));
        $this->load->model('extension/module/fish_singleclick');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_extension_module_fish_singleclick->edit($this->request->get['id'], $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
          
            $url = '';

            if (isset($this->request->get['filter_id'])) {
              $url .= '&filter_id=' . $this->request->get['filter_id'];
            }

            if (isset($this->request->get['filter_phone'])) {
              $url .= '&filter_phone=' . $this->request->get['filter_phone'];
            }

            if (isset($this->request->get['filter_name'])) {
              $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_email'])) {
              $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
            }
                              
            if (isset($this->request->get['filter_order_status_id'])) {
              $url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
            }
            
                  
            if (isset($this->request->get['filter_date'])) {
              $url .= '&filter_date=' . $this->request->get['filter_date'];
            }
            
            if (isset($this->request->get['filter_date_modified'])) {
              $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
              
              $this->session->data['success'] = $this->language->get('text_success');
              $this->response->redirect($this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', $url));
        }

        if (isset($this->error['warning'])) {
            $this->session->data['warning'] = $this->error['warning'];
        }
          
        $this->getForm();
    }

    public function getList() {
        if (!is_file(DIR_APPLICATION . self::$FILE_NAME_LIC)) {
                $this->response->redirect($this->url->link('extension/module/fish_singleclick/lic', 'token=' . $this->session->data['token'], 'SSL'));
        }

        register_shutdown_function(array($this, 'licShutdownHandler'));
        $this->load->model('extension/module/fish_singleclick');
        $filter_id = isset($this->request->get['filter_id']) ? $this->request->get['filter_id'] : null;
        $filter_phone = isset($this->request->get['filter_phone']) ? $this->request->get['filter_phone'] : null;
        $filter_name = isset($this->request->get['filter_name']) ? $this->request->get['filter_name'] : null;
        $filter_email = isset($this->request->get['filter_email']) ? $this->request->get['filter_email'] : null;
        $filter_order_status_id = isset($this->request->get['filter_order_status_id']) ? $this->request->get['filter_order_status_id'] : null;
        $filter_date = isset($this->request->get['filter_date']) ? $this->request->get['filter_date'] : null;
        $filter_date_modified = isset($this->request->get['filter_date_modified']) ? $this->request->get['filter_date_modified'] : null;

        $sort = isset($this->request->get['sort']) ? $this->request->get['sort'] : 'id';  //'o.order_id'
        $order = isset($this->request->get['order']) ? $this->request->get['order'] : 'DESC';
        $page = isset($this->request->get['page']) ? $this->request->get['page'] : 1;

        $url = '';

        if (isset($this->request->get['filter_id'])) {
          $url .= '&filter_id=' . $this->request->get['filter_id'];
        }

        if (isset($this->request->get['filter_phone'])) {
          $url .= '&filter_phone=' . $this->request->get['filter_phone'];
        }

        if (isset($this->request->get['filter_name'])) {
          $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_email'])) {
          $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
                          
        if (isset($this->request->get['filter_order_status_id'])) {
          $url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
        }
              
        if (isset($this->request->get['filter_date'])) {
          $url .= '&filter_date=' . $this->request->get['filter_date'];
        }
        
        if (isset($this->request->get['filter_date_modified'])) {
          $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
            'text'      => $this->language->get('text_home'),
            'href'      => $this->model_extension_module_fish_singleclick->makeUrl('common/dashboard')
        );

              
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', $url)
        );

        $data['heading_title'] = $this->language->get('heading_title');
        $data['column_id'] = $this->language->get('column_id');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_email'] = $this->language->get('column_email');
        $data['column_phone'] = $this->language->get('column_phone');
        $data['column_message'] = $this->language->get('column_message');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_date'] = $this->language->get('column_date');
        $data['column_date_modified'] = $this->language->get('column_date_modified');
        $data['column_action'] = $this->language->get('column_action');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_missing'] = $this->language->get('text_missing');

        $data['button_settings'] = $this->language->get('button_settings');
        $data['button_save'] = "Export";
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_list']      = $this->language->get('button_list');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');
        $data['button_edit'] = $this->language->get('button_edit');

        $data['error_warning'] = isset($this->error['warning']) ? $this->error['warning'] : '';

        if (isset($this->session->data['success'])) {
          $data['success'] = $this->session->data['success'];
          unset($this->session->data['success']);
        } else {
          $data['success'] = '';
        }

        if (isset($this->session->data['warning'])) {
          $data['error_warning'] = $this->session->data['warning'];
          unset($this->session->data['warning']);
        } elseif (isset($this->error['warning'])) {
          $data['error_warning'] = $this->error['warning'];
        } else {
          $data['error_warning'] = '';
        }
        
        $data['settings'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick');
        $data['action']   = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick', 'export=1');
        $data['cancel']   = $this->model_extension_module_fish_singleclick->makeUrl('extension/extension', 'type=module', 'SSL');
        $data['token']    = $this->session->data['token'];


        $filter_data = array(
          'filter_id'              => $filter_id,
          'filter_phone'           => $filter_phone,
          'filter_name'            => $filter_name,
          'filter_email'           => $filter_email,
          'filter_order_status_id' => $filter_order_status_id,
          'filter_date'            => $filter_date,
          'filter_date_modified'   => $filter_date_modified,
          'sort'                   => $sort,
          'order'                  => $order,
          'start'                  => ($page - 1) * $this->config->get('config_limit_admin'),
          'limit'                  => $this->config->get('config_limit_admin')
        );

        $results_total = $this->model_extension_module_fish_singleclick->getTotalhistory($filter_data);
        $results = $this->model_extension_module_fish_singleclick->gethistory($filter_data);
        $data['histories'] = array();

        if(!empty($results)) {
            $server = defined('HTTPS_CATALOG') ? HTTPS_CATALOG : HTTP_CATALOG;

            foreach($results as $result) {
                $status = $this->model_localisation_order_status->getOrderStatus($result['order_status_id']);
                $status = isset($status['name']) ? $status['name'] : '';



                $data['histories'][] = array(
                    'id'            => $result['id'],
                    'name'          => $result['name'],
                    'email'         => $result['email'],
                    'phone'         => $result['phone'],
                    'message'       => $result['message'],
                    'status'        => $status,
                    'date'          => date('d.m.Y H:i:s', strtotime($result['date'])),
                    'date_modified' => date('d.m.Y H:i:s', strtotime($result['date_modified'])),
                    'action'        => $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/update', 'id=' . $result['id'] . $url)
                );
            }
        }
        
        $this->load->model('design/layout');
        
        $data['layouts'] = $this->model_design_layout->getLayouts();
        $data['delete'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/delete');


        $url = '';

        if (isset($this->request->get['filter_id'])) {
          $url .= '&filter_id=' . $this->request->get['filter_id'];
        }

        if (isset($this->request->get['filter_phone'])) {
          $url .= '&filter_phone=' . $this->request->get['filter_phone'];
        }

        if (isset($this->request->get['filter_name'])) {
          $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_email'])) {
          $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
                          
        if (isset($this->request->get['filter_order_status_id'])) {
          $url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
        }
        
        if (isset($this->request->get['filter_date_modified'])) {
          $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }

        $url .= $order == 'ASC' ? '&order=DESC' : '&order=ASC';

        if (isset($this->request->get['page'])) {
          $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_id'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', 'sort=id' . $url);
        $data['sort_phone'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', 'sort=phone' . $url);
        $data['sort_name'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', 'sort=name' . $url);
        $data['sort_email'] = $this->model_extension_module_fish_singleclick->makeUrl('extansion/module/fish_singleclick/getList', 'sort=email' . $url);
        $data['sort_status'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', 'sort=order_status_id' . $url);
        $data['sort_date'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', 'sort=date' . $url);
        $data['sort_date_modified'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', 'sort=date_modified' . $url);

        $url = '';

        if (isset($this->request->get['filter_id'])) {
          $url .= '&filter_id=' . $this->request->get['filter_id'];
        }

        if (isset($this->request->get['filter_phone'])) {
          $url .= '&filter_phone=' . $this->request->get['filter_phone'];
        }

        if (isset($this->request->get['filter_name'])) {
          $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_email'])) {
          $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
                          
        if (isset($this->request->get['filter_order_status_id'])) {
          $url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
        }
              
        if (isset($this->request->get['filter_date'])) {
          $url .= '&filter_date=' . $this->request->get['filter_date'];
        }
        
        if (isset($this->request->get['filter_date_modified'])) {
          $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }

        if (isset($this->request->get['sort'])) {
          $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
          $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total  = $results_total;
        $pagination->page   = $page;
        $pagination->limit  = $this->config->get('config_limit_admin');
        $pagination->text   = $this->language->get('text_pagination');
        $pagination->url    = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', $url . '&page={page}');
        $data['pagination'] = $pagination->render();

        $data['filter_id'] = $filter_id;
        $data['filter_phone'] = $filter_phone;
        $data['filter_name'] = $filter_name;
        $data['filter_email'] = $filter_email;
        $data['filter_order_status_id'] = $filter_order_status_id;
        $data['filter_date'] = $filter_date;
        $data['filter_date_modified'] = $filter_date_modified;

        $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data = array_merge($data, $this->_setData(
            array(
                 'header'       => $this->load->controller('common/header'),
                 'column_left'  => $this->load->controller('common/column_left'),
                 'footer'       => $this->load->controller('common/footer'),
            )
        ));

        $this->response->setOutput($this->load->view('extension/module/fish_singleclick_list', $data));
    }

    protected function getForm() {
        $data['heading_title']      = $this->language->get('heading_title_update');
        $data['button_settings']    = $this->language->get('button_settings');
        $data['button_save']        = $this->language->get('button_save');
        $data['button_cancel']      = $this->language->get('button_cancel');
        $data['button_list']      = $this->language->get('button_list');
        $data['entry_name']         = $this->language->get('entry_name');
        $data['entry_phone']        = $this->language->get('entry_phone');
        $data['entry_email']        = $this->language->get('entry_email');
        $data['entry_message']      = $this->language->get('entry_message');
        $data['entry_order_status'] = $this->language->get('entry_order_status');
        $data['entry_comment']      = $this->language->get('entry_comment');

        $data['error_warning'] = isset($this->error['warning']) ? $this->error['warning'] : '';
                            
        $url = '';

        if (isset($this->request->get['filter_id'])) {
          $url .= '&filter_id=' . $this->request->get['filter_id'];
        }

        if (isset($this->request->get['filter_phone'])) {
          $url .= '&filter_phone=' . $this->request->get['filter_phone'];
        }

        if (isset($this->request->get['filter_name'])) {
          $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_email'])) {
          $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }
                          
        if (isset($this->request->get['filter_order_status_id'])) {
          $url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
        }
              
        if (isset($this->request->get['filter_date'])) {
          $url .= '&filter_date=' . $this->request->get['filter_date'];
        }
        
        if (isset($this->request->get['filter_date_modified'])) {
          $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }

        if (isset($this->request->get['sort'])) {
          $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
          $url .= '&order=' . $this->request->get['order'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->model_extension_module_fish_singleclick->makeUrl('common/dashboard')
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick', $url)
        );

        if (isset($this->request->get['id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $data['settings'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick', $url);
            $data['action'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/update', 'id=' . $this->request->get['id'] . $url);
            $data['cancel'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', $url);
            $data['token'] = $this->session->data['token'];
            $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

            $history_info = $this->model_extension_module_fish_singleclick->gethistory(array('filter_id' => $this->request->get['id']));

            $data['name'] = isset($this->request->post['name']) ? $this->request->post['name'] : $history_info[0]['name'];
            $data['phone'] = isset($this->request->post['phone']) ? $this->request->post['phone'] : $history_info[0]['phone'];
            $data['email'] = isset($this->request->post['email']) ? $this->request->post['email'] : $history_info[0]['email'];
            $data['message'] = isset($this->request->post['message']) ? $this->request->post['message'] : $history_info[0]['message'];
            $data['order_status_id'] = isset($this->request->post['order_status_id']) ? $this->request->post['order_status_id'] : $history_info[0]['order_status_id'];
        } else {
            $this->response->redirect($this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', $url));
        }
        
        $data = array_merge($data, $this->_setData(
            array(
                 'header'       => $this->load->controller('common/header'),
                 'column_left'  => $this->load->controller('common/column_left'),
                 'footer'       => $this->load->controller('common/footer'),
            )
        ));

        $this->response->setOutput($this->load->view('extension/module/fish_singleclick_form', $data));
    }

    protected function getSettings() {                            
        $url = '';

        if (isset($this->request->get['filter_id'])) {
          $url .= '&filter_id=' . $this->request->get['filter_id'];
        }

        if (isset($this->request->get['filter_phone'])) {
          $url .= '&filter_phone=' . $this->request->get['filter_phone'];
        }

        if (isset($this->request->get['filter_email'])) {
          $url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_name'])) {
          $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }
                          
        if (isset($this->request->get['filter_order_status_id'])) {
          $url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
        }
   
        if (isset($this->request->get['filter_date'])) {
          $url .= '&filter_date=' . $this->request->get['filter_date'];
        }
        
        if (isset($this->request->get['filter_date_modified'])) {
          $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }

        if (isset($this->request->get['sort'])) {
          $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
          $url .= '&order=' . $this->request->get['order'];
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            
                //Multi Fish Landing 2.3.x Begin
                //$this->model_extension_module_multi_fish_singleclick->setSetting();
                $this->load->model('extension/module/multi_fish_landing');
                $this->model_extension_module_multi_fish_landing->setSetting();

                $this->session->data['success'] = $this->language->get('text_success');

                if (isset($this->request->post['buttonForm']) && ($this->request->post['buttonForm'] == 'apply')) {
                    $this->response->redirect($this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick', (isset($this->request->get['module_id']) ? 'module_id=' . $this->request->get['module_id'] : '')));
                } else {
                    $this->response->redirect($this->model_extension_module_fish_singleclick->makeUrl('extension/extension', 'type=module'));
                }
                //Multi Fish Landing 2.3.x End
            
            $this->response->redirect($this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick', $url));
        }

        $data['heading_title']      = $this->language->get('heading_title_settings');
        $data['button_save']        = $this->language->get('button_save');
        $data['button_cancel']      = $this->language->get('button_cancel');
        $data['button_list']        = $this->language->get('button_list');
        $data['text_yes']           = $this->language->get('text_yes');
        $data['text_no']            = $this->language->get('text_no');
        $data['text_missing']       = $this->language->get('text_missing');
        $data['entry_capcha']       = $this->language->get('entry_capcha');
        $data['entry_phone_mask']   = $this->language->get('entry_phone_mask');
        $data['entry_default_order_status'] = $this->language->get('entry_default_order_status');

        $data['help_capcha']        = $this->language->get('help_capcha');
        $data['help_phone_mask']    = $this->language->get('help_phone_mask');
        $data['help_default_order_status'] = $this->language->get('help_default_order_status');
        $data['placeholder_phone_mask']    = $this->language->get('placeholder_phone_mask');

        $data['button_remove']    = $this->language->get('button_remove');
        $data['entry_image']    = $this->language->get('entry_image');
        $data['entry_images']    = $this->language->get('entry_images');
        $data['entry_image60']    = $this->language->get('entry_image60');
        $data['entry_icon']    = $this->language->get('entry_icon');
        $data['entry_main']    = $this->language->get('entry_main');
        $data['entry_special']    = $this->language->get('entry_special');
        $data['entry_specialtext']    = $this->language->get('entry_specialtext');
        $data['entry_adv']    = $this->language->get('entry_adv');
        $data['entry_text']    = $this->language->get('entry_text');
        $data['entry_textslider']    = $this->language->get('entry_textslider');
        $data['entry_addtext']    = $this->language->get('entry_addtext');
        $data['entry_enabled']    = $this->language->get('entry_enabled');
        $data['entry_colorbox']    = $this->language->get('entry_colorbox');
        $data['entry_colortext']    = $this->language->get('entry_colortext');
        $data['entry_fonbox']    = $this->language->get('entry_fonbox');
        $data['entry_displayred']    = $this->language->get('entry_displayred');
        $data['entry_price']    = $this->language->get('entry_price');
        $data['entry_popaptext']    = $this->language->get('entry_popaptext');
        $data['entry_title']    = $this->language->get('entry_title');
        $data['entry_box']    = $this->language->get('entry_box');
        $data['entry_review']    = $this->language->get('entry_review');
        $data['entry_reviews']    = $this->language->get('entry_reviews');
        $data['entry_size']    = $this->language->get('entry_size');
        $data['entry_bigsize']    = $this->language->get('entry_bigsize');
        $data['entry_speed']    = $this->language->get('entry_speed');
        $data['entry_contact']    = $this->language->get('entry_contact');
        $data['entry_phone']    = $this->language->get('entry_phone');
        $data['entry_agree']    = $this->language->get('entry_agree');
        $data['entry_form']    = $this->language->get('entry_form');
        $data['entry_buyer']    = $this->language->get('entry_buyer');
        $data['entry_slider']    = $this->language->get('entry_slider');
        $data['entry_network']    = $this->language->get('entry_network');
        $data['entry_link']    = $this->language->get('entry_link');
        $data['entry_showmenu']    = $this->language->get('entry_showmenu');
        $data['entry_menu']    = $this->language->get('entry_menu');
        $data['entry_dopmenu']    = $this->language->get('entry_dopmenu');
        $data['entry_product']    = $this->language->get('entry_product');
        $data['help_product']    = $this->language->get('help_product');
        $data['entry_prod']    = $this->language->get('entry_prod');
        $data['entry_prodbd']    = $this->language->get('entry_prodbd');
        $data['entry_carousel']    = $this->language->get('entry_carousel');
        $data['entry_textblock']    = $this->language->get('entry_textblock');
        $data['entry_time']    = $this->language->get('entry_time');
        $data['entry_timer']    = $this->language->get('entry_timer');
        $data['entry_custombox']    = $this->language->get('entry_custombox');
        $data['entry_vis']    = $this->language->get('entry_vis');
        $data['entry_menush']    = $this->language->get('entry_menush');
        $data['entry_doplink']    = $this->language->get('entry_doplink');
        $data['entry_wind1']    = $this->language->get('entry_wind1');
        $data['entry_wind2']    = $this->language->get('entry_wind2');
        $data['entry_style']    = $this->language->get('entry_style');
        $data['entry_colcol']    = $this->language->get('entry_colcol');
        $data['entry_video']    = $this->language->get('entry_video');
        $data['entry_footerlink']    = $this->language->get('entry_footerlink');
        $data['entry_font1']    = $this->language->get('entry_font1');
        $data['entry_font2']    = $this->language->get('entry_font2');
        $data['entry_title2']    = $this->language->get('entry_title2');
        $data['entry_title3']    = $this->language->get('entry_title3');
        $data['entry_bodytext']    = $this->language->get('entry_bodytext');
        $data['entry_colormenu']    = $this->language->get('entry_colormenu');
        $data['entry_colormenutext']    = $this->language->get('entry_colormenutext');
        $data['entry_colorfooter']    = $this->language->get('entry_colorfooter');
        $data['entry_colorfootertext']    = $this->language->get('entry_colorfootertext');
        $data['entry_bodyfon']    = $this->language->get('entry_bodyfon');
        
        
        $data['token'] = $this->session->data['token'];
        
        $this->document->addScript('view/javascript/jscolor/jscolor.js');
        $this->document->addScript('view/javascript/jscolor/spectrum.js');
        $this->document->addStyle('view/javascript/jscolor/spectrum.css');


        $data['settings_list'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', $url);
        $data['action'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick', $url);
        $data['cancel'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/extension', 'type=module', true);
        $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        $data['error_warning'] = isset($this->error['warning']) ? $this->error['warning'] : '';
        if (isset($this->session->data['success'])) {
          $data['success'] = $this->session->data['success'];
          unset($this->session->data['success']);
        } else {
          $data['success'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->model_extension_module_fish_singleclick->makeUrl('common/dashboard')
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/getList', $url)
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title_settings'),
            'href'      => $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick', $url)
        );


        // loading languages
        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();

        
                //Multi Fish Landing 2.3.x Begin
                if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
                    $this->load->model('extension/module/multi_fish_landing');
                    $this->_module_info = $this->model_extension_module_multi_fish_landing->getLanding($this->request->get['module_id']);
                }

                $this->document->addStyle('view/javascript/shoputils/multi_fish_landing/sortable/jquery-ui-1.12.1.custom.css');
                $this->document->addScript('view/javascript/shoputils/multi_fish_landing/sortable/jquery-ui-1.12.1.custom.js');
                $this->document->addScript('view/javascript/shoputils/multi_fish_landing/sortable.js');

                $data['action'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick', isset($this->request->get['module_id']) ? 'module_id=' . $this->request->get['module_id'] : '');
                $data['cancel'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/extension', 'type=module');
                $data['module_id'] = isset($this->request->get['module_id']) ? $this->request->get['module_id'] : 0;
                $data['export_setting'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/exportSetting', 'landing_id=' . $data['module_id']);
                $data['import_setting'] = $this->model_extension_module_fish_singleclick->makeUrl('extension/module/fish_singleclick/importSetting');
                $data['button_apply'] = $this->language->get('button_apply');
                $data['button_export_setting'] = $this->language->get('button_export_setting');
                $data['button_import_setting'] = $this->language->get('button_import_setting');
                $data['text_lamer'] = $this->language->get('text_lamer');
                $data['entry_name'] = $this->language->get('entry_name');
                $data['entry_logo'] = $this->language->get('entry_logo');
                $data['entry_keyword'] = $this->language->get('entry_keyword');
                $data['help_keyword'] = $this->language->get('help_keyword');
                $data['help_url'] = isset($this->request->get['module_id']) ? sprintf($this->language->get('help_url'), HTTPS_CATALOG . 'index.php?route=information/fishlending&landing_id=' . (int)$this->request->get['module_id']) : '';
                $data['entry_meta_title'] = $this->language->get('entry_meta_title');
                $data['entry_meta_description'] = $this->language->get('entry_meta_description');
                $data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
                $data['entry_custom_css'] = $this->language->get('entry_custom_css');
                $data['help_custom_css'] = $this->language->get('help_custom_css');
                $data['entry_custom_js'] = $this->language->get('entry_custom_js');
                $data['help_custom_js'] = $this->language->get('help_custom_js');
                $data['error_name'] = isset($this->error['name']) ? $this->error['name'] : '';
                $data['error_keyword'] = isset($this->error['keyword']) ? $this->error['keyword'] : '';

                //$data = array_merge($data, $this->_updateData(
                $data = array_merge($data, $this->_updateInfo(
                //Multi Fish Landing 2.3.x End
            
            array(

                //Multi Fish Landing 2.3.x Begin
                'name',
                'land_logo',
                'keyword',
                'meta_title',
                'meta_description',
                'meta_keyword',
                'custom_css',
                'custom_js',
                //Multi Fish Landing 2.3.x End
            
                'fish_singleclick_showl',
                'fish_singleclick_style',
                'fish_singleclick_capcha',
                'fish_singleclick_default_order_status',
                'fish_singleclick_phone_mask',
                'fish_singleclick_showsale', 'fish_singleclick_showsale2',
                'fish_singleclick_colorsale', 'fish_singleclick_colorsaletext',
                'fish_singleclick_year', 'fish_singleclick_month', 'fish_singleclick_day',
                'fish_singleclick_img_sale',
                'fish_singleclick_imgfon_sale',
                'fish_singleclick_showadv',
                'fish_singleclick_img_adv',
                'fish_singleclick_coloradv',  'fish_singleclick_coloradvtext',
                'fish_singleclick_showprod',
                'fish_singleclick_img_prod',
                'fish_singleclick_colorprod', 'fish_singleclick_colorprodtext',
                'fish_singleclick_column',
                'fish_singleclick_showreview',
                'fish_singleclick_img_review',
                'fish_singleclick_colorreview', 'fish_singleclick_colorreviewtext',
                'fish_singleclick_columnreview',
                'fish_singleclick_showcarousel',
                'fish_singleclick_img_carousel',
                'fish_singleclick_colorcarousel', 'fish_singleclick_colorcarouseltext',
                'fish_singleclick_columncarousel',
                'fish_singleclick_colortextbox',
                'fish_singleclick_showcustom',
                'fish_singleclick_img_custom',
                'fish_singleclick_colorcustom', 'fish_singleclick_colorcustomtext',
                'fish_singleclick_img_iconcustom',
                'fish_singleclick_showmenu', 'fish_singleclick_showmenu2',
                'fish_singleclick_showproda',
                'fish_singleclick_colorproda', 'fish_singleclick_colorprodtexta',
                'fish_singleclick_img_proda',
                'fish_singleclick_columna',
                'fish_singleclick_product_name',
                'fish_singleclick_font1',  'fish_singleclick_font2',
                'fish_singleclick_fonth1_size', 'fish_singleclick_fonth1_weigh', 'fish_singleclick_fonth1_trans',
                'fish_singleclick_fonth2_size', 'fish_singleclick_fonth2_weigh', 'fish_singleclick_fonth2_trans',
                'fish_singleclick_fonth3_size', 'fish_singleclick_fonth3_weigh', 'fish_singleclick_fonth3_trans',
                'fish_singleclick_fontbody_size',
                'fish_singleclick_colorfooter', 'fish_singleclick_colorfootertext',
                'fish_singleclick_colormenu', 'fish_singleclick_colormenutext',
                'fish_singleclick_bodyfon',
            )
        ));

        /* regular and Google fonts array*/
        $data['fonts'] = array(
            ''                         => '- default -',
            'Arial'                    => 'Arial',
            'Verdana'                  => 'Verdana',
            'Helvetica'                => 'Helvetica',
            'Lucida Grande'            => 'Lucida Grande',
            'Trebuchet MS'             => 'Trebuchet MS',
            'Times New Roman'          => 'Times New Roman',
            'Tahoma'                   => 'Tahoma',
            'Georgia'                  => 'Georgia',
            'Calibri'                  => 'Calibri',
            'Alegreya+Sans'            =>  'Alegreya Sans',
            'Alegreya+Sans+SC'         => 'Alegreya Sans SC',
            'Alice'                    => 'Alice',
            'Andika'                   => 'Andika',
            'Anonymous+Pro'            => 'Anonymous Pro',
            'Arimo'                    => 'Arimo',
            'Arsenal'                  => 'Arsenal',
            'Bad+Script'               => 'Bad Script',
            'Comfortaa'                => 'Comfortaa',
            'Cormorant'                => 'Cormorant',
            'Cormorant+Garamond'       => 'Cormorant Garamond',
            'Cormorant+Infant'         => 'Cormorant Infant',
            'Cormorant+Sc'             => 'Cormorant SC',
            'Cormorant+Unicase'        => 'Cormorant Unicase',
            'Cousine'                  => 'Cousine',
            'Cuprum'                   => 'Cuprum',
            'Didact+Gothic'            => 'Didact Gothic',
            'EB+Garamond'              => 'EB Garamond',
            'El+Messiri'               => 'El Messiri',
            'Exo+2'                    => 'Exo 2',
            'Fira+Mono'                => 'Fira Mono',
            'Fira+Sans'                => 'Fira Sans',
            'Fira+Sans+Extra+Condensed' => 'Fira Sans Extra Condensed',
            'Fira+Sans'                => 'Fira Sans',
            'Forum'                    => 'Forum',
            'Gabriela'                 => 'Gabriela',
            'Istok+Web'                => 'Istok Web',
            'Jura'                     => 'Jura',
            'Kelly+Slab'               => 'Kelly Slab',
            'Kurale'                   => 'Kurale',
            'Ledger'                   => 'Ledger',
            'Lobster'                  => 'Lobster',
            'Lora'                     => 'Lora',
            'Marck+Script'             => 'Marck Script',
            'Marmelad'                 => 'Marmelad',
            'Merriweather'             => 'Merriweather',
            'Neucha'                   => 'Neucha',
            'Noto+Sans'                => 'Noto Sans',
            'Noto+Serif'               => 'Noto Serif',
            'Old+Standard+TT'          => 'Old Standard TT',
            'Open+Sans'                => 'Open Sans',
            'Open+Sans+Condensed'      => 'Open Sans Condensed',
            'Oranienbaum'              => 'Oranienbaum', 
            'Oswald'                   => 'Oswald',
            'Pangolin'                 => 'Pangolin',
            'Pattaya'                  => 'Pattaya',
            'Philosopher'              => 'Philosopher',
            'Play'                     => 'Play',
            'Playfair+Display'         => 'Playfair Display',
            'Playfair+Display+SC'      => 'Playfair Display SC',
            'Podkova'                  => 'Podkova', 
            'Poiret+One'               => 'Poiret One',
            'Prata'                    => 'Prata',
            'Press+Start+2P'           => 'Press Start 2P',
            'Prosto+One'               => 'Prosto One',
            'PT+Mono'                  => 'PT Mono',
            'PT+Sans'                  => 'PT Sans',
            'PT+Sans+Caption'          => 'PT Sans Caption',
            'PT+Sans+Narrow'           => 'PT Sans Narrow',
            'PT+Serif'                 => 'PT Serif',
            'PT+Serif+Caption'         => 'PT Serif Caption',
            'Roboto'                   => 'Roboto',
            'Roboto+Condensed'         => 'Roboto Condensed',
            'Roboto+Mono'              => 'Roboto Mono',
            'Roboto+Slab'              => 'Roboto Slab',
            'Rubik'                    => 'Rubik',
            'Rubik+Mono+One'           => 'Rubik Mono One',
            'Rubik+One'                => 'Rubik One',
            'Ruslan+Display'           => 'Ruslan Display',
            'Russo+One'                => 'Russo One',
            'Scada'                    => 'Scada',
            'Seymour+One'              => 'Seymour One',
            'Source+Sans+Pro'          => 'Source Sans Pro',
            'Stalinist+One'            => 'Stalinist One',
            'Tenor+Sans'               => 'Tenor Sans',
            'Tinos'                    => 'Tinos',
            'Ubuntu'                   => 'Ubuntu',
            'Ubuntu+Condensed'         => 'Ubuntu Condensed',
            'Ubuntu+Mono'              => 'Ubuntu Mono',
            'Underdog'                 => 'Underdog',
            'Yanone+Kaffeesatz'        => 'Yanone Kaffeesatz',
            'Yeseva+One'               => 'Yeseva One',
        ); 
          
          $data = array_merge($data, $this->_setData(
              array(
                   'header'       => $this->load->controller('common/header'),
                   'column_left'  => $this->load->controller('common/column_left'),
                   'footer'       => $this->load->controller('common/footer'),
              )
          ));
      
        $data['fish_singleclicks'] = array();
      
        if (isset($this->request->post['fish_singleclick'])) {
          $data['fish_singleclicks'] = $this->request->post['fish_singleclick'];
        } elseif ($this->getModuleField('fish_singleclick')) { 
          $data['fish_singleclicks'] = $this->getModuleField('fish_singleclick');
        }
        
      
        $this->load->model('tool/image');

                //Multi Fish Landing 2.3.x Begin
                $data['logo'] = is_file(DIR_IMAGE . $data['land_logo']) ? $this->model_tool_image->resize($data['land_logo'], 100, 100) : $this->model_tool_image->resize('no_image.png', 100, 100);
                //Multi Fish Landing 2.3.x End
            
        
        $data['fish_singleclick_imgs'] = array();

        if (isset($this->request->post['fish_singleclick_img'])) {
          $fish_singleclick_imgs = $this->request->post['fish_singleclick_img'];
        } elseif ($this->getModuleField('fish_singleclick_img')) { 
          $fish_singleclick_imgs =  $this->getModuleField('fish_singleclick_img');
        } else {
          $fish_singleclick_imgs = array();
        }
      
    
        foreach ($fish_singleclick_imgs as $value) {
          if (is_file(DIR_IMAGE . $value['image'])) {
            $image = $value['image'];
          } else {
            $image = 'no_image.png';
          }      
          
          $data['fish_singleclick_imgs'][] = array(
            'image'                    => $image,
            'thumb'                    => $this->model_tool_image->resize($image, 100, 100),
          );  
        } 
      
      
        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);


        if (isset($data['fish_singleclick_img_sale']) && $data['fish_singleclick_img_sale'] != "" && file_exists(DIR_IMAGE . $data['fish_singleclick_img_sale'])) {
          $data['fish_singleclick_img_salethumb'] = $this->model_tool_image->resize($data['fish_singleclick_img_sale'], 100, 100);
        } else {
          $data['fish_singleclick_img_salethumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
        
        if (isset($data['fish_singleclick_imgfon_sale']) && $data['fish_singleclick_imgfon_sale'] != "" && file_exists(DIR_IMAGE . $data['fish_singleclick_imgfon_sale'])) {
          $data['fish_singleclick_imgfon_salethumb'] = $this->model_tool_image->resize($data['fish_singleclick_imgfon_sale'], 100, 100);
        } else {
          $data['fish_singleclick_imgfon_salethumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
        
        if (isset($data['fish_singleclick_img_adv']) && $data['fish_singleclick_img_adv'] != "" && file_exists(DIR_IMAGE . $data['fish_singleclick_img_adv'])) {
          $data['fish_singleclick_img_advthumb'] = $this->model_tool_image->resize($data['fish_singleclick_img_adv'], 100, 100);
        } else {
          $data['fish_singleclick_img_advthumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
      
          $data['fish_singleclick_advs'] = array();

        if (isset($this->request->post['fish_singleclick_adv'])) {
          $fish_singleclick_advs = $this->request->post['fish_singleclick_adv'];
        } elseif ($this->getModuleField('fish_singleclick_adv')) { 
          $fish_singleclick_advs =  $this->getModuleField('fish_singleclick_adv');
        } else {
          $fish_singleclick_advs = array();
        }
      
    
        foreach ($fish_singleclick_advs as $value) {
          if (is_file(DIR_IMAGE . $value['image'])) {
            $image = $value['image'];
          } else {
            $image = 'no_image.png';
          }      
          
          $data['fish_singleclick_advs'][] = array(
            'image'                    => $image,
            'thumb'                    => $this->model_tool_image->resize($image, 100, 100),
            'text'                    => isset($value['text']) ? $value['text'] : '',
          );  
        } 
        
        if (isset($data['fish_singleclick_img_prod']) && $data['fish_singleclick_img_prod'] != "" && file_exists(DIR_IMAGE . $data['fish_singleclick_img_prod'])) {
          $data['fish_singleclick_img_prodthumb'] = $this->model_tool_image->resize($data['fish_singleclick_img_prod'], 100, 100);
        } else {
          $data['fish_singleclick_img_prodthumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
      
          $data['fish_singleclick_prods'] = array();

          if (isset($this->request->post['fish_singleclick_prod'])) {
            $fish_singleclick_prods = $this->request->post['fish_singleclick_prod'];
          } elseif ($this->getModuleField('fish_singleclick_prod')) { 
            $fish_singleclick_prods =  $this->getModuleField('fish_singleclick_prod');
          } else {
            $fish_singleclick_prods = array();
          }
      
    
        foreach ($fish_singleclick_prods as $value) {
          if (is_file(DIR_IMAGE . $value['image'])) {
            $image = $value['image'];
          } else {
            $image = 'no_image.png';
          }      
        
          $data['fish_singleclick_prods'][] = array(
            'image'                    => $image,
            'thumb'                    => $this->model_tool_image->resize($image, 100, 100),
            'text'                    => isset($value['text']) ? $value['text'] : '',
            'price'                    => isset($value['price']) ? $value['price'] : '',
            'popaptext'                    => isset($value['popaptext']) ? $value['popaptext'] : '',
          );  
      } 
      
        if (isset($data['fish_singleclick_img_proda']) && $data['fish_singleclick_img_proda'] != "" && file_exists(DIR_IMAGE . $data['fish_singleclick_img_proda'])) {
          $data['fish_singleclick_img_prodthumba'] = $this->model_tool_image->resize($data['fish_singleclick_img_proda'], 100, 100);
        } else {
          $data['fish_singleclick_img_prodthumba'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
      
        $this->load->model('catalog/product');

        $data['fish_singleclick_products'] = array();

        if (!empty($this->request->post['fish_singleclick_product'])) {
          $fish_singleclick_products = $this->request->post['fish_singleclick_product'];
        } elseif ($this->getModuleField('fish_singleclick_product')) {
          $fish_singleclick_products = $this->getModuleField('fish_singleclick_product');
        } else {
          $fish_singleclick_products = array();
        }

        foreach ($fish_singleclick_products as $product_id) {
          $product_info = $this->model_catalog_product->getProduct($product_id);

          if ($product_info) {
            $data['fish_singleclick_products'][] = array(
              'product_id' => $product_info['product_id'],
              'name'       => $product_info['name']
            );
          }
        }
      
        
      
        if (isset($data['fish_singleclick_img_box']) && $data['fish_singleclick_img_box'] != "" && file_exists(DIR_IMAGE . $data['fish_singleclick_img_box'])) {
          $data['fish_singleclick_img_boxthumb'] = $this->model_tool_image->resize($data['fish_singleclick_img_box'], 100, 100);
        } else {
          $data['fish_singleclick_img_boxthumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
      
        $data['fish_singleclick_boxs'] = array();

        if (isset($this->request->post['fish_singleclick_box'])) {
          $fish_singleclick_boxs = $this->request->post['fish_singleclick_box'];
        } elseif ($this->getModuleField('fish_singleclick_box')) { 
          $fish_singleclick_boxs =  $this->getModuleField('fish_singleclick_box');
        } else {
          $fish_singleclick_boxs = array();
        }
      
    
        foreach ($fish_singleclick_boxs as $value) {
          if (is_file(DIR_IMAGE . $value['image'])) {
            $image = $value['image'];
          } else {
            $image = 'no_image.png';
          }      
          
          $data['fish_singleclick_boxs'][] = array(
            'image'                    => $image,
            'thumb'                    => $this->model_tool_image->resize($image, 100, 100),
            'text'                    => isset($value['text']) ? $value['text'] : '',
            'mdtext'                    => isset($value['mdtext']) ? $value['mdtext'] : '',
            'smtext'                    => isset($value['smtext']) ? $value['smtext'] : '',
            'overtext'                    => isset($value['overtext']) ? $value['overtext'] : '',
          );  
        }   
    
    
    
        if (isset($data['fish_singleclick_img_review']) && $data['fish_singleclick_img_review'] != "" && file_exists(DIR_IMAGE . $data['fish_singleclick_img_review'])) {
          $data['fish_singleclick_img_reviewthumb'] = $this->model_tool_image->resize($data['fish_singleclick_img_review'], 100, 100);
        } else {
          $data['fish_singleclick_img_reviewthumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
      
        $data['fish_singleclick_reviews'] = array();

        if (isset($this->request->post['fish_singleclick_review'])) {
          $fish_singleclick_reviews = $this->request->post['fish_singleclick_review'];
        } elseif ($this->getModuleField('fish_singleclick_review')) { 
          $fish_singleclick_reviews =  $this->getModuleField('fish_singleclick_review');
        } else {
          $fish_singleclick_reviews = array();
        }
      
    
        foreach ($fish_singleclick_reviews as $value) {
          if (is_file(DIR_IMAGE . $value['image'])) {
            $image = $value['image'];
          } else {
            $image = 'no_image.png';
          }      
          
          $data['fish_singleclick_reviews'][] = array(
            'image'                    => $image,
            'thumb'                    => $this->model_tool_image->resize($image, 100, 100),
            'text'                    => isset($value['text']) ? $value['text'] : '',
            'reviewtext'                    => isset($value['reviewtext']) ? $value['reviewtext'] : '',
          );  
        } 
      
        if (isset($data['fish_singleclick_img_carousel']) && $data['fish_singleclick_img_carousel'] != "" && file_exists(DIR_IMAGE . $data['fish_singleclick_img_carousel'])) {
          $data['fish_singleclick_img_carouselthumb'] = $this->model_tool_image->resize($data['fish_singleclick_img_carousel'], 100, 100);
        } else {
          $data['fish_singleclick_img_carouselthumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
      
        $data['fish_singleclick_carousels'] = array();

        if (isset($this->request->post['fish_singleclick_carousel'])) {
          $fish_singleclick_carousels = $this->request->post['fish_singleclick_carousel'];
        } elseif ($this->getModuleField('fish_singleclick_carousel')) { 
          $fish_singleclick_carousels =  $this->getModuleField('fish_singleclick_carousel');
        } else {
          $fish_singleclick_carousels = array();
        }
      
    
        foreach ($fish_singleclick_carousels as $value) {
          if (is_file(DIR_IMAGE . $value['image'])) {
            $image = $value['image'];
          } else {
            $image = 'no_image.png';
          }      
          
          $data['fish_singleclick_carousels'][] = array(
            'image'                    => $image,
            'thumb'                    => $this->model_tool_image->resize($image, 100, 100),
            'text'                    => isset($value['text']) ? $value['text'] : '',
            'carouseltext'                    => isset($value['carouseltext']) ? $value['carouseltext'] : '',
          );  
        } 
      
        if (isset($data['fish_singleclick_img_custom']) && $data['fish_singleclick_img_custom'] != "" && file_exists(DIR_IMAGE . $data['fish_singleclick_img_custom'])) {
          $data['fish_singleclick_img_customthumb'] = $this->model_tool_image->resize($data['fish_singleclick_img_custom'], 100, 100);
        } else {
          $data['fish_singleclick_img_customthumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }    
        if (isset($data['fish_singleclick_img_iconcustom']) && $data['fish_singleclick_img_iconcustom'] != "" && file_exists(DIR_IMAGE . $data['fish_singleclick_img_iconcustom'])) {
          $data['fish_singleclick_img_iconcustomthumb'] = $this->model_tool_image->resize($data['fish_singleclick_img_iconcustom'], 100, 100);
        } else {
          $data['fish_singleclick_img_iconcustomthumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        } 
      
        $data['fish_singleclick_netws'] = array();

        if (isset($this->request->post['fish_singleclick_netw'])) {
          $fish_singleclick_netws = $this->request->post['fish_singleclick_netw'];
        } elseif ($this->getModuleField('fish_singleclick_netw')) { 
          $fish_singleclick_netws =  $this->getModuleField('fish_singleclick_netw');
        } else {
          $fish_singleclick_netws = array();
        }
      
    
        foreach ($fish_singleclick_netws as $value) {
      
          $data['fish_singleclick_netws'][] = array(
            'text'                    => isset($value['text']) ? $value['text'] : '',
            'link'                    => isset($value['link']) ? $value['link'] : '',
            'ico'                    => isset($value['ico']) ? $value['ico'] : '',
          );  
        }
      
        $data['fish_singleclick_footerlinks'] = array();

        if (isset($this->request->post['fish_singleclick_footerlink'])) {
          $fish_singleclick_footerlinks = $this->request->post['fish_singleclick_footerlink'];
        } elseif ($this->getModuleField('fish_singleclick_footerlink')) { 
          $fish_singleclick_footerlinks =  $this->getModuleField('fish_singleclick_footerlink');
        } else {
          $fish_singleclick_footerlinks = array();
        }
      
    
        foreach ($fish_singleclick_footerlinks as $value) {
      
          $data['fish_singleclick_footerlinks'][] = array(
            'text'                    => isset($value['text']) ? $value['text'] : '',
            'link'                    => isset($value['link']) ? $value['link'] : '',
            'blank'                    => isset($value['blank']) ? $value['blank'] : '',
          );  
        }

        $data['fish_singleclick_headerlinks'] = array();

        if (isset($this->request->post['fish_singleclick_headerlink'])) {
          $fish_singleclick_headerlinks = $this->request->post['fish_singleclick_headerlink'];
        } elseif ($this->getModuleField('fish_singleclick_headerlink')) { 
          $fish_singleclick_headerlinks =  $this->getModuleField('fish_singleclick_headerlink');
        } else {
          $fish_singleclick_headerlinks = array();
        }
      
    
        foreach ($fish_singleclick_headerlinks as $value) {
      
          $data['fish_singleclick_headerlinks'][] = array(
            'text'                    => isset($value['text']) ? $value['text'] : '',
            'link'                    => isset($value['link']) ? $value['link'] : '',
            'blank'                    => isset($value['blank']) ? $value['blank'] : '',
          );  
        }  
      
      

        $this->response->setOutput($this->load->view('extension/module/fish_singleclick_settings', $data));
    }

    public function lic() {
        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if (!$this->user->hasPermission('modify', 'extension/module/fish_singleclick')) {
                $this->session->data['warning'] = sprintf($this->language->get('error_permission'), $this->language->get('heading_title'));
            } elseif (!empty($this->request->post['lic_data'])) {
                if (!is_writable(DIR_APPLICATION)) {
                    $perms = fileperms(DIR_APPLICATION);
                    chmod(DIR_APPLICATION, 0777);
                }
                
                $lic = '------ LICENSE FILE DATA -------' . "\n";
                $lic .= trim($this->request->post['lic_data']) . "\n";
                $lic .= '--------------------------------' . "\n";
                $file = DIR_APPLICATION . self::$FILE_NAME_LIC;
                $handle = @fopen($file, 'w'); 
                fwrite($handle, $lic);
                fclose($handle); 
                if (isset($perms)) {
                    chmod(DIR_APPLICATION, $perms);
                }

                if (!is_file($file)) {
                    $this->session->data['warning'] = sprintf($this->language->get('error_dir_perm'), DIR_APPLICATION);
                    $this->response->redirect($this->url->link('extension/module/fish_singleclick/lic', 'token=' . $this->session->data['token'], 'SSL'));
                }

                register_shutdown_function(array($this, 'licShutdownHandler'));
                $this->load->model('extension/module/fish_singleclick');

                $this->response->redirect($this->url->link('extension/module/fish_singleclick', 'token=' . $this->session->data['token'], 'SSL'));
            }
        }

        $this->document->setTitle($this->language->get('heading_title'));

        $domain = str_replace('http://', '', HTTP_SERVER);
        $domain = explode('/', str_replace('https://', '', $domain));
        
        $loader = extension_loaded('ionCube Loader');

        $loader_min_version = '5.0';
        $loader_version = function_exists('ioncube_loader_version') ? ioncube_loader_version() : '0';
        $loader_compare = version_compare($loader_version, $loader_min_version, '>=');

        $php_min_version = '5.4';
        $php_version = phpversion();
        $php_compare = version_compare($php_version, $php_min_version, '>=');

        $data = $this->_setData(array(
            'heading_title',
            'button_save',
            'button_cancel',
            'text_ok',
            'text_error',
            'text_get_key',
            'entry_key',
            'error_key',
            'error_php_version',
            'error_loader'          => sprintf($this->language->get('error_loader'), $loader_min_version),
            'error_loader_version'  => sprintf($this->language->get('error_loader_version'), $loader_min_version),
            'error'                 => !($loader && $loader_compare && $php_compare),
            'text_domain'           => sprintf($this->language->get('text_domain'), $domain[0]),
            'text_loader'           => sprintf($this->language->get('text_loader'), $loader_version, $loader_min_version),
            'text_php'              => sprintf($this->language->get('text_php'), $php_version, $php_min_version),
            'action'                => $this->url->link('extension/module/fish_singleclick/lic', 'token=' . $this->session->data['token'], 'SSL'),
            'cancel'                => $this->url->link('extension/extension', 'type=module&token=' . $this->session->data['token'], 'SSL'),
            'loader'                => $loader,
            'icon'                  => 'view/image/iconlanding.png',
            'logo'                  => 'view/image/logolanding.png',
            'loader_compare'        => $loader_compare,
            'php_compare'           => $php_compare
        ));
        
        if (isset($this->session->data['warning'])) {
          $data['error_warning'] = $this->session->data['warning'];
          unset($this->session->data['warning']);
          if (is_file(DIR_APPLICATION . self::$FILE_NAME_LIC)) {
              @unlink(DIR_APPLICATION . self::$FILE_NAME_LIC);
          }
        } else {
          $data['error_warning'] = '';
        }

        $data = array_merge($data, $this->_setData(
            array(
                 'header'       => $this->load->controller('common/header'),
                 'column_left'  => $this->load->controller('common/column_left'),
                 'footer'       => $this->load->controller('common/footer')
            )
        ));
        
        $this->response->setOutput($this->load->view('extension/module/fish_singleclick_lic', $data));
    }


                //Multi Fish Landing 2.3.x Begin
                public function exportSetting() {
                    if ($this->user->hasPermission('modify', 'extension/module/fish_singleclick')) {
                        
                        $this->load->model('extension/module/multi_fish_landing');
                        $this->model_extension_module_multi_fish_landing->exportSettings();
                    } else {
                        $this->session->data['error'] = $this->language->get('error_permission');
                        $this->response->redirect($this->url->link('extension/module/fish_singleclick', 'token=' . $this->session->data['token'], 'SSL'));
                    }
                }

                public function importSetting() {
                    $json = array();
                          
                    if (!$this->user->hasPermission('modify', 'extension/module/fish_singleclick')) {
                        $json['error'] = $this->language->get('error_permission');
                    }
                        
                    if (!isset($json['error'])) {
                        if (!empty($this->request->files['file']['name'])) {
                            $filename = basename(html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8'));
                            
                            if (substr(strrchr($filename, '.'), 1) != 'settings') {
                                $json['error'] = $this->language->get('error_filetype');
                            }
                            
                            if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
                                $json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
                            }
                        } else {
                              $json['error'] = $this->language->get('error_upload');
                        }
                    }
                        
                    if (!isset($json['error'])) {
                        if (is_uploaded_file($this->request->files['file']['tmp_name']) && is_file($this->request->files['file']['tmp_name'])) {
                            $this->load->model('extension/module/multi_fish_landing');
                            $result = $this->model_extension_module_multi_fish_landing->importSettings(file_get_contents($this->request->files['file']['tmp_name']));
                            if ($result) {
                                $json['success'] = $this->session->data['success'] = $this->language->get('text_upload');
                            } else {
                                $json['error'] = $this->language->get('error_import');
                            }
                        } else {
                            $json['error'] = $this->language->get('error_empty');
                        }
                    }
                      
                  $this->response->addHeader('Content-Type: application/json');
                  $this->response->setOutput(json_encode($json));
                }
                //Multi Fish Landing 2.3.x End
            
    protected function validate() {
        if (!$this->model_extension_module_fish_singleclick->validatePermission()) {
            $this->error['warning'] = sprintf($this->language->get('error_permission'), $this->language->get('heading_title'));  
        }
      

                //Multi Fish Landing 2.3.x Begin
                if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
                    $this->error['name'] = $this->language->get('error_name');
                }

                if (utf8_strlen($this->request->post['keyword']) > 0) {
                    $this->load->model('catalog/url_alias');
                    $url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

                    if ($url_alias_info && isset($this->request->get['module_id']) && $url_alias_info['query'] != 'landing_id=' . $this->request->get['module_id']) {
                        $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
                    }

                    if ($url_alias_info && !isset($this->request->get['module_id'])) {
                        $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
                    }
                }
                //Multi Fish Landing 2.3.x End
            
        return !$this->error;
    }

    function licShutdownHandler() {
        if (@is_array($e = @error_get_last())) {
            $code = isset($e['type']) ? $e['type'] : 0;
            $msg = isset($e['message']) ? $e['message'] : '';
            if(($code > 0) && (strpos($msg, 'requires a license file') || strpos($msg, 'is not valid for this server'))) {
                $this->session->data['warning'] = $this->language->get('error_key');
                $this->response->redirect($this->url->link('extension/module/fish_singleclick/lic', 'token=' . $this->session->data['token'], 'SSL'));
            }
        }
    }


                //Multi Fish Landing 2.3.x Begin
                protected function _updateInfo($keys, $info = array()) {
                    $data = array();

                    foreach ($keys as $key) {
                        if (isset($this->request->post[$key])) {
                            $data[$key] = $this->request->post[$key];
                        } elseif (isset($this->_module_info[$key])) {
                            $data[$key] = $this->_module_info[$key];
                        } elseif (isset($info[$key])) {
                            $data[$key] = $info[$key];
                        } else {
                            $data[$key] = null;
                        }
                    }

                    return $data;
                }

                protected function getModuleField($field) {
                    return isset($this->_module_info[$field]) ? $this->_module_info[$field] : false;
                }
                //Multi Fish Landing 2.3.x End
            
    protected function _setData($values) {
        $data = array();
        foreach ($values as $key => $value) {
            if (is_int($key)) {
                $data[$value] = $this->language->get($value);
            } else {
                $data[$key] = $value;
            }
        }

        return $data;
    }

    protected function _updateData($keys, $info = array()) {
        $data = array();
        foreach ($keys as $key) {
            if (isset($this->request->post[$key])) {
                $data[$key] = $this->request->post[$key];
            } elseif ($this->config->get($key)) {
                $data[$key] = $this->config->get($key);
            } elseif (isset($info[$key])) {
                $data[$key] = $info[$key];
            } else {
                $data[$key] = null;
            }
        }

        return $data;
    }
}
?>