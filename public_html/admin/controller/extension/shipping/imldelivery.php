<?php

require('imldelivery_data/DbModificator.php');


use IMLSdk\IMLClient;
use IMLSdk\Factory;
use Iml\Helpers\CMSFacade;
use Iml\CreateOrder\CreateOrderError;

class ControllerExtensionShippingImldelivery extends Controller 
{
	private $error = array();


	public function install() {	

		(new DbModificator($this))->install();

		$this->load->model('extension/event');
		
		// добавляем обработчики событий
		$this->model_extension_event->addEvent('add_iml_order', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/shipping/imldelivery/addImlOrder');



		$this->load->language('extension/extension/shipping');

		// $this->load->model('setting/setting');
		// $this->model_setting_setting->install('shipping', $this->request->get['extension']);

		$this->setDefaultSettings();
	}
	
	
	
	private function setDefaultSettings()
	{
		$defaultSettings = require('imldelivery_data/defaultSettings.php');
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('imldelivery', $defaultSettings['plugin_settings']);	
	}

	public function uninstall() {


		(new DbModificator($this))->uninstall();

		
		// удаление настроек
		$this->load->model('setting/setting');
		$moduleSettings = require('imldelivery_data/fields_4get_data.php');
		foreach ($moduleSettings as $settingItem) {
			$this->model_setting_setting->deleteSetting($settingItem);			
		}
	}
	
	//index for module
	
	public function index() 
	{
		$this->load->language('extension/shipping/imldelivery');

		$this->document->setTitle("IML доставка");
		$this->load->model('setting/setting');
		
		$data = [];

		$error_package = false;

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) 
		{

			try 
			{
				$this->checkFixPackParams();
				$this->checkGoodPackParams();
			} catch (\Exception $e) {
				$data['error_warning'] = $e->getMessage();
				$this->log->write($e->getMessage());
			}



			if(!isset($data['error_warning']))
			{
				$this->model_setting_setting->editSetting('imldelivery', $this->request->post);				
				$data['success'] = "Изменения успешно сохранены";
				$this->session->data['success'] = $this->language->get('text_success');
				// $this->response->redirect($this->url->link('marketplace/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true));
			}

		}
		
		$data['heading_title'] = "IML доставка";

		$fields4LanguageGet = require('imldelivery_data/fields4languageget.php');
		foreach ($fields4LanguageGet as $field) {
			$data[$field] = $this->language->get($field);
		}

		$defaultSettings = require('imldelivery_data/defaultSettings.php');

		// $data['MAX_PLACES_COUNT'] = $defaultSettings['request_settings']['MAX_PLACES_COUNT'];
		
		
		$this->load->library('imldeliverylib');
		$imlDeliveryLib = new Imldeliverylib($this->config);
		$data['imldelivery_cityfrom_values'] = $imlDeliveryLib->getFullRegions();

		
		$this->load->model('localisation/order_status');
		$data['imldelivery_payment_status_values'] = $this->model_localisation_order_status->getOrderStatuses();
		
		// ___p($data['shipping_imldelivery_payment_status_values']);
		// die();

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} 

