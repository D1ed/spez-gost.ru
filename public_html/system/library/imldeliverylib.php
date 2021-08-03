<?php
use Iml\Helpers\CMSFacade;
use Iml\CalcDelivery\Api\ApiResponse;
use Iml\CalcDelivery\Api\ApiErrorFactory;
use Iml\CalcDelivery\Api\ApiFailure;
use Iml\CalcDelivery\FixedPricesGetter;
use Iml\CalcDelivery\DeliveryResultsСorrector;
use Iml\CalcDelivery\RoundingHandler;

use IMLSdk\IMLClient;
use IMLSdk\Factory;
use IMLSdk\Item;
use Iml\CreateOrder\ApiResponse as CreateOrderApiResponse;



class Imldeliverylib {
	
	private $config;

	public function  __construct($config) {
		$this->config = $config;
	}
	



	public function getBarcodeFilePath($barcode)
	{
		return DIR_UPLOAD . "{$barcode}.pdf";
	}


	public function correctImlOrderStatus($orderImlStatusText)
	{
		return empty($orderImlStatusText) ? 'неизвестно' : $orderImlStatusText;
	}

	public function getOrderBarcodesInPdfFormat($imlBarCode)
	{
		$imlClient = $this->getIMLClient();
		$response = $imlClient->getOrderBarcodesInPdfFormat($imlBarCode);
		if(!$response || ($response && $response->getStatusCode() != 200))
		{
			throw new \Exception("Ошибка получения данных по штрих-кодам. Возможно заказ создан в тестовом режиме", 1);
		}
		$pathFile = $this->getBarcodeFilePath($imlBarCode);
		if(file_put_contents($pathFile, $response->getContent()) === false)
		{
			throw new \Exception("Ошибка записи данных по штрих-кодам в pdf-файл. Возможно заказ создан в тестовом режиме", 1);	
		}
	}



	public function escapeJsonData($data)
	{
		$search = array("\\",  "\x00", "\n",  "\r",  "'",  '"', "\x1a");
		$replace = array("\\\\","\\0","\\n", "\\r", "\'", '\"', "\\Z");
		return str_replace($search, $replace, $data);		
	}


	public function getSdType()
	{
		switch ($this->config->get('imldelivery_deliveryInPickpointType')) {
			case 'all':
			return null;
			break;
			case 'pvz':
			return 1;
			break;
			case 'postamats':
			return 12;
			break;
		}
	}



	public function getJobInfoAr()
	{
		return 
		[ 
			'24' => [ 'form_name' => 'method_24' ,  'is_enabled' => 'imldelivery_enable_method_24', 'title' => 'imldelivery_method_24_Name', "is_courier" => true, 'fail_con_price_field' => 'imldelivery_fail_con_method_24_price', 'has_cash_service' => false],
			'24КО' => [ 'form_name' => 'method_24ko' ,  'is_enabled' => 'imldelivery_enable_method_24ko', 'title' => 'imldelivery_method_24ko_Name', "is_courier" => true, 'fail_con_price_field' => 'imldelivery_fail_con_method_24ko_price', 'has_cash_service' => true],
			'С24' => [ 'form_name' => 'method_c24' ,  'is_enabled' => 'imldelivery_enable_method_c24', 'title' => 'imldelivery_method_c24_Name', "is_courier" => false, 'fail_con_price_field' => 'imldelivery_fail_con_method_c24_price', 'has_cash_service' => false],
			'С24КО' => [ 'form_name' => 'method_c24ko' ,  'is_enabled' => 'imldelivery_enable_method_c24ko', 'title' => 'imldelivery_method_c24ko_Name', "is_courier" => false, 'fail_con_price_field' => 'imldelivery_fail_con_method_c24ko_price', 'has_cash_service' => true]
		];

	}


	public function getCMSFacade()
	{
		return new CMSFacade($this->config);
	}

	
	public function getIMLClient()
	{
		$imlClient = new IMLClient(new Factory());
		$cmsFacade = $this->getCMSFacade();	
		$login  = $cmsFacade->get_option('imldelivery_login');
		$password = $cmsFacade->get_option('imldelivery_password');
		

		if($login && $password)
		{
			$imlClient->logIn($login, $password);		
		}
		
		
		return $imlClient;
	}


