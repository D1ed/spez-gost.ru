<?php if ($aurus_mob_logo !=1) { ?>
<div class="mmune_logo">
   <?php if ($logo) { ?>
   <?php if ($location_mmenu == 'common-home') { ?>
   <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
   <?php } else { ?>
   <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
   <?php } ?>
   <?php } else { ?>
   <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
   <?php } ?>
</div>
<?php } ?>
<?php if ($aurus_mob_home !=1 && $location_mmenu != 'common-home') { ?>
<ul class="nav navbar-nav">
   <li class = "home_mob"><a href="<?php echo $base; ?>"><?php echo $text_home; ?></a></li>
</ul>
<?php } ?>
<?php if ($aurus_mobcat_group !=1) { ?>
<button type="button" class="navbar-toggle menu_up collapsed" data-toggle="collapse" data-target="#navbar_mmenu"><span class="cat_mob"><i class="fa fa-bars"></i> <?php echo $text_category; ?></span><i class="fammenu fa fa-plus"></i></button>
<?php } ?> 
<span class="clearfix"></span>
<div <?php if ($aurus_mobcat_group !=1) { ?> class="navbar-collapse collapse" <?php } ?> id="navbar_mmenu">
   <div id="menu" class="navbar">
      <div class="menu_mob_plus">
         <div class="hidem">
            <ul class="nav navbar-nav">
               <?php foreach ($categories as $category) { ?>
               <?php if ($category['children']) { ?>
               <li class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></li>
               <li class="<?php if($category['category_id']==$category_id) {echo 'activetopmenu';}?> dropdown">
                  <a class="with-child dfgfd dropdown-toggle" href="<?php echo $category['href']; ?>" data-hover="dropdown" data-delay="1" data-close-others="false"><?php echo $category['name']; ?><?php if ($aurus_sticker_menu !=1) { ?><?php if ($category['stickers'] == '1') { ?><span class="stickersmenu1"><?php echo $aurus_name_sticker_menu_new[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '2') { ?><span class="stickersmenu2"><?php echo $aurus_name_sticker_menu_sale[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '3') { ?><span class="stickersmenu3"><?php echo $aurus_name_sticker_menu_top[$language_id];?></span><?php } ?><?php } ?><span class="fa fa-angle-down menu"></span></a>
                  <div class="dropdown-menu">
                     <div class="dropdown-inner children-category">
                        <?php foreach ($category['children'] as $child) { ?>
                        <ul class="list-unstyled">
                           <?php if (isset($child['children_lv3']) && $child['children_lv3']) { ?>
                           <li class="with-child" >
                              <a href="<?php echo $child['href']; ?>"><span class="style2lv"><?php echo $child['name']; ?><?php if ($aurus_sticker_menu !=1) { ?><?php if ($child['stickers'] == '1') { ?><span class="stickersmenu1"><?php echo $aurus_name_sticker_menu_new[$language_id];?></span><?php } ?><?php if ($child['stickers'] == '2') { ?><span class="stickersmenu2"><?php echo $aurus_name_sticker_menu_sale[$language_id];?></span><?php } ?><?php if ($child['stickers'] == '3') { ?><span class="stickersmenu3"><?php echo $aurus_name_sticker_menu_top[$language_id];?></span><?php } ?><?php } ?></span></a>
                           </li>
                           <?php if ($aurus_3lv_menu !=1) { ?>         
                           <?php foreach ($child['children_lv3'] as $child_lv3) { ?>
                           <li class="children_lv3"><a href="<?php echo $child_lv3['href']; ?>">&nbsp;&nbsp;- <?php echo $child_lv3['name']; ?></a></li>
                           <?php } ?> 
                           <?php } ?>	
                           <?php } else { ?>
                           <li><a href="<?php echo $child['href']; ?>"><span class="style2lv"><?php echo $child['name']; ?><?php if ($aurus_sticker_menu !=1) { ?><?php if ($child['stickers'] == '1') { ?><span class="stickersmenu1"><?php echo $aurus_name_sticker_menu_new[$language_id];?></span><?php } ?><?php if ($child['stickers'] == '2') { ?><span class="stickersmenu2"><?php echo $aurus_name_sticker_menu_sale[$language_id];?></span><?php } ?><?php if ($child['stickers'] == '3') { ?><span class="stickersmenu3"><?php echo $aurus_name_sticker_menu_top[$language_id];?></span><?php } ?><?php } ?></span></a></li>
                           <?php } ?>
                        </ul>
                        <?php } ?>
                     </div>
                  </div>
               </li>
               <?php } else { ?>
               <li class="<?php if($category['category_id']==$category_id) {echo 'activetopmenu';}?>"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?><?php if ($aurus_sticker_menu !=1) { ?><?php if ($category['stickers'] == '1') { ?><span class="stickersmenu1"><?php echo $aurus_name_sticker_menu_new[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '2') { ?><span class="stickersmenu2"><?php echo $aurus_name_sticker_menu_sale[$language_id];?></span><?php } ?><?php if ($category['stickers'] == '3') { ?><span class="stickersmenu3"><?php echo $aurus_name_sticker_menu_top[$language_id];?></span><?php } ?><?php } ?></a></li>
               <?php } ?>
               <?php } ?>
            </ul>
         </div>
         <ul class="nav navbar-nav">
            <!--other link-->
            <?php if ($aurus_main_link_menu[$language_id]) { ?>
            <li class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></li>
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
            <li class="plus"><i class="fa fa-plus"></i><i class="fa fa-minus"></i></li>
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
         </ul>
      </div>
   </div>
</div>
<div class="menu_mob_plus">
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
   </ul>
</div>
<?php if ($aurus_link_special) { ?>
<div class ="menu_special"><a href="<?php echo $aurus_link_special; ?>"><?php echo $aurus_menu_special[$language_id];?></a></div>
<?php } ?>
<?php if ($aurus_mob_cart !=1) { ?>
<div class="cart_open_mmenu"><?php echo $text_cart; ?> </div>
<script>
   $(".cart_open_mmenu").click(function(){slideout.close();$.magnificPopup.open({removalDelay:500,fixedContentPos:!0,items:{src:"index.php?route=common/aridius_cart/info"},type:"ajax",mainClass:"mfp-fade"})});
</script>
<?php } ?>
<ul class="list-unstyled">
   <?php if ($aurus_top_links3 && $aurus_mob_tell !=1) { ?>
   <li>
      <hr>
   </li>
   <?php foreach ($aurus_top_links3 as $aurus_top_link3) { ?>
   <li class = "tell_mmenu">
      <a <?php if ($aurus_top_link3['title'][$language_id]) { ?> href="tel:<?php echo $aurus_top_link3['title'][$language_id]; ?>"<?php } ?> > <?php echo html_entity_decode ($aurus_top_link3['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></a>
   </li>
   <?php } ?>
   <?php } ?>
   <?php if (!empty($aurus_work_time) && $aurus_mob_work !=1) { ?>
   <li class = "work_time_mmenu ">
      <?php echo $aurus_work_time; ?> <?php if (!empty($aurus_work_time1)) { ?><?php echo $aurus_work_time1; ?><?php } ?>  <?php if (!empty($aurus_work_time2)) { ?><?php echo $aurus_work_time2; ?><?php } ?>
   </li>
   <?php } ?>
   <?php if ($aurus_mail_header[$language_id] && $aurus_mob_mail !=1) { ?>
   <li class = "mail_mmenu"><a onClick="javascript:window.open('mailto:<?php echo $aurus_mail_header[$language_id];?>', 'Mail');event.preventDefault()" ><?php echo $aurus_mail_header[$language_id];?></a></li>
   <?php } ?>
   <?php if ($aurus_address[$language_id] && $aurus_mob_address !=1 ) { ?>
   <li class = "address_mmenu">
      <?php echo html_entity_decode($aurus_address[$language_id]) ?>
   </li>
   <?php } ?>
</ul>
<?php if ($aurus_mob_account !=1) { ?>
<div class="menu_mob_plus">
   <ul class="nav navbar-nav">
      <li>
         <hr>
      </li>
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
      <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><i class="fa fa-heart"></i> <?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $compare; ?>" id="compare-total"><i class="fa fa-exchange"></i> <?php echo $text_compare; ?></a></li>
   </ul>
</div>
<?php } ?>
<script>
   // mobile menu
   $(document).ready(function(){
   $('#menu .menu_mob_plus li').click(function(e) {
   $(this).toggleClass("open").find('>ul').stop(true, true).slideToggle(3000)
   .end().siblings().find('>ul').slideUp().parent().removeClass("open");
   e.stopPropagation();
   // Замена + на - во время открытия меню
   $(this).prev().find('.fa-plus').toggle();
   $(this).prev().find('.fa-minus').toggle();
   });
   $('#menu li a').click(function(e) {
   e.stopPropagation();
   });
   // Раскрытие/скрытие пунктов меню 3го уровня
   $('.children-category > ul > li').each(function(i, elem){
   if( $(elem).hasClass('children_lv3') ) {
   var ulElements = $(elem).parent().find('li');
   if( $(ulElements[0]).find('a.plus-link').length == 0 ) {
   $(ulElements[0]).append('<a href="#" class="plus-link"><i class="fa fa-plus" style="display: inline; "></i><i class="fa fa-minus" style="display: none;"></i></a>');
   $(ulElements[0]).find('a.plus-link').click(function(e){
   $(ulElements[0]).find('a.plus-link > .fa-plus').toggle();
   $(ulElements[0]).find('a.plus-link > .fa-minus').toggle();
   $(ulElements[0]).parent().find('.children_lv3').toggle();
   return false;
   });
   }
   }
   });
   $('.menu_up').click(function(e) {
   $(".fammenu").toggleClass("fa-plus fa-minus");
   });
   });
</script>