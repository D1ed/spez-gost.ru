<?php
namespace yamarket_fusion\Xml\Catalog\Sitemap;

use \yamarket_fusion\Xml as XML;

class Offer extends \yamarket_fusion\Xml\Offer {
	const tagOffer = 'url';
	//const tagPrice = 'g:price';
	//const tagOldprice = 'g:sale_price';
	const tagUrl = 'loc';
	const tagImages = 'image:image';
	const tagImage = 'image:loc';
	//const tagDescription = 'g:description';
	//const tagCategoryId = 'g:product_type';
	//const tagVendor = 'g:brand';

	// revrite name nodes
	//const tagName = 'g:title';
	//const tagModel = 'g:title';

	public function getXml() {
		$current_nodes = $this->nodes;
		
		//$this->setValue(new Xml\Node('g:id', $this->id));
		//$this->setValue(new Xml\Node('g:availability', $this->attrs['available'] ? 'in stock' : 'out of stock'));
		//$this->setValue(new Xml\Node('g:product_type', $this->category_name));

		unset($this->attrs['available']);

		if (isset($this->attrs['group_id']))
			$this->setValue(new Xml\Node('g:item_group_id', $this->attrs['group_id']));

		$ignored_standart_tags = array('currencyId', 'categoryId', 'delivery', 'pickup', 'vendorCode', 'store','adult','manufacturer_warranty','vendor','price','oldprice','id','name','model');

		foreach ($this->standart_values as $prop => $val) {
			if ($val === null || in_array($prop, $ignored_standart_tags)) continue;

			if ($prop == 'price' || $prop == 'oldprice') {
				// revert sale_price
				if ($prop == 'price' && $this->standart_values['oldprice'] !== null)
					$val = $this->standart_values['oldprice'];
				
				if ($prop == 'oldprice')
					$val = $this->standart_values['price'];
				
				$val = number_format($val, 2, '.', '') . ' ' . $this->standart_values['currencyId'];
			}
			else if ($prop == 'url') {
				$val = $this->encodeUrl($val);
			}
			
			$tag = $this->tag($prop);
			$this->nodes[] = "<{$tag}>{$val}</{$tag}>";
		}
		
		$this->addNodesImages();
		$this->addNodesParam();

		$output = Xml\Node::getXml();

		$this->nodes = $current_nodes;

		return $output;
	}

	public function setDescription($text) {
		$description = new XML \Node (static::tagDescription);
		$text = strip_tags($text);
		$description->setRawValue($text);
		$this->setValue($description);
		//$this->setValue(new XML\Node(self::tagDescription, htmlspecialchars($text, ENT_QUOTES)));
	}

	protected function addNodesImages() {
		

		foreach ($this->getImages() as $image) {
			$imagesNode = new XML \Node(self::tagImages);
			$imageNode = new XML \Node(self::tagImage, $image);
			$imagesNode->setValue($imageNode);
			$this->nodes[] = $imagesNode;
		}

		
	}
}