<?php
class ControllerToolRetail extends Controller {
    private $retailcrmApiClient;

    public function __construct($registry)
    {
        parent::__construct($registry);

        $this->load->library('retailcrm/retailcrm');
        $this->retailcrmApiClient = $this->retailcrm->getApiClient();
    }
    
    public function test() {
        $data = $this->retailcrmApiClient->customDictionariesList();
        
        $payments = $this->retailcrmApiClient->ordersList();

        var_dump($payments);
        //var_dump($data);

        echo 'test';
    }
}