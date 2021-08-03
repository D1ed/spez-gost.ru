<?php if ($aridius_icons_top_links ) { ?>
<div class = "ico_wall">
<?php foreach ($aridius_icons_top_links as $key => $aridius_icons_top_link) { ?>
<?php if ($aridius_icons_colico == 1) { ?>
<div class = "block_ico col-xs-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
<?php } else { ?>
<div class = "block_ico col-xs-4 col-sm-4 col-md-4 col-lg-2 col-xl-2">
<?php } ?>
<?php if ($aridius_icons_popup ==1) { ?>
<a href="#text-popup<?php echo $key ?>" class="popup-ico<?php echo $key ?>"><i class="<?php echo $aridius_icons_top_link['faicons_icons']; ?>"></i>
<span class = "ico_sz"><?php echo $aridius_icons_top_link['title'][$language_id]; ?></span>
</a>
<?php } elseif ($aridius_icons_link == 1) { ?>
<a href="<?php echo $aridius_icons_top_link['add_link']; ?>" target="_blank" class="popup-ico<?php echo $key ?>"><i class="<?php echo $aridius_icons_top_link['faicons_icons']; ?>"></i>
<span class = "ico_sz"><?php echo $aridius_icons_top_link['title'][$language_id]; ?></span>
</a>
<?php } else { ?>
<span class="popup-ico<?php echo $key ?>"><i class="<?php echo $aridius_icons_top_link['faicons_icons']; ?>"></i>
<span class = "ico_sz"><?php echo $aridius_icons_top_link['title'][$language_id]; ?></span>
</span>
<?php } ?>
<?php if ($aridius_icons_popup ==1) { ?>
<div id="text-popup<?php echo $key ?>" class="white-popup mfp-hide">
<?php echo html_entity_decode($aridius_icons_top_link['description'][$language_id]); ?>
</div>
<?php } ?>
</div>
<?php if ($aridius_icons_popup ==1) { ?>
<script>
$(document).ready(function() {
    $('.popup-ico<?php echo $key ?>').magnificPopup({
        type: 'inline'
    });
});
</script>
<?php } ?>
<?php } ?>
</div>
<?php } ?>
<div class="clearfix"></div>
<script>
   //Active Tab
   $(document).ready(function() {
   $(".block_ico:last").addClass("block_icolast");
   });
</script>