	private function getPackArray4Cart($imlClient, $cmsFacade, $products, &$totalSum, &$volumeAr)
	{

		$packAr = [];
		$volumeAr = [];

			// $weightCoef = $cmsFacade->get_option('shipping_imldelivery_weight_type') == 'G' ? 0.001 : 1;		
		$totalSum = 0;

			//оценочная стоимость
		$hasValuatedAmount = $cmsFacade->get_option('imldelivery_enableValuatedAmount');

			//тип упаковки товаров по местам
		$imldelivery_packageCalcType = $cmsFacade->get_option('imldelivery_packageCalcType');
			//Увеличить вес отправления
		$plusWeightPack = $cmsFacade->get_option('imldelivery_addExtraWeightKg');			

		$mainPack = null;			

		$sumWeightKg = 0;


			// параметры по-умолчанию для  фиксированной упаковки
		$weightFixed = $cmsFacade->get_option('imldelivery_defaultWeightKg');
		$lengthFixed = $cmsFacade->get_option('imldelivery_defaultLength');
		$widthFixed = $cmsFacade->get_option('imldelivery_defaultWidth');
		$heightFixed = $cmsFacade->get_option('imldelivery_defaultHeight');						

			// параметры по-умолчанию для товара

		$defaultProductWeight = $cmsFacade->get_option('imldelivery_defaultGoodWeightKg');
		$goodLengthFixed = $cmsFacade->get_option('imldelivery_defaultGoodLength');
		$goodWidthFixed = $cmsFacade->get_option('imldelivery_defaultGoodWidth');
		$goodHeightFixed = $cmsFacade->get_option('imldelivery_defaultGoodHeight');						

		$VATRate = $cmsFacade->get_option('imldelivery_defaultVATRate');						




		foreach ($products as $product) {
			// g or kg
			$weightCoef = $product['weight_class_id'] == 2 ? 0.001 : 1;		
			// mm or cm
			$coefTypeSide =  ($this->config->get('length_class_id') == 2) ? 0.01 : 1;

				// ___p($product);
				// die();

			if($imldelivery_packageCalcType == "fix-pack")
			{
				// фиксированная упаковка - пока будет только одно место
				$totalSum += $product['quantity']*$product['price'];
				$valuatedAmount = ($hasValuatedAmount) ? $product['price'] : 0;
				// ___p($product);
				
				$productWeight = floatval($product['weight']) ? ($product['weight']/$product['quantity']) * $weightCoef : $defaultProductWeight;
				// ___p($productWeight);
				$productWeight += $plusWeightPack;


				$sumWeightKg += $productWeight;
				
				$item = new Item($product['name'] , $productWeight, $product['price'], $valuatedAmount);	
				$item->setVATRate($VATRate);
				$item->setItemQuantity($product['quantity']);
				if(!$mainPack)					
				{
					$mainPack = $imlClient->getPackageInstance();
					$mainPack->setPackageDimensions($lengthFixed, $widthFixed, $heightFixed);
					$packAr[] = $mainPack;
				}
				$mainPack->setItem($item);							

			}else
			{
				//каждый товар в своей упаковке - на одну единицу товара - одно место
				$totalSum += $product['quantity']*$product['price'];
				for($i = 1; $i <= $product['quantity']; $i++)
				{
					$valuatedAmount = ($hasValuatedAmount) ? $product['price'] : 0;
					$productWeight = ($product['weight']) ? ($product['weight']/$product['quantity']) * $weightCoef : $defaultProductWeight; 

					$productWeight += $plusWeightPack;

					$item = new Item($product['name'] , $productWeight, $product['price'], $valuatedAmount);	
					$item->setItemQuantity(1);
					$item->setVATRate($VATRate);
					$pack = $imlClient->getPackageInstance();
					$pack->setItem($item);
					
					$lengthM = floatval($product['length'])  ? $product['length'] * $coefTypeSide : $goodLengthFixed;
					$widthM = floatval($product['width'])  ?  $product['width'] * $coefTypeSide : $goodWidthFixed; 
					$heightM = floatval($product['height'])  ? $product['height'] * $coefTypeSide : $goodHeightFixed;
					
					$pack->setPackageDimensions($lengthM, $widthM, $heightM);
					$packAr[] = $pack;

					$volumeAr[] = [
						'Weight'  =>  $pack->getWeightLine(),
						'Length'  =>  $lengthM,
						'Width'  =>   $widthM,
						'Height'  =>  $heightM    
					];      							
							// $order->setPackage($pack);						
				}
			}
		}



		if($imldelivery_packageCalcType == "fix-pack")
		{
			$volumeAr[] = [
				'Weight'  =>  $mainPack->getWeightLine(),
				'Length'  =>  $lengthFixed,
				'Width'  =>   $widthFixed,
				'Height'  =>  $heightFixed    
			];    
		}  							


		return $packAr;	
	}


