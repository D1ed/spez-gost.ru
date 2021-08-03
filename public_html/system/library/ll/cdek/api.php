<?php
/**
 * @author    p0v1n0m <support@lutylab.ru>
 * @license   Commercial
 * @link      https://lutylab.ru
 */
namespace LL\CDEK;

/**
 * Класс для работы с api СДЭК
 */
class API {
	protected $ll;
	protected $config;
	protected $xml = '<?xml version="1.0" encoding="UTF-8"?>';

	public function __construct($ll) {
		$this->ll = $ll;
		$this->config = $this->ll->config;
	}

	/**
	 * Отправка заказов
	 * 
	 * @param  array $orders
	 * @return array $curl
	 */
	public function send_order($orders) {
		$this->buildXML($orders);

		$result = $this->ll->curl('new_orders.php', ['xml_request' => $this->xml], false);

		if ($result) {
			return $result;
		}
	}

	/**
	 * Обновление статусов заказов
	 * 
	 * @param  array $dispatch_numbers
	 * @return array $statuses
	 */
	public function update_status($dispatch_numbers) {
		$this->xml .= '<StatusReport Account="' . $this->config->get($this->ll->getPrefix() . '_api_login') . '" Date="' . date('Y-m-d') . '" Secure="' . md5(date('Y-m-d') . '&' . $this->config->get($this->ll->getPrefix() . '_api_key')) . '" ShowHistory="1">';

		foreach ($dispatch_numbers as $dispatch_number) {
			$this->xml .= '<Order DispatchNumber="' . $dispatch_number . '"/>';
		}

		$this->xml .= '</StatusReport>';

		$result = $this->ll->curl('status_report_h.php', ['xml_request' => $this->xml], false);

		if (isset($result['Order'][0]['Status']['State'])) {
			foreach ($result['Order'] as $order) {
				foreach ($order['Status']['State'] as $status) {
					if (!isset($status['@attributes'])) {
						$data['@attributes'] = $status;
						$status = $data;
					}

					if ($status['@attributes']['Code'] > 0) {
						$statuses[array_search($order['@attributes']['DispatchNumber'], $dispatch_numbers)][] = $status;
					}
				}
			}

			return $statuses;
		} elseif (isset($result['Order']['Status']['State'])) {
			foreach ($result['Order']['Status']['State'] as $status) {
				if (!isset($status['@attributes'])) {
					$data['@attributes'] = $status;
					$status = $data;
				}

				if ($status['@attributes']['Code'] > 0) {
					$statuses[array_search($result['Order']['@attributes']['DispatchNumber'], $dispatch_numbers)][] = $status;
				}
			}

			return $statuses;
		}
	}

	/**
	 * Печать квитанции заказа
	 * 
	 * @param  array $dispatch_numbers
	 * @return boolen
	 */
	public function print_invoice($dispatch_numbers) {
		$order_ids = null;

		$this->xml .= '<OrdersPrint Account="' . $this->config->get($this->ll->getPrefix() . '_api_login') . '" Date="' . date('Y-m-d') . '" Secure="' . md5(date('Y-m-d') . '&' . $this->config->get($this->ll->getPrefix() . '_api_key')) . '" OrderCount="' . count($dispatch_numbers) . '" CopyCount="' . $this->config->get($this->ll->getPrefix() .'_invoice_count') . '">';

		foreach ($dispatch_numbers as $order_id => $dispatch_number) {
			$this->xml .= '<Order DispatchNumber="' . $dispatch_number . '"/>';

			$order_ids .= $order_id . '_';
		}

		$this->xml .= '</OrdersPrint>';

		$result = $this->ll->curl('orders_print.php', ['xml_request' => $this->xml], false);

		if (!is_array($result) && substr($result, 0, 4) == '%PDF') {
			return file_put_contents(DIR_UPLOAD . $this->ll->code . '_invoice_' . $order_ids . implode('_', $dispatch_numbers) . '.pdf', $result);
		}
	}

	/**
	 * Печать этикеток заказа
	 * 
	 * @param  array $dispatch_numbers
	 * @return boolen
	 */
	public function print_sticker($dispatch_numbers) {
		$order_ids = null;

		$this->xml .= '<OrdersPackagesPrint Account="' . $this->config->get($this->ll->getPrefix() . '_api_login') . '" Date="' . date('Y-m-d') . '" Secure="' . md5(date('Y-m-d') . '&' . $this->config->get($this->ll->getPrefix() . '_api_key')) . '" OrderCount="' . count($dispatch_numbers) . '" CopyCount="' . $this->config->get($this->ll->getPrefix() .'_sticker_count') . '" PrintFormat="' . $this->config->get($this->ll->getPrefix() .'_sticker_format') . '">';

		foreach ($dispatch_numbers as $order_id => $dispatch_number) {
			$this->xml .= '<Order DispatchNumber="' . $dispatch_number . '"/>';

			$order_ids .= $order_id . '_';
		}

		$this->xml .= '</OrdersPackagesPrint>';

		$result = $this->ll->curl('ordersPackagesPrint', ['xml_request' => $this->xml], false);

		if (!is_array($result) && substr($result, 0, 4) == '%PDF') {
			return file_put_contents(DIR_UPLOAD . $this->ll->code . '_sticker_' . $order_ids . implode('_', $dispatch_numbers) . '.pdf', $result);
		}
	}

