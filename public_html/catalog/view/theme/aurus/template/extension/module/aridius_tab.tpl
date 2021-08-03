<?php if ($carusel != '1') { ?>
<div id="product-tab">
   <ul class="nav nav-tabs mod scroll-width-thin">
      <?php if($featured_products){ ?>
      <li><a href="#tab2" data-toggle="tab"><?php echo $tab_featured; ?></a></li>
      <?php } ?>
      <?php if($special_products){ ?>
      <li><a href="#tab1" data-toggle="tab"><?php echo $tab_special; ?></a></li>
      <?php } ?>
      <?php if($bestseller_products){ ?>
      <li><a href="#tab3" data-toggle="tab"><?php echo $tab_bestseller; ?></a></li>
      <?php } ?>
      <?php if($latest_products){ ?>
      <li><a href="#tab4" data-toggle="tab"><?php echo $tab_latest; ?></a></li>
      <?php } ?>
      <?php if($mostviewed_products){ ?>
      <li><a href="#tab5" data-toggle="tab"><?php echo $tab_mostviewed; ?></a></li>
      <?php } ?>
   </ul>
   <div class="tab-content">
      <!-- featuredtab start -->
      <?php if($featured_products){ ?>
      <div class="tab-pane" id="tab2">
         <div id="featuredtab-grid" class="bl_margin flex_height_row">
            <?php foreach ($featured_products as $product) { ?>
            <div class="product-layout <?php if ($column_left || $column_right ) { ?> nth1 <?php } else { ?> nth2 <?php } ?> featuredtab <?php if ($column_left || $column_right ) { ?> col-xl-five col-lg-3 col-md-4 col-sm-4 col-xs-6 <?php } else { ?> col-xl-2 col-lg-five col-md-3 col-sm-4 col-xs-6 <?php } ?>">
               <div class="gtile-i-wrap">
                  <div class="gtile-i">
                     <div class="gtile-i-box">
                        <div class="item_feattab caption">
                           <div class="<?php if ($rat) { ?>raiting_thumb<?php } ?> product-thumb">
                              <div class="box_featuredtab">
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
      </div>
      <?php } ?>
      <!-- featuredtab end -->
      <!-- specialtab start -->
      <?php if($special_products){ ?>
      <div class="tab-pane" id="tab1">
         <div id="specialtab-grid" class="bl_margin flex_height_row">
            <?php foreach ($special_products as $product) { ?>
            <div class="product-layout <?php if ($column_left || $column_right ) { ?> nth1 <?php } else { ?> nth2 <?php } ?> specialtab <?php if ($column_left || $column_right ) { ?> col-xl-five col-lg-3 col-md-4 col-sm-4 col-xs-6 <?php } else { ?> col-xl-2 col-lg-five col-md-3 col-sm-4 col-xs-6 <?php } ?>">
               <div class="gtile-i-wrap">
                  <div class="gtile-i">
                     <div class="gtile-i-box">
                        <div class="item_spectab caption">
                           <div class="<?php if ($rat) { ?>raiting_thumb<?php } ?> product-thumb">
                              <div class="box_spectab">
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
                                 <div class="image"><a href="<?php echo $product['href']; ?>"><img src ="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
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
                                    <!-- specialtab -->
                                    <?php if ($aurus_sticker_sale_product_auto !=1 && $product['special'] && $product['price_sticker'] != 0) { ?>
                                    <?php  $percent = round(100 - ($product['special_sticker'] / $product['price_sticker']) * 100); ?>
                                    <div class="stickers-special">-<?php echo $percent; ?>%</div>
                                    <?php } ?>
                                    <!-- specialtab END -->
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
      </div>
      <?php } ?>
      <!-- specialtab end -->
      <!-- bestsellertab start -->
      <?php if($bestseller_products){ ?>
      <div class="tab-pane" id="tab3">
         <div id="bestsellertab-grid" class="bl_margin flex_height_row">
            <?php foreach ($bestseller_products as $product) { ?>
            <div class="product-layout <?php if ($column_left || $column_right ) { ?> nth1 <?php } else { ?> nth2 <?php } ?> bestsellertab <?php if ($column_left || $column_right ) { ?> col-xl-five col-lg-3 col-md-4 col-sm-4 col-xs-6 <?php } else { ?> col-xl-2 col-lg-five col-md-3 col-sm-4 col-xs-6 <?php } ?>">
               <div class="gtile-i-wrap">
                  <div class="gtile-i">
                     <div class="gtile-i-box">
                        <div class="item_besttab caption">
                           <div class="<?php if ($rat) { ?>raiting_thumb<?php } ?> product-thumb">
                              <div class = "box_bestsellertab">
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
      </div>
      <?php } ?>
      <!-- bestsellertab end -->
      <!-- latesttab start -->
      <?php if($latest_products){ ?>
      <div class="tab-pane" id="tab4">
         <div id="latesttab-grid" class="bl_margin flex_height_row">
            <?php foreach ($latest_products as $product) { ?>
            <div class="product-layout <?php if ($column_left || $column_right ) { ?> nth1 <?php } else { ?> nth2 <?php } ?> latesttab <?php if ($column_left || $column_right ) { ?> col-xl-five col-lg-3 col-md-4 col-sm-4 col-xs-6 <?php } else { ?> col-xl-2 col-lg-five col-md-3 col-sm-4 col-xs-6 <?php } ?>">
               <div class="gtile-i-wrap">
                  <div class="gtile-i">
                     <div class="gtile-i-box">
                        <div class="item_lattab caption">
                           <div class="<?php if ($rat) { ?>raiting_thumb<?php } ?> product-thumb">
                              <div class = "box_latesttab">
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
      </div>
      <?php } ?>
      <!-- latesttab end -->
      <!-- mostviewed start -->
      <?php if($mostviewed_products){ ?>
      <div class="tab-pane" id="tab5">
         <div id="viewedtab-grid" class="bl_margin flex_height_row">
            <?php foreach ($mostviewed_products as $product) { ?>
            <div class="product-layout <?php if ($column_left || $column_right ) { ?> nth1 <?php } else { ?> nth2 <?php } ?> viewedtab <?php if ($column_left || $column_right ) { ?> col-xl-five col-lg-3 col-md-4 col-sm-4 col-xs-6 <?php } else { ?> col-xl-2 col-lg-five col-md-3 col-sm-4 col-xs-6 <?php } ?>">
               <div class="gtile-i-wrap">
                  <div class="gtile-i">
                     <div class="gtile-i-box">
                        <div class="item_viewedtab caption">
                           <div class="<?php if ($rat) { ?>raiting_thumb<?php } ?> product-thumb">
                              <div class = "box_viewedtab">
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
      </div>
      <?php } ?>
      <!-- mostviewed end -->
   </div>
</div>
<div class="clearfix"></div>
<?php if($special_products){ ?>
<script>
   $(document).ready(function () {
   var size_li_spectab = $("#specialtab-grid > div").size();
   var li_element_spectab = <?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>;
   if(li_element_spectab !=size_li_spectab){
   $( ".product-layout.specialtab:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)" ).append('<div class="gridcount specialtab"><i class="gridcount_load fa fa-refresh fa-lg"></i><span class="gridcount2"><?php echo $button_load; ?></span></div>');
   $(".product-layout.specialtab:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)").addClass("specialtab_box quickview_hidden");
   }
   $('#specialtab-grid > div:lt('+li_element_spectab+')').fadeIn('slow');
   $('.gridcount.specialtab').click(function () {
   $(this).remove();
   $('.specialtab_box.quickview_hidden').first().removeClass('quickview_hidden')
   if(li_element_spectab==size_li_spectab){
   $('.btn.btn-default.gridcount.specialtab').remove();
   }else{
   li_element_spectab = (li_element_spectab+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> <= size_li_spectab) ? li_element_spectab+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> : size_li_spectab;
   $('#specialtab-grid > div:lt('+li_element_spectab+')').fadeIn('slow');
   }
   $("#sticky_item").trigger("sticky_kit:recalc"); // пересчет affix
   });
   });
</script>
<?php } ?>
<?php if($featured_products){ ?>
<script>
   $(document).ready(function () {
   var size_litab = $("#featuredtab-grid > div").size();
   var li_elementtab = <?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>;
   if(li_elementtab !=size_litab){
   $( ".product-layout.featuredtab:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)" ).append('<div class="gridcount featuredtab"><i class="gridcount_load fa fa-refresh fa-lg"></i><span class="gridcount2"><?php echo $button_load; ?></span></div>');
   $(".product-layout.featuredtab:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)").addClass("featuredtab_box quickview_hidden");
   }
   $('#featuredtab-grid > div:lt('+li_elementtab+')').fadeIn('slow');
   $('.gridcount.featuredtab').click(function () {
   $(this).remove();
   $('.featuredtab_box.quickview_hidden').first().removeClass('quickview_hidden')
   if(li_elementtab==size_litab){
   $('.btn.btn-default.gridcount.featuredtab').remove();
   }else{
   li_elementtab = (li_elementtab+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> <= size_litab) ? li_elementtab+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> : size_litab;
   $('#featuredtab-grid > div:lt('+li_elementtab+')').fadeIn('slow');
   }
   $("#sticky_item").trigger("sticky_kit:recalc"); // пересчет affix
   });
   });
</script>
<?php } ?>
<?php if($bestseller_products){ ?>
<script>
   $(document).ready(function () {
   var size_li_besttab = $("#bestsellertab-grid > div").size();
   var li_element_besttab = <?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>;
   if(li_element_besttab !=size_li_besttab){
   $( ".product-layout.bestsellertab:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)" ).append('<div class="gridcount bestsellertab"><i class="gridcount_load fa fa-refresh fa-lg"></i><span class="gridcount2"><?php echo $button_load; ?></span></div>');
   $(".product-layout.bestsellertab:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)").addClass("bestsellertab_box quickview_hidden");
   }
   $('#bestsellertab-grid > div:lt('+li_element_besttab+')').fadeIn('slow');
   $('.gridcount.bestsellertab').click(function () {
   $(this).remove();
   $('.bestsellertab_box.quickview_hidden').first().removeClass('quickview_hidden')
   if(li_element_besttab==size_li_besttab){
   $('.btn.btn-default.gridcount.bestsellertab').remove();
   }else{
   li_element_besttab = (li_element_besttab+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> <= size_li_besttab) ? li_element_besttab+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> : size_li_besttab;
   $('#bestsellertab-grid > div:lt('+li_element_besttab+')').fadeIn('slow');
   }
   $("#sticky_item").trigger("sticky_kit:recalc"); // пересчет affix
   });
   });
</script>
<?php } ?>
<?php if($latest_products){ ?>
<script>
   $(document).ready(function () {
   var size_li_lattab = $("#latesttab-grid > div").size();
   var li_element_lattab = <?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>;
   if(li_element_lattab !=size_li_lattab){
   $( ".product-layout.latesttab:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)" ).append('<div class="gridcount latesttab"><i class="gridcount_load fa fa-refresh fa-lg"></i><span class="gridcount2"><?php echo $button_load; ?></span></div>');
   $(".product-layout.latesttab:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)").addClass("latesttab_box quickview_hidden");
   }
   $('#latesttab-grid > div:lt('+li_element_lattab+')').fadeIn('slow');
   $('.gridcount.latesttab').click(function () {
   $(this).remove();
   $('.latesttab_box.quickview_hidden').first().removeClass('quickview_hidden')
   if(li_element_lattab==size_li_lattab){
   $('.btn.btn-default.gridcount.latesttab').remove();
   }else{
   li_element_lattab = (li_element_lattab+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> <= size_li_lattab) ? li_element_lattab+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> : size_li_lattab;
   $('#latesttab-grid > div:lt('+li_element_lattab+')').fadeIn('slow');
   }
   $("#sticky_item").trigger("sticky_kit:recalc"); // пересчет affix
   });
   });
</script>
<?php } ?>
<?php if($mostviewed_products){ ?>
<script>
   $(document).ready(function () {
   var size_li_viewedtab = $("#viewedtab-grid > div").size();
   var li_element_viewedtab = <?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>;
   if(li_element_viewedtab !=size_li_viewedtab){
   $( ".product-layout.viewedtab:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)" ).append('<div class="gridcount viewedtab"><i class="gridcount_load fa fa-refresh fa-lg"></i><span class="gridcount2"><?php echo $button_load; ?></span></div>');
   $(".product-layout.viewedtab:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)").addClass("viewedtab_box quickview_hidden");
   }
   $('#viewedtab-grid > div:lt('+li_element_viewedtab+')').fadeIn('slow');
   $('.gridcount.viewedtab').click(function () {
   $(this).remove();
   $('.viewedtab_box.quickview_hidden').first().removeClass('quickview_hidden')
   if(li_element_viewedtab==size_li_viewedtab){
   $('.btn.btn-default.gridcount.viewedtab').remove();
   }else{
   li_element_viewedtab = (li_element_viewedtab+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> <= size_li_viewedtab) ? li_element_viewedtab+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> : size_li_viewedtab;
   $('#viewedtab-grid > div:lt('+li_element_viewedtab+')').fadeIn('slow');
   }
   $("#sticky_item").trigger("sticky_kit:recalc"); // пересчет affix
   });
   });
</script>
<?php } ?>
<script>
   //Active Tab
   $(document).ready(function() {
   $(".nav-tabs li:first").addClass("active");
   $(".tab-pane:first").addClass("active");
   });
</script>
<?php } else { ?>
<div id="product-tab">
   <ul class="nav nav-tabs mod tabshadow">
      <?php if($special_products){ ?>
      <li><a href="#tab1" data-toggle="tab"><?php echo $tab_special; ?></a></li>
      <?php } ?>
      <?php if($featured_products){ ?>
      <li><a href="#tab2" data-toggle="tab"><?php echo $tab_featured; ?></a></li>
      <?php } ?>
      <?php if($bestseller_products){ ?>
      <li><a href="#tab3" data-toggle="tab"><?php echo $tab_bestseller; ?></a></li>
      <?php } ?>
      <?php if($latest_products){ ?>
      <li><a href="#tab4" data-toggle="tab"><?php echo $tab_latest; ?></a></li>
      <?php } ?>
      <?php if($mostviewed_products){ ?>
      <li><a href="#tab5" data-toggle="tab"><?php echo $tab_mostviewed; ?></a></li>
      <?php } ?>
   </ul>
   <div class="tab-content">
      <?php if($special_products){ ?>
      <div  class="tab-pane padding-carusel" id="tab1">
         <div id="specialtab_carusel" class="swiper-container tab-container1">
            <div class="swiper-wrapper">
               <?php foreach ($special_products as $product) { ?>
               <div class="swiper-slide product-layout_carusel gtile-i-wrap">
                  <div class="gtile-i">
                     <div class="gtile-i-box">
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
                  </div>
               </div>
               <?php } ?>
            </div>
            <?php if ($navigation) { ?>
            <div class="#specialtab_carusel swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
            <div class="#specialtab_carusel swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
            <?php } ?>
         </div>
      </div>
      <?php } ?>
      <?php if($featured_products){ ?>
      <div class="tab-pane padding-carusel" id="tab2">
         <div id="featuredtab_carusel" class="swiper-container tab-container2">
            <div class="swiper-wrapper">
               <?php foreach ($featured_products as $product) { ?>
               <div class="swiper-slide product-layout_carusel gtile-i-wrap">
                  <div class="gtile-i">
                     <div class="gtile-i-box">
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
                  </div>
               </div>
               <?php } ?>
            </div>
            <?php if ($navigation) { ?>
            <div class="#featuredtab_carusel swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
            <div class="#featuredtab_carusel swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
            <?php } ?>
         </div>
      </div>
      <?php } ?>
      <?php if($bestseller_products){ ?>
      <div class="tab-pane padding-carusel" id="tab3">
         <div id="bestsellertab_carusel" class="swiper-container tab-container3">
            <div class="swiper-wrapper">
               <?php foreach ($bestseller_products as $product) { ?>
               <div class="swiper-slide product-layout_carusel gtile-i-wrap">
                  <div class="gtile-i">
                     <div class="gtile-i-box">
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
                  </div>
               </div>
               <?php } ?>
            </div>
            <?php if ($navigation) { ?>
            <div class="#bestsellertab_carusel swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
            <div class="#bestsellertab_carusel swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
            <?php } ?>
         </div>
      </div>
      <?php } ?>
      <?php if($latest_products){ ?>
      <div class="tab-pane padding-carusel" id="tab4">
         <div id="latesttab_carusel" class="swiper-container tab-container4">
            <div class="swiper-wrapper">
               <?php foreach ($latest_products as $product) { ?>
               <div class="swiper-slide product-layout_carusel gtile-i-wrap">
                  <div class="gtile-i">
                     <div class="gtile-i-box">
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
                  </div>
               </div>
               <?php } ?>
            </div>
            <?php if ($navigation) { ?>
            <div class="#latesttab_carusel swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
            <div class="#latesttab_carusel swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
            <?php } ?>
         </div>
      </div>
      <?php } ?>
      <?php if($mostviewed_products){ ?>
      <div class="tab-pane padding-carusel" id="tab5">
         <div id="mostviewedtab_carusel" class="swiper-container tab-container5">
            <div class="swiper-wrapper">
               <?php foreach ($mostviewed_products as $product) { ?>
               <div class="swiper-slide product-layout_carusel gtile-i-wrap">
                  <div class="gtile-i">
                     <div class="gtile-i-box">
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
                  </div>
               </div>
               <?php } ?>
            </div>
            <?php if ($navigation) { ?>
            <div class="#mostviewedtab_carusel swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
            <div class="#mostviewedtab_carusel swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
            <?php } ?>
         </div>
      </div>
      <?php } ?>
   </div>
</div>
<script>
   //Active Tab
   $(".nav-tabs li:first").addClass("active");
   $(".tab-pane:first").addClass("active");
</script>
<script>
   $(document).ready(function(){
   var swiper1;
   var swiper2;
   var swiper3;
   var swiper4;
   var swiper5;
   <?php if($special_products){ ?>
   swiper1 = new Swiper('.tab-container1', {
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
   nextEl: '#specialtab_carusel .swiper-button-next',
   prevEl: '#specialtab_carusel .swiper-button-prev',
   },
   <?php } ?>
   });
   <?php } ?>
   <?php if($featured_products){ ?>
   swiper2 = new Swiper('.tab-container2', {
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
   nextEl: '#featuredtab_carusel .swiper-button-next',
   prevEl: '#featuredtab_carusel .swiper-button-prev',
   },
   <?php } ?>
   });
   <?php } ?>
   <?php if($bestseller_products){ ?>
   swiper3 = new Swiper('.tab-container3', {
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
   nextEl: '#bestsellertab_carusel .swiper-button-next',
   prevEl: '#bestsellertab_carusel .swiper-button-prev',
   },
   <?php } ?>
   });
   <?php } ?>
   <?php if($latest_products){ ?>
   swiper4 = new Swiper('.tab-container4', {
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
   nextEl: '#latesttab_carusel .swiper-button-next',
   prevEl: '#latesttab_carusel .swiper-button-prev',
   },
   <?php } ?>
   });
   <?php } ?>
   <?php if($mostviewed_products){ ?>
   swiper5 = new Swiper('.tab-container5', {
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
   nextEl: '#mostviewedtab_carusel .swiper-button-next',
   prevEl: '#mostviewedtab_carusel .swiper-button-prev',
   },
   <?php } ?>
   });
   <?php } ?>
   <?php if($special_products){ ?>
   $('.nav-tabs a[href="#tab1"]').on('shown.bs.tab', function (e) {
   swiper1.update()
   <?php if ($autoplay_on) { ?>
   swiper1.autoplay.stop();
   swiper1.autoplay.start();
   <?php } ?>
   <?php if ($stophover && $autoplay_on) { ?>
   $("#specialtab_carusel").hover(function() {
   swiper1.autoplay.stop();
   }, function() {
   swiper1.autoplay.start();
   });
   <?php } ?>
   });
   <?php } ?>
   <?php if($featured_products){ ?>
   $('.nav-tabs a[href="#tab2"]').on('shown.bs.tab', function (e) {
   swiper2.update()
   <?php if ($autoplay_on) { ?>
   swiper2.autoplay.stop();
   swiper2.autoplay.start();
   <?php } ?>
   <?php if ($stophover && $autoplay_on) { ?>
   $("#featuredtab_carusel").hover(function() {
   swiper2.autoplay.stop();
   }, function() {
   swiper2.autoplay.start();
   });
   <?php } ?>
   });
   <?php } ?>
   <?php if($bestseller_products){ ?>
   $('.nav-tabs a[href="#tab3"]').on('shown.bs.tab', function (e) {
   swiper3.update()
   <?php if ($autoplay_on) { ?>
   swiper3.autoplay.stop();
   swiper3.autoplay.start();
   <?php } ?>
   <?php if ($stophover && $autoplay_on) { ?>
   $("#bestsellertab_carusel").hover(function() {
   swiper3.autoplay.stop();
   }, function() {
   swiper3.autoplay.start();
   });
   <?php } ?>
   });
   <?php } ?>
   <?php if($latest_products){ ?>
   $('.nav-tabs a[href="#tab4"]').on('shown.bs.tab', function (e) {
   swiper4.update()
   <?php if ($autoplay_on) { ?>
   swiper4.autoplay.stop();
   swiper4.autoplay.start();
   <?php } ?>
   <?php if ($stophover && $autoplay_on) { ?>
   $("#latesttab_carusel").hover(function() {
   swiper4.autoplay.stop();
   }, function() {
   swiper4.autoplay.start();
   });
   <?php } ?>
   });
   <?php } ?>
   <?php if($mostviewed_products){ ?>
   $('.nav-tabs a[href="#tab5"]').on('shown.bs.tab', function (e) {
   swiper5.update()
   <?php if ($autoplay_on) { ?>
   swiper5.autoplay.stop();
   swiper5.autoplay.start();
   <?php } ?>
   <?php if ($stophover && $autoplay_on) { ?>
   $("#mostviewedtab_carusel").hover(function() {
   swiper5.autoplay.stop();
   }, function() {
   swiper5.autoplay.start();
   });
   <?php } ?>
   <?php } ?>
   });
   });
</script>
<?php } ?>
