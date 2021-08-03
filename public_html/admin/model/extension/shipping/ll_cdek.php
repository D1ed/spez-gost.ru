<?php
/**
 * @author    p0v1n0m <support@lutylab.ru>
 * @license   Commercial
 * @link      https://lutylab.ru
 */
class ModelExtensionShippingLLcdek extends Model {
	private $m = 'll_cdek';
	private $api_url = 'https://integration.cdek.ru/';

	public function getTotalCountries() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . $this->m . "_country`");

		return $query->row['total'];
	}

	public function getTotalRegions() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . $this->m . "_region`");

		return $query->row['total'];
	}

	public function getTotalCities() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . $this->m . "_city`");

		return $query->row['total'];
	}

	public function getTotalPvzs() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . $this->m . "_pvz` WHERE type = 'PVZ'");

		return $query->row['total'];
	}

	public function getTotalPostamats() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . $this->m . "_pvz` WHERE type = 'POSTAMAT'");

		return $query->row['total'];
	}

	public function getCountry($id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . $this->m . "_country` WHERE id = '" . (int)$id . "'");

		return $query->row;
	}

	public function getCountries() {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . $this->m . "_country`");

		return $query->rows;
	}

	public function addRegion($data, $country_id) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . $this->m . "_region` SET country_id = '" . (int)$country_id . "', OblName = '" . $this->db->escape($data['OblName']) . "', EngOblName = '" . $this->db->escape($data['EngOblName']) . "', CountryCode = '" . $this->db->escape($data['CountryCode']) . "'");

		return $this->db->getLastId();
	}

	public function getRegion($name) {
		$query = $this->db->query("SELECT id FROM `" . DB_PREFIX . $this->m . "_region` WHERE OblName = '" . $this->db->escape($name) . "'");

		return ($query->num_rows ? (int)$query->row['id'] : 0);
	}

	public function getRegionById($id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . $this->m . "_region` WHERE id = '" . (int)$id . "'");

		return $query->row;
	}

	public function getRegions($country_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . $this->m . "_region` WHERE country_id = '" . (int)$country_id . "' ORDER BY OblName ASC");

		return $query->rows;
	}

	public function getRegionsToZones($country_id) {
		$data = [];
		$query = $this->db->query("SELECT id, OblName FROM `" . DB_PREFIX . $this->m . "_region` WHERE country_id = '" . (int)$country_id . "' ORDER BY OblName ASC");

		foreach ($query->rows as $region) {
			$zones_by_region = $this->getRegionsToZonesByRegionId($region['id']);
			$zones = [];

			if (!empty($zones_by_region)) {
				foreach ($zones_by_region as $zone) {
					$zones[] = $zone['zone_id'];
				}
			}

			$data[] = [
				'id'      => $region['id'],
				'OblName' => $region['OblName'],
				'zones'   => $zones,
			];
		}

		return $data;
	}

	public function getRegionsToZonesByRegionId($region_id) {
		$query = $this->db->query("SELECT zone_id FROM `" . DB_PREFIX . $this->m . "_region_to_zone` WHERE region_id = '" . (int)$region_id . "'");

		return $query->rows;
	}

	public function updateRegionToZone($region_id, $values) {
		$this->clearRegionToZone($region_id);

		foreach ($values as $zone_id) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . $this->m . "_region_to_zone` SET region_id = '" . (int)$region_id . "', zone_id = '" . (int)$zone_id . "'");
		}
	}

	public function clearRegionToZone($region_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . $this->m . "_region_to_zone` WHERE region_id = '" . (int)$region_id . "'");
	}

	public function getCities($region_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . $this->m . "_city` WHERE region_id = '" . (int)$region_id . "' ORDER BY CityName ASC");

		return $query->rows;
	}

	public function getCity($CityCode) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . $this->m . "_city` WHERE CityCode = '" . (int)$CityCode . "'");

		return $query->row;
	}

	public function addCity($city, $region_id, $country_id) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . $this->m . "_city` SET
			CityCode = '" . (int)$city['ID'] . "',
			region_id = '" . (int)$region_id . "',
			country_id = '" . (int)$country_id . "',
			FullName = '" . $this->db->escape($city['FullName']) . "',
			CityName = '" . $this->db->escape($city['CityName']) . "',
			Center = '" . $this->db->escape($city['Center']) . "',
			NalSumLimit = '" . $this->db->escape($city['NalSumLimit']) . "',
			EngName = '" . $this->db->escape($city['EngName']) . "',
			PostCodeList = '" . $this->db->escape($city['PostCodeList']) . "',
			EngFullName = '" . $this->db->escape($city['EngFullName']) . "',
			CountryCode = '" . (int)$city['CountryCode'] . "',
			FullNameFIAS = '" . $this->db->escape(isset($city['FullNameFIAS']) ? $city['FullNameFIAS'] : '') . "',
			FIAS = '" . $this->db->escape(isset($city['FIAS']) ? $city['FIAS'] : '') . "',
			KLADR = '" . $this->db->escape(isset($city['KLADR']) ? $city['KLADR'] : '') . "',
			cityDD = '" . (int)(isset($city['cityDD']) ? $city['cityDD'] : null) . "',
			pvzCode = '" . $this->db->escape(isset($city['pvzCode']) ? $city['pvzCode'] : '') . "'");
	}

	public function updateCity($city, $country_id) {
		$region_id = $this->getRegion($city['OblName']);

		if (!$region_id) {
			$region_id = $this->addRegion($city, $country_id);
		}

		$result = $this->getCity($city['ID']);

		if (!empty($result)) {
			$this->db->query("UPDATE `" . DB_PREFIX . $this->m . "_city` SET
				FullName = '" . $this->db->escape($city['FullName']) . "',
				CityName = '" . $this->db->escape($city['CityName']) . "',
				Center = '" . $this->db->escape($city['Center']) . "',
				NalSumLimit = '" . $this->db->escape($city['NalSumLimit']) . "',
				EngName = '" . $this->db->escape($city['EngName']) . "',
				PostCodeList = '" . $this->db->escape($city['PostCodeList']) . "',
				EngFullName = '" . $this->db->escape($city['EngFullName']) . "',
				CountryCode = '" . (int)$city['CountryCode'] . "',
				FullNameFIAS = '" . $this->db->escape(isset($city['FullNameFIAS']) ? $city['FullNameFIAS'] : '') . "',
				FIAS = '" . $this->db->escape(isset($city['FIAS']) ? $city['FIAS'] : '') . "',
				KLADR = '" . $this->db->escape(isset($city['KLADR']) ? $city['KLADR'] : '') . "',
				cityDD = '" . (int)(isset($city['cityDD']) ? $city['cityDD'] : null) . "',
				pvzCode = '" . $this->db->escape(isset($city['pvzCode']) ? $city['pvzCode'] : '') . "'
				WHERE CityCode = '" . (int)$city['ID'] . "'");
		} else {
			$this->addCity($city, $region_id, $country_id);
		}
	}

	public function addPvz($pvz) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . $this->m . "_pvz` SET
			code = '" . $this->db->escape($pvz['code']) . "',
			postalCode = '" . (int)(isset($pvz['postalCode']) ? $pvz['postalCode'] : null) . "',
			cityCode = '" . (int)$pvz['cityCode'] . "',
			name = '" . $this->db->escape($pvz['name']) . "',
			workTime = '" . $this->db->escape($pvz['workTime']) . "',
			address = '" . $this->db->escape($pvz['address']) . "',
			fullAddress = '" . $this->db->escape($pvz['fullAddress']) . "',
			phone = '" . $this->db->escape($pvz['phone']) . "',
			note = '" . $this->db->escape($pvz['note']) . "',
			coordX = '" . $this->db->escape($pvz['coordX']) . "',
			coordY = '" . $this->db->escape($pvz['coordY']) . "',
			type = '" . $this->db->escape($pvz['type']) . "',
			ownerCode = '" . $this->db->escape($pvz['ownerCode']) . "',
			isDressingRoom = '" . (int)$pvz['isDressingRoom'] . "',
			haveCashless = '" . (int)$pvz['haveCashless'] . "',
			haveCash = '" . (int)$pvz['haveCash'] . "',
			allowedCod = '" . (int)$pvz['allowedCod'] . "',
			takeOnly = '" . (int)$pvz['takeOnly'] . "',
			nearestStation = '" . $this->db->escape($pvz['nearestStation']) . "',
			metroStation = '" . $this->db->escape($pvz['metroStation']) . "',
			site = '" . $this->db->escape(isset($pvz['site']) ? $pvz['site'] : null) . "',
			email = '" . $this->db->escape(isset($pvz['email']) ? $pvz['email'] : null) . "',
			addressComment = '" . $this->db->escape(isset($pvz['addressComment']) ? $pvz['addressComment'] : null) . "',
			weightMin = '" . (float)(isset($pvz['weightLimit']['weightMin']) ? $pvz['weightLimit']['weightMin'] : null) . "',
			weightMax = '" . (float)(isset($pvz['weightLimit']['weightMax']) ? $pvz['weightLimit']['weightMax'] : null) . "',
			width = '" . (float)(isset($pvz['dimensions'][0]['width']) ? $pvz['dimensions'][0]['width'] : null) . "',
			height = '" . (float)(isset($pvz['dimensions'][0]['height']) ? $pvz['dimensions'][0]['height'] : null) . "',
			depth = '" . (float)(isset($pvz['dimensions'][0]['depth']) ? $pvz['dimensions'][0]['depth'] : null) . "',
			fulfillment = '" . $this->db->escape(isset($pvz['fulfillment']) ? $pvz['fulfillment'] : null) . "',
			isHandout = '" . (int)$pvz['isHandout'] . "'
		");
	}

	public function updatePvz($pvz) {
		$result = $this->getPvz($pvz['code']);

		if (!empty($result)) {
			$this->db->query("UPDATE `" . DB_PREFIX . $this->m . "_pvz` SET
				postalCode = '" . (int)(isset($pvz['postalCode']) ? $pvz['postalCode'] : null) . "',
				cityCode = '" . (int)$pvz['cityCode'] . "',
				name = '" . $this->db->escape($pvz['name']) . "',
				workTime = '" . $this->db->escape($pvz['workTime']) . "',
				address = '" . $this->db->escape($pvz['address']) . "',
				fullAddress = '" . $this->db->escape($pvz['fullAddress']) . "',
				phone = '" . $this->db->escape($pvz['phone']) . "',
				note = '" . $this->db->escape($pvz['note']) . "',
				coordX = '" . $this->db->escape($pvz['coordX']) . "',
				coordY = '" . $this->db->escape($pvz['coordY']) . "',
				type = '" . $this->db->escape($pvz['type']) . "',
				ownerCode = '" . $this->db->escape($pvz['ownerCode']) . "',
				isDressingRoom = '" . (int)$pvz['isDressingRoom'] . "',
				haveCashless = '" . (int)$pvz['haveCashless'] . "',
				haveCash = '" . (int)$pvz['haveCash'] . "',
				allowedCod = '" . (int)$pvz['allowedCod'] . "',
				takeOnly = '" . (int)$pvz['takeOnly'] . "',
				nearestStation = '" . $this->db->escape($pvz['nearestStation']) . "',
				metroStation = '" . $this->db->escape($pvz['metroStation']) . "',
				site = '" . $this->db->escape(isset($pvz['site']) ? $pvz['site'] : null) . "',
				email = '" . $this->db->escape(isset($pvz['email']) ? $pvz['email'] : null) . "',
				addressComment = '" . $this->db->escape(isset($pvz['addressComment']) ? $pvz['addressComment'] : null) . "',
				weightMin = '" . (float)(isset($pvz['WeightLimit']['weightMin']) ? $pvz['WeightLimit']['weightMin'] : null) . "',
				weightMax = '" . (float)(isset($pvz['WeightLimit']['weightMax']) ? $pvz['WeightLimit']['weightMax'] : null) . "',
				width = '" . (float)(isset($pvz['Dimensions']['width']) ? $pvz['Dimensions']['width'] : null) . "',
				height = '" . (float)(isset($pvz['Dimensions']['height']) ? $pvz['Dimensions']['height'] : null) . "',
				depth = '" . (float)(isset($pvz['Dimensions']['depth']) ? $pvz['Dimensions']['depth'] : null) . "',
				fulfillment = '" . $this->db->escape(isset($pvz['fulfillment']) ? $pvz['fulfillment'] : null) . "',
				isHandout = '" . (int)$pvz['isHandout'] . "'
				WHERE code = '" . (int)$pvz['code'] . "'");
		} else {
			$this->addPvz($pvz);
		}
	}

	public function getPvz($code) {
		$query = $this->db->query("SELECT id FROM `" . DB_PREFIX . $this->m . "_pvz` WHERE code = '" . $this->db->escape($code) . "'");

		return $query->row;
	}

	public function getApiPvzs() {
		$data = $this->getCache('pvz');

		if (!$data) {
			$curl = $this->curl('pvzlist/v1/json');
			$result = json_decode($curl['data'], true);
			$data = $result['pvz'];

			if ($curl['info']['http_code'] < 200 || $curl['info']['http_code'] >= 300 || empty($data)) {
				$this->addLog(0, 'pvz', [], $data);
			} else {
				$this->addLog(1, 'pvz', [], count($data));

				$this->setCache('pvz', '', $data);
			}
		}

		return $data;
	}

	public function clearPvz() {
		$this->db->query("TRUNCATE TABLE `" . DB_PREFIX . $this->m . "_pvz`");
	}

	protected function curl($type) {
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_HEADER, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
		curl_setopt($ch, CURLOPT_URL, $this->api_url . $type);

		$result['data'] = curl_exec($ch);
		$result['info'] = curl_getinfo($ch);

		curl_close($ch);

		return $result;
	}

	protected function getCache($method, $postfix = '') {
		return $this->cache->get($this->m . '.' . $method . '.' . base64_encode($postfix));
	}

	protected function setCache($method, $postfix = '', $data) {
		$this->cache->set($this->m . '.' . $method . '.' . base64_encode($postfix), $data);
	}

	protected function addLog($type, $method, $request, $response = []) {
		if ($this->config->get($this->m . '_logging')) {
			switch ($type) {
				case 0:
					$type = 'error';
					break;
				case 1:
					$type = 'success';
					break;
				case 2:
					$type = 'info';
					break;
			}

			$this->log->write('[' . $this->m . '][' . $type . '][' . $method . '][request:' . serialize($request) . '][response:' . serialize($response) . ']');
		}
	}

	public function install() {
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . $this->m . "_country` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`country_id` int(11) NOT NULL,
			`CountryCode` int(11) NOT NULL,
			`CountryName` varchar(255) NOT NULL,
			`EngCountryName` varchar(255) NOT NULL,
			PRIMARY KEY (`id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci"
		);

		$this->db->query("INSERT INTO `" . DB_PREFIX . $this->m . "_country` (`id`, `country_id`, `CountryCode`, `CountryName`, `EngCountryName`) VALUES
			(1, 176, 1, 'Россия', 'Russia'),
			(2, 20, 42, 'Беларусь', 'Belarus'),
			(3, 220, 47, 'Украина', 'Ukraine'),
			(4, 109, 48, 'Казахстан', 'Kazakhstan'),
			(5, 11, 41, 'Армения', 'Armenia'),
			(6, 115, 15, 'Киргизия', 'Kyrgyzstan'),
			(7, 73, 64, 'Франция', 'France'),
			(8, 81, 57, 'Германия', 'Germany'),
			(9, 44, 138, 'Китай (КНР)', 'China'),
			(10, 123, 333, 'Литва', 'Lithuania'),
			(11, 14, 2, 'Австрия', 'Austria'),
			(12, 104, 10, 'Израиль', 'Israel'),
			(13, 142, 20, 'Монголия', 'Mongolia'),
			(14, 226, 46, 'Узбекистан', 'Uzbekistan'),
			(15, 223, 62, 'США', 'USA'),
			(16, 113, 37, 'Южная Корея', 'South Korea')"
		);

		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . $this->m . "_region` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`country_id` int(11) NOT NULL,
			`OblName` varchar(255) UNIQUE,
			`EngOblName` varchar(255),
			`CountryCode` int(11) NOT NULL,
			PRIMARY KEY (`id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci"
		);

		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . $this->m . "_region_to_zone` (
			`region_id` int(11) NOT NULL,
			`zone_id` int(11) NOT NULL
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci"
		);

		$this->db->query("INSERT INTO `" . DB_PREFIX . $this->m . "_region_to_zone` (`region_id`, `zone_id`) VALUES
			(11, 2796),
			(17, 2728),
			(10, 2730),
			(90, 338),
			(89, 343),
			(8, 2794),
			(5, 2729),
			(4, 2726),
			(9, 2727),
			(92, 339),
			(7, 2725),
			(6, 2724),
			(3, 2738),
			(2, 2760),
			(12, 2799),
			(93, 341),
			(16, 2759),
			(15, 2803),
			(33, 2751),
			(13, 2801),
			(14, 2802),
			(94, 341),
			(18, 2734),
			(19, 2741),
			(20, 2765),
			(21, 2740),
			(22, 2763),
			(23, 2743),
			(24, 2736),
			(25, 2744),
			(26, 2775),
			(27, 2733),
			(28, 2776),
			(29, 2747),
			(30, 2804),
			(31, 2787),
			(32, 2750),
			(34, 2752),
			(35, 2752),
			(37, 2755),
			(38, 2735),
			(40, 2758),
			(41, 2808),
			(42, 2782),
			(43, 2761),
			(44, 2722),
			(45, 2762),
			(46, 2764),
			(47, 2766),
			(48, 2767),
			(49, 2768),
			(50, 2769),
			(51, 2771),
			(52, 2770),
			(53, 2773),
			(54, 2774),
			(55, 2800),
			(56, 2777),
			(57, 2800),
			(58, 2778),
			(59, 2779),
			(60, 2781),
			(61, 2785),
			(62, 2783),
			(63, 2805),
			(64, 2737),
			(65, 2807),
			(66, 2807),
			(68, 2784),
			(69, 2786),
			(70, 2788),
			(71, 2746),
			(72, 2792),
			(73, 2789),
			(74, 2790),
			(75, 2756),
			(76, 2793),
			(77, 2742),
			(78, 2795),
			(79, 2748),
			(80, 2721),
			(81, 2749),
			(82, 2732),
			(83, 2739),
			(84, 2731),
			(85, 2723),
			(86, 2780),
			(87, 2806),
			(88, 337),
			(91, 340),
			(92, 342),
			(36, 2754),
			(39, 2757),
			(67, 2798)"
		);

		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . $this->m . "_city` (
			`CityCode` int(11) NOT NULL,
			`region_id` int(11) NOT NULL,
			`country_id` int(11) NOT NULL,
			`CountryCode` int(11) NOT NULL,
			`CityName` varchar(255),
			`EngName` varchar(255),
			`FullName` varchar(255),
			`EngFullName` varchar(255),
			`Center` varchar(255),
			`PostCodeList` varchar(255),
			`NalSumLimit` varchar(255),
			`FullNameFIAS` varchar(255),
			`FIAS` varchar(255),
			`KLADR` varchar(255),
			`cityDD` int(11),
			`pvzCode` varchar(255),
			PRIMARY KEY (`CityCode`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci"
		);

		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . $this->m . "_pvz` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`code` varchar(255) UNIQUE,
			`postalCode` int(11) NOT NULL,
			`cityCode` int(11) NOT NULL,
			`name` varchar(255) NOT NULL,
			`workTime` varchar(255),
			`address` varchar(255),
			`fullAddress` varchar(255),
			`phone` varchar(255),
			`note` varchar(255),
			`coordX` varchar(255),
			`coordY` varchar(255),
			`type` varchar(255) NOT NULL,
			`ownerCode` varchar(255),
			`isDressingRoom` tinyint(1),
			`haveCashless` tinyint(1),
			`haveCash` tinyint(1),
			`allowedCod` tinyint(1),
			`takeOnly` tinyint(1),
			`nearestStation` varchar(255),
			`metroStation` varchar(255),
			`site` varchar(255),
			`email` varchar(255),
			`addressComment` varchar(255),
			`weightMin` decimal(15,4),
			`weightMax` decimal(15,4),
			`width` decimal(15,4),
			`height` decimal(15,4),
			`depth` decimal(15,4),
			`fulfillment` varchar(255),
			`isHandout` tinyint(1),
			PRIMARY KEY (`id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci"
		);

		$this->db->query("ALTER TABLE `" . DB_PREFIX . "order_total` MODIFY `title` VARCHAR(255);");
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->m . "_country`;");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->m . "_region`;");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->m . "_region_to_zone`;");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->m . "_city`;");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . $this->m . "_pvz`;");
	}
}