	// метод формирования массива грузовых мест при расчете  заказа в админке

	private function getPackArray4Order($imlClient,  $cmsFacade, $products, $totalSum, $volumeAr, $ValuatedAmount = 0, $VATRate = 0)
	{
		

		$weightCoef = $cmsFacade->get_option('imldelivery_weight_type') == 'G' ? 0.001 : 1;		
		$totalSum = 0;

		//Увеличить вес каждого товара
		$plusWeightPack = $cmsFacade->get_option('imldelivery_addExtraWeightKg');			

		// параметры по-умолчанию для товара
		$defaultProductWeight = $cmsFacade->get_option('imldelivery_defaultGoodWeightKg');



		$productItemsCount  = 0;
		$flatProducts = [];
		// ___p($products);

		foreach ($products as $product) {


			for($i = 1; $i <= $product['quantity']; $i++)
			{
				$productWeight = ($product['weight']) ? $product['weight'] * $weightCoef : $defaultProductWeight; 		
				$productWeight += $plusWeightPack;
				$item = new Item($product['name'] , $productWeight, $product['price'], 0);	
				$item->setItemQuantity(1);	
				$item->setVATRate($VATRate);
				$flatProducts[] = $item;
			}

			$productItemsCount += $product['quantity'];
		}



		// если передается оценочная стоимость  - надо распределить ее на все экземпляры товаров
		$avgProductValuatedAmount  = 0;
		if($ValuatedAmount)
		{
			$avgProductValuatedAmount = round($ValuatedAmount/count($flatProducts), 2);
		}


		if($avgProductValuatedAmount)
		{
			foreach ($flatProducts as $product) {
				$product->setStatisticalValueLine($avgProductValuatedAmount);
			}
		}



// ___p($flatProducts);


		$lastVolumeExtraGoods = $productItemsCount % count($volumeAr); //в последнем грузовом месте дополнительно к среднему количеству товаров
		$avgProductsInVolume = floor($productItemsCount/count($volumeAr)); //среднее количество товаров в грузовом месте

// ___p([$lastVolumeExtraGoods, $avgProductsInVolume, $volumeAr]);

		$volumeCounter = 0;
		$packAr = [];
		// распределим товары по грузовым местам максимально равномерно (специально для iml-sdk-php)
		foreach ($volumeAr as $volumeItem) {
			
			$pack = $imlClient->getPackageInstance();
			$pack->setPackageDimensions($volumeItem['Length'], $volumeItem['Width'], $volumeItem['Height']);
			
			
			// количество товаров в данном грузовом месте
			$lenght = ($volumeCounter == count($volumeAr)-1) ? $avgProductsInVolume+$lastVolumeExtraGoods : $avgProductsInVolume;
			
			// ___p($lenght);
			// $offset = $volumeCounter * ($avgProductsInVolume-1);
			// $offset = $offset < 0 ? 0 : $offset;
			$i = 0;
			while (count($flatProducts) && $i < $lenght) {
				$product = array_shift($flatProducts);
				$pack->setItem($product);
				$i++;
			}

			// присваивание веса месту обязательно здесь - а то суммирует вес товаров
			$pack->setWeightLine($volumeItem['Weight']);					
			$packAr[] = $pack;
			$volumeCounter++;
		}


		return $packAr;			
		
	}



