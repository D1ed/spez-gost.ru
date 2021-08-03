
<div class="title-module"><?php echo $heading_title; ?></div>
<div class="panel-group" id="accordion_faql" role="tablist" aria-multiselectable="true">
<?php if ($aridius_faq_top_links ) { ?>
	<?php foreach ($aridius_faq_top_links as $key => $aridius_faq_top_link) { ?>
		<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="tabfaq-<?php echo $key ?>">
			<div class="panel-title">
		<a role="button" data-toggle="collapse" data-parent="#accordion_faql" href="#collapsetab-<?php echo $key ?>" aria-expanded="true" aria-controls="collapsetab-<?php echo $key ?>">
		<i class="more-less glyphicon glyphicon-plus"></i>
		<?php if ($aridius_faq_top_link['faicons_faq']) { ?> <i class="<?php echo $aridius_faq_top_link['faicons_faq']; ?>"></i><?php } ?> <?php echo $aridius_faq_top_link['title'][$language_id]; ?>
		</a>
	</div>
		</div>
		<div id="collapsetab-<?php echo $key ?>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="tabfaq-<?php echo $key ?>">
		<div class="panel-body">
		<?php echo html_entity_decode($aridius_faq_top_link['description'][$language_id]); ?>
		</div>
		</div>
		</div>
		<?php } ?>
	<?php } ?>
</div>
<script>
function toggleIcon(e) {
	$(e.target)
	.prev('.panel-heading')
	.find(".more-less")
	.toggleClass('glyphicon-plus glyphicon-minus');
}
$('.panel-group').on('hidden.bs.collapse', toggleIcon);
$('.panel-group').on('shown.bs.collapse', toggleIcon);
</script>