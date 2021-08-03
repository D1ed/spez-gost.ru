<div class="groupcat">
   <div class="title-module" style="display:inline;" ><?php echo $heading_title; ?></div>
</div>
<div class="row">
   <?php foreach ($news as $new) { ?>
   <div class="product-layoutnews col-lg-3 col-md-3 col-sm-6 col-xs-12">
      <div class="news-thumb transition ">
         <div class="image"><a href="<?php echo $new['href']; ?>"><img src="<?php echo $new['thumb']; ?>" alt="<?php echo $new['title']; ?>" title="<?php echo $new['title']; ?>" class="img-responsive" /></a></div>
         <div class="clearfix visible-sm"></div>
         <div class="caption">
            <?php if ($new['aridius_news_id'] == $aridius_news_id) { ?>
            <div class="product-name"><a href="<?php echo $new['href']; ?>" class="active"><?php echo $new['title']; ?></a></div>
            <?php } else { ?>
            <div class="product-name"><a href="<?php echo $new['href']; ?>"><?php echo $new['title']; ?></a></div>
            <?php } ?>
            <?php if (!$aridius_news_show_date) { ?>			
            <span class="posted-aridius_news"><i class="fa fa-clock-o"></i> <?php echo $new['posted']; ?></span>
            <?php } ?>	
         </div>
      </div>
   </div>
   <?php } ?>
</div>
<?php if ($showbutton) { ?>      
<a href="<?php echo $aridius_newslist; ?>" class="buttonsall_news btn-primary"><?php echo $text_all_news; ?></a>
<?php } ?>
