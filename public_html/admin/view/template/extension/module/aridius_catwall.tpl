<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <button type="submit" form="form-category_wall" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button>
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
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category_wall" class="form-horizontal">
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
                  <label class="col-sm-2 control-label" for="input-category"><?php echo $entry_category; ?></label>
                  <div class="col-sm-10">
                     <div class="well well-sm" style="min-height: 150px;max-height: 500px;overflow: auto;">
                        <table class="table table-striped">
                           <?php foreach ($categories as $category) { ?>
                           <tr>
                              <td class="checkbox">
                                 <label>
                                 <?php if (in_array($category['category_id'], $aridius_catwall_cat)) { ?>
                                 <input type="checkbox" name="aridius_catwall_cat[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                                 <?php echo $category['name']; ?>
                                 <?php } else { ?>
                                 <input type="checkbox" name="aridius_catwall_cat[]" value="<?php echo $category['category_id']; ?>" />
                                 <?php echo $category['name']; ?>
                                 <?php } ?>
                                 </label>
                              </td>
                           </tr>
                           <?php } ?>
                        </table>
                     </div>
                     <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_dell; ?></a>
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
                  <label class="col-sm-2 control-label"><?php echo $entry_variant; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($variant) { ?>
                     <input type="radio" name="variant" value="1" checked="checked" />
                     <?php echo $entry_v1; ?>
                     <?php } else { ?>
                     <input type="radio" name="variant" value="1" />
                     <?php echo $entry_v1; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$variant) { ?>
                     <input type="radio" name="variant" value="0" checked="checked" />
                     <?php echo $entry_v2; ?>
                     <?php } else { ?>
                     <input type="radio" name="variant" value="0" />
                     <?php echo $entry_v2; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $entry_child; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($child_visible) { ?>
                     <input type="radio" name="child_visible" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="child_visible" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$child_visible) { ?>
                     <input type="radio" name="child_visible" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="child_visible" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $entry_add_img; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($add_img) { ?>
                     <input type="radio" name="add_img" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="add_img" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$add_img) { ?>
                     <input type="radio" name="add_img" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="add_img" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-limit_child"><?php echo $entry_limitchild; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="limit_child" value="<?php echo $limit_child; ?>" placeholder="<?php echo $entry_limitchild; ?>" id="input-limit_child" class="form-control" />
                     <?php if ($error_limitchild) { ?>
                     <div class="text-danger"><?php echo $error_limitchild; ?></div>
                     <?php } ?>
                  </div>
               </div>
               <?php
                  $xs 	= array( '1' =>'12' , '2' =>'6');
                  ?>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-col"><?php echo $entry_xs; ?></label>
                  <div class="col-sm-10">
                     <select name="col_xs" id="input-col" class="form-control">
                        <?php foreach ($xs as $key => $xs_col) { ?>
                        <?php if ($xs_col == $col_xs) { ?>
                        <option value="<?php echo $xs_col; ?>" selected="selected"><?php echo $key; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $xs_col; ?>"><?php echo $key; ?></option>
                        <?php } ?>
                        <?php } ?>
                     </select>
                  </div>
               </div>
               <?php
                  $sm 	= array( '1' =>'12' , '2' =>'6', '3' =>'4');
                  ?>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-col"><?php echo $entry_sm; ?></label>
                  <div class="col-sm-10">
                     <select name="col_sm" id="input-col" class="form-control">
                        <?php foreach ($sm as $key => $sm_col) { ?>
                        <?php if ($sm_col == $col_sm) { ?>
                        <option value="<?php echo $sm_col; ?>" selected="selected"><?php echo $key; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $sm_col; ?>"><?php echo $key; ?></option>
                        <?php } ?>
                        <?php } ?>
                     </select>
                  </div>
               </div>
               <?php
                  $md 	= array( '2' =>'6', '3' =>'4', '4' =>'3');
                  ?>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-col"><?php echo $entry_md; ?></label>
                  <div class="col-sm-10">
                     <select name="col_md" id="input-col" class="form-control">
                        <?php foreach ($md as $key => $md_col) { ?>
                        <?php if ($md_col == $col_md) { ?>
                        <option value="<?php echo $md_col; ?>" selected="selected"><?php echo $key; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $md_col; ?>"><?php echo $key; ?></option>
                        <?php } ?>
                        <?php } ?>
                     </select>
                  </div>
               </div>
               <?php
                  $lg 	= array( '2' =>'6', '3' =>'4', '4' =>'3')
                  ?>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-col"><?php echo $entry_lg; ?></label>
                  <div class="col-sm-10">
                     <select name="col_lg" id="input-col" class="form-control">
                        <?php foreach ($lg as $key => $lg_col) { ?>
                        <?php if ($lg_col == $col_lg) { ?>
                        <option value="<?php echo $lg_col; ?>" selected="selected"><?php echo $key; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $lg_col; ?>"><?php echo $key; ?></option>
                        <?php } ?>
                        <?php } ?>
                     </select>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-slides1"><?php echo $entry_slides1; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="slides1" value="<?php echo $slides1; ?>" id="input-slides1" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-slides2"><?php echo $entry_slides2; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="slides2" value="<?php echo $slides2; ?>" id="input-slides2" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-slides3"><?php echo $entry_slides3; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="slides3" value="<?php echo $slides3; ?>" id="input-slides3" class="form-control" />
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-slides4"><?php echo $entry_slides4; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="slides4" value="<?php echo $slides4; ?>" id="input-slides4" class="form-control" />
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
   	$('#form-category_wall').append('<input type="hidden" id="apply" name="apply" value="1" />');
   	$('#form-category_wall').submit();
   }
   //-->
</script>
<?php echo $footer; ?>
