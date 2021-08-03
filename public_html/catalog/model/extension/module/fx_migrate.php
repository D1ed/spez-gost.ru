<?php
class ModelExtensionModuleFXMigrate extends Model{

	public function getQuery($keyword) {
	
		$query = "SELECT query FROM " . DB_PREFIX . "url_alias WHERE `keyword` = '" . $keyword . "' LIMIT 1";
		
		if ((float)VERSION > 2.9) $query = str_replace('url_alias', 'seo_url', $query);
		
		$manufacturer = $this->db->query($query);				
		
		if (empty($manufacturer->row)) return null;
		
		//print_r($manufacturer);
		
		return $manufacturer->row['query'];
    }
}
?>