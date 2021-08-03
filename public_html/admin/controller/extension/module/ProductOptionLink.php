<?php
// *	ProductOptionLink


class ControllerExtensionModuleProductOptionLink extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/ProductOptionLink');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('ProductOptionLink', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module/ProductOptionLink', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');


		// Основные локализация
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');


		// Табы локализация
		$data['tab_settings_admin'] = $this->language->get('tab_settings_admin');
		$data['tab_settings_user'] = $this->language->get('tab_settings_user');
		$data['tab_css'] = $this->language->get('tab_css');
		$data['link_view_0'] = $this->language->get('link_view_0');
		$data['link_view_1'] = $this->language->get('link_view_1');
		$data['link_view_2'] = $this->language->get('link_view_2');
		$data['link_view_3'] = $this->language->get('link_view_3');

		// Text
		$data['text_info_tab_settings_admin'] = $this->language->get('text_info_tab_settings_admin');
		$data['text_info_tab_settings_user'] = $this->language->get('text_info_tab_settings_user');
		$data['text_info_tab_css'] = $this->language->get('text_info_tab_css');
		$data['text_info_tab_css_mini'] = $this->language->get('text_info_tab_css_mini');
		$data['text_on'] = $this->language->get('text_on');
		$data['text_off'] = $this->language->get('text_off');
		$data['text_option'] = $this->language->get('text_option');
		$data['text_product'] = $this->language->get('text_product');

		// Entry
		$data['entry_style_name'] = $this->language->get('entry_style_name');
		$data['entry_style_link'] = $this->language->get('entry_style_link');
		$data['entry_style_product'] = $this->language->get('entry_style_product');
		$data['entry_style_noproduct'] = $this->language->get('entry_style_noproduct');
		$data['entry_on_of_admin'] = $this->language->get('entry_on_of_admin');
		$data['entry_on_off_name'] = $this->language->get('entry_on_off_name');
		$data['entry_on_off_images'] = $this->language->get('entry_on_off_images');
		$data['entry_on_off_fullcheck'] = $this->language->get('entry_on_off_fullcheck');
		$data['entry_on_off_save'] = $this->language->get('entry_on_off_save');
		$data['entry_link_view'] = $this->language->get('entry_link_view');
		$data['entry_on_off_stock'] = $this->language->get('entry_on_off_stock');
		$data['entry_resize'] = $this->language->get('entry_resize');
		$data['entry_resize_length'] = $this->language->get('entry_resize_length');
		$data['entry_resize_height'] = $this->language->get('entry_resize_height');

		// Help
		$data['help_fullcheck'] = $this->language->get('help_fullcheck');
		$data['help_save'] = $this->language->get('help_save');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/ProductOptionLink', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/ProductOptionLink', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);


		// Статус модуля
		if (isset($this->request->post['ProductOptionLink_status'])) {
			$data['ProductOptionLink_status'] = $this->request->post['ProductOptionLink_status'];
		} else {
			$data['ProductOptionLink_status'] = $this->config->get('ProductOptionLink_status');
		}

		// Статус по умолчанию Вывод опций
		if (isset($this->request->post['ProductOptionLink_link_view'])) {
			$data['ProductOptionLink_link_view'] = $this->request->post['ProductOptionLink_link_view'];
		} else {
			$data['ProductOptionLink_link_view'] = $this->config->get('ProductOptionLink_link_view');
		}

		// Статус по умолчанию названия
		if (isset($this->request->post['ProductOptionLink_on_off_name'])) {
			$data['ProductOptionLink_on_off_name'] = $this->request->post['ProductOptionLink_on_off_name'];
		} else {
			$data['ProductOptionLink_on_off_name'] = $this->config->get('ProductOptionLink_on_off_name');
		}

		// Статус по умолчанию изображения
		if (isset($this->request->post['ProductOptionLink_on_off_images'])) {
			$data['ProductOptionLink_on_off_images'] = $this->request->post['ProductOptionLink_on_off_images'];
		} else {
			$data['ProductOptionLink_on_off_images'] = $this->config->get('ProductOptionLink_on_off_images');
		}

		// Статус полной проверки
		if (isset($this->request->post['ProductOptionLink_on_off_fullcheck'])) {
			$data['ProductOptionLink_on_off_fullcheck'] = $this->request->post['ProductOptionLink_on_off_fullcheck'];
		} else {
			$data['ProductOptionLink_on_off_fullcheck'] = $this->config->get('ProductOptionLink_on_off_fullcheck');
		}
		
		// Статус пакетного сохранения 
		if (isset($this->request->post['ProductOptionLink_on_off_save'])) {
			$data['ProductOptionLink_on_off_save'] = $this->request->post['ProductOptionLink_on_off_save'];
		} else {
			$data['ProductOptionLink_on_off_save'] = $this->config->get('ProductOptionLink_on_off_save');
		}

		// Статус вывода при отутствии товара
		if (isset($this->request->post['ProductOptionLink_on_off_stock'])) {
			$data['ProductOptionLink_on_off_stock'] = $this->request->post['ProductOptionLink_on_off_stock'];
		} else {
			$data['ProductOptionLink_on_off_stock'] = $this->config->get('ProductOptionLink_on_off_stock');
		}

		// Размер изображения длина
		if (isset($this->request->post['ProductOptionLink_resize_length'])) {
			$data['ProductOptionLink_resize_length'] = $this->request->post['ProductOptionLink_resize_length'];
		} else {
			$data['ProductOptionLink_resize_length'] = $this->config->get('ProductOptionLink_resize_length');
		}

		// Размер изображения высота
		if (isset($this->request->post['ProductOptionLink_resize_height'])) {
			$data['ProductOptionLink_resize_height'] = $this->request->post['ProductOptionLink_resize_height'];
		} else {
			$data['ProductOptionLink_resize_height'] = $this->config->get('ProductOptionLink_resize_height');
		}

		// Стили Новые в одном массиве
		if (isset($this->request->post['ProductOptionLink_style'])) {
			$data['ProductOptionLink_style'] = $this->request->post['ProductOptionLink_style'];
		} else {
			$data['ProductOptionLink_style'] = $this->config->get('ProductOptionLink_style');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/ProductOptionLink', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/ProductOptionLink')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}