<?php
class ControllerProductProduct extends Controller {
	private $error = array();


				protected function getReviewsFirstPage($product_id) {
					$this->load->language('product/product');
					$this->load->model('catalog/review');
					$data['text_no_reviews'] = $this->language->get('text_no_reviews');
					$page = 1;
					$data['reviews'] = array();
					$review_total = $this->model_catalog_review->getTotalReviewsByProductId($product_id);
					$results = $this->model_catalog_review->getReviewsByProductId($product_id, 0, $review_total);
					foreach ($results as $result) {
					$data['reviews'][] = array(
							'author'     => $result['author'],
							'text'       => nl2br($result['text']),
							'rating'     => (int)$result['rating'],
							'dignity'       => nl2br($result['dignity']),
							'limitations'   => nl2br($result['limitations']),
							'date_added' => date($this->language->get('date_format_short2'), strtotime($result['date_added']))
						);
					}
					$pagination = new Pagination();
					$pagination->total = $review_total;
					$pagination->page = $page;
					$pagination->limit = 5;
					$pagination->url = $this->url->link('product/product/review', 'product_id=' . $product_id . '&page={page}');
					$data['pagination'] = $pagination->render();
					$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));
					return $data;
				}
				
	public function index() {
		$this->load->language('product/product');

				    $this->load->language('extension/module/aurus');
      

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('catalog/category');

		if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
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

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {

            $data['aridiusundersell'] = $this->load->controller('module/aridiusundersell');
			

			$this->load->model('catalog/aridiussize');
			$size_info = $this->model_catalog_aridiussize->getSizeProduct($product_id);
			if(!$size_info) {
				$size_info = $this->model_catalog_aridiussize->getSizeCategory($product_id);
			}
		    if($size_info) {
			$data['aridius_size'] = $this->load->controller('product/aridius_size/index');
			}else{	
				$data['aridius_size'] = '';
			}
			

            $data['aridiusinstock'] = $this->load->controller('module/aridiusinstock');
			

            $data['aridiusfastorder'] = $this->load->controller('module/aridiusfastorder');
			
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

			if ($product_info['meta_title']) {
				$this->document->setTitle($product_info['meta_title']);
			} else {
				$this->document->setTitle($product_info['name']);
			}

			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			
                
			
                
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/locale/'.$this->session->data['language'].'.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

			if ($product_info['meta_h1']) {
				$data['heading_title'] = $product_info['meta_h1'];
			} else {
				$data['heading_title'] = $product_info['name'];
			}

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');

		   $this->language->load('extension/module/aridiusundersell');
           $data['buttonundersell_title'] = $this->language->get('buttonundersell_title');
		   $data['aridiusundersell_status'] = $this->config->get('aridiusundersell_status');
			

			$this->language->load('extension/module/aridiusinstock');
           $data['buttoninstock_title'] = $this->language->get('buttoninstock_title');
		   $data['aridiusinstock_status'] = $this->config->get('aridiusinstock_status');
			

		   $this->language->load('extension/module/aridiusfastorder');
           $data['button_titlef'] = $this->language->get('button_titlef');
		   $data['aridiusfastorder_status'] = $this->config->get('aridiusfastorder_status');
			
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];

                    $data['length'] = number_format($product_info['length'], 0 ,"","").' '.$this->length->getUnit($product_info['length_class_id']);
                    $data['width']  = number_format($product_info['width'], 0 ,"","").' '.$this->length->getUnit($product_info['length_class_id']);
                    $data['height'] = number_format($product_info['height'], 0 ,"","").' '.$this->length->getUnit($product_info['length_class_id']);
                    $data['weight'] = number_format($product_info['weight'], 0 ,"","").' '.$this->weight->getUnit($product_info['weight_class_id']);
                    $data['upc']  = $product_info['upc'];
			        $data['sku']  = $product_info['sku'];
					$data['ean']  = $product_info['ean'];
					$data['jan']  = $product_info['jan'];
					$data['isbn'] = $product_info['isbn'];
					$data['mpn']  = $product_info['mpn'];
      
			$data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');

	                $data['description2'] =	utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('aurus_chars_desc')) . '..';
      

			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = $product_info['quantity'];
			} else {
				$data['stock'] = $this->language->get('text_instock');
			}

			$this->load->model('tool/image');

               $data['language_id'] = $this->config->get('config_language_id');
			   $data['config_minify'] = $this->config->get('config_minify');
			   $data['text_description2'] = $this->language->get('text_description2');
			   $data['text_tabb_main'] = $this->language->get('text_tabb_main');
               $data['text_end_stock'] = $this->language->get('text_end_stock');
               $data['button_quickview'] = $this->language->get('button_quickview');
               $data['button_instock'] = $this->language->get('button_instock');	
               $data['text_lengthp'] = $this->language->get('text_lengthp');
               $data['text_widthp'] = $this->language->get('text_widthp');
               $data['text_heightp'] = $this->language->get('text_heightp');
               $data['text_weightp'] = $this->language->get('text_weightp');
			   $data['text_dignity'] = $this->language->get('text_dignity');
			   $data['text_limitations'] = $this->language->get('text_limitations');
			   $data['text_related2'] = $this->language->get('text_related2');
			   $data['day'] = $this->language->get('day');
			   $data['hour'] = $this->language->get('hour');
			   $data['minute'] = $this->language->get('minute');
			   $data['second'] = $this->language->get('second');
			   $data['end_special'] = $this->language->get('end_special');
			   $data['end_special2'] = $this->language->get('end_special2');
			   $data['text_discount2'] = $this->language->get('text_discount2');
		       $data['text_wish'] = $this->language->get('text_wish');
			   $data['text_comp'] = $this->language->get('text_comp');
               $data['button_load'] = $this->language->get('button_load');
	           $data['text_quickview'] = $this->language->get('text_quickview');	
	           $data['text_saving'] = $this->language->get('text_saving');
	           $data['tab_images'] = $this->language->get('tab_images');
			   $data['aurus_elevatezoom'] = $this->config->get('aurus_elevatezoom');
					$manufacturer_dta = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);
                       if(isset($manufacturer_dta['image']) && file_exists(DIR_IMAGE.$manufacturer_dta['image']))
                    {
                       $manufacturer_img = $this->model_tool_image->resize($manufacturer_dta['image'], $this->config->get('aurus_product_man_width'), $this->config->get('aurus_product_man_height'));
                       $data['manufacturer_img'] = $manufacturer_img;
                    }
		            $data['aurus_product_man_img'] = $this->config->get('aurus_product_man_img');
					$data['aurus_product_timer'] = $this->config->get('aurus_product_timer');
					$data['aurus_product_sticky_menu'] = $this->config->get('aurus_product_sticky_menu');
					$data['aurus_product_show_share'] = $this->config->get('aurus_product_show_share');
					$data['aurus_product_show_sku']  = $this->config->get('aurus_product_show_sku');
					$data['aurus_product_show_upc']  = $this->config->get('aurus_product_show_upc');
					$data['aurus_product_show_ean']  = $this->config->get('aurus_product_show_ean');
					$data['aurus_product_show_jan']  = $this->config->get('aurus_product_show_jan');
					$data['aurus_product_show_isbn'] = $this->config->get('aurus_product_show_isbn');
					$data['aurus_product_show_mpn']  = $this->config->get('aurus_product_show_mpn');
					$data['aurus_product_sku']  = $this->config->get('aurus_product_sku');
					$data['aurus_product_upc']  = $this->config->get('aurus_product_upc');
					$data['aurus_product_ean']  = $this->config->get('aurus_product_ean');
					$data['aurus_product_jan']  = $this->config->get('aurus_product_jan');
					$data['aurus_product_isbn'] = $this->config->get('aurus_product_isbn');
					$data['aurus_product_mpn']  = $this->config->get('aurus_product_mpn');
					$data['aurus_show_attribute']  = $this->config->get('aurus_show_attribute');
					$data['aurus_attribute_see']  = $this->config->get('aurus_attribute_see');
					$data['aurus_pr_attribute_seeall']  = $this->config->get('aurus_pr_attribute_seeall');
										$data['aurus_attribute_line'] = $this->config->get('aurus_attribute_line');
					$data['aurus_top_links7'] = $this->config->get('aurus_top_links7');
					$top_links9 = $this->config->get('aurus_top_links9');
					$data['aurus_top_links9'] = array();
			        if(isset($top_links9) && is_array($top_links9)) foreach ($top_links9 as $top_link9) {
					if ($top_link9['image'] && is_file(DIR_IMAGE . $top_link9['image'])) {
						$aurus_block_prod = $this->model_tool_image->resize($top_link9['image'], 100, 100);
					} else {
						$aurus_block_prod = $this->model_tool_image->resize('no_image.png', 100, 100);
					}
					$data['aurus_top_links9'][] = array(
						'description' => $top_link9['description'],
						'title' => $top_link9['title'],
						'faicon' => $top_link9['faicon'],
						'image_href'  => $aurus_block_prod
					  );
				    }
					$data['aurus_name_sticker_product_new'] = $this->config->get('aurus_name_sticker_product_new');
					$data['aurus_name_sticker_product_top'] = $this->config->get('aurus_name_sticker_product_top');		
					$data['aurus_sticker_sale_product_auto'] = $this->config->get('aurus_sticker_sale_product_auto');	
					$data['aurus_sticker_new_product_auto'] = $this->config->get('aurus_sticker_new_product_auto');
					$data['aurus_sticker_product_new_day'] = $this->config->get('aurus_sticker_product_new_day');
					$data['aurus_sticker_product_top_rating'] = $this->config->get('aurus_sticker_product_top_rating');
					$data['aurus_sticker_product_top_viewed'] = $this->config->get('aurus_sticker_product_top_viewed');
					$data['aurus_sticker_product_top_ratinr'] = $this->config->get('aurus_sticker_product_top_ratinr');
					$data['aurus_sticker_top_product_auto'] = $this->config->get('aurus_sticker_top_product_auto');
					$data['aurus_description_cat'] = $this->config->get('aurus_description_cat');
					$data['aurus_limit_symbolst'] = $this->config->get('aurus_limit_symbolst');
					$data['aurus_rating_cat'] = $this->config->get('aurus_rating_cat');
					$data['aurus_wishlist_cat'] = $this->config->get('aurus_wishlist_cat');
	                $data['aurus_compare_cat'] = $this->config->get('aurus_compare_cat');
					$data['aridius_qckview_status'] = $this->config->get('aridius_qckview_status');
					$data['aurus_share'] = $this->config->get('aurus_share');
					$data['aurus_product_raiting'] = $this->config->get('aurus_product_raiting');
					$data['aurus_product_size'] = $this->config->get('aurus_product_size');
					$data['aurus_product_stock'] = $this->config->get('aurus_product_stock');
					$data['aurus_st_cart'] = $this->config->get('aurus_st_cart');
					$data['aurus_short_desc'] = $this->config->get('aurus_short_desc');
					$data['aurus_img_colleft'] = $this->config->get('aurus_img_colleft');
					$data['aurus_product_weight'] = $this->config->get('aurus_product_weight');
					$data['aurus_product_kod_tovara'] = $this->config->get('aurus_product_kod_tovara');
					$data['aridiusinstock_status'] = $this->config->get('aridiusinstock_status');
					$data['aurus_image_popup_width'] = $this->config->get($this->config->get('config_theme') . '_image_popup_width');
					$data['aurus_image_popup_height'] = $this->config->get($this->config->get('config_theme') . '_image_popup_height');
					$data['aurus_options_mainimg'] = $this->config->get('aurus_options_mainimg');
					$data['aurus_options_prise'] = $this->config->get('aurus_options_prise');
					$data['aurus_relpr_tab'] = $this->config->get('aurus_relpr_tab');
					$data['aurus_limit_atr'] = $this->config->get('aurus_limit_atr');
					$data['aurus_ratpr'] = $this->config->get('aurus_ratpr');
					$data['aurus_wishpr'] = $this->config->get('aurus_wishpr');
					$data['aurus_comppr'] = $this->config->get('aurus_comppr');
					$data['aurus_quickviewpr'] = $this->config->get('aurus_quickviewpr');
					$data['aurus_relcarusel'] = $this->config->get('aurus_relcarusel');				
					$data['aurus_relnavigation'] = $this->config->get('aurus_relnavigation');					
					$data['aurus_relautoplay_on'] = $this->config->get('aurus_relautoplay_on');					
					$data['aurus_relautoplay'] = $this->config->get('aurus_relautoplay');					
					$data['aurus_relitems'] = $this->config->get('aurus_relitems');					
					$data['aurus_relrew_speed'] = $this->config->get('aurus_relrew_speed');					
					$data['aurus_relstophover'] = $this->config->get('aurus_relstophover');		
		            $data['aurus_show_saving'] = $this->config->get('aurus_show_saving');
	                $data['aurus_show_tab_img'] = $this->config->get('aurus_show_tab_img');			
		            $data['aurus_show_stsale'] = $this->config->get('aurus_show_stsale');	
		            $data['aurus_show_tablsize'] = $this->config->get('aurus_show_tablsize');	
	                $data['aurus_imageadd_hover'] = $this->config->get('aurus_imageadd_hover');
	                $data['aurus_imageadd_nav'] = $this->config->get('aurus_imageadd_nav');
	                $data['aurus_imageadd_q'] = $this->config->get('aurus_imageadd_q');
	                $data['aurus_imageadd_vertical'] = $this->config->get('aurus_imageadd_vertical');
	                $data['aurus_rating_pr'] = $this->config->get('aurus_rating_pr');
	                $data['aurus_man'] = $this->config->get('aurus_man');
      

			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
			} else {
				$data['popup'] = '';
			}

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
				$this->document->setOgImage($data['thumb']);
			} else {
				$data['thumb'] = '';
			}


					if ($product_info['image']) {
						$data['thumb_add'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'));
						$this->document->setOgImage($data['thumb_add']);
					} else {
						$data['thumb_add'] = '';
					}
					if ($product_info['image']) {
						$data['thumb_clone'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('aurus_product_clone_width'), $this->config->get('aurus_product_clone_height'));
						$this->document->setOgImage($data['thumb_clone']);
					} else {
						$data['thumb_clone'] = '';
					}
      
			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),

                    'thumb2' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height')),
      
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
				);
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['price'] = false;
			}


                    $data['sh_currency'] = $this->session->data['currency'];
      
			if ((float)$product_info['special']) {
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

                    $data['saving_product'] = round((($product_info['price'] - $product_info['special']) / $product_info['price']) * 100, 0);
					$this->load->model('catalog/product');	
					$special_info = $this->model_catalog_product->getSpecialDates($product_id);
					if ($special_info) {
						$data['special_date_end'] = $special_info['date_end'];
						$data['special_date_start'] = $special_info['date_start'];
					} else {
						$date['special_date_end'] = false;
						$date['special_date_start'] = false;
					}
      
			} else {
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}


			$data['custom_tabs'] = array();

			$results = $this->model_catalog_product->getProductCustomtabs($this->request->get['product_id']);
			foreach ($results as $result) {
			   $data['custom_tabs'][] = array(
			        'title' => $result['title'],
			        'description' => html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
			   );
			}	
			

			$stickers2 = $this->model_catalog_product->getProductStickerProductId($this->request->get['product_id']);

			$data['stickers2'] = array();

			foreach ($stickers2 as $sticker2) {
				$data['stickers2'][] = array(
				'background' => $sticker2['background'],
				'color' => $sticker2['color'],
				'name' => $sticker2['name'],
				);
			}
			
			$data['options'] = array();

			$data['ProductOptionLink_status'] = $this->config->get('ProductOptionLink_status');
			if ($data['ProductOptionLink_status']) {
				$data['POL_style'] = $this->config->get('ProductOptionLink_style');
				$data['ProductOptionLink_on_off_stock'] = $this->config->get('ProductOptionLink_on_off_stock');
				if ($this->config->get('ProductOptionLink_resize_length')>0) {
					$data['ProductOptionLink_resize_length'] = $this->config->get('ProductOptionLink_resize_length');
				} else {
					$data['ProductOptionLink_resize_length'] = 50;
				}
				if ($this->config->get('ProductOptionLink_resize_height')>0) {
					$data['ProductOptionLink_resize_height'] = $this->config->get('ProductOptionLink_resize_height');
				} else {
					$data['ProductOptionLink_resize_height'] = 50;
				}

				$data['text_instock'] = $this->language->get('text_instock');
				$data['text_link_name'] = $this->language->get('text_link_name');
				$data['text_link_price'] = $this->language->get('text_link_price');
				$data['text_no_select'] = $this->language->get('text_no_select');

				foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $links_produkt) {

					if ($links_produkt['type'] == 'link') {

						foreach ($links_produkt['product_option_value'] as $links_value) {
							$links_product_info = $this->model_catalog_product->getProduct($links_value['quantity']);

							if ($links_product_info['status']) {
								if (!$links_product_info['special']) {
									$links_price = $links_product_info['price'];
								} else {
									$links_price = $links_product_info['special'];
								}
								if ($links_value['price_prefix'] == '1') {
									$links_image = $links_value['image'];
								} elseif ($links_value['price_prefix'] == '2'){
									$links_image = $links_product_info['image'];
								} else {
									$links_image = '';
								}

								$data['links'][$links_produkt['product_option_id']][] = array(
									'product_option_id'      => $links_produkt['product_option_id'],
									'product_id'          	 => ceil($links_value['quantity']),
									'link_name'				 => $links_value['subtract'],
									'name'                	 => $links_value['name'],
									'quantity'				 => $links_product_info['quantity'],
									'links_model'			 => $links_product_info['model'],
									'links_name'			 => $links_product_info['name'],
									'links_price'			 => $this->currency->format($links_price, $this->session->data['currency']),
									'links_stock_status'	 => $links_product_info['stock_status'],
									'image'                  => $links_image ? $this->model_tool_image->resize($links_image, $data['ProductOptionLink_resize_length'], $data['ProductOptionLink_resize_height']) : '',
									'href'       			 => $this->url->link('product/product', 'product_id=' . ceil($links_value['quantity']))
								);
							}
						}
					};
				}
			}
				

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],

                     'image_opt'               => $option_value['image_opt'] ? $this->model_tool_image->resize($option_value['image_opt'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height')) : '',
                     'image_opt_additional'    => $option_value['image_opt'] ? $this->model_tool_image->resize($option_value['image_opt'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height')) : '',
	                 'image_opt_popup'         => $option_value['image_opt'] ? $this->model_tool_image->resize($option_value['image_opt'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')) : '',
	 
							'name'                    => $option_value['name'],
							
                     'image'                  => $option_value['image'] ? $this->model_tool_image->resize($option_value['image'], $this->config->get('aurus_product_optionimg_width'), $this->config->get('aurus_product_optionimg_height')) : '',
      

			'opt_additional'     => $this->model_tool_image->resize($option_value['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height')),
     		'opt_thumb'          => $this->model_tool_image->resize($option_value['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height')),
	 

                      'popup' => $this->model_tool_image->resize($option_value['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                      'optthumb' => $this->model_tool_image->resize($option_value['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height')),
					  'optthumb2' => $this->model_tool_image->resize($option_value['image'], $this->config->get('aurus_product_clone_width'), $this->config->get('aurus_product_clone_height')),
	  
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

			$data['review_status'] = $this->config->get('config_review_status');

			if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
				$data['review_guest'] = true;
			} else {
				$data['review_guest'] = false;
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}

			$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$data['rating'] = (int)$product_info['rating'];

                    $data['viewed'] = (int)$product_info['viewed'];
			        $data['dateadded'] = $product_info['date_added'];
					$data['quantity'] = $product_info['quantity'];
      

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}

			$data['share'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			$data['products'] = array();

			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(

					'dateadded'       => $result['date_added'],
					'viewed'          => $result['viewed'],
					'rating'          => $result['rating'],
					'attribute' => $this->model_catalog_product->getProductAttributes($result['product_id']),
			        'stickers2' => $this->model_catalog_product->getProductStickerProductId($result['product_id']),
					'quantity'        => $result['quantity'],	
					'price_sticker'        => $result['price'],
					'special_sticker'      => (isset($result['special']) ? $result['special'] : false),	
      
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			$data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}

			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');

// FX CC →
                if (ctype_digit((string)$product_info['meta_keyword'])){
			        $this->document->setKeywords('');
			        $this->document->delCanonical();
			        $this->document->addLink($this->url->link('product/product', 'product_id=' . (int)$product_info['meta_keyword']), 'canonical');
    			}
// ← FX CC
			
			$data['header'] = $this->load->controller('common/header');


					    if(isset($this->request->post['aridius_quickview'])) {
						$data['aridius_qckview_tab_description'] = $this->config->get('aridius_qckview_tab_description');
						$data['aridius_qckview_tab_character'] = $this->config->get('aridius_qckview_tab_character');
						$data['aridius_qckview_tab_reviews'] = $this->config->get('aridius_qckview_tab_reviews');
						$data['aridius_qckview_tab_additional'] = $this->config->get('aridius_qckview_tab_additional');
						$data['aridius_qckview_button_wish'] = $this->config->get('aridius_qckview_button_wish');
						$data['aridius_qckview_button_compare'] = $this->config->get('aridius_qckview_button_compare');
						$data['aridius_qckview_rating'] = $this->config->get('aridius_qckview_rating');
						$data['aridius_qckview_short_info'] = $this->config->get('aridius_qckview_short_info');
						$data['aridius_qckview_show_stsale'] = $this->config->get('aridius_qckview_show_stsale');
						$data['aridius_qckview_show_saving'] = $this->config->get('aridius_qckview_show_saving');
						$data['aridius_qckview_manufacturer'] = $this->config->get('aridius_qckview_manufacturer');
						$data['aridius_qckview_stock'] = $this->config->get('aridius_qckview_stock');
						$data['aridius_qckview_code_product'] = $this->config->get('aridius_qckview_code_product');
						$data['tab_description'] = $this->language->get('tab_description');
						$data['tab_products'] = $this->language->get('tab_products');
						$data['tab_attribute'] = $this->language->get('tab_attribute');
						$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);
						$data['text_dignity'] = $this->language->get('text_dignity');
						$data['text_limitations'] = $this->language->get('text_limitations');
						}
						if(isset($this->request->post['aridius_quickview'])) {
							$data['ard_quckview'] = $this->load->view('product/aridius_quickview', $data);
						} else {
							$data['ard_quckview'] = '';
					    }
      

				$data['hrefs'] = $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id']);
				$data['reviews_first'] = $this->getReviewsFirstPage((int)$this->request->get['product_id']);
                
			$this->response->setOutput($this->load->view('product/product', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');

// FX CC →
                if (ctype_digit((string)$product_info['meta_keyword'])){
			        $this->document->setKeywords('');
			        $this->document->delCanonical();
			        $this->document->addLink($this->url->link('product/product', 'product_id=' . (int)$product_info['meta_keyword']), 'canonical');
    			}
// ← FX CC
			
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function review() {
		$this->load->language('product/product');

				    $this->load->language('extension/module/aurus');
      

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

					$data['text_dignity'] = $this->language->get('text_dignity');
			        $data['text_limitations'] = $this->language->get('text_limitations');
      

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],

					'dignity'       => nl2br($result['dignity']),
					'limitations'   => nl2br($result['limitations']),
      
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		$this->response->setOutput($this->load->view('product/review', $data));
	}

	public function write() {
		$this->load->language('product/product');

				    $this->load->language('extension/module/aurus');
      

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getRecurringDescription() {
		$this->load->language('product/product');

				    $this->load->language('extension/module/aurus');
      
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
