<?php
# Разработчик: Билалов Ильсур
# E-mail: bilalovi@gmail.com
# Skype: oc-designer
# ВК: https://vk.com/ocdesign
# Shiptor - Агрегатор служб доставки

class ControllerExtensionPaymentShiptorPay extends Controller {
	public function index() {
		$data['button_confirm'] = $this->language->get('button_confirm');

		$data['text_loading'] = $this->language->get('text_loading');

		$data['continue'] = $this->url->link('checkout/success');

		return $this->load->view('extension/payment/shiptor_pay', $data);
	}

	public function confirm() {
		if ($this->session->data['payment_method']['code'] == 'shiptor_pay') {
			$this->load->model('checkout/order');

			$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('shiptor_pay_order_status_id'));
		}
	}
}