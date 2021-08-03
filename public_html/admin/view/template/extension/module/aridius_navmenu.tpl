<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <button type="submit" form="form-aridius_navmenu" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-aridius_navmenu" class="form-horizontal">
               <script src="view/javascript/123/dist/js/bootstrap-colorpicker.js" type="text/javascript"></script>
               <link href="view/javascript/123/dist/css/bootstrap-colorpicker.css" rel="stylesheet">
               <script>
                  $(function () {
                  $('.ch_color').colorpicker();
                  });
               </script>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-name"><?php echo $text_name; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                     <?php if ($error_name) { ?>
                     <div class="text-danger"><?php echo $error_name; ?></div>
                     <?php } ?>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-top"><?php echo $text_top; ?></label>
                  <div class="col-sm-10">
                     <input type="text" name="top" value="<?php echo $top; ?>" id="input-top" class="form-control" />
                  </div>
               </div>
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
                                 <label class="col-sm-2 control-label" ><?php echo $text_menu; ?></label>
                                 <div class="col-sm-10">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
                                       <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                       <input type="text" class="form-control" name="aridius_navmenu_top_links[<?php echo $top_link_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link['title'][$language['language_id']]) ? $top_link['title'][$language['language_id']] : ''; ?>" size="70" />
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" ><?php echo $text_link; ?></label>
                                 <div class="col-sm-10">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
                                       <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                       <input type="text" class="form-control" name="aridius_navmenu_top_links[<?php echo $top_link_row; ?>][link][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link['link'][$language['language_id']]) ? $top_link['link'][$language['language_id']] : ''; ?>" size="70" />
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" for="input-block_img<?php echo $top_link_row; ?>"><?php echo $text_img; ?></label>
                                 <div class="col-sm-10">
                                    <a href="" id="thumb-block_img<?php echo $top_link_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $top_link['image_href']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                    <input type="hidden" name="aridius_navmenu_top_links[<?php echo $top_link_row; ?>][image]" value="<?php echo $top_link['image']; ?>" id="input-block_img<?php echo $top_link_row; ?>" />
                                 </div>
                              </div>
                              <label class="col-sm-2 control-label" ><?php echo $text_color; ?></label>
                              <div class="ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aridius_navmenu_top_links[<?php echo $top_link_row; ?>][color]" class="form-control input-lg" value="<?php echo isset($top_link['color']) ? $top_link['color'] : ''; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                              <label class="col-sm-2 control-label" ><?php echo $text_color_text; ?></label>
                              <div class="ch_color input-group colorpicker-component" title="color">
                                 <input type="text" name="aridius_navmenu_top_links[<?php echo $top_link_row; ?>][color_text]" class="form-control input-lg" value="<?php echo isset($top_link['color_text']) ? $top_link['color_text'] : ''; ?>"/>
                                 <span class="input-group-addon"><i></i></span>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" for="input-aridius_navmenu_top_links<?php echo $top_link_row; ?>"><?php echo $text_show_popup; ?></label>
                                 <div class="col-sm-10">
                                    <select name="aridius_navmenu_top_links[<?php echo $top_link_row; ?>][show_popup]" id="input-aridius_navmenu_top_links<?php echo $top_link_row; ?>" class="form-control">
                                       <?php if ($top_link['show_popup']) { ?>
                                       <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                       <option value="0"><?php echo $text_disabled; ?></option>
                                       <?php } else { ?>
                                       <option value="1"><?php echo $text_enabled; ?></option>
                                       <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                       <?php } ?>
                                    </select>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" ><?php echo $text_title_popup; ?></label>
                                 <div class="col-sm-10">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
                                       <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                       <input type="text" class="form-control" name="aridius_navmenu_top_links[<?php echo $top_link_row; ?>][title_popup][<?php echo $language['language_id']; ?>]" value="<?php echo isset($top_link['title_popup'][$language['language_id']]) ? $top_link['title_popup'][$language['language_id']] : ''; ?>" size="70" />
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" ><?php echo $text_popup_description; ?></label>
                                 <div class="col-sm-10">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
                                       <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                       <textarea class="form-control custom-control summernote" cols="3" name="aridius_navmenu_top_links[<?php echo $top_link_row; ?>][description_popup][<?php echo $language['language_id']; ?>]" id="description_popup-<?php echo $top_link_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($top_link['description_popup'][$language['language_id']]) ? $top_link['description_popup'][$language['language_id']] : ''; ?>     </textarea>
                                    </div>
                                    <?php } ?>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="col-sm-2 control-label" ><?php echo $text_sort; ?></label>
                                 <div class="col-sm-10">
                                    <input type="text" class="form-control" name="aridius_navmenu_top_links[<?php echo $top_link_row; ?>][sort]" value="<?php echo isset($top_link['sort']) ? $top_link['sort'] : ''; ?>" />
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
<script type="text/javascript"><!--
   $('#top_link li:first-child a').tab('show');
   //-->
