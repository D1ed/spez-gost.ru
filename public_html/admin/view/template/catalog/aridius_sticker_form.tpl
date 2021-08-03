<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-sticker" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-sticker" class="form-horizontal">
		  <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="aridius_sticker_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($aridius_sticker_description[$language['language_id']]) ? $aridius_sticker_description[$language['language_id']]['name'] : ''; ?>" class="form-control" />
              </div>
              <?php if (isset($error_name[$language['language_id']])) { ?>
              <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
<script src="view/javascript/colorpicker/dist/js/bootstrap-colorpicker.js" type="text/javascript"></script>
<link href="view/javascript/colorpicker/dist/css/bootstrap-colorpicker.css" rel="stylesheet">
<script> $(function() { $('.mod_ch_color').colorpicker({ format: 'hex' }); }); </script>
<style>
.input-group-addon {
padding: 4px 18px;
}
</style>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-color"><?php echo $entry_color; ?></label>
            <div class="col-sm-10">
			<div class="mod_ch_color input-group colorpicker-component" title="color">
              <input type="text" name="color" value="<?php echo $color; ?>" id="input-color" class="form-control" />
			  <span class="input-group-addon"><i></i></span>
            </div>
			  <?php if ($error_color) { ?>
              <div class="text-danger"><?php echo $error_color; ?></div>
              <?php } ?>
			 </div>
          </div>
		  <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-background"><?php echo $entry_background; ?></label>
            <div class="col-sm-10">
			<div class="mod_ch_color input-group colorpicker-component" title="color">
              <input type="text" name="background" value="<?php echo $background; ?>" id="input-background" class="form-control" />
			  <span class="input-group-addon"><i></i></span>
            </div>
			 <?php if ($error_background) { ?>
              <div class="text-danger"><?php echo $error_background; ?></div>
              <?php } ?>
			 </div>
          </div> 
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>