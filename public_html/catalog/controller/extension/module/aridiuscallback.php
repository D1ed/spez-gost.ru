<?php
class ControllerExtensionModulearidiuscallback extends Controller {
	
	public function index() {

			$this->language->load('extension/module/aridiuscallback');

			$data['button_title'] = $this->language->get('button_title');
			$data['text_loading'] = $this->language->get('text_loading');
			
			$data['aurus_callleft'] = $this->config->get('aurus_callleft');
			
			return $this->load->view('extension/module/aridiuscallback', $data);
    }
	 
	public function success() {
		
	$this->language->load('extension/module/aridiuscallback');
	
	$data['heading_title'] = $this->language->get('heading_title');
	$data['language_id'] = $this->config->get('config_language_id');
    $data['aridiuscallback_description2'] = $this->config->get('aridiuscallback_description2');

	$this->response->setOutput($this->load->view('extension/module/aridiuscallback_success', $data));
    }
	
	public function getForm() {
		
		$this->language->load('extension/module/aridiuscallback');
	    $this->load->language('product/product');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['button_send'] = $this->language->get('button_send');
		$data['enter_phone'] = $this->language->get('enter_phone');
	    $data['enter_firstname'] = $this->language->get('enter_firstname');
		$data['enter_email'] = $this->language->get('enter_email');
		$data['enter_time'] = $this->language->get('enter_time');
	    $data['enter_comment'] = $this->language->get('enter_comment');	
	    $data['enter_load'] = $this->language->get('enter_load');		
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_discount'] = $this->language->get('text_discount');
		$data['language_id'] = $this->config->get('config_language_id');		
        $data['aridiuscallback_adddescriptionshow'] = $this->config->get('aridiuscallback_adddescriptionshow');
		$data['aridiuscallback_placeholdertell'] = $this->config->get('aridiuscallback_placeholdertell');
        $data['aridiuscallback_placeholderfirstname'] = $this->config->get('aridiuscallback_placeholderfirstname');
        $data['aridiuscallback_placeholderemail'] = $this->config->get('aridiuscallback_placeholderemail');
        $data['aridiuscallback_placeholdercomment'] = $this->config->get('aridiuscallback_placeholdercomment');
        $data['aridiuscallback_placeholdertimein'] = $this->config->get('aridiuscallback_placeholdertimein');	
        $data['aridiuscallback_placeholdertimeoff'] = $this->config->get('aridiuscallback_placeholdertimeoff');
        $data['aridiuscallback_mask'] = $this->config->get('aridiuscallback_mask');
        $data['aridiuscallback_emailvalid'] = $this->config->get('aridiuscallback_emailvalid');
        $data['aridiuscallback_firstnamevalid'] = $this->config->get('aridiuscallback_firstnamevalid');
        $data['aridiuscallback_firstnameshow'] = $this->config->get('aridiuscallback_firstnameshow');
        $data['aridiuscallback_emailshow'] = $this->config->get('aridiuscallback_emailshow');
        $data['aridiuscallback_commentshow'] = $this->config->get('aridiuscallback_commentshow');
		$data['aridiuscallback_timetshow'] = $this->config->get('aridiuscallback_timetshow');
        $data['aridiuscallback_description'] = $this->config->get('aridiuscallback_description');
        $data['aridiuscallback_description2'] = $this->config->get('aridiuscallback_description2');
		$data['aridiusfastorder_adddescriptionshow'] = $this->config->get('aridiusfastorder_adddescriptionshow');

		$this->response->setOutput($this->load->view('extension/module/aridiuscallback_form', $data));
				
	}

	public function write($settings = array()) {
		
		$this->language->load('extension/module/aridiuscallback');
		$this->load->model('catalog/aridiuscallback');
		$this->load->model('setting/setting');

		$json = array();
		
       $contact = $this->request->post['aridiuscallback_contact'];
       $firstname = (empty($this->request->post['aridiuscallback_firstname']) ? '' : $this->request->post['aridiuscallback_firstname']);
       $email = (empty($this->request->post['aridiuscallback_email']) ? '' : $this->request->post['aridiuscallback_email']);
       $comment = (empty($this->request->post['aridiuscallback_comment']) ? '' : $this->request->post['aridiuscallback_comment']);
       $timein = (empty($this->request->post['aridiuscallback_timein']) ? '' : $this->request->post['aridiuscallback_timein']);
       $timeoff = (empty($this->request->post['aridiuscallback_timeoff']) ? '' : $this->request->post['aridiuscallback_timeoff']);
		   
       $aridiuscallback_firstnamevalid = $this->config->get('aridiuscallback_firstnamevalid'); 
       $aridiuscallback_emailvalid = $this->config->get('aridiuscallback_emailvalid'); 
       $aridiuscallback_firstnameshow = $this->config->get('aridiuscallback_firstnameshow'); 
       $aridiuscallback_emailshow = $this->config->get('aridiuscallback_emailshow'); 

		if ((utf8_strlen($contact) < 3) || (utf8_strlen($contact) > 32)) {
		   $json['error']['contact'] = $this->language->get('error_tell');
		}

		if ( (!$aridiuscallback_firstnameshow == '1') && (!$aridiuscallback_firstnamevalid == '1') && (utf8_strlen($firstname) < 1) || (utf8_strlen($firstname) > 32) ) {
		   $json['error']['firstname'] = $this->language->get('error_firstname');
		}

	    if ((!$aridiuscallback_emailshow == '1') && (!$aridiuscallback_emailvalid == '1') && ((utf8_strlen($email) > 96) || (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)))) {

			$json['error']['email'] = $this->language->get('error_email');
	    }

	  if (!isset($json['error'])) {
			
			  $data = array(
					'contact' => $contact,
					'firstname' => $firstname,
					'email' => $email,
					'comment' => $comment,
				    'timein' => $timein,
				    'timeoff' => $timeoff,
				);

				$order_id = $this->model_catalog_aridiuscallback->addOrder($data);

				    $email_subject = sprintf($this->language->get('text_subject'), $this->language->get('heading_title'), $this->config->get('config_name'), $order_id);
				    $email_text = sprintf($this->language->get('text_order'), $order_id) . "\n\n <br>";
                    if($firstname){
		            $email_text .= sprintf($this->language->get('text_firstname'), html_entity_decode($firstname), ENT_QUOTES, 'UTF-8') . "\n <br>";
	                }		
		            $email_text .= sprintf($this->language->get('text_contact'), html_entity_decode($contact), ENT_QUOTES, 'UTF-8') . "\n <br>";
                    if($email){		
		            $email_text .= sprintf($this->language->get('text_email'), html_entity_decode($email), ENT_QUOTES, 'UTF-8') . "\n <br>";
                    }	
                    if($comment){		
		            $email_text .= sprintf($this->language->get('text_comment'), html_entity_decode($comment), ENT_QUOTES, 'UTF-8') . "\n <br>";	
                    }
				    if($timein || $timeoff ){		
		            $email_text .= sprintf($this->language->get('text_time'), html_entity_decode($timein. ' - ' .$timeoff), ENT_QUOTES, 'UTF-8') . "\n <br>";	
			        }
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
		$this->response->setOutput(json_encode($json));
	}
}