	public function getOrderStatus($barcode)
	{
		$imlClient = $this->getIMLClient();
		return $imlClient->getStatusOrder($barcode);
		
	}


	public function createIMLOrder($orderId, $products, $Job, $cityFrom, $cityTo, $regionTo, $pvzPointToID, $address, $volumeAr, $ValuatedAmount, $allowedConditions, $enableFullfilment, $phone, $email, $firstname, $lastname, $DeliveryCost = null, $VATRate)
	{


		try {
			$cmsFacade = $this->getCMSFacade();	
			$imlClient = $this->getIMLClient();
			$totalSum = [];
	
			$packAr = $this->getPackArray4Order($imlClient,  $cmsFacade, $products, $totalSum, $volumeAr, $ValuatedAmount, $VATRate);
	
	
			//первый пвз в городе назначения
			$sdType = $this->getSdType();
			$deliveryPointsCollection = $imlClient->getDeliveryPointsCollection($sdType);
			$pvzPointTo = $deliveryPointsCollection->findByID($pvzPointToID);
	
	
			$courierRegionCodeTo = null;
			$regionIMLCol = $imlClient->getRegionByCityRegion($cityTo, $regionTo);
	
	
	
			if($regionIMLCol)
			{
				$regionIMLObj = $regionIMLCol->first();
				if($regionIMLObj)
				{
					$courierRegionCodeTo = $regionIMLObj->RegionIML;
				}
			}
	
			$jobInfo = $this->getJobInfo($Job);
			$order = $this->prepareIMLOrder($imlClient,  $cmsFacade, $Job, $jobInfo, $volumeAr, $packAr, $cityFrom, $courierRegionCodeTo, $pvzPointTo, $address, $allowedConditions, $enableFullfilment, $VATRate);
	
	
			if(!$order)
			{
				throw new \Exception("Ошибка формирования iml-заказа", 1);
				
			}
	
		
			// добавляем стоимость доставки
			if(!is_null($DeliveryCost))
			{
	
				$DeliveryCost = ($jobInfo['has_cash_service']) ? $DeliveryCost : 0;			
				// указываем стоимость доставки
				$order->setDeliveryCost($DeliveryCost);
			}
			
			
			
	
			
			//подробность, что источник заказа - opencart
			if(isset($packAr[0]))
			{
				$imlVersionInfoItem = new Item("opencart", 0, 0, 0, strval(VERSION), 78, 10000, 0);
				$packAr[0]->setItem($imlVersionInfoItem);	
			}
			
			$contact = $firstname." ".$lastname;
			$order->setContacts($phone, $email, $contact);
	
			$imlClient->setOrder($order);
			// $imlClient->curlDebugMode(true);
			// $order->setCustomerOrder($orderId);
			$imlResponce = $imlClient->createOrder();
			$response = $imlResponce->getContent();	
			return (new CreateOrderApiResponse(json_encode($response)))->getResult();			
		} catch (\Throwable $th) {
			___p($th->getMessage());
			throw new \Exception($th->getMessage());
		}
	}
	
	


	public function calcDelivery4Order($products, $Job, $cityFrom, $cityTo, $regionTo, $pvzPointToID, $address, $volumeAr, $ValuatedAmount, $allowedConditions, $enableFullfilment, $VATRate)
	{
		try {
			// обработка исключений в ajaxHandler			
			$cmsFacade = $this->getCMSFacade();	
			$imlClient = $this->getIMLClient();
			$totalSum = [];
	
			$packAr = $this->getPackArray4Order($imlClient,  $cmsFacade, $products, $totalSum, $volumeAr, $ValuatedAmount, $VATRate);
	
	
	
			$jobInfo = $this->getJobInfo($Job);
			$courierRegionCodeTo = null;
	
	
			if(!$jobInfo["is_courier"])
			{
				//первый пвз в городе назначения
				$sdType = $this->getSdType();
				$deliveryPointsCollection = $imlClient->getDeliveryPointsCollection($sdType);
				$pvzPointTo = $deliveryPointsCollection->findByID($pvzPointToID);
	
			}else
			{
				$regionIMLCol = $imlClient->getRegionByCityRegion($cityTo, $regionTo);
				if($regionIMLCol)
				{
					$regionIMLObj = $regionIMLCol->first();
					if($regionIMLObj)
					{
						$courierRegionCodeTo = $regionIMLObj->RegionIML;
					}
				}
				$pvzPointTo = null;
			}
	
	
			$order = $this->prepareIMLOrder($imlClient,  $cmsFacade, $Job, $jobInfo, $volumeAr, $packAr, $cityFrom, $courierRegionCodeTo, $pvzPointTo, $address, $allowedConditions, $enableFullfilment, $VATRate);
			if($order)
			{
				return $this->calcDelivery($imlClient,  $cmsFacade, $order, $jobInfo);			
			}
			return false;
		} catch (\Throwable $th) {
			___p($th->getMessage());
			throw new \Exception($th->getMessage());
		}

	}


