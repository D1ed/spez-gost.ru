<div class="title-module"><?php echo $name; ?></div>
<?php if ($carusel != '1') { ?>
<div id="featured-grid<?php echo $module; ?>" class="bl_margin flex_height_row">
   <?php foreach ($products as $product) { ?>
   <div class="product-layout <?php if ($column_left || $column_right ) { ?> nth1 <?php } else { ?> nth2 <?php } ?> featured<?php echo $module; ?> <?php if ($column_left || $column_right ) { ?> col-xl-five col-lg-3 col-md-4 col-sm-4 col-xs-6 <?php } else { ?> col-xl-2 col-lg-five col-md-3 col-sm-4 col-xs-6 <?php } ?>">
      <div class="gtile-i-wrap">
         <div class="gtile-i">
            <div class="gtile-i-box">
               <div class="item_feat<?php echo $module; ?> caption">
                  <div class="<?php if ($rat) { ?>raiting_thumb<?php } ?> product-thumb">
                     <div class="box_featured<?php echo $module; ?>">
                        <?php if ($rat) { ?>
                        <div class="rating rating_sm">
                           <?php for ($i = 1; $i <= 5; $i++) { ?>
                           <?php if ($product['rating'] < $i) { ?>
                           <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                           <?php } else { ?>
                           <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                           <?php } ?>
                           <?php } ?>
                        </div>
                        <?php } ?>
                        <div class="image"><a href="<?php echo $product['href']; ?>"><img src = "<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                        <div class="snav en">
                           <ul>
                              <?php if ($wish) { ?>
                              <li>
                                 <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                 <i class="fa fa-heart"></i>
                                 <span><?php echo $button_wishlist; ?></span>
                                 </a>
                              </li>
                              <?php } ?>
                              <?php if ($comp) { ?>
                              <li>
                                 <a onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                 <i class="fa fa-exchange"></i>
                                 <span><?php echo $button_compare; ?></span>
                                 </a>
                              </li>
                              <?php } ?>
                              <?php if ($quickview) { ?>
                              <li>
                                 <a onclick="quickview_open('<?php echo $product['product_id']; ?>');">
                                 <i class="fa fa-search"></i>
                                 <span><?php echo $text_quickview; ?></span>
                                 </a>
                              </li>
                              <?php } ?>
                           </ul>
                        </div>
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
                           <?php if ($aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 1 && $product['rating'] == $aurus_sticker_product_top_rating || $aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 2 && $product['viewed'] >  $aurus_sticker_product_top_viewed ) { ?>
                           <div class="stickers-top"><?php echo $aurus_name_sticker_product_top[$language_id]; ?></div>
                           <?php } ?>
                           <!-- top END -->
                           <?php if ($product['stickers2']) { ?>
                           <?php foreach ($product['stickers2'] as $sticker2) { ?>
                           <div class="stickers-all" style="color:<?php echo $sticker2['color']; ?>;background:<?php echo $sticker2['background']; ?>;"><?php echo $sticker2['name']; ?></div>
                           <?php } ?>
                           <?php } ?>
                        </div>
                        <?php if ($rat) { ?>
                        <div class="rating rating_lg">
                           <?php for ($i = 1; $i <= 5; $i++) { ?>
                           <?php if ($product['rating'] < $i) { ?>
                           <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                           <?php } else { ?>
                           <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                           <?php } ?>
                           <?php } ?>
                        </div>
                        <?php } ?>
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
                        <p class="price">
                           <?php if (!$product['special']) { ?>
                           <?php echo $product['price']; ?>
                           <?php } else { ?>
                           <span class="price-new"><?php echo $product['special']; ?></span><span class="price-old"><?php echo $product['price']; ?></span>
                           <?php } ?>
                           <?php if ($product['tax']) { ?>
                           <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                           <?php } ?>
                        </p>
                        <?php } ?>
                        <div class="cart">
                           <?php if ($product['quantity'] <= 0 && $aridiusinstock_status ) { ?>
                           <button type="button" class="btn-instock" onclick="instock.add('<?php echo $product['product_id']; ?>');" data-product-id="<? echo $product['product_id']; ?>"><?php echo $button_instock; ?></button>
                           <?php } else { ?>
                           <button type="button" class="btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
                           <?php } ?>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <?php } ?>
</div>
<div class="clearfix"></div>
<script>
   $(document).ready(function () {
   var size_li<?php echo $module; ?> = $("#featured-grid<?php echo $module; ?> > div").size();
   var li_element<?php echo $module; ?>  = <?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>;
   if(li_element<?php echo $module; ?> !=size_li<?php echo $module; ?>){
   $( ".product-layout.featured<?php echo $module; ?>:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)").append('<div class="gridcount featured<?php echo $module; ?>"><i class="gridcount_load fa fa-refresh fa-lg"></i><span class="gridcount2"><?php echo $button_load; ?></span></div>');
   $(".product-layout.featured<?php echo $module; ?>:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)").addClass("featured_box<?php echo $module; ?> quickview_hidden");
   }
   $('#featured-grid<?php echo $module; ?> > div:lt('+li_element<?php echo $module; ?>+')').fadeIn('slow');
   $('.gridcount.featured<?php echo $module; ?>').click(function () {
   $(this).remove();
   $('.featured_box<?php echo $module; ?>.quickview_hidden').first().removeClass('quickview_hidden')
   if(li_element<?php echo $module; ?>==size_li<?php echo $module; ?>){
   $('.btn.btn-default.gridcount.featured<?php echo $module; ?>').remove();
   }else{
   li_element<?php echo $module; ?> = (li_element<?php echo $module; ?>+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> <= size_li<?php echo $module; ?>) ? li_element<?php echo $module; ?>+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> : size_li<?php echo $module; ?>;
   $('#featured-grid<?php echo $module; ?> > div:lt('+li_element<?php echo $module; ?>+')').fadeIn('slow');
   }
   $("#sticky_item").trigger("sticky_kit:recalc"); // пересчет affix
   });
   });
