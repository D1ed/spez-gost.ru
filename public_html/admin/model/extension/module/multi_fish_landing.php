<?php
class ModelExtensionModuleMultiFishLanding extends Model {
    public function setSetting() {
        $this->load->model('extension/module');

        if (isset($this->request->post['name'])) {
            $filter_data = array('name' => $this->request->post['name']);

            //Module Info
            if (!isset($this->request->get['module_id'])) {
                $this->model_extension_module->addModule('fish_singleclick', $filter_data);
                $this->request->get['module_id'] = $this->db->getLastId();
            } else {
                $this->model_extension_module->editModule($this->request->get['module_id'], $filter_data);
            }

            //SeoUrl
            $this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE query = 'landing_id=" . (int)$this->request->get['module_id'] . "'");

            if ($this->request->post['keyword']) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` SET query = 'landing_id=" . (int)$this->request->get['module_id'] . "', keyword = '" . $this->db->escape($this->request->post['keyword']) . "'");

                unset($this->request->post['keyword']);

                $this->cache->delete('seo_pro');
            }

            //Custom CSS
            if ($this->request->post['custom_css']) {
                $this->setMycustom($this->request->get['module_id'], 'css');

                unset($this->request->post['custom_css']);
            }

            //Custom JS
            if ($this->request->post['custom_js']) {
                $this->setMycustom($this->request->get['module_id'], 'js');

                unset($this->request->post['custom_js']);
            }

            //Settings
            $this->editLanding($this->request->get['module_id'], $this->request->post);
        }
    }

    public function editLanding($landing_id, $data = array()) {
        $this->install();

        $this->db->query("DELETE FROM `" . DB_PREFIX . "multi_fish_landing` WHERE landing_id = '" . (int)$landing_id . "'");

        foreach ($data as $key => $value) {
            if (!is_array($value)) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "multi_fish_landing` SET landing_id = '" . (int)$landing_id . "', `name` = '" . $this->db->escape($data['name']) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
            } else {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "multi_fish_landing` SET landing_id = '" . (int)$landing_id . "', `name` = '" . $this->db->escape($data['name']) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(json_encode($value, true)) . "', serialized = '1'");
            }
        }
    }

    public function deleteLanding($landing_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "multi_fish_landing` WHERE `landing_id` = '" . (int)$landing_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE query = 'landing_id=" . (int)$landing_id . "'");

        //Custom CSS
        $filename = sprintf('%sview/theme/default/stylesheet/fish_landing_custom_%d.css', DIR_CATALOG, $landing_id);

        if (is_file($filename)) {
            @unlink($filename);
        }

        //Custom JS
        $filename = sprintf('%sview/theme/default/javascript/fish_landing_custom_%d.js', DIR_CATALOG, $landing_id);

        if (is_file($filename)) {
            @unlink($filename);
        }

        $this->cache->delete('seo_pro');
    }

    public function getLanding($landing_id) {
        $setting_data = array();

        //$query = $this->db->query("SELECT DISTINCT *, (SELECT DISTINCT keyword FROM `" . DB_PREFIX . "url_alias` WHERE query = 'landing_id=" . (int)$landing_id . " LIMIT 1') AS keyword FROM `" . DB_PREFIX . "multi_fish_landing` WHERE landing_id = '" . (int)$landing_id . "'");
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "multi_fish_landing` WHERE landing_id = '" . (int)$landing_id . "'");

        foreach ($query->rows as $result) {
            if (!$result['serialized']) {
                $setting_data[$result['key']] = $result['value'];
            } else {
                $setting_data[$result['key']] = json_decode($result['value'], true);
            }
        }

        //SeoUrl
        $setting_data['keyword'] = $this->getKeyword('landing_id=' . (string)$landing_id);

        //Custom CSS
        $setting_data['custom_css'] = $this->getMycustom($landing_id, 'css');

        //Custom JS
        $setting_data['custom_js'] = $this->getMycustom($landing_id, 'js');

        return $setting_data;
    }

    public function getUrlAlias($keyword) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "url_alias` WHERE keyword = '" . $this->db->escape($keyword) . "' LIMIT 1");

        return $query->row;
    }

    public function getKeyword($route) {
        $query = $this->db->query("SELECT keyword FROM `" . DB_PREFIX . "url_alias` WHERE query = '" . $this->db->escape($route) . "' LIMIT 1");

        return isset($query->row['keyword']) ? $query->row['keyword'] : '';
    }


    public function exportSettings() {
        $this->load->model('extension/module');

        $landing_id = isset($this->request->get['landing_id']) ? (int)$this->request->get['landing_id'] : 0;
        $settings = array();

        $settings['setting'] = $this->getLanding($landing_id);
        if (!$settings['setting']) {
            unset($settings['setting']);
        }

        $settings['module'] = $this->model_extension_module->getModule($landing_id);
        if (!$settings['module']) {
            unset($settings['module']);
        } else {
            $settings['module']['module_id'] = $landing_id;
        }
        
        //Save settings to the file
        $this->response->addheader('Pragma: public');
        $this->response->addheader('Expires: 0');
        $this->response->addheader('Content-Description: File Transfer');
        $this->response->addheader('Content-Type: application/octet-stream');
        $this->response->addheader('Content-Disposition: attachment; filename=' . date('Y-m-d_H-i-s', time()).'_fishlanding_' . $landing_id . '.settings');
        $this->response->addheader('Content-Transfer-Encoding: binary');
        $this->response->setOutput(json_encode($settings));
    }

    public function importSettings($content) {
        if (!is_string($content)) return false;
        $content = json_decode($content, true);
        if (!isset($content['setting']) || !isset($content['module']['name'])) return false;
        
        $this->request->post = $content['setting'];

        if (isset($content['setting']['name'])) {
            $this->request->post['name'] = $content['module']['name'];
        } else {
            return false;
        }

        $this->setSetting();

        return true;
    }

    protected function setMycustom($landing_id = 0, $type = 'css') {
        if ($landing_id) {
            $type = $type == 'css' ? 'css' : 'js';
            $folder = $type == 'css' ? 'stylesheet' : 'javascript';

            $filename = sprintf('%sview/theme/default/%s/fish_landing_custom_%d.%s', DIR_CATALOG, $folder, $landing_id, $type);

            if (isset($this->request->post['custom_' . $type]) && trim($this->request->post['custom_' . $type])) {
                return $this->writeDumpFile(html_entity_decode($this->request->post['custom_' . $type], ENT_QUOTES, 'UTF-8'), $filename);
            } else {
                if (is_file($filename)) {
                    @unlink($filename);
                }
            }
        }
    }

    protected function getMycustom($landing_id = 0, $type = 'css') {
        $type = $type == 'css' ? 'css' : 'js';
        $folder = $type == 'css' ? 'stylesheet' : 'javascript';

        $filename = sprintf('%sview/theme/default/%s/fish_landing_custom_%d.%s', DIR_CATALOG, $folder, $landing_id, $type);

        if (is_file($filename)) {
            return file_get_contents($filename);
        } else {
            return '';
        }
    }

    protected function writeDumpFile($dump, $filename) {
        $result = @file_put_contents($filename, $dump);
        return $result === false;
    }
    
    public function install() {
        $sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX .
            "multi_fish_landing` (`setting_id` INT(18) NOT NULL AUTO_INCREMENT,
                `landing_id` int(11) NOT NULL,
                `name` varchar(64) NOT NULL,
                `key` varchar(64) NOT NULL,
                `value` text NOT NULL,
                `serialized` tinyint(1) NOT NULL,
                PRIMARY KEY (`setting_id`,`landing_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci";

        $query = $this->db->query($sql);
    }

    public function uninstall() {
        $this->install();

        $query = $this->db->query("SELECT landing_id FROM `" . DB_PREFIX . "multi_fish_landing` GROUP BY landing_id")->rows;
        
        foreach ($query as $value) {
            $this->deleteLanding($value['landing_id']);
        }

        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "multi_fish_landing`");
    }
}
?>