	private function isSelectedShipingMethod($formName, $session)
	{
		// ___p($session->data);
		if(isset($session->data['shipping_method']) && isset($session->data['shipping_method']['code']))
		{
			
			return ($session->data['shipping_method']['code'] == $this->getMethodCode4Cart($formName));
		}

		return false;
	}


	public function getMethodCode4Cart($formName)
	{
		return "imldelivery.{$formName}";
	}


	public function calcDelivery4Cart($products, $Job,  $cityTo, $regionTo, $address, $session)
	{
		
		
		try 
		{
		$cmsFacade = $this->getCMSFacade();	
		$imlClient = $this->getIMLClient();
		$volumeAr = [];
		$totalSum = [];



				// ___p($imlClient);


		$jobInfo = $this->getJobInfo($Job);
		$courierRegionCodeTo = null;
		$pvzPointToID = null;
		$pvzPointTo = null;


		// услуга скрыта от отображения
		if(!$cmsFacade->get_option($jobInfo['is_enabled']))
		{
			return false;
		}


		if(!$jobInfo["is_courier"])
		{
			//первый пвз в городе назначения
			$sdType = $this->getSdType();
			$deliveryPointsCollection = $imlClient->getDeliveryPointsCollection($sdType);
			$foundedCollection = $deliveryPointsCollection->findByPlace($cityTo, $regionTo);
			// ___p($foundedCollection);
			

			$pvzPointTo = $jobInfo['has_cash_service'] ? $foundedCollection->firstC24KO() : $foundedCollection->first();

			


			if($pvzPointTo)
			{
				$pvzPointToID = $pvzPointTo->getID();
			}
		}else
		{
			$regionIMLCol = $imlClient->getRegionByCityRegion($cityTo, $regionTo);
			if($regionIMLCol)
			{
				$regionIMLObj = $regionIMLCol->first();
				if($regionIMLObj)
				{
					$courierRegionCodeTo = $regionIMLObj->RegionIML;
					$cityTo = $regionIMLObj->City;
					$regionTo = $regionIMLObj->Region;
				}
			}
		}
		



		$enableFullfilment  = $cmsFacade->get_option('imldelivery_enableFullfilment');
		$cityFrom = $cmsFacade->get_option('imldelivery_departureCity');
		$hasValuatedAmount = $cmsFacade->get_option('imldelivery_enableValuatedAmount');
		$allowedConditions = $cmsFacade->get_option('imldelivery_customservices');
		$isIncludedDeliveryCost = $cmsFacade->get_option('imldelivery_isIncludedDeliveryCost');
		$VATRate = $cmsFacade->get_option('imldelivery_defaultVATRate');		
		
		$volumeAr = [];
		$packAr = $this->getPackArray4Cart($imlClient,  $cmsFacade, $products, $totalSum, $volumeAr);		
		
		
		
		// сохраним данные о возможном заказе в сессии


// if($this->isSelectedShipingMethod($jobInfo['form_name'], $session))
		
		
			$session->data['iml-ship-order-params']['enableFullfilment'] = $enableFullfilment;

			if($courierRegionCodeTo)
			{
				$session->data['iml-ship-order-params']['courierRegionCodeTo'] = $courierRegionCodeTo;
				$session->data['iml-ship-order-params']['cityTo'] = $cityTo;
				$session->data['iml-ship-order-params']['regionTo'] = $regionTo;				
			}
			if($pvzPointToID && 
				(
				!isset($session->data['iml-ship-order-params']['pvzPointToID']) || 
				(isset($session->data['iml-ship-order-params']['pvzPointToID']) && empty($session->data['iml-ship-order-params']['pvzPointToID']))
				) 
			)
			{
				$session->data['iml-ship-order-params']['pvzPointToID'] = $pvzPointToID;	
			}
			

			$session->data['iml-ship-order-params']['cityFrom'] = $cityFrom;
			$session->data['iml-ship-order-params']['address'] = $address;
			
			$session->data['iml-ship-order-params']['Amount'] = $totalSum;
			$ValuatedAmount = ($hasValuatedAmount) ? $totalSum : 0;
			$session->data['iml-ship-order-params']['ValuatedAmount'] = $ValuatedAmount;
			$session->data['iml-ship-order-params']['volumeAr'] = $volumeAr;
			$session->data['iml-ship-order-params']['imlBarcode'] = '';
			$session->data['iml-ship-order-params']['allowedConditions'] = $allowedConditions;
			$session->data['iml-ship-order-params']['isIncludedDeliveryCost'] = $isIncludedDeliveryCost;
			$session->data['iml-ship-order-params']['VATRate'] = $VATRate;

			// ___p($session->data['iml-ship-order-params']);

		
        // если цены на доставку зафиксированы
		if($cmsFacade->get_option('imldelivery_calcType') == 'Таблица')
		{
			
			if($jobInfo["is_courier"] && $courierRegionCodeTo)
			{
				
	        	// фиксированная стоимость для курьерки
				$fixedPricesGetter = new FixedPricesGetter($cmsFacade, true, $cityFrom, $courierRegionCodeTo);
				$price = $fixedPricesGetter->getFixedResult();

				return ['name' => 'method_24', 'title' => "IML доставка курьером", 'price' => $price, 'date' => ''];        		
			}
			elseif(!$jobInfo["is_courier"] && $pvzPointTo)
			{
				// фиксированная стоимость для ПВЗ
				$fixedPricesGetter = new FixedPricesGetter($cmsFacade, false, $cityFrom, $pvzPointTo->getRegionCode());
				$price = $fixedPricesGetter->getFixedResult();
				return ['name' => "method_c24", 'title' => "IML доставка до ПВЗ", 'price' => $price, 'date' => ''];	
			}
		}else
		{						
				 // сохраняем данные для заказа IML в сессии
			$order = $this->prepareIMLOrder($imlClient,  $cmsFacade, $Job, $jobInfo, $volumeAr, $packAr, $cityFrom, $courierRegionCodeTo, $pvzPointTo, $address, $allowedConditions, $enableFullfilment, $VATRate);
			if($order)
			{
				return $this->calcDelivery($imlClient,  $cmsFacade, $order, $jobInfo);
			}
		}


		
		
		} catch (IMLSdk\ExceptionIMLClient $e) {
			
			// ошибка запроса у API
			___p($e->getMessage());

			$showIMLDelWhenFailCon = $cmsFacade->get_option('imldelivery_showIMLDelWhenFailCon');
			$deliveryDate = '';
			$deliveryCost = null;
			if($showIMLDelWhenFailCon)
			{

				$deliveryCost = $cmsFacade->get_option($jobInfo["fail_con_price_field"]);
			}

			if($deliveryCost)
			{
				return ['name' => $jobInfo['form_name'], 'title' => $jobInfo['title'], 'price' => $deliveryCost, 'date' => $deliveryDate];				
			}
		}
		catch (\Throwable $th) {
			___p($th->getMessage());
		}
	}
	
	
	private function getJobInfo($Job)
	{
		$jobs = $this->getJobInfoAr();
		
		if(!isset($jobs[$Job]))
		{
			throw new \Exception("Услуга с данным кодом не поддерживается", 1);
		}
		
		return $jobs[$Job];
	}

	

	
	private function calcDelivery($imlClient,  $cmsFacade, $order, $jobInfo)
	{

		if(!$order)
		{
			throw new \Exception("Ошибка формирования iml-заказа", 1);
			
		}
		
		
		if(! $order instanceof IMLSdk\Order)
		{
			throw new \Exception("Заказ не является экземпляром IMLSdk\Order", 1);
		}



		$conIMLtimeout = floatval($cmsFacade->get_option('imldelivery_conIMLtimeout'));


		
		try {
			$imlClient->setOrder($order);
			$imlClient->setConnectTimeout($conIMLtimeout);
			$imlResponce = $imlClient->calculate();
			$response = $imlResponce->getContent();

			// ___p($response);
			
			$apiResponse = new ApiResponse(new ApiErrorFactory(), $imlResponce->getStatusCode(), json_encode($response));
			$resultAr = $apiResponse->getCalculationResult();	


			$deliveryResultsСorrector = new DeliveryResultsСorrector($cmsFacade);
			$deliveryConditions = $deliveryResultsСorrector->correct($resultAr);

			$deliveryCost = $deliveryConditions['deliveryCost'];
			$deliveryDate = $deliveryConditions['deliveryDate'];


          		// округляем результаты в соответствии с правилами
			$roundingHandler = new RoundingHandler($cmsFacade);
			$deliveryCost = $roundingHandler->round($deliveryCost);

		} 
		catch (ApiFailure $apiFailure) {
			// ошибка разбора ответа от API
			___p($apiFailure->getErrorText());
			___p($apiFailure->getConsoleInfo());
			throw new \Exception($apiFailure->getErrorText());
		}


		if(!$deliveryCost)
		{
			throw new \Exception("Пустое значение стоимости доставки", 1);
			
		}
		

		return ['name' => $jobInfo['form_name'], 'title' => $jobInfo['title'], 'price' => $deliveryCost, 'date' => $deliveryDate];		
	}
	

