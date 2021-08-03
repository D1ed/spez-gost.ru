<?php echo $header; ?><?php echo $column_left; ?>
<?php 
foreach ($languages as $language) {
if(!isset($aridius_popupmail_placeholder[$language['language_id']])) $aridius_popupmail_placeholder[$language['language_id']]   = "Введите ваш e-mail";
if(!isset($aridius_popupmail_pl[$language['language_id']])) $aridius_popupmail_pl[$language['language_id']]                     = "ПОДПИСАТЬСЯ";		
if(!isset($aridius_popupmail_subject[$language['language_id']])) $aridius_popupmail_subject[$language['language_id']]           = "Вам скидка!";
if(!isset($aridius_popupmail_message[$language['language_id']])) $aridius_popupmail_message[$language['language_id']]           = "Ваш купон на скидку ....!";
if(!isset($aridius_popupmail_img[$language['language_id']])) $aridius_popupmail_img[$language['language_id']]                   = '<img class="img-responsive" src="/image/catalog/img_mail/img_mail.png" alt="mail">';
}
if(!isset($aridius_popupmail_time)) $aridius_popupmail_time      = "1";
if(!isset($aridius_popupmail_delay)) $aridius_popupmail_delay    = "2";
?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<button type="submit" form="form-aridius_popupmail" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-aridius_popupmail" class="form-horizontal">
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_btpl; ?></label>
<div class="col-sm-10">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="aridius_popupmail_placeholder[<?php echo $language['language_id']; ?>]" value="<?php echo $aridius_popupmail_placeholder[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_bt; ?></label>
<div class="col-sm-10">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="aridius_popupmail_pl[<?php echo $language['language_id']; ?>]" value="<?php echo $aridius_popupmail_pl[$language['language_id']]; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_mail_subject; ?></label>
<div class="col-sm-10">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="aridius_popupmail_subject[<?php echo $language['language_id']; ?>]" value="<?php echo $aridius_popupmail_subject[$language['language_id']]; ?>" class="form-control" />
	</div>
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
	for="input-message<?php echo $language['language_id']; ?>"><?php echo $text_mail_message; ?></label>
	<div class="col-sm-10">
	<textarea name="aridius_popupmail_message[<?php echo $language['language_id']; ?>]" id="input-message<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridius_popupmail_message[$language['language_id']]) ? $aridius_popupmail_message[$language['language_id']] : ''; ?></textarea>
	</div>
	</div>
	<div class="form-group">
	<label class="col-sm-2 control-label"
	for="input-img<?php echo $language['language_id']; ?>"><?php echo $text_mail_img; ?></label>
	<div class="col-sm-10">

	<textarea name="aridius_popupmail_img[<?php echo $language['language_id']; ?>]" id="input-img<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridius_popupmail_img[$language['language_id']]) ? $aridius_popupmail_img[$language['language_id']] : ''; ?></textarea>
	</div>
	</div>
	<div class="form-group">
	<label class="col-sm-2 control-label"
	for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
	<div class="col-sm-10">
	<textarea name="aridius_popupmail_description[<?php echo $language['language_id']; ?>]" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridius_popupmail_description[$language['language_id']]) ? $aridius_popupmail_description[$language['language_id']] : ''; ?></textarea>
	</div>
	</div>
	</div>
	<?php } ?>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-statusdes"><?php echo $text_adddescription; ?></label>
<div class="col-sm-10">
<select name="aridius_popupmaildes_status" id="input-statusdes" class="form-control">
<?php if ($aridius_popupmaildes_status) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
</select>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-popupmail_time"><?php echo $text_time; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_popupmail_time" value="<?php echo $aridius_popupmail_time; ?>" id="input-popupmail_time" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-popupmail_delay"><?php echo $text_delay; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_popupmail_delay" value="<?php echo $aridius_popupmail_delay; ?>" id="input-popupmail_delay" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" ><?php echo $text_day;?></label>
<div class="col-sm-10">
<select name="aridius_popupmail_day" class="form-control">
<option value="0"<?php if($aridius_popupmail_day < 1) { echo ' selected="selected"'; } ?>><?php echo $all_day;?></option>
<option value="2"<?php if($aridius_popupmail_day == 2) { echo ' selected="selected"'; } ?>><?php echo $working_day;?></option>
<option value="3"<?php if($aridius_popupmail_day == 3) { echo ' selected="selected"'; } ?>><?php echo $weekend_day;?></option>
</select>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-aridius_popupmail_status"><?php echo $entry_status; ?></label>
<div class="col-sm-10">
<select name="aridius_popupmail_status" id="input-aridius_popupmail_status" class="form-control">
<?php if ($aridius_popupmail_status) { ?>
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
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script>
<?php if (!$ckeditor) { ?>
  <script src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script src="view/javascript/summernote/opencart.js"></script>
<?php } ?>
<script><!--
        <?php foreach ($languages as $language) { ?>
        <?php if ($ckeditor) { ?>
                ckeditorInit('input-message<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
            <?php } ?>
        <?php } ?>
//--></script>
<script><!--
        <?php foreach ($languages as $language) { ?>
        <?php if ($ckeditor) { ?>
                ckeditorInit('input-img<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
            <?php } ?>
        <?php } ?>
//--></script>
<script><!--
<?php foreach ($languages as $language) { ?>
<?php if ($ckeditor) { ?>
ckeditorInit('input-description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
<?php } ?>
<?php } ?>
//--></script>
<?php echo $footer; ?>