<div class="title-module"><?php echo $heading_title; ?></div>
<?php if ($variant != '1') { ?>
<div id="catwall_carusel" class="swiper-container">
   <div class="swiper-wrapper">
      <?php foreach ($categories as $category) { ?>
      <div class="swiper-slide">
         <div class="product-layoutwa_v2">
            <?php if ($add_img == '1') { ?>	
            <div class="product-thumb_v2">
               <div class="image_v2"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a></div>
            </div>
            <?php } ?>
            <div class="namelink_v2">
               <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
            </div>
         </div>
      </div>
      <?php } ?>
   </div>
   <div class="#catwall_carusel swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
   <div class="#catwall_carusel swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
</div>
<script><!--
   $(document).ready(function () {
   var ocSwiper = new Swiper('#catwall_carusel.swiper-container', {
   slidesPerView: <?php echo $slides4; ?>,
   	 spaceBetween: 15,
   	pagination: false,
    autoplay: false,
   		  breakpoints: {
       768: {
         slidesPerView: <?php echo $slides1; ?>,
        },
       992: {
         slidesPerView: <?php echo $slides2; ?>,
           },
       1200: {
         slidesPerView: <?php echo $slides3; ?>,
        },
   	     1600: {
         slidesPerView: <?php echo $slides4; ?>,
        }
     },
       navigation: {
           nextEl: '#catwall_carusel .swiper-button-next',
           prevEl: '#catwall_carusel .swiper-button-prev',
       },
   });
   });
   -->
</script>
<?php } else { ?>
<div class="row catwall">
   <?php foreach ($categories as $category) { ?>
   <div class="catb col-lg-<?php echo $col_lg; ?> col-md-<?php echo $col_md; ?> col-sm-<?php echo $col_sm; ?> col-xs-<?php echo $col_xs; ?>">
      <div class="product-layoutwall2">
         <div class="namelink">
            <div class="product-name"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
         </div>
         <?php if ($add_img == '1') { ?>			
         <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a></div>
         </div>
         <?php } ?>
         <?php if ($child_visible) { ?>
         <?php if ($category['children']) { ?>
         <ul class="list-unstyled rightwallchild">
            <?php foreach ($category['children'] as $child) { ?>
            <li><a href="<?php echo $child['href']; ?>"><i class="fa fa-angle-right" aria-hidden="true"></i>&nbsp;<?php echo $child['name']; ?></a></li>
            <?php } ?>
            <li><span><a href="<?php echo $category['href']; ?>"><?php echo $Seeall; ?></a></span></li>
         </ul>
         <?php } ?>
         <?php } ?>		 
      </div>
   </div>
   <?php } ?>
</div>
<?php } ?>
