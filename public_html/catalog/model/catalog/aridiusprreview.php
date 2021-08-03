<?php
class ModelCatalogAridiusPrReview extends Model {
	
	public function getLastReviews($limit) {
		
		$query = $this->db->query("SELECT r.rating, r.text, p.product_id, pd.name, p.image, r.date_added FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$limit);
		
		return $query->rows;
	}
}
