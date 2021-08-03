<?php
class ControllerInformationAridiusNews extends Controller {

	public function index() {
		
		$this->language->load('information/aridius_news');
		$this->load->model('catalog/aridiusnews');
	   
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href'		=> $this->url->link('common/home'),
			'text'		=> $this->language->get('text_home'),
		
		);

		if (isset($this->request->get['aridius_news_id'])) {
			$aridius_news_id = $this->request->get['aridius_news_id'];
		} else {
			$aridius_news_id = 0;
		}

		$aridius_news_info = $this->model_catalog_aridiusnews->getaridius_newsStory($aridius_news_id);

		if ($aridius_news_info) {
		
			$data['breadcrumbs'][] = array(
				'text'		=> $this->language->get('heading_title'),
				'href'		=> $this->url->link('information/aridius_news'),
			);

			$data['breadcrumbs'][] = array(
				'text'		=> $aridius_news_info['title'],
				'href'		=> $this->url->link('information/aridius_news', 'aridius_news_id=' . $this->request->get['aridius_news_id']),
		
			);

			if ($aridius_news_info['meta_title']) {
				$this->document->setTitle($aridius_news_info['meta_title']);
			} else {
				$this->document->setTitle($aridius_news_info['title']);
			}
			
			$this->document->setDescription($aridius_news_info['meta_description']);
			$this->document->setKeywords($aridius_news_info['meta_keyword']);
			
			$this->document->addLink($this->url->link('information/aridius_news', 'aridius_news_id=' . $this->request->get['aridius_news_id']), 'canonical');

     		$data['aridius_news_info'] = $aridius_news_info;

     		$data['heading_title'] = $aridius_news_info['title'];

			$data['description'] = html_entity_decode($aridius_news_info['description']);

			$data['viewed'] = sprintf($this->language->get('text_viewed'), $aridius_news_info['viewed']);

			$data['addthis'] = $this->config->get('aridius_news_aridius_newspage_addthis');
			$data['aurus_share'] = $this->config->get('aurus_share');

			$data['min_height'] = $this->config->get('aridius_news_thumb_height');

			$this->load->model('tool/image');

			if ($aridius_news_info['image']) {
				$data['image'] = true;
			} else {
				$data['image'] = false;
			}
			
			$data['aridius_news_status_review'] = $this->config->get('aridius_news_status_review');

			$data['thumb'] = $this->model_tool_image->resize($aridius_news_info['image'], $this->config->get('aridius_news_thumb_width'), $this->config->get('aridius_news_thumb_height'));
     		$data['button_news'] = $this->language->get('button_news');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['aridius_news'] = $this->url->link('information/aridius_news');
			$data['continue'] = $this->url->link('common/home');

			$this->model_catalog_aridiusnews->updateViewed($this->request->get['aridius_news_id']);

			$data['text_tax'] = $this->language->get('text_tax');
			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['text_posted'] = $this->language->get('text_posted');
			$data['text_products_related'] = $this->language->get('text_products_related');
			$data['text_aridius_news_related'] = $this->language->get('text_aridius_news_related');
			$data['text_more'] = $this->language->get('text_more');
			$data['button_instock'] = $this->language->get('button_instock');
		    $data['aridius_newslist'] = $this->url->link('information/aridius_news');
			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_write'] = $this->language->get('text_write');
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
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');

		    
			if (($this->config->get('aridius_news_review_guest') !=1) || $this->customer->isLogged()) {
				$data['review_guest'] = true;
			} else {
				$data['review_guest'] = false;
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && ($this->config->get('aridius_news_display_captcha')!=1)) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
			} else {
				$data['captcha'] = '';
			}

			$data['aridius_news_id'] = (int)$this->request->get['aridius_news_id'];
			
            // RELATED products
			$data['products'] = array();
			
			$results = $this->model_catalog_aridiusnews->getProductRelated($this->request->get['aridius_news_id']);
	        $data['language_id'] = $this->config->get('config_language_id');
	        $data['button_quickview'] = $this->language->get('button_quickview');
		    $data['aurus_product_man_img'] = $this->config->get('aurus_product_man_img');
			$data['button_load'] = $this->language->get('button_load');

			$data['aurus_top_links7'] = $this->config->get('aurus_top_links7');
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
			$data['aurus_rating_cat'] = $this->config->get('aurus_rating_cat');
			$data['aurus_wishlist_cat'] = $this->config->get('aurus_wishlist_cat');
	        $data['aurus_compare_cat'] = $this->config->get('aurus_compare_cat');
		    $data['aridius_qckview_status'] = $this->config->get('aridius_qckview_status');
			$data['aridiusinstock_status'] = $this->config->get('aridiusinstock_status');

		    $data['aridius_news_rat'] = $this->config->get('aridius_news_rat');
			$data['aridius_news_wish'] = $this->config->get('aridius_news_wish');
		    $data['aridius_news_comp'] = $this->config->get('aridius_news_comp');
		    $data['aridius_news_quickview'] = $this->config->get('aridius_news_quickview');
		
