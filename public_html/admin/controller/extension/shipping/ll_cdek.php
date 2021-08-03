<?php
/**
 * @author    p0v1n0m <support@lutylab.ru>
 * @license   Commercial
 * @link      https://lutylab.ru
 */
class ControllerExtensionShippingLLcdek extends Controller {
	private $m = 'll_cdek';
	private $version = '3.5.1';
	private $email = 'support@lutylab.ru';
	private $site = 'https://lutylab.ru';
	private $module_docs = 'https://docs.lutylab.ru/ll_cdek';
	private $delivery = 'https://www.cdek.ru';
	private $api_docs = 'https://confluence.cdek.ru/pages/viewpage.action?pageId=15616129';
	private $services = [
		['code' => '2', 'name' => 'СТРАХОВАНИЕ'],
		['code' => '3', 'name' => 'ДОСТАВКА В ВЫХОДНОЙ ДЕНЬ'],
		['code' => '5', 'name' => 'ТЯЖЕЛЫЙ ГРУЗ'],
		['code' => '6', 'name' => 'НЕГАБАРИТНЫЙ ГРУЗ'],
		['code' => '7', 'name' => 'ОПАСНЫЙ ГРУЗ'],
		['code' => '9', 'name' => 'ОЖИДАНИЕ БОЛЕЕ 15 МИН. У ПОЛУЧАТЕЛЯ'],
		['code' => '14', 'name' => 'УДАЛЕННЫЙ РАЙОН'],
		['code' => '15', 'name' => 'ПОВТОРНАЯ ПОЕЗДКА'],
		['code' => '24', 'name' => 'УПАКОВКА 1'],
		['code' => '25', 'name' => 'УПАКОВКА 2'],
		['code' => '27', 'name' => 'СМС УВЕДОМЛЕНИЕ'],
		['code' => '30', 'name' => 'ПРИМЕРКА НА ДОМУ'],
		['code' => '32', 'name' => 'СКАН ДОКУМЕНТОВ'],
		['code' => '33', 'name' => 'ПОДЪЕМ НА ЭТАЖ РУЧНОЙ'],
		['code' => '34', 'name' => 'ПОДЪЕМ НА ЭТАЖ ЛИФТОМ'],
		['code' => '35', 'name' => 'ПРОЗВОН'],
		['code' => '36', 'name' => 'ЧАСТИЧНАЯ ДОСТАВКА'],
		['code' => '37', 'name' => 'ОСМОТР ВЛОЖЕНИЯ'],
		['code' => '41', 'name' => 'ВОЗВРАТ ДОКУМЕНТОВ'],
		['code' => '48', 'name' => 'РЕВЕРС'],
	];
	private $variants = [
		'136' => [
			'code'        => '136',
			'name'        => 'Посылка склад-склад',
			'limit'       => '30',
			'description' => 'Услуга экономичной доставки товаров по России для компаний, осуществляющих дистанционную торговлю.',
		],
		'368' => [
			'code'        => '368',
			'name'        => 'Посылка склад-постамат',
			'limit'       => '30',
			'description' => 'Услуга экономичной доставки товаров по России для компаний, осуществляющих дистанционную торговлю.',
		],
		'137' => [
			'code'        => '137',
			'name'        => 'Посылка склад-дверь',
			'limit'       => '30',
			'description' => 'Услуга экономичной доставки товаров по России для компаний, осуществляющих дистанционную торговлю.',
		],
		'138' => [
			'code'        => '138',
			'name'        => 'Посылка дверь-склад',
			'limit'       => '30',
			'description' => 'Услуга экономичной доставки товаров по России для компаний, осуществляющих дистанционную торговлю.',
		],
		'366' => [
			'code'        => '366',
			'name'        => 'Посылка дверь-постамат',
			'limit'       => '30',
			'description' => 'Услуга экономичной доставки товаров по России для компаний, осуществляющих дистанционную торговлю.',
		],
		'139' => [
			'code'        => '139',
			'name'        => 'Посылка дверь-дверь',
			'limit'       => '30',
			'description' => 'Услуга экономичной доставки товаров по России для компаний, осуществляющих дистанционную торговлю.',
		],
		'10' => [
			'code'        => '10',
			'name'        => 'Экспресс лайт склад-склад',
			'limit'       => '30',
			'description' => 'Классическая экспресс-доставка по России документов и грузов.',
		],
		'363' => [
			'code'        => '363',
			'name'        => 'Экспресс лайт склад-постамат',
			'limit'       => '30',
			'description' => 'Классическая экспресс-доставка по России документов и грузов до 30 кг.',
		],
		'11' => [
			'code'        => '11',
			'name'        => 'Экспресс лайт склад-дверь',
			'limit'       => '30',
			'description' => 'Классическая экспресс-доставка по России документов и грузов.',
		],
		'12' => [
			'code'        => '12',
			'name'        => 'Экспресс лайт дверь-склад',
			'limit'       => '30',
			'description' => 'Классическая экспресс-доставка по России документов и грузов.',
		],
		'361' => [
			'code'        => '361',
			'name'        => 'Экспресс лайт дверь-постамат',
			'limit'       => '30',
			'description' => 'Классическая экспресс-доставка по России документов и грузов до 30 кг.',
		],
		'1' => [
			'code'        => '1',
			'name'        => 'Экспресс лайт дверь-дверь',
			'limit'       => '30',
			'description' => 'Классическая экспресс-доставка по России документов и грузов до 30 кг.',
		],
		'233' => [
			'code'        => '233',
			'name'        => 'Экономичная посылка склад-дверь',
			'limit'       => '50',
			'description' => 'Услуга экономичной наземной доставки товаров по России для компаний, осуществляющих дистанционную торговлю. Услуга действует по направлениям из Москвы в подразделения СДЭК, находящиеся за Уралом и в Крым.',
		],
		'234' => [
			'code'        => '234',
			'name'        => 'Экономичная посылка склад-склад',
			'limit'       => '50',
			'description' => 'Услуга экономичной наземной доставки товаров по России для компаний, осуществляющих дистанционную торговлю. Услуга действует по направлениям из Москвы в подразделения СДЭК, находящиеся за Уралом и в Крым.',
		],
		'378' => [
			'code'        => '378',
			'name'        => 'Экономичная посылка склад-постамат',
			'limit'       => '50',
			'description' => 'Услуга экономичной наземной доставки товаров по России для компаний, осуществляющих дистанционную торговлю. Услуга действует по направлениям из Москвы в подразделения СДЭК, находящиеся за Уралом и в Крым.',
		],
		'291' => [
			'code'        => '291',
			'name'        => 'CDEK Express склад-склад',
			'limit'       => '',
			'description' => 'Сервис по доставке товаров из-за рубежа в Россию, Украину, Казахстан, Киргизию, Узбекистан с услугами по таможенному оформлению. Предлагается 2 схемы работы: 1) клиент доставляет заказ на таможенный пост в России. Мы встречаем, помогаем с таможней и доставляем адресату; 2) клиент привозит посылки на один из наших складов за рубежом. Мы перевозим их на таможенный пост в Россию, проводим очистку и доставляем получателю.',
		],
		'293' => [
			'code'        => '293',
			'name'        => 'CDEK Express дверь-дверь',
			'limit'       => '',
			'description' => 'Сервис по доставке товаров из-за рубежа в Россию, Украину, Казахстан, Киргизию, Узбекистан с услугами по таможенному оформлению. Предлагается 2 схемы работы: 1) клиент доставляет заказ на таможенный пост в России. Мы встречаем, помогаем с таможней и доставляем адресату; 2) клиент привозит посылки на один из наших складов за рубежом. Мы перевозим их на таможенный пост в Россию, проводим очистку и доставляем получателю.',
		],
		'294' => [
			'code'        => '294',
			'name'        => 'CDEK Express склад-дверь',
			'limit'       => '',
			'description' => 'Сервис по доставке товаров из-за рубежа в Россию, Украину, Казахстан, Киргизию, Узбекистан с услугами по таможенному оформлению. Предлагается 2 схемы работы: 1) клиент доставляет заказ на таможенный пост в России. Мы встречаем, помогаем с таможней и доставляем адресату; 2) клиент привозит посылки на один из наших складов за рубежом. Мы перевозим их на таможенный пост в Россию, проводим очистку и доставляем получателю.',
		],
		'295' => [
			'code'        => '295',
			'name'        => 'CDEK Express дверь-склад',
			'limit'       => '',
			'description' => 'Сервис по доставке товаров из-за рубежа в Россию, Украину, Казахстан, Киргизию, Узбекистан с услугами по таможенному оформлению. Предлагается 2 схемы работы: 1) клиент доставляет заказ на таможенный пост в России. Мы встречаем, помогаем с таможней и доставляем адресату; 2) клиент привозит посылки на один из наших складов за рубежом. Мы перевозим их на таможенный пост в Россию, проводим очистку и доставляем получателю.',
		],
		'7' => [
			'code'        => '7',
			'name'        => 'Международный экспресс документы дверь-дверь',
			'limit'       => '5',
			'description' => 'Экспресс-доставка за/из-за границы документов и писем.',
		],
		'8' => [
			'code'        => '8',
			'name'        => 'Международный экспресс грузы дверь-дверь',
			'limit'       => '30',
			'description' => 'Экспресс-доставка за/из-за границы грузов и посылок до 30 кг.',
		],
		'243' => [
			'code'        => '243',
			'name'        => 'Китайский экспресс склад-склад',
			'limit'       => '',
			'description' => 'Услуга по доставке из Китая в Россию, Беларусь и Казахстан. Стоимость разбита по интервалам: - до 200 гр; - каждые последующие 100 гр до 1 кг; - каждый последующий 1кг свыше 1 кг.',
		],
		'245' => [
			'code'        => '245',
			'name'        => 'Китайский экспресс дверь-дверь',
			'limit'       => '',
			'description' => 'Услуга по доставке из Китая в Россию, Беларусь и Казахстан. Стоимость разбита по интервалам: - до 200 гр; - каждые последующие 100 гр до 1 кг; - каждый последующий 1кг свыше 1 кг.',
		],
		'246' => [
			'code'        => '246',
			'name'        => 'Китайский экспресс склад-дверь',
			'limit'       => '',
			'description' => 'Услуга по доставке из Китая в Россию, Беларусь и Казахстан. Стоимость разбита по интервалам: - до 200 гр; - каждые последующие 100 гр до 1 кг; - каждый последующий 1кг свыше 1 кг.',
		],
		'247' => [
			'code'        => '247',
			'name'        => 'Китайский экспресс дверь-склад',
			'limit'       => '',
			'description' => 'Услуга по доставке из Китая в Россию, Беларусь и Казахстан. Стоимость разбита по интервалам: - до 200 гр; - каждые последующие 100 гр до 1 кг; - каждый последующий 1кг свыше 1 кг.',
		],
		'5' => [
			'code'        => '5',
			'name'        => 'Экономичный экспресс склад-склад',
			'limit'       => '',
			'description' => 'Недорогая доставка грузов по России ЖД и автотранспортом (доставка грузов с увеличением сроков).',
		],
		'15' => [
			'code'        => '15',
			'name'        => 'Экспресс тяжеловесы склад-склад',
			'limit'       => '30',
			'description' => 'Классическая экспресс-доставка по России грузов.',
		],
		'16' => [
			'code'        => '16',
			'name'        => 'Экспресс тяжеловесы склад-дверь',
			'limit'       => '30',
			'description' => 'Классическая экспресс-доставка по России грузов.',
		],
		'17' => [
			'code'        => '17',
			'name'        => 'Экспресс тяжеловесы дверь-склад',
			'limit'       => '30',
			'description' => 'Классическая экспресс-доставка по России грузов.',
		],
		'18' => [
			'code'        => '18',
			'name'        => 'Экспресс тяжеловесы дверь-дверь',
			'limit'       => '30',
			'description' => 'Классическая экспресс-доставка по России грузов.',
		],
		'57' => [
			'code'        => '57',
			'name'        => 'Супер-экспресс до 9 дверь-дверь',
			'limit'       => '30',
			'description' => 'Срочная доставка документов и грузов «из рук в руки» по России к определенному часу (доставка за 1-2 суток).',
		],
		'58' => [
			'code'        => '58',
			'name'        => 'Супер-экспресс до 10 дверь-дверь',
			'limit'       => '30',
			'description' => 'Срочная доставка документов и грузов «из рук в руки» по России к определенному часу (доставка за 1-2 суток).',
		],
		'59' => [
			'code'        => '59',
			'name'        => 'Супер-экспресс до 12 дверь-дверь',
			'limit'       => '30',
			'description' => 'Срочная доставка документов и грузов «из рук в руки» по России к определенному часу (доставка за 1-2 суток).',
		],
		'60' => [
			'code'        => '60',
			'name'        => 'Супер-экспресс до 14 дверь-дверь',
			'limit'       => '30',
			'description' => 'Срочная доставка документов и грузов «из рук в руки» по России к определенному часу (доставка за 1-2 суток).',
		],
		'61' => [
			'code'        => '61',
			'name'        => 'Супер-экспресс до 16 дверь-дверь',
			'limit'       => '30',
			'description' => 'Срочная доставка документов и грузов «из рук в руки» по России к определенному часу (доставка за 1-2 суток).',
		],
		'3' => [
			'code'        => '3',
			'name'        => 'Супер-экспресс до 18 дверь-дверь',
			'limit'       => '30',
			'description' => 'Срочная доставка документов и грузов «из рук в руки» по России к определенному часу.',
		],
		'62' => [
			'code'        => '62',
			'name'        => 'Магистральный экспресс склад-склад',
			'limit'       => '',
			'description' => 'Быстрая экономичная доставка грузов по России',
		],
		'63' => [
			'code'        => '63',
			'name'        => 'Магистральный супер-экспресс склад-склад',
			'limit'       => '',
			'description' => 'Быстрая экономичная доставка грузов к определенному часу',
		],
		'118' => [
			'code'        => '118',
			'name'        => 'Экономичный экспресс дверь-дверь',
			'limit'       => '',
			'description' => 'Недорогая доставка грузов по России ЖД и автотранспортом (доставка грузов с увеличением сроков).',
		],
		'119' => [
			'code'        => '119',
			'name'        => 'Экономичный экспресс склад-дверь',
			'limit'       => '',
			'description' => 'Недорогая доставка грузов по России ЖД и автотранспортом (доставка грузов с увеличением сроков).',
		],
		'120' => [
			'code'        => '120',
			'name'        => 'Экономичный экспресс дверь-склад',
			'limit'       => '',
			'description' => 'Недорогая доставка грузов по России ЖД и автотранспортом (доставка грузов с увеличением сроков).',
		],
		'121' => [
			'code'        => '121',
			'name'        => 'Магистральный экспресс дверь-дверь',
			'limit'       => '',
			'description' => 'Быстрая экономичная доставка грузов по России',
		],
		'122' => [
			'code'        => '122',
			'name'        => 'Магистральный экспресс склад-дверь',
			'limit'       => '',
			'description' => 'Быстрая экономичная доставка грузов по России',
		],
		'123' => [
			'code'        => '123',
			'name'        => 'Магистральный экспресс дверь-склад',
			'limit'       => '',
			'description' => 'Быстрая экономичная доставка грузов по России',
		],
		'124' => [
			'code'        => '124',
			'name'        => 'Магистральный супер-экспресс дверь-дверь',
			'limit'       => '',
			'description' => 'Быстрая экономичная доставка грузов к определенному часу',
		],
		'125' => [
			'code'        => '125',
			'name'        => 'Магистральный супер-экспресс склад-дверь',
			'limit'       => '',
			'description' => 'Быстрая экономичная доставка грузов к определенному часу',
		],
		'126' => [
			'code'        => '126',
			'name'        => 'Магистральный супер-экспресс дверь-склад',
			'limit'       => '',
			'description' => 'Быстрая экономичная доставка грузов к определенному часу',
		],
	];
	private $variants_map = ['136', '138', '366', '368', '234', '378', '291', '295', '243', '247', '361', '363', '5', '10', '12', '15', '17', '62', '63', '120', '123', '126'];
	private $variants_postamat = ['366', '368', '378', '361', '363'];
	private $controls = [
		'geolocationControl',
		'searchControl',
		'routeButtonControl',
		'trafficControl',
		'typeSelector',
		'fullscreenControl',
		'zoomControl',
		'rulerControl',
	];
	private $error = [];