		$data['breadcrumbs'] = [
			[
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
			],
			[
				'text' => "Расширения",
				'href' => $this->url->link('marketplace/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true)
			],
			[
				'text' => "IML доставка",
				'href' => $this->url->link('extension/shipping/imldelivery', 'token=' . $this->session->data['token'], true)
			]					

		];


		$data['action'] = $this->url->link('extension/shipping/imldelivery', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('marketplace/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true);
		

		$this->load->model('localisation/geo_zone');
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();


		$settings = $this->model_setting_setting->getSetting('imldelivery'); 
		$fields4DataSave = require('imldelivery_data/fields_4get_data.php');
		foreach ($fields4DataSave as $field) {
			if (isset($this->request->post[$field])) {
				$data[$field] = $this->request->post[$field];
			} else {
				$data[$field] = isset($settings[$field]) ? $settings[$field] : '';

			}
		}

// shipping_imldelivery_customservices
		$data['imldelivery_customservicesvals'] = $imlDeliveryLib->getIMLOrderStatusData();
		$data['imldelivery_vatvariants'] = $imlDeliveryLib->getVatVariants();
		$data['order_text_disabled'] = '';


		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');


		


		$this->response->setOutput($this->load->view('extension/shipping/imldelivery_config', $data));
	}
	
	
	
	protected function validate() 
	{
		if (!$this->user->hasPermission('modify', 'extension/shipping/imldelivery')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}


	// проверка корректной настройки модуля
	private function  checkFixPackParams()
	{

		if($this->request->post['imldelivery_packageCalcType'] == 'fix-pack' &&
		   (empty($this->request->post['imldelivery_defaultLength']) || 
		    empty($this->request->post['imldelivery_defaultWidth'])  || 
		    empty($this->request->post['imldelivery_defaultWidth']) ||
		    empty($this->request->post['imldelivery_defaultWeightKg']) 
		)
		) 
		{
			throw new \Exception("Не заданы все параметры для фиксированной  упаковки. Необходимо задать  все параметры для упаковки на вкладке 'Расчет'.", 1);

		}

		return true;

	}


	// проверка корректной настройки модуля
	private function checkGoodPackParams()
	{
		if(($this->request->post['imldelivery_packageCalcType'] == 'pgood-pack') &&
		   (empty($this->request->post['imldelivery_defaultGoodLength']) || 
		    empty($this->request->post['imldelivery_defaultGoodWidth'])  || 
		    empty($this->request->post['imldelivery_defaultGoodHeight']) ||
		    empty($this->request->post['imldelivery_defaultGoodWeightKg']))
		) 
		{
			throw new \Exception("Не заданы все параметры для товарной  упаковки. Необходимо задать  все параметры для упаковки на вкладке 'Расчет'.", 1);

		}

		return true;		
	}


	
	//отображение menu со списком заказов
	public function menuIndex() {

		$this->load->language('extension/shipping/imldelivery_menu');
		$this->load->model('extension/shipping/imldelivery_menu');

		
		$rdata['heading_title'] = $this->language->get('heading_title_main');

		$params = [
			'text_enabled',
			'text_disabled',
			'text_no_results',
			'text_iml_order_id',
			'text_iml_order_date_create',
			'text_iml_order_date_modified',
			'text_iml_order_fio',
			'text_iml_order_status',
			'text_order_status',
			'text_iml_order_actions',
			'text_iml_send_order',
			'entry_layout',
			'entry_position',
			'entry_status',
			'entry_sort_order',
			'column_dispatch_number',
			'column_dispatch_total_orders',
			'column_dispatch_date',
			'button_cancel',
			'button_option',
			'button_new_order',
		];

		foreach ($params as $param) {
			$rdata[$param] = $this->language->get($param);
		}
		
		if (isset($this->error['warning'])) {
			$rdata['error_warning'] = $this->error['warning'];
		} else {
			$rdata['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$rdata['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$rdata['success'] = '';
		}
		
		
		$rdata['breadcrumbs'] = [
			[
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
			],

			[
				'text' => "IML заказы",
				'href' => $this->url->link('extension/shipping/imldelivery_menu', 'token=' . $this->session->data['token'], true)
			],

		];

		
		// $title = $this->language->get('heading_title_bk_main');
		
		
		
		
		$rdata['total'] = 0;
		$rdata['token'] = $this->session->data['token'];
		
		
		//links
		$sortLinks = array(
			'order_id' => array('class' => '', 'nextlink' => HTTPS_CATALOG . 'admin/index.php?route=extension/shipping/imldelivery/menuindex&token=' . $this->session->data['token'] . '&sort=order_id&order=ASC'),
			'shipping_firstname' => array('class' => '', 'nextlink' => HTTPS_CATALOG . 'admin/index.php?route=extension/shipping/imldelivery/menuindex&token=' . $this->session->data['token'] . '&sort=shipping_firstname&order=ASC'),
			'date_create' => array('class' => '', 'nextlink' => HTTPS_CATALOG . 'admin/index.php?route=extension/shipping/imldelivery/menuindex&token=' . $this->session->data['token'] . '&sort=date_create&order=ASC'),
			'date_modified' => array('class' => '', 'nextlink' => HTTPS_CATALOG . 'admin/index.php?route=extension/shipping/imldelivery/menuindex&token=' . $this->session->data['token'] . '&sort=date_modified&order=ASC'),
			'order_iml_status_name' => array('class' => '', 'nextlink' => HTTPS_CATALOG . 'admin/index.php?route=extension/shipping/imldelivery/menuindex&token=' . $this->session->data['token'] . '&sort=order_iml_status_name&order=ASC'),
			'order_status_name' => array('class' => '', 'nextlink' => HTTPS_CATALOG . 'admin/index.php?route=extension/shipping/imldelivery/menuindex&token=' . $this->session->data['token'] . '&sort=order_status_name&order=ASC')
		);
		
		
		$orders_order = NULL;
		$orders_sort = NULL;
		$filter_key = NULL;
		$filter_value = NULL;
		if(isset($this->request->get['sort']) && 
		   array_key_exists($this->request->get['sort'], $sortLinks) && 
		   ($this->request->get['order'] == 'ASC' || $this->request->get['order'] == 'DESC')
		) {
			$orders_order = $this->request->get['order'];
		$orders_sort = $this->request->get['sort'];
		$nextlink_order = ($this->request->get['order'] == 'ASC' ? 'DESC':'ASC');
		$sortLinks[$this->request->get['sort']] = array(
			'class' => ' class="'.strtolower($nextlink_order).'"',
			'nextlink' => HTTPS_CATALOG . 'admin/index.php?route=extension/shipping/imldelivery/menuindex&token=' . $this->session->data['token'] . '&sort=' . $this->request->get['sort'] . '&order=' . $nextlink_order
		);
	}
	if(isset($this->request->get['filter_key']) && 
	   strlen($this->request->get['filter_key']) > 0 && 
	   isset($this->request->get['filter_value']) && 
	   strlen($this->request->get['filter_value']) > 0) 
	{
		$filter_key = $this->request->get['filter_key'];
		$filter_value = $this->request->get['filter_value'];
		foreach($sortLinks as $t_key => $t_val) {
			$sortLinks[$t_key]['nextlink'] .= "&filter_key=" . $this->request->get['filter_key'] . "&filter_value=" . $this->request->get['filter_value'];
		}
	}
	$rdata['filter_key'] = $filter_key;
	$rdata['filter_value'] = $filter_value;
		//получаем список заказов
	$rdata['orders'] = $this->getOrders(NULL, $orders_sort, $orders_order, $filter_key, $filter_value);
	$rdata['links'] = $sortLinks;

	$rdata['header'] = $this->load->controller('common/header');
	$rdata['column_left'] = $this->load->controller('common/column_left');
	$rdata['footer'] = $this->load->controller('common/footer');
	$rdata['HTTPS_SERVER'] = HTTPS_SERVER;
	
	$this->response->setOutput($this->load->view('extension/shipping/imldelivery_menu', $rdata));
}



public function doFilterAdmin() {
	$arPost = $this->request->post;
	$url = HTTPS_CATALOG . 'admin/index.php?route=extension/shipping/imldelivery/menuindex&token=' . $this->session->data['token'];
	if(isset($arPost['sort']) && strlen($arPost['sort']) > 0 && isset($arPost['order']) && strlen($arPost['order']) > 0) {
		$url .= "&sort=" . $arPost['sort'] . "&order=" . $arPost['order'];
	}
	if(!isset($arPost['reset']) && isset($arPost['filter_key']) && isset($arPost['filter_value']) && strlen($arPost['filter_value']) > 0) {
		$url .= "&filter_key=" . $arPost['filter_key'] . "&filter_value=" . $arPost['filter_value'];
	}
	$this->response->setOutput($url);
}





public function getOrders($id = NULL, $sort = NULL, $order = NULL, $filter = NULL, $value = NULL) 
{
	$this->load->model('extension/shipping/imldelivery_menu');
	$orders = array();
	if(is_null($id)) {
		$orders = $this->model_extension_shipping_imldelivery_menu->getOrders(NULL, $sort, $order, $filter, $value);
	} else {
		$orders = $this->model_extension_shipping_imldelivery_menu->getOrders($id);
	}

	$result = array();

	$this->load->library('imldeliverylib');
	$imlDeliveryLib = new Imldeliverylib($this->registry);

	foreach($orders as $order) {
		$temp = $order;
		
		$temp['order_iml_status_name'] = $imlDeliveryLib->correctImlOrderStatus($temp['order_iml_status_name']);
		$temp['order_status_text'] = $this->getOrderStatusText($order['order_status_id'], $order['language_id']);
		$result[] = $temp;
	}
	return $result;
}

public function getOrderStatusText($status_id, $language_id) {
	$this->load->model('extension/shipping/imldelivery_menu');
	$arStatus = $this->model_extension_shipping_imldelivery_menu->getOrderStatusText($status_id, $language_id);
	return $arStatus['name'];
}



	//отображение страницы конкретного заказа
public function orderIndex() {

	try {
		$this->renderOrder();
	} catch (\Throwable $th) {
		___p($th->getMessage());
		echo "Сервисы IML API недоступны  в настоящее время. Попробуйте отредактировать заказ позднее";
	}
}


private function renderOrder()
{

	
	$this->load->language('extension/shipping/imldelivery_order');
	$this->load->model('sale/order');
	$this->load->model('catalog/product');

	
	if (isset($this->error['warning'])) {
		$rdata['error_warning'] = $this->error['warning'];
	} else {
		$rdata['error_warning'] = '';
	}

	if (isset($this->session->data['success'])) {
		$rdata['success'] = $this->session->data['success'];

		unset($this->session->data['success']);
	} else {
		$rdata['success'] = '';
	}

	$rdata['breadcrumbs'] = array();

	$rdata['breadcrumbs'][] = array(
		'text'      => $this->language->get('text_home'),
		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	);

	$rdata['breadcrumbs'][] = array(
		'text'      => $this->language->get('text_module'),
		'href'      => $this->url->link('catalog', 'token=' . $this->session->data['token'], 'SSL'),
	);
	
	
	$title = $this->language->get('heading_title_bk_main');
	
	$new_orders = 0;
	
	
	$rdata['token'] = $this->session->data['token'];
	$this->document->setTitle($title);
	
	$rdata['dispatches'] = array();
	
	$rdata['header'] = $this->load->controller('common/header');
	$rdata['column_left'] = $this->load->controller('common/column_left');
	$rdata['footer'] = $this->load->controller('common/footer');
	$rdata['https_catalog'] = HTTPS_CATALOG;
	$rdata['isset_order'] = 'unset';

	$order_id = null;


	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) 
	{
		$order_id = $this->request->post['order_id'];

		$this->saveOrderForm($order_id, $this->request->post);
	}



	if(isset($this->request->get['order_id']) && is_numeric($this->request->get['order_id']))
	{
		$order_id = $this->request->get['order_id'];
	}



	if($order_id) {

		$this->load->model('extension/shipping/imldelivery_menu');
		$order = $this->model_extension_shipping_imldelivery_menu->getOrders($order_id);

		$order = array_shift($order);

		$rdata['order_id'] = $order_id;

		$imlClient = new IMLClient(new Factory());
		$courierCityToCollection = $imlClient->getSortedRegionCityCollection();
		$cmsFacade = new CMSFacade($this->config);	
		$this->load->library('imldeliverylib');
		$imlLibrary = new Imldeliverylib($this->config);		
		$sdType = $imlLibrary->getSdType();


		$deliveryPointsCollection = $imlClient->getSortedDeliveryPointsCollection($sdType);

		$shipping_iml_custom_field = json_decode($order['shipping_iml_custom_field'], true);

		// ___p($shipping_iml_custom_field);
		// die();
		$volumeAr = json_encode($shipping_iml_custom_field['volumeAr']);

		
		$rdata['imlStatusCode'] = empty($order['order_iml_status_code']) ? 0 : $order['order_iml_status_code'];
		$rdata['imlStatusName'] = $imlLibrary->correctImlOrderStatus($order['order_iml_status_name']);

		

		$total = round($order['total'], 2);

		$token = $this->session->data['token'];
		$rdata = array_merge($rdata, compact('order', 'shipping_iml_custom_field', 'courierCityToCollection', 'deliveryPointsCollection', 'volumeAr', 'total', 'token'));
		$rdata['order_text_disabled'] = (isset($shipping_iml_custom_field['imlBarcode']) && $shipping_iml_custom_field['imlBarcode']) ? ' disabled="disabled" ' : ''
		;
		$rdata['readOnly'] = !empty($rdata['order_text_disabled']);


		$rdata['error_warning'] = null;	

		$rdata['imldelivery_cityfrom_values'] = $imlLibrary->getFullRegions();
		$rdata['action'] = $this->url->link('extension/shipping/imldelivery/orderindex', 'token=' . $this->session->data['token'], true);		
		
		$rdata['imldelivery_customservicesvals'] = $imlLibrary->getIMLOrderStatusData();


		$rdata['imldelivery_vatvariants'] = $imlLibrary->getVatVariants();
		$rdata['imldelivery_customservices'] = isset($shipping_iml_custom_field['allowedConditions']) ? $shipping_iml_custom_field['allowedConditions'] : [];
		



		$this->document->addStyle('//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css');
		$this->document->addStyle('view/stylesheet/imldelivery_menu.css');
		$this->document->addStyle('view/stylesheet/iml_pvz_widget.css');


		$this->document->addScript('https://code.jquery.com/ui/1.12.1/jquery-ui.js');
		$this->document->addScript('https://cdn.jsdelivr.net/npm/vue/dist/vue.js');

		$this->document->addScript('view/javascript/imldelivery_menu.js');
		$this->document->addScript('view/javascript/iml_pvz_widget.js');
		$this->document->addScript('view/javascript/jquery.multi-select.js');
		$rdata['styles'] = $this->document->getStyles();
		$rdata['scripts'] = $this->document->getScripts();
		$rdata['HTTPS_SERVER'] = HTTPS_SERVER;



		$this->response->setOutput($this->load->view('extension/shipping/imldelivery_order', $rdata));
	}	
}



	//сохранение полей заказа перед отправкой в IML API
private function saveOrderForm($order_id, array $postData)
{

	$cityFrom = $postData['cityFrom'];
	$toPlace = explode( '__|__',  $postData['cityTo']);
	$cityTo = $toPlace[0];
	$regionTo = $toPlace[1];
	
	$pvzPointToID = $postData['pvzPointToID'];
	
	$Amount = $postData['Amount'];
	$ValuatedAmount = $postData['ValuatedAmount'];
	$enableFullfilment = isset($postData['enableFullfilment']);

	$courierRegionCodeTo = '';
	$address = '';
	$imlBarcode = isset($postData['imlBarcode']) ? $postData['imlBarcode'] : '';
	$shipping_method_job = $postData['Job'];
	$shipping_method_date_delivery = $postData['DeliveryDate'];
	$shipping_method_cost = isset($postData['DeliveryCost']) ? $postData['DeliveryCost'] : 0;
	$VATRate = $postData['VATRate'];
	
	

	$isIncludedDeliveryCost   = isset($postData['isIncludedDeliveryCost']);
	$allowedConditions = isset($postData['imldelivery_customservices']) ? $postData['imldelivery_customservices'] : [];
	

			// лучше конструировать некий объект в будущем
	
	$volumeAr  = isset($postData['place']) ? array_values($postData['place']) : [];

	$data4CustomField = compact('enableFullfilment',
	                            'courierRegionCodeTo',
	                            'pvzPointToID',
	                            'cityTo',
	                            'regionTo',
	                            'cityFrom',
	                            'address', 'Amount', 
	                            'ValuatedAmount', 
	                            'volumeAr', 'imlBarcode', 
	                            'shipping_method_job',
	                            'shipping_method_date_delivery',
	                            'shipping_method_cost',
	                            'allowedConditions',
	                            'isIncludedDeliveryCost',
	                            'VATRate'
	                        );	
	$jsonData = json_encode($data4CustomField);



	$orderParams = ['comment', 'firstname', 'lastname', 'telephone', 'email', 'shipping_address_1'];
	$orderFieldsUpdate = [];
	foreach ($orderParams as $key => $value) {
		if(isset($postData[$value]))
		{
			$orderFieldsUpdate[$value] =trim($postData[$value]);
		}
	}

	$this->load->library('imldeliverylib');
	$imlLibrary = new Imldeliverylib($this->config);		
	$sdType = $imlLibrary->getSdType();			
	$jsonData = $imlLibrary->escapeJsonData($jsonData);

	$orderFieldsUpdate['shipping_iml_custom_field']  = $jsonData;


// ___p($orderFieldsUpdate);
// die();

	$this->load->model('extension/shipping/imldelivery_menu');
	return $this->model_extension_shipping_imldelivery_menu->changeOrder($order_id, $orderFieldsUpdate);

}


	// получаем поля заказа
private function getRequstOrderData($formData)
{

	$toPlace = explode( '__|__',  $formData['cityTo']);
	$cityTo = $toPlace[0];
	$regionTo = $toPlace[1];
	$volumeAr  = isset($formData['place']) ? array_values($formData['place']) : [];
	
	$ValuatedAmount = $formData['ValuatedAmount'];
	$enableFullfilment = isset($formData['enableFullfilment']);
	$Job = $formData['Job'];

	$cityFrom = $formData['cityFrom'];
	$pvzPointToID = $formData['pvzPointToID'];
	$shipping_address_1 = $formData['shipping_address_1'];
	$phone = $formData['telephone'];
	$email = $formData['email'];
	$firstname = $formData['firstname'];
	$lastname = $formData['lastname'];	
	$DeliveryCost = isset($formData['DeliveryCost']) ? $formData['DeliveryCost'] : 0;
	$VATRate = $formData['VATRate'];
	$Amount = $formData['Amount'];
	
	
	$isIncludedDeliveryCost = (isset($formData['isIncludedDeliveryCost'])) ? true : false;
		//если услуга Доставка не включается в чек покапателю
	if(!$isIncludedDeliveryCost)
	{
		$DeliveryCost = null;
	}

	$allowedConditions = isset($formData['imldelivery_customservices']) ? $formData['imldelivery_customservices'] : [] ;
	
	return compact('Job', 'cityFrom', 'cityTo', 'regionTo', 'pvzPointToID', 'shipping_address_1', 'volumeAr', 'ValuatedAmount', 'enableFullfilment', 
	               'phone', 'email', 'firstname', 'lastname', 'allowedConditions', 'DeliveryCost', 'VATRate', 'Amount');
}


	// обработчик ajax-вызовов
public function ajaxHandler()
{

	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) 
	{


		$this->load->library('imldeliverylib');
			// ___p($formData);
		$imlLibrary = new Imldeliverylib($this->config);		
		$this->load->model('extension/shipping/imldelivery_menu');
		

		switch ($this->request->post['action']) {
			case 'recalcDeliveryCost':
			try
			{
				parse_str(html_entity_decode($this->request->post['formData']), $formData);
				$params = $this->getRequstOrderData($formData);
				extract($params);
				$products = $this->model_extension_shipping_imldelivery_menu->getOrderProducts($formData['order_id']);
				$result = $imlLibrary->calcDelivery4Order($products, $Job, $cityFrom, $cityTo, $regionTo, $pvzPointToID, $shipping_address_1, $volumeAr, $ValuatedAmount, $allowedConditions, $enableFullfilment, $VATRate);			

			} catch (\Exception $e) 
			{
				$result = ['error' => $e->getMessage()];
			}				
			break;
			case 'createOrder':
			parse_str(html_entity_decode($this->request->post['formData']), $formData);
			$this->saveOrderForm($formData['order_id'], $formData);
			$params = $this->getRequstOrderData($formData);
			extract($params);
			$products = $this->model_extension_shipping_imldelivery_menu->getOrderProducts($formData['order_id']);
			try 
			{

				$imlBarcode = $imlLibrary->createIMLOrder($formData['order_id'], $products, $Job, $cityFrom, $cityTo, $regionTo, $pvzPointToID, $shipping_address_1, $volumeAr, $ValuatedAmount, $allowedConditions, $enableFullfilment, $phone, $email, $firstname, $lastname, $DeliveryCost, $VATRate);		
				
				$result = compact('imlBarcode');
						// сохраним imlBarcode  в данных заказа
				$this->saveOrderForm($formData['order_id'], array_merge($formData, $result));			

			} catch (\Exception $e) 
			{
				$result = ['error' => $e->getMessage()];
			}

			break;

			case 'getStatus':
			$barcode = $this->request->post['barcode'];
			$order_id = $this->request->post['order_id'];
			if($barcode)
			{
				try 
				{
					$statusDataResponse = $imlLibrary->getOrderStatus($barcode);


					if($statusDataResponse->statusCode != 200)
					{
						throw new \Exception("Ошибка получения статуса заказа  на сервере IML. Возможно заказ создан в тестовом режиме", 1);
					}

					if(!isset($statusDataResponse->content[0]))
					{
						throw new \Exception("Ошибка получения данных по статусу заказа  на сервере IML. Возможно заказ создан в тестовом режиме", 1);		
					}
					
					$result = ['order_iml_status_code' => $statusDataResponse->content[0]['OrderStatus'],
					'order_iml_status_name' => $statusDataResponse->content[0]['StateDescription']
				];
				
				$this->load->model('extension/shipping/imldelivery_menu');
				$this->model_extension_shipping_imldelivery_menu->changeOrder($order_id, $result);
				
			} catch (\Exception $e) {
				$result = ['error' => $e->getMessage()];
			}

		}

		break;

		case 'printBarcode':
		try 
		{
			$barcode = $this->request->post['barcode'];
							// загрузим данные с pdf и запишем в файл
			$imlLibrary->getOrderBarcodesInPdfFormat($barcode);
			$url = $this->url->link('extension/shipping/imldelivery/download', "token={$this->session->data['token']}&barcode={$barcode}", true);	
			$result = ['url' => htmlspecialchars_decode($url)];							

		} catch (\Exception $e) {
			$result = ['error' => $e->getMessage()];
		}
		break;


			// case 'getPvzList4Widget':
			// $result = $imlLibrary->getPvzList4Widget();
			// 		// var_dump($formattedList);
			// 		// return json_encode($formattedList, JSON_UNESCAPED_UNICODE);					
			// break;
	}

			// ___p($result);
	
	echo json_encode($result);
}

}


// отдаем pdf-файл со штрих-кодами заказа
public function download()
{
	$barcode = $this->request->get['barcode'];

	if($barcode)
	{

		$this->load->library('imldeliverylib');
		$imlLibrary = new Imldeliverylib($this->config);		

		$filePath = $imlLibrary->getBarcodeFilePath($barcode);
		if (file_exists($filePath)) {
			$name = "{$barcode}.pdf";
			$content = file_get_contents($filePath);
			header('Content-Type: application/pdf');
			header('Content-Length: '.strlen( $content ));
			header('Content-disposition: inline; filename="' . $name . '"');
			header('Cache-Control: public, must-revalidate, max-age=0');
			header('Pragma: public');
			header('Expires: Sat, 26 Jul 1997 05:00:00 GMT');
			header('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT');
			echo $content;
			exit;
		} else {
			exit('Файл  ' . $filePath . ' не найден');
		}			
	}
}


}

