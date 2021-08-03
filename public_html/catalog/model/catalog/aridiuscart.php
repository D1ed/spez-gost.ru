<?php

class ModelCatalogAridiusCart extends Model {
	public function getRelatedCart($product_id) {
		$product_data = array();
		$limit = $this->config->get('aurus_cart_relprlimit');

		if (isset($product_id) && (int)$product_id > 0) {
			$query = $this->db->query("SELECT * FROM ".DB_PREFIX."product_related pr LEFT JOIN ".DB_PREFIX."product p ON (pr.related_id = p.product_id) LEFT JOIN ".DB_PREFIX."product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pr.product_id = '".(int)$product_id."' AND p.status = '1' AND p.quantity  > '0' AND p.date_available <= NOW() AND p2s.store_id = '".(int)$this->config->get('config_store_id')."' LIMIT ".(int)$limit);
			foreach ($query->rows as $result) {
				$product_data[] = $result['related_id'];
			}
		}

		return $product_data;
	}
}
?>