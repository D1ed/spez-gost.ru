<?php
class ControllerInformationFishlending extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));


                //Multi Fish Landing 2.3.x Begin
                $landing_id = isset($this->request->get['landing_id']) ? (int)$this->request->get['landing_id'] : 0;
                $this->load->model('extension/module/multi_fish_landing');
                $landing_info = $this->model_extension_module_multi_fish_landing->getLanding($landing_id);
                
                if (!$landing_info || !isset($landing_info['fish_singleclick_showl']) || !$landing_info['fish_singleclick_showl']) {
                    $this->response->redirect($this->url->link('error/not_found', '', 'SSL'));
                }

                $this->document->setTitle(isset($landing_info['meta_title']) && trim($landing_info['meta_title']) ? trim($landing_info['meta_title']) : $this->config->get('config_meta_title'));
                $this->document->setDescription(isset($landing_info['meta_description']) && trim($landing_info['meta_description']) ? trim($landing_info['meta_description']) : $this->config->get('config_meta_description'));
                $this->document->setKeywords(isset($landing_info['meta_keyword']) && trim($landing_info['meta_keyword']) ? trim($landing_info['meta_keyword']) : $this->config->get('config_meta_keyword'));

                //Custom CSS
                $file = 'fish_landing_custom_' . $landing_id . '.css';
                $filename = DIR_TEMPLATE . 'default/stylesheet/' . $file;

                if (is_file($filename)) {
                    $ver = date('Y.m.d.H.i.s', filemtime($filename));
                    $this->document->addStyle('catalog/view/theme/default/stylesheet/' . $file . '?v=' . $ver);
                }

                //Custom JS
                $file = 'fish_landing_custom_' . $landing_id . '.js';
                $filename = DIR_TEMPLATE . 'default/javascript/' . $file;

                if (is_file($filename)) {
                    $ver = date('Y.m.d.H.i.s', filemtime($filename));
                    $this->document->addScript('catalog/view/theme/default/javascript/' . $file . '?v=' . $ver);
                }
                //Multi Fish Landing 2.3.x End
            
			    $data['fishheader'] = $this->load->controller('common/fishheader');
                
                //Multi Fish Landing 2.3.x Begin
                //$data['fishcontent'] = $this->load->controller('extension/module/fish_singleclick/fishcontent');
                $data['fishcontent'] = $this->load->controller('extension/module/fish_singleclick/fishcontent', $landing_info);
                //Multi Fish Landing 2.3.x End
            

		$this->response->setOutput($this->load->view('information/fishlending', $data));
	}
}