<?php
# Разработчик: Билалов Ильсур
# E-mail: bilalovi@gmail.com
# Skype: oc-designer
# ВК: https://vk.com/ocdesign
# Shiptor - Агрегатор служб доставки

class ControllerExtensionTotalShiptorTotal extends Controller {
	private $error;

	public function index() {
		$this->load->language('extension/total/shiptor_total');

		$this->document->setTitle($this->language->get('heading_name'));
		$this->document->addStyle('view/javascript/shipping/shiptor/shiptor.css');

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('shiptor_total', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true));
		}

		$data['heading_title']    = $this->language->get('heading_title');

		$data['text_edit']        = $this->language->get('text_edit');
		$data['text_faq']         = $this->language->get('text_faq');
		$data['text_enabled']     = $this->language->get('text_enabled');
		$data['text_disabled']    = $this->language->get('text_disabled');

		$data['entry_status'] 	  = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save']      = $this->language->get('button_save');
		$data['button_cancel']    = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_home'), 'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true));
		$data['breadcrumbs'][] = array('text' => $this->language->get('text_total'), 'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true));
		$data['breadcrumbs'][] = array('text' => $this->language->get('heading_name'), 'href' => $this->url->link('extension/total/shiptor_total', 'token=' . $this->session->data['token'], true));

		$data['action'] = $this->url->link('extension/total/shiptor_total', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true);

		if (isset($this->request->post['shiptor_total_status'])) {
			$data['status'] = $this->request->post['shiptor_total_status'];
		} else {
			$data['status'] = $this->config->get('shiptor_total_status');
		}

		if (isset($this->request->post['shiptor_total_sort_order'])) {
			$data['sort_order'] = $this->request->post['shiptor_total_sort_order'];
		} else {
			$data['sort_order'] = $this->config->get('shiptor_total_sort_order');
		}

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/total/shiptor_total', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/total/shiptor_total')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}