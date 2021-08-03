<?php
class ControllerExtensionModuleAridiusundersell extends Controller {
	
	public function index() {
		
		if ($this->config->get('aridiusundersell_status')) {
			$this->language->load('extension/module/aridiusundersell');
			$data['button_title'] = $this->language->get('button_title');
			$data['text_loading'] = $this->language->get('text_loading');
		}
	}

	public function success() {
		
	$this->language->load('extension/module/aridiusundersell');
	
	$data['heading_title'] = $this->language->get('heading_title');
	$data['language_id'] = $this->config->get('config_language_id');
    $data['aridiusundersell_description2'] = $this->config->get('aridiusundersell_description2');

	$this->response->setOutput($this->load->view('extension/module/aridiusundersell_success', $data));
	
    }
	
	public function getForm() {
		
		$this->load->model('catalog/product');

		$this->language->load('extension/module/aridiusundersell');
	    $this->load->language('product/product');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['button_send'] = $this->language->get('button_send');
		$data['enter_phone'] = $this->language->get('enter_phone');
	    $data['enter_firstname'] = $this->language->get('enter_firstname');
		$data['enter_email'] = $this->language->get('enter_email');
	    $data['enter_comment'] = $this->language->get('enter_comment');	
		$data['enter_link'] = $this->language->get('enter_link');	
	    $data['enter_load'] = $this->language->get('enter_load');		
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_discount'] = $this->language->get('text_discount');
		$data['language_id'] = $this->config->get('config_language_id');		
        $data['aridiusundersell_descriptionshow'] = $this->config->get('aridiusundersell_descriptionshow');
        $data['aridiusundersell_adddescriptionshow'] = $this->config->get('aridiusundersell_adddescriptionshow');
        $data['aridiusundersell_img'] = $this->config->get('aridiusundersell_img');
        $data['aridiusundersell_price'] = $this->config->get('aridiusundersell_price');
		$data['aridiusundersell_placeholdertell'] = $this->config->get('aridiusundersell_placeholdertell');
        $data['aridiusundersell_placeholderfirstname'] = $this->config->get('aridiusundersell_placeholderfirstname');
        $data['aridiusundersell_placeholderemail'] = $this->config->get('aridiusundersell_placeholderemail');
		$data['aridiusundersell_placeholderlink'] = $this->config->get('aridiusundersell_placeholderlink');
        $data['aridiusundersell_placeholdercomment'] = $this->config->get('aridiusundersell_placeholdercomment');
		$data['aridiusundersell_placeholdercomment'] = $this->config->get('aridiusundersell_placeholdercomment');
        $data['aridiusundersell_mask'] = $this->config->get('aridiusundersell_mask');
        $data['aridiusundersell_emailvalid'] = $this->config->get('aridiusundersell_emailvalid');
		$data['aridiusundersell_linkvalid'] = $this->config->get('aridiusundersell_linkvalid');
        $data['aridiusundersell_firstnamevalid'] = $this->config->get('aridiusundersell_firstnamevalid');
        $data['aridiusundersell_firstnameshow'] = $this->config->get('aridiusundersell_firstnameshow');
        $data['aridiusundersell_emailshow'] = $this->config->get('aridiusundersell_emailshow');
		$data['aridiusundersell_linkshow'] = $this->config->get('aridiusundersell_linkshow');
        $data['aridiusundersell_commentshow'] = $this->config->get('aridiusundersell_commentshow');
        $data['aridiusundersell_description'] = $this->config->get('aridiusundersell_description');
        $data['aridiusundersell_description2'] = $this->config->get('aridiusundersell_description2');
		$product_info = $this->model_catalog_product->getProduct($this->request->get['product_id']);

		$data['product_name']=$product_info['name'];

		$data['product_description'] = utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0,$this->config->get('aridiusundersell_descchar')) . '...';		
		
		$currency_code = !empty($this->session->data['currency']) ? $this->session->data['currency'] : $this->config->get('config_currency');
		
		$formated_special=str_replace($this->currency->getSymbolRight($currency_code),'',$this->request->get['formated_special']);
		$formated_special=str_replace($this->currency->getSymbolLeft($currency_code),'',$formated_special);
		
		$formated_special = (float)str_replace(" ","", $formated_special); 
		$data['not_formated_special'] =$formated_special;
		$data['formated_special'] =$this->request->get['formated_special'];
		$data['quantity'] =$this->request->get['quantity'];

