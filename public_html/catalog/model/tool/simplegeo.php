<?php
/*
@author  Dmitriy Kubarev
@link    http://www.simpleopencart.com
@link    http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4811
*/

class ModelToolSimpleGeo extends Model {
    static $geo = false;
    static $ip_checked = false;

    const SIMPLE_GEO_OWN               = 1;
    const SIMPLE_GEO_MAXMIND_EXTENSION = 2;
    const SIMPLE_GEO_MAXMIND_TABLE     = 3;

    public function getGeoDataByIp($mode) {

        if (!ModelToolSimpleGeo::$ip_checked) {
            if ($mode == self::SIMPLE_GEO_OWN) {
                ModelToolSimpleGeo::$geo = $this->getGeoIpBySimpleOpenCart();
            } elseif ($mode == self::SIMPLE_GEO_MAXMIND_EXTENSION) {
                ModelToolSimpleGeo::$geo = $this->getGeoIpByMaxMind();
            } elseif ($mode == self::SIMPLE_GEO_MAXMIND_TABLE) {
                ModelToolSimpleGeo::$geo = $this->getGeoIpByMaxMindFromDataBase();
            } else {
                ModelToolSimpleGeo::$geo = array(
                    'country_id' => '',
                    'zone_id' => '',
                    'city' => '',
                    'postcode' => ''
                );
            }

            ModelToolSimpleGeo::$ip_checked = true;
        }

        return ModelToolSimpleGeo::$geo;
    }

    private function getGeoIpByMaxMind() {
        $ip = isset($this->request->server['HTTP_X_FORWARDED_FOR']) && $this->request->server['HTTP_X_FORWARDED_FOR'] ? $this->request->server['HTTP_X_FORWARDED_FOR'] : 0;
        $ip = $ip ? $ip : $this->request->server['REMOTE_ADDR'];

        $part = explode(".", $ip);
        $ip_int = 0;
        if (count($part) == 4) {
            $ip_int = $part[3] + 256 * ($part[2] + 256 * ($part[1] + 256 * $part[0]));
        }

        $geo = $this->cache->get('maxmind.' . $ip_int);

        if (!is_array($geo)) {

            if (function_exists('apache_note') && $code = apache_note('GEOIP_COUNTRY_CODE')) {
                if ($country_id = $this->getCountryIdbyISO($code)) {
                    $geo = array(
                        'country_id' => $country_id,
                        'zone_id'    => '',
                        'city'       => '',
                        'postcode'   => '',
                    );
                }
            } else if (function_exists('geoip_record_by_name') && $code = geoip_record_by_name($ip)) {
                if ($country_id = $this->getCountryIdbyISO($code['country_code'])) {
                    $geo = array(
                        'country_id' => $country_id,
                        'zone_id'    => '',
                        'city'       => '',
                        'postcode'   => '',
                    );
                }
            }

            if (empty($geo)) {
                $geo = array(
                    'country_id' => '',
                    'zone_id'    => '',
                    'city'       => '',
                    'postcode'   => '',
                );
            }

        }

        $this->cache->set('maxmind.' . $ip_int, $geo);

        return $geo;
    }

    private function getGeoIpByMaxMindFromDataBase() {

        $ip = isset($this->request->server['HTTP_X_FORWARDED_FOR']) && $this->request->server['HTTP_X_FORWARDED_FOR'] ? $this->request->server['HTTP_X_FORWARDED_FOR'] : 0;
        $ip = $ip ? $ip : $this->request->server['REMOTE_ADDR'];

        $part = explode(".", $ip);
        $ip_int = 0;
        if (count($part) == 4) {
            $ip_int = $part[3] + 256 * ($part[2] + 256 * ($part[1] + 256 * $part[0]));
        }

        $geo = $this->cache->get('maxmind.' . $ip_int);

        if (!is_array($geo)) {
            $query = $this->db->query("SELECT m.iso_code_2, c.country_id FROM maxmind_geo_country m LEFT JOIN " . DB_PREFIX . "country c ON m.iso_code_2 = c.iso_code_2 AND c.status = 1 WHERE start <= '" . $ip_int . "' AND end >= '" . $ip_int . "'");

            if ($query->row) {
                $geo = array(
                    'country_id' => $query->row['country_id'],
                    'zone_id'    => '',
                    'city'       => '',
                    'postcode'   => '',
                );
            }

            if (empty($geo)) {
                $geo = array(
                    'country_id' => '',
                    'zone_id'    => '',
                    'city'       => '',
                    'postcode'   => '',
                );
            }
        }

        $this->cache->set('maxmind.' . $ip_int, $geo);

        return $geo;
    }

