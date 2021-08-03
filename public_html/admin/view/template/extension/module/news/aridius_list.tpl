<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_news2; ?>" class="btn btn-primary"><i class="fa fa-plus"></i>&nbsp;&nbsp;<?php echo $text_addnews; ?></a>
<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $button_delete; ?>') ? $('#form').submit() : false;"><i class="fa fa-trash-o"></i>&nbsp;&nbsp;<?php echo $text_delnews; ?></button>
<a href="<?php echo $module; ?>" data-toggle="tooltip" title="<?php echo $button_module; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
</div>
<h1><?php echo $heading_title2; ?></h1>
<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	<?php } ?>
</ul>
</div>
</div>
<div class="container-fluid">
<?php if ($error_warning) { ?>
	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>
<?php if ($success) { ?>
	<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_listnews; ?></h3>
</div>
<div class="panel-body">
<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
<div class="table-responsive">
<table class="table table-bordered table-hover">
<thead>
<tr>
<td width="1" align="center"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
<td class="center"><?php echo $column_image; ?></td>
<td class="left"><?php if ($sort == 'nd.title') { ?>
	<a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?> (<?php echo $totalaridius_news; ?>)</a>
	<?php } else { ?>
	<a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?> (<?php echo $totalaridius_news; ?>)</a>
	<?php } ?></td>
<td class="left"><?php if ($sort == 'n.date_added') { ?>
	<a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
	<?php } else { ?>
	<a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
	<?php } ?></td>
<td class="left"><?php if ($sort == 'n.viewed') { ?>
	<a href="<?php echo $sort_viewed; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_viewed; ?>
	<?php } else { ?>
	<a href="<?php echo $sort_viewed; ?>"><?php echo $column_viewed; ?></a>
	<?php } ?></td>
<td class="right"><?php if ($sort == 'n.sort_order') { ?>
	<a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
	<?php } else { ?>
	<a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
	<?php } ?></td>
<td class="left"><?php if ($sort == 'n.status') { ?>
	<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?>
	<?php } else { ?>
	<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
	<?php } ?></td>
<td class="center"><?php echo $column_action; ?></td>
</tr>
</thead>
<tbody>
<?php if ($aridius_news) { ?>
	<?php foreach ($aridius_news as $aridius_news_story) { ?>
		<tr>
		<td align="center">
		<?php if ($aridius_news_story['selected']) { ?>
			<input type="checkbox" name="selected[]" value="<?php echo $aridius_news_story['aridius_news_id']; ?>" checked="checked" />
			<?php } else { ?>
			<input type="checkbox" name="selected[]" value="<?php echo $aridius_news_story['aridius_news_id']; ?>" />
			<?php } ?>
		</td>
		<td class="center"><img src="<?php echo $aridius_news_story['image']; ?>" alt="<?php echo $aridius_news_story['title']; ?>" style="padding:1px; border:1px solid #DCDCDC;" /></td>		
		<td class="text-left"><?php echo $aridius_news_story['title']; ?></td>
		<td class="text-right"><?php echo $aridius_news_story['date_added']; ?></td>
		<td class="text-right"><?php echo $aridius_news_story['viewed']; ?></td>
		<td class="text-right"><?php echo $aridius_news_story['sort_order']; ?></td>
		<td class="text-right"><?php echo $aridius_news_story['status']; ?></td>
		<?php foreach ($aridius_news_story['action'] as $action) { ?>
			<td class="text-right"><a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="<?php echo $button_news3; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
			<?php } ?>             
		</tr>
		<?php } ?>
	<?php } else { ?>
	<tr>
	<td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
	</tr>
	<?php } ?>
</tbody>
</table>
</div>
</form>
<div class="row">
<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
<div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
</div>
</div>
</div>
</div>
<?php echo $footer; ?>