			$data['aridius_news_relcarusel'] = $this->config->get('aridius_news_relcarusel');	
			$data['aridius_news_relnavigation'] = $this->config->get('aridius_news_relnavigation');	
			$data['aridius_news_relautoplay_on'] = $this->config->get('aridius_news_relautoplay_on');
			$data['aridius_news_relautoplay'] = $this->config->get('aridius_news_relautoplay');
			$data['aridius_news_relitems'] = $this->config->get('aridius_news_relitems');
			$data['aridius_news_relrew_speed'] = $this->config->get('aridius_news_relrew_speed');
			$data['aridius_news_relstophover'] = $this->config->get('aridius_news_relstophover');
				
				
		    $data['aurus_limit_symbolst'] = $this->config->get('aurus_limit_symbolst');

		    $data['column_left'] = $this->load->controller('common/column_left');

			foreach ($results as $result) {
				
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('aridius_news_width'), $this->config->get('aridius_news_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('aridius_news_width'), $this->config->get('aridius_news_height'));
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
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'dateadded'  => $result['date_added'],
					'viewed'     => $result['viewed'],
					'rating'     => $result['rating'],
                    'quantity'   => $result['quantity'],				
					'price_sticker'        => $result['price'],
					'special_sticker'      => (isset($result['special']) ? $result['special'] : false),	
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'attribute' => $this->model_catalog_product->getProductAttributes($result['product_id']),
			        'stickers2' => $this->model_catalog_product->getProductStickerProductId($result['product_id']),
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

// RELATED aridius_news

		$data['aridius_news'] = array();

		$results = $this->model_catalog_aridiusnews->getaridius_newsRelated($this->request->get['aridius_news_id']);
			foreach ($results as $result) {

		if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('aridius_news_simwidth'), $this->config->get('aridius_news_simheight'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('aridius_news_simwidth'), $this->config->get('aridius_news_simheight'));
				}
				
				$data['aridius_news'][] = array(
					'aridius_news_id'     => $result['aridius_news_id'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('aridius_news_sim_chars')) . '..',
				    'image'       => $image,
					'title'       => $result['title'],
					'viewed'      => $result['viewed'],
					'href'  => $this->url->link('information/aridius_news', 'aridius_news_id=' . $result['related_aridius_news_id']),
					'posted'   	  => date($this->language->get('date_format_short'), strtotime($result['date_added']))
				);
			}

// RELATED aridius_news	end		

			// Template
			$data['aridius_news_show_date'] = $this->config->get('aridius_news_show_date');
			$data['template'] = $this->config->get('config_template');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('information/aridius_news', $data));

	  	} else {

   	$url = '';
	
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		
		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = (int)$this->config->get($this->config->get('config_theme') . '_product_limit');
		}

				$data = array(
				'page' => $page,
				'limit' => $limit,
				'start' => ($page - 1) * $limit
				);
		
				$total = $this->model_catalog_aridiusnews->getTotalaridius_news();
		
				$pagination = new Pagination();
				$pagination->total = $total;
				$pagination->page = $page;
				$pagination->limit = $limit;
				$pagination->text = $this->language->get('text_pagination');
			
				$pagination->url = $this->url->link('information/aridius_news', $url . '&page={page}');

			    $data['pagination'] = $pagination->render();
					
			    $data['results'] = sprintf($this->language->get('text_pagination'), ($total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total - $limit)) ? $total : ((($page - 1) * $limit) + $limit), $total, ceil($total / $limit));				

			// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
			if ($page == 1) {
			    $this->document->addLink($this->url->link('information/aridius_news', '', true), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('information/aridius_news', '', true), 'prev');
			} else {
			    $this->document->addLink($this->url->link('information/aridius_news', $url . '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($total / $limit) > $page) {
			    $this->document->addLink($this->url->link('information/aridius_news', $url . '&page='. ($page + 1), true), 'next');
			}
			
			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('information/aridius_news', $url . '&limit=' . $value)
				);
			}		

			$aridius_news_data = $this->model_catalog_aridiusnews->getaridius_news($data);

			$this->document->setTitle($this->language->get('heading_title'));

			$data['breadcrumbs'][] = array(
			'href'		=> $this->url->link('common/home'),
			'text'		=> $this->language->get('text_home'),
		     );

			$data['breadcrumbs'][] = array(
            'text'		=> $this->language->get('heading_title'),
			'href'		=> $this->url->link('information/aridius_news'),
			);
			
			if ($aridius_news_data) {

				$data['heading_title'] = $this->language->get('heading_title');
				$data['text_more'] = $this->language->get('text_more');
				$data['text_posted'] = $this->language->get('text_posted');
	            $data['text_sort'] = $this->language->get('text_sort');
		        $data['button_list'] = $this->language->get('button_list');	
	            $data['button_grid'] = $this->language->get('button_grid');	
	
				$chars = $this->config->get('aridius_news_headline_chars');

				$this->load->model('tool/image');

				foreach ($aridius_news_data as $result) {
					$data['aridius_news_data'][] = array(
						'id'  				=> $result['aridius_news_id'],
						'title'				=> $result['title'],
						'description'	=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $chars) . '..',
						'href'				=> $this->url->link('information/aridius_news', 'aridius_news_id=' . $result['aridius_news_id']),
						'thumb'				=> $this->model_tool_image->resize($result['image'], $this->config->get('aridius_news_thumb_width'), $this->config->get('aridius_news_thumb_height')),
						'posted'			=> date($this->language->get('date_format_short'), strtotime($result['date_added']))
					);
				}

			$data['button_continue'] = $this->language->get('button_continue');
			$data['continue'] = $this->url->link('common/home');

			$data['aridius_news_show_date'] = $this->config->get('aridius_news_show_date');
			$data['template'] = $this->config->get('config_template');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('information/aridius_news', $data));
				
			} else {
		  		$this->document->setTitle($this->language->get('text_error'));

	     		$this->document->breadcrumbs[] = array(
					'href'      => $this->url->link('information/aridius_news'),
					'text'      => $this->language->get('text_error'),
				
	     		);

				$data['heading_title'] = $this->language->get('text_error');

				$data['text_error'] = $this->language->get('text_error');

				$data['button_continue'] = $this->language->get('button_continue');

				$data['continue'] = $this->url->link('common/home');

		
			$data['template'] = $this->config->get('config_template');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');	
			
			$this->response->setOutput($this->load->view('error/not_found', $data));

		  	}
		}
	}
	
	public function review() {
			
		$this->load->language('information/aridius_review_news');

	    $this->load->model('catalog/aridiusreviewnews');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');
		$data['text_write_reply'] = $this->language->get('text_write_reply');
		
        $data['aridius_news_display_answer_button'] = $this->config->get('aridius_news_display_answer_button');
		$limit = $this->config->get('aridius_news_limite_page');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_aridiusreviewnews->getTotalReviewsByNewsId($this->request->get['aridius_news_id']);

		$results = $this->model_catalog_aridiusreviewnews->getReviewsByNewsId($this->request->get['aridius_news_id'], ($page - 1) * $limit, $limit);

        foreach ($results as $result) {
			
            $parent = $this->model_catalog_aridiusreviewnews->getReviewsByNewsId($this->request->get['aridius_news_id'],0,10,$result['review_id']);
            $parent_reviews=array();

			foreach($parent as $parents){
                $parent_reviews[] = array(
                    'author'     => $parents['author'],
                    'review_id'  => $parents['review_id'],
                    'text'       => nl2br($parents['text']),
                    'date_added' => date($this->language->get('date_format_short'), strtotime($parents['date_added']))
                );
            }
			
            $data['reviews'][] = array(
                'author'     => $result['author'],
                'parent_id'  => $parent_reviews,
                'review_id'  => $result['review_id'],
                'text'       => nl2br($result['text']),
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }
		
		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('information/aridius_news/review', 'aridius_news_id=' . $this->request->get['aridius_news_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($review_total - $limit)) ? $review_total : ((($page - 1) * $limit) + $limit), $review_total, ceil($review_total / $limit));


		$this->response->setOutput($this->load->view('information/aridius_review_news', $data));
	}

	 public function reply(){
		
        $json=array();
		
        $this->load->language('information/aridius_review_news');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_review'] = $this->language->get('entry_review');
        $data['text_note'] = $this->language->get('text_note');
        $data['entry_rating'] = $this->language->get('entry_rating');
        $data['entry_bad'] = $this->language->get('entry_bad');
        $data['entry_good'] = $this->language->get('entry_good');
        $data['button_continue'] = $this->language->get('button_continue');
        $data['text_loading'] = $this->language->get('text_loading');
        $data['button_cancel'] = $this->language->get('button_cancel');
		$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
		
        $data['parent']=(int)$this->request->post['parent'];  
		
		
					// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && ($this->config->get('aridius_news_display_captcha')!=1)) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
			} else {
				$data['captcha'] = '';
			}
			
		if (($this->config->get('aridius_news_review_guest') !=1) || $this->customer->isLogged()) {
				$data['review_guest'] = true;
		} else {
				$data['review_guest'] = false;
		}

		if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
		} else {
				$data['customer_name'] = '';
		}

        $json['html'] = ($this->load->view('information/aridius_review_news_form', $data));

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

	
	public function write() {
		
		$this->load->language('information/aridius_review_news');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

		if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

		 // Captcha
		 if ($this->config->get($this->config->get('config_captcha') . '_status') && ($this->config->get('aridius_news_display_captcha')!=1)) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		if (!isset($json['error'])) {
				$this->load->model('catalog/aridiusreviewnews');

				$this->model_catalog_aridiusreviewnews->addReviewNews($this->request->get['aridius_news_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
