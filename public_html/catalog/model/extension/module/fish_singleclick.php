<?php
class ModelExtensionModulefishSingleclick extends Model {
    public function add($data) {
        $time = time();
        $sql = "INSERT INTO `" . DB_PREFIX . "fish_singleclick` SET email = '" . $this->db->escape($data['customer_email']) . "', name = '" . $this->db->escape($data['customer_name']) . "', phone = '" . $this->db->escape($data['customer_phone']) . "', message = '" . $this->db->escape($data['customer_message']) . "', order_status_id = '" . $this->db->escape($data['order_status_id']) . "', date = NOW(), date_modified = NOW()";
        $query = $this->db->query($sql);
    }
}
?>