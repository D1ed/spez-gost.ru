<?php
namespace yamarket_fusion\Xml\Catalog\Rozetka;

use yamarket_fusion\Xml\Node;

class Offer extends \yamarket_fusion\Xml\Offer {
	const limit_images = 10;
	const limit_description = 3000;
	const tagOldprice = 'price_old';

	protected function addNodesImages() {
		$imgTag = $this->tag('picture');

		$images = array_slice($this->getImages(), 0, self::limit_images, true);
		
		foreach ($images as $image) {
			$this->nodes[] = "<{$imgTag}>{$image}</{$imgTag}>";
		}
	}

}