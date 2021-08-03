<?php
class ControllerExtensionModulefishSingleclick extends Controller {
    private $error = array();

    public function __construct($registry) {
        parent::__construct($registry);
        $this->language->load('extension/module/fish_singleclick');
    }

    public function fishcontent() {
            
            $data['text_order']     = $this->language->get('text_order');
			  $data['text_learn']     = $this->language->get('text_learn');
            $data['text_name']      = $this->language->get('text_name');
            $data['text_phone']     = $this->language->get('text_phone');
			  $data['text_email']       = $this->language->get('text_email');
            $data['text_comment']   = $this->language->get('text_comment');
            $data['text_captcha']   = $this->language->get('text_captcha');
            $data['text_helptext']  = $this->language->get('text_helptext');
			 $data['text_helptext2']  = $this->language->get('text_helptext2');
            $data['text_send']      = $this->language->get('text_send');
			$data['entry_feedtext']   = $this->language->get('entry_feedtext');
            $data['entry_danns']      = $this->language->get('entry_danns');
            $data['entry_callback']   = $this->language->get('entry_callback');
			$data['entry_live']   = $this->language->get('entry_live');
			$data['entry_day']   = $this->language->get('entry_day');
			$data['entry_hour']   = $this->language->get('entry_hour');
			$data['entry_min']   = $this->language->get('entry_min');
			$data['entry_review']   = $this->language->get('entry_review');
			$this->load->language('common/footer');
			$data['powered'] = $this->language->get('text_powered');
			

            $data['is_capcha']        = $this->config->get('fish_singleclick_capcha');
            $data['phone_mask']       = trim($this->config->get('fish_singleclick_phone_mask'));
            $data['order_status_id']  = $this->config->get('fish_singleclick_default_order_status');
			
			$data['languagefish'] = $this->load->controller('common/languagefish');
			
			$data['name'] = $this->config->get('config_name');
			$data['home'] = $this->url->link('common/home');
			if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}
			
			$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		
			
