<?php echo $header; ?>
<div class="container">
   <div class="row">
      <div id="cont" class="col-sm-12">
         <?php echo $column_left; ?>
         <?php if ($column_left && $column_right) { ?>
         <?php $class = 'col-sm-6'; ?>
         <?php } elseif ($column_left || $column_right) { ?>
         <?php $class = 'col-sm-9'; ?>
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
            <?php if (isset($aridius_news_info)) { ?>
            <div class="content-news">
               <div class="news">
                  <h1><?php echo $heading_title; ?></h1>
                  <?php echo $description; ?>
               </div>
               <br />
               <div>
                  <?php if (!$addthis) { ?>
                  <?php if (empty($aurus_share)) { ?>
                  <!-- AddThis Button BEGIN -->
                  <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
                  <script src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                  <!-- AddThis Button END -->
                  <?php } else { ?>
                  <?php echo htmlspecialchars_decode($aurus_share);?>
                  <?php } ?>
                  <?php } ?>
               </div>
            </div>
            <?php if ($aridius_news_status_review !=1) { ?>
            <!-- Main form -->
            <form id="store-review" class="form-horizontal review_news-form">
               <?php if ($review_guest) { ?>
               <div class="review_shop"></div>
               <div class="form-group required">
                  <div class="col-sm-12">
                     <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                     <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control"/>
                  </div>
               </div>
               <div class="form-group required">
                  <div class="col-sm-12">
                     <label class="control-label" for="input-review_shop"><?php echo $entry_review; ?></label>
                     <textarea name="text" rows="5" id="input-review_shop" class="form-control"></textarea>
                  </div>
               </div>
               <?php echo $captcha; ?>
               <div class="buttons clearfix">
                  <div class="pull-right">
                     <button type="submit" data-loading-text="<?php echo $text_loading; ?>"  class="btn-cart"><?php echo $button_continue; ?></button>
                  </div>
               </div>
               <input type="hidden" name="parent" value="0">
               <?php } else { ?>
               <?php echo $text_login; ?>
               <br /><br />
               <?php } ?>
            </form>
            <!-- Echo reviews -->
            <div id="review_news"></div>
            <br />
            <?php } ?>
            <div class="clearfix"></div>
            <?php if ($aridius_news_relcarusel != '1' && $products) { ?>
            <div class="title-module"><?php echo $text_products_related; ?></div>
            <div id="related_news-grid" class="bl_margin flex_height_row">
               <?php foreach ($products as $product) { ?>
               <div class="product-layout <?php if ($column_left || $column_right ) { ?> nth1 <?php } else { ?> nth2 <?php } ?> related_news <?php if ($column_left || $column_right ) { ?> col-xl-five col-lg-3 col-md-4 col-sm-4 col-xs-6 <?php } else { ?> col-xl-2 col-lg-five col-md-3 col-sm-4 col-xs-6 <?php } ?>">
                  <div class="gtile-i-wrap">
                     <div class="gtile-i">
                        <div class="gtile-i-box">
                           <div class="item_best caption">
                              <div class="<?php if ($aridius_news_rat) { ?>raiting_thumb<?php } ?> product-thumb">
                                 <div class="box_related_news">
                                    <?php if ($aridius_news_rat) { ?>
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
                                          <?php if ($aridius_news_wish) { ?>
                                          <li>
                                             <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                             <i class="fa fa-heart"></i>
                                             <span><?php echo $button_wishlist; ?></span>
                                             </a>
                                          </li>
                                          <?php } ?>
                                          <?php if ($aridius_news_comp) { ?>
                                          <li>
                                             <a onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                             <i class="fa fa-exchange"></i>
                                             <span><?php echo $button_compare; ?></span>
                                             </a>
                                          </li>
                                          <?php } ?>
                                          <?php if ($aridius_news_quickview) { ?>
                                          <li>
                                             <a onclick="quickview_open('<?php echo $product['product_id']; ?>');">
                                             <i class="fa fa-search"></i>
                                             <span><?php echo $button_quickview; ?></span>
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
                                    <?php if ($aridius_news_rat) { ?>
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
               var size_li_best = $("#related_news-grid > div").size();
               var li_element_best  = <?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>;
               if(li_element_best !=size_li_best){
               $( ".product-layout.related_news:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)" ).append('<div class="gridcount related_news"><i class="gridcount_load fa fa-refresh fa-lg"></i><span class="gridcount2"><?php echo $button_load; ?></span></div>');
               $(".product-layout.related_news:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)").addClass("related_news_box quickview_hidden");
               }
               $('#related_news-grid > div:lt('+li_element_best+')').fadeIn('slow');
               $('.gridcount.related_news').click(function () {
               $(this).remove();
               $('.related_news_box.quickview_hidden').first().removeClass('quickview_hidden')
               if(li_element_best==size_li_best){
               $('.btn.btn-default.gridcount.related_news').remove();
               }else{
               li_element_best = (li_element_best+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>5<?php } ?> <= size_li_best) ? li_element_best+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> : size_li_best;
               $('#related_news-grid > div:lt('+li_element_best+')').fadeIn('slow');
               }
               $("#sticky_item").trigger("sticky_kit:recalc"); // пересчет affix
               });
               });
            </script>
            <?php } else { ?>
            <div id="aridius_news_carusel" class="swiper-container">
               <div class="swiper-wrapper">
                  <?php foreach ($products as $product) { ?>
                  <div class="swiper-slide product-layout_carusel">
                     <div class="caption">
                        <div class="<?php if ($aridius_news_rat) { ?>raiting_thumb<?php } ?> product-thumb">
                           <div class="box_spec">
                              <?php if ($aridius_news_rat) { ?>
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
                                    <?php if ($aridius_news_wish) { ?>
                                    <li>
                                       <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                       <i class="fa fa-heart"></i>
                                       <span><?php echo $button_wishlist; ?></span>
                                       </a>
                                    </li>
                                    <?php } ?>
                                    <?php if ($aridius_news_comp) { ?>
                                    <li>
                                       <a onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                       <i class="fa fa-exchange"></i>
                                       <span><?php echo $button_compare; ?></span>
                                       </a>
                                    </li>
                                    <?php } ?>
                                    <?php if ($aridius_news_quickview) { ?>
                                    <li>
                                       <a onclick="quickview_open('<?php echo $product['product_id']; ?>');">
                                       <i class="fa fa-search"></i>
                                       <span><?php echo $button_quickview; ?></span>
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
                              <?php if ($aridius_news_rat) { ?>
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
               <?php if ($aridius_news_relnavigation) { ?>
               <div class="#aridius_news_carusel swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
               <div class="#aridius_news_carusel swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
               <?php } ?>
            </div>
            <script><!--
               $(document).ready(function () {
               var ocSwiper = new Swiper('#aridius_news_carusel.swiper-container', {
               slidesPerView: <?php echo $aridius_news_relitems; ?>,
               mode: 'horizontal',
               pagination: false,
               speed: <?php echo $aridius_news_relrew_speed; ?>,
               <?php if ($aridius_news_relautoplay_on) { ?>
               autoplay: {delay: <?php echo $aridius_news_relautoplay; ?>},
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
               <?php if ($aridius_news_relnavigation) { ?>
               navigation: {
               nextEl: '#aridius_news_carusel .swiper-button-next',
               prevEl: '#aridius_news_carusel .swiper-button-prev',
               },
               <?php } ?>
               });
               <?php if ($aridius_news_relstophover && $aridius_news_relautoplay_on) { ?>
               $("#aridius_news_carusel.swiper-container").hover(function() {
               ocSwiper.autoplay.stop();
               }, function() {
               ocSwiper.autoplay.start();
               });
               <?php } ?>
               });
               -->
            </script>
            <?php } ?>
            <?php if ($aridius_news) { ?>
            <div class="title-module"><?php echo $text_aridius_news_related; ?></div>
            <div id="carusel_news" class="swiper-container">
               <div class="swiper-wrapper">
                  <?php foreach ($aridius_news as $new) { ?>
                  <div class="swiper-slide product-layout_carusel">
                     <div class="gtile-i-wrap similar_news">
                        <div class="gtile-i similar_news">
                           <div class="item_similar_news caption">
                              <div class="box_similar_news">
                                 <div class="product-thumb transition">
                                    <div class="image fixnewsgrid"><a href="<?php echo $new['href']; ?>"><img  src="<?php echo $new['image']; ?>" alt="" title="" class="img-responsive" /></a></div>
                                    <div class="caption">
                                       <?php if (!$aridius_news_show_date) { ?>
                                       <i class="fa fa-clock-o"></i> <span class="posted-aridius_news"><?php echo $new['posted']; ?></span>
                                       <?php } ?>
                                       <div class="product-name"><a href="<?php echo $new['href']; ?>"><?php echo $new['title']; ?></a></div>
                                       <p class="newsdesc"><?php echo $new['description']; ?></p>
                                       <p class="news_link"><a href="<?php echo $new['href']; ?>"><i class="fa fa-link"></i> <span class ="morecolor"><?php echo $text_more; ?></span></a></p>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <?php } ?>
               </div>
               <div class="#carusel_news swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
               <div class="#carusel_news swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
            </div>
            <div class="clearfix"></div>
            <script><!--
               $(document).ready(function () {
               var ocSwiper = new Swiper('#carusel_news.swiper-container', {
               slidesPerView: 4,
               pagination: false,
               autoplay: false,
               breakpoints: {
               768: {
               slidesPerView: 2,
               },
               992: {
               slidesPerView: 2,
               },
               1200: {
               slidesPerView: <?php if ($column_left || $column_right ) { ?> 2 <?php } else { ?> 3 <?php } ?>,
               },
               1600: {
               slidesPerView: <?php if ($column_left || $column_right ) { ?> 3 <?php } else { ?> 4 <?php } ?>,
               }
               },
               navigation: {
               nextEl: '#carusel_news .swiper-button-next',
               prevEl: '#carusel_news .swiper-button-prev',
               },
               });
               });
               -->
            </script>
            <?php } ?>
            <div class="buttons">
               <div class="pull-right"><a href="<?php echo $aridius_newslist; ?>" class="btn-cart"><?php echo $button_news; ?></a></div>
               <br /><br />
            </div>
         </div>
         <?php } elseif (isset($aridius_news_data)) { ?>
         <h1><?php echo $heading_title; ?></h1>
         <div class="clearfix">	</div>
         <div class="row catfl">
            <div class="col-sm-3">
               <div class="btn-group hidden-xs">
                  <button type="button" id="list-view" class="btn btn-default2" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                  <button type="button" id="grid-view" class="btn btn-default2" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
               </div>
            </div>
            <div class="col-sm-9">
               <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 navright">
                  <div class="form-group input-group input-group-sm">
                     <label class="input-group-addon" for="input-sort"><i class="fa fa-sort"></i> <?php echo $text_sort; ?></label>
                     <select id="input-sort" class="form-control" onchange="location = this.value;">
                        <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                     </select>
                  </div>
               </div>
            </div>
         </div>
         <br />
         <div class="row flex_height_row">
            <?php foreach ($aridius_news_data as $aridius_news) { ?>
            <!-- grid -->
            <div class="product-layout_cat product-list col-xs-12">
               <div class="product-thumb">
                  <div class="image image_news"><a href="<?php echo $aridius_news['href']; ?>" title="<?php echo $aridius_news['title']; ?>"><img src="<?php echo $aridius_news['thumb']; ?>" alt="<?php echo $aridius_news['title']; ?>" class="img-responsive" /></a>	</div>
                  <div>
                     <div class="item_news caption caption-left">
                        <?php if (!$aridius_news_show_date) { ?>
                        <i class="fa fa-clock-o"></i> <span class="posted-aridius_news"><?php echo $aridius_news['posted']; ?></span>
                        <?php } ?>
                        <div class="product-name"><a href="<?php echo $aridius_news['href']; ?>"><?php echo $aridius_news['title']; ?></a></div>
                        <p class="newsdesc"><?php echo $aridius_news['description']; ?></p>
                        <p class="news_link"><a href="<?php echo $aridius_news['href']; ?>"><i class="fa fa-link"></i> <span class ="morecolor"><?php echo $text_more; ?></span></a></p>
                     </div>
                  </div>
               </div>
            </div>
            <!-- grid END-->
            <?php } ?>
         </div>
         <div class="clearfix"></div>
         <div class="row">
            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
            <div class="col-sm-6 text-right"><?php echo $results; ?></div>
         </div>
         <?php } ?>
         <?php echo $content_bottom; ?>
      </div>
      <?php echo $column_right; ?>
   </div>
</div>
</div>
<?php if (!isset($aridius_news_data)) { ?>
<script><!--
   $('#review_news').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   $('#review_news').fadeOut('slow');
   $('#review_news').load(this.href);
   $('#review_news').fadeIn('slow');
   });
   $('#review_news').load('index.php?route=information/aridius_news/review&aridius_news_id=<?php echo $aridius_news_id; ?>');
   $(document).on('submit','form.review_news-form',function(e){
   e.preventDefault();
   var $this=$(this);
   $.ajax({
   url: 'index.php?route=information/aridius_news/write&aridius_news_id=<?php echo $aridius_news_id; ?>',
   type: 'post',
   dataType: 'json',
   data: $this.serialize(),
   beforeSend: function () {
   $this.find('.button-review').button('loading');
   },
   complete: function () {
   $this.find('.button-review').button('reset');
   },
   success: function (json) {
   $('.alert-success, .alert-danger').remove();
   if (json['error']) {
   $this.find('.review_shop').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
   }
   if (json['success']) {
   $this.find('.review_shop').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
   $this.find('input[name=\'name\']').val('');
   $this.find('textarea[name=\'text\']').val('');
   $this.find('input[name=\'rating\']:checked').prop('checked', false);
   setTimeout(function(){ $('.reply-form').remove();},3000)
   }
   }
   });
   });
   $(document).on('click', '.cancel-review', function () {
   $('.reply-form').remove();
   });
   $(document).on('click', '.comment-reply', function () {
   var $this=$(this);
   $.post( "index.php?route=information/aridius_news/reply", { parent: $this.attr("data-parent") }, function( data ) {
   $('.reply-form').remove();
   $this.parent().append('<div class="reply-form">' + data.html + '</div>');
   }, "json");
   });
   //-->
</script>
<?php } ?>
<?php echo $footer; ?>
