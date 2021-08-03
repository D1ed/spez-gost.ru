<?php

class ControllerExtensionModuleoptionasalink extends Controller
{

    private $error = array();
    
    public function install()
    {
        $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value` ADD `link` int(11) NULL");
    }
    
    public function uninstall()
    {
        $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value` DROP `link` ");
    }

    public function index()
    {
        $this->load->language('extension/module/optionasalink');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            
            $this->model_setting_setting->editSetting('module_optionasalink', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
        }

        $language = $this->language->all();
        
        foreach ($language as $key => $value) {
            $data[$key] = $value;
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
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/optionasalink', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('extension/module/optionasalink', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true);

             
        if (isset($this->request->post['module_optionasalink_status'])) {
            $data['module_optionasalink_status'] = $this->request->post['module_optionasalink_status'];
        } else {
            $data['module_optionasalink_status'] = $this->config->get('module_optionasalink_status');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/optionasalink', $data));
    }

    protected function validate()
    {
        if (! $this->user->hasPermission('modify', 'extension/module/optionasalink')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return ! $this->error;
    }
}
