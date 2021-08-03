<?php if ($aridius_news) { ?>
<div class="grouph">
   <div class="title-module" style="display: inline;"><?php echo $heading_title; ?></div>
   <div class="buttonsaridius_news">
      <div class="pull-right"><a href="<?php echo $aridius_newslist; ?>"><?php echo $buttonlist; ?></a></div>
   </div>
</div>
<div id="news_carusel" class="swiper-container">
   <div class="swiper-wrapper">
      <?php foreach ($aridius_news as $aridius_news_story) { ?>	
      <div class="swiper-slide">
   
            <div class="col-lg-7">
               <?php if ($aridius_news_story['image'] && !$aridius_news_show_img) { ?>	
               <div class="grid-aridius_news">
                  <a href="<?php echo $aridius_news_story['href']; ?>" title="<?php echo $aridius_news_story['title']; ?>"><img class="img-responsive aridius_news-hover" src="<?php echo $aridius_news_story['image']; ?>" alt="<?php echo $aridius_news_story['title']; ?>" /></a>				
               </div>
               <?php } ?>	
            </div>
            <div class="col-lg-5 box-news">
               <div class="item-title">
                  <div class="product-namenews"><a href="<?php echo $aridius_news_story['href']; ?>"><?php echo $aridius_news_story['title']; ?></a></div>
               </div>
               <?php if (!$aridius_news_show_description) { ?>
               <div class="description-aridius_news">
                  <p><?php echo $aridius_news_story['description']; ?></p>
               </div>
               <?php } ?>	
               <p class="btn_readmore"> <a href="<?php echo $aridius_news_story['href']; ?>"> <?php echo $text_more; ?></a> </p>
               <?php if (!$aridius_news_show_date) { ?>			
               <p> <i class="fa fa-clock-o"></i> <span class="posted-aridius_news"><?php echo $aridius_news_story['posted']; ?></span></p>
               <?php } ?>	
            </div>
     
      </div>
      <?php } ?>			
   </div>
   <div class="#news_carusel swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
   <div class="#news_carusel swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
</div>
<br>
<script><!--
   $(document).ready(function () {
   var ocSwiper = new Swiper('#news_carusel.swiper-container', {
   slidesPerView: 2,
   	pagination: false,
    autoplay: false,
       navigation: {
           nextEl: '#news_carusel .swiper-button-next',
           prevEl: '#news_carusel .swiper-button-prev',
       },
   });
   });
   -->
</script>
<?php } ?>
