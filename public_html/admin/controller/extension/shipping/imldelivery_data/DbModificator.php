<?php 

class DbModificator
{

	private $controller;

	public function __construct($controller)
	{
		$this->controller = $controller;
	}


	private function fieldOrderExists($field)
	{

		$sql = "SHOW COLUMNS FROM `".DB_PREFIX."order` LIKE '{$field}'";
		$result = $this->controller->db->query($sql);
		// ($result instanceof stdClass)
		return $result->num_rows > 0;
		
	}



	public function install()
	{


		if(!$this->fieldOrderExists('order_iml_status_code'))
		{
			$sql = "ALTER TABLE  `".DB_PREFIX."order`  ADD  `order_iml_status_code` smallint;";
			$this->controller->db->query($sql);
		}

		
		if(!$this->fieldOrderExists('order_iml_status_name'))
		{			
			$sql = "ALTER TABLE  `".DB_PREFIX."order`  ADD  `order_iml_status_name` varchar(40);";
			$this->controller->db->query($sql);		
		}
		
		if(!$this->fieldOrderExists('shipping_iml_custom_field'))
		{					
			$sql = "ALTER TABLE  `".DB_PREFIX."order`  ADD  `shipping_iml_custom_field` VARCHAR(10000);";		
			$this->controller->db->query($sql);
		}


	}


	public function uninstall()
	{

		// if($this->fieldOrderExists('order_iml_status_code'))
		// {	
		// 	$sql = "ALTER TABLE  `".DB_PREFIX."order`  DROP COLUMN  `order_iml_status_code`;";
		// 	$this->controller->db->query($sql);
		// }
		// if($this->fieldOrderExists('order_iml_status_name'))
		// {					
		// 	$sql = "ALTER TABLE  `".DB_PREFIX."order`  DROP COLUMN  `order_iml_status_name`;";
		// 	$this->controller->db->query($sql);		
		// }
		
		
		// if($this->fieldOrderExists('shipping_iml_custom_field'))
		// {			
		// 	$sql = "ALTER TABLE  `".DB_PREFIX."order`  DROP COLUMN  `shipping_iml_custom_field`;";		
		// 	$this->controller->db->query($sql);
		// }

	}

}