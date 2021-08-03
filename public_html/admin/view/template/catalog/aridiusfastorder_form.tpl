<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<button type="submit" form="form-order" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_module; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
</div>
<div class="panel-body">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-order" class="form-horizontal">
<div class="form-group">
<label class="col-sm-2 control-label" for="input-firstname"><?php echo $text_firstname; ?></label>
<div class="col-sm-10">
<input type="text" name="firstname" value="<?php echo $firstname; ?>"  id="input-firstname" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-contact"><?php echo $text_contact; ?></label>
<div class="col-sm-10">
<input type="text" name="contact" value="<?php echo $contact; ?>"  id="input-contact" class="form-control" />
<?php if ($error_contact) { ?>
	<div class="text-danger"><?php echo $error_contact; ?></div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-email"><?php echo $text_email; ?></label>
<div class="col-sm-10">
<input type="text" name="email" value="<?php echo $email; ?>"  id="input-email" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-comment_manager"><?php echo $text_comment; ?></label>
<div class="col-sm-10">
<textarea class="form-control" name="comment_manager"><?php echo $comment_manager; ?></textarea>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-contact"><?php echo $text_status; ?></label>
<div class="col-sm-10">
<select name="status" class="form-control">
<option value="0"<?php if($status < 1) { echo ' selected="selected"'; } ?>><?php echo $text_wait; ?></option>
<option value="1"<?php if($status == 1) { echo ' selected="selected"'; } ?>><?php echo $text_complete; ?></option>
</select>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
<script><!--
$('#form input').keydown(function (e) {
	if (e.keyCode==13) {
		filter();
	}
});
//--></script>
<script><!--
$('input[name=\'filter_product_name\']').autocomplete({
delay: 500,
source: function(request, response) {
		$.ajax({
url: 'index.php?route=catalog/aridiusfastorder/autocomplete&token=<?php echo $token; ?>&filter_product_name=' +  encodeURIComponent(request.term),
dataType: 'json',
success: function(json) {		
				response($.map(json, function(item) {
					return {
label: item.name,
value: item.product_id
					}
				}));
			}
		});
	}, 
select: function(event, ui) {
		$('input[name=\'filter_product_name\']').val(ui.item.label);
		return false;
	},
focus: function(event, ui) {
		return false;
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