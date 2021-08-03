<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <button type="submit" form="form-category" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button>
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
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category" class="form-horizontal">
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-category"><?php echo $text_categoryaccord; ?></label>
                  <div class="col-sm-10">
                     <div class="well well-sm" style="min-height: 150px;max-height: 500px;overflow: auto;">
                        <table class="table table-striped">
                           <?php foreach ($categories as $category) { ?>
                           <tr>
                              <td class="checkbox">
                                 <label>
                                 <?php if (in_array($category['category_id'], $aridius_category_footer_child_visible)) { ?>
                                 <input type="checkbox" name="aridius_category_footer_child_visible[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                                 <?php echo $category['name']; ?>
                                 <?php } else { ?>
                                 <input type="checkbox" name="aridius_category_footer_child_visible[]" value="<?php echo $category['category_id']; ?>" />
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
                  <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                  <div class="col-sm-10">
                     <select name="aridius_category_footer_status" id="input-status" class="form-control">
                        <?php if ($aridius_category_footer_status) { ?>
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
   	$('#form-category').append('<input type="hidden" id="apply" name="apply" value="1" />');
   	$('#form-category').submit();
   }
   //-->
</script>
<?php echo $footer; ?>
