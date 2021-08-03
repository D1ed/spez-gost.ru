<div class="pagcolor">
<div id="slideshow<?php echo $module; ?>" class="swiper-container">
<div class="swiper-wrapper">
<?php foreach ($banners as $banner) { ?>
<div class="item swiper-slide">
<div class="visible-sm visible-md visible-lg"><?php echo htmlspecialchars_decode($banner['description']);?></div>
<?php if ($banner['link']) { ?>
<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive scaleslide" /></a>
<?php } else { ?>
<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive scaleslide" />
<?php } ?>
</div>
<?php } ?>
</div>
<div class="swiper-pager">
<div class="#slideshow<?php echo $module; ?> swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
<div class="#slideshow<?php echo $module; ?> swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
</div>
<div class="#slideshow<?php echo $module; ?> swiper-pagination"></div>
</div>
</div>
<script>
$(document).ready(function () {
var SlideSwiper = new Swiper ('#slideshow<?php echo $module; ?>.swiper-container', {
slidesPerView: 1,
mode: 'horizontal',
<?php if ($transitionStyle != '0') { ?> effect: <?php if ($transitionStyle == '1') { ?>"fade",<?php } ?><?php if ($transitionStyle == '2') { ?>"coverflow",<?php } ?><?php if ($transitionStyle == '3') { ?>"cube",<?php } ?> <?php } ?>
loop: true,
autoplay: { delay: 5000, },
autoplayDisableOnInteraction: true,
navigation: {
nextEl: '#slideshow<?php echo $module; ?> .swiper-button-next',
prevEl: '#slideshow<?php echo $module; ?> .swiper-button-prev',
},
paginationClickable: true,
pagination: {
el: '#slideshow<?php echo $module; ?> .swiper-pagination',
clickable: true,
},
});
SlideSwiper.on('transitionStart', function () {
for(let i = 1; i <= 4; i++) {
$('.swiper-slide').find('.text-slider' + + i).removeClass('ef-slider' + i);
$('.swiper-slide.swiper-slide-active').find('.text-slider' + i).addClass('ef-slider' + i);
}
});
$("#slideshow<?php echo $module; ?>.swiper-container").hover(function() {
SlideSwiper.autoplay.stop();
}, function() {
SlideSwiper.autoplay.start();
});
});
</script>