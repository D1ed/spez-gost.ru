<?php echo $header; ?><?php echo $column_left; ?>
<?php 
foreach ($languages as $language) {
if(!isset($aridius_letters_placeholder[$language['language_id']])) $aridius_letters_placeholder[$language['language_id']]   = "Введите ваш e-mail";
if(!isset($aridius_letters_pl[$language['language_id']])) $aridius_letters_pl[$language['language_id']]                     = "ПОДПИСАТЬСЯ";		
}
?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<a href="<?php echo $aridius_letters2; ?>" data-toggle="tooltip" title="<?php echo $button_send; ?>" class="btn btn-warning"><i class="fa fa-envelope"></i>&nbsp;&nbsp;<?php echo $text_sendletters; ?></a>  
<a href="<?php echo $aridius_letters; ?>" data-toggle="tooltip" title="<?php echo $button_email; ?>" class="btn btn-warning"><i class="fa fa-at"></i>&nbsp;&nbsp;<?php echo $text_seeemail; ?></a>   
<button type="submit" form="form-letters" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $text_saveletters; ?></button>
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
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-letters" class="form-horizontal">


<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_title; ?></label>
<div class="col-sm-10">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="aridius_letters_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aridius_letters_title[$language['language_id']]) ? $aridius_letters_title[$language['language_id']] : ''; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $text_btpl; ?></label>
<div class="col-sm-10">
<?php foreach ($languages as $language) { ?>
	<div class="input-group">
	<span class="input-group-addon">
	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
	</span>
	<input name="aridius_letters_placeholder[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aridius_letters_placeholder[$language['language_id']]) ? $aridius_letters_placeholder[$language['language_id']] : ''; ?>" class="form-control" />
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
	<input name="aridius_letters_pl[<?php echo $language['language_id']; ?>]" value="<?php echo isset($aridius_letters_pl[$language['language_id']]) ? $aridius_letters_pl[$language['language_id']] : ''; ?>" class="form-control" />
	</div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-statusdes"><?php echo $text_adddescription; ?></label>
<div class="col-sm-10">
<select name="aridius_lettersdes_status" id="input-statusdes" class="form-control">
<?php if ($aridius_lettersdes_status) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
</select>
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
	for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
	<div class="col-sm-10">
	<textarea name="aridius_letters_description[<?php echo $language['language_id']; ?>]" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridius_letters_description[$language['language_id']]) ? $aridius_letters_description[$language['language_id']] : ''; ?></textarea>
	</div>
	</div>
	</div>
	<?php } ?>
</div>

<div class="form-group">
<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
<div class="col-sm-10">
<select name="aridius_letters_status" id="input-status" class="form-control">
<?php if ($aridius_letters_status) { ?>
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
	$('#form-letters').append('<input type="hidden" id="apply" name="apply" value="1" />');
	$('#form-letters').submit();
}
//--></script>

<?php if ($ckeditor) { ?>
<script src="view/javascript/ckeditor/ckeditor.js"></script>
<script src="view/javascript/ckeditor/ckeditor_init.js"></script>
<?php } ?>
<script><!--
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script>
<script><!--
$(document).ready(function(){
	$("#myTab2 li:eq(0) a").tab('show');
});
//--></script>
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

<?php echo $footer; ?>