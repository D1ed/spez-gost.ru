<?php
namespace yamarket_fusion\Xml\Catalog\Avito;

use \yamarket_fusion\Xml as XML;

class Offer extends \yamarket_fusion\Xml\Offer {
	const tagOffer = 'Ad';
	const tagPrice = 'Price';
	const tagOldprice = 'Price';
	// revrite name nodes
	const tagName = 'Title';
    const tagModel = 'Title';
    const tagImages = 'Images';
	const tagImage = 'Image';

	public function getXml() {
		$current_nodes = $this->nodes;
		
		$this->setValue(new Xml\Node('Id', $this->id));
		//$this->setValue(new Xml\Node('Category', $this->category_name));

		unset($this->attrs['available']);
		unset($this->attrs['group_id']);
		unset($this->category_name);
		
		

		$ignored_standart_tags = array('currencyId', 'categoryId', 'delivery', 'pickup', 'vendorCode', 'store','adult','manufacturer_warranty','vendor','url');

		foreach ($this->standart_values as $prop => $val) {
			if ($val === null || in_array($prop, $ignored_standart_tags)) continue;

			if ($prop == 'price' || $prop == 'oldprice') {
				// revert sale_price
				if ($prop == 'price' && $this->standart_values['oldprice'] !== null)
					$val = $this->standart_values['price'];
				
				if ($prop == 'oldprice')
					$val = $this->standart_values['oldprice'];
				
				$val = number_format($val, 0, '.', '');
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
		$imagesNode = new XML \Node(self::tagImages);

		foreach ($this->getImages() as $image) {
			$imageNode = new XML \Node(self::tagImage, null, true);
			$imageNode->url = $image;
			
			$imagesNode->setValue($imageNode);
		}

		$this->nodes[] = $imagesNode;
	}
}