<?php echo $header; ?>
<div class="container">
<div class="row">
<?php echo $column_left; ?>
<?php if ($column_left) { ?>
<?php $class = 'fix_cl_pr col-md-9'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?>
<div id="cont" class="<?php echo $class; ?>" itemscope itemtype="http://schema.org/Product">
<div class="col-xs-12">
   <div class="bread_scroll">
      <ul class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
         <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
         <?php if($i==0) { ?>
         <li class="tab_mob_grandchild"><a href="<?php echo $breadcrumb['href']; ?>" class="current-link"><?php echo $breadcrumb['text'];?></a></li>
         <?php } else if($i+1<count($breadcrumbs)) { ?>
         <li class="tab_mob_grandchild" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
            <a href="<?php echo $breadcrumb['href']; ?>" itemprop="item" itemscope itemtype="https://schema.org/Thing" itemid="<?php echo $breadcrumb['href']; ?>" title="<?php echo $breadcrumb['text'];?>"><span itemprop="name"> <?php echo $breadcrumb['text'];?></span></a>
            <meta itemprop="position" content="<?php echo $i; ?>">
         </li>
         <?php } else { ?>
         <li class="tab_mob_grandchild" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
            <span itemprop="item" itemscope itemtype="https://schema.org/Thing" itemid="<?php echo $breadcrumb['href']; ?>" title="<?php echo $breadcrumb['text'];?>"><span itemprop="name"> <?php echo $breadcrumb['text'];?></span></span>
            <meta itemprop="position" content="<?php echo $i; ?>">
         </li>
         <?php } ?>
         <?php } ?>
      </ul>
   </div>
   <h1 class="pr_h1" itemprop="name"><?php echo $heading_title; ?></h1>
   <?php if ($aurus_st_cart !=1 ) { ?>  
   <div class="st_cart">
      <div class="col-xs-12">
         <div class="hidden-xs hidden-sm col-md-1">
            <img class="img_bot img-responsive" src="<?php echo $thumb_clone; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
         </div>
         <div class="title_bot hidden-xs col-xs-5 col-sm-4 col-md-4">
            <?php echo $heading_title; ?>
         </div>
         <div class="price_bot col-xs-6 col-sm-3 col-md-3">
            <?php if (!$special) { ?>
            <span class="price-new"><?php echo $price; ?></span>
            <?php } else { ?>
            <span class="price-new"><?php echo $special; ?></span><span class="price-old"><?php echo $price; ?></span>
            <?php } ?>
         </div>
         <div class="cart_bot col-xs-6 col-sm-5 col-md-4">
            <?php if ($quantity <= 0 && $aridiusinstock_status ) { ?>
            <button type="button" class="btn-instock" onclick="instock.add('<?php echo $product_id; ?>');" data-product-id="<?php echo $product_id; ?>"><?php echo $button_instock; ?></button>
            <?php } else { ?>
            <button type="button" id="button-cart_st2" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart product"><i class="fa fa-shopping-cart hidden-xs"></i> <?php echo $button_cart; ?></button>
            <?php if ($aridiusfastorder_status) { ?>
            <button type="button" id="fast-order3" class="btn-cart"><i class="fa fa-clock-o hidden-xs"></i> <?php echo $button_titlef; ?></button>
            <?php } ?>
            <?php } ?>
         </div>
      </div>
   </div>
   <?php } ?>
   <?php if ($review_status && $aurus_rating_pr !=1) { ?>
   <div class="linetoppr">
      <div class="rating">
         <p>
            <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($rating < $i) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } ?>
            <?php } ?>
            <a class="review_profile" style="padding-bottom: 4px;" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;">&nbsp;&nbsp;<?php echo $reviews; ?></a> <span>/</span> <a class="review_profile" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
            <?php if ($rating) { ?>
            <span itemprop="aggregateRating" itemscope itemtype = "http://schema.org/AggregateRating">
               <meta itemprop='ratingValue' content='<?php echo $rating; ?>' />
               <meta itemprop='bestRating' content='5' />
               <meta itemprop='worstRating' content='1' />
               <meta itemprop="reviewCount" content="<?php echo rtrim(preg_replace("/[^0-9\.]/", "", ($reviews)), '.'); ?>" />
            </span>
            <?php } ?>
         </p>
      </div>
   </div>
   <?php } ?>
   <div id="nav_pr">
      <ul class="nav_pr nav nav-tabs mod">
         <li class="active">
            <a href="#tab-product" data-toggle="tab">
            <?php echo $text_tabb_main; ?>
            </a>
         </li>
         <?php if ($attribute_groups) { ?>
         <li>
            <a href="#tab-specification" data-toggle="tab">
            <?php echo $tab_attribute; ?>
            </a>
         </li>
         <?php } ?>
         <?php if ($images && $aurus_show_tab_img !=1) { ?>			 
         <li>
            <a href="#tab-image" data-toggle="tab">
            <?php echo $tab_images; ?>
            </a>
         </li>
         <?php } ?>	 
         <?php if ($review_status) { ?>
         <li>
            <a href="#tab-review" data-toggle="tab">
            <?php echo $tab_review; ?>
            </a>
         </li>
         <?php } ?>
         <?php if ($aurus_relpr_tab ==1) { ?>
         <li>
            <a href="#tab-relpr" data-toggle="tab">
            <?php echo $text_related2; ?>
            </a>
         </li>
         <?php } ?>
		 
		 
         <?php if ($custom_tabs) { ?>
         <?php foreach ($custom_tabs as $key => $custom_tab) { ?>
         <?php if ($custom_tab['title']) { ?>
         <li>
            <a href="#tab-custom-<?php echo $key ?>" data-toggle="tab">
            <?php echo $custom_tab['title']; ?> 
            </a>
         </li>
         <?php } ?>
         <?php } ?>
         <?php } ?>
		 
		 
         <?php if ($aurus_top_links7 ) { ?>
         <?php foreach ($aurus_top_links7 as $key => $aurus_top_link7) { ?>
         <?php if ($aurus_top_link7['title'][$language_id]) { ?>
         <li>
            <a href="#tab-add-<?php echo $key ?>" data-toggle="tab">
            <?php echo $aurus_top_link7['title'][$language_id]; ?>
            </a>
         </li>
         <?php } ?>
         <?php } ?>
         <?php } ?>
		 
		 
		 
      </ul>
   </div>
