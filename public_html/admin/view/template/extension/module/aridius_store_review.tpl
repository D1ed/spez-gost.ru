<?php echo $header; ?><?php echo $column_left; ?>
<?php
   foreach ($languages as $language) {
   	if(!isset($aridius_store_review_meta_title[$language['language_id']])) $aridius_store_review_meta_title[$language['language_id']]               = "Отзывы о магазине";
   	if(!isset($aridius_store_review_meta_description[$language['language_id']])) $aridius_store_review_meta_description[$language['language_id']]   = "Отзывы о магазине";
   	if(!isset($aridius_store_review_meta_keyword[$language['language_id']])) $aridius_store_review_meta_keyword[$language['language_id']]           = "Отзывы о магазине";
   }
   ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <a href="<?php echo $store_review; ?>" data-toggle="tooltip" title="<?php echo $button_store_review; ?>" class="btn btn-warning"><i class="fa fa-bullhorn"></i>&nbsp;&nbsp;<?php echo $text_store_review; ?></a>
            <button type="submit" form="form-aridius_store_review" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button> 
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
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-aridius_store_review" class="form-horizontal">
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $entry_review_guest; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_store_review_review_guest) { ?>
                     <input type="radio" name="aridius_store_review_review_guest" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_store_review_review_guest" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_store_review_review_guest) { ?>
                     <input type="radio" name="aridius_store_review_review_guest" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_store_review_review_guest" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $entry_answer_button; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_store_review_display_answer_button) { ?>
                     <input type="radio" name="aridius_store_review_display_answer_button" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_store_review_display_answer_button" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_store_review_display_answer_button) { ?>
                     <input type="radio" name="aridius_store_review_display_answer_button" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_store_review_display_answer_button" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $entry_average_rating; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_store_review_display_average_rating) { ?>
                     <input type="radio" name="aridius_store_review_display_average_rating" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_store_review_display_average_rating" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_store_review_display_average_rating) { ?>
                     <input type="radio" name="aridius_store_review_display_average_rating" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_store_review_display_average_rating" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $entry_default_rating; ?></label>
                  <div class="col-sm-9">
                     <input type="text" name="aridius_store_review_default_rating" value="<?php echo $aridius_store_review_default_rating; ?>" id="input-default_rating" class="form-control" />
                     <?php if ($error_default_rating) { ?>
                     <div class="text-danger"><?php echo $error_default_rating; ?></div>
                     <?php } ?>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $entry_limite_page; ?></label>
                  <div class="col-sm-9">
                     <input type="text" name="aridius_store_review_limite_page" value="<?php echo $aridius_store_review_limite_page; ?>" id="input-entry_limite_page" class="form-control" />
                     <?php if ($error_limite_page) { ?>
                     <div class="text-danger"><?php echo $error_limite_page; ?></div>
                     <?php } ?>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $entry_captcha; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_store_review_display_captcha) { ?>
                     <input type="radio" name="aridius_store_review_display_captcha" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_store_review_display_captcha" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_store_review_display_captcha) { ?>
                     <input type="radio" name="aridius_store_review_display_captcha" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_store_review_display_captcha" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $entry_mail; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_store_review_mail) { ?>
                     <input type="radio" name="aridius_store_review_mail" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_store_review_mail" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_store_review_mail) { ?>
                     <input type="radio" name="aridius_store_review_mail" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_store_review_mail" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label"><?php echo $entry_meta_title; ?></label>
                  <div class="col-sm-9">
                     <?php foreach ($languages as $language) { ?>
                     <div class="input-group">
                        <span class="input-group-addon">
                        <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                        </span>
                        <input name="aridius_store_review_meta_title[<?php echo $language['language_id']; ?>]" value="<?php echo $aridius_store_review_meta_title[$language['language_id']]; ?>" class="form-control" />
                     </div>
                     <?php } ?>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label"><?php echo $entry_meta_description; ?></label>
                  <div class="col-sm-9">
                     <?php foreach ($languages as $language) { ?>
                     <div class="input-group">
                        <span class="input-group-addon">
                        <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                        </span>
                        <input name="aridius_store_review_meta_description[<?php echo $language['language_id']; ?>]" value="<?php echo $aridius_store_review_meta_description[$language['language_id']]; ?>" class="form-control" />
                     </div>
                     <?php } ?>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label"><?php echo $entry_meta_keyword; ?></label>
                  <div class="col-sm-9">
                     <?php foreach ($languages as $language) { ?>
                     <div class="input-group">
                        <span class="input-group-addon">
                        <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                        </span>
                        <input name="aridius_store_review_meta_keyword[<?php echo $language['language_id']; ?>]" value="<?php echo $aridius_store_review_meta_keyword[$language['language_id']]; ?>" class="form-control" />
                     </div>
                     <?php } ?>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" for="input-status"><?php echo $entry_status; ?></label>
                  <div class="col-sm-9">
                     <select name="aridius_store_review_status" id="input-status" class="form-control">
                        <?php if ($aridius_store_review_status) { ?>
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
   	$('#form-aridius_store_review').append('<input type="hidden" id="apply" name="apply" value="1" />');
   	$('#form-aridius_store_review').submit();
   }
   //-->
</script>
<?php echo $footer; ?>