	public function index() {
		$this->load->language('extension/shipping/' . $this->m);

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (isset($this->request->post[$this->m . '_license']) && isset($this->request->server['HTTP_HOST']) && base64_encode(hash_hmac('sha256',$this->request->server['HTTP_HOST'].$this->m,M_PI,true)) == $this->request->post[$this->m . '_license']) {
				$this->load->model('setting/setting');

				$this->model_setting_setting->editSetting($this->m, $this->request->post);

				$this->session->data['success'] = $this->language->get('text_success');

				$this->response->redirect($this->url->link('extension/shipping/' . $this->m, 'token=' . $this->session->data['token'], true));
			} else {
				$this->load->model('extension/extension');

				$this->model_extension_extension->uninstall('shipping', $this->m);

				$this->session->data['warning'] = $this->language->get('error_license');

				$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true));
			}
		}

		$this->load->model('extension/shipping/' . $this->m);
		$this->load->model('localisation/weight_class');
		$this->load->model('localisation/length_class');
		$this->load->model('localisation/tax_class');
		$this->load->model('localisation/geo_zone');
		$this->load->model('localisation/currency');
		$this->load->model('customer/customer_group');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_license'] = $this->language->get('heading_license');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_update'] = $this->language->get('button_update');
		$data['tab_api'] = $this->language->get('tab_api');
		$data['tab_log'] = $this->language->get('tab_log');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_delivery'] = $this->language->get('tab_delivery');
		$data['tab_stop'] = $this->language->get('tab_stop');
		$data['tab_cost'] = $this->language->get('tab_cost');
		$data['tab_map'] = $this->language->get('tab_map');
		$data['tab_cap'] = $this->language->get('tab_cap');
		$data['tab_support'] = $this->language->get('tab_support');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_developer'] = $this->language->get('text_developer');
		$data['text_site'] = $this->language->get('text_site');
		$data['text_module_docs'] = $this->language->get('text_module_docs');
		$data['text_delivery'] = $this->language->get('text_delivery');
		$data['text_api_docs'] = $this->language->get('text_api_docs');
		$data['text_kg'] = $this->language->get('text_kg');
		$data['text_sm'] = $this->language->get('text_sm');
		$data['text_rub'] = $this->language->get('text_rub');
		$data['text_dni'] = $this->language->get('text_dni');
		$data['text_product_one'] = $this->language->get('text_product_one');
		$data['text_product_all'] = $this->language->get('text_product_all');
		$data['text_width'] = $this->language->get('text_width');
		$data['text_length'] = $this->language->get('text_length');
		$data['text_height'] = $this->language->get('text_height');
		$data['text_logo'] = $this->language->get('text_logo');
		$data['text_from_city'] = $this->language->get('text_from_city');
		$data['text_to_city'] = $this->language->get('text_to_city');
		$data['text_days'] = $this->language->get('text_days');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_code'] = $this->language->get('text_code');
		$data['text_map_overall'] = $this->language->get('text_map_overall');
		$data['text_map_individual'] = $this->language->get('text_map_individual');
		$data['text_total_countries'] = $this->language->get('text_total_countries');
		$data['text_total_regions'] = $this->language->get('text_total_regions');
		$data['text_total_cities'] = $this->language->get('text_total_cities');
		$data['text_total_pvzs'] = $this->language->get('text_total_pvzs');
		$data['text_total_postamats'] = $this->language->get('text_total_postamats');
		$data['text_select_country'] = $this->language->get('text_select_country');
		$data['text_select_region'] = $this->language->get('text_select_region');
		$data['text_select_city'] = $this->language->get('text_select_city');
		$data['text_no_data'] = $this->language->get('text_no_data');
		$data['text_notify_0'] = $this->language->get('text_notify_0');
		$data['text_notify_2'] = $this->language->get('text_notify_2');
		$data['text_region_shipping'] = $this->language->get('text_region_shipping');
		$data['text_region_opencart'] = $this->language->get('text_region_opencart');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_product'] = $this->language->get('text_product');
		$data['text_shipping'] = $this->language->get('text_shipping');
		$data['text_from'] = $this->language->get('text_from');
		$data['text_to'] = $this->language->get('text_to');
		$data['text_only_from'] = $this->language->get('text_only_from');
		$data['text_only_exclude'] = $this->language->get('text_only_exclude');
		$data['text_percent_order'] = $this->language->get('text_percent_order');
		$data['text_percent_product'] = $this->language->get('text_percent_product');
		$data['text_percent_shipping'] = $this->language->get('text_percent_shipping');
		$data['text_dostavka'] = $this->language->get('text_dostavka');
		$data['text_total'] = $this->language->get('text_total');
		$data['column_variant'] = $this->language->get('column_variant');
		$data['column_weight'] = $this->language->get('column_weight');
		$data['column_cost_order'] = $this->language->get('column_cost_order');
		$data['column_cost'] = $this->language->get('column_cost');
		$data['column_customer'] = $this->language->get('column_customer');
		$data['column_geo_zone'] = $this->language->get('column_geo_zone');
		$data['column_city'] = $this->language->get('column_city');
		$data['column_mod'] = $this->language->get('column_mod');
		$data['column_position'] = $this->language->get('column_position');
		$data['entry_api_login'] = $this->language->get('entry_api_login');
		$data['entry_api_key'] = $this->language->get('entry_api_key');
		$data['entry_test'] = $this->language->get('entry_test');
		$data['entry_currency'] = $this->language->get('entry_currency');
		$data['entry_round'] = $this->language->get('entry_round');
		$data['entry_weight_limit'] = $this->language->get('entry_weight_limit');
		$data['entry_daymodifier'] = $this->language->get('entry_daymodifier');
		$data['entry_service'] = $this->language->get('entry_service');
		$data['entry_cache'] = $this->language->get('entry_cache');
		$data['entry_timeout'] = $this->language->get('entry_timeout');
		$data['entry_logging'] = $this->language->get('entry_logging');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_notify'] = $this->language->get('entry_notify');
		$data['entry_data'] = $this->language->get('entry_data');
		$data['entry_pickup_cities'] = $this->language->get('entry_pickup_cities');
		$data['entry_consider'] = $this->language->get('entry_consider');
		$data['entry_matching'] = $this->language->get('entry_matching');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_weight_class'] = $this->language->get('entry_weight_class');
		$data['entry_length_class'] = $this->language->get('entry_length_class');
		$data['entry_default_type'] = $this->language->get('entry_default_type');
		$data['entry_default_weight'] = $this->language->get('entry_default_weight');
		$data['entry_default_dimension'] = $this->language->get('entry_default_dimension');
		$data['entry_default_length'] = $this->language->get('entry_default_length');
		$data['entry_default_width'] = $this->language->get('entry_default_width');
		$data['entry_default_height'] = $this->language->get('entry_default_height');
		$data['entry_box_weight'] = $this->language->get('entry_box_weight');
		$data['entry_box_dimension'] = $this->language->get('entry_box_dimension');
		$data['entry_calc_type'] = $this->language->get('entry_calc_type');
		$data['entry_custom_sizes'] = $this->language->get('entry_custom_sizes');
		$data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_cheep'] = $this->language->get('entry_cheep');
		$data['entry_code'] = $this->language->get('entry_code');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_add_day'] = $this->language->get('entry_add_day');
		$data['entry_list'] = $this->language->get('entry_list');
		$data['entry_admin_status'] = $this->language->get('entry_admin_status');
		$data['entry_map_key'] = $this->language->get('entry_map_key');
		$data['entry_map_type'] = $this->language->get('entry_map_type');
		$data['entry_map_controls'] = $this->language->get('entry_map_controls');
		$data['entry_map_button'] = $this->language->get('entry_map_button');
		$data['entry_cap_error'] = $this->language->get('entry_cap_error');
		$data['entry_cap_cost'] = $this->language->get('entry_cap_cost');
		$data['entry_license'] = $this->language->get('entry_license');

		if (isset($this->session->data['warning'])) {
			$data['error_warning'] = $this->session->data['warning'];

			unset($this->session->data['warning']);
		} elseif (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true),
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/shipping/' . $this->m, 'token=' . $this->session->data['token'], true),
		];

		$data['action'] = $this->url->link('extension/shipping/' . $this->m, 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=shipping', true);

		if (isset($this->request->post[$this->m . '_api_login'])) {
			$data[$this->m . '_api_login'] = $this->request->post[$this->m . '_api_login'];
		} else {
			$data[$this->m . '_api_login'] = $this->config->get($this->m . '_api_login');
		}

		if (isset($this->request->post[$this->m . '_api_key'])) {
			$data[$this->m . '_api_key'] = $this->request->post[$this->m . '_api_key'];
		} else {
			$data[$this->m . '_api_key'] = $this->config->get($this->m . '_api_key');
		}

		if (isset($this->request->post[$this->m . '_test'])) {
			$data[$this->m . '_test'] = $this->request->post[$this->m . '_test'];
		} else {
			$data[$this->m . '_test'] = $this->config->get($this->m . '_test');
		}

		if (isset($this->request->post[$this->m . '_currency'])) {
			$data[$this->m . '_currency'] = $this->request->post[$this->m . '_currency'];
		} elseif ($this->config->has($this->m . '_currency')) {
			$data[$this->m . '_currency'] = $this->config->get($this->m . '_currency');
		} else {
			$data[$this->m . '_currency'] = 'RUB';
		}

		if (isset($this->request->post[$this->m . '_round'])) {
			$data[$this->m . '_round'] = $this->request->post[$this->m . '_round'];
		} else {
			$data[$this->m . '_round'] = $this->config->get($this->m . '_round');
		}

		if (isset($this->request->post[$this->m . '_weight_limit'])) {
			$data[$this->m . '_weight_limit'] = $this->request->post[$this->m . '_weight_limit'];
		} else {
			$data[$this->m . '_weight_limit'] = $this->config->get($this->m . '_weight_limit');
		}

		if (isset($this->request->post[$this->m . '_daymodifier'])) {
			$data[$this->m . '_daymodifier'] = $this->request->post[$this->m . '_daymodifier'];
		} else {
			$data[$this->m . '_daymodifier'] = $this->config->get($this->m . '_daymodifier');
		}

		if (isset($this->request->post[$this->m . '_services'])) {
			$data[$this->m . '_services'] = $this->request->post[$this->m . '_services'];
		} elseif ($this->config->has($this->m . '_services')) {
			$data[$this->m . '_services'] = $this->config->get($this->m . '_services');
		} else {
			$data[$this->m . '_services'] = [];
		}

		if (isset($this->request->post[$this->m . '_cache'])) {
			$data[$this->m . '_cache'] = $this->request->post[$this->m . '_cache'];
		} else {
			$data[$this->m . '_cache'] = $this->config->get($this->m . '_cache');
		}

		if (isset($this->request->post[$this->m . '_timeout'])) {
			$data[$this->m . '_timeout'] = $this->request->post[$this->m . '_timeout'];
		} elseif ($this->config->has($this->m . '_timeout') && is_numeric($this->config->get($this->m . '_timeout'))) {
			$data[$this->m . '_timeout'] = $this->config->get($this->m . '_timeout');
		} else {
			$data[$this->m . '_timeout'] = 10;
		}

		if (isset($this->request->post[$this->m . '_logging'])) {
			$data[$this->m . '_logging'] = $this->request->post[$this->m . '_logging'];
		} else {
			$data[$this->m . '_logging'] = $this->config->get($this->m . '_logging');
		}

		if (isset($this->request->post[$this->m . '_email'])) {
			$data[$this->m . '_email'] = $this->request->post[$this->m . '_email'];
		} else {
			$data[$this->m . '_email'] = $this->config->get($this->m . '_email');
		}

		if (isset($this->request->post[$this->m . '_notify'])) {
			$data[$this->m . '_notify'] = $this->request->post[$this->m . '_notify'];
		} elseif ($this->config->has($this->m . '_notify')) {
			$data[$this->m . '_notify'] = $this->config->get($this->m . '_notify');
		} else {
			$data[$this->m . '_notify'] = [];
		}

		if (isset($this->request->post[$this->m . '_pickup_countries'])) {
			$data[$this->m . '_pickup_countries'] = $this->request->post[$this->m . '_pickup_countries'];
		} elseif ($this->config->has($this->m . '_pickup_countries')) {
			$data[$this->m . '_pickup_countries'] = $this->config->get($this->m . '_pickup_countries');
		} else {
			$data[$this->m . '_pickup_countries'] = [];
		}

		if (isset($this->request->post[$this->m . '_pickup_regions'])) {
			$data[$this->m . '_pickup_regions'] = $this->request->post[$this->m . '_pickup_regions'];
		} elseif ($this->config->has($this->m . '_pickup_regions')) {
			$data[$this->m . '_pickup_regions'] = $this->config->get($this->m . '_pickup_regions');
		} else {
			$data[$this->m . '_pickup_regions'] = [];
		}

		if (isset($this->request->post[$this->m . '_pickup_cities'])) {
			$data[$this->m . '_pickup_cities'] = $this->request->post[$this->m . '_pickup_cities'];
		} elseif ($this->config->has($this->m . '_pickup_cities')) {
			$data[$this->m . '_pickup_cities'] = $this->config->get($this->m . '_pickup_cities');
		} else {
			$data[$this->m . '_pickup_cities'] = [];
		}

		if (isset($this->request->post[$this->m . '_consider'])) {
			$data[$this->m . '_consider'] = $this->request->post[$this->m . '_consider'];
		} else {
			$data[$this->m . '_consider'] = $this->config->get($this->m . '_consider');
		}

		if (isset($this->request->post[$this->m . '_title'])) {
			$data[$this->m . '_title'] = $this->request->post[$this->m . '_title'];
		} elseif ($this->config->has($this->m . '_title')) {
			$data[$this->m . '_title'] = $this->config->get($this->m . '_title');
		} else {
			$data[$this->m . '_title'] = 'СДЭК';
		}

		if (isset($this->request->post[$this->m . '_sort_order'])) {
			$data[$this->m . '_sort_order'] = $this->request->post[$this->m . '_sort_order'];
		} else {
			$data[$this->m . '_sort_order'] = $this->config->get($this->m . '_sort_order');
		}

		if (isset($this->request->post[$this->m . '_weight_class_id'])) {
			$data[$this->m . '_weight_class_id'] = $this->request->post[$this->m . '_weight_class_id'];
		} else {
			$data[$this->m . '_weight_class_id'] = $this->config->get($this->m . '_weight_class_id');
		}

		if (isset($this->request->post[$this->m . '_length_class_id'])) {
			$data[$this->m . '_length_class_id'] = $this->request->post[$this->m . '_length_class_id'];
		} else {
			$data[$this->m . '_length_class_id'] = $this->config->get($this->m . '_length_class_id');
		}

		if (isset($this->request->post[$this->m . '_default_type'])) {
			$data[$this->m . '_default_type'] = $this->request->post[$this->m . '_default_type'];
		} else {
			$data[$this->m . '_default_type'] = $this->config->get($this->m . '_default_type');
		}

		if (isset($this->request->post[$this->m . '_default_weight'])) {
			$data[$this->m . '_default_weight'] = $this->request->post[$this->m . '_default_weight'];
		} elseif ($this->config->has($this->m . '_default_weight')) {
			$data[$this->m . '_default_weight'] = $this->config->get($this->m . '_default_weight');
		} else {
			$data[$this->m . '_default_weight'] = 1;
		}

		if (isset($this->request->post[$this->m . '_default_length'])) {
			$data[$this->m . '_default_length'] = $this->request->post[$this->m . '_default_length'];
		} elseif ($this->config->has($this->m . '_default_length')) {
			$data[$this->m . '_default_length'] = $this->config->get($this->m . '_default_length');
		} else {
			$data[$this->m . '_default_length'] = 10;
		}

		if (isset($this->request->post[$this->m . '_default_width'])) {
			$data[$this->m . '_default_width'] = $this->request->post[$this->m . '_default_width'];
		} elseif ($this->config->has($this->m . '_default_width')) {
			$data[$this->m . '_default_width'] = $this->config->get($this->m . '_default_width');
		} else {
			$data[$this->m . '_default_width'] = 10;
		}

		if (isset($this->request->post[$this->m . '_default_height'])) {
			$data[$this->m . '_default_height'] = $this->request->post[$this->m . '_default_height'];
		} elseif ($this->config->has($this->m . '_default_height')) {
			$data[$this->m . '_default_height'] = $this->config->get($this->m . '_default_height');
		} else {
			$data[$this->m . '_default_height'] = 10;
		}

		if (isset($this->request->post[$this->m . '_box_weight'])) {
			$data[$this->m . '_box_weight'] = $this->request->post[$this->m . '_box_weight'];
		} else {
			$data[$this->m . '_box_weight'] = $this->config->get($this->m . '_box_weight');
		}

		if (isset($this->request->post[$this->m . '_box_length'])) {
			$data[$this->m . '_box_length'] = $this->request->post[$this->m . '_box_length'];
		} else {
			$data[$this->m . '_box_length'] = $this->config->get($this->m . '_box_length');
		}

		if (isset($this->request->post[$this->m . '_box_width'])) {
			$data[$this->m . '_box_width'] = $this->request->post[$this->m . '_box_width'];
		} else {
			$data[$this->m . '_box_width'] = $this->config->get($this->m . '_box_width');
		}

		if (isset($this->request->post[$this->m . '_box_height'])) {
			$data[$this->m . '_box_height'] = $this->request->post[$this->m . '_box_height'];
		} else {
			$data[$this->m . '_box_height'] = $this->config->get($this->m . '_box_height');
		}

		if (isset($this->request->post[$this->m . '_calc_type'])) {
			$data[$this->m . '_calc_type'] = $this->request->post[$this->m . '_calc_type'];
		} else {
			$data[$this->m . '_calc_type'] =$this->config->get($this->m . '_calc_type');
		}

		if (isset($this->request->post[$this->m . '_custom_sizes'])) {
			$data[$this->m . '_custom_sizes'] = $this->request->post[$this->m . '_custom_sizes'];
		} else {
			$data[$this->m . '_custom_sizes'] = $this->config->get($this->m . '_custom_sizes');
		}

		if (isset($this->request->post[$this->m . '_tax_class_id'])) {
			$data[$this->m . '_tax_class_id'] = $this->request->post[$this->m . '_tax_class_id'];
		} else {
			$data[$this->m . '_tax_class_id'] = $this->config->get($this->m . '_tax_class_id');
		}

		if (isset($this->request->post[$this->m . '_status'])) {
			$data[$this->m . '_status'] = $this->request->post[$this->m . '_status'];
		} else {
			$data[$this->m . '_status'] = $this->config->get($this->m . '_status');
		}

		if (isset($this->request->post[$this->m . '_cheep'])) {
			$data[$this->m . '_cheep'] = $this->request->post[$this->m . '_cheep'];
		} else {
			$data[$this->m . '_cheep'] = $this->config->get($this->m . '_cheep');
		}

		foreach ($this->variants as $key => $variant) {
			if (isset($this->request->post[$this->m . '_quote_title_' . $variant['code']])) {
				$data[$this->m . '_quote_title_' . $variant['code']] = $this->request->post[$this->m . '_quote_title_' . $variant['code']];
			} elseif ($this->config->has($this->m . '_quote_title_' . $variant['code'])) {
				$data[$this->m . '_quote_title_' . $variant['code']] = $this->config->get($this->m . '_quote_title_' . $variant['code']);
			} else {
				if (in_array($variant['code'], $this->variants_postamat)) {
					$data[$this->m . '_quote_title_' . $variant['code']] = '{{logo}} Самовывоз из постамата: {{address}} ({{days}})';
				} elseif (in_array($variant['code'], $this->variants_map)) {
					$data[$this->m . '_quote_title_' . $variant['code']] = '{{logo}} Самовывоз из ПВЗ: {{address}} ({{days}})';
				} else {
					$data[$this->m . '_quote_title_' . $variant['code']] = '{{logo}} Доставка курьером в {{to_city}} ({{days}})';
				}
			}

			if (isset($this->request->post[$this->m . '_quote_description_' . $variant['code']])) {
				$data[$this->m . '_quote_description_' . $variant['code']] = $this->request->post[$this->m . '_quote_description_' . $variant['code']];
			} elseif ($this->config->has($this->m . '_quote_description_' . $variant['code'])) {
				$data[$this->m . '_quote_description_' . $variant['code']] = $this->config->get($this->m . '_quote_description_' . $variant['code']);
			} else {
				$data[$this->m . '_quote_description_' . $variant['code']] = '';
			}

			if (isset($this->request->post[$this->m . '_add_day_' . $variant['code']])) {
				$data[$this->m . '_add_day_' . $variant['code']] = $this->request->post[$this->m . '_add_day_' . $variant['code']];
			} else {
				$data[$this->m . '_add_day_' . $variant['code']] = $this->config->get($this->m . '_add_day_' . $variant['code']);
			}

			if (isset($this->request->post[$this->m . '_sort_order_' . $variant['code']])) {
				$data[$this->m . '_sort_order_' . $variant['code']] = $this->request->post[$this->m . '_sort_order_' . $variant['code']];
			} else {
				$data[$this->m . '_sort_order_' . $variant['code']] = $this->config->get($this->m . '_sort_order_' . $variant['code']);
			}

			if (isset($this->request->post[$this->m . '_list_' . $variant['code']])) {
				$data[$this->m . '_list_' . $variant['code']] = $this->request->post[$this->m . '_list_' . $variant['code']];
			} else {
				$data[$this->m . '_list_' . $variant['code']] = $this->config->get($this->m . '_list_' . $variant['code']);
			}

			if (isset($this->request->post[$this->m . '_status_' . $variant['code']])) {
				$data[$this->m . '_status_' . $variant['code']] = $this->request->post[$this->m . '_status_' . $variant['code']];
			} else {
				$data[$this->m . '_status_' . $variant['code']] = $this->config->get($this->m . '_status_' . $variant['code']);
			}
		}

		if (isset($this->request->post[$this->m . '_admin_status'])) {
			$data[$this->m . '_admin_status'] = $this->request->post[$this->m . '_admin_status'];
		} elseif ($this->config->has($this->m . '_admin_status')) {
			$data[$this->m . '_admin_status'] = $this->config->get($this->m . '_admin_status');
		} else {
			foreach ($this->variants as $variant) {
				$data[$this->m . '_admin_status'][] = $variant['code'];
			}
		}

		if (isset($this->request->post[$this->m . '_stops'])) {
			$data[$this->m . '_stops'] = $this->request->post[$this->m . '_stops'];
		} elseif ($this->config->has($this->m . '_stops')) {
			$data[$this->m . '_stops'] = $this->config->get($this->m . '_stops');
		} else {
			$data[$this->m . '_stops'] = [];
		}

		if (isset($this->request->post[$this->m . '_costs'])) {
			$data[$this->m . '_costs'] = $this->request->post[$this->m . '_costs'];
		} elseif ($this->config->has($this->m . '_costs')) {
			$data[$this->m . '_costs'] = $this->config->get($this->m . '_costs');
		} else {
			$data[$this->m . '_costs'] = [];
		}

		if (isset($this->request->post[$this->m . '_map_key'])) {
			$data[$this->m . '_map_key'] = $this->request->post[$this->m . '_map_key'];
		} else {
			$data[$this->m . '_map_key'] = $this->config->get($this->m . '_map_key');
		}

		if (isset($this->request->post[$this->m . '_map_status'])) {
			$data[$this->m . '_map_status'] = $this->request->post[$this->m . '_map_status'];
		} else {
			$data[$this->m . '_map_status'] = $this->config->get($this->m . '_map_status');
		}

		if (isset($this->request->post[$this->m . '_map_type'])) {
			$data[$this->m . '_map_type'] = $this->request->post[$this->m . '_map_type'];
		} else {
			$data[$this->m . '_map_type'] = $this->config->get($this->m . '_map_type');
		}

		foreach ($this->controls as $control) {
			$data['map_controls'][] = [
				'code' => $control,
				'name' => $this->language->get('text_' . $control),
			];
		}

		if (isset($this->request->post[$this->m . '_map_control'])) {
			$data[$this->m . '_map_control'] = $this->request->post[$this->m . '_map_control'];
		} elseif ($this->config->has($this->m . '_map_control')) {
			$data[$this->m . '_map_control'] = $this->config->get($this->m . '_map_control');
		} else {
			$data[$this->m . '_map_control'] = [];
		}

		if (isset($this->request->post[$this->m . '_map_button'])) {
			$data[$this->m . '_map_button'] = $this->request->post[$this->m . '_map_button'];
		} elseif ($this->config->has($this->m . '_map_button')) {
			$data[$this->m . '_map_button'] = $this->config->get($this->m . '_map_button');
		} else {
			$data[$this->m . '_map_button'] = 'Изменить пункт выдачи';
		}

		if (isset($this->request->post[$this->m . '_cap_status'])) {
			$data[$this->m . '_cap_status'] = $this->request->post[$this->m . '_cap_status'];
		} else {
			$data[$this->m . '_cap_status'] = $this->config->get($this->m . '_cap_status');
		}

		if (isset($this->request->post[$this->m . '_cap_error'])) {
			$data[$this->m . '_cap_error'] = $this->request->post[$this->m . '_cap_error'];
		} else {
			$data[$this->m . '_cap_error'] = $this->config->get($this->m . '_cap_error');
		}

		if (isset($this->request->post[$this->m . '_cap_title'])) {
			$data[$this->m . '_cap_title'] = $this->request->post[$this->m . '_cap_title'];
		} elseif ($this->config->has($this->m . '_cap_title')) {
			$data[$this->m . '_cap_title'] = $this->config->get($this->m . '_cap_title');
		} else {
			$data[$this->m . '_cap_title'] = '{{logo}} Укажите город для расчета доставки';
		}

		if (isset($this->request->post[$this->m . '_cap_cost'])) {
			$data[$this->m . '_cap_cost'] = $this->request->post[$this->m . '_cap_cost'];
		} else {
			$data[$this->m . '_cap_cost'] = $this->config->get($this->m . '_cap_cost');
		}

		if (isset($this->request->post[$this->m . '_license'])) {
			$data[$this->m . '_license'] = $this->request->post[$this->m . '_license'];
		} else {
			$data[$this->m . '_license'] = $this->config->get($this->m . '_license');
		}

		$data['total_countries'] = $this->{'model_extension_shipping_' . $this->m}->getTotalCountries();
		$data['total_regions'] = $this->{'model_extension_shipping_' . $this->m}->getTotalRegions();
		$data['total_cities'] = $this->{'model_extension_shipping_' . $this->m}->getTotalCities();
		$data['total_pvzs'] = $this->{'model_extension_shipping_' . $this->m}->getTotalPvzs();
		$data['total_postamats'] = $this->{'model_extension_shipping_' . $this->m}->getTotalPostamats();
		$data['countries'] = $this->{'model_extension_shipping_' . $this->m}->getCountries();
		$data['currencies'] = $this->model_localisation_currency->getCurrencies();
		$data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();
		$data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();
		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
		$data['services'] = $this->services;
		$data['variants'] = $this->variants;
		$data['variants_map'] = $this->variants_map;
		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		$data['m'] = $this->m;
		$data['version'] = $this->version;
		$data['email'] = $this->email;
		$data['site'] = $this->site;
		$data['module_docs'] = $this->module_docs;
		$data['delivery'] = $this->delivery;
		$data['api_docs'] = $this->api_docs;
		$data['token'] = $this->session->data['token'];
		$data['host'] = isset($this->request->server['HTTP_HOST']) ? $this->request->server['HTTP_HOST'] : '';

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/shipping/' . $this->m, $data));
	}

	public function getRegions() {
		if ($this->validate() && isset($this->request->get['country_id']) && $this->request->get['country_id'] > 0) {
			$this->load->model('extension/shipping/' . $this->m);

			$json = $this->{'model_extension_shipping_' . $this->m}->getRegions($this->request->get['country_id']);

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}

	public function getCities() {
		if ($this->validate() && isset($this->request->get['region_id']) && $this->request->get['region_id'] > 0) {
			$this->load->model('extension/shipping/' . $this->m);

			$json = $this->{'model_extension_shipping_' . $this->m}->getCities($this->request->get['region_id']);

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}

	public function updateData() {
		if ($this->validate() && isset($this->request->post['current']) && isset($this->request->post['type'])) {
			$this->load->language('extension/shipping/' . $this->m);
			$this->load->model('extension/shipping/' . $this->m);

			if ($this->request->post['type'] > 0) {
				$pvzs = $this->{'model_extension_shipping_' . $this->m}->getApiPvzs();

				$total = count($pvzs);
				$current = (int)$this->request->post['current'];
				$next = $current + 100;

				if ($current > $total) {
					$json['finish'] = sprintf($this->language->get('text_success_update_pvz'), $total, $total);
					$json['type'] = 1;
				} elseif ($total > 0) {
					foreach ($pvzs as $key => $pvz) {
						if ($key >= $current && $key < $next) {
							$this->{'model_extension_shipping_' . $this->m}->updatePvz($pvz);
						}
					}

					$json['success'] = sprintf($this->language->get('text_success_updating_pvz'), $next, $total);
					$json['current'] = $next;
					$json['total'] = $total;
					$json['type'] = 1;
				} else {
					$json['error'] = $this->language->get('error_update_empty');
				}
			} else {
				if ($this->request->post['current'] == 1) {
					$this->{'model_extension_shipping_' . $this->m}->clearPvz();
				}

				$total = $this->{'model_extension_shipping_' . $this->m}->getTotalCountries();
				$current = (int)$this->request->post['current'];
				$next = $current + 1;

				if ($current >= $total) {
					$json['finish'] = sprintf($this->language->get('text_success_update'), $total, $total);
					$json['type'] = 0;
				} elseif ($total > 0) {
					$country = $this->{'model_extension_shipping_' . $this->m}->getCountry($next);
					$id = $country['id'];
					$name = $country['CountryName'];
					$file = DIR_SYSTEM . 'library/ll/cdek/data/' . $id . '.json';

					if (is_file($file)) {
						$data = json_decode(file_get_contents($file), true);

						if (!empty($data)) {
							foreach ($data as $item) {
								$this->{'model_extension_shipping_' . $this->m}->updateCity($item, $id);
							}
						}

						$json['success'] = sprintf($this->language->get('text_success_updating'), $next, $total, $name);
						$json['current'] = $next;
						$json['total'] = $total;
						$json['type'] = 0;
					} else {
						$json['error'] = sprintf($this->language->get('error_update_nothing'), $name);
					}
				} else {
					$json['error'] = $this->language->get('error_update_table');
				}
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}

	public function getRegionsTable() {
		if ($this->validate() && isset($this->request->get['country_id']) && $this->request->get['country_id'] > 0) {
			$this->load->model('extension/shipping/' . $this->m);
			$this->load->model('localisation/zone');

			$json['regions'] = $this->{'model_extension_shipping_' . $this->m}->getRegionsToZones($this->request->get['country_id']);
			$country = $this->{'model_extension_shipping_' . $this->m}->getCountry($this->request->get['country_id']);
			$json['zones'] = $this->model_localisation_zone->getZonesByCountryId($country['country_id']);

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}

	public function updateRegionToZone() {
		$this->load->language('extension/shipping/' . $this->m);

		if ($this->validate() && isset($this->request->get['country_id']) && isset($this->request->get[$this->m . '_regions']) && !empty($this->request->get[$this->m . '_regions'])) {
			$this->load->model('extension/shipping/' . $this->m);

			// проставляем полученные соответствия
			foreach ($this->request->get[$this->m . '_regions'] as $region_id => $values) {
				$region_check = $this->{'model_extension_shipping_' . $this->m}->getRegionById($region_id);

				if ($region_check) {
					$this->{'model_extension_shipping_' . $this->m}->updateRegionToZone($region_id, $values);
				}
			}

			// чистим пустые соответствия
			$regions = $this->{'model_extension_shipping_' . $this->m}->getRegionsToZones($this->request->get['country_id']);

			if ($regions && !empty($regions)) {
				foreach ($regions as $region) {
					if (!array_key_exists($region['id'], $this->request->get[$this->m . '_regions'])) {
						$this->{'model_extension_shipping_' . $this->m}->clearRegionToZone($region['id']);
					}
				}
			}

			$json['success'] = $this->language->get('text_success_matching');
		} else {
			$json['error'] = $this->language->get('error_permission');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/shipping/' . $this->m)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function install() {
		$this->load->model('extension/event');
		$this->model_extension_event->addEvent($this->m . '_checkout_js', 'catalog/controller/common/header/before', 'extension/shipping/' . $this->m . '/addCheckoutJs');

		$this->load->model('extension/shipping/' . $this->m);
		$this->{'model_extension_shipping_' . $this->m}->install();
	}

	public function uninstall() {
		$this->load->model('extension/event');
		$this->model_extension_event->deleteEvent($this->m . '_checkout_js');

		$this->load->model('extension/shipping/' . $this->m);
		$this->{'model_extension_shipping_' . $this->m}->uninstall();
	}
}
