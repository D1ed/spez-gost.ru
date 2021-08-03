<?php

return [
'plugin_settings' =>
[
	'imldelivery_headline_cart' => 'IML доставка',
	'imldelivery_login' => '',
	'imldelivery_password' => '',
	'imldelivery_status' => 1,
	'imldelivery_sort_order' => 1,
	'imldelivery_departureCity' => '',  
	'imldelivery_testMode' => false,
	'imldelivery_calcType' => 'Сервер IML',
	
	
	'imldelivery_defaultWeightKg' => 1,
	
	'imldelivery_defaultLength' => 10,
	'imldelivery_defaultWidth' => 10,
	'imldelivery_defaultHeight' => 10,
	'imldelivery_defaultPlacesCount' => 1, 
	'imldelivery_enableFullfilment' => false,

	'imldelivery_packageCalcType' => 'fix-pack',
	'imldelivery_defaultGoodWeightKg' => 1, 
	'imldelivery_defaultGoodLength' => 10,
	'imldelivery_defaultGoodWidth' => 10, 
	'imldelivery_defaultGoodHeight' => 10,
	'imldelivery_addExtraWeightKg' => 0,
	'imldelivery_method_24ko_Name' => 'IML доставка курьером (с наложенным платежом)', 
	'imldelivery_method_24_Name' => 'IML доставка курьером (с предоплатой)', 
	'imldelivery_method_c24ko_Name' =>  'IML доставка до ПВЗ (с наложенным платежом)', 
	'imldelivery_method_c24_Name' => 'IML доставка до ПВЗ (с предоплатой)', 
	'imldelivery_conIMLtimeout' => 20,
	'imldelivery_showIMLDelWhenFailCon' => false,
	'imldelivery_fail_con_method_24ko_price'  => 300,
	'imldelivery_fail_con_method_24_price' => 300,
	'imldelivery_fail_con_method_c24ko_price' => 300,
	'imldelivery_fail_con_method_c24_price' => 300,
	'imldelivery_enable_method_24ko' => true,
	'imldelivery_enable_method_24' => true,
	'imldelivery_enable_method_c24ko' => true,
	'imldelivery_enable_method_c24' => true,
	'imldelivery_showDateDelivery' => true,
	'imldelivery_addDeliveryDateDays' => 0,
	'imldelivery_dpExtraOper' => '+',
	'imldelivery_dpExtraNumber' => 0,
	'imldelivery_dpExtraMeasure' => 'руб',
	'imldelivery_roundingOper' => 'no',
	'imldelivery_roundingMeasure' => 'unit',
	'imldelivery_enableValuatedAmount' => true,
	'imldelivery_yandex_map' => true,
	
	'imldelivery_cdOwnRegionPrice' => 400,
	'imldelivery_cdOtherRegionPrice' => 500,
	'imldelivery_pkOwnRegionPrice' => 600,
	'imldelivery_pkOtherRegionPrice' => 700,
	'imldelivery_deliveryInPickpointType' => 'all',
	'imldelivery_yandex_map_apikey',
	'imldelivery_isIncludedDeliveryCost' => true,
	'imldelivery_defaultVATRate' => false,
	'imldelivery_customservices' => []

// 'shipping_imldelivery_static_form' => 'NO'
],
// 'request_settings' =>
// [
//   'VAT' => [
//     6 => 'Без НДС',
//     5 => '0%',
//     2 => '10%',
//     1 => '20%'
//   ],
//   'defaultVAT' => 1,
// ]

];
