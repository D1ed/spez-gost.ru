<header>
   <div class="top-header">
      <div class="container">
         <div class="row vertical-align">
            <div class="col-xs-2 col-sm-1 hidden-md hidden-lg">
               <nav id="menu_m" class="menu_mobile"></nav>
               <span id="main_m" class="panel"></span>
               <div id="mobmenu">
                  <button onclick="MobMenu();" class="toggle_m toggle js-slideout-toggle"><i class="fa fa-bars"></i></button>
               </div>
            </div>
            <div class="logo_v3 col-xs-3 col-sm-3 col-md-2 mob_logo">
               <div id="logo">
                  <?php if ($logo) { ?>
                  <?php if ($home == $og_url) { ?>
                  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                  <?php } else { ?>
                  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                  <?php } ?>
                  <?php } else { ?>
                  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                  <?php } ?>
               </div>
            </div>
            <div class="fix_mxs2 col-xs-7 col-sm-8 col-md-10">
               <div id="setclone">
                  <div class="mob_cart">
                     <?php echo $cart; ?>
                  </div>
                  <div class="st_search mob_search serv1 header_v1">
                     <?php echo $search; ?>
                  </div>
                  <div class="sss2 mob_phonexl header_v1 hidden-xs hidden-sm hidden-md">
                     <?php if ($aurus_top_links3 || $aurus_mail_header[$language_id] ) { ?>
                     <div class="dropdown phone">
                        <div class="listunstyled btn-lg  dropdown-toggle" data-toggle="dropdown"><span class="tell_nav"><?php echo $aurus_telephone_mainheader[$language_id]; ?></span><b class="caret"></b></div>
                        <?php if ($aridiuscallback_status && $aurus_calltop !=1) { ?>
                        <a class = "call_v1 call-order"><?php echo $button_title; ?></a>
                        <?php } ?>
                        <ul class="dropdown-menu fixxsmenu">
                           <li class="dropdown-header"><i class="fa fa-phone"></i> <?php echo $dropdown_tell; ?></li>
                           <?php if ($aurus_top_links3 ) { ?>
                           <?php foreach ($aurus_top_links3 as $aurus_top_link3) { ?>
                           <li>
                              <a <?php if ($aurus_top_link3['title'][$language_id]) { ?> href="tel:<?php echo $aurus_top_link3['title'][$language_id]; ?>"<?php } ?> > <?php echo html_entity_decode ($aurus_top_link3['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></a>
                           </li>
                           <?php } ?>
                           <?php } ?>
                           <?php if ((!empty($aurus_work_time)|| (!empty($aurus_work_time1)) || !empty($aurus_work_time2))) { ?>
                           <li class="drop_head"></li>
                           <li class="dropdown-header"><i class="fa fa-clock-o"></i> <?php echo $dropdown_work_time; ?></li>
                           <?php } ?>
                           <?php if (!empty($aurus_work_time)) { ?>
                           <li class = "work_time">
                              <?php echo $aurus_work_time; ?>
                           </li>
                           <?php } ?>
                           <?php if (!empty($aurus_work_time1)) { ?>
                           <li class = "work_time">
                              <?php echo $aurus_work_time1; ?>
                           </li>
                           <?php } ?>
                           <?php if (!empty($aurus_work_time2)) { ?>
                           <li class = "work_time">
                              <?php echo $aurus_work_time2; ?>
                           </li>
                           <?php } ?>
                           <?php if ($aurus_address[$language_id]) { ?>
                           <li class="drop_head"></li>
                           <li class="dropdown-header"><i class="fa fa-map-marker"></i> <?php echo $dropdown_address; ?></li>
                           <?php if ($aurus_show_fluid_map_footer == '0') { ?>
                           <li class = "address_yak address"><a href="#map_yak"><?php echo html_entity_decode($aurus_address[$language_id]) ?></a></li>
                           <?php } else { ?>
                           <li class = "address">
                              <?php echo html_entity_decode($aurus_address[$language_id]) ?>
                           </li>
                           <?php } ?>
                           <?php } ?>
                           <?php if ($aurus_mail_header[$language_id]) { ?>
                           <li class="drop_head"></li>
                           <li class="dropdown-header"><i class="fa fa-envelope-o "></i> <?php echo $dropdown_mail; ?></li>
                           <?php if ($aurus_mail_header[$language_id] ) { ?>
                           <li><a onClick="javascript:window.open('mailto:<?php echo $aurus_mail_header[$language_id];?>', 'Mail');event.preventDefault()" ><?php echo $aurus_mail_header[$language_id];?></a></li>
                           <?php } ?>
                           <?php } ?>
                           <?php if ($aridiuscallback_status && $aurus_calltop !=1) { ?>
                           <li class="drop_head"></li>
                           <li class="dropdown-header"><i class="fa fa-volume-control-phone"></i> <?php echo $dropdown_callorder; ?></li>
                           <li>
                              <a class = "call-order"><?php echo $button_title; ?></a>
                           </li>
                           <?php } ?>
                        </ul>
                     </div>
                     <?php } ?>
                  </div>
                  <div class="header_v1 mob_phone dropdown phone hidden-lg">
                     <div class="listunstyled dropdown-toggle" data-toggle="dropdown"><i class="fa fa-phone"></i></div>
                     <ul class="dropdown-menu fixxsmenu">
                        <li class="dropdown-header"><i class="fa fa-phone"></i> <?php echo $dropdown_tell; ?></li>
                        <?php if ($aurus_top_links3 ) { ?>
                        <?php foreach ($aurus_top_links3 as $aurus_top_link3) { ?>
                        <li>
                           <a <?php if ($aurus_top_link3['title'][$language_id]) { ?> href="tel:<?php echo $aurus_top_link3['title'][$language_id]; ?>"<?php } ?> > <?php echo html_entity_decode ($aurus_top_link3['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></a>
                        </li>
                        <?php } ?>
                        <?php } ?>
                        <?php if ((!empty($aurus_work_time)|| (!empty($aurus_work_time1)) || !empty($aurus_work_time2))) { ?>
                        <li class="drop_head"></li>
                        <li class="dropdown-header"><i class="fa fa-clock-o"></i> <?php echo $dropdown_work_time; ?></li>
                        <?php } ?>
                        <?php if (!empty($aurus_work_time)) { ?>
                        <li class = "work_time">
                           <?php echo $aurus_work_time; ?>
                        </li>
                        <?php } ?>
                        <?php if (!empty($aurus_work_time1)) { ?>
                        <li class = "work_time">
                           <?php echo $aurus_work_time1; ?>
                        </li>
                        <?php } ?>
                        <?php if (!empty($aurus_work_time2)) { ?>
                        <li class = "work_time">
                           <?php echo $aurus_work_time2; ?>
                        </li>
                        <?php } ?>
                        <?php if ($aurus_address[$language_id]) { ?>
                        <li class="drop_head"></li>
                        <li class="dropdown-header"><i class="fa fa-map-marker"></i> <?php echo $dropdown_address; ?></li>
                        <?php if ($aurus_show_fluid_map_footer == '0') { ?>
                        <li class = "address_yak address"><a href="#map_yak"><?php echo html_entity_decode($aurus_address[$language_id]) ?></a></li>
                        <?php } else { ?>
                        <li class = "address">
                           <?php echo html_entity_decode($aurus_address[$language_id]) ?>
                        </li>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($aurus_mail_header[$language_id]) { ?>
                        <li class="drop_head"></li>
                        <li class="dropdown-header"><i class="fa fa-envelope-o "></i> <?php echo $dropdown_mail; ?></li>
                        <?php if ($aurus_mail_header[$language_id] ) { ?>
                        <li><a onClick="javascript:window.open('mailto:<?php echo $aurus_mail_header[$language_id];?>', 'Mail');event.preventDefault()" ><?php echo $aurus_mail_header[$language_id];?></a></li>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($aridiuscallback_status && $aurus_calltop !=1) { ?>
                        <li class="drop_head"></li>
                        <li class="dropdown-header"><i class="fa fa-volume-control-phone"></i> <?php echo $dropdown_callorder; ?></li>
                        <li>
                           <a class = "call-order"><?php echo $button_title; ?></a>
                        </li>
                        <?php } ?>
                     </ul>
                  </div>
                  <?php if ($aurus_show_set !=1) { ?>
                  <div class="mob_settings header_v1">
                     <div class="dropdown bars">
                        <div class="listunstyled dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog"></i></div>
                        <ul class="dropdown-menu fixxsmenu">
                           <?php if ($aurus_show_topmenu_set !=0) { ?>
                           <?php if (!empty($currency)) { ?>
                           <li class="dropdown-header"><i class="fa fa-money"></i> <?php echo $text_money_set; ?></li>
                           <?php } ?>
                           <li>   <?php echo $currency; ?>  </li>
                           <?php if (!empty($currency)) { ?>
                           <li class="clearfix"></li>
                           <li class="drop_head"></li>
                           <?php } ?>
                           <?php if (!empty($language)) { ?>
                           <li class="dropdown-header"><i class="fa fa-globe"></i> <?php echo $text_language_set; ?></li>
                           <?php } ?>
                           <li> <?php echo $language; ?> </li>
                           <?php if (!empty($language)) { ?>
                           <li class="clearfix"></li>
                           <li class="drop_head"></li>
                           <?php } ?>
                           <?php } ?>
                           <?php if ($aurus_account_top !=0) { ?>
                           <li class="dropdown-header"><i class="fa fa-fw fa-sign-in"></i> <?php echo $text_account_set; ?></li>
                           <?php if ($logged) { ?>
                           <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                           <?php if ($aurus_order_top !=1) { ?>
                           <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                           <?php } ?>
                           <?php if ($aurus_transaction_top !=1) { ?>
                           <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                           <?php } ?>
                           <?php if ($aurus_download_top !=1) { ?>
                           <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                           <?php } ?>
                           <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                           <?php } else { ?>
                           <li><a href="<?php echo $register; ?>"><i class="fa fa-user"></i> <?php echo $text_register; ?></a></li>
                           <li><a href="<?php echo $login; ?>"><i class="fa fa-key"></i> <?php echo $text_login; ?></a></li>
                           <?php } ?>
                           <?php } ?>
                           <?php if ($aurus_wishlist_top !=0) { ?>
                           <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><i class="fa fa-heart"></i> <?php echo $text_wishlist; ?></a></li>
                           <?php } ?>
                           <?php if ($aurus_compare_top !=0) { ?>
                           <li><a href="<?php echo $compare; ?>" id="compare-total"><i class="fa fa-exchange"></i> <?php echo $text_compare; ?></a></li>
                           <?php } ?>
                           <?php if ($aurus_show_add_link !=0) { ?>
                           <li class="clearfix"></li>
                           <?php if ($aurus_show_topmenu_set !=0 || $aurus_account_top !=0 || $aurus_wishlist_top !=0 || $aurus_compare_top !=0) { ?>
                           <li class="drop_head"></li>
                           <?php } ?>
                           <li class="dropdown-header"><i class="fa fa-info"></i> <?php echo $text_info_set; ?></li>
                           <?php if ($aurus_top_links6 ) { ?>
                           <?php foreach ($aurus_top_links6 as $aurus_top_link6) { ?>
                           <li>
                              <a <?php if ($aurus_top_link6['link_top'][$language_id]) { ?> href="<?php echo $aurus_top_link6['link_top'][$language_id]; ?>"<?php } ?> title="<?php echo $aurus_top_link6['title'][$language_id]; ?>"><?php if ($aurus_top_link6['faicons_top']) { ?> <i class="<?php echo $aurus_top_link6['faicons_top']; ?>"></i><?php } ?><?php if ($aurus_top_link6['title']) { ?> <?php echo $aurus_top_link6['title'][$language_id]; ?><?php } ?></a>
                           </li>
                           <?php } ?>
                           <?php } ?>
                           <?php } ?>
                        </ul>
                     </div>
                  </div>
                  <?php } ?>
               </div>
            </div>
         </div>
      </div>
   </div>
</header>
<div class="top-menu">
<div id="top-menu">
   <div class="container nobackground">
      <nav id="menu" >
         <div class="collapse navbar-collapse navbar-ex1-collapse">
            <?php if ($aurus_seevmenu_menu !=1) { ?>
            <ul class="nav navbar-nav">
               <li class="dropdown hidev <?php if ($aurus_seevmenuw !=1) { ?>seevmenuw <?php } ?> <?php if ($class == 'common-home' && $aurus_seevmenu_menu_open !=1){?> open <?php } ?> ">
                  <a class="with-child dropdown-toggle" <?php if (!empty($aurus_link_menucatalog)) { ?> href="<?php echo $aurus_link_menucatalog; ?>" <?php } ?> data-hover="dropdown" data-delay="1" data-close-others="false">
                  <?php if ($aurus_seevmenuico !=1) { ?>
                  <i class="fa fa-bars"></i>&nbsp;&nbsp;
                  <?php } ?>
                  <?php echo $aurus_vmenu_menu[$language_id]; ?><span class="fa fa-angle-down menu"></span></a>
                  <ul id="menu_height" class="<?php if ($class != 'common-home' && $aurus_ico_home !=1) { ?> home <?php } else { ?>home1<?php } ?> dropdown-menu <?php if ($aurus_seevmenu_menu_open !=1) { ?> fix_scrollmenu <?php } ?> multi-level" role="menu">
                     <?php foreach ($categories as $category) { ?>
                     <?php if ($category['children']) { ?>
                     <li class="dropdown-submenu" >
                        <a style="white-space: normal; margin: 0; padding: 0; left: 12px; position: relative; line-height: 30px;" tabindex="-1" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?><span class="arrowvertmenu"></span>
                        <?php if ($aurus_sticker_menu !=1) { ?><?php if ($category['stickers'] == '1') { ?><span class="stickersmenu1v"><?php echo $aurus_name_sticker_menu_new[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '2') { ?><span class="stickersmenu2v"><?php echo $aurus_name_sticker_menu_sale[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '3') { ?><span class="stickersmenu3v"><?php echo $aurus_name_sticker_menu_top[$language_id];?></span><?php } ?><?php } ?></a>
                        <?php if ($category['image_main'] && $aurus_main_photos_menu !=1 && $category['column'] > 1) { ?>
                        <?php if ($category['column'] < 2) { ?>
                        <?php	$column_class = 'col-sm-12'; ?>
                        <?php	$column_width = 'column_width1_noimg'; ?>
                        <?php	$column_clear = 1; ?>
                        <?php } elseif ($category['column'] == 2) { ?>
                        <?php	$column_class = 'col-sm-6'; ?>
                        <?php	$column_width = 'column_width2'; ?>
                        <?php	$column_clear = 2; ?>
                        <?php } elseif ($category['column'] > 2) { ?>
                        <?php	$column_class = 'col-sm-4'; ?>
                        <?php	$column_width = 'column_width3'; ?>
                        <?php	$column_clear = 3; ?>
                        <?php } ?>
                        <?php } else { ?>
                        <?php if ($category['column'] < 2) { ?>
                        <?php	$column_class = 'col-sm-12'; ?>
                        <?php	$column_width = 'column_width1_noimg'; ?>
                        <?php	$column_clear = 1; ?>
                        <?php } elseif ($category['column'] == 2) { ?>
                        <?php	$column_class = 'col-sm-6'; ?>
                        <?php	$column_width = 'column_width2_noimg'; ?>
                        <?php	$column_clear = 2; ?>
                        <?php } elseif ($category['column'] == 3) { ?>
                        <?php	$column_class = 'col-sm-4'; ?>
                        <?php	$column_width = 'column_width3_noimg'; ?>
                        <?php	$column_clear = 3; ?>
                        <?php } elseif ($category['column'] > 3) { ?>
                        <?php	$column_class = 'col-sm-3'; ?>
                        <?php	$column_width = 'column_width3_noimg'; ?>
                        <?php	$column_clear = 4; ?>
                        <?php } ?>
                        <?php } ?>
                        <ul class="dropdown-menu2 <?php echo $column_width; ?>" style="background: url(<?php echo $category['image_menu_background']; ?>) 50% 50% no-repeat #ffffff;background-position:right;" >
                           <?php $i = 0; ?>
                           <?php if ($category['image_main'] && $aurus_main_photos_menu !=1 && $category['column'] > 1) { ?>
                           <li class="col-md-9">
                              <?php } else { ?>
                           <li class="col-md-12">
                              <?php } ?>
                              <?php foreach ($category['children'] as $child) { ?>
                              <div class="<?php echo $column_class; ?> mcol">
                                 <span class = "hidden-xs hidden-sm"><?php if ($aurus_photos_menu !=1 && (!empty($child['image2']))) { ?><a href="<?php echo $child['href']; ?>"><img class="vopmen img-responsive" src="<?php echo $child['image2']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" ></a><?php } ?></span>
                                 <div class="clearfix"></div>
                                 <a class="submenu_main" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                 <?php if ($aurus_sticker_menu !=1) { ?><?php if ($child['stickers'] == '1') { ?><span class="stickersmenu1v"><?php echo $aurus_name_sticker_menu_new[$language_id];?></span><?php } ?><?php if ($child['stickers'] == '2') { ?><span class="stickersmenu2v"><?php echo $aurus_name_sticker_menu_sale[$language_id];?></span><?php } ?><?php if ($child['stickers'] == '3') { ?><span class="stickersmenu3v"><?php echo $aurus_name_sticker_menu_top[$language_id];?></span><?php } ?><?php } ?>
                                 <?php if (isset($child['children_lv3']) && $child['children_lv3'] && $aurus_3lv_menu !=1) { ?>
                                 <?php $v = 0; ?>
                                 <?php foreach ($child['children_lv3'] as $child_lv3) { ?>
                                 <?php $v++; ?>
                                 <?php if($v >$aurus_countvmenulv) break; ?>
                                 <a class = "menuv_3lv " href="<?php echo $child_lv3['href']; ?>">&nbsp;&nbsp;- <?php echo $child_lv3['name']; ?></a>
                                 <?php if ($v >($aurus_countvmenulv -1)) { ?>
                                 <a class="menuv-allv" href="<?php echo $child['href']; ?>"><?php echo $aurus_seeall_menu[$language_id]; ?></a>
                                 <?php } ?>
                                 <?php } ?>
                                 <?php } ?>
                              </div>
                              <?php $i++; ?>
                              <?php if (($i == $column_clear)&&($i != 1)) { ?>
                              <div class="clearfix  visible-md visible-lg"></div>
                              <?php $i = 0; ?>
                              <?php } ?>
                              <?php } ?>
                           </li>
                           <?php if ($category['image_main'] && $aurus_main_photos_menu !=1 && $category['column'] > 1) { ?>
                           <li class="col-lg-3">
                              <?php if (!$category['image_menu_background']) { ?>
                              <a href="<?php echo $category['href']; ?>"><img class="image_main img-responsive" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" src="<?php echo $category['image_main']; ?>"></a>
                              <?php } ?>
                           </li>
                           <?php } ?>
                        </ul>
                     </li>
                     <?php } else { ?>
                     <li class="v3hover"><a style="white-space: normal; margin: 0; padding: 0; left: 12px; position: relative; line-height: 30px;" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?>
                        <?php if ($aurus_sticker_menu !=1) { ?><?php if ($category['stickers'] == '1') { ?><span class="stickersmenu1v"><?php echo $aurus_name_sticker_menu_new[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '2') { ?><span class="stickersmenu2v"><?php echo $aurus_name_sticker_menu_sale[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '3') { ?><span class="stickersmenu3v"><?php echo $aurus_name_sticker_menu_top[$language_id];?></span><?php } ?><?php } ?></a>
                     </li>
                     <?php } ?>
                     <?php } ?>
                     <?php if ($aurus_link_special) { ?>
                     <li>
                        <hr>
                     </li>
                     <?php } ?>
                     <!--add menu link-->
                     <?php if ($aurus_link_special) { ?>
                     <li class ="menu_special"><a href="<?php echo $aurus_link_special; ?>"><?php echo $aurus_menu_special[$language_id];?></a></li>
                     <?php } ?>
                  </ul>
                  <?php if ($aurus_hover_menu !=1) { ?>
                  <div class="backdrop"></div>
                  <?php } ?>
               </li>
            </ul>
            <?php } ?>
            <?php if ($aurus_ico_home !=1 && $home != $og_url) { ?>
            <ul class="nav navbar-nav">
               <li><a href="<?php echo $base; ?>"><i class="fa fa-home" style="font-size: 16px;"></i></a></li>
            </ul>
            <?php } ?>
            <?php if ($aurus_seevmenu_menu ==1) { ?>
            <div class="menu_mob_plus1">
               <ul class="nav navbar-nav">
                  <?php foreach ($categories as $category) { ?>
                  <?php if ($category['children']) { ?>
                  <li class="<?php if($category['category_id']==$category_id) {echo 'activetopmenu';}?> dropdown menu-large" <?php if ($category['column'] == 1 && $aurus_col1_menu !=1) { ?><?php } else { ?>style='position:static;'<?php } ?>	>
                     <a class="with-child dropdown-toggle" href="<?php echo $category['href']; ?>" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $category['name']; ?><?php if ($aurus_sticker_menu !=1) { ?><?php if ($category['stickers'] == '1') { ?><span class="stickersmenu1"><?php echo $aurus_name_sticker_menu_new[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '2') { ?><span class="stickersmenu2"><?php echo $aurus_name_sticker_menu_sale[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '3') { ?><span class="stickersmenu3"><?php echo $aurus_name_sticker_menu_top[$language_id];?></span><?php } ?><?php } ?><span class="fa fa-angle-down menu"></span></a>
                     <div class="<?php if ($category['column'] == 1 && $aurus_col1_menu !=1) { ?> colm1<?php } ?> bgm dropdown-menu megamenu row backgnone" <?php if ($category['image_menu_background']) { ?> style="background: url(<?php echo $category['image_menu_background']; ?>) 50% 50% no-repeat #ffffff;background-position:right;"<?php } ?>	 >
                        <?php if (($category['column'] == 1 && $aurus_col1_menu !=1) || ($category['column'] == 2 && $aurus_col1_menu !=2)){ ?>
                        <div class="container2">
                           <?php } else { ?>
                           <div class="container fixmmenu">
                              <?php } ?>
                              <div class="dropdown-inner children-category">
                                 <?php if ($category['image_main'] && $aurus_main_photos_menu !=1 && !$category['image_menu_background']  ) { ?>
                                 <div class="menu_main_photos <?php if ($category['column'] == 1) { ?> hidden-md hidden-lg<?php } ?>">
                                    <a href="<?php echo $category['href']; ?>"><img class="image_main img-responsive" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" src="<?php echo $category['image_main']; ?>">
                                    </a>
                                    <span class="main-foto-back"></span>
                                 </div>
                                 <?php } ?>
                                 <?php foreach ($category['children'] as $child) { ?>
                                 <ul class="list-unstyled" style="width: <?php if ($category['image_main'] && $aurus_main_photos_menu !=1 && !$category['image_menu_background']) {echo (82/$category['column'])-1;} else {echo (100/$category['column'])-1;} ?>%">
                                    <?php if (isset($child['children_lv3']) && $child['children_lv3']) { ?>
                                    <li class="with-child" >
                                       <span><?php if ($aurus_photos_menu !=1 && (!empty($child['image2']))) { ?><a href="<?php echo $child['href']; ?>"><img class="opacityhv img-responsive" src="<?php echo $child['image2']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" ></a><?php } ?></span>
                                       <a href="<?php echo $child['href']; ?>"><span class="style2lv"><?php echo $child['name']; ?><?php if ($aurus_sticker_menu !=1) { ?><?php if ($child['stickers'] == '1') { ?><span class="stickersmenu1v"><?php echo $aurus_name_sticker_menu_new[$language_id];?></span><?php } ?><?php if ($child['stickers'] == '2') { ?><span class="stickersmenu2v"><?php echo $aurus_name_sticker_menu_sale[$language_id];?></span><?php } ?><?php if ($child['stickers'] == '3') { ?><span class="stickersmenu3v"><?php echo $aurus_name_sticker_menu_top[$language_id];?></span><?php } ?><?php } ?></span></a>
                                    </li>
                                    <?php if ($aurus_3lv_menu !=1) { ?>
                                    <?php $m = 0; ?>
                                    <?php foreach ($child['children_lv3'] as $child_lv3) { ?>
                                    <?php $m++; ?>
                                    <?php if($m >$aurus_countvmenulv) break; ?>
                                    <li class="children_lv3"><a href="<?php echo $child_lv3['href']; ?>">&nbsp;&nbsp;- <?php echo $child_lv3['name']; ?></a>
                                       <?php if ($m >($aurus_countvmenulv -1)) { ?>
                                       <a class="menuv-all" href="<?php echo $child['href']; ?>"><?php echo $aurus_seeall_menu[$language_id]; ?></a>
                                       <?php } ?>
                                    </li>
                                    <?php } ?>
                                    <?php } ?>
                                    <?php } else { ?>
                                    <li><?php if ($aurus_photos_menu !=1 && (!empty($child['image2']))) { ?><span><a href="<?php echo $child['href']; ?>"><img class="opacityhv img-responsive" src="<?php echo $child['image2']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" ></a></span><?php } ?><a href="<?php echo $child['href']; ?>"><span class="style2lv"><?php echo $child['name']; ?><?php if ($aurus_sticker_menu !=1) { ?><?php if ($child['stickers'] == '1') { ?><span class="stickersmenu1v"><?php echo $aurus_name_sticker_menu_new[$language_id];?></span><?php } ?><?php if ($child['stickers'] == '2') { ?><span class="stickersmenu2v"><?php echo $aurus_name_sticker_menu_sale[$language_id];?></span><?php } ?><?php if ($child['stickers'] == '3') { ?><span class="stickersmenu3v"><?php echo $aurus_name_sticker_menu_top[$language_id];?></span><?php } ?><?php } ?></span></a></li>
                                    <?php } ?>
                                 </ul>
                                 <?php } ?>
                              </div>
                           </div>
                        </div>
                        <?php if ($aurus_hover_menu !=1) { ?>
                        <div class="backdrop"></div>
                        <?php } ?>
                        <div class="clearfix"></div>
                  </li>
                  <?php } else { ?>
                  <li class="<?php if($category['category_id']==$category_id) {echo 'activetopmenu';}?>"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?><?php if ($aurus_sticker_menu !=1) { ?><?php if ($category['stickers'] == '1') { ?><span class="stickersmenu1"><?php echo $aurus_name_sticker_menu_new[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '2') { ?><span class="stickersmenu2"><?php echo $aurus_name_sticker_menu_sale[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '3') { ?><span class="stickersmenu3"><?php echo $aurus_name_sticker_menu_top[$language_id];?></span><?php } ?><?php } ?></a></li>
                  <?php } ?>
                  <?php } ?>
               </ul>
               </div>
               <?php } ?>
               <ul class="nav navbar-nav">
                  <!--add menu link-->
                  <?php if ($aurus_top_links8 ) { ?>
                  <?php foreach ($aurus_top_links8 as $aurus_top_link8) { ?>
                  <li>
                     <a <?php if ($aurus_top_link8['link_top'][$language_id]) { ?> href="<?php echo $aurus_top_link8['link_top'][$language_id]; ?>"<?php } ?>><?php if ($aurus_top_link8['faicons_top']) { ?> <i class="<?php echo $aurus_top_link8['faicons_top']; ?>"></i> <?php } ?><?php if ($aurus_top_link8['title']) { ?><?php echo $aurus_top_link8['title'][$language_id]; ?><?php } ?></a>
                  </li>
                  <?php } ?>
                  <?php } ?>
                  <!--add menu link-->
                  <!--other link-->
                  <?php if ($aurus_main_link_menu[$language_id]) { ?>
                  <li class="dropdown">
                     <a class="with-child dropdown-toggle" href="<?php echo $aurus_main_link_href_menu[$language_id]; ?>" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $aurus_main_link_menu[$language_id]; ?><span class="fa fa-angle-down menu"></span></a>
                     <div class="dropdown-menu">
                        <div class="dropdown-inner1 children-category">
                           <ul class="list-unstyled">
                              <?php if ($aurus_top_links4 ) { ?>
                              <?php foreach ($aurus_top_links4 as $aurus_top_link4) { ?>
                              <li>
                                 <a <?php if ($aurus_top_link4['link_top'][$language_id]) { ?> href="<?php echo $aurus_top_link4['link_top'][$language_id]; ?>"<?php } ?> title="<?php echo $aurus_top_link4['title'][$language_id]; ?>"><?php if ($aurus_top_link4['faicons_top']) { ?> <i class="<?php echo $aurus_top_link4['faicons_top']; ?>"></i><?php } ?><?php if ($aurus_top_link4['title']) { ?> <?php echo $aurus_top_link4['title'][$language_id]; ?><?php } ?></a>
                              </li>
                              <?php } ?>
                              <?php } ?>
                           </ul>
                        </div>
                     </div>
                  </li>
                  <?php } ?>
                  <!--other link END-->
                  <!--informations-->
                  <?php if ($aurus_info_menu !=1) { ?>
                  <?php if ($informations) { ?>
                  <li class="dropdown">
                     <a class="with-child dropdown-toggle" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $text_information; ?><span class="fa fa-angle-down menu"></span></a>
                     <div class="dropdown-menu">
                        <div class="dropdown-inner1 children-category">
                           <ul class="list-unstyled">
                              <?php foreach ($informations as $information) { ?>
                              <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                              <?php } ?>
                           </ul>
                        </div>
                     </div>
                  </li>
                  <?php } ?>
                  <?php } ?>
                  <!--informations END-->
                  <!--add menu link-->
                  <?php if ($aurus_link_special) { ?>
                  <li class ="menu_special hide_dopmenu"><a href="<?php echo $aurus_link_special; ?>"><?php echo $aurus_menu_special[$language_id];?></a></li>
                  <?php } ?>
               </ul>
            </div>
      </nav>
      </div>
   </div>
</div>
<script>
   //mobile_menu
   function MobMenu() {
   slideout.open();
   $.ajax({
   type: 'POST',
   url: 'index.php?route=common/header',
   data:"aridius_mob_menu=1&location=<?php echo $class ?>",
   beforeSend: function(){
   $('.overlay').html('<div id="preloader"><i class="fa fa-spinner fa-spin"></i></div>');
   },
   success: function(mobm){
   $('#menu_m').html(mobm);
   $('#preloader').remove();
   }
   });
   }
</script>
<!--sticky-->
<?php if ($aurus_sticky_menu !=1) { ?>
<script>
   $(document).ready(function() {
   if($("#top-fixed").length==0) {
   var menu_clone = '<div class="container">';
   menu_clone += '<div class="row vertical-align">';
   menu_clone += '<div class = "col-xs-2 col-sm-1 hidden-md hidden-lg" id="mobmenu_clone"></div>';
   menu_clone += '<div class = "col-xs-3 col-sm-4 hidden-md hidden-lg" id="logo_clone"></div>';
   menu_clone += '<div class = "header_v2 col-md-9 col-lg-10" id="menu_clone"></div>';
   menu_clone += '<div id="set_clone" class = "fix_mxs2 col-xs-7 col-sm-8 col-md-3 col-lg-2" ></div>';
   menu_clone += '</div>';
   menu_clone += '</div>';
   $('#scroll').before('<div id="menu_scroll">'+menu_clone+'</div>');
   $('#mobmenu').clone().appendTo('#mobmenu_clone');
   $('#logo').clone().appendTo('#logo_clone');
   $('#menu').clone().appendTo('#menu_clone');
   $('#setclone').clone().appendTo('#set_clone');
   /* Search close */
   $('#menu_scroll .serv1 .inp_sear').on('blur', function(){
   $('.cl_search').removeClass('cl_searchon');
   $('.mmenu').removeClass('dell_mmenu');
   }).on('focus', function(){
   $('.cl_search').addClass('cl_searchon');
   $('.mmenu').addClass('dell_mmenu');
   });
   // Currency
   $('#menu_scroll #form-currency .currency-select').on('click', function(e) {
   e.preventDefault();
   $('#form-currency input[name=\'code\']').val($(this).attr('name'));
   $('#form-currency').submit();
   });
   // Language
   $('#menu_scroll #form-language .language-select').on('click', function(e) {
   e.preventDefault();
   $('#form-language input[name=\'code\']').val($(this).attr('name'));
   $('#form-language').submit();
   });
   /* Search */
   $('#menu_scroll #search input[name=\'search\']').parent().find('button').on('click', function() {
   var url = $('base').attr('href') + 'index.php?route=product/search';
   var value = $('input[name=\'search\']').val();
   if (value) {
   url += '&search=' + encodeURIComponent(value);
   }
   location = url;
   });
   $('#search input[name=\'search\']').on('keydown', function(e) {
   if (e.keyCode == 13) {
   $('input[name=\'search\']').parent().find('button').trigger('click');
   }
   });
   $('#menu_scroll input[name="search"]').livesearch({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=extension/module/aridius_livesearch/livesearch&search=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
                     label: item['name'],
                     price: item['price'],
                     special: item['special'],
                     image: item['image'],
                     href: item['href'],
                     value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'search\']').val(item['label']);
	}
   });
   /* cart_open  */
   $("#menu_scroll .cart_openp").click(function(){$.magnificPopup.open({removalDelay:500,fixedContentPos:!0,items:{src:"index.php?route=common/aridius_cart/info"},type:"ajax",mainClass:"mfp-fade"})});
   }
   $(window).scroll(function(){
   if($(this).scrollTop()>180) {
   $('#menu_scroll').addClass('sticky');
   $('.st_search').addClass('mob_search2').removeClass('mob_search');
   $('.st_search').addClass('serv2').removeClass('serv1');
   $('.st_search').addClass('header_v2').removeClass('header_v1');
   $('.mob_phone').removeClass('hidden-lg');
   $('.sss2').addClass('mob_phonex2');
   $('.cart-price').addClass('st_cart-price');
   $('.mob_settings').addClass('st_mob_settings');
   }else{
   $('#menu_scroll').removeClass('sticky');
   $('.st_search').addClass('mob_search').removeClass('mob_search2');
   $('.st_search').addClass('serv1').removeClass('serv2');
   $('.st_search').addClass('header_v1').removeClass('header_v2');
   $('.mob_phone').addClass('hidden-lg');
   $('.sss2').removeClass('mob_phonex2');
   $('.cart-price').removeClass('st_cart-price');
   $('.mob_settings').removeClass('st_mob_settings');
   }
   });
   });
</script>
<?php } ?>
<script>
   /* Search close */
   $('.serv1 .inp_sear').on('blur', function(){
   $('.cl_search').removeClass('cl_searchon2');
   $('.mmenu').removeClass('dell_mmenu');
   }).on('focus', function(){
   $('.cl_search').addClass('cl_searchon2');
   $('.mmenu').addClass('dell_mmenu');
   });
</script>
<script>
   // mobile menu slideout.min.js
   var slideout = new Slideout({
   'panel': document.getElementById('main_m'),
   'menu': document.getElementById('menu_m'),
   'padding': 320,
   'tolerance': 70,
   });
   function close(eve) {
   eve.preventDefault();
   slideout.close();
   }
   slideout
   .on('beforeopen', function() {
   this.panel.classList.add('panel-open');
   $(".overlay").css({display:""});
   $('.slideout-menu-left').addClass('slideout_ml');
   })
   .on('open', function() {
   $('.slideout-menu-left').removeClass('slideout_ml');
   })
   .on('close', function() {
   $("#menu_m").html("");
   })
   .on('beforeclose', function() {
   this.panel.classList.remove('panel-open');
   $(".overlay").css({display:"none"});
   $('.slideout-menu-left').addClass('slideout_ml');
   });
   $('.overlay').on('click', function() {
   slideout.close();
   });
</script>
