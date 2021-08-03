<?php
namespace Iml\Helpers;

class CMSFacade
{

	private $config;

	public function __construct($config)
	{
		$this->config = $config;
	}
  // public  function __call($name, $arguments) {
  //     return call_user_func_array($name, $arguments);
  //  }



	public function get_option($name)
	{
		return $this->config->get($name);
	}


}
