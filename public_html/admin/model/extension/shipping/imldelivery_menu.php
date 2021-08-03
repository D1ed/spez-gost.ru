<?php


class ModelExtensionShippingImldeliveryMenu extends Model {

	private function getFilterCondition($filter = NULL, $value = NULL)
	{
			if(!is_null($filter) && !is_null($value)) {
				switch($filter) {
					case 'order_id':
						return " AND order_id = " . intval($value);
					break;
					case 'order_iml_status_name':
						return " AND IFNULL(o.order_iml_status_name, 'неизвестно') LIKE '%".$value."%'";
					break;	
					case 'iml_order_fio':
						return " AND CONCAT( firstname, ' ' , lastname ) LIKE '%" . $value . "%'";
					break;
				}
			}
			return '';
	}


	private function  getSortCondition($sort = NULL, $order = NULL)
	{
			if(!is_null($sort) && !is_null($order)) {
				$order_by = '';
				switch($sort) {
					case 'order_id':
						$order_by = 'order_id';
					break;
					case 'shipping_firstname':
						$order_by = "concat(firstname, ' ', lastname)";
					break;
					case 'date_create':
						$order_by = 'date_added';
					break;
					case 'date_modified':
						$order_by = 'date_modified';
					break;
					case 'order_iml_status_name':
						$order_by = 'order_iml_status_name';
					break;
					case 'order_status_name':
						$order_by = 'order_status_name';
					break;
				}
				return " ORDER BY ".$order_by." ".$order;
			} else {
				return " ORDER BY o.order_id DESC";
			}		
	}

	public function getOrders($id = NULL, $sort = NULL, $order = NULL, $filter = NULL, $value = NULL) 
	{
		
		$idCond = ($id) ? "AND order_id =".$id." " : "";
		$dateFormat = "%d.%m.%Y     %H:%i";
		$sql = sprintf("SELECT o.order_id, concat(o.firstname, ' ', o.lastname) as purchaser,
		DATE_FORMAT(o.date_added, '%s') as date_added,
		DATE_FORMAT(o.date_modified, '%s') as date_modified,
		 o.order_status_id,  o.language_id, o.shipping_iml_custom_field, o.telephone, o.email,o.order_iml_status_code, 
		  IFNULL(o.order_iml_status_name, 'неизвестно') AS order_iml_status_name, o.order_status_id,
		os.name as order_status_name, o.total, o.firstname, o.lastname, o.comment, o.shipping_address_1
		  FROM `%sorder` o
		  inner join `%sorder_status` os on o.order_status_id = os.order_status_id
		where shipping_iml_custom_field is not null %s %s %s;", 
		$dateFormat, $dateFormat, DB_PREFIX, DB_PREFIX, $idCond, 
		$this->getFilterCondition($filter, $value),
			$this->getSortCondition($sort, $order)
		);

		$preResult = $this->db->query($sql)->rows;
		return $preResult;
	}



	public function getOrderProducts($order_id) {
		$result = array();
		$this->load->model('sale/order');
		$orderProducts = $this->model_sale_order->getOrderProducts($order_id);
		
		if($orderProducts)
		{
			$this->load->model('catalog/product');
			foreach ($orderProducts as $orderProduct) {
				$productData = $this->model_catalog_product->getProduct($orderProduct['product_id']);		
				$result[] = array_merge($productData, $orderProduct);
			}
		}
		return $result;
	}


	public function changeOrder($order_id, $params) {
		$sqlFields = "";
		foreach($params as $key => $value) {
			$sqlFields .= $key . " = '" . $value . "', ";
		}
		$sqlFields .= "date_modified = NOW()";
		$sql = "UPDATE `" . DB_PREFIX . "order` SET " . $sqlFields . " WHERE order_id = '".$order_id."'";
		$this->db->query($sql);
		return true;
	}



	public function getNumOrderIml($id) {
		$sql = "SELECT * FROM `".DB_PREFIX."order` where shipping_iml_custom_field is not null and order_id = '".$id."'";
		$result = $this->db->query($sql);
		return $result->num_rows;
	}
	
	
	
	
	
	public function getOrder($id) {
		$this->load->model('checkout/order');
		$ret = $this->model_checkout_order->getOrder($id);
		return $ret;
	}


	public function getOrderStatusText($status, $lang) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "order_status` WHERE order_status_id = " . $status . " AND language_id = " . $lang;
		$res = $this->db->query($sql);
		return $res->row;
	}
	
}
?>