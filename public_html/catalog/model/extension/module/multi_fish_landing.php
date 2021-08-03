<?php
class ModelExtensionModuleMultiFishLanding extends Model {
    public function getLanding($landing_id) {
        $data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "multi_fish_landing WHERE landing_id = '" . (int)$landing_id . "'");

        foreach ($query->rows as $result) {
            if (!$result['serialized']) {
                $data[$result['key']] = $result['value'];
            } else {
                $data[$result['key']] = json_decode($result['value'], true);
            }
        }

        return $data;
    }
}
?>