</script>
<script type="text/javascript"><!--
   var top_link_row = <?php echo $top_link_row; ?>;
   function addtop_link() {
   group_row = 0;
   html  = '<div class="tab-pane" id="tab-top_link-' + top_link_row + '">';
   html += '<div class="tab-content">';
   html += '<div class="form-group">';
   html += '<label class="col-sm-2 control-label" ><?php echo $text_menu; ?></label>';
   html += '<div class="col-sm-10">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aridius_navmenu_top_links[' + top_link_row + '][title][<?php echo $language['language_id']; ?>]" size="70" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-2 control-label" ><?php echo $text_link; ?></label>';
   html += '<div class="col-sm-10">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aridius_navmenu_top_links[' + top_link_row + '][link][<?php echo $language['language_id']; ?>]" size="70" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-2 control-label" for="input-block_img' + top_link_row + '"><?php echo $text_img; ?></label>';
   html += '<div class="col-sm-10"><a href="" id="thumb-block_img' + top_link_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
   html += '<input type="hidden" name="aridius_navmenu_top_links[' + top_link_row + '][image]" value="" id="input-block_img' + top_link_row + '" />';
   html += '</div>';
   html += '</div>';
   html += '<label class="col-sm-2 control-label" ><?php echo $text_color; ?></label>';
   html += '<div class="ch_color input-group colorpicker-component " title="color">';
   html += '<input type="text" name="aridius_navmenu_top_links[' + top_link_row + '][color]" class="form-control" value="#FF4157" />';
   html += '<span class="input-group-addon"><i></i></span>';
   html += '</div>';
   html += '<label class="col-sm-2 control-label" ><?php echo $text_color_text; ?></label>';
   html += '<div class="ch_color input-group colorpicker-component " title="color">';
   html += '<input type="text" name="aridius_navmenu_top_links[' + top_link_row + '][color_text]" class="form-control" value="#000000" />';
   html += '<span class="input-group-addon"><i></i></span>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-2 control-label" ><?php echo $text_show_popup; ?></label>';
   html += '<div class="col-sm-10">';
   html += '<select name="aridius_navmenu_top_links[' + top_link_row + '][show_popup]" id="input-aridius_navmenu_top_links[' + top_link_row + ']" class="form-control">';
   html += '<option value="1"><?php echo $text_enabled; ?></option>';
   html += '<option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
   html += '</select>';
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-2 control-label" ><?php echo $text_title_popup; ?></label>';
   html += '<div class="col-sm-10">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<input type="text" class="form-control" name="aridius_navmenu_top_links[' + top_link_row + '][title_popup][<?php echo $language['language_id']; ?>]" size="70" />';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-2 control-label" ><?php echo $text_popup_description; ?></label>';
   html += '<div class="col-sm-10">';
   <?php foreach ($languages as $language) { ?>
   html += '<div class="input-group">';
   html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
   html += '<textarea name="aridius_navmenu_top_links[' + top_link_row + '][description_popup][<?php echo $language['language_id']; ?>]" id="description_popup-' + top_link_row + '-<?php echo $language['language_id']; ?>" class="summernote-' + top_link_row + ' form-control"></textarea>';
   html += '</div>';
   <?php } ?>
   html += '</div>';
   html += '</div>';
   html += '<div class="form-group">';
   html += '<label class="col-sm-2 control-label" ><?php echo $text_sort; ?></label>';
   html += '<div class="col-sm-10">';
   html += '<input type="text" class="form-control" name="aridius_navmenu_top_links[' + top_link_row + '][sort]" />';
   html += '</div>';
   html += '</div>';
   html += '</div>';
   html += '</div>';
   $('.tab-content.first7').append(html);
   $('#top_link-add').before('<li><a href="#tab-top_link-' + top_link_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-top_link-' + top_link_row + '\\\']\').parent().remove(); $(\'#tab-top_link-' + top_link_row + '\').remove(); $(\'#top_link a:first\').tab(\'show\');"></i> <?php echo $tab_top_link; ?> ' + top_link_row + '</a></li>');
   <?php if ($ckeditor) { ?>
   <?php foreach ($languages as $language) { ?>
   ckeditorInit('description_popup-' + top_link_row + '-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
   <?php } ?>
   <?php } else { ?>
   $('.summernote-' + top_link_row ).summernote({
   height: 150,   //set editable area's height
   });
   <?php } ?>
   $('#top_link a[href=\'#tab-top_link-' + top_link_row + '\']').tab('show');
   top_link_row++;
   $('.ch_color').colorpicker();
   }
   //-->
</script>
<?php if (!$ckeditor) { ?>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<!-- summernote -->
<script type="text/javascript"><!--
   $('.summernote').summernote({
   height: 150,   //set editable area's height
   });
   //-->
</script>
<?php } ?>
<?php if ($ckeditor) { ?>
<script type="text/javascript"><!--
   <?php $top_link_row = 1; ?>
   <?php foreach ($top_links as $top_link) { ?>
   <?php foreach ($languages as $language) { ?>
   ckeditorInit('description_popup-<?php echo $top_link_row; ?>-<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
   <?php } ?>
   <?php $top_link_row++; ?>
   <?php } ?>
   //-->
</script>
<?php } ?>
<script type="text/javascript"><!--
   function apply() {
   $('#form-aridius_navmenu').append('<input type="hidden" id="apply" name="apply" value="1" />');
   $('#form-aridius_navmenu').submit();
   }
   //-->
</script>
<?php echo $footer; ?>
