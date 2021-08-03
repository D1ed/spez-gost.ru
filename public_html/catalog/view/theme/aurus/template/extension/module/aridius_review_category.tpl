<div class="<?php if ($colleft == 1 ) { ?>colleft<?php } ?> grouph">
   <div class="title_h title_center title-module" style="display: inline;"><?php echo $heading_title; ?></div>
   <?php if ($colleft != 1 ) { ?>
   <div class="buttonsaridius_news">
      <div class="pull-right"><a href="<?php echo $aridius_rewlist; ?>"><?php echo $buttonlist_rew; ?></a></div>
   </div>
   <?php } ?>
</div>
<div class="avr">
   <?php echo $text_avr; ?>
</div>
<div class="avr_rating">
<?php echo round($rating_avr, 1);?>
</div>
<?php echo $text_avr3; ?>
<div class="avr_rating">
&nbsp;5
</div>
<div class="avr_sum">
   <?php echo $text_sum; ?> <a class ="colorhr" href="index.php?route=extension/module/aridius_store_review"><?php echo $review_total; ?></a>
</div>
<div id="review_carusel" class="swiper-container">
   <div class="swiper-wrapper">
      <?php foreach ($reviews as $review) { ?>
      <div class="swiper-slide">
         <div class="<?php if ($colleft == 1 ) { ?>colleft<?php } ?> review-thumb transition">
            <div class="rev_author">
               <?php echo $review['author']; ?>
            </div>
            <div class="rev_rating">
               <input type="hidden" class="rating" data-readonly value="<?php echo $review['rating']; ?>"/>
            </div>
            <div class="rev_text">
               <?php echo $review['text']; ?>
            </div>
            <?php if ($date) { ?>
            <div class="rev_date">
               <i class="fa fa-clock-o"></i> <?php echo $review['date_added']; ?>
            </div>
            <?php } ?>
         </div>
      </div>
      <?php } ?>
   </div>
   <?php if ($navigation) { ?>
   <div class="#review_carusel swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
   <div class="#review_carusel swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
   <?php } ?>
</div>
<?php if ($colleft == 1 ) { ?>
<br />
<a href="<?php echo $aridius_rewlist; ?>" class="buttonsall_news btn-primary"><?php echo $buttonlist_rew; ?></a>
<?php } ?>
<div class="clearfix"></div>
<script src="catalog/view/theme/aurus/js/bootstrap_rating/bootstrap-rating.js"></script>
<script><!--
   $(document).ready(function () {
   var ocSwiper = new Swiper('#review_carusel.swiper-container', {
   <?php if ($colleft != 1 ) { ?>
   slidesPerView: <?php echo $items; ?>,
   <?php } else { ?>
   slidesPerView:1,
   <?php } ?>
   mode: 'horizontal',
   pagination: false,
   speed: <?php echo $rew_speed; ?>,
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
   nextEl: '#review_carusel .swiper-button-next',
   prevEl: '#review_carusel .swiper-button-prev',
   },
   <?php } ?>
   });
   <?php if ($stophover && $autoplay_on) { ?>
   $("#review_carusel.swiper-container").hover(function() {
   ocSwiper.autoplay.stop();
   }, function() {
   ocSwiper.autoplay.start();
   });
   <?php } ?>
   });
   -->
</script>
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
