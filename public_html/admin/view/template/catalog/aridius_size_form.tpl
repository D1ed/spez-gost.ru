<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <button type="submit" form="form-size" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
         </div>
         <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-size" class="form-horizontal">
               <div class="form-group required">
                  <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
                  <div class="col-sm-10">
                     <?php foreach ($languages as $language) { ?>
                     <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                        <input type="text" name="aridius_size_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($aridius_size_description[$language['language_id']]) ? $aridius_size_description[$language['language_id']]['name'] : ''; ?>" class="form-control" />
                     </div>
                     <?php if (isset($error_name[$language['language_id']])) { ?>
                     <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                     <?php } ?>
                     <?php } ?>
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
                     <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                        <div class="col-sm-10">
                           <textarea name="aridius_size_description[<?php echo $language['language_id']; ?>][description]" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridius_size_description[$language['language_id']]) ? $aridius_size_description[$language['language_id']]['description'] : ''; ?></textarea>
                           <?php if (isset($error_description[$language['language_id']])) { ?>
                           <div class="text-danger"><?php echo $error_description[$language['language_id']]; ?></div>
                           <?php } ?>
                        </div>
                     </div>
                  </div>
                  <?php } ?>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="product_name" value="" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
                     <div id="aridius_size-product" class="well well-sm" style="height: 150px; overflow: auto;">
                        <?php foreach ($products as $product) { ?>
                        <div id="aridius_size-product<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                           <input type="hidden" name="product[]" value="<?php echo $product['product_id']; ?>" />
                        </div>
                        <?php } ?>
                     </div>
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
                                 <?php if (in_array($category['category_id'], $product_category)) { ?>
                                 <input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                                 <?php echo $category['name']; ?>
                                 <?php } else { ?>
                                 <input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" />
                                 <?php echo $category['name']; ?>
                                 <?php } ?>
                                 </label>
                              </td>
                           </tr>
                           <?php } ?>
                        </table>
                     </div>
                     <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
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
   <script><!--
      $('#language li:first-child a').tab('show');
      //-->
   </script>
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
   <script type="text/javascript"><!--
      $('input[name=\'product_name\']').autocomplete({
      	source: function(request, response) {
      		$.ajax({
      			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      			dataType: 'json',
      			success: function(json) {
      				response($.map(json, function(item) {
      					return {
      						label: item['name'],
      						value: item['product_id']
      					}
      				}));
      			}
      		});
      	},
      	select: function(item) {
      		$('input[name=\'product_name\']').val('');
      		
      		$('#aridius_size-product' + item['value']).remove();
      		
      		$('#aridius_size-product').append('<div id="aridius_size-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product[]" value="' + item['value'] + '" /></div>');	
      	}
      });
      	
      $('#aridius_size-product').delegate('.fa-minus-circle', 'click', function() {
      	$(this).parent().remove();
      });
      //-->
   </script>
</div>
<?php echo $footer; ?>
