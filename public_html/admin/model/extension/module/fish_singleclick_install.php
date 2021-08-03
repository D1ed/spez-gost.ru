<?php
class ModelExtensionModulefishSingleclickInstall extends Model {
    public function createTable() {
        $sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX .
            "fish_singleclick` (`id` INT(18) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                `model` VARCHAR(128) NOT NULL,
                `price` VARCHAR(255) NOT NULL,
                `name` VARCHAR(32) NOT NULL,
                `phone` VARCHAR(255) NOT NULL,
                `email` VARCHAR(255) NOT NULL,
                `message` TEXT NOT NULL,
                `order_status_id` int(11) NOT NULL default '0',
                `date` datetime NOT NULL,
                `date_modified` datetime NOT NULL
            ) ENGINE = MYISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;";
        $query = $this->db->query($sql);
    }

    public function deleteTable() {
        $sql = "DROP TABLE IF EXISTS `" . DB_PREFIX . "fish_singleclick`;";
        $query = $this->db->query($sql);
    }
}
?>