    private function getCountryIdByISO($iso) {

        if (!is_string($iso) && strlen($iso) != 2) {
            return false;
        }

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE iso_code_2 = '" . $iso . "' AND status = '1'");

        if ($query->row) {
            return $query->row['country_id'];
        } else {
            return false;
        }
    }

    private function getGeoIpBySimpleOpenCart() {
        $geo_tables = $this->cache->get('geo_tables');

        if ($geo_tables == 'no') {
            return false;
        }

        if (!$geo_tables) {
            $query = $this->db->query("SHOW TABLES LIKE 'simple_geo_ip'");

            if (!$query->rows) {
                $this->cache->set('geo_tables', 'no');
                return false;
            }

            $query = $this->db->query("SHOW TABLES LIKE 'simple_geo'");

            if (!$query->rows) {
                $this->cache->set('geo_tables', 'no');
                return false;
            }

            $this->cache->set('geo_tables', 'yes');
        }

        $ip = isset($this->request->server['HTTP_X_FORWARDED_FOR']) && $this->request->server['HTTP_X_FORWARDED_FOR'] ? $this->request->server['HTTP_X_FORWARDED_FOR'] : 0;
        $ip = $ip ? $ip : $this->request->server['REMOTE_ADDR'];

        /*$ip = explode(',', $ip);
        $ip = trim($ip[0]);*/

        $part = explode(".", $ip);
        if (count($part) == 4) {
            $ip = $part[3] + 256 * ($part[2] + 256 * ($part[1] + 256 * $part[0]));
        }

        $geo = $this->cache->get('geo.' . $ip);

        if (!is_array($geo)) {

            $query = $this->db->query("SELECT geo_id FROM simple_geo_ip WHERE start <= '" . $ip . "' AND end >= '" . $ip . "'");

            $geo_id = 0;
            if ($query->num_rows) {
                $geo_id = $query->row['geo_id'];
            }

            if ($geo_id) {
                $query = $this->db->query("SELECT * FROM simple_geo WHERE id = '" . (int)$geo_id . "'");

                if ($query->num_rows) {
                    $geo_data = $query->row;

                    $this->load->model('localisation/zone');
                    $this->load->model('localisation/country');

                    $geo_links = $this->config->get('simple_geo_links');

                    $zone_id = $geo_data['zone_id'];

                    if (!empty($geo_links) && !empty($geo_links[$geo_data['zone_id']])) {
                        $zone_id = $geo_links[$geo_data['zone_id']];
                    }

                    $zone = $this->model_localisation_zone->getZone($zone_id);

                    $geo = array(
                        'country_id' => $zone ? $zone['country_id'] : '',
                        'zone_id'    => $zone_id,
                        'city'       => $geo_data['name'],
                        'postcode'   => $geo_data['postcode']
                    );
                }
            }

            if (empty($geo)) {
                $geo = array(
                    'country_id' => '',
                    'zone_id'    => '',
                    'city'       => '',
                    'postcode'   => '',
                );
            }
        }

        $this->cache->set('geo.' . $ip, $geo);

        return $geo;
    }

public function getGeoList($city) {
$city = trim($city);

$key = md5($city);

$geo_data = $this->cache->get('geo.' . $key);

if (!$geo_data) {
$this->load->model('extension/shipping/ll_cdek');

$geo_data = $this->model_extension_shipping_ll_cdek->getCities($city);

if (empty($geo_data)) {
$geo_data[] = array(
'id' => 0,
'city' => '',
'zone_id' => 0,
'country_id' => 0,
'postcode' => '',
'full' => '???????????????????? ???? ??????????????. ?????????????????? ??????????????????.'
);
}

$this->cache->set('geo.' . $key, $geo_data);
}

return $geo_data;
}
}
?>