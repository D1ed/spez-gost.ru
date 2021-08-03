<?php if (strlen($description) > $aridius_text_home_limit ) { ?>	
<div class="block_desc2">
<?php echo $description; ?>
</div>
<a class="button_sh2"><?php echo $text_show_desc; ?></a>
<?php } else { ?>
	<div class="col-sm-12 block_desctop">
	<div class="row">
	<?php echo $description; ?>
	</div>
	</div>
<?php } ?>	
<?php if (strlen($description) > $aridius_text_home_limit ) { ?>
<script>
$(document).ready(function(){
$('.button_sh2').click(function(){
$(this).toggleClass('active');
$('.block_desc2').toggleClass('opener2');
if (!$(this).data('status')) {
$(this).data('status', true).html('<?php echo $text_hide_desc; ?>');
} else {
$(this).data('status', false).html('<?php echo $text_show_desc; ?>');
}
});
});
</script>
<?php } ?>	