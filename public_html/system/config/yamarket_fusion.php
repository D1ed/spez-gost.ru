<?php
$_['yamarket_fusion_module_version']		= '3.7.6';

$_['yamarket_fusion_api_offers_list_status']	= true; 

$_['yamarket_fusion_super_options']	= false; 

$_['yamarket_fusion_category_for_yml']	=  false; 

$_['yamarket_fusion_options_zero']	=  false; 

$_['yamarket_fusion_raz']	=  false; 

$_['yamarket_fusion_atribute_offer']	=  false; 

$_['yamarket_fusion_valute']	=  false; 

$_['yamarket_fusion_api_cron']	=  false; 

$_['yamarket_fusion_group_price']	= false; 

$_['yamarket_fusion_options_image']	= false; 

// удалять сохранненые данные и настройки прошлой установки/версии модуля
$_['yamarket_fusion_delete_setting_on_install'] = true;

// удалять сохранненые данные и настройки после удаления модуля
$_['yamarket_fusion_delete_setting_on_uninstall'] = false;

// удалять файлы после удаления модуля (актуально ддя версий ниже 3)
$_['yamarket_fusion_delete_files_on_uninstall'] = false;

// Название лога для ошибок
$_['yamarket_fusion_errors_filename'] = 'yamarket_fusion_error.log';

// Символ разделитель для цены в атрибутах товара
$_['yamarket_fusion_attribute_price_delimiter'] = ':';

// Поле продукта для закупочной цены
$_['yamarket_fusion_product_purchase_markup_field'] = 'jan';

// Адрес для авторизации
$_['yamarket_fusion_auth_url'] = 'https://opencartmodul.ru/index.php?route=extension/module/market_fusion_rbac';
// Использовать авторизация
$_['yamarket_fusion_use_auth'] = true;

// Special db filters
$_['yamarket_fusion_db_filter'] = array(
	'Yandex'	=> 'go1',
	'Mailru'	=> 'go2',
	'Ekatalog'	=> 'go3',
	'Google'	=> 'go4',
	'Priceru'	=> 'go5',
	'Avito'		=> 'go6',
);