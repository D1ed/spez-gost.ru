<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <a href="<?php echo $aridiusundersell; ?>" data-toggle="tooltip" title="<?php echo $text_aridiusundersell; ?>" class="btn btn-warning"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;<?php echo $text_aridiusundersell; ?></a>        
            <button type="submit" form="form-undersell" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button>  
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
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
         </div>
         <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-undersell"
               class="form-horizontal">
               <div class="form-group">
                  <div class="col-sm-12">
                     <ul id="myTab2" class="nav nav-tabs">
                        <li><a data-toggle="tab" href="#panely1"><?php echo $tab_main; ?></a></li>
                        <li><a data-toggle="tab" href="#panely2"><?php echo $tab_text; ?></a></li>
                     </ul>
                     <div class="tab-content">
                        <div id="panely1" class="tab-pane fade in active">
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_adddescription; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_adddescriptionshow) { ?>
                                 <input type="radio" name="aridiusundersell_adddescriptionshow" value="1" checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_adddescriptionshow" value="1" />
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_adddescriptionshow) { ?>
                                 <input type="radio" name="aridiusundersell_adddescriptionshow"  value="0" checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_adddescriptionshow" value="0" />
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_description; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_descriptionshow) { ?>
                                 <input type="radio" name="aridiusundersell_descriptionshow" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_descriptionshow" value="0"
                                    checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_descriptionshow) { ?>
                                 <input type="radio" name="aridiusundersell_descriptionshow" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_descriptionshow" value="1"
                                    checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_img; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_img) { ?>
                                 <input type="radio" name="aridiusundersell_img" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_img" value="0"
                                    checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_img) { ?>
                                 <input type="radio" name="aridiusundersell_img" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_img" value="1"
                                    checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_price; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_price) { ?>
                                 <input type="radio" name="aridiusundersell_price" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_price" value="0"
                                    checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_price) { ?>
                                 <input type="radio" name="aridiusundersell_price" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_price" value="1"
                                    checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_quantity; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_quantity) { ?>
                                 <input type="radio" name="aridiusundersell_quantity" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_quantity" value="0"
                                    checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_quantity) { ?>
                                 <input type="radio" name="aridiusundersell_quantity" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_quantity" value="1"
                                    checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input_imgw"><?php echo $text_imgw; ?></label>
                              <div class="col-sm-10">
                                 <input type="text" name="aridiusundersell_imgw" value="<?php echo $aridiusundersell_imgw; ?>" id="input-imgw" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-input_imgh"><?php echo $text_imgh; ?></label>
                              <div class="col-sm-10">
                                 <input type="text" name="aridiusundersell_imgh" value="<?php echo $aridiusundersell_imgh; ?>" id="input-imgh" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-input_descchar"><?php echo $text_descchar; ?></label>
                              <div class="col-sm-10">
                                 <input type="text" name="aridiusundersell_descchar" value="<?php echo $aridiusundersell_descchar; ?>" id="input-descchar" class="form-control" />
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_firstnameshow; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_firstnameshow) { ?>
                                 <input type="radio" name="aridiusundersell_firstnameshow" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_firstnameshow" value="0"
                                    checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_firstnameshow) { ?>
                                 <input type="radio" name="aridiusundersell_firstnameshow" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_firstnameshow" value="1"
                                    checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_firstnamevalid; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_firstnamevalid) { ?>
                                 <input type="radio" name="aridiusundersell_firstnamevalid" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_firstnamevalid" value="0"
                                    checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_firstnamevalid) { ?>
                                 <input type="radio" name="aridiusundersell_firstnamevalid" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_firstnamevalid" value="1"
                                    checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_placeholderfirstname; ?></label>
                              <div class="col-sm-10">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aridiusundersell_placeholderfirstname[<?php echo $language['language_id']; ?>]"
                                       value="<?php echo $aridiusundersell_placeholderfirstname[$language['language_id']]; ?>"
                                       class="form-control"/>
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_mask; ?></label>
                              <div class="col-sm-10">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aridiusundersell_mask[<?php echo $language['language_id']; ?>]"
                                       value="<?php echo $aridiusundersell_mask[$language['language_id']]; ?>"
                                       class="form-control"/>
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_placeholdertell; ?></label>
                              <div class="col-sm-10">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aridiusundersell_placeholdertell[<?php echo $language['language_id']; ?>]"
                                       value="<?php echo $aridiusundersell_placeholdertell[$language['language_id']]; ?>"
                                       class="form-control"/>
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_emailshow; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_emailshow) { ?>
                                 <input type="radio" name="aridiusundersell_emailshow" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_emailshow" value="0"
                                    checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_emailshow) { ?>
                                 <input type="radio" name="aridiusundersell_emailshow" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_emailshow" value="1"
                                    checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_emailvalid; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_emailvalid) { ?>
                                 <input type="radio" name="aridiusundersell_emailvalid" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_emailvalid" value="0"
                                    checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_emailvalid) { ?>
                                 <input type="radio" name="aridiusundersell_emailvalid" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_emailvalid" value="1"
                                    checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_placeholderemail; ?></label>
                              <div class="col-sm-10">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aridiusundersell_placeholderemail[<?php echo $language['language_id']; ?>]"
                                       value="<?php echo $aridiusundersell_placeholderemail[$language['language_id']]; ?>"
                                       class="form-control"/>
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_commentshow; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_commentshow) { ?>
                                 <input type="radio" name="aridiusundersell_commentshow" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_commentshow" value="0"
                                    checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_commentshow) { ?>
                                 <input type="radio" name="aridiusundersell_commentshow" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_commentshow" value="1"
                                    checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_placeholdercomment; ?></label>
                              <div class="col-sm-10">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aridiusundersell_placeholdercomment[<?php echo $language['language_id']; ?>]"
                                       value="<?php echo $aridiusundersell_placeholdercomment[$language['language_id']]; ?>"
                                       class="form-control"/>
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_linkshow; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_linkshow) { ?>
                                 <input type="radio" name="aridiusundersell_linkshow" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_linkshow" value="0"
                                    checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_linkshow) { ?>
                                 <input type="radio" name="aridiusundersell_linkshow" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_linkshow" value="1"
                                    checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_linkvalid; ?></label>
                              <div class="col-sm-10">
                                 <label class="radio-inline">
                                 <?php if ($aridiusundersell_linkvalid) { ?>
                                 <input type="radio" name="aridiusundersell_linkvalid" value="0"/>
                                 <?php echo $text_yes; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_linkvalid" value="0"
                                    checked="checked"/>
                                 <?php echo $text_yes; ?>
                                 <?php } ?>
                                 </label>
                                 <label class="radio-inline">
                                 <?php if (!$aridiusundersell_linkvalid) { ?>
                                 <input type="radio" name="aridiusundersell_linkvalid" value="1"/>
                                 <?php echo $text_no; ?>
                                 <?php } else { ?>
                                 <input type="radio" name="aridiusundersell_linkvalid" value="1"
                                    checked="checked"/>
                                 <?php echo $text_no; ?>
                                 <?php } ?>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"><?php echo $text_placeholderlink; ?></label>
                              <div class="col-sm-10">
                                 <?php foreach ($languages as $language) { ?>
                                 <div class="input-group">
                                    <span class="input-group-addon">
                                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                    </span>
                                    <input name="aridiusundersell_placeholderlink[<?php echo $language['language_id']; ?>]"
                                       value="<?php echo $aridiusundersell_placeholderlink[$language['language_id']]; ?>"
                                       class="form-control"/>
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                           <hr>
                           <hr>
                           <div class="form-group">
                              <label class="col-sm-2 control-label"
                                 for="input-limit"><?php echo $entry_status; ?></label>
                              <div class="col-sm-10">
                                 <select name="aridiusundersell_status" class="form-control">
                                    <?php if ($module_status) { ?>
                                    <option value="1"
                                       selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0"
                                       selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                 </select>
                              </div>
                           </div>
                        </div>
                        <div id="panely2" class="tab-pane fade">
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
                                       <textarea name="aridiusundersell_description[<?php echo $language['language_id']; ?>]" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridiusundersell_description[$language['language_id']]) ? $aridiusundersell_description[$language['language_id']] : ''; ?></textarea>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label"
                                       for="input-description2<?php echo $language['language_id']; ?>"><?php echo $entry_description2; ?></label>
                                    <div class="col-sm-10">
                                       <textarea name="aridiusundersell_description2[<?php echo $language['language_id']; ?>]" id="input-description2<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridiusundersell_description2[$language['language_id']]) ? $aridiusundersell_description2[$language['language_id']] : ''; ?></textarea>
                                    </div>
                                 </div>
                              </div>
                              <?php } ?>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
<?php if ($ckeditor) { ?>
<script src="view/javascript/ckeditor/ckeditor.js"></script>
<script src="view/javascript/ckeditor/ckeditor_init.js"></script>
<?php } ?>
<script><!--
   $('#language a:first').tab('show');
   $('#option a:first').tab('show');
   //-->
</script>
<script><!--
   $(document).ready(function(){
   	$("#myTab2 li:eq(0) a").tab('show');
   });
   //-->
</script>
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
   //-->
</script>
<script><!--
   <?php foreach ($languages as $language) { ?>
   <?php if ($ckeditor) { ?>
           ckeditorInit('input-description2<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
       <?php } ?>
   <?php } ?>
   //-->
</script>
<script><!--
   function apply() {
   	$('#form-undersell').append('<input type="hidden" id="apply" name="apply" value="1" />');
   	$('#form-undersell').submit();
   }
   //-->
</script>
<?php echo $footer; ?>
