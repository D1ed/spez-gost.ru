<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<button type="submit" form="form-aridius_popuptext" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-aridius_popuptext" class="form-horizontal">
<div class="form-group">
<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
<div class="col-sm-10">
<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
<?php if ($error_name) { ?>
	<div class="text-danger"><?php echo $error_name; ?></div>
	<?php } ?>
</div>
</div>
<ul class="nav nav-tabs" id="language">
<?php foreach ($languages as $language) { ?>
	<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
	<?php } ?>
</ul>
<div class="tab-content">
<?php foreach ($languages as $language) { ?>
	<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
	<div class="form-group">
	<label class="col-sm-2 control-label"
	for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description_top; ?></label>
	<div class="col-sm-10">

	<textarea name="aridius_popuptext_description[<?php echo $language['language_id']; ?>]" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridius_popuptext_description[$language['language_id']]) ? $aridius_popuptext_description[$language['language_id']] : ''; ?></textarea>
	</div>
	</div>
	</div>
	<?php } ?>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-popuptext_time"><?php echo $text_time; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_popuptext_time" value="<?php echo $aridius_popuptext_time; ?>" id="input-popuptext_time" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-popuptext_delay"><?php echo $text_delay; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_popuptext_delay" value="<?php echo $aridius_popuptext_delay; ?>" id="input-popuptext_delay" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $text_day;?></label>
<div class="col-sm-10">
<select name="aridius_popuptext_day" class="form-control">
<option value="0"<?php if($aridius_popuptext_day < 1) { echo ' selected="selected"'; } ?>><?php echo $all_day;?></option>
<option value="2"<?php if($aridius_popuptext_day == 2) { echo ' selected="selected"'; } ?>><?php echo $working_day;?></option>
<option value="3"<?php if($aridius_popuptext_day == 3) { echo ' selected="selected"'; } ?>><?php echo $weekend_day;?></option>
</select>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
<div class="col-sm-10">
<select name="status" id="input-status" class="form-control">
<?php if ($status) { ?>
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
<?php if (!$ckeditor) { ?>
  <script src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script src="view/javascript/summernote/opencart.js"></script>
<?php } ?>
<script><!--
        <?php foreach ($languages as $language) { ?>
        <?php if ($ckeditor) { ?>
                ckeditorInit('input-description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
            <?php } ?>
        <?php } ?>
//--></script>
<script><!--
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script>
<?php echo $footer; ?>