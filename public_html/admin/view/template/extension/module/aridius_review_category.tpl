<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <button type="submit" form="form-news" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button>
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
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-news" class="form-horizontal">
               <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-headline"><?php echo $entry_chars; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="aridius_review_category_chars" value="<?php echo $aridius_review_category_chars; ?>" id="input-headline" class="form-control" />
                     <?php if ($error_headline_chars) { ?>
                     <div class="text-danger"><?php echo $error_headline_chars; ?></div>
                     <?php } ?>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="aridius_review_category_limit" value="<?php echo $aridius_review_category_limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-date"><?php echo $entry_date; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($aridius_review_category_date) { ?>
                     <input type="radio" name="aridius_review_category_date" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_review_category_date" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_review_category_date) { ?>
                     <input type="radio" name="aridius_review_category_date" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_review_category_date" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-navigation"><?php echo $entry_navigation; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($aridius_review_category_navigation) { ?>
                     <input type="radio" name="aridius_review_category_navigation" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_review_category_navigation" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_review_category_navigation) { ?>
                     <input type="radio" name="aridius_review_category_navigation" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_review_category_navigation" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-aridius_review_category_autoplayon"><?php echo $entry_autoplay_on; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($aridius_review_category_autoplayon) { ?>
                     <input type="radio" name="aridius_review_category_autoplayon" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_review_category_autoplayon" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_review_category_autoplayon) { ?>
                     <input type="radio" name="aridius_review_category_autoplayon" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_review_category_autoplayon" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-autoplay"><?php echo $entry_autoplay; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="aridius_review_category_autoplay" value="<?php echo $aridius_review_category_autoplay; ?>" placeholder="<?php echo $entry_autoplay; ?>" id="input-autoplay" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-items"><?php echo $entry_items; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="aridius_review_category_items" value="<?php echo $aridius_review_category_items; ?>" placeholder="<?php echo $entry_items; ?>" id="input-items" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-rew_speed"><?php echo $entry_rew_speed; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="aridius_review_category_rew_speed" value="<?php echo $aridius_review_category_rew_speed; ?>" placeholder="<?php echo $entry_rew_speed; ?>" id="input-rew_speed" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-stophover"><?php echo $entry_stophover; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($aridius_review_category_stophover) { ?>
                     <input type="radio" name="aridius_review_category_stophover" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_review_category_stophover" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_review_category_stophover) { ?>
                     <input type="radio" name="aridius_review_category_stophover" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_review_category_stophover" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-colleft"><?php echo $entry_colleft; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($aridius_review_category_colleft) { ?>
                     <input type="radio" name="aridius_review_category_colleft" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_review_category_colleft" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_review_category_colleft) { ?>
                     <input type="radio" name="aridius_review_category_colleft" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_review_category_colleft" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                  <div class="col-sm-10">
                     <select name="aridius_review_category_status" id="input-status" class="form-control">
                        <?php if ($aridius_review_category_status) { ?>
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
   	$('#form-news').append('<input type="hidden" id="apply" name="apply" value="1" />');
   	$('#form-news').submit();
   }
   //-->
</script>
<?php echo $footer; ?>