</script>
<?php } else { ?>
<div id="featured_carusel<?php echo $module; ?>" class="swiper-container">
   <div class="swiper-wrapper">
      <?php foreach ($products as $product) { ?>
      <div class="swiper-slide product-layout_carusel">
         <div class="caption">
            <div class="<?php if ($rat) { ?>raiting_thumb<?php } ?> product-thumb">
               <div class="box_spec">
                  <?php if ($rat) { ?>
                  <div class="rating rating_sm">
                     <?php for ($i = 1; $i <= 5; $i++) { ?>
                     <?php if ($product['rating'] < $i) { ?>
                     <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                     <?php } else { ?>
                     <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                     <?php } ?>
                     <?php } ?>
                  </div>
                  <?php } ?>
                  <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                  <div class="snav en">
                     <ul>
                        <?php if ($wish) { ?>
                        <li>
                           <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                           <i class="fa fa-heart"></i>
                           <span><?php echo $button_wishlist; ?></span>
                           </a>
                        </li>
                        <?php } ?>
                        <?php if ($comp) { ?>
                        <li>
                           <a onclick="compare.add('<?php echo $product['product_id']; ?>');">
                           <i class="fa fa-exchange"></i>
                           <span><?php echo $button_compare; ?></span>
                           </a>
                        </li>
                        <?php } ?>
                        <?php if ($quickview) { ?>
                        <li>
                           <a onclick="quickview_open('<?php echo $product['product_id']; ?>');">
                           <i class="fa fa-search"></i>
                           <span><?php echo $text_quickview; ?></span>
                           </a>
                        </li>
                        <?php } ?>
                     </ul>
                  </div>
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
                     <?php if ($aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 1 && $product['rating'] == $aurus_sticker_product_top_rating || $aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 2 && $product['viewed'] >  $aurus_sticker_product_top_viewed ) { ?>
                     <div class="stickers-top"><?php echo $aurus_name_sticker_product_top[$language_id]; ?></div>
                     <?php } ?>
                     <!-- top END -->
                     <?php if ($product['stickers2']) { ?>
                     <?php foreach ($product['stickers2'] as $sticker2) { ?>
                     <div class="stickers-all" style="color:<?php echo $sticker2['color']; ?>;background:<?php echo $sticker2['background']; ?>;"><?php echo $sticker2['name']; ?></div>
                     <?php } ?>
                     <?php } ?>
                  </div>
                  <?php if ($rat) { ?>
                  <div class="rating rating_lg">
                     <?php for ($i = 1; $i <= 5; $i++) { ?>
                     <?php if ($product['rating'] < $i) { ?>
                     <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                     <?php } else { ?>
                     <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                     <?php } ?>
                     <?php } ?>
                  </div>
                  <?php } ?>
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
                  <p class="price">
                     <?php if (!$product['special']) { ?>
                     <?php echo $product['price']; ?>
                     <?php } else { ?>
                     <span class="price-new"><?php echo $product['special']; ?></span><span class="price-old"><?php echo $product['price']; ?></span>
                     <?php } ?>
                     <?php if ($product['tax']) { ?>
                     <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                     <?php } ?>
                  </p>
                  <?php } ?>
                  <div class="cart">
                     <?php if ($product['quantity'] <= 0 && $aridiusinstock_status ) { ?>
                     <button type="button" class="btn-instock" onclick="instock.add('<?php echo $product['product_id']; ?>');" data-product-id="<? echo $product['product_id']; ?>"><?php echo $button_instock; ?></button>
                     <?php } else { ?>
                     <button type="button" class="btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
                     <?php } ?>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <?php } ?>
   </div>
   <?php if ($navigation) { ?>
   <div class="#featured_carusel<?php echo $module; ?> swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
   <div class="#featured_carusel<?php echo $module; ?> swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
   <?php } ?>
</div>
<script><!--
   $(document).ready(function () {
   var ocSwiper = new Swiper('#featured_carusel<?php echo $module; ?>.swiper-container', {
    slidesPerView: <?php echo $items; ?>,
   	mode: 'horizontal',
   	pagination: false,
       speed: <?php echo $rew_speed; ?>,
   	<?php if ($autoplay_on) { ?>
       autoplay: {delay: <?php echo $autoplay; ?>},
   	    autoplayDisableOnInteraction: true,
   	<?php } ?>
   	  breakpoints: {
       768: {
         slidesPerView: 2,
        },
       992: {
         slidesPerView: 3,
           },
       1200: {
         slidesPerView: <?php if ($column_left || $column_right ) { ?> 3 <?php } else { ?> 4 <?php } ?>,
        },
   	     1600: {
         slidesPerView: <?php if ($column_left || $column_right ) { ?> 4 <?php } else { ?> 5 <?php } ?>,
        }
     },
   <?php if ($navigation) { ?>	
       navigation: {
           nextEl: '#featured_carusel<?php echo $module; ?> .swiper-button-next',
           prevEl: '#featured_carusel<?php echo $module; ?> .swiper-button-prev',
       },
   <?php } ?>	
   });
   <?php if ($stophover && $autoplay_on) { ?>
   $("#featured_carusel<?php echo $module; ?>.swiper-container").hover(function() {
       ocSwiper.autoplay.stop();
   }, function() {
       ocSwiper.autoplay.start();
   });
   <?php } ?>
   });
   -->
</script>
<?php } ?>
