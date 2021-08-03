<?php

namespace Iml\Loaders;

class RegionCityLoader extends PlacesLoader
{
  public function loadData()
  {
    $data = file_get_contents ('http://list.iml.ru/RegionCity?type=json');
    $data = json_decode($data, true);
    $data = json_encode($data, JSON_UNESCAPED_UNICODE);
    $this->dataSaver->save('RegionCity.json', $data);
  }

}