			$this->load->model('localisation/language');
	    	$data['languages'] = $this->model_localisation_language->getLanguages();
			
		
			$fish_singleclick = $this->config->get('fish_singleclick');
//print_r('<pre>');
// print_r($fish_singleclick);
//print_r('</pre>'); 
$data['rultext'] = isset($fish_singleclick['fish_singleclick_rultext'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_rultext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '';
$data['text_fish_agree']   = $this->language->get('text_fish_agree');

$data['showl']  = $this->config->get('fish_singleclick_showl');
$data['showstyle']  = $this->config->get('fish_singleclick_style');
$data['titlefont']  = $this->config->get('fish_singleclick_font1');
$data['bodyfont']  = $this->config->get('fish_singleclick_font2');
$data['titlefonth1_size']  = $this->config->get('fish_singleclick_fonth1_size');
$data['titlefonth1_weigh']  = $this->config->get('fish_singleclick_fonth1_weigh');
$data['titlefonth1_trans']  = $this->config->get('fish_singleclick_fonth1_trans');
$data['titlefonth2_size']  = $this->config->get('fish_singleclick_fonth2_size');
$data['titlefonth2_weigh']  = $this->config->get('fish_singleclick_fonth2_weigh');
$data['titlefonth2_trans']  = $this->config->get('fish_singleclick_fonth2_trans');
$data['titlefonth3_size']  = $this->config->get('fish_singleclick_fonth3_size');
$data['titlefonth3_weigh']  = $this->config->get('fish_singleclick_fonth3_weigh');
$data['titlefonth3_trans']  = $this->config->get('fish_singleclick_fonth3_trans');
$data['bodyfont_size']  = $this->config->get('fish_singleclick_fontbody_size');
$colormenu  = $this->config->get('fish_singleclick_colormenu');
			if ($colormenu !='') { $data['colormenu'] = $colormenu; } else {  $data['colormenu'] = 0;}
$colormenutext  = $this->config->get('fish_singleclick_colormenutext');
			if ($colormenutext !='') { $data['colormenutext'] = $colormenutext; } else {  $data['colormenutext'] = 0;}
$colorfooter  = $this->config->get('fish_singleclick_colorfooter');
			if ($colorfooter !='') { $data['colorfooter'] = $colorfooter; } else {  $data['colorfooter'] = 0;}
$colorfootertext  = $this->config->get('fish_singleclick_colorfootertext');
			if ($colorfootertext !='') { $data['colorfootertext'] = $colorfootertext; } else {  $data['colorfootertext'] = 0;}
$bodyfon  = $this->config->get('fish_singleclick_bodyfon');
			if ($bodyfon !='') { $data['bodyfon'] = $bodyfon; } else {  $data['bodyfon'] = 0;}
			

//menu
$data['showmenu']  = $this->config->get('fish_singleclick_showmenu');
$data['showmenu2']  = $this->config->get('fish_singleclick_showmenu2');

 $data['topmenu1'] = isset($fish_singleclick['fish_singleclick_menu1'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_menu1'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
 $data['topmenu2'] = isset($fish_singleclick['fish_singleclick_menu2'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_menu2'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
$data['topmenu3'] = isset($fish_singleclick['fish_singleclick_menu3'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_menu3'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
 $data['topmenu4'] = isset($fish_singleclick['fish_singleclick_menu4'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_menu4'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
  $data['topmenu4a'] = isset($fish_singleclick['fish_singleclick_menu4a'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_menu4a'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
$data['topmenu5'] = isset($fish_singleclick['fish_singleclick_menu5'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_menu5'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
$data['topmenu6'] = isset($fish_singleclick['fish_singleclick_menu6'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_menu6'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
$data['topmenu6a'] = isset($fish_singleclick['fish_singleclick_menu6a'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_menu6a'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
$data['topmenu7'] = isset($fish_singleclick['fish_singleclick_menu7'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_menu7'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
$data['topmenu8'] = isset($fish_singleclick['fish_singleclick_menu8'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_menu8'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
   		   $fish_headerlink = $this->config->get('fish_singleclick_headerlink');
			   if(isset($fish_headerlink)){
				foreach ($fish_headerlink as $result) {
				    $data['fish_headerlink'][] = array(
					'text' => isset($result['text'][$this->config->get('config_language_id')]) ? $result['text'][$this->config->get('config_language_id')]: '',
					'link' => isset($result['link'][$this->config->get('config_language_id')]) ? $result['link'][$this->config->get('config_language_id')]: '',
					'blank' => isset($result['blank']) ? $result['blank']: '',
				     );
			    
				}
			   }

            $data['phone'] = isset($fish_singleclick['fish_singleclick_phone']) ? html_entity_decode($fish_singleclick['fish_singleclick_phone'], ENT_QUOTES, 'UTF-8') : 0;		
            $data['topcontact'] = isset($fish_singleclick['fish_singleclick_topcontact'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_topcontact'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
			
			//big top text
			$data['toptext1'] = isset($fish_singleclick['fish_singleclick_toptext1'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_toptext1'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
			$data['toptext2'] = isset($fish_singleclick['fish_singleclick_toptext2'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_toptext2'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
			$data['toptext3'] = isset($fish_singleclick['fish_singleclick_toptext3'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_toptext3'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
			
			//slider
			   
			   if (isset($fish_singleclick['fish_singleclick_speed']) && ($fish_singleclick['fish_singleclick_speed'] != '')) {
			   $data['slider_speed'] = $fish_singleclick['fish_singleclick_speed']; 
			   } else { $data['slider_speed'] = 0;}
			   	
			   if (isset($fish_singleclick['fish_slider_width']) && ($fish_singleclick['fish_slider_width'] != '')) {
			   $fish_slider_width = $fish_singleclick['fish_slider_width']; 
			   } else { $fish_slider_width = 1920;}
			    if (isset($fish_singleclick['fish_slider_height']) && ($fish_singleclick['fish_slider_height'] != '')) {
			   $fish_slider_height = $fish_singleclick['fish_slider_height']; 
			   } else { $fish_slider_height = 650;}

			   $data['slider_height'] = $fish_slider_height;
			   $fish_slider = $this->config->get('fish_singleclick_img');
			   if(isset($fish_slider)){
				foreach ($fish_slider as $result) {
					if (is_file(DIR_IMAGE . $result['image']) && ($result['image'] != 'no_image.png')) {
				    $data['fish_slider'][] = array(
					'image' => $this->model_tool_image->resize($result['image'], $fish_slider_width, $fish_slider_height)
				     );
			    }
				}
			   }	   
			
	
		
			$fish_singleclicks = $this->config->get('fish_singleclicks');
			$data['fish_singleclick_phone'] = html_entity_decode($fish_singleclicks['fish_singleclick_phone'], ENT_QUOTES, 'UTF-8');
			
			//Sale
			$data['showsale']  = $this->config->get('fish_singleclick_showsale');
			$data['showsale2']  = $this->config->get('fish_singleclick_showsale2');
			$colorsale  = $this->config->get('fish_singleclick_colorsale');
			if ($colorsale !='') { $data['colorsale'] = $colorsale; } else {  $data['colorsale'] = 0;}
			 $colorsaletext  = $this->config->get('fish_singleclick_colorsaletext');
			if ($colorsaletext !='') { $data['colorsaletext'] = $colorsaletext; } else {  $data['colorsaletext'] = 0;}
			
			if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
		 	    $way = $this->config->get('config_ssl') . 'image/';
		        } else {
			    $way = $this->config->get('config_url') . 'image/';
		       }
			   
				$fish_singleclick_imgfon_sale = $this->config->get('fish_singleclick_imgfon_sale');   
			if (is_file(DIR_IMAGE . $fish_singleclick_imgfon_sale) && ($fish_singleclick_imgfon_sale != 'no_image.png')) {
						$data['imgfon_sale']  =  $way.$fish_singleclick_imgfon_sale;
					}	else {
						$data['imgfon_sale'] = false;
					}   
			   
			$fish_singleclick_img_sale = $this->config->get('fish_singleclick_img_sale');   
			if (is_file(DIR_IMAGE . $fish_singleclick_img_sale) && ($fish_singleclick_img_sale != 'no_image.png')) {
						$data['img_sale']  =  $this->model_tool_image->resize($fish_singleclick_img_sale, 60, 60);
					}	else {
						$data['img_sale'] = false;
					} 
			$data['saletext1'] = isset($fish_singleclick['fish_singleclick_saletext1'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_saletext1'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
			$data['saletext2'] = isset($fish_singleclick['fish_singleclick_saletext2'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_saletext2'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;
			$data['saletext3'] = isset($fish_singleclick['fish_singleclick_saletext3'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_saletext3'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0;	
			$data['year']  = $this->config->get('fish_singleclick_year');
			$data['month']  = $this->config->get('fish_singleclick_month');
			$data['day']  = $this->config->get('fish_singleclick_day');
			
	  	//advantages
		$data['showadv']  = $this->config->get('fish_singleclick_showadv');
			$coloradv  = $this->config->get('fish_singleclick_coloradv');
			if ($coloradv !='') { $data['coloradv'] = $coloradv; } else {  $data['coloradv'] = 0;}
			$coloradvtext  = $this->config->get('fish_singleclick_coloradvtext');
			if ($coloradvtext !='') { $data['coloradvtext'] = $coloradvtext; } else {  $data['coloradvtext'] = 0;}
			
			   
				$fish_singleclick_img_adv = $this->config->get('fish_singleclick_img_adv');   
			if (is_file(DIR_IMAGE . $fish_singleclick_img_adv) && ($fish_singleclick_img_adv != 'no_image.png')) {
						$data['img_adv']  =  $way.$fish_singleclick_img_adv;
					}	else {
						$data['img_adv'] = false;
					}   
		
		$data['advtext'] = isset($fish_singleclick['fish_singleclick_advtext'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_advtext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '';
		 if (isset($fish_singleclick['fish_adv_width']) && ($fish_singleclick['fish_adv_width'] != '')) {
			   $fish_adv_width = $fish_singleclick['fish_adv_width']; 
			   } else { $fish_adv_width = 60;}
			    if (isset($fish_singleclick['fish_adv_height']) && ($fish_singleclick['fish_adv_height'] != '')) {
			   $fish_adv_height = $fish_singleclick['fish_adv_height']; 
			   } else { $fish_adv_height = 60;}

			   
			   $fish_adv = $this->config->get('fish_singleclick_adv');
			   if(isset($fish_adv)){
				foreach ($fish_adv as $result) {
					if (is_file(DIR_IMAGE . $result['image']) && ($result['image'] != 'no_image.png')) {$image = $this->model_tool_image->resize($result['image'], $fish_adv_width, $fish_adv_height);} else {$image = false;}
				    $data['fish_adv'][] = array(
					'text' => isset($result['text'][$this->config->get('config_language_id')]) ?  html_entity_decode($result['text'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '',
					'image' => $image,
				     );
			    
				}
			   }
			   
			  //products
		$data['showprod']  = $this->config->get('fish_singleclick_showprod');
			$colorprod  = $this->config->get('fish_singleclick_colorprod');
			if ($colorprod !='') { $data['colorprod'] = $colorprod; } else {  $data['colorprod'] = 0;}
			$colorprodtext  = $this->config->get('fish_singleclick_colorprodtext');
			if ($colorprodtext !='') { $data['colorprodtext'] = $colorprodtext; } else {  $data['colorprodtext'] = 0;}
			
			$columnprod  = $this->config->get('fish_singleclick_column');
			if (isset($columnprod)) { $data['columnprod'] = 12/$columnprod ; } else {  $data['columnprod'] = '3';}
			if ($data['columnprod'] < 12) {$data['columnprod2'] = 6;} else {$data['columnprod2'] = 12;}
			
			   
				$fish_singleclick_img_prod = $this->config->get('fish_singleclick_img_prod');   
			if (is_file(DIR_IMAGE . $fish_singleclick_img_prod) && ($fish_singleclick_img_prod != 'no_image.png')) {
						$data['img_prod']  =  $way.$fish_singleclick_img_prod;
					}	else {
						$data['img_prod'] = false;
					}   
		
		$data['prodtext'] = isset($fish_singleclick['fish_singleclick_prodtext'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_prodtext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '';
		 if (isset($fish_singleclick['fish_prod_width']) && ($fish_singleclick['fish_prod_width'] != '')) {
			   $fish_prod_width = $fish_singleclick['fish_prod_width']; 
			   } else { $fish_prod_width = 380;}
			    if (isset($fish_singleclick['fish_prod_height']) && ($fish_singleclick['fish_prod_height'] != '')) {
			   $fish_prod_height = $fish_singleclick['fish_prod_height']; 
			   } else { $fish_prod_height = 380;}

			   
			   $fish_prod = $this->config->get('fish_singleclick_prod');
			   if(isset($fish_prod)){
				foreach ($fish_prod as $result) {
					if (is_file(DIR_IMAGE . $result['image']) && ($result['image'] != 'no_image.png')) {$image = $this->model_tool_image->resize($result['image'], $fish_prod_width, $fish_prod_height);} else {$image = false;}
				    $data['fish_prod'][] = array(
					'text' => isset($result['text'][$this->config->get('config_language_id')]) ? html_entity_decode($result['text'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0,
					'price' => isset($result['price']) ?  html_entity_decode($result['price'], ENT_QUOTES, 'UTF-8'): 0,
					'popaptext' => isset($result['popaptext'][$this->config->get('config_language_id')]) ? html_entity_decode($result['popaptext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '',
					'image' => $image,
				     );
			    
				}
			   }
	  //products BD
		$data['showproda']  = $this->config->get('fish_singleclick_showproda');
			$colorproda  = $this->config->get('fish_singleclick_colorproda');
			if ($colorproda !='') { $data['colorproda'] = $colorproda; } else {  $data['colorproda'] = 0;}
			$colorprodtexta  = $this->config->get('fish_singleclick_colorprodtexta');
			if ($colorprodtexta !='') { $data['colorprodtexta'] = $colorprodtexta; } else {  $data['colorprodtexta'] = 0;}
			
			$columnproda  = $this->config->get('fish_singleclick_columna');
			if (isset($columnproda)) { $data['columnproda'] = 12/$columnproda ; } else {  $data['columnproda'] = '3';}
			if ($data['columnproda'] < 12) {$data['columnprod2a'] = 6;} else {$data['columnprod2a'] = 12;}
			
			   
				$fish_singleclick_img_proda = $this->config->get('fish_singleclick_img_proda');   
			if (is_file(DIR_IMAGE . $fish_singleclick_img_proda) && ($fish_singleclick_img_proda != 'no_image.png')) {
						$data['img_proda']  =  $way.$fish_singleclick_img_proda;
					}	else {
						$data['img_proda'] = false;
					}   
		
		$data['prodtexta'] = isset($fish_singleclick['fish_singleclick_prodtexta'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_prodtexta'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '';
		 if (isset($fish_singleclick['fish_prod_widtha']) && ($fish_singleclick['fish_prod_widtha'] != '')) {
			   $fish_prod_widtha = $fish_singleclick['fish_prod_widtha']; 
			   } else { $fish_prod_widtha = 380;}
			    if (isset($fish_singleclick['fish_prod_heighta']) && ($fish_singleclick['fish_prod_heighta'] != '')) {
			   $fish_prod_heighta = $fish_singleclick['fish_prod_heighta']; 
			   } else { $fish_prod_heighta = 380;}
			   
			   		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();
        $fish_proda = $this->config->get('fish_singleclick_product'); 

		 if(isset($fish_proda)){
			$products = array_slice($fish_proda, 0, 40);

			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $fish_prod_widtha, $fish_prod_heighta);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $fish_prod_widtha, $fish_prod_heighta);
					}

					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}

					$data['products'][] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
				}
			}
		}
		   
			   
			   
			 //text blocks  
			 $colortextbox  = $this->config->get('fish_singleclick_colortextbox');
			if ($colortextbox !='') { $data['colortextbox'] = $colortextbox; } else {  $data['colortextbox'] = 0;}

		 if (isset($fish_singleclick['fish_box_width']) && ($fish_singleclick['fish_box_width'] != '')) {
			   $fish_box_width = $fish_singleclick['fish_box_width']; 
			   } else { $fish_box_width = 1000;}
			    if (isset($fish_singleclick['fish_box_height']) && ($fish_singleclick['fish_box_height'] != '')) {
			   $fish_box_height = $fish_singleclick['fish_box_height']; 
			   } else { $fish_box_height = 600;}

			   
			   $fish_box = $this->config->get('fish_singleclick_box');
			   if(isset($fish_box)){
				foreach ($fish_box as $result) {
					if (is_file(DIR_IMAGE . $result['image']) && ($result['image'] != 'no_image.png')) {$image = $this->model_tool_image->resize($result['image'], $fish_box_width, $fish_box_height);} else {$image = false;}
				    $data['fish_box'][] = array(
					'text' => isset($result['text'][$this->config->get('config_language_id')]) ? $result['text'][$this->config->get('config_language_id')] : 0,
					'mdtext' => isset($result['mdtext'][$this->config->get('config_language_id')]) ? html_entity_decode($result['mdtext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0,
					'smtext' => isset($result['smtext'][$this->config->get('config_language_id')]) ? html_entity_decode($result['smtext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '',
					'overtext' => isset($result['overtext'][$this->config->get('config_language_id')]) ? html_entity_decode($result['overtext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '',
					'image' => $image,
				     );
			    
				}
			   }
			//reviews
		$data['showreview']  = $this->config->get('fish_singleclick_showreview');
			$colorreview  = $this->config->get('fish_singleclick_colorreview');
			if ($colorreview !='') { $data['colorreview'] = $colorreview; } else {  $data['colorreview'] = 0;}
			  $colorreviewtext  = $this->config->get('fish_singleclick_colorreviewtext');
			if ($colorreviewtext !='') { $data['colorreviewtext'] = $colorreviewtext; } else {  $data['colorreviewtext'] = 0;}
			
			$columnreview  = $this->config->get('fish_singleclick_columnreview');
			if (isset($columnreview)) { $data['columnreview'] = 12/$columnreview ; } else {  $data['columnreview'] = '4';}
			if ($data['columnreview'] < 12) {$data['columnreview2'] = 6;} else {$data['columnreview2'] = 12;}
			   
				$fish_singleclick_img_review = $this->config->get('fish_singleclick_img_review');   
			if (is_file(DIR_IMAGE . $fish_singleclick_img_review) && ($fish_singleclick_img_review != 'no_image.png')) {
						$data['img_review']  =  $way.$fish_singleclick_img_review;
					}	else {
						$data['img_review'] = false;
					}   
		
		$data['reviewtext'] = isset($fish_singleclick['fish_singleclick_reviewtext'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_reviewtext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '';
		 if (isset($fish_singleclick['fish_review_width']) && ($fish_singleclick['fish_review_width'] != '')) {
			   $fish_review_width = $fish_singleclick['fish_review_width']; 
			   } else { $fish_review_width = 90;}
			    if (isset($fish_singleclick['fish_review_height']) && ($fish_singleclick['fish_review_height'] != '')) {
			   $fish_review_height = $fish_singleclick['fish_review_height']; 
			   } else { $fish_review_height = 90;}

			   
			   $fish_review = $this->config->get('fish_singleclick_review');
			   if(isset($fish_review)){
				foreach ($fish_review as $result) {
					if (is_file(DIR_IMAGE . $result['image']) && ($result['image'] != 'no_image.png')) {$image = $this->model_tool_image->resize($result['image'], $fish_review_width, $fish_review_height);} else {$image = false;}
				    $data['fish_review'][] = array(
					'text' => isset($result['text'][$this->config->get('config_language_id')]) ? html_entity_decode($result['text'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0,
					'reviewtext' => isset($result['reviewtext'][$this->config->get('config_language_id')]) ? html_entity_decode($result['reviewtext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0,
					'image' => $image,
				     );
			    
				}
			   } 
//carousel
		$data['showcarousel']  = $this->config->get('fish_singleclick_showcarousel');
			$colorcarousel  = $this->config->get('fish_singleclick_colorcarousel');
			if ($colorcarousel !='') { $data['colorcarousel'] = $colorcarousel; } else {  $data['colorcarousel'] = 0;}
			  $colorcarouseltext  = $this->config->get('fish_singleclick_colorcarouseltext');
			if ($colorcarouseltext !='') { $data['colorcarouseltext'] = $colorcarouseltext; } else {  $data['colorcarouseltext'] = 0;}
			
			$columncarousel  = $this->config->get('fish_singleclick_columncarousel');
			if (isset($columncarousel)) { $data['columncarousel'] = $columncarousel ; } else {  $data['columncarousel'] = '4';}
			if ($data['columncarousel'] < 4) {$data['columncarousel2'] = $data['columncarousel']; $data['columncarousel3'] = $data['columncarousel'];} 
			 else {$data['columncarousel2'] =  $data['columncarousel'] - 1; $data['columncarousel3'] =  $data['columncarousel'] - 2;}
  
				$fish_singleclick_img_carousel = $this->config->get('fish_singleclick_img_carousel');   
			if (is_file(DIR_IMAGE . $fish_singleclick_img_carousel) && ($fish_singleclick_img_carousel != 'no_image.png')) {
						$data['img_carousel']  =  $way.$fish_singleclick_img_carousel;
					}	else {
						$data['img_carousel'] = false;
					}   
		
		$data['carouseltext'] = isset($fish_singleclick['fish_singleclick_carouseltext'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_carouseltext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '';
		$data['carouseltext2'] = isset($fish_singleclick['fish_singleclick_carouseltext2'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_carouseltext2'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '';
		 if (isset($fish_singleclick['fish_carousel_width']) && ($fish_singleclick['fish_carousel_width'] != '') && ($fish_singleclick['fish_carousel_width'] != '0')) {
			   $fish_carousel_width = $fish_singleclick['fish_carousel_width']; 
			   } else { $fish_carousel_width = 200;}
			    if (isset($fish_singleclick['fish_carousel_height']) && ($fish_singleclick['fish_carousel_height'] != '') && ($fish_singleclick['fish_carousel_height'] != '0')) {
			   $fish_carousel_height = $fish_singleclick['fish_carousel_height']; 
			   } else { $fish_carousel_height = 200;}
			   
				 if (isset($fish_singleclick['fish_carousel_bigwidth']) && ($fish_singleclick['fish_carousel_bigwidth'] != '') && ($fish_singleclick['fish_carousel_bigwidth'] != '0')) {
			   $fish_carousel_bigwidth = $fish_singleclick['fish_carousel_bigwidth']; 
			   } else { $fish_carousel_bigwidth = false;}
			    if (isset($fish_singleclick['fish_carousel_bigheight']) && ($fish_singleclick['fish_carousel_bigheight'] != '') && ($fish_singleclick['fish_carousel_bigheight'] != '0')) {
			   $fish_carousel_bigheight = $fish_singleclick['fish_carousel_bigheight']; 
			   } else { $fish_carousel_bigheight = false;} 
			     
             if (($fish_carousel_bigwidth) && ($fish_carousel_bigheight)) { $data['showbigimage'] = true;} else {$data['showbigimage'] = false;}
			   
			   $fish_carousel = $this->config->get('fish_singleclick_carousel');
			   if(isset($fish_carousel)){
				foreach ($fish_carousel as $result) {
					if (is_file(DIR_IMAGE . $result['image']) && ($result['image'] != 'no_image.png')) {$image = $this->model_tool_image->resize($result['image'], $fish_carousel_width, $fish_carousel_height);} else {$image = false;}
					if (is_file(DIR_IMAGE . $result['image']) && ($result['image'] != 'no_image.png') && ($data['showbigimage'])) {
						$bigimage = $this->model_tool_image->resize($result['image'], $fish_carousel_bigwidth, $fish_carousel_bigheight);} else {$bigimage = false;}
					
				    $data['fish_carousel'][] = array(
					'text' => isset($result['text'][$this->config->get('config_language_id')]) ? html_entity_decode($result['text'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0,
					'carouseltext' => isset($result['carouseltext'][$this->config->get('config_language_id')]) ? html_entity_decode($result['carouseltext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0,
					'image' => $image,
					'bigimage' => $bigimage,
				     );
			    
				}
			   } 			   
			     
	//customs
		$data['showcustom']  = $this->config->get('fish_singleclick_showcustom');
			$colorcustom  = $this->config->get('fish_singleclick_colorcustom');
			if ($colorcustom !='') { $data['colorcustom'] = $colorcustom; } else {  $data['colorcustom'] = 0;}
          $colorcustomtext  = $this->config->get('fish_singleclick_colorcustomtext');
			if ($colorcustomtext !='') { $data['colorcustomtext'] = $colorcustomtext; } else {  $data['colorcustomtext'] = 0;}
			   
				$fish_singleclick_img_custom = $this->config->get('fish_singleclick_img_custom');   
			if (is_file(DIR_IMAGE . $fish_singleclick_img_custom) && ($fish_singleclick_img_custom != 'no_image.png')) {
						$data['img_custom']  =  $way.$fish_singleclick_img_custom;
					}	else {
						$data['img_custom'] = false;
					} 
					
			$fish_singleclick_img_iconcustom = $this->config->get('fish_singleclick_img_iconcustom');   
			if (is_file(DIR_IMAGE . $fish_singleclick_img_iconcustom) && ($fish_singleclick_img_iconcustom != 'no_image.png')) {
						$data['img_iconcustom']  =  $this->model_tool_image->resize($fish_singleclick_img_iconcustom, 60, 60);
					}	else {
						$data['img_iconcustom'] = false;
					}  		  
		
		$data['customtext'] = isset($fish_singleclick['fish_singleclick_customtext'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_customtext'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0; 	
		
		$data['customtext2'] = isset($fish_singleclick['fish_singleclick_customtext2'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_customtext2'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0; 	
		
		$data['customtext3'] = isset($fish_singleclick['fish_singleclick_customtext3'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_customtext3'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : ''; 			   	      	   
			
		   $fish_netw = $this->config->get('fish_singleclick_netw');
			   if(isset($fish_netw)){
				foreach ($fish_netw as $result) {
				    $data['fish_netw'][] = array(
					'text' => isset($result['text']) ? $result['text']: '',
					'link' => isset($result['link']) ? $result['link']: '',
					'ico' => isset($result['ico']) ? $result['ico']: '',
				     );
			    
				}
			   } 
			   
			     
		$data['fishmap'] = isset($fish_singleclick['fish_singleclick_map']) ? html_entity_decode($fish_singleclick['fish_singleclick_map'], ENT_QUOTES, 'UTF-8') : '';	
		$data['customcontact1'] = isset($fish_singleclick['fish_singleclick_customcontact1'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_customcontact1'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : ''; 
		$data['customcontact2'] = isset($fish_singleclick['fish_singleclick_customcontact2'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_customcontact2'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : '';
	   $data['customcopy'] = isset($fish_singleclick['fish_singleclick_customcopy'][$this->config->get('config_language_id')]) ? html_entity_decode($fish_singleclick['fish_singleclick_customcopy'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8') : 0; 
	   
	   if ((strlen($data['customcontact1']) > 11) && (strlen($data['customcontact2']) > 11)) {$data['customclass'] = '6';} else {$data['customclass'] = '12';}	
	   		   $fish_footerlink = $this->config->get('fish_singleclick_footerlink');
			   if(isset($fish_footerlink)){
				foreach ($fish_footerlink as $result) {
				    $data['fish_footerlink'][] = array(
					'text' => isset($result['text'][$this->config->get('config_language_id')]) ? $result['text'][$this->config->get('config_language_id')]: '',
					'link' => isset($result['link'][$this->config->get('config_language_id')]) ? $result['link'][$this->config->get('config_language_id')]: '',
					'blank' => isset($result['blank']) ? $result['blank']: '',
				     );
			    
				}
			   } 	   	

            return $this->load->view('extension/module/fish_singleclick', $data);
        }


    public function index() {
        $data['email_subject'] = $this->language->get('email_subject');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->_trim_data();
            $this->load->model('extension/module/fish_singleclick');
            $this->model_extension_module_fish_singleclick->add($this->request->post);

            $message = $this->language->get('text_product') . PHP_EOL .
                $this->language->get('text_date') . date('d.m.Y H:i') . PHP_EOL .
                $this->language->get('text_client') . $this->request->post['customer_name'] . PHP_EOL .
                $this->language->get('text_phone') . $this->request->post['customer_phone'] . PHP_EOL .
				  $this->language->get('text_email') . $this->request->post['customer_email'] . PHP_EOL .
                $this->language->get('text_comment') . $this->request->post['customer_message'];

            $mail = new Mail();
            $mail->protocol   = $this->config->get('config_mail_protocol');
            $mail->parameter  = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname   = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username   = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password   = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port       = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout    = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender(html_entity_decode($this->request->post['customer_name'], ENT_QUOTES, 'UTF-8'));
            $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['customer_name'], ENT_QUOTES, 'UTF-8')));
            $mail->setText(strip_tags(html_entity_decode($message, ENT_QUOTES, 'UTF-8')));
            $mail->send();

            $emails = explode(',', $this->config->get('config_alert_email'));
            $regexp = $this->config->get('config_mail_regexp') ?: '/^[^\@]+@.*.[a-z]{2,15}$/i';
            foreach ($emails as $email) {
                if ($email && preg_match($regexp, $email)) {
                    $mail->setTo($email);
                    $mail->send();
                }
            }

             $this->response->redirect($this->url->link('extension/module/fish_singleclick/success', '', 'SSL'));
        } else {

            $resp = array('error' => $this->error);
            //$this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($resp));

        }

    }

    public function success() {
        $success = array('success' => '1');
        //$this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($success));
    }


    protected function validate() {
        if (!isset($this->request->post['customer_name'])
            || (utf8_strlen($this->request->post['customer_name']) < 3)
            || (utf8_strlen($this->request->post['customer_name']) > 32)
        ) {
            $this->error = $this->language->get('error_name');
        }

        if (!isset($this->request->post['customer_phone'])
            || (utf8_strlen($this->request->post['customer_phone']) < 5)
            || (utf8_strlen($this->request->post['customer_phone']) > 32)
        ) {
            $this->error = $this->language->get('error_phone');
        }

        if ($this->config->get('fish_singleclick_capcha')) {
            if (!isset($this->request->post['captcha']) || (!isset($this->request->post['pr'])) || ($this->request->post['captcha'] != $this->request->post['pr'])) {
                $this->error = $this->language->get('error_captcha');
            }
        }
		
		 if (!$this->request->post['fish_agree']) {
                $this->error = sprintf($this->language->get('error_fish_agree'));
            }

        /* if (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
            $this->error['email'] = $this->language->get('error_email');
        } */

        return !$this->error;
    }

    protected function _trim_data() {
        foreach ($this->request->post as $key => $value) {
            $this->request->post[$key] = trim($value);
        }
    }
}