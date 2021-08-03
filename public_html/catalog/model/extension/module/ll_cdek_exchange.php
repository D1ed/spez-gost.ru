<?php
/**
 * @author    p0v1n0m <support@lutylab.ru>
 * @license   Commercial
 * @link      https://lutylab.ru
 */
class ModelExtensionModuleLLCDEKExchange extends Model {
	protected $code = false;
	protected $statics = false;
	protected $ll = false;

	public function __construct($registry) {
		$this->registry = $registry;

		$this->code = basename(__FILE__, '.php');

		$this->statics = new \Config();
		$this->statics->load($this->code);

		$this->ll = new LL\Core($this->registry, $this->code, $this->statics->get('type'));
	}

	public function addExportOrder($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . $this->code . "_order` SET 
			order_id = '" . (int)$data['order_id'] . "',
			from_city = '" .  (int)$data['from_city'] . "',
			to_city = '" .  (int)$data['to_city'] . "',
			tariff = '" .  (int)$data['tariff'] . "',
			pvz = '" .  $this->db->escape($data['pvz']) . "',
			weight = '" .  (int)$data['weight'] . "'
		");
	}

	public function updateExportOrder($data) {
		$this->db->query("UPDATE `" . DB_PREFIX . $this->code . "_order` SET 
			from_city = '" .  (int)$data['from_city'] . "',
			to_city = '" .  (int)$data['to_city'] . "',
			tariff = '" .  (int)$data['tariff'] . "',
			pvz = '" .  $this->db->escape($data['pvz']) . "',
			weight = '" .  (int)$data['weight'] . "'
			WHERE order_id = '" . (int)$data['order_id'] . "'
		");
	}

	public function addOrderStatus($order_id, $data) {
		date_default_timezone_set($this->config->get($this->ll->getPrefix() . '_timezone'));

		$this->db->query("INSERT IGNORE INTO `" . DB_PREFIX . $this->code . "_status` SET order_id = '" . (int)$order_id . "', date = '" . $this->db->escape(date('Y-m-d H:i:s', strtotime($data['@attributes']['Date']))) . "', code = '" . (int)$data['@attributes']['Code'] . "', description = '" . $this->db->escape($data['@attributes']['Description']) . "', city_code = '" . (int)$data['@attributes']['CityCode'] . "', city_name = '" . $this->db->escape($data['@attributes']['CityName']) . "'");
		$this->updateOrderStatus($order_id, $data);
	}

	public function updateOrderStatus($order_id, $data) {
		date_default_timezone_set($this->config->get($this->ll->getPrefix() . '_timezone'));

		$this->db->query("UPDATE `" . DB_PREFIX . $this->code . "_order` SET status = '" . (int)$data['@attributes']['Code'] . "', date = '" . $this->db->escape(date('Y-m-d H:i:s', strtotime($data['@attributes']['Date']))) . "' WHERE order_id = '" . (int)$order_id . "'");
	}

	public function getExportOrder($order_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . $this->code . "_order` WHERE order_id = '" . (int)$order_id . "'");

		return $query->row;
	}

	public function getTrackingOrders($statuses, $days) {
		date_default_timezone_set($this->config->get($this->ll->getPrefix() . '_timezone'));

		$query = $this->db->query("SELECT order_id FROM `" . DB_PREFIX . "order` WHERE order_status_id IN (" . $this->db->escape(implode(',', $statuses)) . ") AND date_added > '" . $this->db->escape(date('Y-m-d H:i:s', strtotime('now - ' . $days . ' day'))) . "'");

		return $query->rows;
	}

	public function getOrderInfo($order_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . $this->code . "_order` as e LEFT JOIN `" . DB_PREFIX . "order` o ON e.order_id = o.order_id WHERE e.order_id = '" . (int)$order_id . "'");

		if (!isset($query->row['dispatch_number'])) {
			return;
		}

		return $query->row;
	}

	public function getOrderStatus($order_id, $code) {
		$query = $this->db->query("SELECT code FROM " . DB_PREFIX . $this->code . "_status WHERE order_id = '" . (int)$order_id . "' AND code = '" . (int)$code . "'");

		if (isset($query->row['code'])) {
			return $query->row['code'];
		}
	}

	public function getCity($city_code) {
		$query = $this->db->query("SELECT c.CityName, r.OblName, co.CountryName FROM `" . DB_PREFIX . "ll_cdek_city` as c LEFT JOIN `" . DB_PREFIX . "ll_cdek_region` r ON c.region_id = r.id LEFT JOIN `" . DB_PREFIX . "ll_cdek_country` co ON c.country_id = co.id WHERE CityCode = '" . (int)$city_code . "'");

		return $query->row;
	}

	public function deleteExportOrder($order_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . $this->code . "_order` WHERE order_id = '" . (int)$order_id . "'");
	}

	public function getOrderDispatchNumber($order_id) {
		$query = $this->db->query("SELECT dispatch_number FROM `" . DB_PREFIX . $this->code . "_order` WHERE order_id = '" . (int)$order_id . "'");

		if (isset($query->row['dispatch_number'])) {
			return $query->row['dispatch_number'];
		}
	}

	public function getPvz($pvz_code) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "ll_cdek_pvz` WHERE code = '" . $this->db->escape($pvz_code) . "'");

		return $query->row;
	}

	public function clearPvz() {
		$this->db->query("TRUNCATE TABLE `" . DB_PREFIX . "ll_cdek_pvz`");
	}

	public function getApiPvzs() {
		$result = $this->ll->curl('pvzlist/v1/json', [], 'json', false);

		$data = json_decode($result, true);

		return $data['pvz'];
	}

	public function addPvz($pvz) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "ll_cdek_pvz` SET
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
			$this->db->query("UPDATE `" . DB_PREFIX . "ll_cdek_pvz` SET
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
}

class ModelModuleLLCDEKExchange extends ModelExtensionModuleLLCDEKExchange {}