	/**
	 * Регистрация заявки на вызов курьера
	 * 
	 * @param  array $call
	 * @return boolen
	 */
	public function call_courier($call) {
		$this->buildXML($call);

		$result = $this->ll->curl('call_courier.php', ['xml_request' => $this->xml], false);

		if ($result) {
			return $result;
		}
	}

	/**
	 * Удаление заказа
	 * 
	 * @param  string $dispatch_number
	 * @param  string $number
	 * @return boolen
	 */
	public function remove_order($dispatch_number, $number) {
		$this->xml .= '<deleterequest Account="' . $this->config->get($this->ll->getPrefix() . '_api_login') . '" Date="' . date('Y-m-d') . '" Secure="' . md5(date('Y-m-d') . '&' . $this->config->get($this->ll->getPrefix() . '_api_key')) . '" OrderCount="1" Number="' . $number . '"><Order DispatchNumber="' . $dispatch_number . '"/></deleterequest>';

		$result = $this->ll->curl('delete_orders.php', ['xml_request' => $this->xml], false);

		if ($result) {
			return true;
		}
	}

	/**
	 * Рекурсивная постройка xml
	 * 
	 * @param array   $data
	 * @param boolean $close - Указатель на необходимость закрытия тега
	 * @param string  $parent - Название родительского тега для вложенных элементов order, item, schedule...
	 */
	protected function buildXML($data, $close = false, $parent = false) {
		$count = 0;
		asort($data);

		foreach ($data as $key => $val) {
			$count++;

			if ((is_array($val) && empty($val)) || $val == '') {
				continue;
			}

			if (is_array($val)) {
				if ($close || ($key === 'Address' && mb_substr($this->xml, -1) != '>')) {
					$this->xml .= '>';
				}

				// проверяем, что есть не пустые дети
				if ($this->isEmpty($val)) {
					continue;
				}

				if ($key === 'AddService') {
					if (mb_substr($this->xml, -1) != '>') {
						$this->xml .= '>';
					}

					$service_key = 0;

					foreach ($val as $service) {
						$service_key++;

						$this->xml .= '<AddService ServiceCode="' . $service['ServiceCode'] . '" ' . ($service['ServiceCode'] == 24 ? 'count="' . $this->config->get($this->ll->getPrefix() . '_service_count') . '" ' : '') . '/';

						if (count($val) != 1) {
							$this->xml .= '>';
						}
					}
				// order[0]...order[n]
				} elseif (is_numeric($key)) {
					if ($parent) {
						$this->xml .= '<' . $parent;
					}

					if ($parent && $parent === 'CallCourier') {
						$this->xml .= '>';
					}

					$this->xml .= $this->buildXML($val, false);

					if ($parent) {
						$this->xml .= '</' . $parent . '>';
					}
				// order, item, schedule...
				} elseif (isset($val[0])) {
					$this->xml .= $this->buildXML($val, false, $key);
				} else {
					if (mb_substr($this->xml, -1) != '>') {
						$this->xml .= '>';
					}

					$this->xml .= '<' . $key;
					$this->xml .= $this->buildXML($val, true);
					$this->xml .= '</' . $key . '>';
				}
			} else {
				$this->xml .= ' ' . $key . '="' . $val . '"';

				if (count($data) == $count) {
					$this->xml .= '>';
				}
			}
		}
	}

	/**
	 * Рекурсивная проверка всех детей на пустоту
	 * 
	 * @param  array|string $val - Элемент с возможными вложенными детьми
	 * @return boolean - true, если элемент и все дети пустые
	 */
	protected function isEmpty($val) {
		$empty = 0;

		if (empty($val) || $val == '') {
			return true;
		}

		if (is_array($val)) {
			foreach ($val as $v) {
				if (empty($v) || $v == '') {
					$empty++;
				}

				if (!empty($v) && $this->isEmpty($v)) {
					$empty++;
				}
			}
		}

		if (is_array($val) && count($val) == $empty) {
			return true;
		}
	}
}
