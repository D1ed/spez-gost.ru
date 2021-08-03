<div id="quickview">
   <div class="quickw">
      <div class="quickwgroup">
         <button title="close" type="button" class="mfp-close">&#215;</button>
         <div class="name-popup qv"><?php echo $heading_title; ?></div>
      </div>
      <div class="quickw2">
         <div class="row">
            <div class="col-lg-12">
			<div id="nav_pr">
               <ul class="nav_pr nav nav-tabs mod">
                  <li class="active"><a href="#tab-product" data-toggle="tab"><?php echo $tab_products; ?></a></li>
                  <?php if (!$aridius_qckview_tab_description) { ?>
                  <li><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
                  <?php } ?>
                  <?php if ($attribute_groups && !$aridius_qckview_tab_character) { ?>
                  <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
                  <?php } ?>
                  <?php if ($review_status && !$aridius_qckview_tab_reviews) { ?>
                  <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                  <?php } ?>
                  <?php if ($custom_tabs && !$aridius_qckview_tab_additional) { ?>
                  <?php foreach ($custom_tabs as $key => $custom_tab) { ?>
                  <?php if ($custom_tab['title']) { ?>
                  <li><a href="#custom_tabs-<?php echo $key ?>" data-toggle="tab"><?php echo $custom_tab['title']; ?></a></li>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>	
                  <?php if ($aurus_top_links7 && !$aridius_qckview_tab_additional) { ?>
                  <?php foreach ($aurus_top_links7 as $key => $aurus_top_link7) { ?>			
                  <?php if ($aurus_top_link7['title'][$language_id]) { ?> 
                  <li><a href="#tabadd-<?php echo $key ?>" data-toggle="tab"><?php echo $aurus_top_link7['title'][$language_id]; ?></a></li>
                  <?php } ?>	
                  <?php } ?>
                  <?php } ?>
               </ul>
			 </div> 
               <div class="tab-content">
                  <div class="tab-pane active" id="tab-product">
                     <div class="col-md-6 col-lg-6">
                        <?php if ($thumb || $images) { ?>
                        <div class="gallary-wrapper">
                           <?php if ($options || $images) { ?>	
                           <?php } ?>
                           <div class="thumbnails demo-galleryqv swiper-container">
                              <div class="positionsticker">
                                 <!-- special -->
                                 <?php if ($aurus_sticker_sale_product_auto !=1 && $special && $aridius_qckview_show_stsale == 0) { ?>
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
                                    <img id="main-imageqv" class="main-imageqv" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $popup; ?>" /></span>
                                 </li>
                                 <?php } ?>
                                 <?php if ($images) { ?>
                                 <?php foreach ($images as $image) { ?>
                                 <li class="swiper-slide">
                                    <span class="thumbnail imglink gallery_img_main">
                                    <img class="main-imageqv" src="<?php echo $image['thumb2']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $image['popup']; ?>" />
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
                                    <img class="main-imageqv" src="<?php echo $option_value['image_opt']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $option_value['image_opt_popup']; ?>" />
                                    </span>
                                    <?php } else { ?>
                                    <span class="thumbnail imglink gallery_img_main">
                                    <img class="main-imageqv" src="<?php echo $option_value['opt_thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $option_value['popup']; ?>" />
                                    </span>
                                    <?php } ?>
                                 </li>
                                 <?php } ?>
                                 <?php } ?>
                                 <?php } ?>
                                 <?php } ?>
                              </ul>
                              <div class="main_imgqv swiper-pagination"></div>
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
                     </div>
                     <div class="col-md-6 col-lg-6">
                        <?php if (!$aridius_qckview_rating) { ?> 
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
                              </p>
                           </div>
                        </div>
                        <?php } ?>	
                        <?php if (!$aridius_qckview_short_info) { ?>
                        <ul class="list-unstyled taxp2">
                           <?php if ($manufacturer && !$aridius_qckview_manufacturer) { ?>
                           <?php if ($aurus_product_man_img !=1) { ?>
                           <li><a href="<?php echo $manufacturers; ?>">
                              <?php if( isset($manufacturer_img) ) { ?>
                              <img  class="pull-right hidden-sm" src="<?php echo $manufacturer_img ; ?>" alt="<?php echo $manufacturer; ?>" title="<?php echo $manufacturer; ?>">
                              <?php } ?>
                              </a>
                           </li>
                           <?php } ?>
                           <li><span><?php echo $text_manufacturer; ?></span>&nbsp;&nbsp;<a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                           <?php } ?>
                           <?php if ($aridius_qckview_stock !=1 ) { ?>
                           <li><?php echo $text_stock; ?>&nbsp;&nbsp;<?php echo ($quantity > 0) ? '<span class = "rewardin">'. $stock .'</span>' : '<span class = "rewardoff">'. $stock .'</span>'; ?></li>
                           <?php } ?>
                           <?php if ($aridius_qckview_code_product !=1) { ?>
                           <li><span><?php echo $text_model; ?></span>&nbsp;&nbsp;<?php echo $model; ?></li>
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
                        </ul>
                        <?php } ?>				  
                        <?php if (($special && $special_date_end > $special_date_start)&&($aurus_product_timer !=1)) { ?>				  
                        <div class="special_border2">
                           <div class="text_special product2"><?php echo $end_special; ?> <span class="hidden-sm"><?php echo $end_special2; ?></span></div>
                           <div class="special-timer-all">
                              <div class = "special-timere-zone">
                                 <div id = "time_outpopup"></div>
                              </div>
                           </div>
                        </div>
                        <?php } ?>
                        <?php if ($price) { ?>
                        <div class="pr_price">
                           <div class="line-product">
                              <?php if (!$special) { ?>
                              <span class="price-new"><?php echo $price; ?></span>
                              <?php } else { ?>
                              <span class="price-old"><?php echo $price; ?></span>
                              <?php if ($aridius_qckview_show_saving !=1) { ?>
                              <div class="popup-left-corner"><span class="popup3"> - <?php echo $saving_product; ?>%</span><?php echo $text_saving; ?> <span class="autocalc-saving-price"></span> </div>
                              <?php } ?>
                              <br />
                              <span class="price-new"><?php echo $special; ?></span>
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
                        <div id="product_quickw">
                           <?php if ($options) { ?>
                           <hr>
                           <br/>
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
                                    <img src="<?php echo $option_value['image'];?>" data-toggle="tooltip" data-placement="top" title="<?php echo $option_value['name']; ?>  <?php if ($option_value['price'] && $aurus_options_prise ==0) { ?><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?> <?php } ?>" class="img-thumbnail imgpopcatqv" <?php if ($option_value['image_opt']) { ?> data-image="<?php echo $option_value['image_opt']; ?>" <?php } else { ?> data-image="<?php echo $option_value['opt_thumb']; ?>" <?php } ?> alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />	
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
                                    <img src="<?php echo $option_value['image'];?>" data-toggle="tooltip" data-placement="top" title="<?php echo $option_value['name']; ?>  <?php if ($option_value['price'] && $aurus_options_prise ==0) { ?><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?> <?php } ?>" class="img-thumbnail imgpopcatqv" <?php if ($option_value['image_opt']) { ?> data-image="<?php echo $option_value['image_opt']; ?>" <?php } else { ?> data-image="<?php echo $option_value['opt_thumb']; ?>" <?php } ?> alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />
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
                           <h3><?php echo $text_payment_recurring; ?></h3>
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
                           <div class="form-group">
                              <div class="pull-left1">
                                 <button type="button" class="minus items-count"><i class="fa fa-minus">&nbsp;</i></button>
                                 <input type="text" name="quantity" value="<?php echo $minimum; ?>" data-toggle="tooltip" title="<?php echo $entry_qty; ?>" size="2" class="input-quantity form-control" />
                                 <button type="button" class="plus items-count2"><i class="fa fa-plus">&nbsp;</i></button>
                                 <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                              </div>
                              &nbsp;&nbsp;&nbsp;			
                              <?php if ($aurus_wishlist_cat !=1 && !$aridius_qckview_button_wish) { ?>
                              <button type="button" data-toggle="tooltip" class="btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
                              <?php } ?>
                              <?php if ($aurus_compare_cat !=1 && !$aridius_qckview_button_compare) { ?>
                              <button type="button" data-toggle="tooltip" class="btn-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
                              <?php } ?>	
                              <div class="clearfix"></div>
                              <div class="cart" >
                                 <?php if ($quantity <= 0 && $aridiusinstock_status ) { ?>
                                 <button type="button" class="btn-instock" onclick="instock.add('<?php echo $product_id; ?>');" data-product-id="<?php echo $product_id; ?>"><?php echo $button_instock; ?></button>
                                 <?php } else { ?>
                                 <button type="button" id="button-cart_quickw" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart product"><i class="fa fa-shopping-cart hidden-xs hidden-sm"></i> <?php echo $button_cart; ?></button>
                                 <?php } ?>
                              </div>
                              <?php if ($minimum > 1) { ?>
                              <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                              <?php } ?>
                           </div>
                           <div class="clearfix"></div>
                           <?php if ($minimum > 1) { ?>
                           <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                           <?php } ?>
                        </div>
                     </div>
                  </div>
                  <?php if (!$aridius_qckview_tab_description) { ?>
                  <div class="tab-pane" id="tab-description"><?php echo $description; ?></div>
                  <?php } ?>
                  <?php if ($attribute_groups && !$aridius_qckview_tab_character) { ?>
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
                  <?php if ($review_status && !$aridius_qckview_tab_reviews) { ?>
                  <div class="tab-pane" id="tab-review">
                     <form class="form-horizontal" id="form-review">
                        <div id="review"></div>
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
                  <?php if ($custom_tabs && !$aridius_qckview_tab_additional) { ?>
                  <?php foreach ($custom_tabs as $key => $custom_tab) { ?>
                  <?php if ($custom_tab['title']) { ?>
                  <div class="tab-pane" id="custom_tabs-<?php echo $key?>"><?php echo $custom_tab['description']; ?></div>
                  <?php } ?>
                  <?php } ?>	
                  <?php } ?>		
                  <?php if ($aurus_top_links7 && !$aridius_qckview_tab_additional) { ?>
                  <?php foreach ($aurus_top_links7 as $key => $aurus_top_link7) { ?>			
                  <?php if ($aurus_top_link7['title'][$language_id]) { ?>
                  <div class="tab-pane" id="tabadd-<?php echo $key ?>"><?php echo html_entity_decode($aurus_top_link7['description'][$language_id]); ?></div>
                  <?php } ?>
                  <?php } ?>				
                  <?php } ?>
               </div>
            </div>
         </div>
      </div>
      <script src="catalog/view/javascript/jquery/datetimepicker/moment.js"></script>
      <script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"></script>
      <link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
      <script src="catalog/view/theme/aurus/js/bootstrap_rating/bootstrap-rating.js"></script>
      <!-- add cart -->	
      <script><!--
         $('#button-cart_quickw').on('click', function() {
         	$.ajax({
         url: 'index.php?route=checkout/cart/add',
         type: 'post',
         data: $('#product_quickw input[type=\'text\'], #product_quickw input[type=\'hidden\'], #product_quickw input[type=\'radio\']:checked, #product_quickw input[type=\'checkbox\']:checked, #product_quickw select, #product_quickw textarea'),
         dataType: 'json',
         beforeSend: function() {
         			$('#button-cart_quickw').button('loading');
         		},
         complete: function() {
         			$('#button-cart_quickw').button('reset');
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
            $.magnificPopup.close();
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
      <!-- datetimepicker -->	
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
      <!--review stars -->
      <script><!--
         $(".review_profile").click(function (){
         	var tabTop = $(".nav-tabs").offset().top;
         	$("html, body").animate({ scrollTop:tabTop }, 800);
         });
         //-->
      </script>
      <!--review -->
      <script><!--
         $('#review').delegate('.pagination a', 'click', function(e) {
         	e.preventDefault();
         	$('#review').fadeOut('slow');
         	$('#review').load(this.href);
         	$('#review').fadeIn('slow');
         });
         $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
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
         });
         //-->
      </script>
      <script><!--
         <!--timerpopup -->
         var popupq;
         function get_timerpopup(isstart) {
         	if (!isstart) {clearTimeout (popupq);return;}
         	<?php
            $special_res= false;
            if (($special && $special_date_end > $special_date_start)&&($aurus_product_timer !=1)) {
            	$special_res= true;
            	$date_out = date('Y, m, d', strtotime($special_date_end));
            	?>	
         		get_timer2();
         		popupq = setInterval(get_timer2,1000);
         		<?php } ?>
         }
         function get_timer2() {
         	var timeendpopup= new Date();
         	timeendpopup = new Date(<?php if ($special_res) echo $date_out; ?>);
         	var day = new Date();
         	day.setMonth(day.getMonth() + 1);
         	day = Math.floor((timeendpopup-day)/1000);
         	var sec=day%60; day=Math.floor(day/60); 
         	var min=day%60; day=Math.floor(day/60);
         	var hour=day%24; day=Math.floor(day/24);
         	if(day<10)day='0'+day;
         	if(hour<10)hour='0'+hour;
         	if(min<10)min='0'+min;
         	if(sec<10)sec='0'+sec;
            var timestr =  "<span class='special-timer-info'>" +day+  "</span><span class='special-timer-line'>&ndash;</span><span class='special-timer-info'>"  +hour+ "</span><span class='special-timer-line'>&ndash;</span><span class='special-timer-info'>"  +min+  "</span><span class='special-timer-line'>&ndash;</span><span class='special-timer-info'>"   +sec+ "</span><br/><span class='special-timer-text1'><?php echo $day; ?></span><span class='special-timer-text2'><?php echo $hour; ?></span><span class='special-timer-text3'><?php echo $minute; ?></span><span class='special-timer-text4'><?php echo $second; ?></span>";
         	document.getElementById('time_outpopup').innerHTML=timestr;
         }
         //-->
      </script>
      <!-- + / - -->
      <script><!--
         function minus(){
         if(document.getElementsByClassName ("input-quantity")[0].value <= 1) {
         return false;
         }
         document.getElementsByClassName ("input-quantity")[0].value --;
         };
         function plus(){
         document.getElementsByClassName ("input-quantity")[0].value ++;
         };
         $('.minus').click(function(){
         minus();
         });
         $('.plus').click(function(){
         plus();
         });
         //-->
      </script>
      <script>
         $(function() {
         	function getData3(slider) {
         	  	var slides2 = slider.slides;
         		var activeIndex2 = slider.activeIndex;
         		var $currentSlide2 = $(slides2[activeIndex2]);
         		var $currentImage2 = $currentSlide2.find('img');
         	  	return {
         	  		slides2: slides2,
         			activeIndex2: activeIndex2,
         			$currentSlide2: $currentSlide2,
         			$currentImage2: $currentImage2
         	  	}
         	 }
         	  var $gallery2 = $('.demo-galleryqv');
         	  var $slides2 = $gallery2.find('.main-imageqv');
         	  if ($slides2.length > 1) {
         		  var initialSlide2 = 0;
         		  window.mainCarousel2;
         		  window.thumbCarousel2 = new Swiper ('#additional', {
         		  	initialSlide2: initialSlide2,
         		    slidesPerView: 4,
         breakpoints: {
           768: {
             slidesPerView: 3,
            },
           992: {
             slidesPerView: 5,
               },
           1200: {
             slidesPerView: 3,
            },
             1600: {
             slidesPerView: 4,
            }
         },
         navigation: {
               nextEl: '.add_img_v2.swiper-button-next',
               prevEl: '.add_img_v2.swiper-button-prev',		
           },	
         		    on: {
         		    	init: function() {
         		    		$(this.slides[initialSlide2]).addClass('swiper-slide-selected');
         		    		window.mainCarousel2 = new Swiper ('.demo-galleryqv', {
         						slidesPerView: 1,
         						     pagination: {
               el: '.main_imgqv.swiper-pagination',
         clickable: true,
             },
         					    on: {
         					    	slideChange: function() {
         					    		var activeIndex2 = this.activeIndex;
         					    		var thumbCarousel2 = window.thumbCarousel2;
         					    		var slides2 = thumbCarousel2.slides;
         					    		Object.values(slides2).forEach(function(slide) {
         					    			$(slide).removeClass('swiper-slide-selected');
         					    		});
         					    		$(slides2[activeIndex2]).addClass('swiper-slide-selected');
         					    		if (activeIndex2 < thumbCarousel2.slides.length) {
         					    			thumbCarousel2.slideTo(activeIndex2);
         					    		}
         					    	},
         		 
         					    }
         					  });
         		    	},
         		    	click: function(e) {
         		    		if (!window.mainCarousel2) return;
         		    		var index2 = this.clickedIndex;
         		    		window.mainCarousel2.slideTo(index2, 300);
         		    	}
         		    }
         		  });
         	  } else {
         	  	var $currentImage2 = $slides2.eq(0);
         	  }
         	<?php if ($aurus_imageadd_hover == '1') { ?>			  
         //Swiper Slider Mouse Hover		  
         $('#additional .swiper-slide').on('mouseover', function() {
         window.mainCarousel2.slideTo($(this).index());
         })
         <?php } ?>	  
         	});
      </script>
      <script><!--
         jQuery(document).ready(function () {
         	$('.imgpopcatqv').click( "click" , function(event){
         		var $gallery2 = $('.demo-galleryqv');
         		var $slides2 = $gallery2.find('.main-imageqv');
         		var $this = $(this);
         		if ($slides2.length > 1) {
         			var mainCarousel2 = window.mainCarousel2;
         			if (!mainCarousel2) return false;
         			var slides2 = mainCarousel2.slides;
         			var popPath = $this.data('image');
         			var index2 = 0;
         			Object.values(slides2).forEach(function(slide, idx) {
         				var $img = $(slide).find('img');
         				if ($img.prop('src') === popPath) index2 = idx;
         			});
         			 mainCarousel2.slideTo(index2, 300);
         		} else {
         			var img = $this.attr('data-image');
         			var title = $this.attr('title');
         			var imgphoto = $this.data('zoomImage');
         			var $mainImage = $('#main-imageqv');
         			$mainImage.attr("src" , img);
         			$mainImage.data('zoomImage', imgphoto);
         		}
         	});
         });
         //-->
      </script>
   </div>
</div>