	private function prepareIMLOrder($imlClient,  $cmsFacade, $Job, $jobInfo, $volumeAr, $packAr, $cityFrom, $courierRegionCodeTo, $pvzPointTo, $address, array $allowedConditions, $enableFullfilment = false,  $VATRate = 0)
	{


		if(empty($packAr))
		{
			throw new \Exception("Массив весовых мест пустой", 1);
		}

		


		if(!$courierRegionCodeTo && !$pvzPointTo)
		{
			throw new \Exception("Нет пункта назначения", 1);
			
		}


		$order = $imlClient->getOrderInstance($Job);
		$conditionCollection = $imlClient->getConditions();
		
		//исключим неподключенные условия выдачи
		foreach ($conditionCollection as $condition) {
			if(!in_array($condition->productNo, $allowedConditions))
			{
				$condition->allowed(false);
			}
		}
		//добавим условия выдачи в заказ
		$order->addConditions($conditionCollection);
		
		
		
		if($jobInfo["is_courier"])
		{

			if(!$courierRegionCodeTo)
			{
				return false;
			}

			$order->regionCodes($cityFrom, $courierRegionCodeTo);
			$order->setAddressDelivery($address);				
		}else
		{

			if(!$pvzPointTo)
			{
				return false;
			}

			$order->regionCodes($cityFrom);
			$order->setPointTo($pvzPointTo);
		}

		foreach ($packAr as $pack) {
			$order->setPackage($pack);
		}
		$isTestMode = $cmsFacade->get_option('imldelivery_testMode');

		if($isTestMode)
		{
			$order->testMode();	
		}


		if($enableFullfilment)
		{
			$order->enableFullFilment();
		}

		return $order;
	}


