<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8">
<![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9">
<![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<?php if ($config_minify !=0) { ?>
<script src="catalog/view/theme/aurus/js/jquery/jquery-2.1.1.min.js"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
<script src="catalog/view/theme/aurus/js/aridius/blazy.min.js"></script>
<script src="catalog/view/theme/aurus/js/swiper/js/swiper.min.js"></script>
<script src="catalog/view/theme/aurus/js/common.js"></script>
<script src="catalog/view/theme/aurus/js/aridius/aridiusquickview.js"></script>
<script src="catalog/view/theme/aurus/js/aridius/slideout.min.js"></script>
<script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js"></script>
<script src="catalog/view/theme/aurus/js/aridius/module.js"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/aurus/js/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/aurus/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/aurus/stylesheet/aurus.css" rel="stylesheet">
<link href="catalog/view/theme/aurus/stylesheet/module.css" rel="stylesheet">
<link href="catalog/view/theme/aurus/js/swiper/css/swiper.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/javascript/jquery/magnific/magnific-popup.css" rel="stylesheet">
<link href="catalog/view/theme/aurus/stylesheet/animate.min.css" rel="stylesheet" type="text/css" />
<?php } else { ?>	
<script src="/min/f=catalog/view/theme/aurus/js/jquery/jquery-2.1.1.min.js,catalog/view/javascript/bootstrap/js/bootstrap.min.js,catalog/view/theme/aurus/js/aridius/blazy.min.js,catalog/view/theme/aurus/js/swiper/js/swiper.min.js,catalog/view/theme/aurus/js/common.js,catalog/view/theme/aurus/js/aridius/aridiusquickview.js,catalog/view/theme/aurus/js/aridius/slideout.min.js,catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js,catalog/view/theme/aurus/js/aridius/module.js"></script>
<link href="/min/f=catalog/view/javascript/bootstrap/css/bootstrap.min.css,catalog/view/theme/aurus/js/font-awesome/css/font-awesome.min.css,catalog/view/theme/aurus/stylesheet/stylesheet.css,catalog/view/theme/aurus/stylesheet/aurus.css,catalog/view/theme/aurus/stylesheet/module.css,catalog/view/theme/aurus/js/swiper/css/swiper.min.css,catalog/view/javascript/jquery/magnific/magnific-popup.css,catalog/view/theme/aurus/stylesheet/animate.min.css" rel="stylesheet" media="screen" />
<?php } ?>	
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<style>
<?php echo $aurus_css; ?>
.dropdown.hidev  {
<?php echo $aurus_gradient ?>;
}
<?php if ($aurus_options_prise == 0)  {?>
.hide_optprise {
display: none;
}
<?php } ?>
.block_desc {
height: <?php echo $aurus_categories_limit_height ?>px;
}
<?php if (!empty($aridius_text_home_height)) {?>
.block_desc2 {
height: <?php echo $aridius_text_home_height ?>px;
}
<?php } else { ?>
height: auto;
<?php } ?>
.btn-cart, .btn-instock, .load_more {
border-radius: <?php echo $aurus_border_cart ?>px;
}
.stickers-all, .stickers-top, .stickers-special, .stickers-new {
border-radius: <?php echo $aurus_border_stickers ?>px;
}
#menu .nav > li.hidev > a {
color: <?php echo $aurus_color81 ?>!important;
}
#menu .nav > li.hidev > a:hover {
color: <?php echo $aurus_color82 ?>!important;
}
#top {
background: <?php echo $aurus_color1 ?>;
border-bottom: 1px solid <?php echo $aurus_color7 ?>;
}
#top .btn-link, #top-links li, #top-links a {
color: <?php echo $aurus_color2 ?>;
}
#top .btn-link:hover, #top-links li:hover, #top-links a:hover {
color: <?php echo $aurus_color3 ?>;
}
.top-header{
background: <?php echo $aurus_color4 ?>;
}
.tell_nav, .phone .caret, .call_v1.call-order {
color: <?php echo $aurus_color5 ?>;
}
.mob_phone .listunstyled, .mob_search2.serv2 .sub_sear, .mob_settings .listunstyled, .header_v1 .sub_sear:before  {
color: <?php echo $aurus_color6 ?>!important;
}
.cart-item {
background: <?php echo $aurus_color8 ?>;
}
.cart-item-after {
color: <?php echo $aurus_color9 ?>;
}
#cart > .btn {
color: <?php echo $aurus_color10 ?>;
}
#search .btn-lg {
background: <?php echo $aurus_color11 ?>;
}
#search .btn-lg:hover {
background: <?php echo $aurus_color12 ?>;
}
#top-menu, #menu_scroll.top-header2, .top-menu_p {
background: <?php echo $aurus_color13 ?> none repeat scroll 0 0;
}
#menu .nav > li > a {
color: <?php echo $aurus_color14 ?>;
}
#menu .nav > li > a:hover,  #menu .nav > li.activetopmenu > a {
color:  <?php echo $aurus_color15 ?>;
}
.menuv-all, .menuv-allv{
color: <?php echo $aurus_color17 ?>!important;
}
.menuv-all:hover, .menuv-allv:hover {
color: <?php echo $aurus_color18 ?>!important;
}
.stickersmenu1, .stickersmenu1:after, .stickersmenu1v {
background: <?php echo $aurus_color19 ?>;
color: <?php echo $aurus_color20 ?>;
}
.stickersmenu2, .stickersmenu2:after, .stickersmenu2v {
background: <?php echo $aurus_color21 ?>;
color: <?php echo $aurus_color22 ?>;
}
.stickersmenu3, .stickersmenu3:after, .stickersmenu3v {
background: <?php echo $aurus_color23 ?>;
color: <?php echo $aurus_color24 ?>;
}
.btn-cart, .btn-primary, .load_more, .load_more:focus, .noUi-connect {
background: <?php echo $aurus_color25 ?>;
color: <?php echo $aurus_color26 ?>;
}
.btn-instock, .btn-instock2 {
background: <?php echo $aurus_color27 ?>;
color: <?php echo $aurus_color28 ?>;
border: 1px solid <?php echo $aurus_color29 ?>;
}
.btn-cart:hover, .btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled], .load_more:hover  {
background: <?php echo $aurus_color30 ?>;
color: <?php echo $aurus_color31 ?>;
}
.btn-instock:hover, .btn-instock2:hover {
background: <?php echo $aurus_color32 ?>;
color: <?php echo $aurus_color33 ?>;
border: 1px solid <?php echo $aurus_color34 ?>;
}
#fast-order.btn-cart, #fast-order2.btn-cart, #fast-order3.btn-cart {
background: <?php echo $aurus_color86 ?>;
color: <?php echo $aurus_color87 ?>;
border: 1px solid <?php echo $aurus_color88 ?>;
}
#fast-order.btn-cart:hover, #fast-order2.btn-cart:hover, #fast-order3.btn-cart:hover{
background: <?php echo $aurus_color89 ?>;
color: <?php echo $aurus_color90 ?>;
border: 1px solid <?php echo $aurus_color91 ?>;
}
.price-new, .price, .prise_spec_clone {
color: <?php echo $aurus_color35 ?>;
}
.price-old, .prise_clone {
color: <?php echo $aurus_color36 ?>;
}
.nav-tabs.mod > li.active > a, .nav-tabs.mod > li.active > a:focus, .nav-tabs.mod > li.active > a:hover {
border-bottom: 2px solid <?php echo $aurus_color37 ?>;
}
a, .search-all, .currency-select, .list-unstyled li span a{
color: <?php echo $aurus_color38 ?>;
}
.currency-select, .language-select, #navt .dropdown-menu-left li a {
color: <?php echo $aurus_color38 ?>!important;
}
.currency-select:hover, .language-select:hover, #navt .dropdown-menu-left li a:hover {
color: <?php echo $aurus_color39 ?>!important;
}
a:focus, a:hover, .search-all:hover, .breadcrumb > li > a:hover, .buttonsaridius_news a:hover, .dropdown-menu > li > a:focus, .dropdown-menu > li > a:hover, .list-unstyled li span a:hover, .list-unstyled li a:hover{
color: <?php echo $aurus_color39 ?>;
}
.stickers-new{
background: <?php echo $aurus_color40 ?>;
color: <?php echo $aurus_color41 ?>;
}
.stickers-special{
background: <?php echo $aurus_color42 ?>;
color: <?php echo $aurus_color43 ?>;
}
.stickers-top{
background: <?php echo $aurus_color44 ?>;
color: <?php echo $aurus_color45 ?>;
}
.btn-default2.active {
color: <?php echo $aurus_color46 ?>;
}
.bl_center a {
color: <?php echo $aurus_color47 ?>;
}
.bl_center a:hover {
color: <?php echo $aurus_color85?>;
}
footer {
background-color: <?php echo $aurus_color48 ?>;
}
.footer-name {
color: <?php echo $aurus_color49 ?>;
}
footer .list-unstyled li ,footer .list-unstyled li a, .aboutus_footer, .copyrightf, footer a, .cat_footer {
color: <?php echo $aurus_color50 ?>;
}
footer .list-unstyled li a:hover, footer a:hover, .cat_footer:hover  {
color: <?php echo $aurus_color51 ?>;
}
.setib{
background: <?php echo $aurus_color52 ?>;
}
footer .fa-inverse {
color: <?php echo $aurus_color53 ?>;
}
.setib:hover{
background: <?php echo $aurus_color54 ?>;
}
.footer_mailtext_back{
background: <?php echo $aurus_color55 ?>;
}
.footer_mailtext_back .title-module{
color: <?php echo $aurus_color56 ?>;
}
.btn-send {
background: <?php echo $aurus_color57 ?>;
color: <?php echo $aurus_color58 ?>;
}
.btn-send:hover {
background: <?php echo $aurus_color59 ?>;
color: <?php echo $aurus_color60 ?>;
}
.textdanger, .textsuccess{
color: <?php echo $aurus_color61 ?>;
}
.scup {
background: <?php echo $aurus_color62 ?>;
}
a.scup i {
color: <?php echo $aurus_color63 ?>;
}
a.scup i:hover {
color: <?php echo $aurus_color64 ?>;
}
.circle {
box-shadow: 0 0 8px 20px <?php echo $aurus_color65 ?>;
}
.circleout {
background-color: <?php echo $aurus_color65 ?>;
color: <?php echo $aurus_color66 ?>;
}
.cart_fixed {
background: <?php echo $aurus_color67 ?>;
}
#cart_clone .cart-item {
background: <?php echo $aurus_color68 ?>;
}
#cart_clone .fa-shopping-cart {
color: <?php echo $aurus_color69 ?>;
}
#cart_clone .cart-item {
color: <?php echo $aurus_color70 ?>;
}
.wishlist_fixed, .compare_fixed {
background: <?php echo $aurus_color71 ?>;
}
.item_blright {
background: <?php echo $aurus_color72 ?>;
color: <?php echo $aurus_color74 ?>;
}
#cart_clone .fa-shopping-cart, #wishlist_clone .fa-heart, #compare_clone .fa-exchange {
color: <?php echo $aurus_color73 ?>;
}
.toggle_m i {
color: <?php echo $aurus_color92 ?>;
}
#menu_scroll.sticky {
background: <?php echo $aurus_color77 ?>!important;
}
#menu_scroll #menu .nav > li > a {
color: <?php echo $aurus_color78 ?>!important;
}
#menu_scroll #menu .nav > li > a:hover {
color: <?php echo $aurus_color79 ?>!important;
}
#menu_scroll.sticky {
opacity: <?php echo $aurus_color80 ?>;
}
#menu .dropdown-inner a, .box-category > ul > li a, .dropdown-menu.multi-level > li > a, #menu li .dropdown-submenu a, #menu .dropdown-inner1 a {
color: <?php echo $aurus_color75 ?>;
}
#menu li a:hover, .box-category > ul > li a:hover, #menu li .dropdown-submenu a:hover, .v3hover a:hover, .dropdown-inner1 ul li a:hover {
color: <?php echo $aurus_color76 ?>;
}
.price-old, .prise_clone {
text-decoration-color: <?php echo $aurus_color84 ?>;
}
.menu_mob_plus .nav > li > a, .cart_open_mmenu, .tell_mmenu a, .mail_mmenu a, .address_mmenu, .work_time_mmenu, .cat_mob, .home_mob a, .menu_mob_plus .dropdown-inner a  {
color:<?php echo $aurus_color93 ?>!important;
}
.menu_mob_plus .nav > li > a:hover, .cart_open_mmenu:hover, .tell_mmenu a:hover, .mail_mmenu a:hover, .home_mob a:hover, .menu_mob_plus .dropdown-inner a:hover {
color:<?php echo $aurus_color94 ?>!important;
}
@media (max-width: 991px) {
<?php if ($aurus_right_sm ==1) { ?>
.right_fixed{
display:none;
}
<?php } ?>
}
@media (min-width: 992px) {
<?php if (!empty($aurus_vmenuheight) && $class == 'common-home' ) {?>
#menu_colheight {
min-height: <?php echo $aurus_vmenuheight; ?>px;
}
<?php } ?>
#menu .dropdown-menu {
border-top: 7px solid <?php echo $aurus_color16 ?>;
}
}
.product-thumb .product-name, .product-thumb_cart .product-name {
height: <?php echo $aurus_height_symbolst ?>px;
}
<?php if ($aurus_description_cat ==1) { ?>
.product-grid .description_cat{
display: none;
}
<?php } ?>
<?php if ($aurus_seevmenu_menu !=1) { ?>
@media (min-width: 992px) {
.hidem{
display: none!important;
}
}
<?php } ?>
<?php if ($aurus_arrowup_lr !=1) { ?>
@media (max-width: 991px) {
.scup {
right: 15px;
}
}
@media (min-width: 992px) {
.scup {
right: 14px;
}
}
<?php } else { ?>
@media (max-width: 991px) {
.scup {
left: 20px;
}
}
@media (min-width: 992px) {
.scup {
left: 25px;
}
}
<?php } ?>
<?php if ($aurus_callleftr !=1) { ?>
.container-circle {
right: 30px;
}
<?php } else { ?>
.container-circle {
left: 5px;
}
<?php } ?>
<?php if ($aurus_show_cart ==1) { ?>
.cart, .btn-cart, .mob_cart {
display:none;
}
<?php } ?>
<?php if ($aurus_show_price ==1) { ?>
.price, .line-product, .pull-left1 {
display:none;
}
<?php } ?>
</style>
</head>
<body class="<?php echo $class; ?> <?php if ($aurus_header_var ==3) { ?>header_v3class<?php } ?>">
            <div id="scroll"></div>
            <div class="overlay" style="display: none;"></div>
            <div class="overlay_cart"></div>
            <?php if ($aurus_preloader !=1) { ?>
            <!--preloader-->
            <div id="preloader">
               <i class="fa fa-spinner fa-spin"></i>
            </div>
            <?php } ?>	
            <?php if ($aurus_arrowup !=1) { ?>
            <span class="<?php if ($aurus_arrowup_mobile !=1) { ?> visible-xs visible-sm <?php } ?> visible-md visible-lg"><a href="#" class="scup"><i class="fa fa-angle-up active"></i></a></span>
            <?php } ?>
            <!--col_cart-->
            <div class="right_fixed">
               <?php if ($aurus_cart_right !=1) { ?>
               <div class="cart_fixed cart_openp" <?php if ($aurus_right_tittle !=1) { ?> data-toggle="tooltip" data-placement="left" title="<?php echo $text_cartp; ?>"<?php } ?>>
                  <div id="cart_clone"> 
                     <?php echo $cart2; ?>
                  </div>
               </div>
               <?php } ?>
               <?php if ($aurus_wish_right !=1) { ?>
               <a class="wishlist_fixed" href="<?php echo $wishlist; ?>" <?php if ($aurus_right_tittle !=1) { ?> data-toggle="tooltip" data-placement="left" title="<?php echo $text_wishlistp; ?><?php } ?>">
                  <div id="wishlist_clone"> 
                     <i class="fa fa-heart"></i>
                     <span class="item_blright"><span class="item-after_blright"><span id="wishlist-total2"> <?php echo $text_wishlist; ?></span></span></span>
                  </div>
               </a>
               <?php } ?>
               <?php if ($aurus_comp_right !=1) { ?>
               <a class="compare_fixed" href="<?php echo $compare; ?>" <?php if ($aurus_right_tittle !=1) { ?> data-toggle="tooltip" data-placement="left" title="<?php echo $text_comparep; ?><?php } ?>">
                  <div id="compare_clone"> 
                     <i class="fa fa-exchange"></i>
                     <span class="item_blright"><span class="item-after_blright"><span id="compare-total2"> <?php echo $text_compare; ?></span></span></span>
                  </div>
               </a>
               <?php } ?>
            </div>
            <!--col_cart end-->
            <div id="wishlist" class="modal fade">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     </div>
                     <div class="modal-body flex_ico">
                        <p></p>
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn-cart" data-dismiss="modal"><?php echo $text_continue2; ?></button>
                        <a href="<?php echo $wishlist; ?>" class="btn-cart"><?php echo $text_wishlist2; ?></a>
                     </div>
                  </div>
               </div>
            </div>
            <div id="compare" class="modal fade">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     </div>
                     <div class="modal-body flex_ico">
                        <p></p>
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn-cart" data-dismiss="modal"><?php echo $text_continue2; ?></button>
                        <a href="<?php echo $compare; ?>" class="btn-cart"><?php echo $text_compare2; ?></a>
                     </div>
                  </div>
               </div>
            </div>
            <div class="bantop hidden-xs hidden-sm scaleslide">
               <?php echo $content_topfl; ?>	
            </div>
            <?php if ($aurus_show_topmenu !=1) { ?>	
            <nav id="top">
               <div class="container nobackground">
                  <?php if ($aurus_show_topmenu_set !=1) { ?>
                  <?php echo $currency; ?>
                  <?php echo $language; ?>
                  <?php } ?>
                  <div id="top-links" class="nav pull-right">
                     <ul class="list-inline top">
                        <li>	
                           <a href="#" class="nav-opener pull-right visible-xs visible-sm "><i class="fa fa-bars" aria-hidden="true"></i></a>
                        </li>
                     </ul>
                     <nav id="navt" class="topnav">
                        <ul class="nav-list list-inline text-center hidden-md hidden-lg">
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
                        </ul>
                        <ul class="nav-list list-inline text-center">
                           <?php if ($aurus_show_add_link !=1) { ?>
                           <?php if ($aurus_top_links6 ) { ?>
                           <?php foreach ($aurus_top_links6 as $aurus_top_link6) { ?>
                           <li>
                              <a <?php if ($aurus_top_link6['link_top'][$language_id]) { ?> href="<?php echo $aurus_top_link6['link_top'][$language_id]; ?>"<?php } ?> title="<?php echo $aurus_top_link6['title'][$language_id]; ?>"><?php if ($aurus_top_link6['faicons_top']) { ?> <i class="<?php echo $aurus_top_link6['faicons_top']; ?>"></i><?php } ?><?php if ($aurus_top_link6['title']) { ?> <?php echo $aurus_top_link6['title'][$language_id]; ?><?php } ?></a>
                           </li>
                           <?php } ?>
                           <?php } ?>
                           <?php } ?>
                           <?php if ($aurus_wishlist_top !=1) { ?>
                           <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><i class="fa fa-heart"></i> <?php echo $text_wishlist; ?></a></li>
                           <?php } ?>
                           <?php if ($aurus_compare_top !=1) { ?>
                           <li><a href="<?php echo $compare; ?>" id="compare-total"><i class="fa fa-exchange"></i> <?php echo $text_compare; ?></a></li>
                           <?php } ?>
                        </ul>
                        <ul class="list-inline top visible-md visible-lg">
                           <?php if ($aurus_account_top !=1) { ?>
                           <li class="dropdown dropdown-toggle">
                              <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" data-toggle="dropdown"><i class="fa fa-user"></i> <?php echo $text_account; ?> <i class="fa fa-caret-down"></i></a>
                              <ul class="dropdown-menu dropdown-menu-left">
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
                                 <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                 <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                 <?php } ?>
                              </ul>
                           </li>
                           <?php } ?>
                        </ul>
                     </nav>
                  </div>
               </div>
            </nav>
            <?php } ?>
            <?php if ($aurus_header_var ==2 || $aurus_header_var ==3) { ?>
            <?php include_once ('catalog/view/theme/aurus/template/common/aridus_header_v2.tpl');?>
            <?php } elseif($aurus_header_var == 1) { ?>
            <?php include_once ('catalog/view/theme/aurus/template/common/aridus_header_v1.tpl');?>
            <?php } ?>
<!--for menu dropdown -->
<!--height Vmenu for col left-->
<script><!--
$(function () {
var width_ch = window.innerWidth;
if (width_ch > 991) {
onResize();
}
function onResize(){
var width_ch = window.innerWidth;
if (width_ch > 991) {
<!--height Vmenu for col left-->
<?php if ($class == 'common-home' && $aurus_seevmenu_menu_open !=1 && !$content_fluid && (empty($aurus_vmenuheight)) ) {?>
$('#menu_colheight').css({'min-height': $('#menu_height').outerHeight() });
<?php } ?>
var heighttopmenu = $("#top-menu").height();
$('.top-menu').css({position: 'relative',height: heighttopmenu});
} else {
<!--height Vmenu for col left-->
<?php if ($class == 'common-home' && $aurus_seevmenu_menu_open !=1 && !$content_fluid && (empty($aurus_vmenuheight)) ) {?>
$('#menu_colheight').css({'min-height': 0 });
<?php } ?>
$('.top-menu').css({position: 'relative',height: 'auto'});
}
}
window.addEventListener('resize', onResize);
document.body.addEventListener('resize', onResize);
})
//-->
</script>
<!--scrollUp-->
<?php if ($aurus_arrowup !=1) { ?>
<script><!--
$(document).ready(function() {
$(window).scroll(function(){
if ($(this).scrollTop() > 100) {
$('.scup').fadeIn();
} else {
$('.scup').fadeOut();
}
});
$('.scup').click(function(){
$("html, body").animate({ scrollTop: 0 }, 900);
return false;
});
});
//-->
</script>
<?php } ?>
<!--preloader-->
<?php if ($aurus_preloader !=1) { ?>
<script>
$(window).load(function() {
$('#preloader').find('i').fadeOut().end().delay(400).fadeOut('slow');
});
</script>
<?php } ?>
<script>
$(document).ready(function() {
jQuery('.nav-opener').on( "click", function(e){
e.preventDefault();
jQuery("body").toggleClass("nav-active");
});
});
</script>
<!-- anchors for footer map -->
<?php if ($aurus_show_fluid_map_footer == '0') { ?>
<script>
$(document).ready(function(){
$(".address").on("click","a", function (event) {
event.preventDefault();
var id  = $("#map_yak"),
top = $(id).offset().top;
$('body,html').animate({scrollTop: top}, 1500);
<?php if ($aurus_show_map_open == '1') { ?>
$('#hfooter').animate({
height:270,
opacity: 0.9
}, 1200 );
$('.link_footer').remove();
<?php } ?>
});
});
</script>
<?php } ?>