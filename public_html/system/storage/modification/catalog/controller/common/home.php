<?php
class ControllerCommonHome extends Controller {
	public function index() {

			$fx_migrate = (float)VERSION < 2.3 ? 'module/fx_migrate' : 'extension/module/fx_migrate';
			$this->load->controller($fx_migrate.'/home'); // FX Migrate&Redirects
			
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

	 				$data['text_show_desc'] = $this->language->get('text_show_desc');
			        $data['text_hide_desc'] = $this->language->get('text_hide_desc');
					$data['content_top1'] =  $this->load->controller('common/content_top1');
                    $data['content_top2'] =  $this->load->controller('common/content_top2');
                    $data['content_bot1'] =  $this->load->controller('common/content_bot1');
                    $data['content_bot2'] =  $this->load->controller('common/content_bot2');
                    $data['content_bot3'] =  $this->load->controller('common/content_bot3');
                    $data['content_fluid'] =  $this->load->controller('common/content_fluid');
                    $data['content_slleft'] =  $this->load->controller('common/content_slleft');
                    $data['content_slrig1'] =  $this->load->controller('common/content_slrig1');
                    $data['content_slrig2'] =  $this->load->controller('common/content_slrig2');
					$data['aurus_banners'] = $this->config->get('aurus_banners');
                    $data['aurus_banners_hiddensm'] = $this->config->get('aurus_banners_hiddensm');	
                    $data['aurus_banners_fluid'] = $this->config->get('aurus_banners_fluid');
      

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
