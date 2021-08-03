<?php echo $header; ?>
<div class="container">
   <div class="row">
      <?php echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-8 col-lg-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      <div id="content" class="<?php echo $class; ?>">
         <?php echo $content_top; ?>
         <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
            <li><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { ?><?php echo $breadcrumb['text']; ?><?php } ?></li>
            <?php } ?>
         </ul>
         <h1><?php echo $heading_title; ?></h1>
         <?php if ($description) { ?>
         <div class="row">
            <?php if ($thumb) { ?>
            <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
            <?php } ?>
            <?php if ($description) { ?>
            <div class="col-sm-10"><?php echo $description; ?></div>
            <?php } ?>
         </div>
         <hr>
         <?php } ?>
         <?php if ($products) { ?>
         <div class="clearfix">	</div>
         <div class="row rowf catfl">
            <div class="col-sm-3">
               <div class="btn-group hidden-xs">
                  <button type="button" id="list-view" class="btn btn-default2" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                  <button type="button" id="grid-view" class="btn btn-default2" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
               </div>
            </div>
            <div class="col-sm-9">
               <div class="col-xs-12 col-sm-7 col-md-5 col-lg-5 navright">
                  <?php if ($aurus_sort_cat !=1) { ?>
                  <div class="form-group input-group input-group-sm">
                     <label class="input-group-addon" for="input-sort"><i class="fa fa-sort"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_sort; ?></span></label>
                     <select id="input-sort" class="form-control" onchange="location = this.value;">
                        <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                     </select>
                  </div>
                  <?php } ?>
               </div>
               <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4 navright">
                  <?php if ($aurus_count_cat !=1) { ?>
                  <div class="form-group input-group input-group-sm">
                     <label class="input-group-addon" for="input-limit"><i class="fa fa-eye"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_limit; ?></span></label>
                     <select id="input-limit" class="form-control" onchange="location = this.value;">
                        <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                     </select>
                  </div>
                  <?php } ?>
               </div>
            </div>
         </div>
         <br />
         <div class="row rowf flex_height_row">
            <?php foreach ($products as $product) { ?>
            <div class=" product-layout_cat product-list col-xs-12 ">
               <div class="gtile-i-wrap">
                  <div class="gtile-i">
                     <div class="gtile-i-box">
                        <div class="item_cat caption">
                           <div class="<?php if ($aurus_rating_cat !=1) { ?>raiting_thumb<?php } ?> product-thumb">
                              <?php if ($aurus_rating_cat !=1) { ?>
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
                                    <?php if ($aurus_wishlist_cat !=1) { ?>
                                    <li>
                                       <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                       <i class="fa fa-heart"></i>
                                       <span><?php echo $button_wishlist; ?></span>
                                       </a>
                                    </li>
                                    <?php } ?>
                                    <?php if ($aurus_compare_cat !=1) { ?>
                                    <li>
                                       <a onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                       <i class="fa fa-exchange"></i>
                                       <span><?php echo $button_compare; ?></span>
                                       </a>
                                    </li>
                                    <?php } ?>
                                    <?php if ($aridius_qckview_status) { ?>
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
                              <?php if ($aurus_rating_cat !=1) { ?>
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
                              <div class="product-name">
                                 <a href="<?php echo $product['href']; ?>">
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
								 <?php if ((!$aurus_description_cat) || ($product['attribute'] && !$aurus_atr_cat)) { ?>
                                 <div class="boxadd">
                                    <?php if (!$aurus_description_cat) { ?>
                                    <div class="<?php if ($aurus_description_catsm) { ?>desc_hide <?php } else { ?>desc_show <?php } ?>">
                                       <p><?php echo $product['description']; ?></p>
                                    </div>
                                    <?php } ?>
                                    <?php if($product['attribute'] && !$aurus_atr_cat) { ?>
                                    <div class="<?php if ($aurus_atr_catsm) { ?>atr_hide <?php } else { ?>atr_show <?php } ?>">
                                       <hr>
                                       <div class="attribute_cat">
                                          <?php $v = 0 ?>
                                          <?php foreach($product['attribute'] as $attribute_group) { ?>
                                          <?php foreach($attribute_group['attribute'] as $key => $attribute) { ?>
                                          <?php $v++; ?>
                                          <?php if($v > $aurus_limit_atr) break; ?>
                                          <?php echo $attribute['name']; ?> - <?php echo $attribute['text']; ?> <?php if($v < $aurus_limit_atr  ) { ?>  / <?php } ?>
                                          <?php } ?>
                                          <?php if($v > $aurus_limit_atr) break; ?>
                                          <?php } ?>
                                       </div>
                                    </div>
                                    <?php } ?>
                                 </div>
								 <?php } ?>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <?php } ?>
         </div>
         <div class="row pag_res">
            <div class="col-sm-7 text-left"><?php echo $pagination; ?></div>
            <div class="col-sm-5 text-right"><?php echo $results; ?></div>
         </div>
         <?php }  else { ?>
         <p><?php echo $text_empty; ?></p>
         <div class="buttons">
            <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn-cart"><?php echo $button_continue; ?></a></div>
         </div>
         <?php } ?>
         <?php echo $content_bottom; ?>
      </div>
      <?php echo $column_right; ?>
   </div>
</div>
<?php echo $footer; ?>