	public function getPvzList($cityName = null, $regionName = null, $showPostamats = NULL, $type = NULL) {
		try {
			$imlClient = $this->getIMLClient();
			$sdType = $this->getSdType();
			// ___p($sdType);
			$deliveryPointsCollection = $imlClient->getDeliveryPointsCollection($sdType);
			if($cityName && $regionName)
			{
				$foundedCollection = $deliveryPointsCollection->findByPlace($cityName, $regionName);
			}else
			{
				$foundedCollection	= $deliveryPointsCollection;
			}
			return $foundedCollection;
		} catch (\Throwable $th) {
			___p($th->getMessage());
			new \Exception($th->getMessage());
		}

	}


	public function getPvzList4Widget($controller, $withPayment = null,  $cityTo = null, $regionTo = null)
	{
		$pointList = $this->getPvzList($cityTo, $regionTo);
		$formattedList = array('type' => 'FeatureCollection', 'features' => array(), 'lists' => array('name' => 'menu', 'items' => array()));
		$arrCoords = array();
		$arrCoords['Lat'] = [];
		$arrCoords['Lon'] = [];
		$formattedList['lists']['center'] = [];
		foreach($pointList as $point) {
			if($withPayment === true && empty($point->getPaymentType()))
			{
				continue;
			}

			$key = $point->getID();
			$htmlBalloonContent = $this->getHtmlBallonContent($controller, $key, $point);
			$formattedList['features'][] = array(
				'id' 			=> 	$key,
				'geometry'		=>	array(
					'type' 			=> 		'Point',
					'coordinates'	=>		array($point->getLatitude(), $point->getLongitude())
				),
				'properties'		=> 	array(
					'balloonContent'		=>	$htmlBalloonContent,
					'hintContent'			=>	$point->getAddress()
				)
			);
			$formattedList['lists']['items'][$key] = array(
				'id' => $key,
				'center' => array($point->getLatitude(), $point->getLongitude()),
				'name' => $point->getName(),
				'address' => $point->getAddress(),
				'pvzid' => $point->getSpecial_Code(),
				'worktime' => $point->getWorkMode(),
				'HowToGet' => $point->getHowToGet()
			);
			$arrCoords['Lat'][] = doubleval($point->getLatitude());
			$arrCoords['Lon'][] = doubleval($point->getLongitude());
		}

		sort($arrCoords['Lat']);
		sort($arrCoords['Lon']);
		$midArr = intval(round(count($arrCoords['Lat']) / 2, 0));
		if(count($arrCoords['Lat']) == 1) {
			$formattedList['lists']['center'] = array($arrCoords['Lat'][0], $arrCoords['Lon'][0]);
		} elseif($arrCoords['Lat'] && $arrCoords['Lon'])
		 {
			$formattedList['lists']['center'] = array($arrCoords['Lat'][$midArr], $arrCoords['Lon'][$midArr]);
		}  		
		return $formattedList;
	}


