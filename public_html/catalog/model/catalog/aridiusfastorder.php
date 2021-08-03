<?php
class ModelCatalogAridiusfastorder extends Model {

	public function addOrder($data) {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "aridiusfastorder SET contact = '" . $this->db->escape($data['contact']) . "',firstname = '" . $this->db->escape($data['firstname']) . "',quantity = '" . $this->db->escape($data['quantity']) . "',email = '" . $this->db->escape($data['email']) . "',comment = '" . $this->db->escape($data['comment']) . "',product_id = '" . (int) $data['product_id'] . "',product_option_value_id = '" . (int) $data['option_quantity'] . "',product_name = '" . $this->db->escape($data['product_name']) . "', format_option = '" . $this->db->escape($data['format_option']) . "', total = '" . (float) $data['total'] . "', date_added = NOW(), currency_id = '" . (int) $data['currency_id'] . "', currency_code = '" . $this->db->escape($data['currency_code']) . "', currency_value = '" . (float) $this->db->escape($data['currency_value']) . "'");

		$order_id = $this->db->getLastId();

		$order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "aridiusfastorder WHERE order_id = '" . (int)$order_id . "'");

		foreach ($order_product_query->rows as $order_product) {
		$this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = (quantity - " . (int)$data['quantity'] . ") WHERE product_id = '" . (int) $data['product_id'] . "' AND subtract = '1'");
			
        $order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "aridiusfastorder WHERE order_id = '" . (int)$order_id . "'");
		foreach ($order_option_query->rows as $option) {
		  foreach ($data['option_quantity'] as $option_quantity) {
		$this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET quantity = (quantity - " . (int)$data['quantity'] . ") WHERE product_option_value_id = '" . (int) $option_quantity . "' AND subtract = '1'");
			}	
          } 	
        }
		
        return $order_id;
    }
}

