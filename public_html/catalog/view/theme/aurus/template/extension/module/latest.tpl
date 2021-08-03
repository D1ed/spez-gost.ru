<div class="title-module"><?php echo $heading_title; ?></div>
<div class="row">
   <?php foreach ($products as $product) { ?>
   <div class="product-layout_left changebr col-lg-3 col-md-3 col-sm-6 col-xs-12">
      <div class="product-thumb_left transition">
         <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
         <div class="positionsticker">
            <!-- special -->
            <?php if ($aurus_sticker_sale_product_auto !=1 && $product['special'] && $product['price_sticker'] != 0 ) { ?>
            <?php  $percent = round(100 - ($product['special_sticker'] / $product['price_sticker']) * 100); ?>
            <div class="stickers-special">-<?php echo $percent; ?>%</div>
            <?php } ?>
            <!-- special END -->
            <!-- new -->	
            <?php
               $startDate1 = strtotime(mb_substr($product['dateadded'], 0, 10));
               $endDate2 = strtotime(date("Y-m-d"));
               $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
               ?>
            <?php if($aurus_sticker_new_product_auto !=1 && $days < $aurus_sticker_product_new_day) { ?>
            <div class="stickers-new"><?php echo $aurus_name_sticker_product_new[$language_id]; ?></div>
            <?php } ?>
            <!-- new END -->	
            <!-- top -->
            <?php if ($aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 1 && $product['rating'] == $aurus_sticker_product_top_rating || $aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 2 && $product['viewed'] >  $aurus_sticker_product_top_viewed) { ?> 
            <div class="stickers-top"><?php echo $aurus_name_sticker_product_top[$language_id]; ?></div>
            <?php } ?>
            <!-- top END -->
            <?php if ($product['stickers2']) { ?>
            <?php foreach ($product['stickers2'] as $sticker2) { ?>
            <div class="stickers-all" style="color:<?php echo $sticker2['color']; ?>;background:<?php echo $sticker2['background']; ?>;"><?php echo $sticker2['name']; ?></div>
            <?php } ?>
            <?php } ?>
         </div>
         <div class="caption sixe_price">
            <div class="product-name"><a href="<?php echo $product['href']; ?>">
               <?php  
                  if( strlen($product['name'] ) < $aurus_limit_symbolst) { 
                  	echo $product['name']; 
                  } 
                  else {
                  	echo mb_substr( $product['name'],0,$aurus_limit_symbolst,'utf-8' )."..."; } 
                  ?>
               </a>
            </div>
            <?php if ($product['price']) { ?>
            <?php if (!$product['special']) { ?>
            <p class="price" >
               <?php echo $product['price']; ?>
               <?php } else { ?>
            <p class="price">
               <span class="price-new"><?php echo $product['special']; ?></span> <br/><span class="price-old"><?php echo $product['price']; ?></span>
               <?php } ?>
               <?php if ($product['tax']) { ?>
               <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
               <?php } ?>
            </p>
            <?php } ?>
         </div>
         <div class="cart">
            <button type="button" class="btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
         </div>
      </div>
   </div>
   <?php } ?>
</div>