	private function getHtmlBallonContent($controller, $key, $point)
	{
		$fillColorCash = ($point->getPaymentPossible() ? '#91DC5A' : '#D80027' );
		$fillColorCard = ($point->getPaymentCard() ? '#91DC5A' : '#D80027' );
		$Name = $point->getName();
		$Address = $point->getAddress();
		$Phone  = $point->getPhone();
		$WorkMode = $point->getWorkMode();
		$Special_Code  = $point->getSpecial_Code();

		$tpl = $controller->load->view($this->config->get('config_template') . "extension/shipping/imldelivery_pickpoint", compact(
			'fillColorCash',
			'fillColorCard',
			'Name',
			'Address',
			'Phone',
			'WorkMode',
			'Special_Code',
			'key'
		));
		return $tpl;				
	}


// список условий выдачи заказа
	public function getIMLOrderStatusData()
	{
		try {
			$imlClient = $this->getIMLClient();
			$data = $imlClient->getConditions();
			return $data;
		} catch (\Throwable $th) {
			___p($th->getMessage());
			new \Exception($th->getMessage());			
		}
	}


// список вариантов с НДС
	public function getVatVariants()
	{
		try
		{
		$imlClient = $this->getIMLClient();
		$data = $imlClient->getVatVariants();
		return $data;    	
		} catch (\Throwable $th) {
			___p($th->getMessage());
			new \Exception($th->getMessage());			
		}		
	}	


// города отправления
	public function getFullRegions() {
		try {
			$cRegions = array();
			// $Regions = $this->getRegions();
			$imlClient = new IMLClient(new Factory());
			$locations = $imlClient->getLocationCollection();		
			foreach($locations as $key => $location) {
				$resRegions[$location->RegionCode] = array('name' => $location->RegionCode);
			}
			asort($resRegions);
			return $resRegions;			
		
		} catch (\Throwable $th) {
			___p($th->getMessage());
			new \Exception($th->getMessage());			
		}
	}

}
