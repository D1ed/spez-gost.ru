<?php
/**
 * @author    p0v1n0m <support@lutylab.ru>
 * @license   Commercial
 * @link      https://lutylab.ru
 */
class ControllerExtensionModuleLLCDEKExchange extends Controller {
	protected $code = false;
	protected $statics = false;
	protected $ll = false;
	protected $api = false;

	public function __construct($registry) {
		$this->registry = $registry;

		$this->code = basename(__FILE__, '.php');

		$this->statics = new \Config();
		$this->statics->load($this->code);

		$this->ll = new LL\Core($this->registry, $this->code, $this->statics->get('type'));
		$this->api = new LL\CDEK\API($this->ll);
	}

	public function index() {
		$this->load->language($this->ll->getRoute());

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->ll->validate()) {
			$this->load->model('setting/setting');

			$this->model_setting_setting->editSetting($this->ll->getPrefix(), $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->ll->getLinkExtension());
		}

		if (!$this->ll->validate()) {
			$this->session->data['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('localisation/currency');
		$this->load->model('localisation/order_status');
		$this->load->model('localisation/language');
		$this->load->model($this->ll->getExtensionModel() . '/extension');

		$translations = [
			'heading_title',
			'heading_license',
			'button_order',
			'button_exchange',
			'button_shipping',
			'button_cancel',
			'button_save',
			'button_add',
			'button_edit',
			'button_load',
			'button_download',
			'button_clear',
			'tab_api',
			'tab_setting',
			'tab_file',
			'tab_preset',
			'tab_merge',
			'tab_tracking',
			'tab_alert',
			'tab_cron',
			'tab_sms',
			'tab_log',
			'tab_support',
			'text_yes',
			'text_no',
			'text_enabled',
			'text_disabled',
			'text_email',
			'text_site',
			'text_docs',
			'text_service',
			'text_api_docs',
			'text_notify',
			'text_notify_email',
			'text_notify_sms',
			'text_day',
			'entry_api_login',
			'entry_api_key',
			'entry_test',
			'entry_timeout',
			'entry_currency',
			'entry_cod',
			'entry_timezone',
			'entry_invoice_count',
			'entry_sticker_count',
			'entry_sticker_format',
			'entry_files_email',
			'entry_files',
			'entry_service_count',
			'entry_list_order_status',
			'entry_sms_gate',
			'entry_sms_login',
			'entry_sms_password',
			'entry_sms_sender',
			'entry_cron_key',
			'entry_update_statuses',
			'entry_update_day',
			'entry_update_url',
			'entry_update_pvz_url',
			'entry_logging',
			'entry_license',
			'entry_merge',
			'entry_merge_name',
			'entry_merge_model',
			'entry_merge_link',
			'entry_merge_vat',
			'entry_merge_cost',
			'entry_merge_cost_type',
			'entry_merge_from_model',
			'help_log',
			'column_status',
			'column_order_status',
			'column_notify',
			'column_start',
			'column_stop',
			'column_delay',
		];

		if (version_compare(VERSION, '3.0', '<')) {
			foreach ($translations as $translation) {
				$data[$translation] = $this->language->get($translation);
			}
		}

		$variables = [
			'api_login'                   => '',
			'api_key'                     => '',
			'test'                        => 0,
			'timeout'                     => 10,
			'currency'                    => '',
			'cod'                         => [],
			'timezone'                    => 'Europe/Moscow',
			'service_count'               => '1',
			'list_order_status'           => [],
			'invoice_count'               => '2',
			'sticker_count'               => '1',
			'sticker_format'              => 'A4',
			'files_email'                 => '',
			'files'                       => [],
			'default_order_number'        => '{{order_id}}',
			'default_order_comment'       => '',
			'default_seller_address'      => '',
			'default_seller_name'         => '',
			'default_seller_inn'          => '',
			'default_seller_phone'        => '',
			'default_seller_form'         => '',
			'default_sender_company'      => '',
			'default_sender_name'         => '',
			'default_sender_street'       => '',
			'default_sender_house'        => '',
			'default_sender_flat'         => '',
			'default_sender_phone'        => '',
			'default_shipper_name'        => '',
			'default_shipper_address'     => '',
			'default_recipient_f'         => '',
			'default_recipient_i'         => '',
			'default_address_street'      => '',
			'default_product_article'     => 'model',
			'default_product_pack'        => 0,
			'default_product_pack_weight' => 0,
			'default_product_vat_rate'    => '',
			'default_product_vat_sum'     => '',
			'default_courier_date'        => 1,
			'default_courier_time_beg'    => '10:00',
			'default_courier_time_end'    => '14:00',
			'default_courier_lunch_beg'   => '',
			'default_courier_lunch_end'   => '',
			'default_courier_street'      => '',
			'default_courier_house'       => '',
			'default_courier_flat'        => '',
			'default_courier_send_phone'  => '',
			'default_courier_sender_name' => '',
			'default_courier_comment'     => '',
			'default_services'            => [],
			'merge'                       => 0,
			'merge_name'                  => $this->config->get('config_name'),
			'merge_model'                 => $this->config->get('config_name'),
			'merge_link'                  => $this->request->server['HTTPS'] ? HTTPS_CATALOG : HTTP_CATALOG,
			'merge_vat'                   => 'VATX',
			'merge_cost'                  => 0,
			'merge_cost_type'             => 0,
			'merge_from_model'            => 0,
			'trackings'                   => [],
			'alerts'                      => [],
			'sms_gate'                    => '',
			'sms_login'                   => '',
			'sms_password'                => '',
			'sms_sender'                  => '',
			'cron_key'                    => $this->generate_cron_key(),
			'update_statuses'             => [],
			'update_day'                  => 30,
			'logging'                     => 0,
			'license'                     => '',
		];

		foreach ($variables as $variable => $default) {
			$data[$this->ll->getPrefix() . '_' . $variable] = $this->ll->getValue($variable, $default);
		}

		$data['breadcrumbs'] = $this->ll->getBreadcrumbs();
		$data['success'] = $this->ll->getSuccess();
		$data['error_warning'] = $this->ll->getWarning();
		$data['action'] = $this->ll->getLinkExtension();
		$data['order'] = $this->ll->getLinkExtension('order');
		$data['exchange'] = $this->ll->getLinkExtension();
		$data['shipping'] = $this->ll->getLink($this->ll->getExt() . 'shipping/ll_cdek');
		$data['cancel'] = $this->ll->getLinkExtensions();
		$data['get_cron_key'] = $this->ll->getLinkExtension('get_cron_key');
		$data['m'] = $this->code;
		$data['version'] = $this->statics->get('version');
		$data['email'] = $this->statics->get('email');
		$data['site'] = $this->statics->get('site');
		$data['docs'] = $this->statics->get('docs');
		$data['api_service'] = $this->statics->get('api_service');
		$data['api_docs'] = $this->statics->get('api_docs');
		$data['host'] = isset($this->request->server['HTTP_HOST']) ? $this->request->server['HTTP_HOST'] : '';
		$data['currencies'] = $this->model_localisation_currency->getCurrencies();
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		$data['statuses'] = $this->statics->get('statuses');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['payments'] = [];
		$data['timezones'] = DateTimeZone::listIdentifiers();
		$data['files'] = $this->statics->get('files');
		$data['ownership_forms'] = $this->statics->get('ownership_forms');
		$data['firstname_fields'] = ['firstname', 'payment_firstname', 'shipping_firstname'];
		$data['lastname_fields'] = ['lastname', 'payment_lastname', 'shipping_lastname'];
		$data['address_fields'] = ['shipping_address_1', 'shipping_address_2', 'payment_address_1', 'payment_address_2'];
		$data['variants'] = $this->statics->get('variants');
		$data['services'] = $this->statics->get('services');
		$data['vats'] = $this->statics->get('vats');
		$data['vats']['product'] = $this->language->get('text_vats_product');
		$data['sms_gates'] = $this->ll->getSMSGates();
		$cron_key = $data[$this->ll->getPrefix() . '_cron_key'];
		$data['update_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_CATALOG : HTTP_CATALOG) . 'index.php?route=' . $this->ll->getRoute() . '/trackOrderStatus&cron_key=' . $cron_key;
		$data['update_pvz_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_CATALOG : HTTP_CATALOG) . 'index.php?route=' . $this->ll->getRoute() . '/updatePVZ&cron_key=' . $cron_key;
		$data['load_log'] = $this->ll->getLinkExtension('load_log');
		$data['download_log'] = $this->ll->getLinkExtension('download_log');
		$data['clear_log'] = $this->ll->getLinkExtension('clear_log');
		$data['ll_invoice'] = $this->config->get($this->ll->getPrefix('ll_invoice', 'module') . '_status');
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$payments = $this->{'model_' . $this->ll->getExtensionModel() . '_extension'}->getInstalled('payment');

		$files = glob(DIR_APPLICATION . 'controller/' . $this->ll->getExt() . 'payment/*.php', GLOB_BRACE);

		if ($files) {
			foreach ($files as $file) {
				$payment = basename($file, '.php');

				$this->load->language($this->ll->getExt() . 'payment/' . $payment);

				if (in_array($payment, $payments)) {
					$data['payments'][] = [
						'code' => $payment,
						'name' => '[' . $payment . '] ' . $this->language->get('heading_title'),
					];
				}
			}
		}

		// перебиваем переводы других модулей
		$this->load->language($this->ll->getRoute());

		if (!$this->filterit) {
			$filterit_payments = isset($this->config->get('filterit_payment')['created']) ? $this->config->get('filterit_payment')['created'] : [];

			foreach ($filterit_payments as $code => $info) {
				$data['payments'][] = [
					'code' => $code,
					'name' => !empty($info['title'][$this->config->get('config_admin_language')]) ? '[' . $code . '] ' . $info['title'][$this->config->get('config_admin_language')] : '[' . $code . ']',
				];
			}
		}

		$this->response->setOutput($this->load->view($this->ll->getView(), $data));
	}

	public function order() {
		$this->load->language($this->ll->getRoute());

		$this->document->setTitle($this->language->get('heading_title_order'));

		$this->load->model($this->ll->getRoute());
		$this->load->model('localisation/order_status');

		$translations = [
			'heading_title_order',
			'button_order',
			'button_exchange',
			'button_shipping',
			'button_cancel',
			'button_create',
			'button_update',
			'button_view',
			'button_invoice',
			'button_sticker',
			'button_torg',
			'button_email',
			'button_courier',
			'button_call',
			'button_delete',
			'button_delete_db',
			'button_clear',
			'button_filter',
			'button_check',
			'column_id',
			'column_to',
			'column_total',
			'column_date',
			'column_order_status',
			'column_customer',
			'column_tariff',
			'column_dispatch',
			'column_status',
			'entry_pvz',
			'entry_customer',
			'entry_number',
			'text_no_results',
			'text_clean_confirm',
			'text_remove_confirm',
		];

		if (version_compare(VERSION, '3.0', '<')) {
			foreach ($translations as $translation) {
				$data[$translation] = $this->language->get($translation);
			}
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = [];
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$params = '';

		if (isset($this->request->get['filter_order_id'])) {
			$filter_order_id = $this->request->get['filter_order_id'];
			$params .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		} else {
			$filter_order_id = null;
		}

		if (isset($this->request->get['filter_customer'])) {
			$filter_customer = $this->request->get['filter_customer'];
			$params .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		} else {
			$filter_customer = null;
		}

		if (isset($this->request->get['filter_pvz'])) {
			$filter_pvz = $this->request->get['filter_pvz'];
			$params .= '&filter_pvz=' . urlencode(html_entity_decode($this->request->get['filter_pvz'], ENT_QUOTES, 'UTF-8'));
		} else {
			$filter_pvz = null;
		}

		if (isset($this->request->get['filter_to'])) {
			$filter_to = $this->request->get['filter_to'];
			$params .= '&filter_to=' . urlencode(html_entity_decode($this->request->get['filter_to'], ENT_QUOTES, 'UTF-8'));
			$filter_to_name = $this->{$this->ll->getModel()}->getCity($filter_to)['CityName'];
		} else {
			$filter_to = null;
			$filter_to_name = null;
		}

		if (isset($this->request->get['filter_total'])) {
			$filter_total = $this->request->get['filter_total'];
			$params .= '&filter_total=' . $this->request->get['filter_total'];
		} else {
			$filter_total = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
			$params .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['filter_order_status'])) {
			$filter_order_status = $this->request->get['filter_order_status'];
			$params .= '&filter_order_status=' . $this->request->get['filter_order_status'];
		} else {
			$filter_order_status = null;
		}

		if (isset($this->request->get['filter_tariff'])) {
			$filter_tariff = $this->request->get['filter_tariff'];
			$params .= '&filter_tariff=' . $this->request->get['filter_tariff'];
		} else {
			$filter_tariff = null;
		}

		if (isset($this->request->get['filter_number'])) {
			$filter_number = $this->request->get['filter_number'];
			$params .= '&filter_number=' . $this->request->get['filter_number'];
		} else {
			$filter_number = null;
		}

		if (isset($this->request->get['filter_dispatch'])) {
			$filter_dispatch = $this->request->get['filter_dispatch'];
			$params .= '&filter_dispatch=' . $this->request->get['filter_dispatch'];
		} else {
			$filter_dispatch = null;
		}

		if (isset($this->request->get['filter_cdek_status'])) {
			$filter_cdek_status = $this->request->get['filter_cdek_status'];
			$params .= '&filter_cdek_status=' . $this->request->get['filter_cdek_status'];
		} else {
			$filter_cdek_status = null;
		}

		$filter_data = [
			'filter_order_id'     => $filter_order_id,
			'filter_customer'	  => $filter_customer,
			'filter_pvz'	      => $filter_pvz,
			'filter_to'	          => $filter_to,
			'filter_total'        => $filter_total,
			'filter_date_added'   => $filter_date_added,
			'filter_order_status' => $filter_order_status,
			'filter_tariff'       => $filter_tariff,
			'filter_number'       => $filter_number,
			'filter_dispatch'     => $filter_dispatch,
			'filter_cdek_status'  => $filter_cdek_status,
			'start'               => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'               => $this->config->get('config_limit_admin'),
		];

		$total = $this->{$this->ll->getModel()}->getTotalOrders($filter_data);

		$results = $this->{$this->ll->getModel()}->getOrders($filter_data);

		$breadcrumbs[] = [
			'text' => $this->language->get('heading_title_order'),
			'href' => $this->ll->getLinkExtension('order'),
		];

		$data['filter_order_id'] = $filter_order_id;
		$data['filter_customer'] = $filter_customer;
		$data['filter_pvz'] = $filter_pvz;
		$data['filter_to'] = $filter_to;
		$data['filter_to_name'] = $filter_to_name;
		$data['filter_total'] = $filter_total;
		$data['filter_date_added'] = $filter_date_added;
		$data['filter_order_status'] = $filter_order_status;
		$data['filter_tariff'] = $filter_tariff;
		$data['filter_number'] = $filter_number;
		$data['filter_dispatch'] = $filter_dispatch;
		$data['filter_cdek_status'] = $filter_cdek_status;
		$data['variants'] = $this->statics->get('variants');
		$data['statuses'] = $this->statics->get('statuses');
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		$data['breadcrumbs'] = $this->ll->getBreadcrumbs($breadcrumbs);
		$data['success'] = $this->ll->getSuccess();
		$data['error_warning'] = $this->ll->getWarning();
		$data['send'] = $this->ll->getLinkExtension('send');
		$data['update'] = $this->ll->getLinkExtension('update');
		$data['invoice'] = $this->ll->getLinkExtension('invoice');
		$data['sticker'] = $this->ll->getLinkExtension('sticker');
		$data['orderr'] = $this->ll->getLinkExtension('order');
		$data['route'] = $this->ll->getRoute();
		$data['exchange'] = $this->ll->getLinkExtension();
		$data['shipping'] = $this->ll->getLink($this->ll->getExt() . 'shipping/ll_cdek');
		$data['cancel'] = $this->ll->getLinkExtensions();
		$data['token'] = $this->ll->getToken();
		$data['m'] = $this->code;
		$data['version'] = $this->statics->get('version');;
		$data['orders'] = [];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['pagination'] = $this->ll->getPagination($total, $page, $this->ll->getLinkExtension('order', $params . '&page={page}'));
		$data['results'] = $this->ll->getPaginationText($total, $page, $this->language->get('text_pagination'));
		$data['customer_autocomplete'] = $this->ll->getLink('customer/customer/autocomplete');
		$data['to_autocomplete'] = $this->ll->getLinkExtension('autocomplete');
		$data['check_phone_url'] = $this->ll->getLink($this->ll->getExt() . 'module/ll_checkclient/checkPhone');
		$data['ll_invoice'] = $this->config->get($this->ll->getPrefix('ll_invoice', 'module') . '_status');

		foreach ($results as $result) {
			if (!$result['tariff']) {
				$result['status'] = -1;
			}

			$from_data = $this->{$this->ll->getModel()}->getCity($result['from_city']);

			if ($from_data) {
				$from = '<b>' . $from_data['CityName'] . '</b><br>' . $from_data['OblName'] . '<br>' . $from_data['CountryName'];
			} else {
				$from = null;
			}

			$to_data = $this->{$this->ll->getModel()}->getCity($result['to_city']);

			if ($to_data) {
				$to = '<b>' . $to_data['CityName'] . '</b><br>';
			} else {
				$to = null;
			}

			if (in_array($result['tariff'], $this->statics->get('variants_map')) && $result['pvz']) {
				$pvz = $this->{$this->ll->getModel()}->getPvz($result['pvz']);

				if ($pvz) {
					if ($pvz['type'] == 'PVZ') {
						$to .= '<i class="fa fa-home" aria-hidden="true"></i>';
					} else {
						$to .= '<i class="fa fa-cubes" aria-hidden="true"></i>';
					}

					if ($pvz['site'] != '') {
						$to .= ' <a href=' . $pvz['site'] . ' target="_blank"><span class="label label-default">' . $result['pvz'] . '</span></a> ';
					} else {
						$to .= ' <span class="label label-default">' . $result['pvz'] . '</span> ';
					}

					$to .= $pvz['address'] . '<br>';
				} else {
					$to .= ' <span class="label label-danger">' . $result['pvz'] . $this->language->get('error_pvz') . '</span><br>';
				}
			}

			if ($to_data) {
				$to .= $to_data['OblName'] . '<br>' . $to_data['CountryName'];
			}

			$check = null;

			if ($this->config->has('ll_checkclient_status')) {
				$this->load->model($this->ll->getExt() . 'module/ll_checkclient');

				$check = $this->{$this->ll->getModel($this->ll->getExt() . 'module/ll_checkclient')}->checkPhone($result['telephone'], $result['customer_id']);
			} else {
				$check['error'] = $this->language->get('error_checkclient');
			}

			$check_color = 'default';

			if (isset($check['success'])) {
				$check_color = $this->language->get('text_color_' . $check['rating']);
				$check = htmlspecialchars($check['success']);
			} elseif (isset($check['error'])) {
				$check = htmlspecialchars('<div class="alert alert-danger" style="margin: 0;"><i class="fa fa-info-circle"></i> ' . $check['error'] . '</div>');
			} else {
				$check = htmlspecialchars('<a class="btn btn-success" onclick="checkPhone(\'' . $result['order_id'] . '\', \'' . $result['telephone'] . '\', \'' . $result['customer_id'] . '\');">' . $this->language->get('button_check') . '</a></div>');
			}

			$data['orders'][] = [
				'order_id'        => $result['order_id'],
				'order_view'      => $this->ll->getLink('sale/order/info', '&order_id=' . $result['order_id']),
				'from'            => $from,
				'to'              => $to,
				'total'           => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
				'shipping_cost'   => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
				'date_added'      => date($this->language->get('datetime_format'), strtotime($result['date_added'])),
				'order_status'    => $result['order_status'] ? $result['order_status'] : $this->language->get('text_missing'),
				'customer_id'     => $result['customer_id'],
				'customer'        => $result['customer'],
				'check_color'     => $check_color,
				'check'           => $check,
				'telephone'       => $result['telephone'],
				'tariff'          => $result['tariff'] > 0 ? $this->statics->get('variants')[$result['tariff']]['name'] : '',
				'dispatch_number' => $result['dispatch_number'],
				'date'            => $result['date'] ? date($this->language->get('datetime_format'), strtotime($result['date'])) : '',
				'status_id'       => $result['status'],
				'status'          => $this->statics->get('statuses')[$result['status']]['title'],
				'description'     => $this->statics->get('statuses')[$result['status']]['description'],
				'color'           => $this->statics->get('statuses')[$result['status']]['color'],
				'view'            => $this->ll->getLinkExtension('view', '&order_id=' . $result['order_id']),
				'update'          => $this->ll->getLinkExtension('update', '&order_id=' . $result['order_id']),
				'invoice'         => $this->ll->getLinkExtension('invoice', '&order_id=' . $result['order_id']),
				'sticker'         => $this->ll->getLinkExtension('sticker', '&order_id=' . $result['order_id']),
				'torg'            => $this->ll->getLinkExtension('torg', '&order_id=' . $result['order_id']),
				'email'           => $this->ll->getLinkExtension('email', '&order_id=' . $result['order_id']),
				'courier'         => $this->ll->getLinkExtension('courier', '&order_id=' . $result['order_id']),
				'call'            => $this->ll->getLinkExtension('call', '&order_id=' . $result['order_id']),
				'alert'           => $this->ll->getLinkExtension('alert', '&order_id=' . $result['order_id']),
				'remove'          => $this->ll->getLinkExtension('remove', '&order_id=' . $result['order_id']),
				'remove_db'       => $this->ll->getLinkExtension('remove_db', '&order_id=' . $result['order_id']),
			];
		}

		$this->response->setOutput($this->load->view($this->ll->getView('order'), $data));
	}

	public function send() {
		$this->load->language($this->ll->getRoute());

		$this->document->setTitle($this->language->get('heading_title_send'));

		$this->load->model($this->ll->getRoute());
		$this->load->model('localisation/currency');

		if (isset($this->request->post['selected']) && $this->ll->validate()) {
			$number = false;

			foreach ($this->request->post['selected'] as $order_id) {
				$order = $this->{$this->ll->getModel()}->getOrder((int)$order_id);

				if ($order) {
					if (!$number) {
						$number = $order['Number'];
					} else {
						$order['Number'] = $number;
					}

					$order['edit'] = $this->ll->getLink('sale/order/edit', '&order_id=' . $order_id);

					$orders[] = $order;
				}
			}

			if (!isset($orders) || empty($orders)) {
				$this->session->data['warning'] = $this->language->get('error_send');

				$this->response->redirect($this->ll->getLinkExtension('order'));
			}
		} else {
			$this->session->data['warning'] = $this->language->get('error_send');

			$this->response->redirect($this->ll->getLinkExtension('order'));
		}

		$translations = [
			'heading_title_send',
			'button_order',
			'button_exchange',
			'button_shipping',
			'button_cancel',
			'button_export',
			'button_edit',
		];

		if (version_compare(VERSION, '3.0', '<')) {
			foreach ($translations as $translation) {
				$data[$translation] = $this->language->get($translation);
			}
		}

		$breadcrumbs[] = [
			'text' => $this->language->get('heading_title_order'),
			'href' => $this->ll->getLinkExtension('order'),
		];

		$breadcrumbs[] = [
			'text' => $this->language->get('heading_title_send'),
			'href' => $this->ll->getLinkExtension('send'),
		];

		$data['breadcrumbs'] = $this->ll->getBreadcrumbs($breadcrumbs);
		$data['success'] = $this->ll->getSuccess();
		$data['error_warning'] = $this->ll->getWarning();
		$data['action'] = $this->ll->getLinkExtension('export');
		$data['order'] = $this->ll->getLinkExtension('order');
		$data['exchange'] = $this->ll->getLinkExtension();
		$data['shipping'] = $this->ll->getLink($this->ll->getExt() . 'shipping/ll_cdek');
		$data['cancel'] = $this->ll->getLinkExtensions();
		$data['token'] = $this->ll->getToken();
		$data['m'] = $this->code;
		$data['version'] = $this->statics->get('version');;
		$data['orders'] = $orders;
		$data['number'] = $number;
		$data['variants'] = $this->statics->get('variants');
		$data['ownership_forms'] = $this->statics->get('ownership_forms');
		$data['services'] = $this->statics->get('services');
		$data['vats'] = $this->statics->get('vats');
		$data['currencies'] = $this->model_localisation_currency->getCurrencies();
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view($this->ll->getView('send'), $data));
	}

	public function view() {
		$this->load->language($this->ll->getRoute());

		$this->document->setTitle($this->language->get('heading_title_view'));

		$this->load->model($this->ll->getRoute());

		if (isset($this->request->get['order_id']) && $this->ll->validate()) {
			$result = $this->{$this->ll->getModel()}->getOrderInfo((int)$this->request->get['order_id']);

			if (!$result) {
				$this->response->redirect($this->ll->getLinkExtension('order'));
			}
		} else {
			$this->response->redirect($this->ll->getLinkExtension('order'));
		}

		$translations = [
			'heading_title_view',
			'button_order',
			'button_exchange',
			'button_shipping',
			'button_cancel',
			'button_update',
			'button_invoice',
			'button_sticker',
			'button_torg',
			'button_email',
			'button_courier',
			'button_call',
			'button_delete',
			'button_delete_db',
			'text_clean_confirm',
			'text_remove_confirm',
		];

		if (version_compare(VERSION, '3.0', '<')) {
			foreach ($translations as $translation) {
				$data[$translation] = $this->language->get($translation);
			}
		}

		$breadcrumbs[] = [
			'text' => $this->language->get('heading_title_order'),
			'href' => $this->ll->getLinkExtension('order'),
		];

		$breadcrumbs[] = [
			'text' => $this->language->get('heading_title_view'),
			'href' => $this->ll->getLinkExtension('send'),
		];

		$to_data = $this->{$this->ll->getModel()}->getCity($result['to_city']);

		if (in_array($result['tariff'], $this->statics->get('variants_map')) && $result['pvz']) {
			$pvz_info = $this->{$this->ll->getModel()}->getPvz($result['pvz']);

			if ($pvz_info) {
				if ($pvz_info['type'] == 'PVZ') {
					$pvz = '<i class="fa fa-home" aria-hidden="true"></i>';
				} else {
					$pvz = '<i class="fa fa-cubes" aria-hidden="true"></i>';
				}

				if ($pvz_info['site'] != '') {
					$pvz .= ' <a href=' . $pvz_info['site'] . ' target="_blank"><span class="label label-default">' . $result['pvz'] . '</span></a> ';
				} else {
					$pvz .= ' <span class="label label-default">' . $result['pvz'] . '</span> ';
				}

				$pvz .= $pvz_info['address'] . '<br>';
			} else {
				$pvz = '<span class="label label-danger">' . $result['pvz'] . $this->language->get('error_pvz') . '</span><br>';
			}
		} else {
			$pvz = false;
		}

		$data['order'] = [
			'order_id'        => $result['order_id'],
			'order_link'      => $this->ll->getLink('sale/order/info', '&order_id=' . $result['order_id']),
			'order_number'    => $result['order_number'],
			'dispatch_number' => $result['dispatch_number'],
			'number'          => $result['number'],
			'tariff'          => $this->statics->get('variants')[$result['tariff']]['name'],
			'customer'        => $result['firstname'] . ' ' . $result['lastname'],
			'customer_link'   => $result['customer_id'] ? $this->ll->getLink('customer/customer/edit', '&customer_id=' . $result['customer_id']) : false,
			'country'         => $to_data['CountryName'],
			'zone'            => $to_data['OblName'],
			'city'            => $to_data['CityName'],
			'pvz'             => $pvz,
			'status_id'       => $result['status'],
			'update'          => $this->ll->getLinkExtension('update', '&order_id=' . $result['order_id']),
			'invoice'         => $this->ll->getLinkExtension('invoice', '&order_id=' . $result['order_id']),
			'sticker'         => $this->ll->getLinkExtension('sticker', '&order_id=' . $result['order_id']),
			'torg'            => $this->ll->getLinkExtension('torg', '&order_id=' . $result['order_id']),
			'email'           => $this->ll->getLinkExtension('email', '&order_id=' . $result['order_id']),
			'courier'         => $this->ll->getLinkExtension('courier', '&order_id=' . $result['order_id']),
			'call'            => $this->ll->getLinkExtension('call', '&order_id=' . $result['order_id']),
			'alert'           => $this->ll->getLinkExtension('alert', '&order_id=' . $result['order_id']),
			'remove'          => $this->ll->getLinkExtension('remove', '&order_id=' . $result['order_id']),
			'remove_db'       => $this->ll->getLinkExtension('remove_db', '&order_id=' . $result['order_id']),
		];

		$histories = $this->{$this->ll->getModel()}->getOrderHistories($result['order_id']);

		foreach ($histories as $history) {
			$data['histories'][] = [
				'status'     => $history['status'],
				'comment'    => nl2br($history['comment']),
				'date_added' => date($this->language->get('datetime_format'), strtotime($history['date_added'])),
				'notify'     => $history['notify'] ? $this->language->get('text_yes') : $this->language->get('text_no'),
			];
		}

		$statuses = $this->{$this->ll->getModel()}->getOrderStatuses($result['order_id']);

		if ($statuses) {
			foreach ($statuses as $status) {
				$data['statuses'][] = [
					'status'      => $this->statics->get('statuses')[$status['code']]['title'],
					'description' => $this->statics->get('statuses')[$status['code']]['description'],
					'color'       => $this->statics->get('statuses')[$status['code']]['color'],
					'date'        => date($this->language->get('datetime_format'), strtotime($status['date'])),
					'city'        => $status['city_name'],
				];
			}
		} else {
			$data['statuses'][] = [
				'status'      => $this->statics->get('statuses')[$result['status']]['title'],
				'description' => $this->statics->get('statuses')[$result['status']]['description'],
				'color'       => $this->statics->get('statuses')[$result['status']]['color'],
				'date'        => date($this->language->get('datetime_format'), strtotime($result['date'])),
				'city'        => false,
			];
		}

		$data['breadcrumbs'] = $this->ll->getBreadcrumbs($breadcrumbs);
		$data['success'] = $this->ll->getSuccess();
		$data['error_warning'] = $this->ll->getWarning();
		$data['orders'] = $this->ll->getLinkExtension('order');
		$data['change_dispatch_number'] = $this->ll->getLinkExtension('change_dispatch_number', '&order_id=' . $result['order_id']);
		$data['exchange'] = $this->ll->getLinkExtension();
		$data['shipping'] = $this->ll->getLink($this->ll->getExt() . 'shipping/ll_cdek');
		$data['ll_invoice'] = $this->config->get($this->ll->getPrefix('ll_invoice', 'module') . '_status');
		$data['cancel'] = $this->ll->getLinkExtensions();
		$data['token'] = $this->ll->getToken();
		$data['m'] = $this->code;
		$data['version'] = $this->statics->get('version');
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view($this->ll->getView('view'), $data));
	}

	public function courier() {
		$this->load->language($this->ll->getRoute());

		$this->document->setTitle($this->language->get('heading_title_courier'));

		$this->load->model($this->ll->getRoute());

		if (isset($this->request->get['order_id']) && $this->ll->validate()) {
			$result = $this->{$this->ll->getModel()}->getOrderInfo((int)$this->request->get['order_id']);

			if (!$result) {
				$this->response->redirect($this->ll->getLinkExtension('order'));
			}
		} else {
			$this->response->redirect($this->ll->getLinkExtension('order'));
		}

		$translations = [
			'heading_title_courier',
			'button_order',
			'button_exchange',
			'button_shipping',
			'button_cancel',
			'button_export',
		];

		if (version_compare(VERSION, '3.0', '<')) {
			foreach ($translations as $translation) {
				$data[$translation] = $this->language->get($translation);
			}
		}

		$breadcrumbs[] = [
			'text' => $this->language->get('heading_title_order'),
			'href' => $this->ll->getLinkExtension('order'),
		];

		$breadcrumbs[] = [
			'text' => $this->language->get('heading_title_courier'),
			'href' => $this->ll->getLinkExtension('courier'),
		];

		$from_data = $this->{$this->ll->getModel()}->getCity($result['from_city']);

		$data['courier'] = [
			'order_id'        => $result['order_id'],
			'order_link'      => $this->ll->getLink('sale/order/info', '&order_id=' . $result['order_id']),
			'dispatch_link'   => $this->ll->getLinkExtension('view', '&order_id=' . $result['order_id']),
			'dispatch_number' => $result['dispatch_number'],
			'account'         => $this->config->get($this->ll->getPrefix() . '_api_login'),
			'secure'          => md5(date('Y-m-d') . '&' . $this->config->get($this->ll->getPrefix() . '_api_key')),
			'city'            => $from_data['CityName'] . ', ' . $from_data['OblName'] . ', ' . $from_data['CountryName'],
			'send_city_code'  => $result['from_city'],
			'send_date'       => date('Y-m-d'),
			'date'            => date('Y-m-d', strtotime('+ ' . $this->config->get($this->ll->getPrefix() . '_default_courier_date') . ' day')),
			'time_beg'        => $this->config->get($this->ll->getPrefix() . '_default_courier_time_beg'),
			'time_end'        => $this->config->get($this->ll->getPrefix() . '_default_courier_time_end'),
			'lunch_beg'       => $this->config->get($this->ll->getPrefix() . '_default_courier_lunch_beg'),
			'lunch_end'       => $this->config->get($this->ll->getPrefix() . '_default_courier_lunch_end'),
			'street'          => $this->config->get($this->ll->getPrefix() . '_default_courier_street'),
			'house'           => $this->config->get($this->ll->getPrefix() . '_default_courier_house'),
			'flat'            => $this->config->get($this->ll->getPrefix() . '_default_courier_flat'),
			'send_phone'      => $this->config->get($this->ll->getPrefix() . '_default_courier_send_phone'),
			'sender_name'     => $this->config->get($this->ll->getPrefix() . '_default_courier_sender_name'),
			'comment'         => $this->config->get($this->ll->getPrefix() . '_default_courier_comment'),
		];

		$data['breadcrumbs'] = $this->ll->getBreadcrumbs($breadcrumbs);
		$data['success'] = $this->ll->getSuccess();
		$data['error_warning'] = $this->ll->getWarning();
		$data['action'] = $this->ll->getLinkExtension('exportCourier');
		$data['order'] = $this->ll->getLinkExtension('order');
		$data['exchange'] = $this->ll->getLinkExtension();
		$data['shipping'] = $this->ll->getLink($this->ll->getExt() . 'shipping/ll_cdek');
		$data['cancel'] = $this->ll->getLinkExtensions();
		$data['token'] = $this->ll->getToken();
		$data['m'] = $this->code;
		$data['version'] = $this->statics->get('version');
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view($this->ll->getView('courier'), $data));
	}

