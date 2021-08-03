<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <button type="submit" form="form-bestseller" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button>
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
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-bestseller" class="form-horizontal">
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                     <?php if ($error_name) { ?>
                     <div class="text-danger"><?php echo $error_name; ?></div>
                     <?php } ?>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
                     <?php if ($error_width) { ?>
                     <div class="text-danger"><?php echo $error_width; ?></div>
                     <?php } ?>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
                     <?php if ($error_height) { ?>
                     <div class="text-danger"><?php echo $error_height; ?></div>
                     <?php } ?>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-rat"><?php echo $entry_rat; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($rat) { ?>
                     <input type="radio" name="rat" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="rat" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$rat) { ?>
                     <input type="radio" name="rat" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="rat" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-wish"><?php echo $entry_wish; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($wish) { ?>
                     <input type="radio" name="wish" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="wish" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$wish) { ?>
                     <input type="radio" name="wish" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="wish" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-comp"><?php echo $entry_comp; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($comp) { ?>
                     <input type="radio" name="comp" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="comp" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$comp) { ?>
                     <input type="radio" name="comp" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="comp" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-quickview"><?php echo $entry_quickview; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($quickview) { ?>
                     <input type="radio" name="quickview" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="quickview" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$quickview) { ?>
                     <input type="radio" name="quickview" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="quickview" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <legend><?php echo $text_carusel; ?></legend>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-pagination"><?php echo $entry_carusel; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($carusel) { ?>
                     <input type="radio" name="carusel" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="carusel" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$carusel) { ?>
                     <input type="radio" name="carusel" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="carusel" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-navigation"><?php echo $entry_navigation; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($navigation) { ?>
                     <input type="radio" name="navigation" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="navigation" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$navigation) { ?>
                     <input type="radio" name="navigation" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="navigation" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-autoplay_on"><?php echo $entry_autoplay_on; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($autoplay_on) { ?>
                     <input type="radio" name="autoplay_on" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="autoplay_on" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$autoplay_on) { ?>
                     <input type="radio" name="autoplay_on" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="autoplay_on" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-autoplay"><?php echo $entry_autoplay; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="autoplay" value="<?php echo $autoplay; ?>" placeholder="<?php echo $entry_autoplay; ?>" id="input-autoplay" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-items"><?php echo $entry_items; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="items" value="<?php echo $items; ?>" placeholder="<?php echo $entry_items; ?>" id="input-items" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-rew_speed"><?php echo $entry_rew_speed; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="rew_speed" value="<?php echo $rew_speed; ?>" placeholder="<?php echo $entry_rew_speed; ?>" id="input-rew_speed" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-stophover"><?php echo $entry_stophover; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($stophover) { ?>
                     <input type="radio" name="stophover" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="stophover" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$stophover) { ?>
                     <input type="radio" name="stophover" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="stophover" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
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
<script><!--
   function apply() {
   	$('#form-bestseller').append('<input type="hidden" id="apply" name="apply" value="1" />');
   	$('#form-bestseller').submit();
   }
   //-->
</script>
<?php echo $footer; ?>
