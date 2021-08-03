<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <button type="submit" form="form-aridius_text_home" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button>
            <a onclick="apply();" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_apply; ?>" ><i class="fa fa-check"></i>&nbsp;&nbsp;<?php echo $button_apply; ?></a>
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
      <div class="panel panel-default">
         <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
         </div>
         <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-aridius_text_home" class="form-horizontal">
               <ul class="nav nav-tabs" id="language">
                  <?php foreach ($languages as $language) { ?>
                  <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                  <?php } ?>
               </ul>
               <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                  <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                     <div class="form-group">
                        <label class="col-sm-3 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_description;?></label>
                        <div class="col-sm-9">
                           <textarea name="aridius_text_home_description[<?php echo $language['language_id']; ?>]" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridius_text_home_description[$language['language_id']]) ? $aridius_text_home_description[$language['language_id']] : ''; ?></textarea>
                        </div>
                     </div>
                  </div>
                  <?php } ?>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" for="input-limit"><?php echo $text_footer_limit; ?></label>
                  <div class="col-sm-9">
                     <input type="text" name="aridius_text_home_limit" value="<?php echo $aridius_text_home_limit; ?>" id="input-limit" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" for="input-height"><?php echo $text_footer_limit_height; ?></label>
                  <div class="col-sm-9">
                     <input type="text" name="aridius_text_home_height" value="<?php echo $aridius_text_home_height; ?>" id="input-height" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-aridius_text_home_status"><?php echo $entry_status; ?></label>
                  <div class="col-sm-10">
                     <select name="aridius_text_home_status" id="input-aridius_text_home_status" class="form-control">
                        <?php if ($aridius_text_home_status) { ?>
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
<!-- summernote -->	
<script><!--
   $('.summernote').summernote({
   height: 150,   //set editable area's height
   });
   //-->
</script>
<?php } ?>
<?php if ($ckeditor) { ?>
<script><!--
   <?php foreach ($languages as $language) { ?>
   <?php if ($ckeditor) { ?>
   ckeditorInit('input-description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
       <?php } ?>
   <?php } ?>
   //-->
</script>
<?php } ?>
<script><!--
   $('#language a:first').tab('show');
   $('#option a:first').tab('show');
   //-->
</script>
<script><!--
   function apply() {
   	$('#form-aridius_text_home').append('<input type="hidden" id="apply" name="apply" value="1" />');
   	$('#form-aridius_text_home').submit();
   }
   //-->
</script>
<?php echo $footer; ?>