	public function export() {
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->ll->validate()) {
			$this->load->language($this->ll->getRoute());

			$this->load->model($this->ll->getRoute());

			foreach ($this->request->post['DeliveryRequest']['Order'] as $order) {
				$pvz = isset($order['Address']['PvzCode']) ? $order['Address']['PvzCode'] : '';

				$this->{$this->ll->getModel()}->updateOrderNumber($order['order_id'], $this->request->post['DeliveryRequest']['Number'], $order['Number'], $pvz);
			}

			$result = $this->api->send_order($this->request->post);

			if (isset($result['Order'])) {
				$success = false;
				$warning = false;

				foreach ($result['Order'] as $order) {
					if (isset($order['@attributes']['DispatchNumber'])) {
						$this->{$this->ll->getModel()}->updateOrder($order['@attributes']['Number'], $order['@attributes']['DispatchNumber']);

						$success .= sprintf($this->language->get('text_export_success'), $order['@attributes']['Number']);
					} elseif (isset($order['@attributes']['Number'])) {
						$warning .= sprintf($this->language->get('error_export_order'), $order['@attributes']['Number'], $order['@attributes']['Msg']);
					}
				}

				$this->session->data['success'] = $success;
				$this->session->data['warning'] = $warning;
			} else {
				$this->session->data['warning'] = $this->language->get('error_export');
			}

			$this->response->redirect($this->ll->getLinkExtension('order'));
		}
	}

	public function exportCourier() {
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->ll->validate()) {
			$this->load->language($this->ll->getRoute());

			$this->load->model($this->ll->getRoute());

			$result = $this->api->call_courier($this->request->post);

			if ($result) {
				$this->session->data['success'] = $this->language->get('text_courier_success');
			} else {
				$this->session->data['warning'] = $this->language->get('error_courier_order');
			}

			$this->response->redirect($this->ll->getLinkExtension('order'));
		}
	}

	public function update() {
		if ($this->ll->validate()) {
			$this->load->language($this->ll->getRoute());

			$this->load->model($this->ll->getRoute());

			if (isset($this->request->get['order_id'])) {
				$order_ids[] = $this->request->get['order_id'];
			} elseif (isset($this->request->post['selected']) && !empty($this->request->post['selected'])) {
				$order_ids = $this->request->post['selected'];
			} else {
				$this->session->data['warning'] = $this->language->get('error_update');

				$this->response->redirect($this->ll->getLinkExtension('order'));
			}

			$result = $this->updateOrdersStatus($order_ids);

			if (isset($this->request->get['order_id'])) {
				if ($result) {
					$this->session->data['success'] = sprintf($this->language->get('text_update_success'), $this->request->get['order_id']);
				} else {
					$this->session->data['warning'] = sprintf($this->language->get('error_update_order'), $this->request->get['order_id']);
				}

				$this->response->redirect($this->ll->getLinkExtension('view', '&order_id=' . $this->request->get['order_id']));
			} else {
				if ($result) {
					$this->session->data['success'] = $this->language->get('text_updates_success');
				} else {
					$this->session->data['warning'] = $this->language->get('error_updates_order');
				}

				$this->response->redirect($this->ll->getLinkExtension('order'));
			}
		}
	}

	protected function updateOrdersStatus($order_ids) {
		date_default_timezone_set($this->config->get($this->ll->getPrefix() . '_timezone'));
		$catalog = isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_CATALOG : HTTP_CATALOG;
		$url = $catalog . 'index.php?route=' . $this->ll->getRoute() . '/trackingOrderStatus&cron_key=' . $this->config->get($this->ll->getPrefix() . '_cron_key');

		$this->load->language($this->ll->getRoute());

		$this->load->model($this->ll->getRoute());

		foreach ($order_ids as $key => $order_id) {
			$order = $this->{$this->ll->getModel()}->getOrderInfo((int)$order_id);

			if (!$order['dispatch_number']) {
				if ($key == count($order_ids)) {
					$this->response->redirect($this->ll->getLinkExtension('order'));
				} else {
					continue;
				}
			}

			$dispatch_numbers[$order_id] = $order['dispatch_number'];
			$orders_info[$order_id] = $order;
		}

		$results = $this->api->update_status($dispatch_numbers);

		if ($results) {
			foreach ($results as $order_id => $result) {
				foreach ($result as $status) {
					// проверяем, трекался ли уже этот статус
					$is_status = $this->{$this->ll->getModel()}->getOrderStatus($order_id, $status['@attributes']['Code'], $status['@attributes']['Date']);

					if (!$is_status) {
						$this->{$this->ll->getModel()}->addOrderStatus($order_id, $status);

						if ($this->config->get($this->ll->getPrefix() . '_trackings')) {
							foreach ($this->config->get($this->ll->getPrefix() . '_trackings') as $tracking) {
								if ($tracking['shipping_status'] == $status['@attributes']['Code']) {
									$params = [
										'order_id'         => $order_id,
										'cdek_status_name' => $this->statics->get('statuses')[$status['@attributes']['Code']]['title'],
										'cdek_status_city' => $status['@attributes']['CityName'],
										'cdek_status_date' => date('Y-m-d H:i:s', strtotime($status['@attributes']['Date'])),
										'shipping_status'  => $tracking['shipping_status'],
										'order_status'     => $tracking['order_status'],
										'notify'           => $tracking['notify'],
										'comment'          => $tracking['comment'][$orders_info[$order_id]['language_id']],
										'notify_email'     => $tracking['notify_email'],
										'email'            => $tracking['email'][$orders_info[$order_id]['language_id']],
										'notify_sms'       => $tracking['notify_sms'],
										'sms'              => $tracking['sms'][$orders_info[$order_id]['language_id']],
									];

									$ch = curl_init();

									curl_setopt($ch, CURLOPT_URL, $url);
									curl_setopt($ch, CURLOPT_POST, true);
									curl_setopt($ch, CURLOPT_POSTFIELDS, $params);

									curl_exec($ch);
									curl_close($ch);
								}
							}
						}
					} else {
						$this->{$this->ll->getModel()}->updateOrderStatus($order_id, $status);
					}

					if ($this->config->get($this->ll->getPrefix() . '_alerts')) {
						foreach ($this->config->get($this->ll->getPrefix() . '_alerts') as $alert) {
							if ($alert['start_status'] == $status['@attributes']['Code']) {
								$status_date = new DateTime(date('Y-m-d H:i:s', strtotime($status['@attributes']['Date'])));
								$action_date = new DateTime();
								$action_date->modify('+' . (int)$alert['delay'] . ' day');
								$date_diff = date_diff($status_date, $action_date)->days;

								// разрешаем только если прошло N дней задержки
								if ($date_diff > 0) {
									continue;
								}

								if (is_array($alert['stop_status']) && !empty($alert['stop_status'])) {
									$is_status = false;

									// проверяем не получен-ли уже stop статус
									foreach ($alert['stop_status'] as $stop_status) {
										$is_status = $this->{$this->ll->getModel()}->getOrderStatus($order_id, $stop_status);

										if ($is_status) {
											break;
										}
									}

									// если получен хоть один стоп статус, то не отправляем
									if ($is_status) {
										continue;
									}
								}

								$params = [
									'order_id'         => $order_id,
									'cdek_status_name' => $this->statics->get('statuses')[$status['@attributes']['Code']]['title'],
									'cdek_status_city' => $status['@attributes']['CityName'],
									'cdek_status_date' => date('Y-m-d H:i:s', strtotime($status['@attributes']['Date'])),
									'shipping_status'  => $alert['start_status'],
									'notify_email'     => $alert['notify_email'],
									'email'            => $alert['email'][$orders_info[$order_id]['language_id']],
									'notify_sms'       => $alert['notify_sms'],
									'sms'              => $alert['sms'][$orders_info[$order_id]['language_id']],
								];

								$ch = curl_init();

								curl_setopt($ch, CURLOPT_URL, $url);
								curl_setopt($ch, CURLOPT_POST, true);
								curl_setopt($ch, CURLOPT_POSTFIELDS, $params);

								curl_exec($ch);
								curl_close($ch);
							}
						}
					}
				}
			}

			return true;
		}
	}

	public function invoice() {
		if ($this->ll->validate()) {
			$this->load->language($this->ll->getRoute());

			$this->load->model($this->ll->getRoute());

			if (isset($this->request->get['order_id'])) {
				$order_ids[] = $this->request->get['order_id'];
			} elseif (isset($this->request->get['selected']) && !empty($this->request->get['selected'])) {
				$order_ids = $this->request->get['selected'];
			} elseif (isset($this->request->post['selected']) && !empty($this->request->post['selected'])) {
				$order_ids = $this->request->post['selected'];
			} else {
				$this->session->data['warning'] = $this->language->get('error_update');

				$this->response->redirect($this->ll->getLinkExtension('order'));
			}

			foreach ($order_ids as $key => $order_id) {
				$dispatch_number = $this->{$this->ll->getModel()}->getOrderDispatchNumber($order_id);

				if (!$dispatch_number) {
					unset($order_ids[$key]);

					if ($key == count($order_ids)) {
						$this->response->redirect($this->ll->getLinkExtension('order'));
					} else {
						continue;
					}
				}

				$dispatch_numbers[$order_id] = $dispatch_number;
			}

			$order_id = implode('_', $order_ids);
			$dispatch_number = implode('_', $dispatch_numbers);
			$filename = $this->code . '_invoice_' . $order_id . '_' . $dispatch_number . '.pdf';
			$file = DIR_UPLOAD . $filename;

			if (file_exists($file) && is_file($file)) {
				header("Content-type: application/pdf");
				header("Content-Disposition: inline; filename=$filename");
				@readfile($file);
			} else {
				$result = $this->api->print_invoice($dispatch_numbers);

				if ($result) {
					if (count($dispatch_numbers) == 1) {
						$this->response->redirect($this->ll->getLinkExtension('invoice', '&order_id=' . $order_id));
					} else {
						$this->response->redirect($this->ll->getLinkExtension('invoice', '&selected[]=' . implode('&selected[]=', $order_ids)));
					}
				} else {
					if (count($dispatch_numbers) == 1) {
						$this->session->data['warning'] = sprintf($this->language->get('error_invoice_order'), $order_id);

						$this->response->redirect($this->ll->getLinkExtension('view', '&order_id=' . $order_id));
					} else {
						$this->session->data['warning'] = $this->language->get('error_invoices_order');

						$this->response->redirect($this->ll->getLinkExtension('order'));
					}
				}
			}
		} else {
			$this->response->redirect($this->ll->getLinkExtension('order'));
		}
	}

	public function sticker() {
		if ($this->ll->validate()) {
			$this->load->language($this->ll->getRoute());

			$this->load->model($this->ll->getRoute());

			if (isset($this->request->get['order_id'])) {
				$order_ids[] = $this->request->get['order_id'];
			} elseif (isset($this->request->get['selected']) && !empty($this->request->get['selected'])) {
				$order_ids = $this->request->get['selected'];
			} elseif (isset($this->request->post['selected']) && !empty($this->request->post['selected'])) {
				$order_ids = $this->request->post['selected'];
			} else {
				$this->session->data['warning'] = $this->language->get('error_update');

				$this->response->redirect($this->ll->getLinkExtension('order'));
			}

			foreach ($order_ids as $key => $order_id) {
				$dispatch_number = $this->{$this->ll->getModel()}->getOrderDispatchNumber($order_id);

				if (!$dispatch_number) {
					unset($order_ids[$key]);

					if ($key == count($order_ids)) {
						$this->response->redirect($this->ll->getLinkExtension('order'));
					} else {
						continue;
					}
				}

				$dispatch_numbers[$order_id] = $dispatch_number;
			}

			$order_id = implode('_', $order_ids);
			$dispatch_number = implode('_', $dispatch_numbers);
			$filename = $this->code . '_sticker_' . $order_id . '_' . $dispatch_number . '.pdf';
			$file = DIR_UPLOAD . $filename;

			if (file_exists($file) && is_file($file)) {
				header("Content-type: application/pdf");
				header("Content-Disposition: inline; filename=$filename");
				@readfile($file);
			} else {
				$result = $this->api->print_sticker($dispatch_numbers);

				if ($result) {
					if (count($dispatch_numbers) == 1) {
						$this->response->redirect($this->ll->getLinkExtension('sticker', '&order_id=' . $order_id));
					} else {
						$this->response->redirect($this->ll->getLinkExtension('sticker', '&selected[]=' . implode('&selected[]=', $order_ids)));
					}
				} else {
					if (count($dispatch_numbers) == 1) {
						$this->session->data['warning'] = sprintf($this->language->get('error_sticker_order'), $order_id);

						$this->response->redirect($this->ll->getLinkExtension('view', '&order_id=' . $order_id));
					} else {
						$this->session->data['warning'] = $this->language->get('error_stickers_order');

						$this->response->redirect($this->ll->getLinkExtension('order'));
					}
				}
			}
		} else {
			$this->response->redirect($this->ll->getLinkExtension('order'));
		}
	}

	public function torg() {
		if (isset($this->request->get['order_id']) && $this->ll->validate()) {
			$this->load->language($this->ll->getRoute());

			/*$this->load->model($this->ll->getRoute());

			$order_id = (int)$this->request->get['order_id'];
			$dispatch_number = $this->{$this->ll->getModel()}->getOrderDispatchNumber($order_id);

			if (!$dispatch_number) {
				$this->response->redirect($this->ll->getLinkExtension('order'));
			}

			$filename = $this->code . '_sticker_' . $order_id . '_' . $dispatch_number . '.pdf';
			$file = DIR_UPLOAD . $filename;

			if (file_exists($file) && is_file($file)) {
				header("Content-type: application/pdf");
				header("Content-Disposition: inline; filename=$filename");
				@readfile($file);
			} else {
				$result = $this->api->print_sticker($dispatch_number, $order_id);

				if ($result) {
					$this->response->redirect($this->ll->getLinkExtension('sticker', '&order_id=' . $order_id));
				} else {
					$this->session->data['warning'] = sprintf($this->language->get('error_sticker_order'), $order_id);

					$this->response->redirect($this->ll->getLinkExtension('view', '&order_id=' . $order_id));
				}
			}*/
		} else {
			$this->response->redirect($this->ll->getLinkExtension('order'));
		}
	}

	public function email() {
		if (isset($this->request->get['order_id']) && $this->ll->validate()) {
			$this->load->language($this->ll->getRoute());

			$order_id = (int)$this->request->get['order_id'];
			$subject = 'Файлы по заказу №' . $order_id . ' - ' . $this->config->get('config_name');
			$message = '';

			if ($this->config->get($this->ll->getPrefix() . '_files')) {
				foreach ($this->config->get($this->ll->getPrefix() . '_files') as $file) {
					$message .= sprintf($this->language->get('text_email_' . $file), (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_CATALOG : HTTP_CATALOG) . 'index.php?route=' . $this->ll->getRoute() . '/getFile&type=' . $file . '&order_id=' . $order_id . '&cron_key=' . $this->config->get($this->ll->getPrefix() . '_cron_key'));
				}
			}

			if ($this->config->get($this->ll->getPrefix() . '_files_email') != '') {
				foreach (explode(',', $this->config->get($this->ll->getPrefix() . '_files_email')) as $email) {
					if ($email != '') {
						$this->ll->sendMail($email, $subject, $message);
					}
				}
			}
		}

		$this->response->redirect($this->ll->getLinkExtension('order'));
	}

	public function remove() {
		if (isset($this->request->get['order_id']) && $this->ll->validate()) {
			$this->load->language($this->ll->getRoute());

			$this->load->model($this->ll->getRoute());

			$this->{$this->ll->getModel()}->cleanOrder($this->request->get['order_id']);

			$this->session->data['success'] = sprintf($this->language->get('text_remove_success'), $this->request->get['order_id']);
		}

		$this->response->redirect($this->ll->getLinkExtension('order'));
	}

	public function remove_db() {
		if (isset($this->request->get['order_id']) && $this->ll->validate()) {
			$this->load->language($this->ll->getRoute());

			$this->load->model($this->ll->getRoute());

			$this->{$this->ll->getModel()}->removeOrderFromModule((int)$this->request->get['order_id']);

			$this->session->data['success'] = sprintf($this->language->get('text_remove_db_success'), $this->request->get['order_id']);

			$this->response->redirect($this->ll->getLinkExtension('view', '&order_id=' . $this->request->get['order_id']));
		} else {
			$this->response->redirect($this->ll->getLinkExtension('order'));
		}
	}

	public function get_cron_key() {
		if ($this->ll->validate()) {
			$json['success']['cron_key'] = $this->generate_cron_key();
			$json['success']['update_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_CATALOG : HTTP_CATALOG) . 'index.php?route=' . $this->ll->getRoute() . '/trackOrderStatus&cron_key=' . $json['success']['cron_key'];
			$json['success']['update_pvz_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_CATALOG : HTTP_CATALOG) . 'index.php?route=' . $this->ll->getRoute() . '/updatePVZ&cron_key=' . $json['success']['cron_key'];
		} else {
			$this->load->language($this->ll->getRoute());

			$json['error'] = $this->language->get('error_permission');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	protected function generate_cron_key() {
		if ($this->ll->validate()) {
			return str_shuffle('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ');
		}
	}

	public function load_log() {
		$this->load->language($this->ll->getRoute());

		if ($this->ll->validate()) {
			$file = DIR_LOGS . $this->code . '.log';

			if (file_exists($file)) {
				$size = filesize($file);

				if ($size >= 5242880) {
					$json['error'] = $this->language->get('error_log_weight');
				} else {
					$log = file_get_contents($file, FILE_USE_INCLUDE_PATH, null);

					if ($log == '') {
						$json['error'] = $this->language->get('error_log_file');
					} else {
						$json['success'] = file_get_contents($file, FILE_USE_INCLUDE_PATH, null);
					}
				}
			} else {
				$json['error'] = $this->language->get('error_log_file');
			}
		} else {
			$json['error'] = $this->language->get('error_permission');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function download_log() {
		$this->load->language($this->ll->getRoute());

		if ($this->ll->validate()) {
			$file = DIR_LOGS . $this->code . '.log';

			if (file_exists($file) && filesize($file) > 0) {
				$json['success'] = $this->ll->getLinkExtension('download_log_file');
			} else {
				$json['error'] = $this->language->get('error_log_file');
			}
		} else {
			$json['error'] = $this->language->get('error_permission');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function download_log_file() {
		if ($this->ll->validate()) {
			$file = DIR_LOGS . $this->code . '.log';

			if (file_exists($file) && filesize($file) > 0) {
				$this->response->addheader('Pragma: public');
				$this->response->addheader('Expires: 0');
				$this->response->addheader('Content-Description: File Transfer');
				$this->response->addheader('Content-Type: application/octet-stream');
				$this->response->addheader('Content-Disposition: attachment; filename="' . $this->ll->getPrefix() . '_' . date('Y-m-d_H-i-s', time()) . '.log"');
				$this->response->addheader('Content-Transfer-Encoding: binary');

				$this->response->setOutput(file_get_contents($file, FILE_USE_INCLUDE_PATH, null));
			}
		}
	}

	public function clear_log() {
		$this->load->language($this->ll->getRoute());

		if ($this->ll->validate()) {
			$file = DIR_LOGS . $this->code . '.log';

			$handle = fopen($file, 'w+');

			fclose($handle);

			$json['success'] = $this->language->get('text_success_clear');
		} else {
			$json['error'] = $this->language->get('error_permission');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function change_dispatch_number() {
		$this->load->language($this->ll->getRoute());

		if ($this->ll->validate() && isset($this->request->get['order_id']) && $this->request->get['order_id'] > 0 && isset($this->request->get['dispatch_number'])) {
			$this->load->model($this->ll->getRoute());

			$this->{$this->ll->getModel()}->changeDispatchNumber($this->request->get['order_id'], $this->request->get['dispatch_number']);

			$json['success'] = $this->language->get('text_success_change_dn');
		} else {
			$json['error'] = $this->language->get('error_permission');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function autocomplete() {
		$this->load->model($this->ll->getRoute());

		$json = [];

		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = '';
		}

		$results = $this->{$this->ll->getModel()}->getCities($filter_name);

		foreach ($results as $result) {
			$json[] = [
				'id'   => $result['id'],
				'city' => $result['city'],
				'full' => $result['full'],
			];
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function install() {
		$this->load->model($this->ll->getExtensionModel() . '/event');

		if (version_compare(VERSION, '2.2', '>=')) {
			$event_order_add = 'catalog/model/checkout/order/addOrder/after';
			$event_order_edit = 'catalog/model/checkout/order/editOrder/after';
			$event_order_status = 'catalog/model/checkout/order/addOrderHistory/after';
		} else {
			$event_order_add = 'post.order.add';
			$event_order_edit = 'post.order.edit';
			$event_order_status = 'post.order.history.add';
		}

		$this->{'model_' . $this->ll->getExtensionModel() . '_event'}->addEvent($this->code . '_order_add', $event_order_add, $this->ll->getExt() . 'module/' . $this->code . '/addOrderAfter');
		$this->{'model_' . $this->ll->getExtensionModel() . '_event'}->addEvent($this->code . '_order_edit', $event_order_edit, $this->ll->getExt() . 'module/' . $this->code . '/editOrderAfter');
		$this->{'model_' . $this->ll->getExtensionModel() . '_event'}->addEvent($this->code . '_order_status', $event_order_status, $this->ll->getExt() . 'module/' . $this->code . '/addOrderStatusAfter');

		$this->load->model($this->ll->getRoute());

		$this->{$this->ll->getModel()}->install();
	}

	public function uninstall() {
		$this->load->model($this->ll->getExtensionModel() . '/event');

		$this->{'model_' . $this->ll->getExtensionModel() . '_event'}->deleteEvent($this->code . '_order_add');
		$this->{'model_' . $this->ll->getExtensionModel() . '_event'}->deleteEvent($this->code . '_order_edit');
		$this->{'model_' . $this->ll->getExtensionModel() . '_event'}->deleteEvent($this->code . '_order_status');

		$this->load->model($this->ll->getRoute());

		$this->{$this->ll->getModel()}->uninstall();
	}
}

class ControllerModuleLLCDEKExchange extends ControllerExtensionModuleLLCDEKExchange {}
