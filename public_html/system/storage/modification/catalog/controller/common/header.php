<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

            $data['aridiusfastorder'] = $this->load->controller('module/aridiuscallback');
			

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();

    // OCFilter start
    $data['noindex'] = $this->document->isNoindex();
    // OCFilter end
      
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

                    $this->load->language('extension/module/aurus');
      
		$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_page'] = $this->language->get('text_page');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');

           $data['button_title'] = $this->language->get('button_title');
		   $data['aridiuscallback_status'] = $this->config->get('aridiuscallback_status');
			
		$data['telephone'] = $this->config->get('config_telephone');

	  		   $data['compare'] = $this->url->link('product/compare');
			   $data['searchlink'] = $this->url->link('product/search');
	             	$data['text_information'] = $this->language->get('text_information');
	            	$data['text_contact'] = $this->language->get('text_contact');
					$data['text_manufacturer'] = $this->language->get('text_manufacturer');
					$data['text_continue'] = $this->language->get('text_continue');					
					$data['text_continue2'] = $this->language->get('text_continue2');					
					$data['text_wishlist2'] = $this->language->get('text_wishlist2');
					$data['text_compare2'] = $this->language->get('text_compare2');
					$data['text_compare3'] = $this->language->get('text_compare3');
			        $data['href_manufacturer'] = $this->url->link('product/manufacturer');
					$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));	
                    $data['button_compare'] = $this->language->get('button_compare');
					$data['text_cartp'] = $this->language->get('text_cartp');
					$data['text_wishlistp'] = $this->language->get('text_wishlistp');
					$data['text_comparep'] = $this->language->get('text_comparep');
					$data['dropdown_tell'] = $this->language->get('dropdown_tell');
					$data['dropdown_work_time'] = $this->language->get('dropdown_work_time');
					$data['dropdown_mail'] = $this->language->get('dropdown_mail');
					$data['dropdown_callorder'] = $this->language->get('dropdown_callorder');
					$data['dropdown_address'] = $this->language->get('dropdown_address');
					$data['text_money_set'] = $this->language->get('text_money_set');
					$data['text_language_set'] = $this->language->get('text_language_set');
					$data['text_info_set'] = $this->language->get('text_info_set');
					$data['text_account_set'] = $this->language->get('text_account_set');
					$data['text_home'] = $this->language->get('text_home');
					$data['text_cart'] = $this->language->get('text_cart');
      

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

					$this->load->model('tool/image');
      

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {

			if ($category['image']) {
			$image_main = $this->model_tool_image->resize($category['image'],$this->config->get('aurus_photos_width_image_main'), $this->config->get('aurus_photos_height_image_main'));
			} else {		
			$image_main = '';
			};
			if ($category['image_menu']) {
			$image_menu_background = $this->model_tool_image->resize($category['image_menu'],$category['image_menu_width'], $category['image_menu_height']);
			} else {		
			$image_menu_background = '';
			};
      
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {

		$children_lv3_data = array();
		$children_lv3 = $this->model_catalog_category->getCategories($child['category_id']);
		foreach ($children_lv3 as $child_lv3) {
		$filter_data_lv3 = array(
		'filter_category_id'  => $child_lv3['category_id'],
		'filter_sub_category' => true
		);		
		$children_lv3_data[] = array(
		'name'  => $child_lv3['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data_lv3) . ')' : ''),
		'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_lv3['category_id'])
		);
			}	
	    if ($child['image']) {
		$img_lv2 = $this->model_tool_image->resize($child['image'],$this->config->get('aurus_photos_menu_width'), $this->config->get('aurus_photos_menu_height'));
		} else {		
		$img_lv2 = '';
		};
      
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),

	                'stickers'     => $child['stickers'],
					'children_lv3' => $children_lv3_data,
		            'column'   => $child['column'] ? $child['column'] : 1,
		            'image2' => $img_lv2,
      
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(

					'top'     => $category['top'],
					'category_id' => $category['category_id'],

			'image_main' => $image_main,
			'image_menu_background' => $image_menu_background,
      
      
					'name'     => $category['name'],

					'stickers'     => $category['stickers'],	
      
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');

					$data['content_topfl'] =  $this->load->controller('common/content_topfl');
					$data['content_fluid'] =  $this->load->controller('common/content_fluid');
      
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');

					if (isset($this->request->get['path'])) {
						$parts = explode('_', (string)$this->request->get['path']);
					} else {
						$parts = array();
					}
					if (isset($parts[0])) {
						$data['category_id'] = $parts[0];
					} else {
						$data['category_id'] = 0;
			        }
					$this->load->model('catalog/information');
					$this->load->language('common/footer');
					$data['informations'] = array();
					foreach ($this->model_catalog_information->getInformations() as $result) {
						if ($result['bottom']) {
							$data['informations'][] = array(
								'title' => $result['title'],
								'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
							);
						}
					}
      
		$data['cart'] = $this->load->controller('common/cart');

		       $data['language_id'] = $this->config->get('config_language_id');
			   $data['config_minify'] = $this->config->get('config_minify');
		            $data['aurus_account_top'] = $this->config->get('aurus_account_top');
					$data['aurus_top_links3'] = $this->config->get('aurus_top_links3');
					$data['aurus_top_links4'] = $this->config->get('aurus_top_links4');
					$data['aurus_top_links6'] = $this->config->get('aurus_top_links6');
					$data['aurus_top_links8'] = $this->config->get('aurus_top_links8');
					$data['aurus_telephone_top'] = $this->config->get('aurus_telephone_top');
					$data['aurus_wishlist_top'] = $this->config->get('aurus_wishlist_top');
					$data['aurus_compare_top'] = $this->config->get('aurus_compare_top');
					$data['aurus_calltop'] = $this->config->get('aurus_calltop');
					$data['aurus_order_top'] = $this->config->get('aurus_order_top');
					$data['aurus_transaction_top'] = $this->config->get('aurus_transaction_top');
					$data['aurus_download_top'] = $this->config->get('aurus_download_top');
					$data['aurus_telephone_mainheader'] = $this->config->get('aurus_telephone_mainheader');
			        $data['aurus_address'] = $this->config->get('aurus_address');
					$data['aurus_mail_header'] = $this->config->get('aurus_mail_header');
				    $data['aurus_sticky_menu'] = $this->config->get('aurus_sticky_menu');
					$data['aurus_photos_menu'] = $this->config->get('aurus_photos_menu');
					$data['aurus_3lv_menu'] = $this->config->get('aurus_3lv_menu');
					$data['aurus_info_menu'] = $this->config->get('aurus_info_menu');
					$data['aurus_main_link_menu'] = $this->config->get('aurus_main_link_menu');
					$data['aurus_main_link_href_menu'] = $this->config->get('aurus_main_link_href_menu');
					$data['aurus_sticker_menu'] = $this->config->get('aurus_sticker_menu');
					$data['aurus_name_sticker_menu_new'] = $this->config->get('aurus_name_sticker_menu_new');
					$data['aurus_name_sticker_menu_top'] = $this->config->get('aurus_name_sticker_menu_top');
					$data['aurus_name_sticker_menu_sale'] = $this->config->get('aurus_name_sticker_menu_sale');
					$data['aurus_arrowup'] = $this->config->get('aurus_arrowup');
					$data['aurus_callleft'] = $this->config->get('aurus_callleft');
					$data['aurus_main_photos_menu'] = $this->config->get('aurus_main_photos_menu');
					$data['aurus_ico_home'] = $this->config->get('aurus_ico_home');
					$data['aurus_vmenu_menu'] = $this->config->get('aurus_vmenu_menu');
					$data['aurus_seeall_menu'] = $this->config->get('aurus_seeall_menu');
					$data['aurus_menu_special'] = $this->config->get('aurus_menu_special');
					$data['aurus_link_special'] = $this->config->get('aurus_link_special');
					$data['aurus_countvmenulv'] = $this->config->get('aurus_countvmenulv');
					$data['aurus_seevmenuico'] = $this->config->get('aurus_seevmenuico');
					$data['aurus_seevmenuw'] = $this->config->get('aurus_seevmenuw');
					$data['aurus_seevmenu_menu'] = $this->config->get('aurus_seevmenu_menu');
					$data['aurus_link_menucatalog'] = $this->config->get('aurus_link_menucatalog');
					$data['aurus_description_cat'] = $this->config->get('aurus_description_cat');
					$data['aurus_css'] = html_entity_decode ($this->config->get('aurus_css'), ENT_QUOTES, 'UTF-8');	
					$data['aurus_height_symbolst'] = $this->config->get('aurus_height_symbolst');
                    $data['aurus_col1_menu'] = $this->config->get('aurus_col1_menu');
					$data['aurus_preloader'] = $this->config->get('aurus_preloader');
                    $data['aurus_cart_right'] = $this->config->get('aurus_cart_right');
				    $data['aurus_wish_right'] = $this->config->get('aurus_wish_right');	
					$data['aurus_comp_right'] = $this->config->get('aurus_comp_right');
					$data['aurus_right_sm'] = $this->config->get('aurus_right_sm');
					$data['aurus_right_tittle'] = $this->config->get('aurus_right_tittle');
					$data['aurus_show_cart'] = $this->config->get('aurus_show_cart');
					$data['aurus_show_price'] = $this->config->get('aurus_show_price');
					$data['aurus_hover_menu'] = $this->config->get('aurus_hover_menu');
                    $data['aurus_arrowup_lr'] = $this->config->get('aurus_arrowup_lr');	
                    $data['aurus_callleftr'] = $this->config->get('aurus_callleftr');
                    $data['aurus_arrowup_mobile'] = $this->config->get('aurus_arrowup_mobile');	
				    $data['aurus_vmenuheight'] = $this->config->get('aurus_vmenuheight');
					$data['aurus_header_var'] = $this->config->get('aurus_header_var');
					$data['aurus_footer_limit_height'] = $this->config->get('aurus_footer_limit_height');
					$data['aurus_seevmenu_menu_open'] = $this->config->get('aurus_seevmenu_menu_open');
					$data['aurus_show_topmenu'] = $this->config->get('aurus_show_topmenu');
					$data['aurus_show_set'] = $this->config->get('aurus_show_set');
					$data['aurus_show_topmenu_set'] = $this->config->get('aurus_show_topmenu_set');
					$data['aurus_logo_width'] = $this->config->get('aurus_logo_width');
					$data['aurus_show_add_link'] = $this->config->get('aurus_show_add_link');
					$data['aurus_work_time'] = $this->config->get('aurus_work_time');  
					$data['aurus_work_time1'] = $this->config->get('aurus_work_time1');  
					$data['aurus_work_time2'] = $this->config->get('aurus_work_time2');
					$data['aurus_show_fluid_map_footer'] = $this->config->get('aurus_show_fluid_map_footer');
					$data['aurus_show_map_open'] = $this->config->get('aurus_show_map_open');
					$data['aurus_gradient'] = $this->config->get('aurus_gradient');   
					$data['aurus_categories_limit_height'] = $this->config->get('aurus_categories_limit_height');
					$data['aridius_text_home_height'] = $this->config->get('aridius_text_home_height');
					   $data['aurus_border_cart'] = $this->config->get('aurus_border_cart');
					   $data['aurus_border_stickers'] = $this->config->get('aurus_border_stickers');
					   $data['aurus_mob_logo'] = $this->config->get('aurus_mob_logo');
					   $data['aurus_mob_home'] = $this->config->get('aurus_mob_home');
					   $data['aurus_mobcat_group'] = $this->config->get('aurus_mobcat_group');
					   $data['aurus_mob_tell'] = $this->config->get('aurus_mob_tell');
					   $data['aurus_mob_work'] = $this->config->get('aurus_mob_work');
					   $data['aurus_mob_mail'] = $this->config->get('aurus_mob_mail');
					   $data['aurus_mob_address'] = $this->config->get('aurus_mob_address');
					   $data['aurus_mob_cart'] = $this->config->get('aurus_mob_cart');
					   $data['aurus_mob_account'] = $this->config->get('aurus_mob_account');
					   $data['aurus_options_prise'] = $this->config->get('aurus_options_prise');
					  	  $data['aurus_color1'] = $this->config->get('aurus_color1');
						  $data['aurus_color2'] = $this->config->get('aurus_color2');
						  $data['aurus_color3'] = $this->config->get('aurus_color3');
						  $data['aurus_color4'] = $this->config->get('aurus_color4');
						  $data['aurus_color5'] = $this->config->get('aurus_color5');
						  $data['aurus_color6'] = $this->config->get('aurus_color6');
						  $data['aurus_color7'] = $this->config->get('aurus_color7');
						  $data['aurus_color8'] = $this->config->get('aurus_color8');
						  $data['aurus_color9'] = $this->config->get('aurus_color9');
						  $data['aurus_color10'] = $this->config->get('aurus_color10');
						  $data['aurus_color11'] = $this->config->get('aurus_color11');
						  $data['aurus_color12'] = $this->config->get('aurus_color12');
						  $data['aurus_color13'] = $this->config->get('aurus_color13');
						  $data['aurus_color14'] = $this->config->get('aurus_color14');
						  $data['aurus_color15'] = $this->config->get('aurus_color15');
						  $data['aurus_color16'] = $this->config->get('aurus_color16');
					 	  $data['aurus_color17'] = $this->config->get('aurus_color17');
						  $data['aurus_color18'] = $this->config->get('aurus_color18');
					 	  $data['aurus_color19'] = $this->config->get('aurus_color19');
						  $data['aurus_color20'] = $this->config->get('aurus_color20');
						  $data['aurus_color21'] = $this->config->get('aurus_color21');
						  $data['aurus_color22'] = $this->config->get('aurus_color22');
						  $data['aurus_color23'] = $this->config->get('aurus_color23');
						  $data['aurus_color24'] = $this->config->get('aurus_color24');
						  $data['aurus_color25'] = $this->config->get('aurus_color25');
						  $data['aurus_color26'] = $this->config->get('aurus_color26');
						  $data['aurus_color27'] = $this->config->get('aurus_color27');
						  $data['aurus_color28'] = $this->config->get('aurus_color28');
						  $data['aurus_color29'] = $this->config->get('aurus_color29');
						  $data['aurus_color30'] = $this->config->get('aurus_color30');
						  $data['aurus_color31'] = $this->config->get('aurus_color31');
						  $data['aurus_color32'] = $this->config->get('aurus_color32');
						  $data['aurus_color33'] = $this->config->get('aurus_color33');
						  $data['aurus_color34'] = $this->config->get('aurus_color34');
						  $data['aurus_color35'] = $this->config->get('aurus_color35');
						  $data['aurus_color36'] = $this->config->get('aurus_color36');
					      $data['aurus_color37'] = $this->config->get('aurus_color37');
					      $data['aurus_color38'] = $this->config->get('aurus_color38');
						  $data['aurus_color39'] = $this->config->get('aurus_color39'); 
						  $data['aurus_color40'] = $this->config->get('aurus_color40');  
						   $data['aurus_color41'] = $this->config->get('aurus_color41'); 
						   $data['aurus_color42'] = $this->config->get('aurus_color42'); 
						   $data['aurus_color43'] = $this->config->get('aurus_color43');
						   $data['aurus_color44'] = $this->config->get('aurus_color44');
						   $data['aurus_color45'] = $this->config->get('aurus_color45');
						   $data['aurus_color46'] = $this->config->get('aurus_color46');  
						   $data['aurus_color47'] = $this->config->get('aurus_color47'); 
						   $data['aurus_color48'] = $this->config->get('aurus_color48'); 
						   $data['aurus_color49'] = $this->config->get('aurus_color49');
						   $data['aurus_color50'] = $this->config->get('aurus_color50');
						   $data['aurus_color51'] = $this->config->get('aurus_color51');
						   $data['aurus_color52'] = $this->config->get('aurus_color52');  
						   $data['aurus_color53'] = $this->config->get('aurus_color53'); 
						   $data['aurus_color54'] = $this->config->get('aurus_color54'); 
						   $data['aurus_color55'] = $this->config->get('aurus_color55');
						   $data['aurus_color56'] = $this->config->get('aurus_color56');  
						   $data['aurus_color57'] = $this->config->get('aurus_color57'); 
						   $data['aurus_color58'] = $this->config->get('aurus_color58'); 
						   $data['aurus_color59'] = $this->config->get('aurus_color59');
						   $data['aurus_color60'] = $this->config->get('aurus_color60');
						   $data['aurus_color61'] = $this->config->get('aurus_color61');
						   $data['aurus_color62'] = $this->config->get('aurus_color62');  
						   $data['aurus_color63'] = $this->config->get('aurus_color63'); 
						   $data['aurus_color64'] = $this->config->get('aurus_color64'); 
						   $data['aurus_color65'] = $this->config->get('aurus_color65');
						   $data['aurus_color66'] = $this->config->get('aurus_color66'); 
						   $data['aurus_color67'] = $this->config->get('aurus_color67');
						   $data['aurus_color68'] = $this->config->get('aurus_color68'); 
						   $data['aurus_color69'] = $this->config->get('aurus_color69'); 
						   $data['aurus_color70'] = $this->config->get('aurus_color70'); 
						   $data['aurus_color71'] = $this->config->get('aurus_color71'); 
						   $data['aurus_color72'] = $this->config->get('aurus_color72'); 
						   $data['aurus_color73'] = $this->config->get('aurus_color73'); 
						   $data['aurus_color74'] = $this->config->get('aurus_color74'); 
						   $data['aurus_color75'] = $this->config->get('aurus_color75'); 
				    	   $data['aurus_color76'] = $this->config->get('aurus_color76');
					       $data['aurus_color77'] = $this->config->get('aurus_color77');
					       $data['aurus_color78'] = $this->config->get('aurus_color78');
					       $data['aurus_color79'] = $this->config->get('aurus_color79');
					       $data['aurus_color80'] = $this->config->get('aurus_color80');
					       $data['aurus_color81'] = $this->config->get('aurus_color81');
						   $data['aurus_color82'] = $this->config->get('aurus_color82'); 
						   $data['aurus_color84'] = $this->config->get('aurus_color84'); 
						   $data['aurus_color85'] = $this->config->get('aurus_color85'); 	 
						   $data['aurus_color86'] = $this->config->get('aurus_color86'); 
						   $data['aurus_color87'] = $this->config->get('aurus_color87'); 
						   $data['aurus_color88'] = $this->config->get('aurus_color88'); 
						   $data['aurus_color89'] = $this->config->get('aurus_color89'); 
						   $data['aurus_color90'] = $this->config->get('aurus_color90'); 
						   $data['aurus_color91'] = $this->config->get('aurus_color91'); 
						   $data['aurus_color92'] = $this->config->get('aurus_color92'); 
						   $data['aurus_color93'] = $this->config->get('aurus_color93'); 
						   $data['aurus_color94'] = $this->config->get('aurus_color94'); 
      

                   $data['cart2'] = $this->load->controller('common/cart2');
      

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

			  
			if(isset($this->request->post['location'])) {
				$data['location_mmenu'] = $this->request->post['location'];
			}
			if(isset($this->request->post['aridius_mob_menu'])) {
				$this->response->setOutput($this->load->view('common/aridius_mob_menu', $data));
				} else {

            $data['google_analytics']     = html_entity_decode($this->config->get('yamarket_fusion_analytics'), ENT_QUOTES, 'UTF-8');
            
				return $this->load->view('common/header', $data);
			} 
	
	}
}
