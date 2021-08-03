<?php echo $header; ?>
<div class="container" >
<div class="row">
<div id="cont" class="col-sm-12">
<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-9'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
<div id="content" class="<?php echo $class; ?>">
<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
	<li><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { ?><?php echo $breadcrumb['text']; ?><?php } ?></li>
	<?php } ?>
</ul>
<?php echo $content_top; ?>
<?php echo html_entity_decode($aridius_faq_description[$language_id]); ?>
			<br />
<div class="panel-group" id="accordion_faqm" role="tablist" aria-multiselectable="true">
<?php if ($aridius_faq_top_links ) { ?>
	<?php foreach ($aridius_faq_top_links as $key => $aridius_faq_top_link) { ?>
		<div class="panel panel-default">
		<div class="panel-heading" role="tab" id="tabfaq-<?php echo $key ?>">
		<h4 class="panel-title">
		<a role="button" data-toggle="collapse" data-parent="#accordion_faqm" href="#collapsetab-<?php echo $key ?>" aria-expanded="true" aria-controls="collapsetab-<?php echo $key ?>">
		<i class="more-less glyphicon glyphicon-plus"></i>
		<?php if ($aridius_faq_top_link['faicons_faq']) { ?> <i class="<?php echo $aridius_faq_top_link['faicons_faq']; ?>"></i><?php } ?> <?php echo $aridius_faq_top_link['title'][$language_id]; ?>
		</a>
		</h4>
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
<?php echo html_entity_decode($aridius_faq_description2[$language_id]); ?>
<?php echo $content_bottom; ?>
</div>
</div>
<?php echo $column_right; ?>
</div>
</div>
<span class="for-block-contacts">
<?php echo $footer; ?>
</span>
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