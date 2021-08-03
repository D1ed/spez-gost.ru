<div class="title-module"><?php echo $heading_title; ?></div>
<div id="rev_carusel<?php echo $module; ?>" class="swiper-container">
   <div class="swiper-wrapper">
      <?php foreach ($products as $product) { ?>
      <div class="swiper-slide product-layout2">
         <div class="product-thumb fixth transition">
            <div class="img_left image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
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
               <p><?php echo $product['text']; ?></p>
               <?php if ($rat) { ?>
               <div class=" pr rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
               </div>
               <?php } ?>
               <div class="cart">
                  <a class="btn btn-more btn-lg" href="<?php echo $product['href']; ?>" role="button"><?php echo $button_more; ?></a>
               </div>
            </div>
         </div>
      </div>
      <?php } ?>
   </div>
   <?php if ($navigation) { ?>
   <div class="#rev_carusel<?php echo $module; ?> swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
   <div class="#rev_carusel<?php echo $module; ?> swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
   <?php } ?>
</div>
<script><!--
   $(document).ready(function () {
   var ocSwiper = new Swiper('#rev_carusel<?php echo $module; ?>.swiper-container', {
   <?php if ($colleft != 1 ) { ?>
   slidesPerView: <?php echo $items; ?>,
   <?php } else { ?>
   slidesPerView:1,
   <?php } ?>
   mode: 'horizontal',
   pagination: false,
   speed: <?php echo $pag_speed; ?>,
   <?php if ($autoplay_on) { ?>
   autoplay: {delay: <?php echo $autoplay; ?>},
   autoplayDisableOnInteraction: true,
   <?php } ?>
   <?php if ($colleft != 1 ) { ?>
   breakpoints: {
   768: {
   slidesPerView: 1,
   },
   992: {
   slidesPerView: 2,
   },
   1200: {
   slidesPerView: 2,
   },
   1600: {
   slidesPerView: 2,
   }
   },
   <?php } ?>
   <?php if ($navigation) { ?>
   navigation: {
   nextEl: '#rev_carusel<?php echo $module; ?> .swiper-button-next',
   prevEl: '#rev_carusel<?php echo $module; ?> .swiper-button-prev',
   },
   <?php } ?>
   });
   <?php if ($stophover && $autoplay_on) { ?>
   $("#rev_carusel<?php echo $module; ?>.swiper-container").hover(function() {
   ocSwiper.autoplay.stop();
   }, function() {
   ocSwiper.autoplay.start();
   });
   <?php } ?>
   });
   -->
</script>
