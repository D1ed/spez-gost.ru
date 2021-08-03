<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<button type="submit" form="form-livesearch" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button>
<a onclick="apply();" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_apply; ?>" ><i class="fa fa-check"></i>&nbsp;&nbsp;<?php echo $button_apply; ?></a> 
<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
</div>
<div class="panel-body">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-livesearch" class="form-horizontal">
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $entry_livesearch_model; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_livesearch_livesearch_model) { ?>
	<input type="radio" name="aridius_livesearch_livesearch_model" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_livesearch_livesearch_model" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_livesearch_livesearch_model) { ?>
	<input type="radio" name="aridius_livesearch_livesearch_model" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_livesearch_livesearch_model" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>		
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $entry_livesearch_description; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_livesearch_description) { ?>
	<input type="radio" name="aridius_livesearch_description" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_livesearch_description" value="0" checked="checked"  />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_livesearch_description) { ?>
	<input type="radio" name="aridius_livesearch_description" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_livesearch_description" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $entry_livesearch_sku; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_livesearch_sku) { ?>
	<input type="radio" name="aridius_livesearch_sku" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_livesearch_sku" value="0" checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_livesearch_sku) { ?>
	<input type="radio" name="aridius_livesearch_sku" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_livesearch_sku" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $entry_livesearch_tag; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_livesearch_tag) { ?>
	<input type="radio" name="aridius_livesearch_tag" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_livesearch_tag" value="0"  checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_livesearch_tag) { ?>
	<input type="radio" name="aridius_livesearch_tag" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_livesearch_tag" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $entry_livesearch_img; ?></label>
<div class="col-sm-10">
<label class="radio-inline">
<?php if ($aridius_livesearch_img) { ?>
	<input type="radio" name="aridius_livesearch_img" value="0" />
	<?php echo $text_yes; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_livesearch_img" value="0"  checked="checked" />
	<?php echo $text_yes; ?>
	<?php } ?>
</label>
<label class="radio-inline">
<?php if (!$aridius_livesearch_img) { ?>
	<input type="radio" name="aridius_livesearch_img" value="1" />
	<?php echo $text_no; ?>
	<?php } else { ?>
	<input type="radio" name="aridius_livesearch_img" value="1" checked="checked" />
	<?php echo $text_no; ?>
	<?php } ?>
</label>
</div>
</div>		
<div class="form-group">
<label class="col-sm-2 control-label" for="input-aridius_livesearch_symbol"><?php echo $entry_livesearch_symbol; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_livesearch_symbol" value="<?php echo $aridius_livesearch_symbol; ?>" placeholder="<?php echo $entry_livesearch_symbol; ?>" id="input-aridius_livesearch_symbol" class="form-control" />
<?php if ($error_aridius_livesearch_symbol) { ?>
	<div class="text-danger"><?php echo $error_aridius_livesearch_symbol; ?></div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-aridius_livesearch_limit"><?php echo $entry_aridius_livesearch_limit; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_livesearch_limit" value="<?php echo $aridius_livesearch_limit; ?>" placeholder="<?php echo $entry_aridius_livesearch_limit; ?>" id="input-aridius_livesearch_limit" class="form-control" />
<?php if ($error_aridius_livesearch_limit) { ?>
	<div class="text-danger"><?php echo $error_aridius_livesearch_limit; ?></div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-aridius_livesearch_width"><?php echo $entry_aridius_livesearch_width; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_livesearch_width" value="<?php echo $aridius_livesearch_width; ?>" placeholder="<?php echo $entry_aridius_livesearch_width; ?>" id="input-aridius_livesearch_width" class="form-control" />
<?php if ($error_aridius_livesearch_width) { ?>
	<div class="text-danger"><?php echo $error_aridius_livesearch_width; ?></div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-height"><?php echo $entry_aridius_livesearch_height; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_livesearch_height" value="<?php echo $aridius_livesearch_height; ?>" placeholder="<?php echo $entry_aridius_livesearch_height; ?>" id="input-aridius_livesearch_height" class="form-control" />
<?php if ($error_aridius_livesearch_height) { ?>
	<div class="text-danger"><?php echo $error_aridius_livesearch_height; ?></div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
<div class="col-sm-10">
<select name="aridius_livesearch_status" id="input-status" class="form-control">
<?php if ($aridius_livesearch_status) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
</select>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
<script><!--
function apply() {
	$('#form-livesearch').append('<input type="hidden" id="apply" name="apply" value="1" />');
	$('#form-livesearch').submit();
}
//--></script>
<?php echo $footer; ?>