<?php
class ControllerExtensionModuleAridiusCatWall extends Controller {
	
    public function index($setting) {

        $this->load->language('extension/module/aridius_catwall');
        $data['heading_title'] = $this->language->get('heading_title');
		$data['Seeall'] = $this->language->get('Seeall');
		$check=array();
	    $check = $setting['aridius_catwall_cat'];
		$data['child_visible'] = $setting['child_visible'];
		$data['col_xs'] = $setting['col_xs'];
		$data['col_sm'] = $setting['col_sm'];
		$data['col_md'] = $setting['col_md'];
		$data['col_lg'] = $setting['col_lg'];
		$data['add_img'] = $setting['add_img'];
	
	
	
	$data['slides1'] = $setting['slides1'];
	$data['slides2'] = $setting['slides2'];
	$data['slides3'] = $setting['slides3'];
	$data['slides4'] = $setting['slides4'];
	
	
	
		$data['variant'] = $setting['variant'];
	
	
		
		
        if (isset($this->request->get['path'])) {
            $parts = explode('_', (string) $this->request->get['path']);
        } else {
            $parts = array();
        }
		
        if (isset($parts[0])) {
            $data['category_id'] = $parts[0];
        } else {
            $data['category_id'] = 0;
        }
		
        if (isset($parts[1])) {
            $data['child_id'] = $parts[1];
        } else {
            $data['child_id'] = 0;
        }

		
        $this->load->model('catalog/category');
        $this->load->model('catalog/product');
        $data['categories'] = array();
        $categories = $this->model_catalog_category->getCategories(0);
        $this->load->model('tool/image');
		
        foreach ($categories as $category) {
						$children_data = array();
				$children = $this->model_catalog_category->getCategories($category['category_id']);
				
	    if ($setting['child_visible']) {			
				foreach (array_slice($children, 0, ($setting['limit_child'])) as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
					
				if (isset($check) && (in_array($category['category_id'], $check ))) {	
					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),			
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				 }	
				}
        }      
		
		        if ($category['image']) {
                $image = $this->model_tool_image->resize($category['image'], $setting['width'], $setting['height']);
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
            }	
			
				$filter_data = array(
					'filter_category_id'  => $category['category_id'],
					'filter_sub_category' => true
					);
					
		if (isset($check) && (in_array($category['category_id'], $check ))) {	
                $data['categories'][] = array(
                'name' => $category['name']. ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),				
				'children' => $children_data,
				 'image' => $image,
                'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
            );
		       }
        }

		return $this->load->view('extension/module/aridius_catwall', $data);
    }
}