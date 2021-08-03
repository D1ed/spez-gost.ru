<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<a href="<?php echo $aridius_letters2; ?>" data-toggle="tooltip" title="<?php echo $button_send; ?>" class="btn btn-default"><i class="fa fa-envelope"></i></a>  
<button type="button" data-toggle="tooltip" title="<?php echo $button_dell; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-newsdelete').submit() : false;"><i class="fa fa-trash-o"></i></button>
<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
</div>
<h1><?php echo $heading_title; ?></h1>
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
<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
</div>
<div class="panel-body">
<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-newsdelete">	 
<div class="well">
<div class="row">
<div class="col-sm-4">
<div class="form-group">
<label class="control-label" for="input-email-id"><?php echo $text_id; ?></label>
<input type="text" name="filter_email_id" value="<?php echo $filter_email_id; ?>" id="input-email-id" class="form-control" />
</div>
</div>
<div class="col-sm-4">
<div class="form-group">
<label class="control-label" for="input-email-user"><?php echo $text_email; ?></label>
<input type="text" name="filter_email_user" value="<?php echo $filter_email_user; ?>" id="input-email-user" class="form-control" />
</div>
</div>
<div class="col-sm-4">             
<div class="form-group">
<label class="control-label" for="input-email-date"><?php echo $text_date; ?></label>
<div class="input-group date">
<input type="text" name="filter_email_date" value="<?php echo $filter_email_date; ?>" data-date-format="YYYY-MM-DD" id="input-email-date" class="form-control" />
<span class="input-group-btn">
<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
</span></div>
</div>
</div>
<div class="col-sm-12">
<button onclick="filter();" type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $text_filter; ?></button>
</div>	  
</div> 
</div>	 	   
<div class="table-responsive">
<table class="table table-bordered table-hover">
<thead>
<tr>
<td style="width: 1px;" class="text-left">
<input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
</td>
<td class="text-left"><?php echo $text_id; ?></td>
<td class="text-left"><?php echo $text_email; ?></td>
<td class="text-left"><?php echo $text_date; ?></td>
</tr>
</thead>
<tbody>
<?php foreach($letters as $letter) { ?>
	<tr>
	<td><?php if (in_array($letter['email_id'], $selected)) { ?>
		<input type="checkbox" name="selected[]" value="<?php echo $letter['email_id']; ?>" checked="checked" />
		<?php } else { ?>
		<input type="checkbox" name="selected[]" value="<?php echo $letter['email_id']; ?>" />
		<?php } ?></td>
	<td class="text-left"><?php echo $letter['email_id']; ?></td>
	<td class="text-left"><?php echo $letter['email_user']; ?></td>
	<td class="text-left"><?php echo $letter['email_date']; ?></td>
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
<script><!--
function filter() {
	url = 'index.php?route=common/aridius_letters&token=<?php echo $token; ?>';
	var filter_email_id = $('input[name=\'filter_email_id\']').val();
	if (filter_email_id) {
		url += '&filter_email_id='+encodeURIComponent(filter_email_id);
	}
	var filter_email_user = $('input[name=\'filter_email_user\']').val();
	if (filter_email_user) {
		url += '&filter_email_user='+encodeURIComponent(filter_email_user);
	}
	var filter_email_date = $('input[name=\'filter_email_date\']').val();
	if (filter_email_date) {
		url += '&filter_email_date=' + encodeURIComponent(filter_email_date);
	}
	location = url;
}
//--></script>
<script><!--
$('#form input').keydown(function (e) {
	if (e.keyCode==13) {
		filter();
	}
});
//--></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<script><!--
$('.date').datetimepicker({
pickTime: false
});
//--></script>
<?php echo $footer; ?>