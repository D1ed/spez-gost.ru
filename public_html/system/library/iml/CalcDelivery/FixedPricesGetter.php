<?php
namespace Iml\CalcDelivery;

class FixedPricesGetter
{

  private $methodId;
  private $isCourierDelivery;

  public function __construct($cmsFacade, $isCourierDelivery, $departureCity, $arrivalCity)
  {
    $this->departureCity = $departureCity;
    $this->arrivalCity = $arrivalCity;
    $this->cmsFacade = $cmsFacade;
    $this->isCourierDelivery = $isCourierDelivery;
  }



  
  public function getFixedResult()
  {
    if($this->isCourierDelivery)
    {
      if($this->departureCity == $this->arrivalCity)
      {
        return $this->cmsFacade->get_option('imldelivery_cdOwnRegionPrice');
      }else {
        return $this->cmsFacade->get_option('imldelivery_cdOtherRegionPrice');
      }
    }else {
      if($this->departureCity == $this->arrivalCity)
      {
        return $this->cmsFacade->get_option('imldelivery_pkOwnRegionPrice');
      }else {
        return $this->cmsFacade->get_option('imldelivery_pkOtherRegionPrice');
      }
    }
  }


}
