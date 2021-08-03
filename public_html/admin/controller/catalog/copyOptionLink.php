<?php

class ControllerCatalogcopyOptionLink extends Controller {
	public function index() {

		$this->load->model('catalog/product');
		$this->load->model('catalog/option');

		$this->load->language('catalog/copyOptionLink');

		// Find which protocol to use to pass the full image link back
		if ($this->request->server['HTTPS']) {
			$server = HTTPS_CATALOG;
		} else {
			$server = HTTP_CATALOG;
		}

		$data['heading_title'] = $this->language->get('heading_title');

		// Text
		$data['text_on'] = $this->language->get('text_on');
		$data['text_off'] = $this->language->get('text_off');
		$data['text_option'] = $this->language->get('text_option');
		$data['text_product'] = $this->language->get('text_product');
		$data['text_new'] = $this->language->get('text_new');
		$data['text_join'] = $this->language->get('text_join');
		$data['text_copyOptionLink_no'] = $this->language->get('text_copyOptionLink_no');
		$data['link_view_0'] = $this->language->get('link_view_0');
		$data['link_view_1'] = $this->language->get('link_view_1');
		$data['link_view_2'] = $this->language->get('link_view_2');
		$data['link_view_3'] = $this->language->get('link_view_3');


		// Entry
		$data['entry_option_value'] = $this->language->get('entry_option_value');
		$data['entry_close'] = $this->language->get('entry_close');
		$data['entry_save'] = $this->language->get('entry_save');
		$data['entry_link_view'] = $this->language->get('entry_link_view');
		$data['entry_link_name'] = $this->language->get('entry_link_name');
		$data['entry_link_image'] = $this->language->get('entry_link_image');
		$data['entry_copy_name'] = $this->language->get('entry_copy_name');
		$data['entry_copy_name_option'] = $this->language->get('entry_copy_name_option');
		$data['entry_product_option'] = $this->language->get('entry_product_option');
		$data['entry_copy_data'] = $this->language->get('entry_copy_data');
		$data['entry_copy_data_error'] = $this->language->get('entry_copy_data_error');
		$data['entry_product_option_danger'] = $this->language->get('entry_product_option_danger');
		$data['entry_product_link_danger'] = $this->language->get('entry_product_link_danger');

		// Button
		$data['button_remove'] = $this->language->get('button_remove');

		$data['token'] = $this->session->data['token'];

		$data['ProductOptionLink_on_off_fullcheck'] = $this->config->get('ProductOptionLink_on_off_fullcheck');
		
		if ($this->config->get('ProductOptionLink_on_off_save')) {
			$data['ProductOptionLink_on_off_save'] = $this->config->get('ProductOptionLink_on_off_save');
		} else {
			$data['ProductOptionLink_on_off_save'] = 0;
		}

		$copydata = $this->request->post;
		
		if (isset($copydata['product_main'])) {
			$data['product_main'] = $copydata['product_main'];
		} else {
			$data['product_main'] = '';
		}

		if (isset($data['product_main']['option_value_id'])) {
			$option_info_main = $this->model_catalog_option->getOptionValue($data['product_main']['option_value_id']);
			$data['product_main']['option_value_id_name'] = $option_info_main['name'];
		} else {
			$data['product_main']['option_value_id_name'] = '';
		}

		if (isset($copydata['product_option_value'])) {
			$data['product_option_value'] = $copydata['product_option_value'];
		} else {
			$data['product_option_value'] = '';
		}

		if (isset($copydata['option_row'])) {
			$option_row = $copydata['option_row'];
		} else {
			$option_row = '';
		}

		if (isset($copydata['option_value_row'])) {
			$option_value_row = $copydata['option_value_row'];
		} else {
			$option_value_row = '';
		}

		if (isset($copydata['data_copyOptionLink'])) {
			$copyOptionLink_input = $copydata['data_copyOptionLink'];
		} else {
			$copyOptionLink_input = '';
		}

		if (isset($copydata['product_option'])) {
			$data['product_option'] = $copydata['product_option'];
		} else {
			$data['product_option'] = '';
		}

		if ($copyOptionLink_input) {
			foreach ($copyOptionLink_input as $copyOptionLink_input) {
				for ($i=0; $i<$option_value_row; $i++) {

					if ($copyOptionLink_input['name'] == 'product_option['.$option_row.'][product_option_value]['.$i.'][option_value_id]') {

						$data['data_copyOptionLink'][$i]['option_value_id'] = $copyOptionLink_input['value'];

						$option_info = $this->model_catalog_option->getOptionValue($copyOptionLink_input['value']);
						if ($option_info)	{
							$data['data_copyOptionLink'][$i]['option_name']= $option_info['name'];
						}
					}

					if ($copyOptionLink_input['name'] == 'product_option['.$option_row.'][product_option_value]['.$i.'][quantity]') {

						$data['data_copyOptionLink'][$i]['quantity'] = $copyOptionLink_input['value'];

						$product_info = $this->model_catalog_product->getProduct($copyOptionLink_input['value']);
						if ($product_info)	{
							$data['data_copyOptionLink'][$i]['product_name']= $product_info['name'];
						}

						$data['data_copyOptionLink'][$i]['product_option'] = $this->model_catalog_product->getProductOptions($copyOptionLink_input['value']);
					}

					if ($copyOptionLink_input['name'] == 'product_option['.$option_row.'][product_option_value]['.$i.'][subtract]') {
							$data['data_copyOptionLink'][$i]['subtract'] = $copyOptionLink_input['value'];}

					if ($copyOptionLink_input['name'] == 'product_option['.$option_row.'][product_option_value]['.$i.'][price_prefix]'){
						$data['data_copyOptionLink'][$i]['price_prefix'] = $copyOptionLink_input['value'];}

					if ($copyOptionLink_input['name'] == 'product_option['.$option_row.'][product_option_value]['.$i.'][price]') {
						$data['data_copyOptionLink'][$i]['price'] = $copyOptionLink_input['value'];}

					if ($copyOptionLink_input['name'] == 'product_option['.$option_row.'][product_option_value]['.$i.'][points_prefix]') {
						$data['data_copyOptionLink'][$i]['points_prefix'] = $copyOptionLink_input['value'];}

					if ($copyOptionLink_input['name'] == 'product_option['.$option_row.'][product_option_value]['.$i.'][points]') {
						$data['data_copyOptionLink'][$i]['points'] = $copyOptionLink_input['value'];}

					if ($copyOptionLink_input['name'] == 'product_option['.$option_row.'][product_option_value]['.$i.'][weight_prefix]') {
						$data['data_copyOptionLink'][$i]['weight_prefix'] = $copyOptionLink_input['value'];}

					if ($copyOptionLink_input['name'] == 'product_option['.$option_row.'][product_option_value]['.$i.'][weight]') {
						$data['data_copyOptionLink'][$i]['weight'] = $copyOptionLink_input['value'];}
				}
			}
		}

		$this->response->setOutput($this->load->view('catalog/copyOptionLink', $data));
	}


	public function newOptionLink() {
		$this->load->model('catalog/copyOptionLink');
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->model_catalog_copyOptionLink->addOption($this->request->post);
		}
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/copyOptionLink');

			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = 8;
			}

			$filter_data = array(
				'filter_name'  => $filter_name,
				'start'        => 0,
				'limit'        => $limit
			);

			$results = $this->model_catalog_copyOptionLink->getProducts($filter_data);

			foreach ($results as $result) {
				$option_data = array();

				$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
				);
			}
		}

		$this->response->setOutput(json_encode($json));
	}
}