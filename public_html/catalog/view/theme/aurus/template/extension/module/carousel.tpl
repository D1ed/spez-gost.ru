<div id="carousel<?php echo $module; ?>" class="swiper-container">
<div class="swiper-wrapper">
  <?php foreach ($banners as $banner) { ?>
  <div class="item swiper-slide">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<div class="swiper-pager">
<div class="#carousel<?php echo $module; ?> swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
<div class="#carousel<?php echo $module; ?> swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
</div>
</div>
<script>
$(document).ready(function () {
var CarouselSwiper = new Swiper ('#carousel<?php echo $module; ?>.swiper-container', {
 slidesPerView: 9,
 mode: 'horizontal', 
 autoplay: { delay: 5000, },
 autoplayDisableOnInteraction: true, 
 	  breakpoints: {
    768: {
      slidesPerView: 3,
     },
    992: {
      slidesPerView: 5,
        },
    1200: {
      slidesPerView: 7,
     },
	     1600: {
      slidesPerView: 9,
     }
  },
 navigation: { 
        nextEl: '#carousel<?php echo $module; ?> .swiper-button-next',
        prevEl: '#carousel<?php echo $module; ?> .swiper-button-prev',
 }, 
});
$("#carousel<?php echo $module; ?>.swiper-container").hover(function() {
    CarouselSwiper.autoplay.stop();
}, function() {
    CarouselSwiper.autoplay.start();
});
});
</script>