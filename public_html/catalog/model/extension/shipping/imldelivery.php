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

class ModelExtensionShippingImldelivery extends Model {

	
	public function showCustomTpl($rdata=array()) {
		require_once(DIR_APPLICATION . "controller/extension/shipping/imldelivery.php");
		$controller = new ControllerExtensionShippingImldelivery($this->registry);
		$rdata['HTTPS_SERVER'] = HTTPS_SERVER;
		$tpl = $controller->viewCustomTpl($rdata);
		return $tpl;
	}


	private function  getQuoteMethodData($quoteData)
	{

		if(!empty($quoteData))
		{
			return array(
				'code' => 'imldelivery',
				'id' => 'imldelivery',
				'title' => $this->config->get('imldelivery_headline_cart'),
				'quote' => $quoteData,
				'sort_order' => $this->config->get('imldelivery_sort_order'),
				'error' => FALSE
			);		
		}
		
		return false;
	}
	
	
	private function getQuoteData($id, $price, $title, $text, $dateDelivery, $job)
	{
		return array(
			'code'   => "imldelivery.{$id}",
			'id' => "imldelivery.{$id}",
			'title' => $title,
			'cost' => $price,
			'tax_class_id' => 0,
			'text' => $text,
			'job' => $job,
			'date_delivery' => $dateDelivery
		);
	}	
	
	private function formatServicePrice($price)
	{
		return 'от ' . $price;
	}
	
	


	function getQuote($address) {

		if($address['country'] != "Российская Федерация")
		{
			return false;
		}	
		

		// поиск города назначения для курьерки
		$cityTo = $address['city'];
		$regionTo = $address['zone'];

		if(!$cityTo || !$regionTo)
		{
			return false;
		}



		$this->load->library('imldeliverylib');
		$imlLibrary = new Imldeliverylib($this->config);		


		$products = $this->cart->getProducts();
		$jobAr = $imlLibrary->getJobInfoAr();				
		$quoteData = [];
		$cmsFacade = $imlLibrary->getCMSFacade();
		$showDateDelivery = $cmsFacade->get_option('imldelivery_showDateDelivery');

		$pvzInfoHTML = "";
		if(isset($this->session->data['selectedPvzDescriptionHTML']))
		{
				$pvzInfoHTML = $this->session->data['selectedPvzDescriptionHTML'];
		}

		foreach ($jobAr as $jobKey => $jobInfo) {
			

			$result = $imlLibrary->calcDelivery4Cart($products, $jobKey, $cityTo, $regionTo, $address['address_1'], $this->session);
			if(!$result || !$result['price'])
			{
				continue;
			}
			$deliveryDate = $result['date'];
			
			$deliveryDate = ($showDateDelivery)  ? $deliveryDate :  '';
			
        	$deliveryDateHTML = ($deliveryDate) ? sprintf(" (%s)", $deliveryDate) : '';


        	$serviceName = $this->config->get($result['title']);
			$serviceName = ($serviceName) ? $serviceName : $result['title'];
			$serviceName = $serviceName.$deliveryDateHTML;

			$html  = sprintf('<span id="imldelivery_%s" data-id="imldelivery.%s data-price="%s" data-address="%s" data-date="%s">%s %s</span>', 
			$result['name'], 
			$result['name'], 
			$result['price'], 
			$this->session->data["shipping_address"]["address_1"], $result['date'], 
			$jobInfo['is_courier'] ? '' : 'от', 
			$result['price']);

//12
        	if(!$jobInfo['is_courier'])
        	{
				$pvzType = $jobInfo['has_cash_service'] ? 'c24ko' : 'c24';

				// если вычисление для доставки на ПВЗ с КО  - проверить выбранный ранее ПВЗ на наличие КО
				if(isset($this->session->data['iml-ship-order-params']['pvzPointToID']))
				{
					if($jobInfo['has_cash_service'])
					{
						$pvzId = $this->session->data['iml-ship-order-params']['pvzPointToID'];
						$imlClient = $imlLibrary->getIMLClient();
						$pointItem = $imlClient->getPointByID($pvzId);	
						if(!$pointItem || ($pointItem && empty($pointItem->getPaymentType())))
						{
							$pvzInfoHTML = '';	
						}
					}				
				}else
				{
					$pvzInfoHTML = '';
				}

				$html .= "&nbsp;<a class='iml-select-pvz' data-type='{$pvzType}'>выбрать ПВЗ</a>";
        		$html .= "&nbsp;<div class='imlpvz-info'>{$pvzInfoHTML}</div>";
        	}


			$quoteData[$result['name']] = 
			array(
				'code'   => $imlLibrary->getMethodCode4Cart($result['name']),
				'id' => "imldelivery.{$result['name']}",
				'title' => $serviceName,
				'cost' => $result['price'],
				'tax_class_id' => 0,
				'text' => $html,
				'job' => $jobKey,
				'date_delivery' => $result['date']
			);


			
        }

		return (count($quoteData)) ? $this->getQuoteMethodData($quoteData) : false;
    }





    public function addImlOrder($order_id) {

    	if(strpos($this->session->data["shipping_method"]['code'], "imldelivery") !== false &&
    	   isset($this->session->data['iml-ship-order-params']))
    	{

    		$data4CustomField = [];
    		$data4CustomField['shipping_method_job'] = $this->session->data["shipping_method"]['job'];
    		$data4CustomField['shipping_method_cost'] = $this->session->data["shipping_method"]['cost'];
    		$data4CustomField['shipping_method_date_delivery'] = $this->session->data["shipping_method"]['date_delivery'];
    		$data4CustomField = array_merge($data4CustomField, $this->session->data['iml-ship-order-params']);
	// ___p($data4CustomField);
    		$jsonData = json_encode($data4CustomField);
    		$countOrder = $this->db->query("SELECT COUNT(*) as cnt FROM `" . DB_PREFIX . "order` WHERE `order_id` = ".$order_id)->row;
    		if($countOrder['cnt'] == 1)
    		{
    			$sql = sprintf("update %sorder set shipping_iml_custom_field='%s' where `order_id`=%s;", DB_PREFIX, $this->db->escape($jsonData),  $order_id);	
			// ___p($sql);
    			$this->db->query($sql);
				unset($this->session->data['iml-ship-order-params']);
				unset($this->session->data['selectedPvzDescriptionHTML']);
    		}

    	}

    }




}

