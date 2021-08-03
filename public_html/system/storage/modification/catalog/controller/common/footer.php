<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

	                $this->load->language('extension/module/aurus');	  
	  		        $data['text_footer_contacts'] = $this->language->get('text_footer_contacts');
			        $data['text_footer_aboutus'] = $this->language->get('text_footer_aboutus');
					$data['text_footer_send'] = $this->language->get('text_footer_send');
					$data['text_footer_mailtext'] = $this->language->get('text_footer_mailtext');
	                $data['language_id'] = $this->config->get('config_language_id');
					$data['aurus_map_links'] = $this->config->get('aurus_map_links');
			        $data['aurus_top_links2'] = $this->config->get('aurus_top_links2');
					$data['aurus_telephoneon_footer'] = $this->config->get('aurus_telephoneon_footer');	
					$data['aurus_telephone1on_footer'] = $this->config->get('aurus_telephone1on_footer');	
					$data['aurus_telephone2on_footer'] = $this->config->get('aurus_telephone2on_footer');	
					$data['aurus_skype_footeron'] = $this->config->get('aurus_skype_footeron');	
					$data['aurus_mail_footeron'] = $this->config->get('aurus_mail_footeron');	
					$data['aurus_addres_footeron'] = $this->config->get('aurus_addres_footeron');	
					$data['aurus_time_footeron'] = $this->config->get('aurus_time_footeron');	
                    $data['aurus_top_links3'] = $this->config->get('aurus_top_links3');
	                $data['aurus_work_time'] = $this->config->get('aurus_work_time');  
	                $data['aurus_work_time1'] = $this->config->get('aurus_work_time1');  
	                $data['aurus_work_time2'] = $this->config->get('aurus_work_time2');
					$data['aurus_address'] = $this->config->get('aurus_address');
					$data['aurus_mail_header'] = $this->config->get('aurus_mail_header');
					$data['aurus_contact_footer'] = $this->config->get('aurus_contact_footer');	
					$data['aurus_return_footer'] = $this->config->get('aurus_return_footer');	
					$data['aurus_sitemap_footer'] = $this->config->get('aurus_sitemap_footer');	
					$data['aurus_manufacturer_footer'] = $this->config->get('aurus_manufacturer_footer');	
					$data['aurus_voucher_footer'] = $this->config->get('aurus_voucher_footer');	
					$data['aurus_affiliate_footer'] = $this->config->get('aurus_affiliate_footer');	
					$data['aurus_special_footer'] = $this->config->get('aurus_special_footer');
					$data['aurus_account_footer'] = $this->config->get('aurus_account_footer');
					$data['aurus_order_footer'] = $this->config->get('aurus_order_footer');
					$data['aurus_wishlist_footer'] = $this->config->get('aurus_wishlist_footer');
					$data['aurus_newsletter_footer'] = $this->config->get('aurus_newsletter_footer');
					$data['aurus_show_fluid_map_footer'] = $this->config->get('aurus_show_fluid_map_footer');
					$data['aurus_show_map_open'] = $this->config->get('aurus_show_map_open');
					$data['aurus_longitude_fluid_map'] = $this->config->get('aurus_longitude_fluid_map');					
					$data['aurus_latitude_fluid_map'] = $this->config->get('aurus_latitude_fluid_map');
					$data['aurus_fluid_map_zoom'] = $this->config->get('aurus_fluid_map_zoom');
					$data['aurus_license_text'] = $this->config->get('aurus_license_text');
					$data['aurus_counter'] = $this->config->get('aurus_counter');
					$data['aurus_description_map_logo'] = $this->config->get('aurus_description_map_logo');
					$data['aurus_fluid_map_key'] = $this->config->get('aurus_fluid_map_key');
					$data['aurus_show_info_marker_block'] = $this->config->get('aurus_show_info_marker_block');
					$data['aurus_phone_footer'] = $this->config->get('aurus_phone_footer');
					$data['aurus_time_footer'] = $this->config->get('aurus_time_footer');
					$data['aurus_mail_footer'] = $this->config->get('aurus_mail_footer');
					$data['aurus_address_footer'] = $this->config->get('aurus_address_footer');
					$mapcode = str_replace("<iframe", "<iframe class=\"b-lazy\" style=\"width:100%; height: 330px;border:0;\"", html_entity_decode ($this->config->get('aurus_mapcode')[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8'));
					$mapcode = str_replace("frameborder=\"0\" style=\"border:0\"", "", $mapcode);
					$data['aurus_mapcode'] = str_replace("src", "data-src", $mapcode);					
                    if ($this->config->get('aurus_show_fluid_map_home')) {
					$data['class_home'] = '/';
		            } else {
					$data['class_home'] = $_SERVER['REQUEST_URI'];
					}					
					$data['aurus_map_noapi'] = $this->config->get('aurus_map_noapi');
					$data['language_code'] = $this->language->get('code');
					$data['text_map_open'] = $this->language->get('text_map_open');
					if ($this->request->server['HTTPS']) {
						$server = $this->config->get('config_ssl');
					} else {
						$server = $this->config->get('config_url');
					}
					if (is_file(DIR_IMAGE . $this->config->get('aurus_footer_imgico'))) {
						$data['map_img'] = $server . 'image/' . $this->config->get('aurus_footer_imgico');
					} else {
						$data['map_img'] = '';
					}
					if (is_file(DIR_IMAGE . $this->config->get('aurus_footer_pay'))) {
						$data['footer_pay'] = $server . 'image/' . $this->config->get('aurus_footer_pay');
					} else {
						$data['footer_pay'] = '';
					}
      

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}


         $data['content_mail'] =  $this->load->controller('common/content_mail');
		 $data['content_top3'] =  $this->load->controller('common/content_top3');
      
 
            $data['yandex_metrika']     = html_entity_decode($this->config->get('yamarket_fusion_metrika'), ENT_QUOTES, 'UTF-8');
            $data['google_analytics']     = html_entity_decode($this->config->get('yamarket_fusion_analytics'), ENT_QUOTES, 'UTF-8');
            
		return $this->load->view('common/footer', $data);
	}
}