</div>
<?php if ($column_left) { ?>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
<?php } else { ?>
<div class="change_col col-xs-12">
   <?php } ?>
   <?php echo $content_top; ?>
   <div class="tab-content">
      <div class="tab-pane active" id="tab-product">
         <?php if ($column_left) { ?>
         <!-- main img -->
         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-7 stp">
            <?php } else { ?>
            <!-- main img -->
            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 stp">
               <?php } ?>
               <?php if ($aurus_imageadd_vertical ==0) { ?>			  
               <?php if ($thumb || $images) { ?>
               <div class="gallary-wrapper">
                  <?php if ($options || $images) { ?>	
                  <div class="rowimg">
                     <div id="image-additional2">
                        <?php if ($aurus_imageadd_nav ==0) { ?>							
                        <div class="add_img swiper-button-prev"><i class="fa fa-chevron-left fa-4x"></i></div>
                        <?php } ?>
                        <div id="additional" class="swiper-container">
                           <div class="swiper-wrapper">
                              <?php if ($thumb && $images || $options) { ?>
                              <div class="image-additional swiper-slide">
                                 <img src="<?php echo $thumb_add; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" >
                              </div>
                              <?php } ?>
                              <?php if ($images) { ?>
                              <?php foreach ($images as $image) { ?>
                              <div class="image-additional swiper-slide">
                                 <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                              </div>
                              <?php } ?>
                              <?php } ?> 
                              <?php if ($options && $aurus_options_mainimg ==0) { ?>
                              <?php foreach ($options as $option) { ?>
                              <?php foreach ($option['product_option_value'] as $option_value) { ?>
                              <?php if($option_value['image_opt_additional'] || $option_value['image']) { ?>
                              <div class="image-additional swiper-slide">
                                 <?php if($option_value['image_opt_additional']) { ?>
                                 <img src="<?php echo $option_value['image_opt_additional']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                 <?php } else { ?>
                                 <img src="<?php echo $option_value['opt_additional']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                 <?php } ?>
                              </div>
                              <?php } ?>
                              <?php } ?>
                              <?php } ?>
                              <?php } ?>
                           </div>
                        </div>
                        <?php if ($aurus_imageadd_nav ==0) { ?>
                        <div class="add_img swiper-button-next"><i class="fa fa-chevron-right fa-4x"></i></div>
                        <?php } ?>
                     </div>
                  </div>
                  <?php } ?>
                  <div class="thumbnails demo-gallery swiper-container">
                     <div class="positionsticker">
                        <!-- special -->
                        <?php if ($aurus_sticker_sale_product_auto !=1 && $special && $aurus_show_stsale == 0) { ?>
                        <div class="stickers-special"><span class="diamont_st">-<?php echo $saving_product; ?>%</span></div>
                        <?php } ?>
                        <!-- special END -->
                        <!-- new -->	
                        <?php
                           $startDate1 = strtotime(mb_substr($dateadded, 0, 10));
                           $endDate2 = strtotime(date("Y-m-d"));
                           $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
                           ?>
                        <?php if($aurus_sticker_new_product_auto !=1 && $days < $aurus_sticker_product_new_day) { ?>
                        <div class="stickers-new"><span class="diamont_st"><?php echo $aurus_name_sticker_product_new[$language_id]; ?></span></div>
                        <?php } ?>
                        <!-- new END -->	
                        <!-- top -->
                        <?php if ($aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 1 && $rating == $aurus_sticker_product_top_rating || $aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 2 && $viewed >  $aurus_sticker_product_top_viewed) { ?> 
                        <div class="stickers-top"><span class="diamont_st"><?php echo $aurus_name_sticker_product_top[$language_id]; ?></span></div>
                        <?php } ?>
                        <!-- top END -->
                        <?php if ($stickers2) { ?>
                        <?php foreach ($stickers2 as $sticker2) { ?>
                        <div class="stickers-all" style="color:<?php echo $sticker2['color']; ?>;background:<?php echo $sticker2['background']; ?>;"><?php echo $sticker2['name']; ?></div>
                        <?php } ?>
                        <?php } ?>
                     </div>
                     <ul class="swiper-wrapper">
                        <?php if ($thumb) { ?>
                        <li class="swiper-slide"><span class="thumbnail imglink gallery_img_main">
                           <img id="main-image" class="main-image" itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $popup; ?>" /></span>
                        </li>
                        <?php } ?>
                        <?php if ($images) { ?>
                        <?php foreach ($images as $image) { ?>
                        <li class="swiper-slide">
                           <span class="thumbnail imglink gallery_img_main">
                           <img class="main-image" src="<?php echo $image['thumb2']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $image['popup']; ?>" />
                           </span>
                        </li>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($options && $aurus_options_mainimg ==0) { ?>
                        <?php foreach ($options as $option) { ?>
                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                        <?php if($option_value['image_opt_additional'] || $option_value['image']) { ?>
                        <li class="swiper-slide">
                           <?php if($option_value['image_opt']) { ?>
                           <span class="thumbnail imglink gallery_img_main">
                           <img class="main-image" src="<?php echo $option_value['image_opt']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $option_value['image_opt_popup']; ?>" />
                           </span>
                           <?php } else { ?>
                           <span class="thumbnail imglink gallery_img_main">
                           <img class="main-image" src="<?php echo $option_value['opt_thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $option_value['popup']; ?>" />
                           </span>
                           <?php } ?>
                        </li>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                     </ul>
                     <div class="main_img swiper-pagination"></div>
                  </div>
               </div>
               <?php } ?>
               <?php } else { ?>			  
               <?php if ($thumb || $images) { ?>
               <div class="gallary-wrapper">
                  <?php if ($options || $images) { ?>	
                  <?php } ?>
                  <div class="thumbnails demo-gallery swiper-container">
                     <div class="positionsticker">
                        <!-- special -->
                        <?php if ($aurus_sticker_sale_product_auto !=1 && $special && $aurus_show_stsale == 0) { ?>
                        <div class="stickers-special"><span class="diamont_st">-<?php echo $saving_product; ?>%</span></div>
                        <?php } ?>
                        <!-- special END -->
                        <!-- new -->	
                        <?php
                           $startDate1 = strtotime(mb_substr($dateadded, 0, 10));
                           $endDate2 = strtotime(date("Y-m-d"));
                           $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
                           ?>
                        <?php if($aurus_sticker_new_product_auto !=1 && $days < $aurus_sticker_product_new_day) { ?>
                        <div class="stickers-new"><span class="diamont_st"><?php echo $aurus_name_sticker_product_new[$language_id]; ?></span></div>
                        <?php } ?>
                        <!-- new END -->	
                        <!-- top -->
                        <?php if ($aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 1 && $rating == $aurus_sticker_product_top_rating || $aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 2 && $viewed >  $aurus_sticker_product_top_viewed) { ?> 
                        <div class="stickers-top"><span class="diamont_st"><?php echo $aurus_name_sticker_product_top[$language_id]; ?></span></div>
                        <?php } ?>
                        <!-- top END -->
                        <?php if ($stickers2) { ?>
                        <?php foreach ($stickers2 as $sticker2) { ?>
                        <div class="stickers-all" style="color:<?php echo $sticker2['color']; ?>;background:<?php echo $sticker2['background']; ?>;"><?php echo $sticker2['name']; ?></div>
                        <?php } ?>
                        <?php } ?>
                     </div>
                     <ul class="swiper-wrapper">
                        <?php if ($thumb) { ?>
                        <li class="swiper-slide"><span class="thumbnail imglink gallery_img_main">
                           <img id="main-image" class="main-image" itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $popup; ?>" /></span>
                        </li>
                        <?php } ?>
                        <?php if ($images) { ?>
                        <?php foreach ($images as $image) { ?>
                        <li class="swiper-slide">
                           <span class="thumbnail imglink gallery_img_main">
                           <img class="main-image" src="<?php echo $image['thumb2']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $image['popup']; ?>" />
                           </span>
                        </li>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($options && $aurus_options_mainimg ==0) { ?>
                        <?php foreach ($options as $option) { ?>
                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                        <?php if($option_value['image_opt_additional'] || $option_value['image']) { ?>
                        <li class="swiper-slide">
                           <?php if($option_value['image_opt']) { ?>
                           <span class="thumbnail imglink gallery_img_main">
                           <img class="main-image" src="<?php echo $option_value['image_opt']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $option_value['image_opt_popup']; ?>" />
                           </span>
                           <?php } else { ?>
                           <span class="thumbnail imglink gallery_img_main">
                           <img class="main-image" src="<?php echo $option_value['opt_thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $option_value['popup']; ?>" />
                           </span>
                           <?php } ?>
                        </li>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                     </ul>
                     <div class="main_img swiper-pagination"></div>
                     <div id="additional" class="additional_v swiper-container">
                        <div class="swiper-wrapper">
                           <?php if ($thumb && $images || $options) { ?>
                           <div class="image-additional swiper-slide">
                              <img src="<?php echo $thumb_add; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" >
                           </div>
                           <?php } ?>
                           <?php if ($images) { ?>
                           <?php foreach ($images as $image) { ?>
                           <div class="image-additional swiper-slide">
                              <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                           </div>
                           <?php } ?>
                           <?php } ?> 
                           <?php if ($options && $aurus_options_mainimg ==0) { ?>
                           <?php foreach ($options as $option) { ?>
                           <?php foreach ($option['product_option_value'] as $option_value) { ?>
                           <?php if($option_value['image_opt_additional'] || $option_value['image']) { ?>
                           <div class="image-additional swiper-slide">
                              <?php if($option_value['image_opt_additional']) { ?>
                              <img src="<?php echo $option_value['image_opt_additional']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                              <?php } else { ?>
                              <img src="<?php echo $option_value['opt_additional']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                              <?php } ?>
                           </div>
                           <?php } ?>
                           <?php } ?>
                           <?php } ?>
                           <?php } ?>
                        </div>
                        <?php if ($aurus_imageadd_nav ==0) { ?>
                        <div class="add_img_v2 swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
                        <div class="add_img_v2 swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
                        <?php } ?>
                     </div>
                  </div>
               </div>
               <?php } ?>
               <?php } ?>			  
               <?php if ($aurus_show_attribute !=1 && $aurus_attribute_line !=1 ) { ?>
               <?php if ($attribute_groups) { ?>
               <hr>
               <div class="row attribute_groups attr_shot">
                  <?php $v = 0; ?>
                  <?php foreach ($attribute_groups as $attribute_group) { ?>
                  <?php if ($v < $aurus_attribute_see) { ?>
                  <?php echo $attribute_group['name']; ?>:
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <?php if ($v < $aurus_attribute_see) { ?>
                  <?php echo $attribute['name']; ?> - <?php echo $attribute['text']; ?> <?php if($v < $aurus_attribute_see  ) { ?>  / <?php } ?>
                  <?php } ?>
                  <?php $v++ ?>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                  <?php $v++ ?>
                  <a class="specification_profile" href="" onclick="$('a[href=\'#tab-specification\']').trigger('click'); return false;"><?php echo $aurus_pr_attribute_seeall[$language_id]; ?></a>
               </div>
               <?php } ?>
               <?php } ?>
               <?php if ($aurus_show_attribute !=1 && $aurus_attribute_line ==1) { ?>
               <?php if ($attribute_groups) { ?>
               <hr>
               <div class="row attribute_groups attr_shot">
                  <?php $v = 0; ?>
                  <?php foreach ($attribute_groups as $attribute_group) { ?>
                  <?php if ($v < $aurus_attribute_see) { ?>
                  <span class ="atr_name"><?php echo $attribute_group['name']; ?>:</span>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <?php if ($v < $aurus_attribute_see) { ?>
                  <ul class="atr">
                     <li><span><?php echo $attribute['name']; ?></span> <span><?php echo $attribute['text']; ?></span></li>
                  </ul>
                  <?php } ?>
                  <?php $v++ ?>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                  <?php $v++ ?>
                  <a class="specification_profile" href="" onclick="$('a[href=\'#tab-specification\']').trigger('click'); return false;"><?php echo $aurus_pr_attribute_seeall[$language_id]; ?></a>
               </div>
               <?php } ?>
               <?php } ?>
            </div>
            <?php if ($column_left) { ?>
            <!-- main box -->
            <div class="box-prinfo col-xs-12 col-sm-12 col-md-12 col-lg-5">
               <?php } else { ?>
               <!-- main box -->
               <div class="box-prinfo col-xs-12 col-sm-5 col-md-5 col-lg-5">
                  <?php } ?>
                  <ul class="list-unstyled taxp2">
                     <?php if ($manufacturer && $aurus_man !=1 ) { ?>
                     <?php if ($aurus_product_man_img !=1) { ?>
                     <li><a href="<?php echo $manufacturers; ?>">
                        <?php if( isset($manufacturer_img) ) { ?>
                        <img  class="pull-right hidden-sm" src="<?php echo $manufacturer_img ; ?>" alt="<?php echo $manufacturer; ?>" title="<?php echo $manufacturer; ?>">
                        <?php } ?>
                        </a>
                     </li>
                     <?php } ?>
                     <li><span><?php echo $text_manufacturer; ?></span>&nbsp;&nbsp;<a itemprop="manufacturer" href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                     <li><meta itemprop="brand" content="<?php echo $manufacturer; ?>"></li>
                     <?php } ?>
					<?php if ($sku) { ?>
					<li><meta itemprop="sku" content="<?php echo $sku; ?>"></li>
					<?php } else { ?>
					<li><meta itemprop="sku" content="<?php echo $model; ?>"></li>
					<?php } ?>
					<?php if ($mpn) { ?>
					<li><meta itemprop="mpn" content="<?php echo $mpn; ?>"></li>
					<?php } ?>	
                     <?php if ($aurus_product_stock !=1 ) { ?>
                     <li><?php echo $text_stock; ?>&nbsp;&nbsp;<?php echo ($quantity > 0) ? '<span class = "rewardin">'. $stock .'</span>' : '<span class = "rewardoff">'. $stock .'</span>'; ?></li>
                     <?php } ?>
                     <?php if ($aurus_product_kod_tovara !=1) { ?>
                     <li><span><?php echo $text_model; ?></span>&nbsp;&nbsp;<span itemprop="model"><?php echo $model; ?></span></li>
                     <?php } ?>
                     <?php if ($reward) { ?>
                     <li><span><?php echo $text_reward; ?></span>&nbsp;&nbsp;<?php echo $reward; ?></li>
                     <?php } ?>
                     <?php if ($length && $width && $height && $aurus_product_size !=1 ) { ?>
                     <li><?php if ($length > 0) { ?><?php echo $text_lengthp; ?> <?php echo $length; ?> <?php if (($length > 0 && $width > 0)||($length > 0 && $height > 0)) { ?>x<?php } ?> <?php } ?><?php if ($width > 0) { ?><?php echo $text_widthp; ?> <?php echo $width; ?> <?php if ($width > 0 && $height > 0) { ?>x<?php } ?> <?php } ?><?php if ($height > 0) { ?><?php echo $text_heightp; ?> <?php echo $height; ?><?php } ?></li>
                     <?php } ?>
                     <?php if ($weight > 0 && $aurus_product_weight !=1 ) { ?>
                     <li><?php echo $text_weightp; ?> <?php echo $weight; ?></li>
                     <?php } ?>
                     <?php if ($aurus_product_show_sku !=1) { ?>
                     <li><?php if ($sku) { echo $aurus_product_sku[$language_id]; } ?> <?php echo $sku; ?></li>
                     <?php } ?>
                     <?php if ($aurus_product_show_upc !=1) { ?>
                     <li><?php if ($upc) { echo $aurus_product_upc[$language_id]; } ?> <?php echo $upc; ?></li>
                     <?php } ?>
                     <?php if ($aurus_product_show_ean !=1) { ?>
                     <li><?php if ($ean) { echo $aurus_product_ean[$language_id]; } ?> <?php echo $ean; ?></li>
                     <?php } ?>
                     <?php if ($aurus_product_show_jan !=1) { ?>
                     <li><?php if ($jan) { echo $aurus_product_jan[$language_id]; } ?> <?php echo $jan; ?></li>
                     <?php } ?>
                     <?php if ($aurus_product_show_isbn !=1) { ?>
                     <li><?php if ($isbn) { echo $aurus_product_isbn[$language_id]; } ?> <?php echo $isbn; ?></li>
                     <?php } ?>
                     <?php if ($aurus_product_show_mpn !=1) { ?>
                     <li><?php if ($mpn) { echo $aurus_product_mpn[$language_id]; } ?> <?php echo $mpn; ?></li>
                     <?php } ?>
                     <!-- aridius_size -->
                     <?php if ($aurus_show_tablsize !=1) { ?>
                     <div class="aridius_size">
                        <li> <?php echo $aridius_size; ?></li>
                     </div>
                     <?php } ?>
                     <!-- aridius_size end-->
                  </ul>
                  <?php if ($aurus_short_desc !=1 ) { ?>
                  <div class="description2">
                     <?php echo $description2; ?><a class="anchor_desc" href="#yakor_desc"><?php echo $text_description2; ?></a>
                  </div>
                  <?php } ?>
                  <?php if (($special && $special_date_end > $special_date_start)&&($aurus_product_timer !=1)) { ?>
                  <div class="special_border2">
                     <div class="text_special product2"><?php echo $end_special; ?> <span class="hidden-sm"><?php echo $end_special2; ?></span></div>
                     <div class="special-timer-all">
                        <div class = "special-timere-zone">
                           <div id = "time_out"></div>
                        </div>
                     </div>
                  </div>
                  <?php } ?>
                  <?php if ($price) { ?>
                  <div class="pr_price">
                     <span itemprop="offers" itemscope itemtype = "http://schema.org/Offer">
                        <meta itemprop="price" content="<?php echo rtrim(preg_replace("/[^0-9\.]/", "", ($special ? $special : $price)), '.'); ?>" />
                        <meta itemprop="priceCurrency" content="<?php echo $sh_currency; ?>" />
                        <link itemprop = "availability" href = "https://schema.org/<?php echo ($quantity>0 ? "InStock" : "OutOfStock") ?>" />
                        <?php if ($special && $special_date_end > $special_date_start) { ?>
                        <meta itemprop="priceValidUntil" content="<?php echo $special_date_end; ?>" />
                        <?php } ?>
                        <meta itemprop="url" content="<?php echo $hrefs; ?>" />
                     </span>
                     <div class="line-product">
                        <?php if (!$special) { ?>
                        <span class="price-new"><?php echo $price; ?></span>
                        <?php if ($aridiusundersell_status) { ?>
                        <span class="undersell_pr">
                        <i class="fa fa-area-chart" aria-hidden="true"></i>&nbsp;<a id="undersell-order"><?php echo $buttonundersell_title; ?></a>
                        </span>
                        <?php } ?>
                        <?php } else { ?>
                        <span class="price-old"><?php echo $price; ?></span>
                        <?php if ($aurus_show_saving !=1) { ?>
                        <div class="popup-left-corner"><span class="popup3"> - <?php echo $saving_product; ?>%</span><?php echo $text_saving; ?> <span class="autocalc-saving-price"></span> </div>
                        <?php } ?>
                        <br />
                        <span class="price-new"><?php echo $special; ?></span>
                        <?php if ($aridiusundersell_status) { ?>
                        <div class="clearfix visible-sm"></div>
                        <span class="undersell_pr undersell_pr_sale">
                        <i class="fa fa-area-chart" aria-hidden="true"></i>&nbsp;<a id="undersell-order"><?php echo $buttonundersell_title; ?></a>
                        </span>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($tax || $points || $discounts) { ?>
                        <ul class="list-unstyled taxpd">
                           <?php if ($tax) { ?>
                           <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
                           <?php } ?>
                           <?php if ($points) { ?>
                           <li><?php echo $text_points; ?> <?php echo $points; ?></li>
                           <?php } ?>
                        </ul>
                        <?php if ($discounts) { ?>
                        <span class="discount" data-html="true" data-toggle="tooltip" title="
                           <?php foreach ($discounts as $discount) { ?>
                           <?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?><br>
                           <?php } ?>
                           "><i class="fa fa-info"></i> <?php echo $text_discount2; ?></span>
                        <?php } ?>
                        <?php } ?>
                     </div>
                  </div>
                  <?php } ?>
                  <div id="product">
                     <!-- aridius_size -->
                     <?php if ($aurus_show_tablsize !=0) { ?>
                     <div class="aridius_size">
                        <?php echo $aridius_size; ?>
                     </div>
                     <?php } ?>
                     <!-- aridius_size end-->
                     <?php if ($options) { ?>
                     <hr>
                     <?php foreach ($options as $option) { ?>
                     <?php if ($option['type'] == 'select') { ?>
                     <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                           <option value=""><?php echo $text_select; ?></option>
                           <?php foreach ($option['product_option_value'] as $option_value) { ?>
                           <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                              <?php if ($option_value['price']) { ?>
                              (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                              <?php } ?>
                           </option>
                           <?php } ?>
                        </select>
                     </div>
                     <?php } ?>
                     <?php if ($option['type'] == 'radio') { ?>
                     <div class="options_group form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"><?php echo $option['name']; ?></label>
                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                           <?php foreach ($option['product_option_value'] as $option_value) { ?>
                           <div class="radio">
                              <label>
                              <?php if ($option_value['image']) { ?>
                              <span class="opthe">
                              <input class="optstyle js-input-option" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />		
                              <img src="<?php echo $option_value['image'];?>" data-toggle="tooltip" data-placement="top" title="<?php echo $option_value['name']; ?>  <?php if ($option_value['price'] && $aurus_options_prise ==0) { ?><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?> <?php } ?>" class="img-thumbnail imgpopcat" <?php if ($option_value['image_opt']) { ?> data-image="<?php echo $option_value['image_opt']; ?>" <?php } else { ?> data-image="<?php echo $option_value['opt_thumb']; ?>" <?php } ?> alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />	
                              <?php if ($option_value['price']) { ?>
                              <br />
                              <span class = "hide_optprise"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
                              <?php } ?>
                              </span>	
                              <?php } else { ?>
                              <input type="radio"  class="options_none" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                              <span class="im_option" <?php if ($option_value['price'] && $aurus_options_prise ==0) { ?> data-toggle="tooltip" data-placement="top" title="<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>" <?php } ?>><?php echo $option_value['name']; ?> </span>
                              <?php if ($option_value['price']) { ?>
                              <span class = "hide_optprise"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
                              <?php } ?><span class = "options-prheight"></span>
                              <?php } ?>  
                              </label>
                           </div>
                           <?php } ?>
                        </div>
                     </div>
                     <?php } ?>
                     <?php if ($option['type'] == 'checkbox') { ?>
                     <div class="options_group form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"><?php echo $option['name']; ?></label>
                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                           <?php foreach ($option['product_option_value'] as $option_value) { ?>
                           <div class="checkbox">
                              <label>
                              <?php if ($option_value['image']) { ?>
                              <span class="opthe">
                              <input class="optstyle js-input-option" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                              <img src="<?php echo $option_value['image'];?>" data-toggle="tooltip" data-placement="top" title="<?php echo $option_value['name']; ?>  <?php if ($option_value['price'] && $aurus_options_prise ==0) { ?><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?> <?php } ?>" class="img-thumbnail imgpopcat" <?php if ($option_value['image_opt']) { ?> data-image="<?php echo $option_value['image_opt']; ?>" <?php } else { ?> data-image="<?php echo $option_value['opt_thumb']; ?>" <?php } ?> alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />
                              <?php if ($option_value['price']) { ?>
                              <br />
                              <span class = "hide_optprise"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
                              <?php } ?>
                              </span>	
                              <?php } else { ?>
                              <input type="checkbox" class="options_none" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                              <span class="im_option" <?php if ($option_value['price'] && $aurus_options_prise ==0) { ?> data-toggle="tooltip" data-placement="top" title="<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>" <?php } ?>><?php echo $option_value['name']; ?> </span>
                              <?php if ($option_value['price']) { ?>
                              <span class = "hide_optprise"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
                              <?php } ?><span class = "options-prheight"></span>
                              <?php } ?>  
                              </label>
                           </div>
                           <?php } ?>
                        </div>
                     </div>
                     <?php } ?>
                     <?php if ($option['type'] == 'text') { ?>
                     <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                     </div>
                     <?php } ?>
                     <?php if ($option['type'] == 'textarea') { ?>
                     <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                     </div>
                     <?php } ?>
                     <?php if ($option['type'] == 'file') { ?>
                     <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"><?php echo $option['name']; ?></label>
                        <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                     </div>
                     <?php } ?>
                     <?php if ($option['type'] == 'date') { ?>
                     <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <div class="input-group date">
                           <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                           <span class="input-group-btn">
                           <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                           </span>
                        </div>
                     </div>
                     <?php } ?>
                     <?php if ($option['type'] == 'datetime') { ?>
                     <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <div class="input-group datetime">
                           <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                           <span class="input-group-btn">
                           <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                           </span>
                        </div>
                     </div>
                     <?php } ?>
                     <?php if ($option['type'] == 'time') { ?>
                     <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <div class="input-group time">
                           <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                           <span class="input-group-btn">
                           <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                           </span>
                        </div>
                     </div>
                     <?php } ?>
                     <?php } ?>
                     <?php } ?>
                     <?php if ($recurrings) { ?>
                     <hr>
                     <div class="title-module"><?php echo $text_payment_recurring; ?></div>
                     <div class="form-group required">
                        <select name="recurring_id" class="form-control">
                           <option value=""><?php echo $text_select; ?></option>
                           <?php foreach ($recurrings as $recurring) { ?>
                           <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                           <?php } ?>
                        </select>
                        <div class="help-block" id="recurring-description"></div>
                     </div>
                     <?php } ?>
                     <div class=" form-group">
                        <div class="pull-left1">
                           <button type="button" class="minus items-count"><i class="fa fa-minus">&nbsp;</i></button>
                           <input type="text" name="quantity" value="<?php echo $minimum; ?>" data-toggle="tooltip" title="<?php echo $entry_qty; ?>" size="2" class="input-quantity form-control" />
                           <button type="button" class="plus items-count2"><i class="fa fa-plus">&nbsp;</i></button>
                           <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                        </div>
                        &nbsp;&nbsp;&nbsp;			
                        <?php if ($aurus_wishlist_cat !=1) { ?>
                        <button type="button" data-toggle="tooltip" class="btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
                        <?php } ?>
                        <?php if ($aurus_compare_cat !=1) { ?>
                        <button type="button" data-toggle="tooltip" class="btn-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
                        <?php } ?>	
                        <div class="clearfix"></div>
                        <div class="cart" >
                           <?php if ($quantity <= 0 && $aridiusinstock_status ) { ?>
                           <button type="button" class="btn-instock" onclick="instock.add('<?php echo $product_id; ?>');" data-product-id="<?php echo $product_id; ?>"><?php echo $button_instock; ?></button>
                           <?php } else { ?>
                           <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart product"><i class="fa fa-shopping-cart hidden-xs hidden-sm"></i> <?php echo $button_cart; ?></button>
                           <?php if ($aridiusfastorder_status) { ?>
                           <button type="button" id="fast-order" class="btn-cart"><i class="fa fa-clock-o hidden-xs hidden-sm"></i> <?php echo $button_titlef; ?></button>
                           <?php } ?>
                           <?php } ?>
                        </div>
                        <?php if ($minimum > 1) { ?>
                        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                        <?php } ?>
                     </div>
                     <div class="clearfix"></div>
                  </div>
                  <?php if ($aurus_top_links9 ) { ?>
                  <div class = "flex_ico">
                     <?php foreach ($aurus_top_links9 as $key => $aurus_top_link9) { ?>
                     <div class = "col-xs-4 bl_center">
                        <?php if ($aurus_top_link9['faicon'][$language_id] ) { ?>
                        <a href="#text-popup<?php echo $key ?>" class="popup-content<?php echo $key ?>">
                           <i class="<?php echo $aurus_top_link9['faicon'][$language_id]; ?>"></i>
                           <?php } else { ?>
                           <img class="img_tabl" src="<?php echo $aurus_top_link9['image_href']; ?>" alt=""/>
                           <?php } ?>
                           <div class="clearfix"></div>
                           <?php echo $aurus_top_link9['title'][$language_id]; ?>
                        </a>
                        <div id="text-popup<?php echo $key ?>" class="white-popup mfp-hide">
                           <?php echo html_entity_decode($aurus_top_link9['description'][$language_id]); ?>
                        </div>
                     </div>
                     <script>
                        $(document).ready(function() {
                        $('.popup-content<?php echo $key ?>').magnificPopup({
                        type: 'inline'
                        });
                        });
                     </script>
                     <?php } ?>
                  </div>
                  <?php } ?>
                  <?php if ($aurus_product_show_share !=1) { ?>
                  <div class="share">
                     <p>
                        <?php if (empty($aurus_share)) { ?>
                        <!-- AddThis Button BEGIN -->
                     <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
                     <script src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                     <!-- AddThis Button END -->
                     <?php } else { ?>
                     <?php echo htmlspecialchars_decode($aurus_share);?>
                     <?php } ?>
                  </div>
                  <?php } ?>
               </div>
            </div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
               <table class="table table-bordered">
                  <?php foreach ($attribute_groups as $attribute_group) { ?>
                  <thead>
                     <tr>
                        <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                     </tr>
                  </thead>
                  <tbody>
                     <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                     <tr>
                        <td><?php echo $attribute['name']; ?></td>
                        <td><?php echo $attribute['text']; ?></td>
                     </tr>
                     <?php } ?>
                  </tbody>
                  <?php } ?>
               </table>
            </div>
            <?php } ?>
            <?php if ($images && $aurus_show_tab_img !=1) { ?>			
            <div class="tab-pane" id="tab-image">
               <img class="center_tabimg img-responsive" src = "<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">	   
               <?php foreach ($images as $image) { ?>
               <img class="center_tabimg img-responsive" src = "<?php echo $image['thumb2']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">	   
               <?php } ?>	
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
               <form class="form-horizontal" id="form-review">
                  <div id="review">
                     <?php if ($reviews_first['reviews']) { 
                        if ( count($reviews_first['reviews']) > 5 ) {
                        $reviews_first_page = array_slice($reviews_first['reviews'], 0, 5);
                        } else { $reviews_first_page = $reviews_first['reviews']; }
                        ?>
                     <?php foreach ($reviews_first_page as $review) { ?>
                     <table class="table table-striped table-bordered" itemprop = "review" itemscope itemtype = "http://schema.org/Review">
                        <tr>
                           <td style="width: 50%;"><strong itemprop = "author"><?php echo $review['author']; ?></strong></td>
                           <td class="text-right">
                              <time itemprop = "datePublished" datetime = "<?php echo $review['date_added']; ?>" ><?php echo $review['date_added']; ?></time>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2">
                              <p itemprop = "reviewBody"><?php echo $review['text']; ?></p>
                              <div class="rating" itemprop = "reviewRating" itemscope itemtype = "http://schema.org/Rating">
                                 <meta itemprop = "worstRating" content = "1" >
                                 <meta itemprop = "ratingValue" content="<?php echo $review['rating']; ?>">
                                 <meta itemprop = "bestRating" content="5">
                              </div>
                              <br />
                              <?php if ($review['dignity']) { ?>
                              <p><b><?php echo $text_dignity; ?></b> <?php echo $review['dignity']; ?></p>
                              <?php } ?>
                              <?php if ($review['limitations']) { ?>
                              <p><b><?php echo $text_limitations; ?></b> <?php echo $review['limitations']; ?></p>
                              <?php } ?>
                              <?php for ($i = 1; $i <= 5; $i++) { ?>
                              <?php if ($review['rating'] < $i) { ?>
                              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                              <?php } else { ?>
                              <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                              <?php } ?>
                              <?php } ?>
                           </td>
                        </tr>
                     </table>
                     <?php } ?>
                     <div class="text-right"><?php echo $reviews_first['pagination']; ?></div>
                     <?php } else { ?>
                     <p><?php echo $reviews_first['text_no_reviews']; ?></p>
                     <?php } ?>
                  </div>
                  <span class="text-write"><?php echo $text_write; ?></span>
                  <?php if ($review_guest) { ?>
                  <div class="form-group required">
                     <div class="col-sm-12">
                        <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                     </div>
                  </div>
                  <div class="form-group required">
                     <div class="col-sm-12">
                        <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-sm-12">
                        <label for="input-dignity"><?php echo $text_dignity; ?></label>
                        <input type="text" name="dignity" id="input-dignity" class="form-control">
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-sm-12">
                        <label for="input-limitations"><?php echo $text_limitations; ?></label>
                        <input type="text" name="limitations" id="input-limitations" class="form-control">
                     </div>
                  </div>
                  <div class="help-block"><?php echo $text_note; ?></div>
                  <div class="form-group required">
                     <div class="col-sm-12">
                        <label class="control-label"><?php echo $entry_rating; ?></label>
                        <input type="hidden" name="rating" value="<?php echo $aurus_product_raiting; ?>" class="rating-tooltip"/>
                     </div>
                  </div>
                  <?php echo $captcha; ?>
                  <div class="buttons clearfix">
                     <div class="pull-right">
                        <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart"><?php echo $button_continue; ?></button>
                     </div>
                  </div>
                  <?php } else { ?>
                  <?php echo $text_login; ?>
                  <?php } ?>
               </form>
            </div>
            <?php } ?>
            <?php if ($aurus_relpr_tab ==1) { ?>
            <div class="tab-pane" id="tab-relpr">
               <?php if ($aurus_relcarusel != '1') { ?>
               <div id="pr_related-grid" class="bl_margin flex_height_row">
                  <?php foreach ($products as $product) { ?>
                  <div class="product-layout pr_related <?php if ($column_left || $column_right ) { ?> col-xl-five col-lg-3 col-md-4 col-sm-4 col-xs-6 <?php } else { ?> col-xl-2 col-lg-five col-md-3 col-sm-4 col-xs-6 <?php } ?>">
                     <div class="gtile-i-wrap">
                        <div class="gtile-i">
                           <div class="gtile-i-box">
                              <div class="item__prrelated caption">
                                 <div class="<?php if ($aurus_ratpr) { ?>raiting_thumb<?php } ?> product-thumb">
                                    <div class="box_pr_related">
                                       <?php if ($aurus_ratpr) { ?>
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
                                             <?php if ($aurus_wishpr) { ?>
                                             <li>
                                                <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                                <i class="fa fa-heart"></i>
                                                <span><?php echo $button_wishlist; ?></span>
                                                </a>
                                             </li>
                                             <?php } ?>
                                             <?php if ($aurus_comppr) { ?>
                                             <li>
                                                <a onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                                <i class="fa fa-exchange"></i>
                                                <span><?php echo $button_compare; ?></span>
                                                </a>
                                             </li>
                                             <?php } ?>
                                             <?php if ($aurus_quickviewpr) { ?>
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
                                       <?php if ($aurus_ratpr) { ?>
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
                                       <h4><a href="<?php echo $product['href']; ?>">
                                          <?php
                                             if( strlen($product['name'] ) < $aurus_limit_symbolst) {
                                             echo $product['name'];
                                             }
                                             else {
                                             echo mb_substr( $product['name'],0,$aurus_limit_symbolst,'utf-8' )."..."; }
                                             ?>
                                          </a>
                                       </h4>
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
               <script>
                  $(document).ready(function () {
                  var size_li__prrelated = $("#pr_related-grid > div").size();
                  var li_element__prrelated  = <?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>;
                  if(li_element__prrelated !=size_li__prrelated){
                  $( ".product-layout.pr_related:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)" ).append('<div class="gridcount pr_related"><i class="gridcount_load fa fa-refresh fa-lg"></i><span class="gridcount2"><?php echo $button_load; ?></span></div>');
                  $(".product-layout.pr_related:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)").addClass("pr_related_box quickview_hidden");
                  }
                  $('#pr_related-grid > div:lt('+li_element__prrelated+')').fadeIn('slow');
                  $('.gridcount.pr_related').click(function () {
                  $(this).remove();
                  $('.pr_related_box.quickview_hidden').first().removeClass('quickview_hidden')
                  if(li_element__prrelated==size_li__prrelated){
                  $('.btn.btn-default.gridcount.pr_related').remove();
                  }else{
                  li_element__prrelated = (li_element__prrelated+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> <= size_li__prrelated) ? li_element__prrelated+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> : size_li__prrelated;
                  $('#pr_related-grid > div:lt('+li_element__prrelated+')').fadeIn('slow');
                  }
                  $("#affix-right").affix('checkPosition'); // пересчет affix
                  });
                  });
               </script>
               <?php } else { ?>
               <div id="prrelated" class="swiper-container">
                  <div class="swiper-wrapper">
                     <?php foreach ($products as $product) { ?>
                     <div class="swiper-slide product-layout_carusel">
                        <div class="caption">
                           <div class="<?php if ($aurus_ratpr) { ?>raiting_thumb<?php } ?> product-thumb">
                              <div class="box_spec">
                                 <?php if ($aurus_ratpr) { ?>
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
                                       <?php if ($aurus_wishpr) { ?>
                                       <li>
                                          <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                          <i class="fa fa-heart"></i>
                                          <span><?php echo $button_wishlist; ?></span>
                                          </a>
                                       </li>
                                       <?php } ?>
                                       <?php if ($aurus_comppr) { ?>
                                       <li>
                                          <a onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                          <i class="fa fa-exchange"></i>
                                          <span><?php echo $button_compare; ?></span>
                                          </a>
                                       </li>
                                       <?php } ?>
                                       <?php if ($aurus_quickviewpr) { ?>
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
                                 <?php if ($aurus_ratpr) { ?>
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
                                 <h4><a href="<?php echo $product['href']; ?>">
                                    <?php
                                       if( strlen($product['name'] ) < $aurus_limit_symbolst) {
                                       echo $product['name'];
                                       }
                                       else {
                                       echo mb_substr( $product['name'],0,$aurus_limit_symbolst,'utf-8' )."..."; }
                                       ?>
                                    </a>
                                 </h4>
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
                  <?php if ($aurus_relnavigation) { ?>
                  <div class="#prrelated swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
                  <div class="#prrelated swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
                  <?php } ?>	  
               </div>
               <script>
                  $('.nav_pr a[href="#tab-relpr"]').on('shown.bs.tab', function (e) {
                  var ocSwiper = new Swiper('#prrelated.swiper-container', {
                  slidesPerView: <?php echo $aurus_relitems; ?>,
                  mode: 'horizontal',
                  pagination: false,
                     speed: <?php echo $aurus_relrew_speed; ?>,
                  <?php if ($aurus_relautoplay_on) { ?>
                     autoplay: {delay: <?php echo $aurus_relautoplay; ?>},
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
                  <?php if ($aurus_relnavigation) { ?>	
                     navigation: {
                         nextEl: '#prrelated .swiper-button-next',
                         prevEl: '#prrelated .swiper-button-prev',
                     },
                  <?php } ?>	
                  });
                  <?php if ($aurus_relstophover && $aurus_relautoplay_on) { ?>
                  $("#prrelated.swiper-container").hover(function() {
                     ocSwiper.autoplay.stop();
                  }, function() {
                     ocSwiper.autoplay.start();
                  });
                  <?php } ?>
                                   });
               </script>
               <?php } ?>
               <div class="clearfix"></div>
            </div>
            <?php } ?>
			
            <!-- custom_tabs -->
            <?php if ($custom_tabs) { ?>
            <?php foreach ($custom_tabs as $key => $custom_tab) { ?>
            <?php if ($custom_tab['title']) { ?>
            <div class="tab-pane" id="tab-custom-<?php echo $key?>"><?php echo $custom_tab['description']; ?></div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <!-- custom_tabs -->
			
            <?php if ($aurus_top_links7 ) { ?>
            <?php foreach ($aurus_top_links7 as $key => $aurus_top_link7) { ?>
            <?php if ($aurus_top_link7['title'][$language_id]) { ?>
            <div class="tab-pane" id="tab-add-<?php echo $key ?>"><?php echo html_entity_decode($aurus_top_link7['description'][$language_id]); ?></div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
			
            <div class="clearfix"></div>
            <div id="yakor_desc" class="desc_hide" itemprop="description">
               <div class="title-module"><?php echo $tab_description; ?></div>
               <?php echo $description; ?>
            </div>
            <div class="col_first">
               <?php if ($aurus_relpr_tab !=1) { ?>
               <div class="title-module"><?php echo $text_related2; ?></div>
               <?php if ($aurus_relcarusel != '1') { ?>
               <div id="pr_related-grid" class="bl_margin flex_height_row">
                  <?php foreach ($products as $product) { ?>
                  <div class="product-layout <?php if ($column_left || $column_right ) { ?> nth1 <?php } else { ?> nth2 <?php } ?> pr_related <?php if ($column_left || $column_right ) { ?> col-xl-five col-lg-3 col-md-4 col-sm-4 col-xs-6 <?php } else { ?> col-xl-2 col-lg-five col-md-3 col-sm-4 col-xs-6 <?php } ?>">
                     <div class="gtile-i-wrap">
                        <div class="gtile-i">
                           <div class="gtile-i-box">
                              <div class="item__prrelated caption">
                                 <div class="<?php if ($aurus_ratpr) { ?>raiting_thumb<?php } ?> product-thumb">
                                    <div class="box_pr_related">
                                       <?php if ($aurus_ratpr) { ?>
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
                                             <?php if ($aurus_wishpr) { ?>
                                             <li>
                                                <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                                <i class="fa fa-heart"></i>
                                                <span><?php echo $button_wishlist; ?></span>
                                                </a>
                                             </li>
                                             <?php } ?>
                                             <?php if ($aurus_comppr) { ?>
                                             <li>
                                                <a onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                                <i class="fa fa-exchange"></i>
                                                <span><?php echo $button_compare; ?></span>
                                                </a>
                                             </li>
                                             <?php } ?>
                                             <?php if ($aurus_quickviewpr) { ?>
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
                                       <?php if ($aurus_ratpr) { ?>
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
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <?php } ?>
               </div>
               <script>
                  $(document).ready(function () {
                  var size_li__prrelated = $("#pr_related-grid > div").size();
                  var li_element__prrelated  = <?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>;
                  if(li_element__prrelated !=size_li__prrelated){
                  $( ".product-layout.pr_related:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)" ).append('<div class="gridcount pr_related"><i class="gridcount_load fa fa-refresh fa-lg"></i><span class="gridcount2"><?php echo $button_load; ?></span></div>');
                  $(".product-layout.pr_related:nth-child(<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?>n):not(:last-child)").addClass("pr_related_box quickview_hidden");
                  }
                  $('#pr_related-grid > div:lt('+li_element__prrelated+')').fadeIn('slow');
                  $('.gridcount.pr_related').click(function () {
                  $(this).remove();
                  $('.pr_related_box.quickview_hidden').first().removeClass('quickview_hidden')
                  if(li_element__prrelated==size_li__prrelated){
                  $('.btn.btn-default.gridcount.pr_related').remove();
                  }else{
                  li_element__prrelated = (li_element__prrelated+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> <= size_li__prrelated) ? li_element__prrelated+<?php if ($column_left || $column_right ) { ?>5<?php } else { ?>6<?php } ?> : size_li__prrelated;
                  $('#pr_related-grid > div:lt('+li_element__prrelated+')').fadeIn('slow');
                  }
                  $("#affix-right").affix('checkPosition'); // пересчет affix
                  });
                  });
               </script>
               <?php } else { ?>
               <div id="prrelated" class="swiper-container">
                  <div class="swiper-wrapper">
                     <?php foreach ($products as $product) { ?>
                     <div class="swiper-slide product-layout_carusel">
                        <div class="caption">
                           <div class="<?php if ($aurus_ratpr) { ?>raiting_thumb<?php } ?> product-thumb">
                              <div class="box_spec">
                                 <?php if ($aurus_ratpr) { ?>
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
                                       <?php if ($aurus_wishpr) { ?>
                                       <li>
                                          <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                          <i class="fa fa-heart"></i>
                                          <span><?php echo $button_wishlist; ?></span>
                                          </a>
                                       </li>
                                       <?php } ?>
                                       <?php if ($aurus_comppr) { ?>
                                       <li>
                                          <a onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                          <i class="fa fa-exchange"></i>
                                          <span><?php echo $button_compare; ?></span>
                                          </a>
                                       </li>
                                       <?php } ?>
                                       <?php if ($aurus_quickviewpr) { ?>
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
                                 <?php if ($aurus_ratpr) { ?>
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
                              </div>
                           </div>
                        </div>
                     </div>
                     <?php } ?>
                  </div>
                  <?php if ($aurus_relnavigation) { ?>
                  <div class="#prrelated swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
                  <div class="#prrelated swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
                  <?php } ?>	  
               </div>
               <script>
                  $(document).ready(function () {
                  var ocSwiper = new Swiper('#prrelated.swiper-container', {
                  slidesPerView: <?php echo $aurus_relitems; ?>,
                  mode: 'horizontal',
                  pagination: false,
                     speed: <?php echo $aurus_relrew_speed; ?>,
                  <?php if ($aurus_relautoplay_on) { ?>
                     autoplay: {delay: <?php echo $aurus_relautoplay; ?>},
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
                  <?php if ($aurus_relnavigation) { ?>	
                     navigation: {
                         nextEl: '#prrelated .swiper-button-next',
                         prevEl: '#prrelated .swiper-button-prev',
                     },
                  <?php } ?>	
                  });
                  <?php if ($aurus_relstophover && $aurus_relautoplay_on) { ?>
                  $("#prrelated.swiper-container").hover(function() {
                     ocSwiper.autoplay.stop();
                  }, function() {
                     ocSwiper.autoplay.start();
                  });
                  <?php } ?>
                                   });
               </script>
               <?php } ?>
               <div class="clearfix"></div>
               <?php } ?>
               <?php echo $content_bottom; ?>
            </div>
         </div>
         <?php if ($tags) { ?>
         <div class="tags_p">
            <p><i class="fa fa-tags" aria-hidden="true"></i> <?php echo $text_tags; ?> <?php for ($i = 0; $i < count($tags); $i++) { ?><?php if ($i < (count($tags) - 1)) { ?><a class="tags" href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,<?php } else { ?><a class="tags" href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a><?php } ?><?php } ?></p>
         </div>
         <?php } ?>
         <?php if($ard_quckview) { ?>
         <div id="ard_quckview"><?php echo $ard_quckview;?></div>
         <?php } ?>
         <div class="clearfix"></div>
      </div>
      <?php if ($aurus_product_sticky_menu !=1) { ?>
      <script src="catalog/view/theme/aurus/js/aridius/jquery.sticky-kit.min.js"></script>
      <?php } ?>
      <?php if ($column_left) { ?>
      <div class="col-lg-3 hidden-xs hidden-sm hidden-md fix_st" id="sticky_item" >
         <?php } else { ?>
         <div class="col-lg-3 hidden-xs hidden-sm hidden-md fix_st" id="sticky_item" >
            <?php } ?>
            <div class="col_second">
               <?php if ($price) { ?>
               <div class="pr_price">
                  <div class="line-product">
                     <?php if (!$special) { ?>
                     <span class="price-new"><?php echo $price; ?></span>
                     <?php } else { ?>
                     <span class="price-new"><?php echo $special; ?></span><span class="price-old"><?php echo $price; ?></span>
                     <?php } ?>
                     <?php if ($tax || $points || $discounts) { ?>
                     <ul class="list-unstyled taxp">
                        <?php if ($tax) { ?>
                        <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
                        <?php } ?>
                        <?php if ($points) { ?>
                        <li><?php echo $text_points; ?> <?php echo $points; ?></li>
                        <?php } ?>
                     </ul>
                     <?php if ($discounts) { ?>
                     <span class="discount" data-html="true" data-toggle="tooltip" title="
                        <?php foreach ($discounts as $discount) { ?>
                        <?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?><br>
                        <?php } ?>
                        "><i class="fa fa-info"></i> <?php echo $text_discount2; ?></span>
                     <?php } ?>
                     <?php } ?>
                  </div>
                  <div class="container_fix">
                     <img class="main-image imgfix img-responsive" src="<?php echo $thumb_clone; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
                  </div>
               </div>
               <?php } ?>
               <div id="product_st">
                  <?php if ($recurrings) { ?>
                  <hr>
                  <div class="title-module"><?php echo $text_payment_recurring; ?></div>
                  <div class="form-group required">
                     <select name="recurring_id" class="form-control">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php foreach ($recurrings as $recurring) { ?>
                        <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                        <?php } ?>
                     </select>
                     <div class="help-block" id="recurring-description_st"></div>
                  </div>
                  <?php } ?>
                  <div class="form-group">
                     <div class="pull-left1">
                        <button type="button" class="minus items-count"><i class="fa fa-minus">&nbsp;</i></button>
                        <input type="text" name="quantity" value="<?php echo $minimum; ?>" data-toggle="tooltip" title="<?php echo $entry_qty; ?>" size="2" class="input-quantity form-control" />
                        <button type="button" class="plus items-count2"><i class="fa fa-plus">&nbsp;</i></button>
                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                     </div>
                     &nbsp;&nbsp;&nbsp;
                     <span class="clearfix_wc">
                     <?php if ($aurus_wishlist_cat !=1) { ?>
                     <button type="button" data-toggle="tooltip" class="btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
                     <?php } ?>
                     <?php if ($aurus_compare_cat !=1) { ?>
                     <button type="button" data-toggle="tooltip" class="btn-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
                     <?php } ?>
                     </span>
                     <?php if (($special && $special_date_end > $special_date_start)&&($aurus_product_timer !=1)) { ?>
                     <div class="special_border">
                        <div class="text_special product "><?php echo $end_special; ?></div>
                        <div class="text_special2"><?php echo $end_special2; ?></div>
                        <div class="special-timer-all">
                           <div class = "special-timere-zone">
                              <div id = "time_out2"></div>
                           </div>
                        </div>
                     </div>
                     <?php } ?>
                     <div class="cart" >
                        <?php if ($quantity <= 0 && $aridiusinstock_status ) { ?>
                        <button type="button" class="btn-instock" onclick="instock.add('<?php echo $product_id; ?>');" data-product-id="<?php echo $product_id; ?>"><?php echo $button_instock; ?></button>
                        <?php } else { ?>
                        <button type="button" id="button-cart_st" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart product"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
                        <?php if ($aridiusfastorder_status) { ?>
                        <button type="button" id="fast-order2" class="btn-cart"><i class="fa fa-clock-o"></i> <?php echo $button_titlef; ?></button>
                        <?php } ?>
                        <?php } ?>
                     </div>
                  </div>
               </div>
               <div class="clearfix"></div>
               <?php if ($minimum > 1) { ?>
               <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
               <?php } ?>
            </div>
         </div>
      </div>
   </div>
</div>
<?php if ($config_minify !=0) { ?>
<link href="catalog/view/theme/aurus/js/lightGallery/css/lightgallery.min.css" rel="stylesheet" type="text/css" />
<script src="catalog/view/theme/aurus/js/lightGallery/js/lightgallery-all.min.js"></script>
<script src="catalog/view/theme/aurus/js/elevatezoom/jquery.elevatezoom.js"></script>
<script src="catalog/view/theme/aurus/js/bootstrap_rating/bootstrap-rating.js"></script>
<?php } else { ?>	
<script src="/min/f=catalog/view/theme/aurus/js/lightGallery/js/lightgallery-all.min.js,catalog/view/theme/aurus/js/elevatezoom/jquery.elevatezoom.js,catalog/view/theme/aurus/js/bootstrap_rating/bootstrap-rating.js"></script>
<link href="/min/f=catalog/view/theme/aurus/js/lightGallery/css/lightgallery.min.css" rel="stylesheet" media="screen" />
<?php } ?>	
<script>
   $(function() {
   	function getData(slider) {
   	  	var slides = slider.slides;
   		var activeIndex = slider.activeIndex;
   		var $currentSlide = $(slides[activeIndex]);
   		var $currentImage = $currentSlide.find('img');
   	  	return {
   	  		slides: slides,
   			activeIndex: activeIndex,
   			$currentSlide: $currentSlide,
   			$currentImage: $currentImage
   	  	}
   	 }
   	  var $gallery = $('.demo-gallery');
   	  var $slides = $gallery.find('.main-image');
   	  if ($slides.length > 1) {
   		  var initialSlide = 0;
   		  window.mainCarousel;
   		  window.thumbCarousel = new Swiper ('#additional', {
   		  	initialSlide: initialSlide,
   		  	<?php if ($aurus_imageadd_vertical ==0) { ?>	
   		    direction: 'vertical',
   			<?php } ?>	
   		    slidesPerView: <?php echo $aurus_imageadd_q; ?>,
   <?php if ($aurus_imageadd_vertical ==1) { ?>						
   breakpoints: {
     768: {
       slidesPerView: 4,
      },
     992: {
       slidesPerView: 4,
         },
     1200: {
       slidesPerView: 5,
      },
       1600: {
       slidesPerView: 5,
      }
   },
   <?php } else { ?>					
   breakpoints: {		
     992: {
       slidesPerView: 4,
         },
     1200: {
       slidesPerView: 5,
      },
   },
   <?php } ?>				
   <?php if ($aurus_imageadd_nav ==0) { ?>						
   			    navigation: {
   <?php if ($aurus_imageadd_vertical ==0) { ?>
         nextEl: '.add_img.swiper-button-next',
         prevEl: '.add_img.swiper-button-prev',
   <?php } else { ?>
         nextEl: '.add_img_v2.swiper-button-next',
         prevEl: '.add_img_v2.swiper-button-prev',		
   <?php } ?>		
     },
   <?php } ?>				
   		    on: {
   		    	init: function() {
   		    		$(this.slides[initialSlide]).addClass('swiper-slide-selected');
   		    		window.mainCarousel = new Swiper ('.demo-gallery', {
   						slidesPerView: 1,
   						     pagination: {
         el: '.main_img.swiper-pagination',
   clickable: true,
       },
   					    on: {
   					    	slideChange: function() {
   					    		var activeIndex = this.activeIndex;
   					    		var thumbCarousel = window.thumbCarousel;
   					    		var slides = thumbCarousel.slides;
   					    		Object.values(slides).forEach(function(slide) {
   					    			$(slide).removeClass('swiper-slide-selected');
   					    		});
   					    		$(slides[activeIndex]).addClass('swiper-slide-selected');
   					    		if (activeIndex < thumbCarousel.slides.length) {
   					    			thumbCarousel.slideTo(activeIndex);
   					    		}
   					    	},
   					    	slideChangeTransitionStart: function() {
   					    		var data = getData(this);
   					    		$.removeData(data.$currentImage, 'elevateZoom');
   					    		$('.zoomContainer').remove();
   					    	},
   					    	init: function() {
   					    		var data = getData(this);
   					    		var $currentImage = data.$currentImage; 
   								 <?php if ($aurus_elevatezoom == '0') { ?>
   								 	$currentImage.elevateZoom({ cursor: "crosshair" , galleryActiveClass: 'active' });
   								 	<?php } elseif ($aurus_elevatezoom == '1') { ?>
   								 	$currentImage.elevateZoom({ zoomWindowPosition: 6 , tint:true, tintColour:'#F90', tintOpacity:0.5, galleryActiveClass: 'active' }); 
   								 	<?php } elseif ($aurus_elevatezoom == '2') { ?>
   								 	$currentImage.elevateZoom({ zoomType :"inner",  cursor:"crosshair", galleryActiveClass: 'active' }); 
   								 	<?php } elseif ($aurus_elevatezoom == '4') { ?>
   								 	$currentImage.elevateZoom({ zoomWindowPosition: 6 , constrainSize:200, zoomType: "lens", containLensZoom: true, cursor: 'pointer', galleryActiveClass: "active"}); 
   								 <?php } ?>
   					    	},
   					    	slideChangeTransitionEnd: function() {
   					    		var data = getData(this);
   					    		var $currentImage = data.$currentImage; 
   								 <?php if ($aurus_elevatezoom == '0') { ?>
   								 	$currentImage.elevateZoom({ cursor: "crosshair" , galleryActiveClass: 'active' });
   								 	<?php } elseif ($aurus_elevatezoom == '1') { ?>
   								 	$currentImage.elevateZoom({ zoomWindowPosition: 6 , tint:true, tintColour:'#F90', tintOpacity:0.5, galleryActiveClass: 'active' }); 
   								 	<?php } elseif ($aurus_elevatezoom == '2') { ?>
   								 	$currentImage.elevateZoom({ zoomType :"inner",  cursor:"crosshair", galleryActiveClass: 'active' }); 
   								 	<?php } elseif ($aurus_elevatezoom == '4') { ?>
   								 	$currentImage.elevateZoom({ zoomWindowPosition: 6 , constrainSize:200, zoomType: "lens", containLensZoom: true, cursor: 'pointer', galleryActiveClass: "active"}); 
   								 <?php } ?>
   					    	} 
   					    }
   					  });
   		    	},
   		    	click: function(e) {
   		    		if (!window.mainCarousel) return;
   		    		var index = this.clickedIndex;
   		    		window.mainCarousel.slideTo(index, 300);
   		    	}
   		    }
   		  });
   	  } else {
   	  	var $currentImage = $slides.eq(0);
   	  	<?php if ($aurus_elevatezoom == '0') { ?>
   		 	$currentImage.elevateZoom({ cursor: "crosshair" , galleryActiveClass: 'active' });
   		 	<?php } elseif ($aurus_elevatezoom == '1') { ?>
   		 	$currentImage.elevateZoom({ zoomWindowPosition: 6 , tint:true, tintColour:'#F90', tintOpacity:0.5, galleryActiveClass: 'active' }); 
   		 	<?php } elseif ($aurus_elevatezoom == '2') { ?>
   		 	$currentImage.elevateZoom({ zoomType :"inner",  cursor:"crosshair", galleryActiveClass: 'active' }); 
   		 	<?php } elseif ($aurus_elevatezoom == '4') { ?>
   		 	$currentImage.elevateZoom({ zoomWindowPosition: 6 , constrainSize:200, zoomType: "lens", containLensZoom: true, cursor: 'pointer', galleryActiveClass: "active"}); 
   		<?php } ?>
   	  }
   <?php if ($aurus_imageadd_hover == '1') { ?>			  
   //Swiper Slider Mouse Hover		  
   $('#additional .swiper-slide').on('mouseover', function() {
   window.mainCarousel.slideTo($(this).index());
   })
   <?php } ?>			  
   	});
</script>
<div id="gallery" class="pswp" tabindex="-1" role="dialog" aria-hidden="true"></div>
<script>
   function showPSWP () {
   	var $options = $('.js-input-option');
   	var $activeOption = $options.filter(':checked');
   	var img = $activeOption.siblings('img').data('image');
   	var mainCarousel = window.mainCarousel;
       var $lg = $('.pswp');
       var items = [
           <?php
      if ($thumb || $images) {
          echo'{thumb: "'.$thumb.'", src: "'.$popup.'", w: "'.$aurus_image_popup_width.'", h: "'.$aurus_image_popup_height.'"},';
          foreach ($images as $v) {
              echo'{thumb: "'.$v['thumb2'].'", src: "'.$v['popup'].'", w: "'.$aurus_image_popup_width.'", h: "'.$aurus_image_popup_height.'"},';
          }                        
      }
      ?>
   <?php if ($options && $aurus_options_mainimg ==0) { ?>
   <?php foreach ($options as $option) { ?>
   <?php foreach ($option['product_option_value'] as $option_value) { ?>
   <?php if($option_value['image_opt_additional'] || $option_value['image']) { ?>
   <?php if($option_value['image_opt']) { ?>
   <?php echo'{thumb: "'.$option_value['image_opt_popup'].'", src: "'.$option_value['image_opt_popup'].'", w: "'.$aurus_image_popup_width.'", h: "'.$aurus_image_popup_height.'"},'; ?>
   <?php } else { ?>
   <?php echo'{thumb: "'.$option_value['popup'].'", src: "'.$option_value['popup'].'", w: "'.$aurus_image_popup_width.'", h: "'.$aurus_image_popup_height.'"},'; ?>
   <?php } ?>
   <?php } ?>
   <?php } ?>
   <?php } ?>
   <?php } ?>
       ];  
       var options = {
   share: false,
   fullScreen: false,
   actualSize: false,
   autoplay: false,
   counter: false,
       	thumbnail: true,
       	download: false,
       	dynamic: true,
   index: 0
   };
   if (mainCarousel) {
   options.index = mainCarousel.activeIndex;
   }
       options.dynamicEl = items;
       var gallery = $lg.lightGallery(options);
       gallery.one("onCloseAfter.lg", function() {
   gallery.data('lightGallery').destroy(true);
   });
   gallery.one('onAfterOpen.lg',function(){
   $(".lg-toolbar").append("<div class='cartpop'><div class='prise_spec_clone'></div><div class='prise_clone'></div><?php if ($quantity <= 0 && $aridiusinstock_status ) { ?><button type='button' class=' btn-instock' onclick=\"instock.add('<?php echo $product_id; ?>');\" data-product-id='<?php echo $product_id; ?>'><?php echo $button_instock; ?></button><?php } else { ?><button type='button' id='button-cart' data-loading-text='<?php echo $text_loading; ?>' class=' btn-cart'><i class='fa fa-shopping-cart'></i> <?php echo $button_cart; ?></button> <?php if ($aridiusfastorder_status) { ?><button type='button' id='fast-order' class='btn-cart'><i class='fa fa-clock-o'></i> <?php echo $button_titlef; ?></button><?php } ?><?php } ?></div>");
   $(".lg-toolbar").append("<div class='cartpop2'><?php echo $heading_title; ?></div>");
   <?php if ($special) { ?>	  
   $('.box-prinfo .autocalc-product-special').clone().appendTo('.prise_spec_clone');
   <?php } ?>
   $('.box-prinfo .autocalc-product-price').clone().appendTo('.prise_clone');
   });
   };
   $("#main-image, .main-image").on("click", function(e){ 
   e.preventDefault();
   showPSWP(); 
   });
</script>
<!-- lightGallery - END -->
<!-- rating -->
<script><!--
   $(function () {
   $('.rating-tooltip').ar_rating({
   extendSymbol: function (rate) {
   $(this).tooltip({
   container: 'body',
   placement: 'bottom',
   title: rate
   });
   }
   });
   });
   //-->
</script>
<?php if (($special && $special_date_end > $special_date_start)&&($aurus_product_timer !=1)) {
   $date_out = date('Y, m, d', strtotime($special_date_end));
   ?>
<script>
   function get_timer() {
   var timeend= new Date();
   timeend = new Date(<?php echo $date_out; ?>);
   var day = new Date();
   day.setMonth(day.getMonth() + 1);
   day = Math.floor((timeend-day)/1000);
   var sec=day%60; day=Math.floor(day/60);
   var min=day%60; day=Math.floor(day/60);
   var hour=day%24; day=Math.floor(day/24);
   if(day<10)day='0'+day;
   if(hour<10)hour='0'+hour;
   if(min<10)min='0'+min;
   if(sec<10)sec='0'+sec;
   var timestr =  "<span class='special-timer-info'>" +day+  "</span><span class='special-timer-line'>&ndash;</span><span class='special-timer-info'>"  +hour+ "</span><span class='special-timer-line'>&ndash;</span><span class='special-timer-info'>"  +min+  "</span><span class='special-timer-line'>&ndash;</span><span class='special-timer-info'>"   +sec+ "</span><br/><span class='special-timer-text1'><?php echo $day; ?></span><span class='special-timer-text2'><?php echo $hour; ?></span><span class='special-timer-text3'><?php echo $minute; ?></span><span class='special-timer-text4'><?php echo $second; ?></span>";
   document.getElementById('time_out').innerHTML=timestr;
   document.getElementById('time_out2').innerHTML=timestr;
   setTimeout(get_timer,1000);
   }
   get_timer()
   //-->
</script>
<?php } ?>
<script><!--
   $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
   $.ajax({
   url: 'index.php?route=product/product/getRecurringDescription',
   type: 'post',
   data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
   dataType: 'json',
   beforeSend: function() {
   $('#recurring-description').html('');
   },
   success: function(json) {
   $('.alert, .text-danger').remove();
   if (json['success']) {
   $('#recurring-description').html(json['success']);
   }
   }
   });
   });
   //-->
</script>
<script><!--
   $('.date').datetimepicker({
   pickTime: false
   });
   $('.datetime').datetimepicker({
   pickDate: true,
   pickTime: true
   });
   $('.time').datetimepicker({
   pickDate: false
   });
   $('button[id^=\'button-upload\']').on('click', function() {
   var node = this;
   $('#form-upload').remove();
   $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
   $('#form-upload input[name=\'file\']').trigger('click');
   if (typeof timer != 'undefined') {
   clearInterval(timer);
   }
   timer = setInterval(function() {
   if ($('#form-upload input[name=\'file\']').val() != '') {
   clearInterval(timer);
   $.ajax({
   url: 'index.php?route=tool/upload',
   type: 'post',
   dataType: 'json',
   data: new FormData($('#form-upload')[0]),
   cache: false,
   contentType: false,
   processData: false,
   beforeSend: function() {
   $(node).button('loading');
   },
   complete: function() {
   $(node).button('reset');
   },
   success: function(json) {
   $('.text-danger').remove();
   if (json['error']) {
   $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
   }
   if (json['success']) {
   alert(json['success']);
   $(node).parent().find('input').val(json['code']);
   }
   },
   error: function(xhr, ajaxOptions, thrownError) {
   alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
   }
   });
   }
   }, 500);
   });
   //-->
</script>
<script><!--
   $('#review').delegate('.pagination a', 'click', function(e) {
   e.preventDefault();
   $('#review').fadeOut('slow');
   $('#review').load(this.href);
   $('#review').fadeIn('slow');
   });
   //$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
   $('#button-review').on('click', function() {
   $.ajax({
   url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
   type: 'post',
   dataType: 'json',
   data: $("#form-review").serialize(),
   beforeSend: function() {
   $('#button-review').button('loading');
   },
   complete: function() {
   $('#button-review').button('reset');
   },
   success: function(json) {
   $('.alert-success, .alert-danger').remove();
   if (json['error']) {
   $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
   }
   if (json['success']) {
   $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
   $('input[name=\'name\']').val('');
   $('textarea[name=\'text\']').val('');
   $('input[name=\'dignity\']').val('');
   $('input[name=\'limitations\']').val('');
   $('input[name=\'rating\']:checked').prop('checked', false);
   }
   }
   });
   grecaptcha.reset();
   });
   //-->
</script>
<!-- fix tabs elevateZoomg -->
<script><!--
   $(function() {
   $('.nav_pr a[href="#tab-product"]').on('shown.bs.tab', function (e) {
   $('.zoomContainer').css("z-index", "1");
   });
   $('.nav_pr a[data-toggle="tab"]').on('hide.bs.tab', function (e) {
   $(this).find('.fa-caret-down').addClass('hidden');
   $('.zoomContainer').css("z-index", "-1");
   });
   });
   //-->
</script>
<script><!--
   jQuery(document).ready(function () {
   	$('.imgpopcat').click( "click" , function(event){
   		var $gallery = $('.demo-gallery');
   		var $slides = $gallery.find('.main-image');
   		var $this = $(this);
   		if ($slides.length > 1) {
   			var mainCarousel = window.mainCarousel;
   			if (!mainCarousel) return false;
   			var slides = mainCarousel.slides;
   			var popPath = $this.data('image');
   			var index = 0;
   			Object.values(slides).forEach(function(slide, idx) {
   				var $img = $(slide).find('img');
   				if ($img.prop('src') === popPath) index = idx;
   			});
   			 mainCarousel.slideTo(index, 300);
   		} else {
   			var img = $this.attr('data-image');
   			var title = $this.attr('title');
   			var imgphoto = $this.data('zoomImage');
   			var $mainImage = $('#main-image');
   			$mainImage.attr("src" , img);
   			$mainImage.data('zoomImage', imgphoto);
   			<?php if ($aurus_elevatezoom == '0') { ?>
   			$('.zoomWindow').css('background-image', 'url('+imgphoto+')');//Basic Zoom
   			<?php } elseif ($aurus_elevatezoom == '1') { ?>
   			$mainImage.elevateZoom({ tint:true, tintColour:'#F90' , tintOpacity:0.5 ,  zoomLens: 10 }); 
   			<?php } elseif ($aurus_elevatezoom == '2') { ?>
   			$('.zoomWindow').css('background-image', 'url('+imgphoto+')');//Inner Zoom
   			<?php } elseif ($aurus_elevatezoom == '4') { ?>
   			$('.zoomLens').css('background-image', 'url('+imgphoto+')');//Image Constrain Image
   			<?php } ?>
   		}
   	});
   });
   //-->
</script>
<!--go to review  -->
<script><!--
   $(".review_profile").click(function (){
   var tabTop = $(".nav-tabs").offset().top;
   $("html, body").animate({ scrollTop:tabTop }, 800);
   });
   //-->
</script>
<!--go to attribute  -->
<script><!--
   $(".specification_profile").click(function (){
   var tabTop = $(".nav-tabs").offset().top;
   $("html, body").animate({ scrollTop:tabTop }, 800);
   });
   //-->
</script>
<!-- + / - -->
<script><!--
   function minus(){
   if(document.getElementsByClassName ("input-quantity")[0].value <= 1 && document.getElementsByClassName ("input-quantity")[1].value <= 1) {
   return false;
   }
   document.getElementsByClassName ("input-quantity")[0].value --;
   document.getElementsByClassName ("input-quantity")[1].value --;
   };
   function plus(){
   document.getElementsByClassName ("input-quantity")[0].value ++;
   document.getElementsByClassName ("input-quantity")[1].value ++;
   };
   $('.minus').click(function(){
   minus();
   });
   $('.plus').click(function(){
   plus();
   });
   //-->
</script>
<?php if ($column_left) { ?> 
<script><!--
   $(window).load(function() {
   	setTimeout(function() {
   $('.zoomContainer').addClass('zoom_col_left');
   }, 1000);
     });
      //-->
</script>
<?php } ?>
<script>
   $(document).ready(function() {
   $('.nav_pr a[href="#tab-product"]').on('shown.bs.tab', function (e) {
   $('.change_col').addClass('col-lg-12').removeClass('col-lg-9');
     $("#sticky_item").css('display', 'none');
   $(".desc_hide").css('display', 'block');
   });
   $('.nav_pr a[data-toggle="tab"]').on('hide.bs.tab', function (e) {
   $('.change_col').addClass('col-lg-9').removeClass('col-lg-12');
    $("#sticky_item").css('display', 'block');
   $(".desc_hide").css('display', 'none');
   $("#sticky_item").trigger("sticky_kit:recalc"); // пересчет affix
   });
   });
</script>
<?php if ($aurus_product_sticky_menu !=1) { ?>
<!--affix col right  -->
<script><!--
   if ($(window).width() > 1199) {
      $(document).ready(function() {
      $('#sticky_item').stick_in_parent({
      inner_scrolling: true,
      offset_top: 60,
      recalc_every: 1
      });
      $('#sticky_item')
      .on('sticky_kit:bottom', function(e) {
      $(this).parent().css('position', 'static');
      })
      .on('sticky_kit:unbottom', function(e) {
      $(this).parent().css('position', 'relative');
      })
      });
   }   
</script>
<?php } ?>
<script><!--
   $('body').on('click','#button-cart', function(){
   var $lg = $('.pswp');
     var gallery = $lg.lightGallery();
     gallery.data('lightGallery').destroy(true);
   $.magnificPopup.close();
   $.ajax({
   url: 'index.php?route=checkout/cart/add',
   type: 'post',
   data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
   dataType: 'json',
   beforeSend: function() {
   $('#button-cart').button('loading');
   },
   complete: function() {
   $('#button-cart').button('reset');
   },
   success: function(json) {
   $('.alert, .text-danger').remove();
   $('.form-group').removeClass('has-error');
   if (json['error']) {
   if (json['error']['option']) {
   for (i in json['error']['option']) {
   var element = $('#input-option' + i.replace('_', '-'));
   if (element.parent().hasClass('input-group')) {
   element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
   } else {
   element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
   }
   }
   }
   if (json['error']['recurring']) {
   $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
   }
   // Highlight any found errors
   $('.text-danger').parent().addClass('has-error');
   }
   if (json['success']) {
   $.magnificPopup.open({
   removalDelay: 500,
   fixedContentPos: true,
   items: {
   src: 'index.php?route=common/aridius_cart/info'
   },
   type: 'ajax',
   removalDelay: 0,
   mainClass: 'my-mfp-zoom-in'
   });
   $('#cart button > span').html('<span> &nbsp;' + json['total'] + '&nbsp;<span class="caret"></span></span>');
   $('#cart').load('index.php?route=common/cart/info #cart > *');
   $('#cart2').load('index.php?route=common/cart2/info #cart2 > *');
   $('#aridius_cart').load('index.php?route=common/aridius_cart/info #aridius_cart > *', function() {
   carousel();
   });
   }
   },
   error: function(xhr, ajaxOptions, thrownError) {
   alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
   }
   });
   });
   //-->
</script>
<script><!--
   $('body').on('click','#button-cart_st, #button-cart_st2', function(){
   $.magnificPopup.close();
   $.ajax({
   url: 'index.php?route=checkout/cart/add',
   type: 'post',
   data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
   dataType: 'json',
   beforeSend: function() {
   $('#button-cart_st').button('loading');
   },
   complete: function() {
   $('#button-cart_st').button('reset');
   },
   success: function(json) {
   $('.alert, .text-danger').remove();
   $('.form-group').removeClass('has-error');
   if (json['error']) {
   if (json['error']['option']) {
   for (i in json['error']['option']) {
   var element = $('#input-option' + i.replace('_', '-'));
   if (element.parent().hasClass('input-group')) {
   element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
   } else {
   element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
   // first tab, anchors for options
   $('.nav_pr a[href="#tab-product"]').tab('show');
   var id  = $(".text-danger"),
   top = $(id).offset().top - 150;
   $('body,html').animate({scrollTop: top}, 1500);
   // first tab, anchors for options END
   }
   }
   }
   if (json['error']['recurring']) {
   $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
   }
   // Highlight any found errors
   $('.text-danger').parent().addClass('has-error');
   }
   if (json['success']) {
   $.magnificPopup.open({
   removalDelay: 500,
   fixedContentPos: true,
   items: {
   src: 'index.php?route=common/aridius_cart/info'
   },
   type: 'ajax',
   removalDelay: 0,
   mainClass: 'my-mfp-zoom-in'
   });
   $('#cart button > span').html('<span> &nbsp;' + json['total'] + '&nbsp;<span class="caret"></span></span>');
   $('#cart').load('index.php?route=common/cart/info #cart > *');
   $('#cart2').load('index.php?route=common/cart2/info #cart2 > *');
   $('#aridius_cart').load('index.php?route=common/aridius_cart/info #aridius_cart > *', function() {
   carousel();
   });
   }
   },
   error: function(xhr, ajaxOptions, thrownError) {
   alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
   }
   });
   });
   //-->
</script>
<script><!--
   $(document).ready(function() {
   var hash = window.location.hash;
   if (hash) {
   var hashpart = hash.split('#');
   var  vals = hashpart[1].split('-');
   for (i=0; i<vals.length; i++) {
   $('div.options').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
   $('div.options').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
   }
   }
   })
   //-->
</script>
<script><!--
   $('.anchor_desc').click(function(){
       var target = $(this).attr('href');
       $('html, body').animate({scrollTop: $(target).offset().top}, 800);
       return false;
   });
   //-->
</script >
<?php echo $footer; ?>