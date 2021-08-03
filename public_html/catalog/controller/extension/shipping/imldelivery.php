<?php class ControllerExtensionShippingImldelivery extends Controller {
	
	
	public function index() {
		$this->response->setOutput($this->load->view($this->config->get('config_template') . "extension/shipping/imldelivery", array('data1' => $d, 'list' => $list)));
		$this->viewCustomTpl();
		return true;
	}
	
	public function viewCustomTpl() {
		$tpl = $this->load->view($this->config->get('config_template') . "extension/shipping/imldelivery");
		return $tpl;
	}
	
	public function formattedPvzList() 
	{
		$this->load->library('imldeliverylib');
		$imlLibrary = new Imldeliverylib($this->config);

		$cityTo = $this->session->data['shipping_address']['city'];
		$regionTo = $this->session->data['shipping_address']['zone'];		

		if(!$cityTo || !$regionTo)
		{
			return false;
		}

		$pvzType = $this->request->post['pvzType'];
		$withPayment = ($pvzType == "c24ko");

		$formattedList = $imlLibrary->getPvzList4Widget($this, $withPayment, $cityTo, $regionTo);
		$this->response->setOutput(json_encode($formattedList, JSON_UNESCAPED_UNICODE));
	}




	
	public function selectPVZ() 
	{
//edit
			$pvzId = $this->request->post['id'];
			$this->session->data['iml-ship-order-params']['pvzPointToID'] = $pvzId;
			$this->session->data['selectedPvzDescriptionHTML'] = '';
			try{
					$this->load->library('imldeliverylib');
					$imlLibrary = new Imldeliverylib($this->config);
					$imlClient = $imlLibrary->getIMLClient();
					$pointItem = $imlClient->getPointByID($this->session->data['iml-ship-order-params']['pvzPointToID']);
					$formAddress = $pointItem->getFormAddress(['FormRegion','FormalizedLocality','FormalizedArea','FormCity']);
					$infoHtml = sprintf("<strong>%s</strong><br/><span>%s</span>", $formAddress, $pointItem->getWorkMode());
					$this->session->data['selectedPvzDescriptionHTML'] = $infoHtml;

			} catch (\Throwable $ex) 
			{
					___p($ex->getMessage());
					$this->session->data['selectedPvzDescriptionHTML'] = "";
			}

			echo json_encode(['selectedPvzDescriptionHTML' => $this->session->data['selectedPvzDescriptionHTML']],
			 JSON_UNESCAPED_UNICODE);
	}


	public function addImlOrder(&$route, &$data, &$output) {
		$order_id = $data[0];
		$this->load->model('extension/shipping/imldelivery');
		$this->model_extension_shipping_imldelivery->addImlOrder($order_id);
	}
	
}
?>
