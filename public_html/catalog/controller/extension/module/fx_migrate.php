<?php

class ControllerExtensionModuleFXMigrate extends Controller {



	public function index() {
	
		if (!$this->config->get('fx_migrate_on')) return false;
		
		if ($this->config->get('fx_migrate_config_list')){
			$result = $this->run($this->config->get('fx_migrate_config_list'));
			if ($result) return true;
		}
		
		$file = DIR_CONFIG.'redirects_list.ini';
	
		if (file_exists($file)) {
			$file_list = file_get_contents($file);
			$result = $this->run($file_list);
			if ($result) return true;
		}
		
		if ($this->config->get('fx_migrate_smart')) $this->test404();
	
	
	}

	public function home() {
	
		$file = DIR_CONFIG.'redirects_list_home.ini';
	
		if (file_exists($file)) {
			$file_list = file_get_contents($file);
			$result = $this->run($file_list);
		}
		
		//if ($this->config->get('fx_migrate_smart')) $this->test404();
		
	}
	
	

	public function run($data) {
	
		$host = $this->config->get('config_ssl') ? HTTPS_SERVER : HTTP_SERVER;
		
		$host = $this->config->get('config_secure') ? str_replace('http:/', 'https:/', $this->config->get('config_ssl')) : $this->config->get('config_url');
		
		if (substr_count($host, "/") > 3){		
			$ssl = $this->config->get('config_secure') ? 'https://' : 'http://';
			$host = $ssl . $this->request->server['HTTP_HOST'];
		}

		$redirects = explode(PHP_EOL, $data);
		
		//var_dump($redirects);

		$uri = $this->request->server['REQUEST_URI'];
		
		$uri = ltrim($uri, "/ ");
		
		$uri = urldecode($uri);
		
		//$href = '/'.str_replace($host, '', $href);

		foreach ($redirects as $redirect){
			$temp = explode("→", $redirect);
			
			if (empty($temp[1])) {continue;}
			
			$from = trim(str_replace($host, '', $temp[0]));
			$to = trim(str_replace($host, '', $temp[1]));
			
			$asterisks = substr_count($from, '*');
			
			$num = substr_count($to, '[') > 0;
			
			if ($asterisks > 0){
			
				$from = str_replace("*", "☺", $from);	$from = str_ireplace('/', '☻', $from);
				$from = preg_quote(strtolower($from));
				$from = str_replace("☺", "(.*)", $from);	$from = str_ireplace('☻', '\/', $from);
				
				if ($num) $to = preg_replace('/\[([0-9])\]/', '$$1', $to);

			
				if (preg_match('/^'.$from.'$/', $uri)) {
					
					for ($x=1; $x <= $asterisks; $x++){
						//$to = str_replace('*', '$'.$x, $to);
						
						$to = implode('$'.$x, explode('*', $to, 2));
					}
					
					$to = preg_replace('/^'.$from.'$/', $to, $uri);
					
					
					//print('<br>' . $from .' ^ '. $to);
					
					if((float)VERSION < 2) {
						$this->redirect($host . $to, 301, 'SSL');
					}else{
						$this->response->redirect($host . $to, 301, 'SSL');
					}
					
					return true;

				}
			}else if ($from == $uri) {
				if((float)VERSION < 2) {
					$this->redirect($host . $to, 301, 'SSL');
				}else{
					$this->response->redirect($host . $to, 301, 'SSL');
				}
				return true;
			}
		}
		return false;
    }
	
	public function test404() {	
	
		$uri = $this->request->server['REQUEST_URI'];
		
		$preclear = explode("?", $uri);
		
		$clear = trim($preclear[0], '/');
		
		$parts = explode("/", $clear);
		
		while (!empty($parts)) {
			
			//print_r($parts);
			
			$prelast = explode(".", end($parts));
			
			$last = $prelast[0];
			
		
			$this->load->model('extension/module/fx_migrate');

			$query = $this->model_extension_module_fx_migrate->getQuery($last);
			
			
			if (!empty($query)) {

				preg_match('/(.*)_id=(\d*)/', $query, $match);
				
				
				switch ($match[1]){
					case 'category':
						$to = $this->url->link('product/category', 'path=' . $match[2], 'SSL');
						break;
					case 'manufacturer':
						$to = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $match[2], 'SSL');
						break;
					case 'product':
						$to = $this->url->link('product/product', 'product_id=' . $match[2], 'SSL');
						break;
					case 'information':
						$to = $this->url->link('information/information', 'information_id=' . $match[2], 'SSL');
						break;
				}
			
			}
			
			if (isset($to)) $this->response->redirect($to, 301);
			
			array_pop($parts);
			
		}

    }
}