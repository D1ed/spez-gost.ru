<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <button type="submit" form="form-qckview" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button>
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
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_main_setting; ?></h3>
         </div>
         <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-qckview" class="form-horizontal">
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_tab_description; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_tab_description) { ?>
                     <input type="radio" name="aridius_qckview_tab_description" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_tab_description" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_tab_description) { ?>
                     <input type="radio" name="aridius_qckview_tab_description" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_tab_description" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_tab_character; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_tab_character) { ?>
                     <input type="radio" name="aridius_qckview_tab_character" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_tab_character" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_tab_character) { ?>
                     <input type="radio" name="aridius_qckview_tab_character" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_tab_character" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_tab_reviews; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_tab_reviews) { ?>
                     <input type="radio" name="aridius_qckview_tab_reviews" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_tab_reviews" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_tab_reviews) { ?>
                     <input type="radio" name="aridius_qckview_tab_reviews" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_tab_reviews" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_tab_additional; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_tab_additional) { ?>
                     <input type="radio" name="aridius_qckview_tab_additional" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_tab_additional" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_tab_additional) { ?>
                     <input type="radio" name="aridius_qckview_tab_additional" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_tab_additional" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_rating; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_rating) { ?>
                     <input type="radio" name="aridius_qckview_rating" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_rating" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_rating) { ?>
                     <input type="radio" name="aridius_qckview_rating" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_rating" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <hr>
               <hr>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_short_info; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_short_info) { ?>
                     <input type="radio" name="aridius_qckview_short_info" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_short_info" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_short_info) { ?>
                     <input type="radio" name="aridius_qckview_short_info" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_short_info" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_manufacturer; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_manufacturer) { ?>
                     <input type="radio" name="aridius_qckview_manufacturer" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_manufacturer" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_manufacturer) { ?>
                     <input type="radio" name="aridius_qckview_manufacturer" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_manufacturer" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_stock; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_stock) { ?>
                     <input type="radio" name="aridius_qckview_stock" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_stock" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_stock) { ?>
                     <input type="radio" name="aridius_qckview_stock" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_stock" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_code_product; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_code_product) { ?>
                     <input type="radio" name="aridius_qckview_code_product" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_code_product" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_code_product) { ?>
                     <input type="radio" name="aridius_qckview_code_product" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_code_product" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <hr>
               <hr>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_button_wish; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_button_wish) { ?>
                     <input type="radio" name="aridius_qckview_button_wish" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_button_wish" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_button_wish) { ?>
                     <input type="radio" name="aridius_qckview_button_wish" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_button_wish" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_button_compare; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_button_compare) { ?>
                     <input type="radio" name="aridius_qckview_button_compare" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_button_compare" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_button_compare) { ?>
                     <input type="radio" name="aridius_qckview_button_compare" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_button_compare" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <hr>
               <hr>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_show_saving; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_show_saving) { ?>
                     <input type="radio" name="aridius_qckview_show_saving" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_show_saving" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_show_saving) { ?>
                     <input type="radio" name="aridius_qckview_show_saving" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_show_saving" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-3 control-label" ><?php echo $text_show_stsale; ?></label>
                  <div class="col-sm-9">
                     <label class="radio-inline">
                     <?php if ($aridius_qckview_show_stsale) { ?>
                     <input type="radio" name="aridius_qckview_show_stsale" value="0" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_show_stsale" value="0" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_qckview_show_stsale) { ?>
                     <input type="radio" name="aridius_qckview_show_stsale" value="1" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_qckview_show_stsale" value="1" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                  <div class="col-sm-10">
                     <select name="aridius_qckview_status" id="input-status" class="form-control">
                        <?php if ($aridius_qckview_status) { ?>
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
   	$('#form-qckview').append('<input type="hidden" id="apply" name="apply" value="1" />');
   	$('#form-qckview').submit();
   }
   //-->
</script>
<?php echo $footer; ?>
