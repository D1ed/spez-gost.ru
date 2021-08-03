<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <button type="submit" form="form-aridius_icons" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $button_save; ?></button>
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
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-aridius_icons" class="form-horizontal">
               <legend><?php echo $text_legend; ?></legend>
               <div class="row">
                  <div class="col-sm-2">
                     <ul class="nav nav-pills nav-stacked" id="top_link">
                        <?php $top_link_row = 1; ?>
                        <?php foreach ($top_links as $top_link) { ?>
                        <li><a href="#tab-top_link-<?php echo $top_link_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-top_link-<?php echo $top_link_row; ?>\']').parent().remove(); $('#tab-top_link-<?php echo $top_link_row; ?>').remove(); $('#top_link a:first').tab('show');"></i> <?php echo $tab_top_link . ' ' . $top_link_row; ?></a></li>
                        <?php $top_link_row++; ?>
                        <?php } ?>
                        <li id="top_link-add"><a onclick="addtop_link();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_top_link; ?></a></li>
                     </ul>
                  </div>
                  <div class="col-sm-10">
                     <div class="tab-content first7">
                        <?php $top_link_row = 1; ?>
                        <?php foreach ($top_links as $top_link) { ?>
                        <div class="tab-pane" id="tab-top_link-<?php echo $top_link_row; ?>">
                           <div class="tab-content">
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" ><?php echo $text_name_top_add_tabs; ?></label>
                                 <div class="col-sm-10">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
                                       <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                       <input type="text" class="form-control" name="aridius_icons_top_links[<?php echo $top_link_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link['title'][$language['language_id']]) ? $top_link['title'][$language['language_id']] : ''; ?>" size="70" />
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" ><?php echo $text_faicons_icons; ?></label>
                                 <div class="col-sm-10">
                                    <input type="text" class="form-control" name="aridius_icons_top_links[<?php echo $top_link_row; ?>][faicons_icons]" value="<?php echo isset($top_link['faicons_icons']) ? $top_link['faicons_icons'] : ''; ?>" />
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" ><?php echo $text_add_link; ?></label>
                                 <div class="col-sm-10">
                                    <input type="text" class="form-control" name="aridius_icons_top_links[<?php echo $top_link_row; ?>][add_link]" value="<?php echo isset($top_link['add_link']) ? $top_link['add_link'] : ''; ?>" />
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" ><?php echo $text_link_top; ?></label>
                                 <div class="col-sm-10">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
                                       <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                       <textarea class="form-control custom-control summernote" cols="3" name="aridius_icons_top_links[<?php echo $top_link_row; ?>][description][<?php echo $language['language_id']; ?>]" id="description-<?php echo $top_link_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($top_link['description'][$language['language_id']]) ? $top_link['description'][$language['language_id']] : ''; ?>     </textarea>
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                           </div>
                           <?php $top_link_row++; ?>
                        </div>
                        <?php } ?>
                     </div>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-icons_popup"><?php echo $text_popup; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($aridius_icons_popup) { ?>
                     <input type="radio" name="aridius_icons_popup" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_icons_popup" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_icons_popup) { ?>
                     <input type="radio" name="aridius_icons_popup" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_icons_popup" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-icons_popup"><?php echo $text_link; ?></label>
                  <div class="col-sm-10">
                     <label class="radio-inline">
                     <?php if ($aridius_icons_link) { ?>
                     <input type="radio" name="aridius_icons_link" value="1" checked="checked" />
                     <?php echo $text_yes; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_icons_link" value="1" />
                     <?php echo $text_yes; ?>
                     <?php } ?>
                     </label>
                     <label class="radio-inline">
                     <?php if (!$aridius_icons_link) { ?>
                     <input type="radio" name="aridius_icons_link" value="0" checked="checked" />
                     <?php echo $text_no; ?>
                     <?php } else { ?>
                     <input type="radio" name="aridius_icons_link" value="0" />
                     <?php echo $text_no; ?>
                     <?php } ?>
                     </label>
                  </div>
               </div>
               <?php
                  $colico 	= array( '4' =>'1' , '6' =>'2');
                  ?>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-skin"><?php echo $text_colico; ?></label>
                  <div class="col-sm-10">
                     <select name="aridius_icons_colico" id="input-skin" class="form-control">
                        <?php foreach ($colico as $key => $valcolico) { ?>
                        <?php if ($valcolico == $aridius_icons_colico) { ?>
                        <option value="<?php echo $valcolico; ?>" selected="selected"><?php echo $key; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $valcolico; ?>"><?php echo $key; ?></option>
                        <?php } ?>
                        <?php } ?>
                     </select>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-aridius_icons_status"><?php echo $entry_status; ?></label>
                  <div class="col-sm-10">
                     <select name="aridius_icons_status" id="input-aridius_icons_status" class="form-control">
                        <?php if ($aridius_icons_status) { ?>
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
   $('#top_link li:first-child a').tab('show');
   //-->
</script>
<script><!--
   var top_link_row = <?php echo $top_link_row; ?>;
   function addtop_link() {
   	group_row = 0;
   	html  = '<div class="tab-pane" id="tab-top_link-' + top_link_row + '">';
   	html += '<div class="tab-content">';
   	html += '<div class="form-group">';
   	html += '<label class="col-sm-2 control-label" ><?php echo $text_name_top_add_tabs; ?></label>';
   	html += '<div class="col-sm-10">';
   	<?php foreach ($languages as $language) { ?>
   		html += '<div class="input-group">';
   		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   		html += '<input type="text" class="form-control" name="aridius_icons_top_links[' + top_link_row + '][title][<?php echo $language['language_id']; ?>]" size="70" />';
   		html += '</div>';
   	<?php } ?>
   	html += '</div>';
   	html += '</div>';
   	html += '<div class="form-group">';
   	html += '<label class="col-sm-2 control-label" ><?php echo $text_faicons_icons; ?></label>';
   	html += '<div class="col-sm-10">';
   	html += '<input type="text" class="form-control" name="aridius_icons_top_links[' + top_link_row + '][faicons_icons]" />';
   	html += '</div>';
   	html += '</div>';
   	
   	
   	html += '<div class="form-group">';
   	html += '<label class="col-sm-2 control-label" ><?php echo $text_add_link; ?></label>';
   	html += '<div class="col-sm-10">';
   	html += '<input type="text" class="form-control" name="aridius_icons_top_links[' + top_link_row + '][add_link]" />';
   	html += '</div>';
   	html += '</div>';
   	
   	
   	html += '<div class="form-group">';
   	html += '<label class="col-sm-2 control-label" ><?php echo $text_link_top; ?></label>';
   	html += '<div class="col-sm-10">';
   	<?php foreach ($languages as $language) { ?>
   		html += '<div class="input-group">';
   		html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   		html += '<textarea name="aridius_icons_top_links[' + top_link_row + '][description][<?php echo $language['language_id']; ?>]" id="description-' + top_link_row + '-<?php echo $language['language_id']; ?>" class="summernote-' + top_link_row + ' form-control"></textarea>';
   		html += '</div>';
   	<?php } ?>
   	html += '</div>';
   	html += '</div>';
   	html += '</div>';
   	html += '</div>';
   	$('.tab-content.first7').append(html);
   	$('#top_link-add').before('<li><a href="#tab-top_link-' + top_link_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link-' + top_link_row + '\\\']\').parent().remove(); $(\'#tab-top_link-' + top_link_row + '\').remove(); $(\'#top_link a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row + '</a></li>');
   	
   	<?php if ($ckeditor) { ?>
   	<?php foreach ($languages as $language) { ?>
   	ckeditorInit('description-' + top_link_row + '-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
   	<?php } ?>
   	<?php } else { ?>
   	$('.summernote-' + top_link_row ).summernote({ 
       height: 150,   //set editable area's height
   	});
   	<?php } ?>
   	
   	$('#top_link a[href=\'#tab-top_link-' + top_link_row + '\']').tab('show');
   	top_link_row++;
   }
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
<script><!--
   <?php foreach ($languages as $language) { ?>
   <?php if ($ckeditor) { ?>
   ckeditorInit('input-description2<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
       <?php } ?>
   <?php } ?>
   //-->
</script>
<script><!--
   <?php $top_link_row = 1; ?>
   <?php foreach ($top_links as $top_link) { ?>
   <?php foreach ($languages as $language) { ?>
   ckeditorInit('description-<?php echo $top_link_row; ?>-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
   <?php } ?>
   <?php $top_link_row++; ?>
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
   	$('#form-aridius_icons').append('<input type="hidden" id="apply" name="apply" value="1" />');
   	$('#form-aridius_icons').submit();
   }
   //-->
</script>
<?php echo $footer; ?>
