<?php echo $header; ?>
<?php echo $content_fluid; ?>
<?php if ($aurus_banners_fluid !=1) { ?>	
<div class="banfluid col-xs-12 col-sm-12 col-md-9 col-lg-9 "> <?php echo $content_slleft; ?></div>
<div class="banfluid col-xs-6 col-sm-6 col-md-3 col-lg-3  "><?php echo $content_top1; ?></div>
<div class="banfluid col-xs-6 col-sm-6 col-md-3 col-lg-3 "><?php echo $content_top2; ?></div>
<?php } ?>
<div class="container">
   <div class="row">
      <?php echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-5 col-md-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'fix_cleft col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      <?php if ($aurus_banners_fluid ==1) { ?>
      <?php if ($column_left || $column_right) { ?>
      <?php if ($content_top1 || $content_top2) { ?>
      <div class="ban_col hcol-xs-12 col-sm-12 col-md-9 col-lg-6 fixsl"> <?php echo $content_slleft; ?></div>
      <div class="ban_col col-xs-6 col-sm-6 col-md-4 col-lg-3 fixslbann fixsn_ban"><?php echo $content_top1; ?></div>
      <div class="ban_col col-xs-6 col-sm-6 col-md-4 col-lg-3 fixsn_ban"><?php echo $content_top2; ?></div>
      <?php } else { ?>
      <div class="ban_col sm_bann hcol-xs-12 col-sm-9 fixsl"> <?php echo $content_slleft; ?></div>
      <?php } ?>
      <?php } else { ?>
      <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 fixsl"> <?php echo $content_slleft; ?></div>
      <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 fixslbann fixsn_ban2"><?php echo $content_top1; ?></div>
      <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 fixsn_ban2"><?php echo $content_top2; ?></div>
      <?php } ?>
      <?php } ?>
      <div class="clearfix visible-xs "></div>
      <div id="content" class="<?php echo $class; ?>">
         <?php echo $content_top; ?>
         <?php if ($aurus_banners ==1) { ?>
         <div class="row flbann">
            <?php if ($content_bot2) { ?>	
            <div class="<?php if ($aurus_banners_hiddensm ==1) { ?>	hidden-xs <?php } ?> containerfluid2 fluid2 col-xs-12 col-sm-12 col-md-12 col-lg-6 col-lg-push-3"><?php echo $content_bot2; ?></div>
            <?php } ?>
            <?php if ($content_bot1) { ?>	
            <div class="<?php if ($aurus_banners_hiddensm ==1) { ?>	hidden-xs <?php } ?> containerfluid2 fluid2 col-xs-6 col-sm-6 col-md-6 col-lg-3 col-lg-pull-6"><?php echo $content_bot1; ?></div>
            <?php } ?>
            <?php if ($content_bot3) { ?>	
            <div class="<?php if ($aurus_banners_hiddensm ==1) { ?>	hidden-xs <?php } ?> containerfluid2 fluid2 col-xs-6 col-sm-6 col-md-6 col-lg-3"><?php echo $content_bot3; ?></div>
            <?php } ?>
         </div>
         <?php } ?>
         <?php if ($content_slrig2) { ?>
         <?php echo $content_slrig2; ?>
         <?php } ?>
      </div>
      <?php echo $column_right; ?>
   </div>
</div>
<?php if ($content_slrig1) { ?>
<div class="containerfluid1">
   <div class="container">
      <?php echo $content_slrig1; ?>
   </div>
</div>
<?php } ?>
<?php if ($content_bottom) { ?>	
<div class="container">
   <div class="row">
      <div id="content2" class="col-sm-12">
         <?php echo $content_bottom; ?>
      </div>
   </div>
</div>
<?php } ?>
<?php if ($aurus_banners !=1) { ?>	
<div class="container">
   <div class="row flbann containerfluid1">
      <?php if ($content_bot2) { ?>	
      <div class="<?php if ($aurus_banners_hiddensm ==1) { ?>	hidden-xs <?php } ?> containerfluid2 col-xs-12 col-sm-12 col-md-6 col-lg-6 col-lg-push-3"><?php echo $content_bot2; ?></div>
      <?php } ?>
      <?php if ($content_bot1) { ?>	
      <div class="<?php if ($aurus_banners_hiddensm ==1) { ?>	hidden-xs <?php } ?> containerfluid2 col-xs-6 col-sm-6 col-md-3 col-lg-3 col-lg-pull-6"><?php echo $content_bot1; ?></div>
      <?php } ?>
      <?php if ($content_bot3) { ?>	
      <div class="<?php if ($aurus_banners_hiddensm ==1) { ?>	hidden-xs <?php } ?> containerfluid2 col-xs-6 col-sm-6 col-md-3 col-lg-3"><?php echo $content_bot3; ?></div>
      <?php } ?>
   </div>
</div>
<?php } ?>	
<?php echo $footer; ?>