		$formated_price=str_replace($this->currency->getSymbolRight($currency_code),'',$this->request->get['formated_price']);
		$formated_price=str_replace($this->currency->getSymbolLeft($currency_code),'',$formated_price);
		$formated_price=(float)str_replace(' ','',$formated_price);
		$data['not_formated_price'] =$formated_price;
		$data['formated_price'] =$this->request->get['formated_price'];

			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('aridiusundersell_imgw'), $this->config->get('aridiusundersell_imgh'));
			} else {
				$data['popup'] = '';
			}

		$this->response->setOutput($this->load->view('extension/module/aridiusundersell_form', $data));
				
	}

	public function write($settings = array()) {
		
		$this->language->load('extension/module/aridiusundersell');

		$this->load->model('catalog/aridiusundersell');
		$this->load->model('setting/setting');

		$json = array();
	
       $contact = $this->request->post['aridiusundersell_contact'];
       $firstname = (empty($this->request->post['aridiusundersell_firstname']) ? '' : $this->request->post['aridiusundersell_firstname']);
       $email = (empty($this->request->post['aridiusundersell_email']) ? '' : $this->request->post['aridiusundersell_email']);
       $comment = (empty($this->request->post['aridiusundersell_comment']) ? '' : $this->request->post['aridiusundersell_comment']);
       $link = (empty($this->request->post['aridiusundersell_link']) ? '' : $this->request->post['aridiusundersell_link']);
		
		$product_id = $this->request->post['product_id'];
		
		if ($product_id) {

       $aridiusundersell_firstnamevalid = $this->config->get('aridiusundersell_firstnamevalid'); 
       $aridiusundersell_emailvalid = $this->config->get('aridiusundersell_emailvalid'); 
       $aridiusundersell_firstnameshow = $this->config->get('aridiusundersell_firstnameshow'); 
       $aridiusundersell_emailshow = $this->config->get('aridiusundersell_emailshow'); 
       $aridiusundersell_quantity = $this->config->get('aridiusundersell_quantity'); 
       $aridiusundersell_linkvalid = $this->config->get('aridiusundersell_linkvalid'); 
       $aridiusundersell_linkshow = $this->config->get('aridiusundersell_linkshow'); 
  
	   $this->load->model('catalog/product');
	   $product_info = $this->model_catalog_product->getProduct($product_id);
	   $quantity_formated = $this->request->post['quantity'];
	   $quantity = $product_info['quantity'];

	    if (($aridiusundersell_quantity == '1') && (($quantity_formated) > ($quantity)))  {
		   $json['error']['quantity'] = $this->language->get('error_quantity');
		}

		if ((utf8_strlen($contact) < 3) || (utf8_strlen($contact) > 32)) {
		   $json['error']['contact'] = $this->language->get('error_tell');
		}

		if ( (!$aridiusundersell_firstnameshow == '1') && (!$aridiusundersell_firstnamevalid == '1') && (utf8_strlen($firstname) < 1) || (utf8_strlen($firstname) > 3200) ) {
		   $json['error']['firstname'] = $this->language->get('error_firstname');
		}
		if ( (!$aridiusundersell_linkshow == '1') && (!$aridiusundersell_linkvalid == '1') && (utf8_strlen($link) < 1) || (utf8_strlen($link) > 3200) ) {
		   $json['error']['link'] = $this->language->get('error_link');
		}

	    if ((!$aridiusundersell_emailshow == '1') && (!$aridiusundersell_emailvalid == '1') && ((utf8_strlen($email) > 96) || (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)))) {

			$json['error']['email'] = $this->language->get('error_email');
	    }

	  if (!isset($json['error'])) {

			$this->load->model('catalog/product');

			$product_info = $this->model_catalog_product->getProduct($product_id);

			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();
			}
			$option_txt = array();
			$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);
			
			foreach ($product_options as $product_option) {		
				if (isset($option[$product_option['product_option_id']]) && ($product_option['type']=='select' || $product_option['type']=='radio' || $product_option['type']=='image')) {
					foreach($product_option['product_option_value'] as $product_option_value ){
					if(in_array($product_option_value['product_option_value_id'],$option)){							
							$option_txt[]=$product_option['name'].': '.$product_option_value['name'];
						}
					}
				}elseif (isset($option[$product_option['product_option_id']]) && $product_option['type']=='checkbox') {
					foreach($product_option['product_option_value'] as $product_option_value ){					
						foreach($option[$product_option['product_option_id']] as $checkbox){
							if($product_option_value['product_option_value_id']==$checkbox){
									$option_txt[]=$product_option['name'].': '.$product_option_value['name'];
							}
						}
					}
				}elseif (isset($option[$product_option['product_option_id']]) && ($product_option['type']=='textarea' || $product_option['type']=='text' || $product_option['type']=='date' || $product_option['type']=='time' || $product_option['type']=='datetime')) {
					$option_txt[]=$product_option['name'].': '.$option[$product_option['product_option_id']];
				}					
			}
			  
			  if($option_txt){
				  $format_option=implode(', ',$option_txt);
			  }else{
				  $format_option='';
			  }

			 $price = $this->request->post['fo_total_price'];
			 $quantity = $this->request->post['quantity'];
			 $total = $price.$this->session->data['currency'];
			 
			 $href =$this->url->link('product/product', '&product_id=' . $product_id);
			 
			 $data = array(
					'contact' => $contact,
					'firstname' => $firstname,
					'email' => $email,
					'comment' => $comment,
					'link' => $link,
					'product_id' => $product_id,
					'quantity' => $quantity,
					'product_name' => $product_info['name'],
					'format_option' => $format_option,
					'total' => (float)$price,
					'currency_id' => $this->currency->getId($this->session->data['currency']),
					'currency_code' => $this->session->data['currency'],
					'currency_value' => $this->currency->getValue($this->session->data['currency'])
				);

				$order_id = $this->model_catalog_aridiusundersell->addOrder($data);

				    $email_subject = sprintf($this->language->get('text_subject'), $this->language->get('heading_title'), $this->config->get('config_name'), $order_id);
				    $email_text = sprintf($this->language->get('text_order'), $order_id) . "\n\n <br>";
                    if($firstname){
		            $email_text .= sprintf($this->language->get('text_firstname'), html_entity_decode($firstname), ENT_QUOTES, 'UTF-8') . "\n <br>";
	                }		
		            $email_text .= sprintf($this->language->get('text_contact'), html_entity_decode($contact), ENT_QUOTES, 'UTF-8') . "\n <br>";
                    if($email){		
		            $email_text .= sprintf($this->language->get('text_email'), html_entity_decode($email), ENT_QUOTES, 'UTF-8') . "\n <br>";
                    }	
					if($link){		
		            $email_text .= sprintf($this->language->get('text_link'), html_entity_decode($link), ENT_QUOTES, 'UTF-8') . "\n <br>";	
                    }
                    if($comment){		
		            $email_text .= sprintf($this->language->get('text_comment'), html_entity_decode($comment), ENT_QUOTES, 'UTF-8') . "\n <br>";	
                    }
					$email_text .= sprintf($this->language->get('text_product'),$href, html_entity_decode($product_info['name']), ENT_QUOTES, 'UTF-8') . "\n <br>";
					if($option_txt){
					$email_text .= sprintf($this->language->get('text_product_option'), html_entity_decode(implode(', ',$option_txt)), ENT_QUOTES, 'UTF-8') . "\n <br>";
					}
					$email_text .= sprintf($this->language->get('text_quantity'), $quantity, ENT_QUOTES, 'UTF-8') . "\n\n <br>";
					$email_text .= sprintf($this->language->get('text_price'), $total, ENT_QUOTES, 'UTF-8') . "\n <br>";
					$email_text .= sprintf($this->language->get('text_date_order'), date('d.m.Y H:i'), ENT_QUOTES, 'UTF-8') . "\n\n <br>";

					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
					$mail->smtp_username = $this->config->get('config_mail_smtp_username');
					$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->smtp_port = $this->config->get('config_mail_smtp_port');
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
					$mail->setTo($this->config->get('config_email'));
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender($this->config->get('config_name'));
					$mail->setSubject($email_subject);
					$mail->setHtml($email_text);
					$mail->send();
					
					// Send to additional alert emails
					$emails = explode(',', $this->config->get('config_alert_email'));
	
					foreach ($emails as $email) {
						if ($email && preg_match($this->config->get('config_mail_regexp'), $email)) {
							$mail->setTo($email);
							$mail->send();
						}
					}

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function validOrder() {
		
		$this->load->language('checkout/cart');

		$json = array();

		if (isset($this->request->post['product_id'])) {
			$product_id = (int)$this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if (isset($this->request->post['quantity']) && ((int)$this->request->post['quantity'] >= $product_info['minimum'])) {
				$quantity = (int)$this->request->post['quantity'];
			} else {
				$quantity = $product_info['minimum'] ? $product_info['minimum'] : 1;
			}

			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();
			}

			$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

			foreach ($product_options as $product_option) {
				if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
					$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
				}
			}

			if (isset($this->request->post['recurring_id'])) {
				$recurring_id = $this->request->post['recurring_id'];
			} else {
				$recurring_id = 0;
			}

			$recurrings = $this->model_catalog_product->getProfiles($product_info['product_id']);

			if ($recurrings) {
				$recurring_ids = array();

				foreach ($recurrings as $recurring) {
					$recurring_ids[] = $recurring['recurring_id'];
				}

				if (!in_array($recurring_id, $recurring_ids)) {
					$json['error']['recurring'] = $this->language->get('error_recurring_required');
				}
			}

			if (!$json) {
				$json['success'] = true;
			} else {
				$json['success'] = false;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}

