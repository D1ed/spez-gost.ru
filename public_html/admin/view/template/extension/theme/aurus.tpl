<?php echo $header; ?><?php echo $column_left; ?>
<?php
   foreach ($languages as $language) {
   if(!isset($aurus_name_sticker_menu_new[$language['language_id']])) $aurus_name_sticker_menu_new[$language['language_id']]        = "NEW";
   if(!isset($aurus_name_sticker_menu_top[$language['language_id']])) $aurus_name_sticker_menu_top[$language['language_id']]        = "TOP";
   if(!isset($aurus_name_sticker_menu_sale[$language['language_id']])) $aurus_name_sticker_menu_sale[$language['language_id']]      = "SALE";
   if(!isset($aurus_longitude_fluid_map[$language['language_id']])) $aurus_longitude_fluid_map[$language['language_id']]            = "30.3518969";
   if(!isset($aurus_latitude_fluid_map[$language['language_id']])) $aurus_latitude_fluid_map[$language['language_id']]              = "59.9324357";
   if(!isset($aurus_name_sticker_product_new[$language['language_id']])) $aurus_name_sticker_product_new[$language['language_id']]        = "NEW";
   if(!isset($aurus_name_sticker_product_top[$language['language_id']])) $aurus_name_sticker_product_top[$language['language_id']]        = "TOP";
   if(!isset($aurus_vmenu_menu[$language['language_id']])) $aurus_vmenu_menu[$language['language_id']]        = "КАТАЛОГ ТОВАРОВ";
   if(!isset($aurus_seeall_menu[$language['language_id']])) $aurus_seeall_menu[$language['language_id']]        = "Смотреть все";
   if(!isset($aurus_license_text[$language['language_id']])) $aurus_license_text[$language['language_id']]        = "Работает на <a href='http://myopencart.com/' target='_blank'>ocStore</a> Aurus © 2016";
   if(!isset($aurus_pr_attribute_seeall[$language['language_id']])) $aurus_pr_attribute_seeall[$language['language_id']]        = "смотреть все";
   }
   if(!isset($aurus_categories_2lv_width)) $aurus_categories_2lv_width      = "165";
   if(!isset($aurus_categories_2lv_height)) $aurus_categories_2lv_height    = "100";
   if(!isset($aurus_photos_menu_width)) $aurus_photos_menu_width      = "181";
   if(!isset($aurus_photos_menu_height)) $aurus_photos_menu_height    = "106";
   if(!isset($aurus_photos_width_image_main)) $aurus_photos_width_image_main      = "150";
   if(!isset($aurus_photos_height_image_main)) $aurus_photos_height_image_main    = "250";
   if(!isset($aurus_photos_menuman_width)) $aurus_photos_menuman_width      = "50";
   if(!isset($aurus_photos_menuman_height)) $aurus_photos_menuman_height    = "50";
   if(!isset($aurus_product_man_width)) $aurus_product_man_width      = "50";
   if(!isset($aurus_product_man_height)) $aurus_product_man_height    = "50";
   if(!isset($aurus_sticker_product_new_day)) $aurus_sticker_product_new_day    = "90";
   if(!isset($aurus_sticker_product_top_rating)) $aurus_sticker_product_top_rating    = "5";
   if(!isset($aurus_sticker_product_top_viewed)) $aurus_sticker_product_top_viewed    = "200";
   if(!isset($aurus_limit_symbolst)) $aurus_limit_symbolst    = "55";
   if(!isset($aurus_limit_atr)) $aurus_limit_atr    = "5";
   if(!isset($aurus_fluid_map_zoom)) $aurus_fluid_map_zoom    = "14";
   if(!isset($aurus_product_raiting)) $aurus_product_raiting    = "5";
   if(!isset($text_cart_relprlimit)) $text_cart_relprlimit    = "10";  
   if(!isset($aurus_product_optionimg_width)) $aurus_product_optionimg_width    = "70";
   if(!isset($aurus_product_optionimg_height)) $aurus_product_optionimg_height    = "70";
   if(!isset($aurus_product_clone_width)) $aurus_product_clone_width    = "95";
   if(!isset($aurus_product_clone_height)) $aurus_product_clone_height    = "95";
   if(!isset($aurus_attribute_see)) $aurus_attribute_see    = "4";
   if(empty($aurus_height_symbolst)) $aurus_height_symbolst                             = "33";
   if(empty($aurus_chars_desc)) $aurus_chars_desc                             = "250";
   if(empty($aurus_color80)) $aurus_color80                             = "1";
   if(empty($aurus_imageadd_q)) $aurus_imageadd_q                             = "6";
   if(empty($aurus_categories_limit_height)) $aurus_categories_limit_height                             = "150";
   if(empty($aurus_categories_limit)) $aurus_categories_limit                             = "2200";
   if(empty($aurus_footer_limit)) $aurus_footer_limit                             = "2200";
   if(empty($aurus_border_cart)) $aurus_border_cart                             = "0";
   if(empty($aurus_border_stickers)) $aurus_border_stickers                             = "0";
   ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <button type="submit" form="form-theme-aurus" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button>
            <a onclick="apply()" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_apply; ?>" ><i class="fa fa-check"></i>&nbsp;&nbsp;<?php echo $button_apply; ?></a>
            <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
         </div>
         <h1><?php echo $heading_title; ?></h1>
         <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
         </ul>
      </div>
   </div>
   <div class="container-fluid">
      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
         <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <div class="panel panel-default">
         <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
         </div>
         <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-theme-aurus" class="form-horizontal">
               <div class="form-group">
                  <div class="col-sm-12">
                     <ul id="myTab2" class="nav nav-tabs">
                        <li><a data-toggle="tab" href="#panely0"><?php echo $text_general; ?></a></li>
                        <li><a data-toggle="tab" href="#panely8"><?php echo $tab_common; ?></a></li>
                        <li><a data-toggle="tab" href="#panely11"><?php echo $tab_color; ?></a></li>
                        <li><a data-toggle="tab" href="#panely1"><?php echo $tab_header; ?></a></li>
                        <li><a data-toggle="tab" href="#panely4"><?php echo $tab_menu; ?></a></li>
                        <li><a data-toggle="tab" href="#panely6"><?php echo $tab_categories; ?></a></li>
                        <li><a data-toggle="tab" href="#panely7"><?php echo $tab_product2; ?></a></li>
                        <li><a data-toggle="tab" href="#panely2"><?php echo $tab_footer; ?></a></li>
                        <li><a data-toggle="tab" href="#panely5"><?php echo $tab_sticker; ?></a></li>
                        <li><a data-toggle="tab" href="#panely12"><?php echo $tab_cart; ?></a></li>
                        <li><a data-toggle="tab" href="#panely9"><?php echo $tab_counter; ?></a></li>
                        <li><a data-toggle="tab" href="#panely10"><?php echo $tab_css; ?></a></li>
						<!--  
                        <li><a data-toggle="tab" href="#panely14"><?php echo $tab_aridius; ?></a></li>
						-->
                     </ul>
                     <div class="tab-content">
                        <div id="panely0" class="tab-pane fade in active">
                           <fieldset>
                              <legend><?php echo $text_general; ?></legend>
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" for="input-directory"><span data-toggle="tooltip" title="<?php echo $help_directory; ?>"><?php echo $entry_directory; ?></span></label>
                                 <div class="col-sm-10">
                                    <select name="aurus_directory" id="input-directory" class="form-control">
                                       <?php foreach ($directories as $directory) { ?>
                                       <?php if ($directory == $aurus_directory) { ?>
                                       <option value="<?php echo $directory; ?>" selected="selected"><?php echo $directory; ?></option>
                                       <?php } else { ?>
                                       <option value="<?php echo $directory; ?>"><?php echo $directory; ?></option>
                                       <?php } ?>
                                       <?php } ?>
                                    </select>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                 <div class="col-sm-10">
                                    <select name="aurus_status" id="input-status" class="form-control">
                                       <?php if ($aurus_status) { ?>
                                       <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                       <option value="0"><?php echo $text_disabled; ?></option>
                                       <?php } else { ?>
                                       <option value="1"><?php echo $text_enabled; ?></option>
                                       <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                       <?php } ?>
                                    </select>
                                 </div>
                              </div>
                           </fieldset>
                           <fieldset>
                              <legend><?php echo $text_product; ?></legend>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-catalog-limit"><span data-toggle="tooltip" title="<?php echo $help_product_limit; ?>"><?php echo $entry_product_limit; ?></span></label>
                                 <div class="col-sm-10">
                                    <input type="text" name="aurus_product_limit" value="<?php echo $aurus_product_limit; ?>" placeholder="<?php echo $entry_product_limit; ?>" id="input-catalog-limit" class="form-control" />
                                    <?php if ($error_product_limit) { ?>
                                    <div class="text-danger"><?php echo $error_product_limit; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-description-limit"><span data-toggle="tooltip" title="<?php echo $help_product_description_length; ?>"><?php echo $entry_product_description_length; ?></span></label>
                                 <div class="col-sm-10">
                                    <input type="text" name="aurus_product_description_length" value="<?php echo $aurus_product_description_length; ?>" placeholder="<?php echo $entry_product_description_length; ?>" id="input-description-limit" class="form-control" />
                                    <?php if ($error_product_description_length) { ?>
                                    <div class="text-danger"><?php echo $error_product_description_length; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                           </fieldset>
                           <fieldset>
                              <legend><?php echo $text_image; ?></legend>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-image-category-width"><?php echo $entry_image_category; ?></label>
                                 <div class="col-sm-10">
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_category_width" value="<?php echo $aurus_image_category_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-category-width" class="form-control" />
                                       </div>
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_category_height" value="<?php echo $aurus_image_category_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                       </div>
                                    </div>
                                    <?php if ($error_image_category) { ?>
                                    <div class="text-danger"><?php echo $error_image_category; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-image-thumb-width"><?php echo $entry_image_thumb; ?></label>
                                 <div class="col-sm-10">
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_thumb_width" value="<?php echo $aurus_image_thumb_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-thumb-width" class="form-control" />
                                       </div>
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_thumb_height" value="<?php echo $aurus_image_thumb_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                       </div>
                                    </div>
                                    <?php if ($error_image_thumb) { ?>
                                    <div class="text-danger"><?php echo $error_image_thumb; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-image-popup-width"><?php echo $entry_image_popup; ?></label>
                                 <div class="col-sm-10">
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_popup_width" value="<?php echo $aurus_image_popup_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-popup-width" class="form-control" />
                                       </div>
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_popup_height" value="<?php echo $aurus_image_popup_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                       </div>
                                    </div>
                                    <?php if ($error_image_popup) { ?>
                                    <div class="text-danger"><?php echo $error_image_popup; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-image-product-width"><?php echo $entry_image_product; ?></label>
                                 <div class="col-sm-10">
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_product_width" value="<?php echo $aurus_image_product_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-product-width" class="form-control" />
                                       </div>
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_product_height" value="<?php echo $aurus_image_product_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                       </div>
                                    </div>
                                    <?php if ($error_image_product) { ?>
                                    <div class="text-danger"><?php echo $error_image_product; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-image-additional-width"><?php echo $entry_image_additional; ?></label>
                                 <div class="col-sm-10">
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_additional_width" value="<?php echo $aurus_image_additional_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-additional-width" class="form-control" />
                                       </div>
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_additional_height" value="<?php echo $aurus_image_additional_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                       </div>
                                    </div>
                                    <?php if ($error_image_additional) { ?>
                                    <div class="text-danger"><?php echo $error_image_additional; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-image-related"><?php echo $entry_image_related; ?></label>
                                 <div class="col-sm-10">
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_related_width" value="<?php echo $aurus_image_related_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-related" class="form-control" />
                                       </div>
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_related_height" value="<?php echo $aurus_image_related_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                       </div>
                                    </div>
                                    <?php if ($error_image_related) { ?>
                                    <div class="text-danger"><?php echo $error_image_related; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-image-compare"><?php echo $entry_image_compare; ?></label>
                                 <div class="col-sm-10">
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_compare_width" value="<?php echo $aurus_image_compare_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-compare" class="form-control" />
                                       </div>
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_compare_height" value="<?php echo $aurus_image_compare_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                       </div>
                                    </div>
                                    <?php if ($error_image_compare) { ?>
                                    <div class="text-danger"><?php echo $error_image_compare; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-image-wishlist"><?php echo $entry_image_wishlist; ?></label>
                                 <div class="col-sm-10">
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_wishlist_width" value="<?php echo $aurus_image_wishlist_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-wishlist" class="form-control" />
                                       </div>
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_wishlist_height" value="<?php echo $aurus_image_wishlist_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                       </div>
                                    </div>
                                    <?php if ($error_image_wishlist) { ?>
                                    <div class="text-danger"><?php echo $error_image_wishlist; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-image-cart"><?php echo $entry_image_cart; ?></label>
                                 <div class="col-sm-10">
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_cart_width" value="<?php echo $aurus_image_cart_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-cart" class="form-control" />
                                       </div>
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_cart_height" value="<?php echo $aurus_image_cart_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                       </div>
                                    </div>
                                    <?php if ($error_image_cart) { ?>
                                    <div class="text-danger"><?php echo $error_image_cart; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group required">
                                 <label class="col-sm-2 control-label" for="input-image-location"><?php echo $entry_image_location; ?></label>
                                 <div class="col-sm-10">
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_location_width" value="<?php echo $aurus_image_location_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-location" class="form-control" />
                                       </div>
                                       <div class="col-sm-6">
                                          <input type="text" name="aurus_image_location_height" value="<?php echo $aurus_image_location_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                       </div>
                                    </div>
                                    <?php if ($error_image_location) { ?>
                                    <div class="text-danger"><?php echo $error_image_location; ?></div>
                                    <?php } ?>
                                 </div>
                              </div>
                           </fieldset>
                        </div>
                        <div id="panely1" class="tab-pane fade in active">
                           <!-- 1 HEADER  -->
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_header_var; ?></label>
                              <div class="col-sm-9">
                                 <select name="aurus_header_var" class="form-control">
                                    <option value="1"<?php if($aurus_header_var == 1) { echo ' selected="selected"'; } ?>><?php echo $text_varh1; ?></option>
                                    <option value="2"<?php if($aurus_header_var == 2) { echo ' selected="selected"'; } ?>><?php echo $text_varh2; ?></option>
                                    <option value="3"<?php if($aurus_header_var == 3) { echo ' selected="selected"'; } ?>>  <?php echo $text_varh3; ?></option>
                                 </select>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ></label> 					   
                              <div class="col-sm-12">						   
                                 <input type="button" onClick="start()" class="btn btn-primary" id="color_header_v1" value="<?php echo $text_header_v1; ?>" />
                                 <input type="button" onClick="start()" class="btn btn-primary" id="color_header_v2" value="<?php echo $text_header_v2; ?>" />
                                 <input type="button" onClick="start()" class="btn btn-primary" id="color_header_v3" value="<?php echo $text_header_v3; ?>" />
                                 <input type="button" onClick="start()" class="btn btn-primary" id="color_header_v4" value="<?php echo $text_header_v4; ?>" />
                              </div>
                           </div>
                           <script><!--		
                              $('#color_header_v1').click(function() {
                              $("input[name='aurus_color4']").val("#ffffff");
                              $("input[name='aurus_color13']").val("#4F4E4E");
                              $("input[name='aurus_color14']").val("#ffffff");
                              $("input[name='aurus_color15']").val("#BEBEBE");
                              });
                           </script>
                           <script><!--		
                              $('#color_header_v2').click(function() {
                              $("input[name='aurus_color13']").val("#ffffff");
                              $("input[name='aurus_color14']").val("#000000");
                              $("input[name='aurus_color92']").val("#000000");
                              });
                           </script>
                           <script><!--		
                              $('#color_header_v3').click(function() {
                              $("input[name='aurus_color1']").val("#152a40");
                              $("input[name='aurus_color7']").val("#152a40");
                              $("input[name='aurus_color4']").val("#152a40");
                              $("input[name='aurus_color13']").val("#152a40");
                              $("input[name='aurus_color77']").val("#152a40");
                              $("input[name='aurus_color5']").val("#ffffff");
                              $("input[name='aurus_color6']").val("#ffffff");
                              $("input[name='aurus_color11']").val("#ff2666");
                              $("input[name='aurus_color12']").val("#ff6593");
                              $("input[name='aurus_color78']").val("#ffffff");
                              $("input[name='aurus_color79']").val("#bebebe");
                              $("input[name='aurus_color92']").val("#ffffff");
                              });
                           </script>				   
                           <script><!--		
                              $('#color_header_v4').click(function() {
                              $("input[name='aurus_color13']").val("#ffffff");
                              $("input[name='aurus_color14']").val("#000000");
                              $("input[name='aurus_color92']").val("#000000");
                              });
                           </script>							   
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-cart_img"><?php echo $text_cart;?></label>
                              <div class="col-sm-9"><a href="" id="thumb-cart_img" data-toggle="image" class="img-thumbnail"><img src="<?php echo $aurus_cart_logo; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                 <input type="hidden" name="aurus_cart_img" value="<?php echo $aurus_cart_img; ?>" id="input-cart_img" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_topmenu; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_topmenu) { ?>
                                 <input type="radio" name="aurus_show_topmenu" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_topmenu" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_topmenu) { ?>
                                 <input type="radio" name="aurus_show_topmenu" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_topmenu" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_logo_width; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_logo_width) { ?>
                                 <input type="radio" name="aurus_logo_width" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_logo_width" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_logo_width) { ?>
                                 <input type="radio" name="aurus_logo_width" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_logo_width" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_calltop; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_calltop) { ?>
                                 <input type="radio" name="aurus_calltop" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_calltop" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_calltop) { ?>
                                 <input type="radio" name="aurus_calltop" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_calltop" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_set; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_set) { ?>
                                 <input type="radio" name="aurus_show_set" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_set" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_set) { ?>
                                 <input type="radio" name="aurus_show_set" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_set" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_topmenu_set; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_topmenu_set) { ?>
                                 <input type="radio" name="aurus_show_topmenu_set" value="0" />
                                 <?php echo $text_yes_set; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_topmenu_set" value="0" checked="checked" />
                                 <?php echo $text_yes_set; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_topmenu_set) { ?>
                                 <input type="radio" name="aurus_show_topmenu_set" value="1" />
                                 <?php echo $text_no_set; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_topmenu_set" value="1" checked="checked" />
                                 <?php echo $text_no_set; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_account_top; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_account_top) { ?>
                                 <input type="radio" name="aurus_account_top" value="0" />
                                 <?php echo $text_yes_set; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_account_top" value="0" checked="checked" />
                                 <?php echo $text_yes_set; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_account_top) { ?>
                                 <input type="radio" name="aurus_account_top" value="1" />
                                 <?php echo $text_no_set; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_account_top" value="1" checked="checked" />
                                 <?php echo $text_no_set; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_wishlist_top; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_wishlist_top) { ?>
                                 <input type="radio" name="aurus_wishlist_top" value="0" />
                                 <?php echo $text_yes_set; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_wishlist_top" value="0" checked="checked" />
                                 <?php echo $text_yes_set; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_wishlist_top) { ?>
                                 <input type="radio" name="aurus_wishlist_top" value="1" />
                                 <?php echo $text_no_set; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_wishlist_top" value="1" checked="checked" />
                                 <?php echo $text_no_set; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_compare_top; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_compare_top) { ?>
                                 <input type="radio" name="aurus_compare_top" value="0" />
                                 <?php echo $text_yes_set; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_compare_top" value="0" checked="checked" />
                                 <?php echo $text_yes_set; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_compare_top) { ?>
                                 <input type="radio" name="aurus_compare_top" value="1" />
                                 <?php echo $text_no_set; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_compare_top" value="1" checked="checked" />
                                 <?php echo $text_no_set; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_order_top; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_order_top) { ?>
                                 <input type="radio" name="aurus_order_top" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_order_top" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_order_top) { ?>
                                 <input type="radio" name="aurus_order_top" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_order_top" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_transaction_top; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_transaction_top) { ?>
                                 <input type="radio" name="aurus_transaction_top" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_transaction_top" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_transaction_top) { ?>
                                 <input type="radio" name="aurus_transaction_top" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_transaction_top" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_download_top; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_download_top) { ?>
                                 <input type="radio" name="aurus_download_top" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_download_top" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_download_top) { ?>
                                 <input type="radio" name="aurus_download_top" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_download_top" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <legend><?php echo $text_add_up_site; ?></legend>
                           <div class="row">
                              <div class="col-sm-3">
                                 <ul class="nav nav-pills nav-stacked" id="top_link6">
                                    <?php $top_link_row6 = 1; ?>
                                    <?php foreach ($top_links6 as $top_link6) { ?>
                                    <li><a href="#tab-top_link6-<?php echo $top_link_row6; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link6-<?php echo $top_link_row6; ?>\']').parent().remove(); $('#tab-top_link6-<?php echo $top_link_row6; ?>').remove(); $('#top_link6 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row6; ?></a></li>
                                    <?php $top_link_row6++; ?>
                                    <?php } ?>
                                    <li id="top_link6-add"><a onclick="addtop_link6();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link; ?></a></li>
                                 </ul>
                              </div>
                              <div class="col-sm-9">
                                 <div class="tab-content first6">
                                    <?php $top_link_row6 = 1; ?>
                                    <?php foreach ($top_links6 as $top_link6) { ?>
                                    <div class="tab-pane" id="tab-top_link6-<?php echo $top_link_row6; ?>">
                                       <div class="tab-content">
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_name_top; ?></label>
                                             <div class="col-sm-9">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                   <input type="text" class="form-control" name="aurus_top_links6[<?php echo $top_link_row6; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link6['title'][$language['language_id']]) ? $top_link6['title'][$language['language_id']] : ''; ?>" size="40" />
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>
                                             <div class="col-sm-9">
                                                <input type="text" class="form-control" name="aurus_top_links6[<?php echo $top_link_row6; ?>][faicons_top]" value="<?php echo isset($top_link6['faicons_top']) ? $top_link6['faicons_top'] : ''; ?>" />
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>
                                             <div class="col-sm-9">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                   <input type="text" class="form-control" name="aurus_top_links6[<?php echo $top_link_row6; ?>][link_top][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link6['link_top'][$language['language_id']]) ? $top_link6['link_top'][$language['language_id']] : ''; ?>" size="40" />
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                       </div>
                                       <?php $top_link_row6++; ?>
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_add_link; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_add_link) { ?>
                                 <input type="radio" name="aurus_show_add_link" value="0" />
                                 <?php echo $text_yes_set; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_add_link" value="0" checked="checked" />
                                 <?php echo $text_yes_set; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_add_link) { ?>
                                 <input type="radio" name="aurus_show_add_link" value="1" />
                                 <?php echo $text_no_set; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_add_link" value="1" checked="checked" />
                                 <?php echo $text_no_set; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                        </div>
                        <!-- 2 tab FOOTER -->
                        <div id="panely2" class="tab-pane fade">
                           <legend><?php echo $text_colorlegend18;?></legend>
                           <button type="button" class="btn btn-outline-dark">
                           <a id="togglemap" href="javascript:void(0);" onclick="viewmap('map_api');" data-text-show="<?php echo $text_fluid_map_apih; ?>" data-text-hide="<?php echo $text_fluid_map_api; ?>"><?php echo $text_fluid_map_api; ?></a>
                           </button>
                           <div id="map_api" style="display:none;">
                              <div class="form-group">
                                 <label class="col-sm-3 control-label" for="input-fluid_map_zoom"><?php echo $text_fluid_map_key; ?></label>
                                 <div class="col-sm-9">
                                    <input type="text" name="aurus_fluid_map_key" value="<?php echo $aurus_fluid_map_key; ?>" id="input-fluid_map_key" class="form-control" />
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-3 control-label" for="input-footerimg"><?php echo $text_iconmap_footer; ?></label>
                                 <div class="col-sm-9"><a href="" id="thumb-footerimg" data-toggle="image" class="img-thumbnail"><img src="<?php echo $aurus_footer_img; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                    <input type="hidden" name="aurus_footer_imgico" value="<?php echo $aurus_footer_imgico; ?>" id="input-footerimg" />
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-3 control-label"><?php echo $text_latitude_fluid_map; ?></label>
                                 <div class="col-sm-9">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
                                       <span class="input-group-addon">
                                       <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                       </span>
                                       <input name="aurus_latitude_fluid_map[<?php echo $language['language_id']; ?>]" value="<?php echo $aurus_latitude_fluid_map[$language['language_id']]; ?>" class="form-control" />
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-3 control-label"><?php echo $text_longitude_fluid_map; ?></label>
                                 <div class="col-sm-9">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
                                       <span class="input-group-addon">
                                       <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                       </span>
                                       <input name="aurus_longitude_fluid_map[<?php echo $language['language_id']; ?>]" value="<?php echo $aurus_longitude_fluid_map[$language['language_id']]; ?>" class="form-control" />
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-3 control-label" for="input-product"><?php echo $text_maps_logo; ?></label>
                                 <div class="col-sm-9">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
                                       <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                       <input type="text" name="aurus_description_map_logo[<?php echo $language['language_id']; ?>]" value="<?php echo $aurus_description_map_logo[$language['language_id']]; ?>" id="input-description_map_logo" class="form-control" />
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-3 control-label" ><?php echo $text_show_info_marker_block; ?></label>
                                 <div class="col-sm-9">
                                    <label class="radio-inline">
                                    <?php if ($aurus_show_info_marker_block) { ?>
                                    <input type="radio" name="aurus_show_info_marker_block" value="0" />
                                    <?php echo $text_yes; ?>
                                    <?php } else { ?>
                                    <input type="radio" name="aurus_show_info_marker_block" value="0" checked="checked" />
                                    <?php echo $text_yes; ?>
                                    <?php } ?>
                                    </label>
                                    <label class="radio-inline">
                                    <?php if (!$aurus_show_info_marker_block) { ?>
                                    <input type="radio" name="aurus_show_info_marker_block" value="1" />
                                    <?php echo $text_no; ?>
                                    <?php } else { ?>
                                    <input type="radio" name="aurus_show_info_marker_block" value="1" checked="checked" />
                                    <?php echo $text_no; ?>
                                    <?php } ?>
                                    </label>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-3 control-label" for="input-fluid_map_zoom"><?php echo $text_fluid_map_zoom; ?></label>
                                 <div class="col-sm-9">
                                    <input type="text" name="aurus_fluid_map_zoom" value="<?php echo $aurus_fluid_map_zoom; ?>" id="input-fluid_map_zoom" class="form-control" />
                                 </div>
                              </div>
                              <div class="row">
                                 <div class="col-sm-3">
                                    <ul class="nav nav-pills nav-stacked" id="map_link">
                                       <?php $map_link_row  = 1; ?>
                                       <?php foreach ($map_links as $map_link) { ?>
                                       <li><a href="#tab-map_link-<?php echo $map_link_row ; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-map_link-<?php echo $map_link_row ; ?>\']').parent().remove(); $('#tab-map_link-<?php echo $map_link_row ; ?>').remove(); $('#map_link a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $map_link_row; ?></a></li>
                                       <?php $map_link_row++; ?>
                                       <?php } ?>
                                       <li id="map_link-add"><a onclick="addtop_linkmap();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_map ; ?></a></li>
                                    </ul>
                                 </div>
                                 <div class="col-sm-9">
                                    <div class="tab-content first33">
                                       <?php $map_link_row  = 1; ?>
                                       <?php foreach ($map_links as $map_link) { ?>
                                       <div class="tab-pane" id="tab-map_link-<?php echo $map_link_row ; ?>">
                                          <div class="tab-content">
                                             <div class="form-group">
                                                <label class="col-sm-3 control-label" ><?php echo $text_latitude_fluid_map ; ?></label>
                                                <div class="col-sm-9">
                                                   <?php foreach ($languages as $language) { ?>
                                                   <div class="input-group">
                                                      <span class="input-group-addon"><img src="language/<?php echo $language['code'] ; ?>/<?php echo $language['code'] ; ?>.png" title="<?php echo $language['name'] ; ?>" /></span>
                                                      <input type="text" class="form-control" name="aurus_map_links[<?php echo $map_link_row ; ?>][latitude][<?php echo $language['language_id'] ; ?>]"
                                                         value="<?php echo isset($map_link['latitude'][$language['language_id']]) ? $map_link['latitude'][$language['language_id']] : ''; ?>" size="40" />
                                                   </div>
                                                   <?php } ?>
                                                </div>
                                             </div>
                                             <div class="form-group">
                                                <label class="col-sm-3 control-label" ><?php echo $text_longitude_fluid_map ; ?></label>
                                                <div class="col-sm-9">
                                                   <?php foreach ($languages as $language) { ?>
                                                   <div class="input-group">
                                                      <span class="input-group-addon"><img src="language/<?php echo $language['code'] ; ?>/<?php echo $language['code'] ; ?>.png" title="<?php echo $language['name'] ; ?>" /></span>
                                                      <input type="text" class="form-control" name="aurus_map_links[<?php echo $map_link_row ; ?>][longitude][<?php echo $language['language_id'] ; ?>]"
                                                         value="<?php echo isset($map_link['longitude'][$language['language_id']]) ? $map_link['longitude'][$language['language_id']] : ''; ?>" size="40" />
                                                   </div>
                                                   <?php } ?>
                                                </div>
                                             </div>
                                             <div class="form-group">
                                                <label class="col-sm-3 control-label" ><?php echo $text_maps_logo ; ?></label>
                                                <div class="col-sm-9">
                                                   <?php foreach ($languages as $language) { ?>
                                                   <div class="input-group">
                                                      <span class="input-group-addon"><img src="language/<?php echo $language['code'] ; ?>/<?php echo $language['code'] ; ?>.png" title="<?php echo $language['name'] ; ?>" /></span>
                                                      <input type="text" class="form-control" name="aurus_map_links[<?php echo $map_link_row ; ?>][title][<?php echo $language['language_id'] ; ?>]"
                                                         value="<?php echo isset($map_link['title'][$language['language_id']]) ? $map_link['title'][$language['language_id']] : ''; ?>" size="40" />
                                                   </div>
                                                   <?php } ?>
                                                </div>
                                             </div>
                                          </div>
                                          <?php $map_link_row++; ?>
                                       </div>
                                       <?php } ?>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <script>
                              function viewmap(id) {
                                  var el = document.getElementById(id);
                                  var link = document.getElementById('togglemap');
                                  if (el.style.display == "block") {
                                      el.style.display = "none";
                                      link.innerText = link.getAttribute('data-text-hide');
                                  } else {
                                      el.style.display = "block";
                                      link.innerText = link.getAttribute('data-text-show');
                                  }
                              }
                           </script>			   
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_map_noapi; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_map_noapi) { ?>
                                 <input type="radio" name="aurus_map_noapi" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_map_noapi" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_map_noapi) { ?>
                                 <input type="radio" name="aurus_map_noapi" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_map_noapi" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_fluid_map_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_fluid_map_footer) { ?>
                                 <input type="radio" name="aurus_show_fluid_map_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_fluid_map_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_fluid_map_footer) { ?>
                                 <input type="radio" name="aurus_show_fluid_map_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_fluid_map_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_fluid_map_home ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_fluid_map_home) { ?>
                                 <input type="radio" name="aurus_show_fluid_map_home" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_fluid_map_home" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_fluid_map_home) { ?>
                                 <input type="radio" name="aurus_show_fluid_map_home" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_fluid_map_home" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_map_open; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_map_open) { ?>
                                 <input type="radio" name="aurus_show_map_open" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_map_open" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_map_open) { ?>
                                 <input type="radio" name="aurus_show_map_open" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_map_open" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_map_code; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                    <textarea name="aurus_mapcode[<?php echo $language['language_id']; ?>]" rows="3" placeholder="" id="input-aurus_mapcode[<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($aurus_mapcode[$language['language_id']]) ? $aurus_mapcode[$language['language_id']] : ''; ?></textarea>
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <legend><?php echo $text_colorlegend9;?></legend>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_phone_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_phone_footer) { ?>
                                 <input type="radio" name="aurus_phone_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_phone_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_phone_footer) { ?>
                                 <input type="radio" name="aurus_phone_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_phone_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_time_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_time_footer) { ?>
                                 <input type="radio" name="aurus_time_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_time_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_time_footer) { ?>
                                 <input type="radio" name="aurus_time_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_time_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_mail_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_mail_footer) { ?>
                                 <input type="radio" name="aurus_mail_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mail_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_mail_footer) { ?>
                                 <input type="radio" name="aurus_mail_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mail_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_address_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_address_footer) { ?>
                                 <input type="radio" name="aurus_address_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_address_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_address_footer) { ?>
                                 <input type="radio" name="aurus_address_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_address_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_account_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_account_footer) { ?>
                                 <input type="radio" name="aurus_account_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_account_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_account_footer) { ?>
                                 <input type="radio" name="aurus_account_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_account_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_order_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_order_footer) { ?>
                                 <input type="radio" name="aurus_order_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_order_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_order_footer) { ?>
                                 <input type="radio" name="aurus_order_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_order_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_wishlist_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_wishlist_footer) { ?>
                                 <input type="radio" name="aurus_wishlist_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_wishlist_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_wishlist_footer) { ?>
                                 <input type="radio" name="aurus_wishlist_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_wishlist_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_newsletter_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_newsletter_footer) { ?>
                                 <input type="radio" name="aurus_newsletter_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_newsletter_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_newsletter_footer) { ?>
                                 <input type="radio" name="aurus_newsletter_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_newsletter_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_return_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_return_footer) { ?>
                                 <input type="radio" name="aurus_return_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_return_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_return_footer) { ?>
                                 <input type="radio" name="aurus_return_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_return_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_manufacturer_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_manufacturer_footer) { ?>
                                 <input type="radio" name="aurus_manufacturer_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_manufacturer_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_manufacturer_footer) { ?>
                                 <input type="radio" name="aurus_manufacturer_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_manufacturer_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_voucher_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_voucher_footer) { ?>
                                 <input type="radio" name="aurus_voucher_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_voucher_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_voucher_footer) { ?>
                                 <input type="radio" name="aurus_voucher_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_voucher_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_affiliate_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_affiliate_footer) { ?>
                                 <input type="radio" name="aurus_affiliate_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_affiliate_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_affiliate_footer) { ?>
                                 <input type="radio" name="aurus_affiliate_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_affiliate_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_sitemap_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_sitemap_footer) { ?>
                                 <input type="radio" name="aurus_sitemap_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sitemap_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_sitemap_footer) { ?>
                                 <input type="radio" name="aurus_sitemap_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sitemap_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_special_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_special_footer) { ?>
                                 <input type="radio" name="aurus_special_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_special_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_special_footer) { ?>
                                 <input type="radio" name="aurus_special_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_special_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_contact_footer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_contact_footer) { ?>
                                 <input type="radio" name="aurus_contact_footer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_contact_footer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_contact_footer) { ?>
                                 <input type="radio" name="aurus_contact_footer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_contact_footer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <legend><?php echo $text_colorlegend19;?></legend>
                           <div class="row">
                              <div class="col-sm-3">
                                 <ul class="nav nav-pills nav-stacked" id="top_link2">
                                    <?php $top_link_row2 = 1; ?>
                                    <?php foreach ($top_links2 as $top_link2) { ?>
                                    <li><a href="#tab-top_link2-<?php echo $top_link_row2; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link2-<?php echo $top_link_row2; ?>\']').parent().remove(); $('#tab-top_link2-<?php echo $top_link_row2; ?>').remove(); $('#top_link2 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row2; ?></a></li>
                                    <?php $top_link_row2++; ?>
                                    <?php } ?>
                                    <li id="top_link2-add"><a onclick="addtop_link2();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link_socseti; ?></a></li>
                                 </ul>
                              </div>
                              <div class="col-sm-9">
                                 <div class="tab-content first2">
                                    <?php $top_link_row2 = 1; ?>
                                    <?php foreach ($top_links2 as $top_link2) { ?>
                                    <div class="tab-pane" id="tab-top_link2-<?php echo $top_link_row2; ?>">
                                       <div class="tab-content">
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>
                                             <div class="col-sm-9">
                                                <input type="text" class="form-control" name="aurus_top_links2[<?php echo $top_link_row2; ?>][faicons_top]" value="<?php echo isset($top_link2['faicons_top']) ? $top_link2['faicons_top'] : ''; ?>" />
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>
                                             <div class="col-sm-9">
                                                <input type="text" class="form-control" name="aurus_top_links2[<?php echo $top_link_row2; ?>][link_top]" value="<?php echo isset($top_link2['link_top']) ? $top_link2['link_top'] : ''; ?>" />
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_hover; ?></label>
                                             <div class="col-sm-9">
                                                <input type="text" class="form-control" name="aurus_top_links2[<?php echo $top_link_row2; ?>][tooltipseti]" value="<?php echo isset($top_link2['tooltipseti']) ? $top_link2['tooltipseti'] : ''; ?>" />
                                             </div>
                                          </div>
                                       </div>
                                       <?php $top_link_row2++; ?>
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                           </div>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-footerpay"><?php echo $text_payimg;?></label>
                              <div class="col-sm-9"><a href="" id="thumb-footerpay" data-toggle="image" class="img-thumbnail"><img src="<?php echo $aurus_footerpay; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                 <input type="hidden" name="aurus_footer_pay" value="<?php echo $aurus_footer_pay; ?>" id="input-footerpay" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-product"><?php echo $text_license; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                    <input type="text" name="aurus_license_text[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_license_text[$language['language_id']]) ? $aurus_license_text[$language['language_id']] : ''; ?>" id="input-aurus_license_text" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                        </div>
                        <!--////////////////////////////////////////////////////////////////////////////////////// -->
                        <!-- 4 tab -->
                        <div id="panely4" class="tab-pane fade">
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_sticky_menu; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_sticky_menu) { ?>
                                 <input type="radio" name="aurus_sticky_menu" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sticky_menu" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_sticky_menu) { ?>
                                 <input type="radio" name="aurus_sticky_menu" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sticky_menu" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-color80"><?php echo $text_color80; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_color80" value="<?php echo $aurus_color80; ?>" id="input-color80" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_hover_menu; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_hover_menu) { ?>
                                 <input type="radio" name="aurus_hover_menu" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_hover_menu" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_hover_menu) { ?>
                                 <input type="radio" name="aurus_hover_menu" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_hover_menu" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_col1_menu; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_col1_menu) { ?>
                                 <input type="radio" name="aurus_col1_menu" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_col1_menu" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_col1_menu) { ?>
                                 <input type="radio" name="aurus_col1_menu" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_col1_menu" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_ico_home; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_ico_home) { ?>
                                 <input type="radio" name="aurus_ico_home" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_ico_home" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_ico_home) { ?>
                                 <input type="radio" name="aurus_ico_home" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_ico_home" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_photos_menu; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_photos_menu) { ?>
                                 <input type="radio" name="aurus_photos_menu" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_photos_menu" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_photos_menu) { ?>
                                 <input type="radio" name="aurus_photos_menu" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_photos_menu" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_main_photos_menu; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_main_photos_menu) { ?>
                                 <input type="radio" name="aurus_main_photos_menu" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_main_photos_menu" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_main_photos_menu) { ?>
                                 <input type="radio" name="aurus_main_photos_menu" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_main_photos_menu" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-width"><?php echo $text_photos_menu_width; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_photos_menu_width" value="<?php echo $aurus_photos_menu_width; ?>" id="input-width-menu" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-height"><?php echo $text_photos_menu_height; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_photos_menu_height" value="<?php echo $aurus_photos_menu_height; ?>" id="input-height-menu" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-width_main"><?php echo $text_photos_width_image_main; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_photos_width_image_main" value="<?php echo $aurus_photos_width_image_main; ?>" id="input-width-menu_main" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-height_main"><?php echo $text_photos_height_image_main; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_photos_height_image_main" value="<?php echo $aurus_photos_height_image_main; ?>" id="input-height-menu_main" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_3lv_menu; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_3lv_menu) { ?>
                                 <input type="radio" name="aurus_3lv_menu" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_3lv_menu" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_3lv_menu) { ?>
                                 <input type="radio" name="aurus_3lv_menu" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_3lv_menu" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_info_menu; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_info_menu) { ?>
                                 <input type="radio" name="aurus_info_menu" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_info_menu" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_info_menu) { ?>
                                 <input type="radio" name="aurus_info_menu" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_info_menu" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <legend><?php echo $text_colorlegend13;?></legend>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_main_link_menu; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_main_link_menu[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_main_link_menu[$language['language_id']]) ? $aurus_main_link_menu[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_main_link_href_menu; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_main_link_href_menu[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_main_link_href_menu[$language['language_id']]) ? $aurus_main_link_href_menu[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <hr>
                           <div class="row">
                              <div class="col-sm-3">
                                 <ul class="nav nav-pills nav-stacked" id="top_link4">
                                    <?php $top_link_row4 = 1; ?>
                                    <?php foreach ($top_links4 as $top_link4) { ?>
                                    <li><a href="#tab-top_link4-<?php echo $top_link_row4; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link4-<?php echo $top_link_row4; ?>\']').parent().remove(); $('#tab-top_link4-<?php echo $top_link_row4; ?>').remove(); $('#top_link4 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row4; ?></a></li>
                                    <?php $top_link_row4++; ?>
                                    <?php } ?>
                                    <li id="top_link4-add"><a onclick="addtop_link4();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link4; ?></a></li>
                                 </ul>
                              </div>
                              <div class="col-sm-9">
                                 <div class="tab-content first4">
                                    <?php $top_link_row4 = 1; ?>
                                    <?php foreach ($top_links4 as $top_link4) { ?>
                                    <div class="tab-pane" id="tab-top_link4-<?php echo $top_link_row4; ?>">
                                       <div class="tab-content">
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_name_top; ?></label>
                                             <div class="col-sm-9">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                   <input type="text" class="form-control" name="aurus_top_links4[<?php echo $top_link_row4; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link4['title'][$language['language_id']]) ? $top_link4['title'][$language['language_id']] : ''; ?>" size="40" />
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>
                                             <div class="col-sm-9">
                                                <input type="text" class="form-control" name="aurus_top_links4[<?php echo $top_link_row4; ?>][faicons_top]" value="<?php echo isset($top_link4['faicons_top']) ? $top_link4['faicons_top'] : ''; ?>" />
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>
                                             <div class="col-sm-9">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                   <input type="text" class="form-control" name="aurus_top_links4[<?php echo $top_link_row4; ?>][link_top][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link4['link_top'][$language['language_id']]) ? $top_link4['link_top'][$language['language_id']] : ''; ?>" size="40" />
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                       </div>
                                       <?php $top_link_row4++; ?>
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <legend><?php echo $text_colorlegend14;?></legend>
                           <div class="row">
                              <div class="col-sm-3">
                                 <ul class="nav nav-pills nav-stacked" id="top_link8">
                                    <?php $top_link_row8 = 1; ?>
                                    <?php foreach ($top_links8 as $top_link8) { ?>
                                    <li><a href="#tab-top_link8-<?php echo $top_link_row8; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link8-<?php echo $top_link_row8; ?>\']').parent().remove(); $('#tab-top_link8-<?php echo $top_link_row8; ?>').remove(); $('#top_link8 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row8; ?></a></li>
                                    <?php $top_link_row8++; ?>
                                    <?php } ?>
                                    <li id="top_link8-add"><a onclick="addtop_link8();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link8; ?></a></li>
                                 </ul>
                              </div>
                              <div class="col-sm-9">
                                 <div class="tab-content first8">
                                    <?php $top_link_row8 = 1; ?>
                                    <?php foreach ($top_links8 as $top_link8) { ?>
                                    <div class="tab-pane" id="tab-top_link8-<?php echo $top_link_row8; ?>">
                                       <div class="tab-content">
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_name_top; ?></label>
                                             <div class="col-sm-9">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                   <input type="text" class="form-control" name="aurus_top_links8[<?php echo $top_link_row8; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link8['title'][$language['language_id']]) ? $top_link8['title'][$language['language_id']] : ''; ?>" size="80" />
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>
                                             <div class="col-sm-9">
                                                <input type="text" class="form-control" name="aurus_top_links8[<?php echo $top_link_row8; ?>][faicons_top]" value="<?php echo isset($top_link8['faicons_top']) ? $top_link8['faicons_top'] : ''; ?>" />
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>
                                             <div class="col-sm-9">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                   <input type="text" class="form-control" name="aurus_top_links8[<?php echo $top_link_row8; ?>][link_top][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link8['link_top'][$language['language_id']]) ? $top_link8['link_top'][$language['language_id']] : ''; ?>" size="80" />
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                       </div>
                                       <?php $top_link_row8++; ?>
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <legend><?php echo $text_colorlegend15;?></legend>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_seevmenu_menu; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_seevmenu_menu) { ?>
                                 <input type="radio" name="aurus_seevmenu_menu" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_seevmenu_menu" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_seevmenu_menu) { ?>
                                 <input type="radio" name="aurus_seevmenu_menu" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_seevmenu_menu" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_seevmenu_menu_open; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_seevmenu_menu_open) { ?>
                                 <input type="radio" name="aurus_seevmenu_menu_open" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_seevmenu_menu_open" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_seevmenu_menu_open) { ?>
                                 <input type="radio" name="aurus_seevmenu_menu_open" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_seevmenu_menu_open" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_seevmenuico; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_seevmenuico) { ?>
                                 <input type="radio" name="aurus_seevmenuico" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_seevmenuico" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_seevmenuico) { ?>
                                 <input type="radio" name="aurus_seevmenuico" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_seevmenuico" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_seevmenuw; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_seevmenuw) { ?>
                                 <input type="radio" name="aurus_seevmenuw" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_seevmenuw" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_seevmenuw) { ?>
                                 <input type="radio" name="aurus_seevmenuw" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_seevmenuw" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_vmenu_menu; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_vmenu_menu[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_vmenu_menu[$language['language_id']]) ? $aurus_vmenu_menu[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_seeall_menu; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_seeall_menu[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_seeall_menu[$language['language_id']]) ? $aurus_seeall_menu[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-countvmenulv"><?php echo $text_countvmenulv; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_countvmenulv" value="<?php echo $aurus_countvmenulv; ?>" id="input-countvmenulv-menu" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-link_menucatalog"><?php echo $text_link_menucatalog; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_link_menucatalog" value="<?php echo $aurus_link_menucatalog; ?>" id="input-link_menucatalog" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_menu_special; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_menu_special[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_menu_special[$language['language_id']]) ? $aurus_menu_special[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-link_special"><?php echo $text_link_special; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_link_special" value="<?php echo $aurus_link_special; ?>" id="input-link_special" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-aurus_vmenuheight"><?php echo $text_vmenuheight; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_vmenuheight" value="<?php echo $aurus_vmenuheight; ?>" id="input-aurus_vmenuheight" class="form-control" />
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <legend><?php echo $text_colorlegend17;?></legend>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_mob_logo; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_mob_logo) { ?>
                                 <input type="radio" name="aurus_mob_logo" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_logo" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_mob_logo) { ?>
                                 <input type="radio" name="aurus_mob_logo" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_logo" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_mob_home; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_mob_home) { ?>
                                 <input type="radio" name="aurus_mob_home" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_home" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_mob_home) { ?>
                                 <input type="radio" name="aurus_mob_home" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_home" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_mobcat_group; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_mobcat_group) { ?>
                                 <input type="radio" name="aurus_mobcat_group" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mobcat_group" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_mobcat_group) { ?>
                                 <input type="radio" name="aurus_mobcat_group" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mobcat_group" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_mob_tell; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_mob_tell) { ?>
                                 <input type="radio" name="aurus_mob_tell" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_tell" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_mob_tell) { ?>
                                 <input type="radio" name="aurus_mob_tell" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_tell" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_mob_work; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_mob_work) { ?>
                                 <input type="radio" name="aurus_mob_work" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_work" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_mob_work) { ?>
                                 <input type="radio" name="aurus_mob_work" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_work" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_mob_mail; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_mob_mail) { ?>
                                 <input type="radio" name="aurus_mob_mail" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_mail" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_mob_mail) { ?>
                                 <input type="radio" name="aurus_mob_mail" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_mail" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_mob_address; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_mob_address) { ?>
                                 <input type="radio" name="aurus_mob_address" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_address" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_mob_address) { ?>
                                 <input type="radio" name="aurus_mob_address" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_address" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_mob_cart; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_mob_cart) { ?>
                                 <input type="radio" name="aurus_mob_cart" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_cart" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_mob_cart) { ?>
                                 <input type="radio" name="aurus_mob_cart" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_cart" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_mob_account; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_mob_account) { ?>
                                 <input type="radio" name="aurus_mob_account" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_account" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_mob_account) { ?>
                                 <input type="radio" name="aurus_mob_account" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_mob_account" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                        </div>
                        <!-- 4 tab END -->
                        <!-- 5 tab -->
                        <div id="panely5" class="tab-pane fade">
                           <legend><?php echo $text_sticker_for_categoru;?></legend>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_sticker_menu; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_sticker_menu) { ?>
                                 <input type="radio" name="aurus_sticker_menu" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sticker_menu" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_sticker_menu) { ?>
                                 <input type="radio" name="aurus_sticker_menu" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sticker_menu" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_name_sticker_menu_new; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_name_sticker_menu_new[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_name_sticker_menu_new[$language['language_id']]) ? $aurus_name_sticker_menu_new[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_name_sticker_menu_top; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_name_sticker_menu_top[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_name_sticker_menu_top[$language['language_id']]) ? $aurus_name_sticker_menu_top[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_name_sticker_menu_sale; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_name_sticker_menu_sale[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_name_sticker_menu_sale[$language['language_id']]) ? $aurus_name_sticker_menu_sale[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <legend><?php echo $text_sticker_for_product;?></legend>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_sticker_sale_product_auto; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_sticker_sale_product_auto) { ?>
                                 <input type="radio" name="aurus_sticker_sale_product_auto" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sticker_sale_product_auto" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_sticker_sale_product_auto) { ?>
                                 <input type="radio" name="aurus_sticker_sale_product_auto" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sticker_sale_product_auto" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_sticker_new_product_auto; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_sticker_new_product_auto) { ?>
                                 <input type="radio" name="aurus_sticker_new_product_auto" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sticker_new_product_auto" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_sticker_new_product_auto) { ?>
                                 <input type="radio" name="aurus_sticker_new_product_auto" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sticker_new_product_auto" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_sticker_top_product_auto; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_sticker_top_product_auto) { ?>
                                 <input type="radio" name="aurus_sticker_top_product_auto" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sticker_top_product_auto" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_sticker_top_product_auto) { ?>
                                 <input type="radio" name="aurus_sticker_top_product_auto" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sticker_top_product_auto" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_name_sticker_product_new; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_name_sticker_product_new[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_name_sticker_product_new[$language['language_id']]) ? $aurus_name_sticker_product_new[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_name_sticker_product_top; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_name_sticker_product_top[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_name_sticker_product_top[$language['language_id']]) ? $aurus_name_sticker_product_top[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-day"><?php echo $text_sticker_product_new_day; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_sticker_product_new_day" value="<?php echo $aurus_sticker_product_new_day; ?>" id="input-day-st" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_sticker_product_rating_or_viewed; ?></label>
                              <div class="col-sm-9">
                                 <select name="aurus_sticker_product_top_ratinr" class="form-control">
                                    <option value="1"<?php if($aurus_sticker_product_top_ratinr == 1) { echo ' selected="selected"'; } ?>><?php echo $text_sticker_product_rating; ?></option>
                                    <option value="2"<?php if($aurus_sticker_product_top_ratinr == 2) { echo ' selected="selected"'; } ?>><?php echo $text_sticker_product_viewed; ?></option>
                                 </select>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-rating"><?php echo $text_sticker_product_top_rating; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_sticker_product_top_rating" value="<?php echo $aurus_sticker_product_top_rating; ?>" id="input-top-rating" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-viewed"><?php echo $text_sticker_product_top_viewed; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_sticker_product_top_viewed" value="<?php echo $aurus_sticker_product_top_viewed; ?>" id="input-top-viewed" class="form-control" />
                              </div>
                           </div>
                        </div>
                        <!-- 5 tab END -->
                        <!-- 6 tab categories -->
                        <div id="panely6" class="tab-pane fade">
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_description_top_or_bot; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_description_top_or_bot) { ?>
                                 <input type="radio" name="aurus_description_top_or_bot" value="0" />
                                 <?php echo $text_yes_top; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_description_top_or_bot" value="0" checked="checked" />
                                 <?php echo $text_yes_top; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_description_top_or_bot) { ?>
                                 <input type="radio" name="aurus_description_top_or_bot" value="1" />
                                 <?php echo $text_no_bot; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_description_top_or_bot" value="1" checked="checked" />
                                 <?php echo $text_no_bot; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_categories_img; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_categories_img) { ?>
                                 <input type="radio" name="aurus_categories_img" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_categories_img" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_categories_img) { ?>
                                 <input type="radio" name="aurus_categories_img" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_categories_img" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_description_pg1; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_description_pg1) { ?>
                                 <input type="radio" name="aurus_description_pg1" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_description_pg1" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_description_pg1) { ?>
                                 <input type="radio" name="aurus_description_pg1" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_description_pg1" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_categories_2lvshow; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_categories_2lvshow) { ?>
                                 <input type="radio" name="aurus_categories_2lvshow" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_categories_2lvshow" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_categories_2lvshow) { ?>
                                 <input type="radio" name="aurus_categories_2lvshow" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_categories_2lvshow" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_categories_2lv; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_categories_2lv) { ?>
                                 <input type="radio" name="aurus_categories_2lv" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_categories_2lv" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_categories_2lv) { ?>
                                 <input type="radio" name="aurus_categories_2lv" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_categories_2lv" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-width"><?php echo $text_categories_2lv_width; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_categories_2lv_width" value="<?php echo $aurus_categories_2lv_width; ?>" id="input-width-cat" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-height"><?php echo $text_categories_2lv_height; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_categories_2lv_height" value="<?php echo $aurus_categories_2lv_height; ?>" id="input-height-cat" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_count_cat; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_count_cat) { ?>
                                 <input type="radio" name="aurus_count_cat" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_count_cat" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_count_cat) { ?>
                                 <input type="radio" name="aurus_count_cat" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_count_cat" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_sort_cat; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_sort_cat) { ?>
                                 <input type="radio" name="aurus_sort_cat" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sort_cat" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_sort_cat) { ?>
                                 <input type="radio" name="aurus_sort_cat" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_sort_cat" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_description_length; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_description_length) { ?>
                                 <input type="radio" name="aurus_description_length" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_description_length" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_description_length) { ?>
                                 <input type="radio" name="aurus_description_length" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_description_length" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-limit"><?php echo $text_categories_limit; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_categories_limit" value="<?php echo $aurus_categories_limit; ?>" id="input-limit" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-width"><?php echo $text_categories_limit_height; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_categories_limit_height" value="<?php echo $aurus_categories_limit_height; ?>" id="input-limith" class="form-control" />
                              </div>
                           </div>
						   	<div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_showmore; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_showmore) { ?>
                                 <input type="radio" name="aurus_showmore" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_showmore" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_showmore) { ?>
                                 <input type="radio" name="aurus_showmore" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_showmore" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                        </div>
                        <!-- 6 tab END -->
                        <!-- 7 tab product -->
                        <div id="panely7" class="tab-pane fade">
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_elevatezoom; ?></label>
                              <div class="col-sm-9">
                                 <select name="aurus_elevatezoom" class="form-control">
                                    <option value="0"<?php if($aurus_elevatezoom < 1) { echo ' selected="selected"'; } ?>>Basic Zoom</option>
                                    <option value="2"<?php if($aurus_elevatezoom == 2) { echo ' selected="selected"'; } ?>>Inner Zoom</option>
                                    <option value="4"<?php if($aurus_elevatezoom == 4) { echo ' selected="selected"'; } ?>>Image Constrain Zoom</option>
                                    <option value="5"<?php if($aurus_elevatezoom == 5) { echo ' selected="selected"'; } ?>>No</option>
                                 </select>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_st_cart; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_st_cart) { ?>
                                 <input type="radio" name="aurus_st_cart" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_st_cart" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_st_cart) { ?>
                                 <input type="radio" name="aurus_st_cart" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_st_cart" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_short_desc; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_short_desc) { ?>
                                 <input type="radio" name="aurus_short_desc" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_short_desc" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_short_desc) { ?>
                                 <input type="radio" name="aurus_short_desc" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_short_desc" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-chars_desc"><?php echo $text_chars_desc; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_chars_desc" value="<?php echo $aurus_chars_desc; ?>" id="input-chars_desc" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_rating_pr; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_rating_pr) { ?>
                                 <input type="radio" name="aurus_rating_pr" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_rating_pr" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_rating_pr) { ?>
                                 <input type="radio" name="aurus_rating_pr" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_rating_pr" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_man; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_man) { ?>
                                 <input type="radio" name="aurus_man" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_man" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_man) { ?>
                                 <input type="radio" name="aurus_man" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_man" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_tab_img; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_tab_img) { ?>
                                 <input type="radio" name="aurus_show_tab_img" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_tab_img" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_tab_img) { ?>
                                 <input type="radio" name="aurus_show_tab_img" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_tab_img" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-chars_desc"><?php echo $text_imageadd_q; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_imageadd_q" value="<?php echo $aurus_imageadd_q; ?>" id="input-imageadd_q" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_imageadd_vertical; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_imageadd_vertical) { ?>
                                 <input type="radio" name="aurus_imageadd_vertical" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_imageadd_vertical" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_imageadd_vertical) { ?>
                                 <input type="radio" name="aurus_imageadd_vertical" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_imageadd_vertical" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_imageadd_hover; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_imageadd_hover) { ?>
                                 <input type="radio" name="aurus_imageadd_hover" value="0" />
                                 <?php echo $text_click; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_imageadd_hover" value="0" checked="checked" />
                                 <?php echo $text_click; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_imageadd_hover) { ?>
                                 <input type="radio" name="aurus_imageadd_hover" value="1" />
                                 <?php echo $text_hv; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_imageadd_hover" value="1" checked="checked" />
                                 <?php echo $text_hv; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_imageadd_nav; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_imageadd_nav) { ?>
                                 <input type="radio" name="aurus_imageadd_nav" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_imageadd_nav" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_imageadd_nav) { ?>
                                 <input type="radio" name="aurus_imageadd_nav" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_imageadd_nav" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_saving; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_saving) { ?>
                                 <input type="radio" name="aurus_show_saving" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_saving" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_saving) { ?>
                                 <input type="radio" name="aurus_show_saving" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_saving" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_stsale; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_stsale) { ?>
                                 <input type="radio" name="aurus_show_stsale" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_stsale" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_stsale) { ?>
                                 <input type="radio" name="aurus_show_stsale" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_stsale" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_tablsize; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_tablsize) { ?>
                                 <input type="radio" name="aurus_show_tablsize" value="0" />
                                 <?php echo $text_yes_u; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_tablsize" value="0" checked="checked" />
                                 <?php echo $text_yes_u; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_tablsize) { ?>
                                 <input type="radio" name="aurus_show_tablsize" value="1" />
                                 <?php echo $text_no_o; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_tablsize" value="1" checked="checked" />
                                 <?php echo $text_no_o; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_img_colleft; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_img_colleft) { ?>
                                 <input type="radio" name="aurus_img_colleft" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_img_colleft" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_img_colleft) { ?>
                                 <input type="radio" name="aurus_img_colleft" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_img_colleft" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_stock; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_stock) { ?>
                                 <input type="radio" name="aurus_product_stock" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_stock" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_stock) { ?>
                                 <input type="radio" name="aurus_product_stock" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_stock" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_size; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_size) { ?>
                                 <input type="radio" name="aurus_product_size" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_size" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_size) { ?>
                                 <input type="radio" name="aurus_product_size" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_size" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_weight; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_weight) { ?>
                                 <input type="radio" name="aurus_product_weight" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_weight" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_weight) { ?>
                                 <input type="radio" name="aurus_product_weight" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_weight" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_kod_tovara; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_kod_tovara) { ?>
                                 <input type="radio" name="aurus_product_kod_tovara" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_kod_tovara" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_kod_tovara) { ?>
                                 <input type="radio" name="aurus_product_kod_tovara" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_kod_tovara" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_man_img; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_man_img) { ?>
                                 <input type="radio" name="aurus_product_man_img" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_man_img" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_man_img) { ?>
                                 <input type="radio" name="aurus_product_man_img" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_man_img" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-product_raiting"><?php echo $text_product_raiting; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_product_raiting" value="<?php echo $aurus_product_raiting; ?>" id="input-product_raiting" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_timer; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_timer) { ?>
                                 <input type="radio" name="aurus_product_timer" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_timer" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_timer) { ?>
                                 <input type="radio" name="aurus_product_timer" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_timer" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_sticky_menu; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_sticky_menu) { ?>
                                 <input type="radio" name="aurus_product_sticky_menu" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_sticky_menu" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_sticky_menu) { ?>
                                 <input type="radio" name="aurus_product_sticky_menu" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_sticky_menu" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-width"><?php echo $text_product_man_width; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_product_man_width" value="<?php echo $aurus_product_man_width; ?>" id="input-width-man" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-height"><?php echo $text_product_man_height; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_product_man_height" value="<?php echo $aurus_product_man_height; ?>" id="input-height-man" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_options_mainimg; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_options_mainimg) { ?>
                                 <input type="radio" name="aurus_options_mainimg" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_options_mainimg" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_options_mainimg) { ?>
                                 <input type="radio" name="aurus_options_mainimg" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_options_mainimg" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_options_prise; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_options_prise) { ?>
                                 <input type="radio" name="aurus_options_prise" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_options_prise" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_options_prise) { ?>
                                 <input type="radio" name="aurus_options_prise" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_options_prise" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-optionimg_width"><?php echo $text_product_optionimg_width; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_product_optionimg_width" value="<?php echo $aurus_product_optionimg_width; ?>" id="input-optionimg_width" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-optionimg_height"><?php echo $text_product_optionimg_height; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_product_optionimg_height" value="<?php echo $aurus_product_optionimg_height; ?>" id="input-optionimg_height" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-clone_width"><?php echo $text_product_clone_imgw; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_product_clone_width" value="<?php echo $aurus_product_clone_width; ?>" id="input-clone_width" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-clone_height"><?php echo $text_product_clone_imgh; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_product_clone_height" value="<?php echo $aurus_product_clone_height; ?>" id="input-clone_height" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_show_share; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_show_share) { ?>
                                 <input type="radio" name="aurus_product_show_share" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_share" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_show_share) { ?>
                                 <input type="radio" name="aurus_product_show_share" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_share" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-height"><?php echo $text_product_share; ?></label>
                              <div class="col-sm-9">
                                 <textarea name="aurus_share" rows="15" placeholder="" id="input-aurus_share" class="form-control"><?php echo $aurus_share; ?></textarea>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_show_sku; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_show_sku) { ?>
                                 <input type="radio" name="aurus_product_show_sku" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_sku" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_show_sku) { ?>
                                 <input type="radio" name="aurus_product_show_sku" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_sku" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_show_upc; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_show_upc) { ?>
                                 <input type="radio" name="aurus_product_show_upc" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_upc" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_show_upc) { ?>
                                 <input type="radio" name="aurus_product_show_upc" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_upc" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_show_ean; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_show_ean) { ?>
                                 <input type="radio" name="aurus_product_show_ean" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_ean" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_show_ean) { ?>
                                 <input type="radio" name="aurus_product_show_ean" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_ean" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_show_jan; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_show_jan) { ?>
                                 <input type="radio" name="aurus_product_show_jan" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_jan" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_show_jan) { ?>
                                 <input type="radio" name="aurus_product_show_jan" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_jan" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_show_isbn; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_show_isbn) { ?>
                                 <input type="radio" name="aurus_product_show_isbn" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_isbn" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_show_isbn) { ?>
                                 <input type="radio" name="aurus_product_show_isbn" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_isbn" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_product_show_mpn; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_product_show_mpn) { ?>
                                 <input type="radio" name="aurus_product_show_mpn" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_mpn" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_product_show_mpn) { ?>
                                 <input type="radio" name="aurus_product_show_mpn" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_product_show_mpn" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_product_sku; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_product_sku[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_product_sku[$language['language_id']]) ? $aurus_product_sku[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_product_upc; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_product_upc[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_product_upc[$language['language_id']]) ? $aurus_product_upc[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_product_ean; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_product_ean[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_product_ean[$language['language_id']]) ? $aurus_product_ean[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_product_jan; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_product_jan[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_product_jan[$language['language_id']]) ? $aurus_product_jan[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_product_isbn; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_product_isbn[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_product_isbn[$language['language_id']]) ? $aurus_product_isbn[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_product_mpn; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_product_mpn[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_product_mpn[$language['language_id']]) ? $aurus_product_mpn[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_pr_attribute; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_attribute) { ?>
                                 <input type="radio" name="aurus_show_attribute" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_attribute" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_attribute) { ?>
                                 <input type="radio" name="aurus_show_attribute" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_attribute" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_attribute_line; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_attribute_line) { ?>
                                 <input type="radio" name="aurus_attribute_line" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_attribute_line" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_attribute_line) { ?>
                                 <input type="radio" name="aurus_attribute_line" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_attribute_line" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-attribute_see"><?php echo $text_pr_attribute_see; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_attribute_see" value="<?php echo $aurus_attribute_see; ?>" id="input-attribute_see" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_pr_attribute_seeall; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_pr_attribute_seeall[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_pr_attribute_seeall[$language['language_id']]) ? $aurus_pr_attribute_seeall[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <legend><?php echo $text_colorlegend21;?></legend>
                           <div class="row">
                              <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                                 <ul class="nav nav-pills nav-stacked" id="top_link9">
                                    <?php $top_link_row9 = 1; ?>
                                    <?php foreach ($top_links9 as $top_link9) { ?>
                                    <li><a href="#tab-top_link9-<?php echo $top_link_row9; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link9-<?php echo $top_link_row9; ?>\']').parent().remove(); $('#tab-top_link9-<?php echo $top_link_row9; ?>').remove(); $('#top_link9 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row9; ?></a></li>
                                    <?php $top_link_row9++; ?>
                                    <?php } ?>
                                    <li id="top_link9-add"><a onclick="addtop_link9();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link9; ?></a></li>
                                 </ul>
                              </div>
                              <div class="col-lg-9 col-md-8 col-sm-8 col-xs-12">
                                 <div class="tab-content first9">
                                    <?php $top_link_row9 = 1; ?>
                                    <?php foreach ($top_links9 as $top_link9) { ?>
                                    <div class="tab-pane" id="tab-top_link9-<?php echo $top_link_row9; ?>">
                                       <div class="tab-content">
                                          <div class="form-group">
                                             <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" for="input-block_img<?php echo $top_link_row9; ?>"><?php echo $text_link_image;?></label>
                                             <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                                                <a href="" id="thumb-block_img<?php echo $top_link_row9; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $top_link9['image_href']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                                <input type="hidden" name="aurus_top_links9[<?php echo $top_link_row9; ?>][image]" value="<?php echo $top_link9['image']; ?>" id="input-block_img<?php echo $top_link_row9; ?>" />
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_link_faicon; ?></label>
                                             <div class="col-sm-9">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                   <input type="text" class="form-control" name="aurus_top_links9[<?php echo $top_link_row9; ?>][faicon][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link9['faicon'][$language['language_id']]) ? $top_link9['faicon'][$language['language_id']] : ''; ?>" size="70" />
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_name_top; ?></label>
                                             <div class="col-sm-9">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                   <input type="text" class="form-control" name="aurus_top_links9[<?php echo $top_link_row9; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link9['title'][$language['language_id']]) ? $top_link9['title'][$language['language_id']] : ''; ?>" size="70" />
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_text_description; ?></label>
                                             <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>                                                      
                                                   <textarea class="form-control custom-control summernote" cols="3" name="aurus_top_links9[<?php echo $top_link_row9; ?>][description][<?php echo $language['language_id']; ?>]" id="description_info-<?php echo $top_link_row9; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($top_link9['description'][$language['language_id']]) ? $top_link9['description'][$language['language_id']] : ''; ?>     </textarea>
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                       </div>
                                       <?php $top_link_row9++; ?>
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                           </div>
                           <script type="text/javascript">
                              $('#top_link9 li:first-child a').tab('show');
                              //-->
                           </script>					   
                           <!-- add block product -->
                           <script type="text/javascript"><!--
                              var top_link_row9 = <?php echo $top_link_row9; ?>;
                              function addtop_link9() {	
                              	group_row = 0;
                              	html  = '<div class="tab-pane" id="tab-top_link9-' + top_link_row9 + '">';
                              	html += '<div class="tab-content">';
                              	html += '<div class="form-group">';
                              html += '<label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" for="input-block_img' + top_link_row9 + '"><?php echo $text_link_image;?></label>';
                              html += '<div class="col-lg-9 col-md-8 col-sm-6 col-xs-12"><a href="" id="thumb-block_img' + top_link_row9 + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
                              html += '<input type="hidden" name="aurus_top_links9[' + top_link_row9 + '][image]" value="" id="input-block_img' + top_link_row9 + '" />';
                              	html += '</div>';
                              	html += '</div>';
                              html += '<div class="form-group">';
                                 html += '<label class="col-sm-3 control-label" ><?php echo $text_link_faicon; ?></label>';
                                 html += '<div class="col-sm-9">';
                                 <?php foreach ($languages as $language) { ?>
                                 html += '<div class="input-group">';
                                 html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
                                 html += '<input type="text" class="form-control" name="aurus_top_links9[' + top_link_row9 + '][faicon][<?php echo $language['language_id']; ?>]" size="70" />';
                                 html += '</div>';
                                 <?php } ?>
                                 html += '</div>';
                                 html += '</div>';
                                 html += '<div class="form-group">';
                                 html += '<label class="col-sm-3 control-label" ><?php echo $text_name_top; ?></label>';
                                 html += '<div class="col-sm-9">';
                                 <?php foreach ($languages as $language) { ?>
                                 html += '<div class="input-group">';
                                 html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
                                 html += '<input type="text" class="form-control" name="aurus_top_links9[' + top_link_row9 + '][title][<?php echo $language['language_id']; ?>]" size="70" />';
                                 html += '</div>';
                                 <?php } ?>
                                 html += '</div>';
                                 html += '</div>';
                              	html += '<div class="form-group">';
                              	html += '<label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_text_description; ?></label>';
                              	html += '<div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">';
                              	<?php foreach ($languages as $language) { ?>
                              		html += '<div class="input-group">';
                              		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
                              		html += '<textarea name="aurus_top_links9[' + top_link_row9 + '][description][<?php echo $language['language_id']; ?>]" id="description_info-' + top_link_row9 + '-<?php echo $language['language_id']; ?>" class="summernote-' + top_link_row9 + ' form-control"></textarea>';
                              		html += '</div>';
                              		<?php } ?>
                              	html += '</div>';
                              	html += '</div>';
                              	html += '</div>';
                              	html += '</div>';
                              	$('.tab-content.first9').append(html);
                              	$('#top_link9-add').before('<li><a href="#tab-top_link9-' + top_link_row9 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link9-' + top_link_row9 + '\\\']\').parent().remove(); $(\'#tab-top_link9-' + top_link_row9 + '\').remove(); $(\'#top_link9 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row9 + '</a></li>');
                              	<?php if ($ckeditor) { ?>
                              	<?php foreach ($languages as $language) { ?>
                              	ckeditorInit('description_info-' + top_link_row9 + '-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
                              	<?php } ?>
                              	<?php } else { ?>
                              	$('.summernote-' + top_link_row9 ).summernote({ 
                                  height: 150,   //set editable area's height
                              	});
                              	<?php } ?>
                              	$('#top_link9 a[href=\'#tab-top_link9-' + top_link_row9 + '\']').tab('show');
                              	top_link_row9++;
                              }
                              //-->
                           </script>						   
                           <hr>
                           <legend><?php echo $text_colorlegend20;?></legend>
                           <div class="row">
                              <div class="col-sm-3">
                                 <ul class="nav nav-pills nav-stacked" id="top_link7">
                                    <?php $top_link_row7 = 1; ?>
                                    <?php foreach ($top_links7 as $top_link7) { ?>
                                    <li><a href="#tab-top_link7-<?php echo $top_link_row7; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link7-<?php echo $top_link_row7; ?>\']').parent().remove(); $('#tab-top_link7-<?php echo $top_link_row7; ?>').remove(); $('#top_link7 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row7; ?></a></li>
                                    <?php $top_link_row7++; ?>
                                    <?php } ?>
                                    <li id="top_link7-add"><a onclick="addtop_link7();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link7; ?></a></li>
                                 </ul>
                              </div>
                              <div class="col-sm-9">
                                 <div class="tab-content first7">
                                    <?php $top_link_row7 = 1; ?>
                                    <?php foreach ($top_links7 as $top_link7) { ?>
                                    <div class="tab-pane" id="tab-top_link7-<?php echo $top_link_row7; ?>">
                                       <div class="tab-content">
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_name_top_add_tabs; ?></label>
                                             <div class="col-sm-9">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                   <input type="text" class="form-control" name="aurus_top_links7[<?php echo $top_link_row7; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link7['title'][$language['language_id']]) ? $top_link7['title'][$language['language_id']] : ''; ?>" size="70" />
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>
                                             <div class="col-sm-9">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                   <textarea class="form-control custom-control summernote" cols="3" name="aurus_top_links7[<?php echo $top_link_row7; ?>][description][<?php echo $language['language_id']; ?>]" id="description-<?php echo $top_link_row7; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($top_link7['description'][$language['language_id']]) ? $top_link7['description'][$language['language_id']] : ''; ?>     </textarea>
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                       </div>
                                       <?php $top_link_row7++; ?>
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                           </div>
                           <legend><?php echo $text_prrelated; ?></legend>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-descpr"><?php echo $entry_relpr_tab; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aurus_relpr_tab) { ?>
                                 <input type="radio" name="aurus_relpr_tab" value="1" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_relpr_tab" value="1" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_relpr_tab) { ?>
                                 <input type="radio" name="aurus_relpr_tab" value="0" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_relpr_tab" value="0" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-ratpr"><?php echo $entry_ratpr; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aurus_ratpr) { ?>
                                 <input type="radio" name="aurus_ratpr" value="1" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_ratpr" value="1" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_ratpr) { ?>
                                 <input type="radio" name="aurus_ratpr" value="0" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_ratpr" value="0" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-wishpr"><?php echo $entry_wishpr; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aurus_wishpr) { ?>
                                 <input type="radio" name="aurus_wishpr" value="1" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_wishpr" value="1" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_wishpr) { ?>
                                 <input type="radio" name="aurus_wishpr" value="0" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_wishpr" value="0" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-comppr"><?php echo $entry_comppr; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aurus_comppr) { ?>
                                 <input type="radio" name="aurus_comppr" value="1" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_comppr" value="1" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_comppr) { ?>
                                 <input type="radio" name="aurus_comppr" value="0" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_comppr" value="0" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-quickviewpr"><?php echo $entry_quickview; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aurus_quickviewpr) { ?>
                                 <input type="radio" name="aurus_quickviewpr" value="1" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_quickviewpr" value="1" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_quickviewpr) { ?>
                                 <input type="radio" name="aurus_quickviewpr" value="0" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_quickviewpr" value="0" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <legend><?php echo $text_carusel; ?></legend>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-aurus_relcarusel"><?php echo $entry_carusel; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aurus_relcarusel) { ?>
                                 <input type="radio" name="aurus_relcarusel" value="1" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_relcarusel" value="1" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_relcarusel) { ?>
                                 <input type="radio" name="aurus_relcarusel" value="0" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_relcarusel" value="0" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-aurus_relnavigation"><?php echo $entry_navigation; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aurus_relnavigation) { ?>
                                 <input type="radio" name="aurus_relnavigation" value="1" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_relnavigation" value="1" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_relnavigation) { ?>
                                 <input type="radio" name="aurus_relnavigation" value="0" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_relnavigation" value="0" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-aurus_relautoplay_on"><?php echo $entry_autoplay_on; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aurus_relautoplay_on) { ?>
                                 <input type="radio" name="aurus_relautoplay_on" value="1" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_relautoplay_on" value="1" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_relautoplay_on) { ?>
                                 <input type="radio" name="aurus_relautoplay_on" value="0" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_relautoplay_on" value="0" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-aurus_relautoplay"><?php echo $entry_autoplay; ?></label>
                              <div class="col-sm-10">
                                 <input type="text" name="aurus_relautoplay" value="<?php echo $aurus_relautoplay; ?>" placeholder="<?php echo $entry_autoplay; ?>" id="input-aurus_relautoplay" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-aurus_relitems"><?php echo $entry_items; ?></label>
                              <div class="col-sm-10">
                                 <input type="text" name="aurus_relitems" value="<?php echo $aurus_relitems; ?>" placeholder="<?php echo $entry_items; ?>" id="input-aurus_relitems" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-aurus_relrew_speed"><?php echo $entry_rew_speed; ?></label>
                              <div class="col-sm-10">
                                 <input type="text" name="aurus_relrew_speed" value="<?php echo $aurus_relrew_speed; ?>" placeholder="<?php echo $entry_rew_speed; ?>" id="input-aurus_relrew_speed" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-aurus_relstophover"><?php echo $entry_stophover; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aurus_relstophover) { ?>
                                 <input type="radio" name="aurus_relstophover" value="1" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_relstophover" value="1" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_relstophover) { ?>
                                 <input type="radio" name="aurus_relstophover" value="0" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_relstophover" value="0" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                        </div>
                        <!-- 7 tab END -->
                        <!-- 7 tab END -->
                        <!-- 8 tab common -->
                        <div id="panely8" class="tab-pane fade">
                           <legend><?php echo $text_colorlegend12;?></legend>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-product"><?php echo $text_telephone_mainheader; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                    <input type="text" name="aurus_telephone_mainheader[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_telephone_mainheader[$language['language_id']]) ? $aurus_telephone_mainheader[$language['language_id']] : ''; ?>" id="input-aurus_telephone_mainheader" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <legend><?php echo $text_add_up_site2; ?></legend>
                           <div class="row">
                              <div class="col-sm-3">
                                 <ul class="nav nav-pills nav-stacked" id="top_link3">
                                    <?php $top_link_row3 = 1; ?>
                                    <?php foreach ($top_links3 as $top_link3) { ?>
                                    <li><a href="#tab-top_link3-<?php echo $top_link_row3; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link3-<?php echo $top_link_row3; ?>\']').parent().remove(); $('#tab-top_link3-<?php echo $top_link_row3; ?>').remove(); $('#top_link3 a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row3; ?></a></li>
                                    <?php $top_link_row3++; ?>
                                    <?php } ?>
                                    <li id="top_link3-add"><a onclick="addtop_link3();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link3; ?></a></li>
                                 </ul>
                              </div>
                              <div class="col-sm-9">
                                 <div class="tab-content first3">
                                    <?php $top_link_row3 = 1; ?>
                                    <?php foreach ($top_links3 as $top_link3) { ?>
                                    <div class="tab-pane" id="tab-top_link3-<?php echo $top_link_row3; ?>">
                                       <div class="tab-content">
                                          <div class="form-group">
                                             <label class="col-sm-3 control-label" ><?php echo $text_name_top; ?></label>
                                             <div class="col-sm-9">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="input-group">
                                                   <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                                   <input type="text" class="form-control" name="aurus_top_links3[<?php echo $top_link_row3; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link3['title'][$language['language_id']]) ? $top_link3['title'][$language['language_id']] : ''; ?>" size="40" />
                                                </div>
                                                <?php } ?>
                                             </div>
                                          </div>
                                       </div>
                                       <?php $top_link_row3++; ?>
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_mail_mainheader; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_mail_header[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_mail_header[$language['language_id']]) ? $aurus_mail_header[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <legend><?php echo $text_add_address; ?></legend>
                           <div class="form-group">
                              <label class="col-sm-3 control-label"><?php echo $text_address; ?></label>
                              <div class="col-sm-9">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aurus_address[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aurus_address[$language['language_id']]) ? $aurus_address[$language['language_id']] : ''; ?>" class="form-control" />
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <legend><?php echo $text_add_work_time; ?></legend>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-fluid_map_zoom"><?php echo $text_work_time; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_work_time" value="<?php echo $aurus_work_time; ?>" id="input-work_time" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-fluid_map_zoom"><?php echo $text_work_time1; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_work_time1" value="<?php echo $aurus_work_time1; ?>" id="input-work_time1" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-fluid_map_zoom"><?php echo $text_work_time2; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_work_time2" value="<?php echo $aurus_work_time2; ?>" id="input-work_time2" class="form-control" />
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_preloader; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_preloader) { ?>
                                 <input type="radio" name="aurus_preloader" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_preloader" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_preloader) { ?>
                                 <input type="radio" name="aurus_preloader" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_preloader" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
						   <!--
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_options; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_options) { ?>
                                 <input type="radio" name="aurus_show_options" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_options" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_options) { ?>
                                 <input type="radio" name="aurus_show_options" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_options" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
						      //-->
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-limit_atr"><?php echo $text_limit_atr; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_limit_atr" value="<?php echo $aurus_limit_atr; ?>" id="input-limit_atr" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-limit_symbols"><?php echo $text_limit_symbols; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_limit_symbolst" value="<?php echo $aurus_limit_symbolst; ?>" id="input-limit_symbols" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-height_symbols"><?php echo $text_height_symbols; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_height_symbolst" value="<?php echo $aurus_height_symbolst; ?>" id="input-height_symbols" class="form-control" />
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-border_cart"><?php echo $text_border_cart; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_border_cart" value="<?php echo $aurus_border_cart; ?>" id="input-border_cart" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-border_stickers"><?php echo $text_border_stickers; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_border_stickers" value="<?php echo $aurus_border_stickers; ?>" id="input-border_stickers" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_cart; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_cart) { ?>
                                 <input type="radio" name="aurus_show_cart" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_cart" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_cart) { ?>
                                 <input type="radio" name="aurus_show_cart" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_cart" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_show_price; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_show_price) { ?>
                                 <input type="radio" name="aurus_show_price" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_price" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_show_price) { ?>
                                 <input type="radio" name="aurus_show_price" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_show_price" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_callleft; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_callleft) { ?>
                                 <input type="radio" name="aurus_callleft" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_callleft" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_callleft) { ?>
                                 <input type="radio" name="aurus_callleft" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_callleft" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_callleftr; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_callleftr) { ?>
                                 <input type="radio" name="aurus_callleftr" value="0" />
                                 <?php echo $text_right; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_callleftr" value="0" checked="checked" />
                                 <?php echo $text_right; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_callleftr) { ?>
                                 <input type="radio" name="aurus_callleftr" value="1" />
                                 <?php echo $text_left; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_callleftr" value="1" checked="checked" />
                                 <?php echo $text_left; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_wishlist_cat; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_wishlist_cat) { ?>
                                 <input type="radio" name="aurus_wishlist_cat" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_wishlist_cat" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_wishlist_cat) { ?>
                                 <input type="radio" name="aurus_wishlist_cat" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_wishlist_cat" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_comparet_cat; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_compare_cat) { ?>
                                 <input type="radio" name="aurus_compare_cat" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_compare_cat" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_compare_cat) { ?>
                                 <input type="radio" name="aurus_compare_cat" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_compare_cat" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_description_cat; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_description_cat) { ?>
                                 <input type="radio" name="aurus_description_cat" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_description_cat" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_description_cat) { ?>
                                 <input type="radio" name="aurus_description_cat" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_description_cat" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_description_catsm; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_description_catsm) { ?>
                                 <input type="radio" name="aurus_description_catsm" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_description_catsm" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_description_catsm) { ?>
                                 <input type="radio" name="aurus_description_catsm" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_description_catsm" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_atr_cat; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_atr_cat) { ?>
                                 <input type="radio" name="aurus_atr_cat" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_atr_cat" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_atr_cat) { ?>
                                 <input type="radio" name="aurus_atr_cat" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_atr_cat" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_atr_catsm; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_atr_catsm) { ?>
                                 <input type="radio" name="aurus_atr_catsm" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_atr_catsm" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_atr_catsm) { ?>
                                 <input type="radio" name="aurus_atr_catsm" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_atr_catsm" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_rating_cat; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_rating_cat) { ?>
                                 <input type="radio" name="aurus_rating_cat" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_rating_cat" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_rating_cat) { ?>
                                 <input type="radio" name="aurus_rating_cat" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_rating_cat" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_arrowup; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_arrowup) { ?>
                                 <input type="radio" name="aurus_arrowup" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_arrowup" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_arrowup) { ?>
                                 <input type="radio" name="aurus_arrowup" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_arrowup" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_arrowup_lr; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_arrowup_lr) { ?>
                                 <input type="radio" name="aurus_arrowup_lr" value="0" />
                                 <?php echo $text_right; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_arrowup_lr" value="0" checked="checked" />
                                 <?php echo $text_right; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_arrowup_lr) { ?>
                                 <input type="radio" name="aurus_arrowup_lr" value="1" />
                                 <?php echo $text_left; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_arrowup_lr" value="1" checked="checked" />
                                 <?php echo $text_left; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_arrowup_mobile; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_arrowup_mobile) { ?>
                                 <input type="radio" name="aurus_arrowup_mobile" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_arrowup_mobile" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_arrowup_mobile) { ?>
                                 <input type="radio" name="aurus_arrowup_mobile" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_arrowup_mobile" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_banners_fluid; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_banners_fluid) { ?>
                                 <input type="radio" name="aurus_banners_fluid" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_banners_fluid" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_banners_fluid) { ?>
                                 <input type="radio" name="aurus_banners_fluid" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_banners_fluid" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_banners; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_banners) { ?>
                                 <input type="radio" name="aurus_banners" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_banners" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_banners) { ?>
                                 <input type="radio" name="aurus_banners" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_banners" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_banners_hiddensm; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_banners_hiddensm) { ?>
                                 <input type="radio" name="aurus_banners_hiddensm" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_banners_hiddensm" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_banners_hiddensm) { ?>
                                 <input type="radio" name="aurus_banners_hiddensm" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_banners_hiddensm" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                        </div>
                        <!-- 8 tab END -->
                        <!-- 12 tab -->
                        <div id="panely12" class="tab-pane fade">
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_cart_open; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_cart_open) { ?>
                                 <input type="radio" name="aurus_cart_open" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_cart_open" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_cart_open) { ?>
                                 <input type="radio" name="aurus_cart_open" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_cart_open" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_cart_continue; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_cart_continue) { ?>
                                 <input type="radio" name="aurus_cart_continue" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_cart_continue" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_cart_continue) { ?>
                                 <input type="radio" name="aurus_cart_continue" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_cart_continue" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_cart_relpr; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_cart_relpr) { ?>
                                 <input type="radio" name="aurus_cart_relpr" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_cart_relpr" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_cart_relpr) { ?>
                                 <input type="radio" name="aurus_cart_relpr" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_cart_relpr" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_cart_viewed; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_cart_viewed) { ?>
                                 <input type="radio" name="aurus_cart_viewed" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_cart_viewed" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_cart_viewed) { ?>
                                 <input type="radio" name="aurus_cart_viewed" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_cart_viewed" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-cart_relprlimit"><?php echo $text_cart_relprlimit; ?></label>
                              <div class="col-sm-9">
                                 <input type="text" name="aurus_cart_relprlimit" value="<?php echo $aurus_cart_relprlimit; ?>" id="input-cart_relprlimit" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_cart_right; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_cart_right) { ?>
                                 <input type="radio" name="aurus_cart_right" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_cart_right" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_cart_right) { ?>
                                 <input type="radio" name="aurus_cart_right" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_cart_right" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_wish_right; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_wish_right) { ?>
                                 <input type="radio" name="aurus_wish_right" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_wish_right" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_wish_right) { ?>
                                 <input type="radio" name="aurus_wish_right" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_wish_right" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_comp_right; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_comp_right) { ?>
                                 <input type="radio" name="aurus_comp_right" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_comp_right" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_comp_right) { ?>
                                 <input type="radio" name="aurus_comp_right" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_comp_right" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_right_sm; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_right_sm) { ?>
                                 <input type="radio" name="aurus_right_sm" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_right_sm" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_right_sm) { ?>
                                 <input type="radio" name="aurus_right_sm" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_right_sm" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-3 control-label" ><?php echo $text_right_tittle; ?></label>
                              <div class="col-sm-9">
                                 <label class="radio-inline">
                                 <?php if ($aurus_right_tittle) { ?>
                                 <input type="radio" name="aurus_right_tittle" value="0" />
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_right_tittle" value="0" checked="checked" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aurus_right_tittle) { ?>
                                 <input type="radio" name="aurus_right_tittle" value="1" />
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aurus_right_tittle" value="1" checked="checked" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <ul class="nav nav-tabs" id="language2r">
                              <?php foreach ($languages as $language) { ?>
                              <li><a href="#language2r<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                              <?php } ?>
                           </ul>
                           <div class="tab-content">
                              <?php foreach ($languages as $language) { ?>
                              <div class="tab-pane" id="language2r<?php echo $language['language_id']; ?>">
                                 <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-cart_description<?php echo $language['language_id']; ?>"><?php echo $text_cart_description;?></label>
                                    <div class="col-sm-9">
                                       <textarea name="aurus_cart_description[<?php echo $language['language_id']; ?>]" id="input-cart_description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aurus_cart_description[$language['language_id']]) ? $aurus_cart_description[$language['language_id']] : ''; ?></textarea>
                                    </div>
                                 </div>
                              </div>
                              <?php } ?>
                           </div>
                        </div>
                        <!-- 9 tab -->
                        <div id="panely9" class="tab-pane fade">
                           <div class="form-group">
                              <div class="col-sm-5">
                                 <textarea name="aurus_counter" rows="15" placeholder="" id="input-aurus_counter" class="form-control"><?php echo $aurus_counter; ?></textarea>
                              </div>
                           </div>
                        </div>
                        <!-- 10 tab -->
                        <div id="panely10" class="tab-pane fade">
                           <div class="form-group">
                              <div class="col-sm-5">
                                 <textarea name="aurus_css" rows="15" placeholder="" id="input-aurus_css" class="form-control"><?php echo $aurus_css; ?></textarea>
                              </div>
                           </div>
                        </div>
						<!--
                        <div id="panely14" class="tab-pane fade">
                           <div class="form-group">
                              <div class="col-sm-12">
                                 <?php echo $text_aridius;?>
                              </div>
                           </div>
                        </div>
						 -->
                        <div id="panely11" class="tab-pane fade">
                           <script src="view/javascript/colorpicker/dist/js/bootstrap-colorpicker.js" type="text/javascript"></script>
                           <link href="view/javascript/colorpicker/dist/css/bootstrap-colorpicker.css" rel="stylesheet">
                           <script>
                              $(function () {
                              $('.theme_ch_color').colorpicker();
                              });
                           </script>
                           <legend><?php echo $text_colorlegend1;?></legend>
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color1;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color1" class="form-control input-lg" value="<?php echo $aurus_color1; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color2;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color2" class="form-control input-lg" value="<?php echo $aurus_color2; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color3;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color3" class="form-control input-lg" value="<?php echo $aurus_color3; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color7;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color7" class="form-control input-lg" value="<?php echo $aurus_color7; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <legend><?php echo $text_colorlegend10;?></legend>
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color4;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color4" class="form-control input-lg" value="<?php echo $aurus_color4; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color5;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color5" class="form-control input-lg" value="<?php echo $aurus_color5; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color6;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color6" class="form-control input-lg" value="<?php echo $aurus_color6; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color8;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color8" class="form-control input-lg" value="<?php echo $aurus_color8; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color9;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color9" class="form-control input-lg" value="<?php echo $aurus_color9; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color10;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color10" class="form-control input-lg" value="<?php echo $aurus_color10; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color11;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color11" class="form-control input-lg" value="<?php echo $aurus_color11; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color12;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color12" class="form-control input-lg" value="<?php echo $aurus_color12; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <legend><?php echo $text_colorlegend2;?></legend>
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color92;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color92" class="form-control input-lg" value="<?php echo $aurus_color92 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color13;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color13" class="form-control input-lg" value="<?php echo $aurus_color13; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color14;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color14" class="form-control input-lg" value="<?php echo $aurus_color14; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color93;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color93" class="form-control input-lg" value="<?php echo $aurus_color93 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color15;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color15" class="form-control input-lg" value="<?php echo $aurus_color15; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color94;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color94" class="form-control input-lg" value="<?php echo $aurus_color94 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color16;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color16" class="form-control input-lg" value="<?php echo $aurus_color16; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color75;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color75" class="form-control input-lg" value="<?php echo $aurus_color75; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color76;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color76" class="form-control input-lg" value="<?php echo $aurus_color76; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color17;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color17" class="form-control input-lg" value="<?php echo $aurus_color17; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color18;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color18" class="form-control input-lg" value="<?php echo $aurus_color18; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color19;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color19" class="form-control input-lg" value="<?php echo $aurus_color19; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color20?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color20" class="form-control input-lg" value="<?php echo $aurus_color20 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color21;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color21" class="form-control input-lg" value="<?php echo $aurus_color21 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color22?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color22" class="form-control input-lg" value="<?php echo $aurus_color22 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color23;?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color23" class="form-control input-lg" value="<?php echo $aurus_color23 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color24?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color24" class="form-control input-lg" value="<?php echo $aurus_color24 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color81?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color81" class="form-control input-lg" value="<?php echo $aurus_color81 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color82?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color82" class="form-control input-lg" value="<?php echo $aurus_color82?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <div class="form-group">
                              <label class="col-sm-3 control-label" for="input-gradient"><?php echo $text_gradient; ?></label>
                              <div class="col-sm-9">
                                 <textarea name="aurus_gradient" rows="5" placeholder="" id="input-aurus_gradient" class="form-control"><?php echo $aurus_gradient; ?></textarea>
                              </div>
                           </div>
                           <legend><?php echo $text_colorlegend11;?></legend>
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color77?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color77" class="form-control input-lg" value="<?php echo $aurus_color77 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color78?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color78" class="form-control input-lg" value="<?php echo $aurus_color78 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color79?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color79" class="form-control input-lg" value="<?php echo $aurus_color79 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <br />
                           <legend><?php echo $text_colorlegend3;?></legend>
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color38?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color38" class="form-control input-lg" value="<?php echo $aurus_color38 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color39?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color39" class="form-control input-lg" value="<?php echo $aurus_color39 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color25?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color25" class="form-control input-lg" value="<?php echo $aurus_color25 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color26?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color26" class="form-control input-lg" value="<?php echo $aurus_color26 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color30?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color30" class="form-control input-lg" value="<?php echo $aurus_color30 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color31?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color31" class="form-control input-lg" value="<?php echo $aurus_color31 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color27?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color27" class="form-control input-lg" value="<?php echo $aurus_color27 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color28?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color28" class="form-control input-lg" value="<?php echo $aurus_color28 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color29?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color29" class="form-control input-lg" value="<?php echo $aurus_color29 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color32?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color32" class="form-control input-lg" value="<?php echo $aurus_color32 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color33?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color33" class="form-control input-lg" value="<?php echo $aurus_color33 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color34?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color34" class="form-control input-lg" value="<?php echo $aurus_color34 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color86?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color86" class="form-control input-lg" value="<?php echo $aurus_color86 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color87?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color87" class="form-control input-lg" value="<?php echo $aurus_color87 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color88?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color88" class="form-control input-lg" value="<?php echo $aurus_color88 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color89?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color89" class="form-control input-lg" value="<?php echo $aurus_color89 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color90?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color90" class="form-control input-lg" value="<?php echo $aurus_color90 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color91?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color91" class="form-control input-lg" value="<?php echo $aurus_color91 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color35?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color35" class="form-control input-lg" value="<?php echo $aurus_color35 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color36?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color36" class="form-control input-lg" value="<?php echo $aurus_color36 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color84?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color84" class="form-control input-lg" value="<?php echo $aurus_color84 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color37?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color37" class="form-control input-lg" value="<?php echo $aurus_color37 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <legend><?php echo $text_colorlegend4;?></legend>
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color40?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color40" class="form-control input-lg" value="<?php echo $aurus_color40 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color41?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color41" class="form-control input-lg" value="<?php echo $aurus_color41 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color42?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color42" class="form-control input-lg" value="<?php echo $aurus_color42 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color43?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color43" class="form-control input-lg" value="<?php echo $aurus_color43 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color44?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color44" class="form-control input-lg" value="<?php echo $aurus_color44 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color45?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color45" class="form-control input-lg" value="<?php echo $aurus_color45 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <legend><?php echo $text_colorlegend5;?></legend>
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color46?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color46" class="form-control input-lg" value="<?php echo $aurus_color46 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color47?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color47" class="form-control input-lg" value="<?php echo $aurus_color47 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color85?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color85" class="form-control input-lg" value="<?php echo $aurus_color85 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <legend><?php echo $text_colorlegend6;?></legend>
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color48?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color48" class="form-control input-lg" value="<?php echo $aurus_color48 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color49?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color49" class="form-control input-lg" value="<?php echo $aurus_color49 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color50?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color50" class="form-control input-lg" value="<?php echo $aurus_color50 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color51?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color51" class="form-control input-lg" value="<?php echo $aurus_color51 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color52?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color52" class="form-control input-lg" value="<?php echo $aurus_color52 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color53?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color53" class="form-control input-lg" value="<?php echo $aurus_color53 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color54?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color54" class="form-control input-lg" value="<?php echo $aurus_color54 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color55?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color55" class="form-control input-lg" value="<?php echo $aurus_color55 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color56?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color56" class="form-control input-lg" value="<?php echo $aurus_color56 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color57?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color57" class="form-control input-lg" value="<?php echo $aurus_color57 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color58?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color58" class="form-control input-lg" value="<?php echo $aurus_color58 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color59?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color59" class="form-control input-lg" value="<?php echo $aurus_color59 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color60?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color60" class="form-control input-lg" value="<?php echo $aurus_color60 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color61?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color61" class="form-control input-lg" value="<?php echo $aurus_color61 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color62?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color62" class="form-control input-lg" value="<?php echo $aurus_color62 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color63?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color63" class="form-control input-lg" value="<?php echo $aurus_color63 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color64?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color64" class="form-control input-lg" value="<?php echo $aurus_color64 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color65?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color65" class="form-control input-lg" value="<?php echo $aurus_color65 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color66?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color66" class="form-control input-lg" value="<?php echo $aurus_color66 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <legend><?php echo $text_colorlegend7;?></legend>
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color67?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color67" class="form-control input-lg" value="<?php echo $aurus_color67 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color68?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color68" class="form-control input-lg" value="<?php echo $aurus_color68 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color69?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color69" class="form-control input-lg" value="<?php echo $aurus_color69 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color70?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color70" class="form-control input-lg" value="<?php echo $aurus_color70 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <legend><?php echo $text_colorlegend8;?></legend>
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color70?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color71" class="form-control input-lg" value="<?php echo $aurus_color71 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color72?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color72" class="form-control input-lg" value="<?php echo $aurus_color72 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color73?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color73" class="form-control input-lg" value="<?php echo $aurus_color73 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label" ><?php echo $text_color74?></label>
                           <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                              <div class="theme_ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aurus_color74" class="form-control input-lg" value="<?php echo $aurus_color74 ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                           <br />
                           <input type="button" onClick="start()" class="btn btn-primary" id="color_settings_v1" value="<?php echo $text_variant1; ?>" />
                           <script>		
                              $('#color_settings_v1').click(function() {
                              $("input[name='aurus_color1']").val("#4F4E4E");
                              $("input[name='aurus_color2']").val("#ffffff");
                              $("input[name='aurus_color3']").val("#e5e5e5");
                              $("input[name='aurus_color4']").val("#ffffff");
                              $("input[name='aurus_color5']").val("#222222");
                              $("input[name='aurus_color6']").val("#222222");
                              $("input[name='aurus_color7']").val("#E5E5E5");
                              $("input[name='aurus_color8']").val("#F12B63");
                              $("input[name='aurus_color9']").val("#ffffff");
                              $("input[name='aurus_color10']").val("#2a2623");
                              $("input[name='aurus_color11']").val("#4F4E4E");
                              $("input[name='aurus_color12']").val("#BEBEBE");
                              $("input[name='aurus_color13']").val("#4F4E4E");
                              $("input[name='aurus_color14']").val("#ffffff");
                              $("input[name='aurus_color15']").val("#BEBEBE");
                              $("input[name='aurus_color16']").val("#7ED4C5");
                              $("input[name='aurus_color17']").val("#3e77aa");
                              $("input[name='aurus_color18']").val("#ff7878");
                              $("input[name='aurus_color19']").val("#3C3C3C");
                              $("input[name='aurus_color20']").val("#ffffff");
                              $("input[name='aurus_color21']").val("#D10000");
                              $("input[name='aurus_color22']").val("#ffffff");
                              $("input[name='aurus_color23']").val("#a99d90");
                              $("input[name='aurus_color24']").val("#ffffff");
                              $("input[name='aurus_color25']").val("#FF2666");
                              $("input[name='aurus_color26']").val("#ffffff");
                              $("input[name='aurus_color27']").val("#F1F1F1");
                              $("input[name='aurus_color28']").val("#868583");
                              $("input[name='aurus_color29']").val("#d8d8d8");
                              $("input[name='aurus_color30']").val("#ff6593");
                              $("input[name='aurus_color31']").val("#ffffff");
                              $("input[name='aurus_color32']").val("#868686");
                              $("input[name='aurus_color33']").val("#ffffff");
                              $("input[name='aurus_color34']").val("#868686");
                              $("input[name='aurus_color35']").val("#F12B63");
                              $("input[name='aurus_color36']").val("#999999");
                              $("input[name='aurus_color37']").val("#7ED4C5");
                              $("input[name='aurus_color38']").val("#FF2666");
                              $("input[name='aurus_color39']").val("#ff6593");
                              $("input[name='aurus_color40']").val("#2BD6C6");
                              $("input[name='aurus_color41']").val("#ffffff");
                              $("input[name='aurus_color42']").val("#FF2766");
                              $("input[name='aurus_color43']").val("#ffffff");
                              $("input[name='aurus_color44']").val("#FFBA6A");
                              $("input[name='aurus_color45']").val("#ffffff");
                              $("input[name='aurus_color46']").val("#ff6593");
                              $("input[name='aurus_color47']").val("#858585");
                              $("input[name='aurus_color48']").val("#000000");
                              $("input[name='aurus_color49']").val("#C4C4C4");
                              $("input[name='aurus_color50']").val("#818181");
                              $("input[name='aurus_color51']").val("#69614a");
                              $("input[name='aurus_color52']").val("#555555");
                              $("input[name='aurus_color53']").val("#000000");
                              $("input[name='aurus_color54']").val("#C5C5C5");
                              $("input[name='aurus_color55']").val("#70C7C7");
                              $("input[name='aurus_color56']").val("#323030");
                              $("input[name='aurus_color57']").val("#323030");
                              $("input[name='aurus_color58']").val("#ffffff");
                              $("input[name='aurus_color59']").val("#CEB478");
                              $("input[name='aurus_color60']").val("#ffffff");
                              $("input[name='aurus_color61']").val("#000000");
                              $("input[name='aurus_color62']").val("#F19872");
                              $("input[name='aurus_color63']").val("#ffffff");
                              $("input[name='aurus_color64']").val("#919191");
                              $("input[name='aurus_color65']").val("#7ED4C5");
                              $("input[name='aurus_color66']").val("#ffffff");
                              $("input[name='aurus_color67']").val("#2E8AE6");
                              $("input[name='aurus_color68']").val("#424F60");
                              $("input[name='aurus_color69']").val("#96C4F2");
                              $("input[name='aurus_color70']").val("#ffffff");
                              $("input[name='aurus_color71']").val("#4F4E4E");
                              $("input[name='aurus_color72']").val("#2E8AE6");
                              $("input[name='aurus_color73']").val("#96C4F2");
                              $("input[name='aurus_color74']").val("#ffffff");
                              $("input[name='aurus_color75']").val("#000000");
                              $("input[name='aurus_color76']").val("#ff7878");
                              $("input[name='aurus_color77']").val("#FFFFFF");
                              $("input[name='aurus_color78']").val("#000000");
                              $("input[name='aurus_color79']").val("#ff7878");
                              $("input[name='aurus_color81']").val("#ffffff");
                              $("input[name='aurus_color82']").val("#bebebe");
                              $("input[name='aurus_color84']").val("#F04343");
                              $("input[name='aurus_color85']").val("#747474");
                              $("input[name='aurus_color86']").val("#FFFFFF");
                              $("input[name='aurus_color87']").val("#ff2666");
                              $("input[name='aurus_color88']").val("#9eaaac");
                              $("input[name='aurus_color89']").val("#fffcfc");
                              $("input[name='aurus_color90']").val("#ff2666");
                              $("input[name='aurus_color91']").val("#9eaaac");
                              $("input[name='aurus_color92']").val("#000000");
                              $("input[name='aurus_color93']").val("#000000");
                              $("input[name='aurus_color94']").val("#ff7878");
                              });
                           </script>						
                        </div>
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
<style>
   .subtle-pattern2{
   height:141px;
   margin-bottom:52px;
   }
   .subtle-pattern{
   float: left;
   margin-left: 15px;
   }
   .tleft{
   margin-right:45px;
   }
</style>
<script><!--
   <?php $top_link_row7 = 1; ?>
   <?php foreach ($top_links7 as $top_link7) { ?>
   $('#language<?php echo $top_link_row7; ?> li:first-child a').tab('show');
   <?php $top_link_row7++; ?>
   <?php } ?>
   //-->
</script>
<!-- Background -->
<script><!--
   $(document).ready(function() {
   var imgBig = $('#bigimg img');
   imgSmall = $('#smallimg img');
   imgSmall.click(function(event) {
   event.preventDefault();
   if (imgBig.attr('src') != $(this).attr('src')) {
   imgBig.hide().attr('src',$(this).attr('src'));
   imgBig.load(function() {
   $(this).fadeIn(100);
   });
   }
   imgSmall.fadeTo(500,1);
   $(this).fadeTo(500,0.6);
   });
   });
   //-->
</script>
<script>
   $(document).ready(function(){
   var storage = localStorage.getItem('aridius_tab');
   	if (storage == null) {
   	$("#myTab2 li:eq(0) a").tab('show');
   	} else {
   	$("#myTab2 li:eq("+ storage +") a").tab('show');
   	}
   	$('#myTab2').on('click', 'li:not(.active)', function() {
   		localStorage.removeItem('aridius_tab');
   		localStorage.setItem('aridius_tab', $(this).index());
   	})
   });
</script>
<script><!--
   $('#map_link li:first-child a').tab('show');
   //-->
</script>
<script><!--
   $('#top_link2 li:first-child a').tab('show');
   //-->
</script>
<script><!--
   $('#top_link3 li:first-child a').tab('show');
   //-->
</script>
<script><!--
   $('#top_link4 li:first-child a').tab('show');
   //-->
</script>
<script>
   $('#top_link6 li:first-child a').tab('show');
   //-->
</script>
<script>
   $('#top_link7 li:first-child a').tab('show');
   //-->
</script>
<script>
   $('#top_link8 li:first-child a').tab('show');
   //-->
</script>
<!-- add top menu header info -->
<script><!--
   var top_link_row6 = <?php echo $top_link_row6; ?>;
   function addtop_link6() {
   group_row = 0;
   html  = '<div class="tab-pane" id="tab-top_link6-' + top_link_row6 + '">';
   html += '<div class="tab-content">';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_top_link_title; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aurus_top_links6[' + top_link_row6 + '][title][<?php echo $language['language_id']; ?>]" size="40" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>';
   html += '<div class="col-sm-9">';
   html += '<input type="text" class="form-control" name="aurus_top_links6[' + top_link_row6 + '][faicons_top]" />';
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aurus_top_links6[' + top_link_row6 + '][link_top][<?php echo $language['language_id']; ?>]" size="40" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '</div>';
   html += '</div>';
   $('.tab-content.first6').append(html);
   $('#top_link6-add').before('<li><a href="#tab-top_link6-' + top_link_row6 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link6-' + top_link_row6 + '\\\']\').parent().remove(); $(\'#tab-top_link6-' + top_link_row6 + '\').remove(); $(\'#top_link6 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row6 + '</a></li>');
   $('#top_link6 a[href=\'#tab-top_link6-' + top_link_row6 + '\']').tab('show');
   top_link_row6++;
   }
   //-->
</script>
<!-- add footer social network -->
<script><!--
   var top_link_row2 = <?php echo $top_link_row2; ?>;
   function addtop_link2() {
   group_row = 0;
   html  = '<div class="tab-pane" id="tab-top_link2-' + top_link_row2 + '">';
   html += '<div class="tab-content">';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>';
   html += '<div class="col-sm-9">';
   html += '<input type="text" class="form-control" name="aurus_top_links2[' + top_link_row2 + '][faicons_top]" />';
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>';
   html += '<div class="col-sm-9">';
   html += '<input type="text" class="form-control" name="aurus_top_links2[' + top_link_row2 + '][link_top]" />';
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_hover; ?></label>';
   html += '<div class="col-sm-9">';
   html += '<input type="text" class="form-control" name="aurus_top_links2[' + top_link_row2 + '][tooltipseti]" />';
   html += '</div>';
   html += '</div>';
   html += '</div>';
   html += '</div>';
   $('.tab-content.first2').append(html);
   $('#top_link2-add').before('<li><a href="#tab-top_link2-' + top_link_row2 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link2-' + top_link_row2 + '\\\']\').parent().remove(); $(\'#tab-top_link2-' + top_link_row2 + '\').remove(); $(\'#top_link2 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row2 + '</a></li>');
   $('#top_link2 a[href=\'#tab-top_link2-' + top_link_row2 + '\']').tab('show');
   top_link_row2++;
   }
   //-->
</script>
<!-- add info block header tell -->
<script><!--
   var top_link_row3 = <?php echo $top_link_row3; ?>;
   function addtop_link3() {
   group_row = 0;
   html  = '<div class="tab-pane" id="tab-top_link3-' + top_link_row3 + '">';
   html += '<div class="tab-content">';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_top_link_title; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aurus_top_links3[' + top_link_row3 + '][title][<?php echo $language['language_id']; ?>]" size="40" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '</div>';
   html += '</div>';
   $('.tab-content.first3').append(html);
   $('#top_link3-add').before('<li><a href="#tab-top_link3-' + top_link_row3 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link3-' + top_link_row3 + '\\\']\').parent().remove(); $(\'#tab-top_link3-' + top_link_row3 + '\').remove(); $(\'#top_link3 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row3 + '</a></li>');
   $('#top_link3 a[href=\'#tab-top_link3-' + top_link_row3 + '\']').tab('show');
   top_link_row3++;
   }
   //-->
</script>
<!-- add menu link  -->
<script><!--
   var top_link_row4 = <?php echo $top_link_row4; ?>;
   function addtop_link4() {
   group_row = 0;
   html  = '<div class="tab-pane" id="tab-top_link4-' + top_link_row4 + '">';
   html += '<div class="tab-content">';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_top_link_title; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aurus_top_links4[' + top_link_row4 + '][title][<?php echo $language['language_id']; ?>]" size="40" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>';
   html += '<div class="col-sm-9">';
   html += '<input type="text" class="form-control" name="aurus_top_links4[' + top_link_row4 + '][faicons_top]" />';
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aurus_top_links4[' + top_link_row4 + '][link_top][<?php echo $language['language_id']; ?>]" size="40" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '</div>';
   html += '</div>';
   $('.tab-content.first4').append(html);
   $('#top_link4-add').before('<li><a href="#tab-top_link4-' + top_link_row4 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link4-' + top_link_row4 + '\\\']\').parent().remove(); $(\'#tab-top_link4-' + top_link_row4 + '\').remove(); $(\'#top_link4 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row4 + '</a></li>');
   $('#top_link4 a[href=\'#tab-top_link4-' + top_link_row4 + '\']').tab('show');
   top_link_row4++;
   }
   //-->
</script>
<!-- add tabs product -->
<script><!--
   var top_link_row7 = <?php echo $top_link_row7; ?>;
   function addtop_link7() {
   group_row = 0;
   html  = '<div class="tab-pane" id="tab-top_link7-' + top_link_row7 + '">';
   html += '<div class="tab-content">';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_name_top_add_tabs; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aurus_top_links7[' + top_link_row7 + '][title][<?php echo $language['language_id']; ?>]" size="70" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_text_description; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<textarea name="aurus_top_links7[' + top_link_row7 + '][description][<?php echo $language['language_id']; ?>]" id="description-' + top_link_row7 + '-<?php echo $language['language_id']; ?>" class="summernote-' + top_link_row7 + ' form-control"></textarea>';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '</div>';
   html += '</div>';
   $('.tab-content.first7').append(html);
   $('#top_link7-add').before('<li><a href="#tab-top_link7-' + top_link_row7 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link7-' + top_link_row7 + '\\\']\').parent().remove(); $(\'#tab-top_link7-' + top_link_row7 + '\').remove(); $(\'#top_link7 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row7 + '</a></li>');
   <?php if ($ckeditor) { ?>
   <?php foreach ($languages as $language) { ?>
   ckeditorInit('description-' + top_link_row7 + '-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
   <?php } ?>
   <?php } else { ?>
   $('.summernote-' + top_link_row7 ).summernote({
   height: 150,   //set editable area's height
   });
   <?php } ?>
   $('#top_link7 a[href=\'#tab-top_link7-' + top_link_row7 + '\']').tab('show');
   top_link_row7++;
   }
   //-->
</script>
<!-- add menu link   -->
<script><!--
   var top_link_row8 = <?php echo $top_link_row8; ?>;
   function addtop_link8() {
   group_row = 0;
   html  = '<div class="tab-pane" id="tab-top_link8-' + top_link_row8 + '">';
   html += '<div class="tab-content">';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_top_link_title; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aurus_top_links8[' + top_link_row8 + '][title][<?php echo $language['language_id']; ?>]" size="80" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_faicons_top; ?></label>';
   html += '<div class="col-sm-9">';
   html += '<input type="text" class="form-control" name="aurus_top_links8[' + top_link_row8 + '][faicons_top]" />';
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_link_top; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aurus_top_links8[' + top_link_row8 + '][link_top][<?php echo $language['language_id']; ?>]" size="80" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '</div>';
   html += '</div>';
   $('.tab-content.first8').append(html);
   $('#top_link8-add').before('<li><a href="#tab-top_link8-' + top_link_row8 + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link8-' + top_link_row8 + '\\\']\').parent().remove(); $(\'#tab-top_link8-' + top_link_row8 + '\').remove(); $(\'#top_link8 a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row8 + '</a></li>');
   $('#top_link8 a[href=\'#tab-top_link8-' + top_link_row8 + '\']').tab('show');
   top_link_row8++;
   }
   //-->
</script>
<!-- add menu link   -->
<script><!--
   var map_link_row = <?php echo $map_link_row ; ?>;
   function addtop_linkmap() {
   group_row = 0;
   html  = '<div class="tab-pane" id="tab-map_link-' + map_link_row + '">';
   html += '<div class="tab-content">';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_latitude_fluid_map ; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code'] ; ?>/<?php echo $language['code'] ; ?>.png" title="<?php echo $language['name'] ; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aurus_map_links[' + map_link_row + '][latitude][<?php echo $language['language_id'] ; ?>]" size="40" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_longitude_fluid_map ; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code'] ; ?>/<?php echo $language['code'] ; ?>.png" title="<?php echo $language['name'] ; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aurus_map_links[' + map_link_row + '][longitude][<?php echo $language['language_id'] ; ?>]" size="40" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-3 control-label" ><?php echo $text_maps_logo ; ?></label>';
   html += '<div class="col-sm-9">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code'] ; ?>/<?php echo $language['code'] ; ?>.png" title="<?php echo $language['name'] ; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aurus_map_links[' + map_link_row + '][title][<?php echo $language['language_id'] ; ?>]" size="40" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '</div>';
   html += '</div>';
   $('.tab-content.first33').append(html);
   $('#map_link-add').before('<li><a href="#tab-map_link-' + map_link_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-map_link-' + map_link_row + '\\\']\').parent().remove(); $(\'#tab-map_link-' + map_link_row + '\').remove(); $(\'#map_link a:first\').tab(\'show\');"></i> <?php echo $tab_top_link ; ?> ' + map_link_row + '</a></li>');
   $('#map_link a[href=\'#tab-map_link-' + map_link_row + '\']').tab('show');
   map_link_row++;
   }
   //-->
</script>
<script><!--
   $('#language a:first').tab('show');
   $('#language2r a:first').tab('show');
   $('#option a:first').tab('show');
   //-->
</script>
<?php if (!$ckeditor) { ?>
<script src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script src="view/javascript/summernote/opencart.js"></script>
<!-- summernote -->
<script><!--
   $('.summernote').summernote({
   height: 150,   //set editable area's height
   });
   //-->
</script>
<?php } ?>
<?php if ($ckeditor) { ?>
<script><!--
   <?php foreach ($languages as $language) { ?>
   <?php if ($ckeditor) { ?>
   ckeditorInit('input-description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
   <?php } ?>
   <?php } ?>
   //-->
</script>
<script><!--
   <?php foreach ($languages as $language) { ?>
   <?php if ($ckeditor) { ?>
   ckeditorInit('input-cart_description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
   <?php } ?>
   <?php } ?>
   //-->
</script>
<script><!--
   <?php $top_link_row7 = 1; ?>
   <?php foreach ($top_links7 as $top_link7) { ?>
   <?php foreach ($languages as $language) { ?>
   ckeditorInit('description-<?php echo $top_link_row7; ?>-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
   <?php } ?>
   <?php $top_link_row7++; ?>
   <?php } ?>
   //-->
</script>
<script><!--
   <?php $top_link_row9 = 1; ?>
   <?php foreach ($top_links7 as $top_link9) { ?>
   <?php foreach ($languages as $language) { ?>
   ckeditorInit('description_info-<?php echo $top_link_row9; ?>-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
   <?php } ?>
   <?php $top_link_row9++; ?>
   <?php } ?>
   //-->
</script>
<?php } ?>
<script><!--
   function apply() {
   $('#form-theme-aurus').append('<input type="hidden" id="apply" name="apply" value="1" />');
   $('#form-theme-aurus').submit();
   }
   //-->
</script>
<?php echo $footer; ?>