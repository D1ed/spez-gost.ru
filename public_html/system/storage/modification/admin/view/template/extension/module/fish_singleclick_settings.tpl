<?php echo $header; ?>
<style type="text/css">
.short{ width:120px;}
.panel{ margin-bottom:0;}
.lead{ margin-bottom:0;}
a{ cursor:pointer;}
#tabs.nav-tabs{ background-color:#eee;}
.main-content{ padding:0 0 0 20px; border-left:1px solid #ddd;}
</style>

<?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
                   <a href="<?php echo $settings_list; ?>" class="btn btn-success"><i class="fa fa-wrench"></i> <?php echo $button_list; ?></a>
					<a onclick="$('#form').submit();" class="btn btn-success"><i class="fa fa-save"></i> <?php echo $button_save; ?></a>

                <?php //Multi Fish Landing 2.3.x Begin ?>
                <?php if ($module_id) { ?>
                    <a onclick="buttonApply();" class="btn btn-success"><i class="fa fa-check"></i> <?php echo $button_apply; ?></a>
                <?php } ?>
                <?php //Multi Fish Landing 2.3.x End ?>
            
          <a onclick="location = '<?php echo $cancel; ?>';" class="btn btn-danger"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-body">


            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">

	<div class="tab-pane">
       <div class="form-group">
				<label class="col-md-2"><?php echo $entry_enabled; ?></label>
				<div class="col-md-10">
				<label class="radio-inline"><input type="radio" name="fish_singleclick_showl" value="1"<?php echo $fish_singleclick_showl ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                <label class="radio-inline"><input type="radio" name="fish_singleclick_showl" value="0"<?php echo !$fish_singleclick_showl ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
				</div>
            </div>
            <hr />

                <?php //Multi Fish Landing 2.3.x Begin ?>
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
                  <label class="col-sm-2 control-label" for="input-logo"><?php echo $entry_logo; ?></label>
                  <div class="col-sm-10">
                    <a href="" id="thumb-logo" data-toggle="image" class="img-thumbnail"><img src="<?php echo $logo; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                    <input type="hidden" name="land_logo" value="<?php echo $land_logo; ?>" id="input-logo" />
                  </div>
                </div>          

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                    <div class="help-block"><?php echo $help_keyword; ?><?php if ($help_url) echo $help_url; ?></div>
                    <?php if ($error_keyword) { ?>
                    <div class="text-danger"><?php echo $error_keyword; ?></div>
                    <?php } ?>
                  </div>
                </div>          

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-meta_title"><?php echo $entry_meta_title; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="meta_title" value="<?php echo $meta_title; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta_title" class="form-control" />
                  </div>
                </div>          

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-meta_description"><?php echo $entry_meta_description; ?></label>
                  <div class="col-sm-10">
                    <textarea name="meta_description" placeholder="<?php echo $entry_meta_description; ?>" rows="5" id="input-meta_description" class="form-control"><?php echo $meta_description; ?></textarea>
                  </div>
                </div>          

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-meta_keyword"><?php echo $entry_meta_keyword; ?></label>
                  <div class="col-sm-10">
                    <textarea name="meta_keyword" placeholder="<?php echo $entry_meta_keyword; ?>" rows="5" id="input-meta_keyword" class="form-control"><?php echo $meta_keyword; ?></textarea>
                  </div>
                </div>          

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-custom_css"><?php echo $entry_custom_css; ?></label>
                  <div class="col-sm-10">
                    <textarea name="custom_css" placeholder="<?php echo $entry_custom_css; ?>" rows="5" id="input-custom_css" class="form-control"><?php echo $custom_css; ?></textarea>
                    <div class="help-block"><?php echo $help_custom_css . $text_lamer; ?></div>
                  </div>
                </div>          

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-custom_js"><?php echo $entry_custom_js; ?></label>
                  <div class="col-sm-10">
                    <textarea name="custom_js" placeholder="<?php echo $entry_custom_js; ?>" rows="5" id="input-custom_js" class="form-control"><?php echo $custom_js; ?></textarea>
                    <div class="help-block"><?php echo $help_custom_js . $text_lamer; ?></div>
                  </div>
                </div>          
                <?php //Multi Fish Landing 2.3.x End ?>
            
     <div class="row">        
    <div class="col-lg-2 col-md-3">
						<ul class="nav nav-pills nav-stacked" id="tabs">
							<li><a href="#tab-1" data-toggle="tab"><?php echo $entry_main; ?></a></li>
                            <li><a href="#tab-1a" data-toggle="tab"><?php echo $entry_form; ?></a></li>
                            <li><a href="#tab-2" data-toggle="tab">1. <?php echo $entry_slider; ?> & <?php echo $entry_contact; ?></a></li>
							<li><a href="#tab-3" data-toggle="tab">2. <?php echo $entry_special; ?></a></li>
                            <li><a href="#tab-4" data-toggle="tab">3. <?php echo $entry_adv; ?></a></li>
                            <li><a href="#tab-5" data-toggle="tab">4. <?php echo $entry_prod; ?></a></li>
                            <li><a href="#tab-5a" data-toggle="tab">4a. <?php echo $entry_prodbd; ?></a></li>
                            <li><a href="#tab-6" data-toggle="tab">5. <?php echo $entry_textblock; ?></a></li>
                            <li><a href="#tab-7" data-toggle="tab">6. <?php echo $entry_reviews; ?></a></li>
                            <li><a href="#tab-8" data-toggle="tab">7. <?php echo $entry_carousel; ?></a></li>
                            <li><a href="#tab-9" data-toggle="tab">8. <?php echo $entry_custombox; ?></a></li>
                            <li><a href="#tab-10" data-toggle="tab">9. <?php echo $entry_contact; ?></a></li>
						</ul>
         </div>
         <div class="col-lg-10 col-md-9">               
		<div class="tab-content main-content">
        <!--Callback//////////////////////////////////////////////////////////////////////////////////-->
        <div class="tab-pane" id="tab-1"> 
        
        <p class="lead"><?php echo $entry_main; ?></p>     
            <div class="form-group">
				<label class="col-lg-3 col-md-4"><?php echo $entry_showmenu; ?></label>
				<div class="col-lg-3 col-md-4">
				<label class="radio-inline"><input type="radio" name="fish_singleclick_showmenu" value="1"<?php echo $fish_singleclick_showmenu ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                <label class="radio-inline"><input type="radio" name="fish_singleclick_showmenu" value="0"<?php echo !$fish_singleclick_showmenu ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
				</div>
            </div> 

             <div class="form-group">
				<label class="col-lg-3 col-md-4"><?php echo $entry_menush; ?></label>
				<div class="col-lg-3 col-md-4">
				<label class="radio-inline"><input type="radio" name="fish_singleclick_showmenu2" value="1"<?php echo $fish_singleclick_showmenu2 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                <label class="radio-inline"><input type="radio" name="fish_singleclick_showmenu2" value="0"<?php echo !$fish_singleclick_showmenu2 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
				</div>
            </div> 
            <label class="control-label"><?php echo $entry_doplink; ?></label><br /><br />
              <div class="row" id="tabs_blockheaderlink">
              
									<div class="col-lg-3"> 

										<ul class="nav nav-pills nav-stacked" id="blockheaderlink">
											<?php $blockheaderlink_row = 1; ?>
											<?php foreach ($fish_singleclick_headerlinks as  $value) { ?>
											<li><a href="#tab-headerlink<?php echo $blockheaderlink_row; ?>" data-toggle="tab" id="addimgheader<?php echo $blockheaderlink_row; ?>">
                                            <i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-headerlink<?php echo $blockheaderlink_row; ?>\']').parent().remove(); $('#tab-headerlink<?php echo $blockheaderlink_row; ?>').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_link; ?> <?php echo $blockheaderlink_row; ?></a></li>
											<?php $blockheaderlink_row++; ?>
											<?php } ?>
											<li>
											<button type="button" onclick="addheaderlinkimg();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $entry_addtext; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-lg-9">
										<div class="tab-content">
											<?php $blockheaderlink_row = 1; ?>
											<?php foreach ($fish_singleclick_headerlinks as $value) { ?>
											<div class="tab-pane" id="tab-headerlink<?php echo $blockheaderlink_row; ?>">
                                            
                                            <div class="form-group"> 
                                   
											<div class="col-lg-6">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="fish_singleclick_headerlink[<?php echo $blockheaderlink_row; ?>][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?>" class="form-control" placeholder="text">
											</div>
											<?php } ?>
											</div>
                                            
                                            <div class="col-lg-6"><br />
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="fish_singleclick_headerlink[<?php echo $blockheaderlink_row; ?>][link][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['link'][$language['language_id']]) ? $value['link'][$language['language_id']] : ''; ?>" class="form-control" placeholder="link">
											</div>
											<?php } ?>
											</div>
                                            
                                             <div class="col-lg-6">
                  <?php 
							$valueq 	= isset($value['blank']) ? $value['blank'] : '0'; 
                            $name = 'fish_singleclick_headerlink['. $blockheaderlink_row .'][blank]'; 
						?>
                         
                         <select name="<?php echo $name; ?>" class="form-control">
						 <option value="0" <?php if ($valueq == 0) { ?>selected="selected"<?php } ?>><?php echo $entry_wind1; ?></option>
						 <option value="1" <?php if ($valueq == 1) { ?>selected="selected"<?php } ?>><?php echo $entry_wind2; ?></option>								
														</select>

         </div>
                                   

											</div>       
                                            
                                            </div>
                                            <?php $blockheaderlink_row++; ?>
                                            <?php } ?>
                                            </div>
                                            </div>                
                  </div>       
              <hr />       

                   <div class="form-group">
                    <div class="lead col-lg-3 col-md-6"><?php echo $entry_style; ?></div>
                <div class="col-md-4">
                <select name="fish_singleclick_style" class="form-control" >
							<option value="0" selected="selected">style 0</option>
							<?php for ( $i = 1; $i <= 2; $i++) { 
                                     
									($fish_singleclick_style == $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>>style <?php echo $i; ?></option>
								<?php } ?>
						</select>
  
                </div>
                </div>          
                 <div class="form-group">  
			<label class="col-lg-6 col-md-6"><?php echo $entry_colormenu; ?> </label>
		<div class="col-lg-6 col-md-6">
                <input type="text" name="fish_singleclick_colormenu" value="<?php echo $fish_singleclick_colormenu; ?>" class="form-control btn-group" id="spectr" />
                </div> 
                </div>
                 <div class="form-group">
                <label class="col-lg-3 col-md-6 "><?php echo $entry_bodyfon; ?> </label>
		<div class="col-lg-3 col-md-6">
                <input type="text" name="fish_singleclick_bodyfon" value="<?php echo $fish_singleclick_bodyfon; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
              </div>
      
                <div class="form-group">
                <label class="col-lg-3 col-md-6"><?php echo $entry_colormenutext; ?> </label>
		<div class="col-lg-3 col-md-6">
                <input type="text" name="fish_singleclick_colormenutext" value="<?php echo $fish_singleclick_colormenutext; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                </div>
                 <div class="form-group">
			<label class="col-lg-3 col-md-6"><?php echo $entry_colorfooter; ?> </label>
		<div class="col-lg-3 col-md-6">
                <input type="text" name="fish_singleclick_colorfooter" value="<?php echo $fish_singleclick_colorfooter; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                 </div>
                 <div class="form-group">
                <label class="col-lg-3 col-md-6"><?php echo $entry_colorfootertext; ?> </label>
		<div class="col-lg-3 col-md-6">
                <input type="text" name="fish_singleclick_colorfootertext" value="<?php echo $fish_singleclick_colorfootertext; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                </div>
         <div class="form-group">
		<label class="col-lg-3 col-md-6"><?php echo $entry_font1; ?></label>
		<div class="col-lg-3 col-md-6">
        		<select name="fish_singleclick_font1" class="form-control">
				<?php foreach ($fonts as $fv => $value) { ?>
				<?php ($fv ==  $fish_singleclick_font1) ? $active = 'selected' : $active=''; ?>
				<option value="<?php echo $fv; ?>" <?php echo $active; ?>><?php echo $value; ?></option>
				<?php } ?>
				</select> 
         </div>
         </div> 
 
         
          <div class="form-group">
		<label class="col-lg-3 col-md-6">H1</label>
		<div class="col-lg-3 col-md-6">
    <select name="fish_singleclick_fonth1_size" class="form-control" >
							<option value="none" selected="selected"></option>
							<?php for ($i = 12; $i <= 60; $i++) { 
									($fish_singleclick_fonth1_size == $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>
								<?php } ?>
						</select>
   </div>
   <div class="col-lg-3 col-md-6">
   <?php $ar = array('Bold' => 0, 'Normal' => 1); $valueq = $fish_singleclick_fonth1_weigh; $name = 'fish_singleclick_fonth1_weigh'; ?>
                  <div class="btn-group" data-toggle="buttons">
                      <?php foreach ($ar as $key => $value) { ?>
                      <?php ($value == $valueq) ? $selected = ' active' : $selected=''; ?>
                      <label for="<?php echo $name . $value; ?>" class="btn <?php echo $selected; ?> btn-default">
                      <input type="radio" id="<?php echo $name . $value; ?>" name="<?php echo $name; ?>" value="<?php echo $value; ?>" <?php if ($valueq == $value) { ?>checked="checked"<?php }?>><?php echo $key; ?></label>
                      <?php } ?>
                  </div>
   </div>
   <div class="col-lg-3 col-md-6">
      <?php $ar = array('Uppercase' => 0, 'None' => 1); $valueq = $fish_singleclick_fonth1_trans; $name = 'fish_singleclick_fonth1_trans'; ?>
                  <div class="btn-group" data-toggle="buttons">
                      <?php foreach ($ar as $key => $value) { ?>
                      <?php ($value == $valueq) ? $selected = ' active' : $selected=''; ?>
                      <label for="<?php echo $name . $value; ?>" class="btn <?php echo $selected; ?> btn-default">
                      <input type="radio" id="<?php echo $name . $value; ?>" name="<?php echo $name; ?>" value="<?php echo $value; ?>" <?php if ($valueq == $value) { ?>checked="checked"<?php }?>><?php echo $key; ?></label>
                      <?php } ?>
                  </div>
                  </div> 
   </div>
   
   <div class="form-group">
		<label class="col-lg-3 col-md-6"><?php echo $entry_title2; ?></label>
		<div class="col-lg-3 col-md-6">
    <select name="fish_singleclick_fonth2_size" class="form-control" >
							<option value="none" selected="selected"></option>
							<?php for ($i = 12; $i <= 60; $i++) { 
									($fish_singleclick_fonth2_size == $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>
								<?php } ?>
						</select>
   </div>
   <div class="col-lg-3 col-md-6">
   <?php $ar = array('Bold' => 0, 'Normal' => 1); $valueq = $fish_singleclick_fonth2_weigh; $name = 'fish_singleclick_fonth2_weigh'; ?>
                  <div class="btn-group" data-toggle="buttons">
                      <?php foreach ($ar as $key => $value) { ?>
                      <?php ($value == $valueq) ? $selected = ' active' : $selected=''; ?>
                      <label for="<?php echo $name . $value; ?>" class="btn <?php echo $selected; ?> btn-default">
                      <input type="radio" id="<?php echo $name . $value; ?>" name="<?php echo $name; ?>" value="<?php echo $value; ?>" <?php if ($valueq == $value) { ?>checked="checked"<?php }?>><?php echo $key; ?></label>
                      <?php } ?>
                  </div>
   </div>
  <div class="col-lg-3 col-md-6">
      <?php $ar = array('Uppercase' => 0, 'None' => 1); $valueq = $fish_singleclick_fonth2_trans; $name = 'fish_singleclick_fonth2_trans'; ?>
                  <div class="btn-group" data-toggle="buttons">
                      <?php foreach ($ar as $key => $value) { ?>
                      <?php ($value == $valueq) ? $selected = ' active' : $selected=''; ?>
                      <label for="<?php echo $name . $value; ?>" class="btn <?php echo $selected; ?> btn-default">
                      <input type="radio" id="<?php echo $name . $value; ?>" name="<?php echo $name; ?>" value="<?php echo $value; ?>" <?php if ($valueq == $value) { ?>checked="checked"<?php }?>><?php echo $key; ?></label>
                      <?php } ?>
                  </div>
                  </div>  
   </div> 
   <div class="form-group">
		<label class="col-lg-3 col-md-6"><?php echo $entry_title3; ?></label>
		<div class="col-lg-3 col-md-6">
    <select name="fish_singleclick_fonth3_size" class="form-control" >
							<option value="none" selected="selected"></option>
							<?php for ($i = 12; $i <= 60; $i++) { 
									($fish_singleclick_fonth3_size == $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>
								<?php } ?>
						</select>
   </div>
  <div class="col-lg-3 col-md-6">
   <?php $ar = array('Normal' => 0, 'Bold' => 1); $valueq = $fish_singleclick_fonth3_weigh; $name = 'fish_singleclick_fonth3_weigh'; ?>
                  <div class="btn-group" data-toggle="buttons">
                      <?php foreach ($ar as $key => $value) { ?>
                      <?php ($value == $valueq) ? $selected = ' active' : $selected=''; ?>
                      <label for="<?php echo $name . $value; ?>" class="btn <?php echo $selected; ?> btn-default">
                      <input type="radio" id="<?php echo $name . $value; ?>" name="<?php echo $name; ?>" value="<?php echo $value; ?>" <?php if ($valueq == $value) { ?>checked="checked"<?php }?>><?php echo $key; ?></label>
                      <?php } ?>
                  </div>
   </div>
   <div class="col-lg-3 col-md-6">
      <?php $ar = array('Uppercase' => 0, 'None' => 1); $valueq = $fish_singleclick_fonth3_trans; $name = 'fish_singleclick_fonth3_trans'; ?>
                  <div class="btn-group" data-toggle="buttons">
                      <?php foreach ($ar as $key => $value) { ?>
                      <?php ($value == $valueq) ? $selected = ' active' : $selected=''; ?>
                      <label for="<?php echo $name . $value; ?>" class="btn <?php echo $selected; ?> btn-default">
                      <input type="radio" id="<?php echo $name . $value; ?>" name="<?php echo $name; ?>" value="<?php echo $value; ?>" <?php if ($valueq == $value) { ?>checked="checked"<?php }?>><?php echo $key; ?></label>
                      <?php } ?>
                  </div>
                  </div>  
   </div> 
              <div class="form-group">
		<label class="col-lg-3 col-md-6"><?php echo $entry_font2; ?></label>
		<div class="col-lg-3 col-md-6">
        		<select name="fish_singleclick_font2" class="form-control">
				<?php foreach ($fonts as $fv => $value) { ?>
				<?php ($fv ==  $fish_singleclick_font2) ? $active = 'selected' : $active=''; ?>
				<option value="<?php echo $fv; ?>" <?php echo $active; ?>><?php echo $value; ?></option>
				<?php } ?>
				</select> 
         </div>
         <div class="col-lg-3 col-md-6">
    <select name="fish_singleclick_fontbody_size" class="form-control" >
							<option value="none" selected="selected"></option>
							<?php for ($i = 12; $i <= 60; $i++) { 
									($fish_singleclick_fontbody_size == $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>
								<?php } ?>
						</select>
   </div>
   
         </div>                    
                
  
              </div>
              
     <!--Callback//////////////////////////////////////////////////////////////////////////////////-->
        <div class="tab-pane" id="tab-1a">
          <p class="lead"><?php echo $entry_form; ?></p>          
              <div class="form-group">
                <label class="col-lg-3"><?php echo $entry_capcha; ?></label>
                <div class="col-lg-9">
                  <label class="radio-inline"><input type="radio" name="fish_singleclick_capcha" value="1"<?php echo $fish_singleclick_capcha ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                 
                  <label class="radio-inline"><input type="radio" name="fish_singleclick_capcha" value="0"<?php echo !$fish_singleclick_capcha ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
                  <span class="help-block"><?php echo $help_capcha; ?></span>
                </div>
                </div>
              <div class="form-group">
                <label class="col-lg-3" for="input-phone_mask"><?php echo $entry_phone_mask; ?></label>
                <div class="col-lg-9">
                  <input type="text" name="fish_singleclick_phone_mask" value="<?php echo $fish_singleclick_phone_mask; ?>"
                         placeholder="<?php echo $placeholder_phone_mask; ?>" id="input-phone_mask" class="form-control" />
                  <span class="help-block"><?php echo $help_phone_mask; ?></span>
                </div>
                </div>
                <div class="form-group">

                <label class="col-lg-3" for="input-order-status"><?php echo $entry_default_order_status; ?></label>
                <div class="col-lg-9">
                  <select name="fish_singleclick_default_order_status" id="input-order-status" class="form-control">
                    <?php foreach ($order_statuses as $order_status) { ?>
                    <?php if ($order_status['order_status_id'] == $fish_singleclick_default_order_status) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                  <span class="help-block"><?php echo $help_default_order_status; ?></span>
                </div>
              </div>
              <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_agree; ?></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_rultext<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_rultext][<?php echo $language['language_id']; ?>]" class="form-control summernote"><?php echo isset($fish_singleclicks['fish_singleclick_rultext'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_rultext'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div> 
        
         
        </div>          
        
        <!--Contacts//////////////////////////////////////////////////////////////////////////////////--> 
		<div class="tab-pane" id="tab-2"> 
        <p class="lead"><?php echo $entry_contact; ?></p>
        
                          <div class="form-group">
							<label class="col-lg-3"><?php echo $entry_menu; ?></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<textarea name="fish_singleclick[fish_singleclick_menu1][<?php echo $language['language_id']; ?>]" rows="2" class="form-control" placeholder="Главная"><?php echo isset($fish_singleclicks['fish_singleclick_menu1'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_menu1'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div>
        
        			<div class="form-group">
									<label class="col-lg-3"><?php echo $entry_phone; ?><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
									<div class="col-lg-9">
									<textarea id="fish_singleclick_phone" name="fish_singleclick[fish_singleclick_phone]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_phone']) ? $fish_singleclicks['fish_singleclick_phone'] : ''; ?></textarea>
					
									</div>
								</div>
                                
              

           					<div class="form-group">
							<label class="col-lg-3"><?php echo $entry_contact; ?><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<textarea id="fish_singleclick_topcontact<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_topcontact][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_topcontact'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_topcontact'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div>
                                
         <p class="lead"><?php echo $entry_textslider; ?></p>   
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_text; ?>, H1<br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_toptext1<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_toptext1][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_toptext1'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_toptext1'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>
        
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_text; ?>, H2<br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_toptext2<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_toptext2][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_toptext2'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_toptext2'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>        
        
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_text; ?> 3<br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_toptext3<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_toptext3][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_toptext3'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_toptext3'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>                              
                                
         <p class="lead"><?php echo $entry_slider; ?></p>                       
        <div class="form-group">
        <label class="col-lg-3 col-md-3"><?php echo $entry_speed; ?></label>
		<div class="col-lg-3 col-md-3">
							<input name="fish_singleclick[fish_singleclick_speed]" class="form-control" value="<?php echo isset($fish_singleclicks['fish_singleclick_speed']) ? $fish_singleclicks['fish_singleclick_speed'] : ''; ?>" placeholder="10"/>	
		</div>
        </div>
         <div class="form-group">
         <label class="col-lg-3"><?php echo $entry_size; ?></label>
        <div class="col-lg-9">
							<input name="fish_singleclick[fish_slider_width]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_slider_width']) ? $fish_singleclicks['fish_slider_width'] : ''; ?>" placeholder="1920"/> x <input name="fish_singleclick[fish_slider_height]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_slider_height']) ? $fish_singleclicks['fish_slider_height'] : ''; ?>" placeholder="650"/>	
		</div>
		</div>
                        
               <div class="row" id="tabs_blockslider">
									<div class="col-lg-12">
										<ul class="nav nav-tabs" id="blockslider">
											<?php $blockslider_row = 1; ?>
											<?php foreach ($fish_singleclick_imgs as  $value) { ?>
											<li><a href="#tab-slider<?php echo $blockslider_row; ?>" data-toggle="tab" id="addimg<?php echo $blockslider_row; ?>">
                                            <i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-slider<?php echo $blockslider_row; ?>\']').parent().remove(); $('#tab-slider<?php echo $blockslider_row; ?>').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_image; ?> <?php echo $blockslider_row; ?></a></li>
											<?php $blockslider_row++; ?>
											<?php } ?>
											<li>
											<button type="button" onclick="addSliderimg();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $entry_addtext; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-lg-10 col-md-9">
										<div class="tab-content">
											<?php $blockslider_row = 1; ?>
											<?php foreach ($fish_singleclick_imgs as $value) { ?>
											<div class="tab-pane" id="tab-slider<?php echo $blockslider_row; ?>">
                                            
                                            <div class="form-group">
											<label class="col-lg-3 col-md-3"><?php echo $entry_image; ?></label>
											<div class="col-lg-3 col-md-9">
											<a href="" id="fish_singleclick_imgs_thumb<?php echo $blockslider_row; ?>" data-toggle="image" class="img-thumbnail">
                                            <img src="<?php echo $value['thumb']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a>
                                            <input type="hidden" name="fish_singleclick_img[<?php echo $blockslider_row; ?>][image]" value="<?php echo $value['image']; ?>" id="fish_singleclick_imgs_image_input<?php echo $blockslider_row; ?>" />
											</div>
                                   
											</div>       
                                            
                                            </div>
                                            <?php $blockslider_row++; ?>
                                            <?php } ?>
                                            </div>
                                            </div>                
                  </div>
                  
                  
                                
            
            
            </div>  
            
             <!--Sale//////////////////////////////////////////////////////////////////////////////////-->
            <div class="tab-pane" id="tab-3"> 
            <p class="lead">2. <?php echo $entry_special; ?></p> 
            <div class="form-group">
				<label class="col-lg-3"><?php echo $entry_enabled; ?></label>
				<div class="col-lg-9">
				<label class="radio-inline"><input type="radio" name="fish_singleclick_showsale" value="1"<?php echo $fish_singleclick_showsale ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                <label class="radio-inline"><input type="radio" name="fish_singleclick_showsale" value="0"<?php echo !$fish_singleclick_showsale ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
				</div>
            </div>
                              <div class="form-group">
							<label class="col-lg-3"><?php echo $entry_menu; ?></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
						<textarea name="fish_singleclick[fish_singleclick_menu2][<?php echo $language['language_id']; ?>]" rows="2" class="form-control" placeholder=""><?php echo isset($fish_singleclicks['fish_singleclick_menu2'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_menu2'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div> 
                            
             <div class="form-group">
			<label class="col-lg-3"><?php echo $entry_image60; ?></label>
			<div class="col-lg-9">
			<a href="" id="fish_singleclick_img_salethumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $fish_singleclick_img_salethumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="fish_singleclick_img_sale" value="<?php echo $fish_singleclick_img_sale; ?>" id="fish_singleclick_img_sale_input" />
			</div> 
            </div> 
            
           <p class="lead"><?php echo $entry_specialtext; ?></p>  
              
            <div class="form-group">
			<label class="col-lg-3 col-md-12"><?php echo $entry_fonbox; ?> </label>
			<div class="col-lg-3 col-md-12">
			<a href="" id="fish_singleclick_imgfon_salethumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $fish_singleclick_imgfon_salethumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="fish_singleclick_imgfon_sale" value="<?php echo $fish_singleclick_imgfon_sale; ?>" id="fish_singleclick_imgfon_sale_input" />
			</div> 
				
				<div class="col-lg-3 col-md-6"><label class="control-label"><?php echo $entry_colorbox; ?></label><br />
                <input type="text" name="fish_singleclick_colorsale" value="<?php echo $fish_singleclick_colorsale; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div> 
				
				<div class="col-lg-3 col-md-6">
                 <label class="control-label"><?php echo $entry_colortext; ?></label><br />
                <input type="text" name="fish_singleclick_colorsaletext" value="<?php echo $fish_singleclick_colorsaletext; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                </div>

       
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_title; ?><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_saletext1<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_saletext1][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_saletext1'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_saletext1'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>
        
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_text; ?> 2<br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_saletext2<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_saletext2][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_saletext2'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_saletext2'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>        
        
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_text; ?> 3<br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_saletext3<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_saletext3][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_saletext3'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_saletext3'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div> 
        <div class="form-group">
				<label class="col-lg-3"><?php echo $entry_enabled; ?> <?php echo $entry_timer; ?></label>
				<div class="col-lg-4">
				<label class="radio-inline"><input type="radio" name="fish_singleclick_showsale2" value="1"<?php echo $fish_singleclick_showsale2 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                <label class="radio-inline"><input type="radio" name="fish_singleclick_showsale2" value="0"<?php echo !$fish_singleclick_showsale2 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
				</div>
            </div> 
        
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_time; ?></label>
		<div class="col-lg-3">
        <?php
        $year = array('2017', '2018', '2019', '2020', '2021');
        ?>
        Год
        		<select name="fish_singleclick_year" class="form-control">
				<?php foreach ($year as $value) { ?>
				<?php ($value ==  $fish_singleclick_year) ? $active = 'selected' : $active=''; ?>
				<option value="<?php echo $value; ?>" <?php echo $active; ?>><?php echo $value; ?></option>
				<?php } ?>
				</select> 
         </div>
         <div class="col-lg-3">
        Месяц
                 <select name="fish_singleclick_month" class="form-control" >
							<option value="0" selected="selected">1</option>
							<?php for ($i = 1; $i <= 11; $i++) { 
                             $y = ($i + 1) ;
									($fish_singleclick_month == $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $y; ?></option>
								<?php } ?>
						</select>
         </div>
         <div class="col-lg-3">
        День
            <select name="fish_singleclick_day" class="form-control" >
							<option value="1" selected="selected">1</option>
							<?php for ( $i = 2; $i <= 31; $i++) { 
                                     
									($fish_singleclick_day == $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>
								<?php } ?>
						</select>
         </div>
         </div>
         
     </div>    
     <!--Advantages//////////////////////////////////////////////////////////////////////////////////-->
            <div class="tab-pane" id="tab-4"> 
            <p class="lead">3. <?php echo $entry_adv; ?></p> 
            <div class="form-group">
				<label class="col-lg-3"><?php echo $entry_enabled; ?></label>
				<div class="col-lg-9">
				<label class="radio-inline"><input type="radio" name="fish_singleclick_showadv" value="1"<?php echo $fish_singleclick_showadv ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                <label class="radio-inline"><input type="radio" name="fish_singleclick_showadv" value="0"<?php echo !$fish_singleclick_showadv ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
				</div>
            </div>
                              <div class="form-group">
							<label class="col-lg-3"><?php echo $entry_menu; ?></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<textarea name="fish_singleclick[fish_singleclick_menu3][<?php echo $language['language_id']; ?>]" rows="2" class="form-control" placeholder=""><?php echo isset($fish_singleclicks['fish_singleclick_menu3'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_menu3'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div>
            <div class="form-group">
			<label class="col-lg-3 col-md-12"><?php echo $entry_fonbox; ?> </label>
			<div class="col-lg-3 col-md-12">
			<a href="" id="fish_singleclick_img_advthumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $fish_singleclick_img_advthumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="fish_singleclick_img_adv" value="<?php echo $fish_singleclick_img_adv; ?>" id="fish_singleclick_imgfon_adv_input" />
			</div> 
				
				<div class="col-lg-3 col-md-6"><label class="control-label"><?php echo $entry_colorbox; ?></label><br />
                <input type="text" name="fish_singleclick_coloradv" value="<?php echo $fish_singleclick_coloradv; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                
				<div class="col-lg-3 col-md-6"><label class="control-label"><?php echo $entry_colortext; ?></label><br>
                <input type="text" name="fish_singleclick_coloradvtext" value="<?php echo $fish_singleclick_coloradvtext; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                </div>
                
           
           
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_title; ?><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_advtext<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_advtext][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_advtext'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_advtext'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>
        
    <div class="form-group">
    <label class="col-lg-3"><?php echo $entry_size; ?></label>
    <div class="col-lg-9">
							<input name="fish_singleclick[fish_adv_width]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_adv_width']) ? $fish_singleclicks['fish_adv_width'] : ''; ?>" placeholder="60"/> x <input name="fish_singleclick[fish_adv_height]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_adv_height']) ? $fish_singleclicks['fish_adv_height'] : ''; ?>" placeholder="60"/>	
		</div>
		</div>
                        
               <div class="row" id="tabs_blockadv">
									<div class="col-lg-12">
										<ul class="nav nav-tabs" id="blockadv">
											<?php $blockadv_row = 1; ?>
											<?php foreach ($fish_singleclick_advs as  $value) { ?>
											<li><a href="#tab-adv<?php echo $blockadv_row; ?>" data-toggle="tab" id="addimgadv<?php echo $blockadv_row; ?>">
                                            <i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-adv<?php echo $blockadv_row; ?>\']').parent().remove(); $('#tab-adv<?php echo $blockadv_row; ?>').remove();"  title="<?php echo $button_remove; ?>"></i> <?php echo $entry_text; ?> <?php echo $blockadv_row; ?></a></li>
											<?php $blockadv_row++; ?>
											<?php } ?>
											<li>
											<button type="button" onclick="addAdvimg();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $entry_addtext; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-lg-12">
										<div class="tab-content">
											<?php $blockadv_row = 1; ?>
											<?php foreach ($fish_singleclick_advs as $value) { ?>
											<div class="tab-pane" id="tab-adv<?php echo $blockadv_row; ?>">
                                            
                                            <div class="form-group">
											<label class="col-lg-2"><?php echo $entry_image; ?></label>
											<div class="col-lg-2">
											<a href="" id="fish_singleclick_advs_thumb<?php echo $blockadv_row; ?>" data-toggle="image" class="img-thumbnail">
                                            <img src="<?php echo $value['thumb']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a>
                                            <input type="hidden" name="fish_singleclick_adv[<?php echo $blockadv_row; ?>][image]" value="<?php echo $value['image']; ?>" id="fish_singleclick_advs_image_input<?php echo $blockadv_row; ?>" />
											</div>
                                   
											<div class="col-lg-8">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="fish_singleclick_adv[<?php echo $blockadv_row; ?>][text][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?></textarea>
											</div>
											<?php } ?>
											</div>
											</div>       
                                            
                                            </div>
                                            <?php $blockadv_row++; ?>
                                            <?php } ?>
                                            </div>
                                            </div>                
                  </div>
                  
     </div>             
                      
  <!--Products//////////////////////////////////////////////////////////////////////////////////-->
            <div class="tab-pane" id="tab-5"> 
            <p class="lead">4. <?php echo $entry_prod; ?></p>  
            <div class="form-group">
				<label class="col-lg-3"><?php echo $entry_enabled; ?></label>
				<div class="col-lg-4">
				<label class="radio-inline"><input type="radio" name="fish_singleclick_showprod" value="1"<?php echo $fish_singleclick_showprod ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                <label class="radio-inline"><input type="radio" name="fish_singleclick_showprod" value="0"<?php echo !$fish_singleclick_showprod ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
				</div>
            </div> 
                              <div class="form-group">
							<label class="col-lg-3"><?php echo $entry_menu; ?></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<textarea name="fish_singleclick[fish_singleclick_menu4][<?php echo $language['language_id']; ?>]" rows="2" class="form-control" placeholder=""><?php echo isset($fish_singleclicks['fish_singleclick_menu4'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_menu4'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div>
              <div class="form-group">
			<label class="col-lg-3 col-md-12"><?php echo $entry_fonbox; ?> </label>
			<div class="col-lg-3 col-md-12">
			<a href="" id="fish_singleclick_img_prodthumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $fish_singleclick_img_prodthumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="fish_singleclick_img_prod" value="<?php echo $fish_singleclick_img_prod; ?>" id="fish_singleclick_imgfon_prod_input" />
			</div> 

				
				<div class="col-lg-3 col-md-6"><label class="control-label"><?php echo $entry_colorbox; ?></label><br />
                <input type="text" name="fish_singleclick_colorprod" value="<?php echo $fish_singleclick_colorprod; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                  
				<div class="col-lg-3 col-md-6"><label class="control-label"><?php echo $entry_colortext; ?></label><br />
                <input type="text" name="fish_singleclick_colorprodtext" value="<?php echo $fish_singleclick_colorprodtext; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                </div>
                
          

           
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_title; ?><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_prodtext<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_prodtext][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_prodtext'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_prodtext'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>
        
      <p class="lead"><?php echo $entry_images; ?></p>    
         <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_colcol; ?></label>
		<div class="col-lg-3">
         <select name="fish_singleclick_column" class="form-control" >
							<option value="1" selected="selected">1</option>
							<?php for ( $i = 2; $i <= 4; $i++) { 
                                     
									($fish_singleclick_column == $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>
								<?php } ?>
						</select>
         </div>
         </div>
        
     
         
    <div class="form-group">
    <label class="col-lg-3"><?php echo $entry_size; ?></label>
    <div class="col-lg-9">
							<input name="fish_singleclick[fish_prod_width]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_prod_width']) ? $fish_singleclicks['fish_prod_width'] : ''; ?>" placeholder="260"/> x <input name="fish_singleclick[fish_prod_height]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_prod_height']) ? $fish_singleclicks['fish_prod_height'] : ''; ?>" placeholder="260"/>	
		</div>
		</div>
        
         
                        
               <div class="row" id="tabs_blockprod">
									<div class="col-lg-12 ">
										<ul class="nav nav-tabs" id="blockprod">
											<?php $blockprod_row = 1; ?>
											<?php foreach ($fish_singleclick_prods as  $value) { ?>
											<li><a href="#tab-prod<?php echo $blockprod_row; ?>" data-toggle="tab" id="addimgprod<?php echo $blockprod_row; ?>">
                                            <i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-prod<?php echo $blockprod_row; ?>\']').parent().remove(); $('#tab-prod<?php echo $blockprod_row; ?>').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_image; ?> <?php echo $blockprod_row; ?></a></li>
											<?php $blockprod_row++; ?>
											<?php } ?>
											<li>
											<button type="button" onclick="addprodimg();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $entry_addtext; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-lg-12">
										<div class="tab-content">
											<?php $blockprod_row = 1; ?>
											<?php foreach ($fish_singleclick_prods as $value) { ?>
											<div class="tab-pane" id="tab-prod<?php echo $blockprod_row; ?>">
                                            
                                            <div class="form-group">
											<label class="col-lg-2 col-md-3"><?php echo $entry_image; ?></label>
											<div class="col-lg-2 col-md-9">
											<a href="" id="fish_singleclick_prods_thumb<?php echo $blockprod_row; ?>" data-toggle="image" class="img-thumbnail">
                                            <img src="<?php echo $value['thumb']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a>
                                            <input type="hidden" name="fish_singleclick_prod[<?php echo $blockprod_row; ?>][image]" value="<?php echo $value['image']; ?>" id="fish_singleclick_prods_image_input<?php echo $blockprod_row; ?>" />           </div>
                                            </div>
                                            <div class="form-group">
                                                 <label class="col-lg-2 col-md-3"><?php echo $entry_price; ?></label>
											<div class="col-lg-2 col-md-9">
										
											<input type="text" name="fish_singleclick_prod[<?php echo $blockprod_row; ?>][price]" value="<?php echo isset($value['price']) ? $value['price']: ''; ?>" class="form-control">
							
											</div>
											</div>
                                            <div class="form-group">
                                            <label class="col-lg-2"><?php echo $entry_text; ?></label>
											<div class="col-lg-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="fish_singleclick_prod[<?php echo $blockprod_row; ?>][text][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?></textarea>
											</div>
											<?php } ?>
											</div>
											</div> 
                            
                                            
                                           <div class="form-group">
                                            <label class="col-lg-2"><?php echo $entry_popaptext; ?></label>  
											<div class="col-lg-10"> 
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="fish_singleclick_prod[<?php echo $blockprod_row; ?>][popaptext][<?php echo $language['language_id']; ?>]" class="form-control summernote"><?php echo isset($value['popaptext'][$language['language_id']]) ? $value['popaptext'][$language['language_id']] : ''; ?></textarea>
											</div>
											<?php } ?>
											</div>
											</div>  
                                                  
                                            
                                            </div>
                                            <?php $blockprod_row++; ?>
                                            <?php } ?>
                                            </div>
                                            </div>                
                  </div>      
                </div>
   <!--Products BD//////////////////////////////////////////////////////////////////////////////////-->
            <div class="tab-pane" id="tab-5a"> 
            <p class="lead">4a. <?php echo $entry_prodbd; ?></p>  
            <div class="form-group">
				<label class="col-lg-3"><?php echo $entry_enabled; ?></label>
				<div class="col-lg-9">
				<label class="radio-inline"><input type="radio" name="fish_singleclick_showproda" value="1"<?php echo $fish_singleclick_showproda ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                <label class="radio-inline"><input type="radio" name="fish_singleclick_showproda" value="0"<?php echo !$fish_singleclick_showproda ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
				</div>
            </div> 
                              <div class="form-group">
							<label class="col-lg-3"><?php echo $entry_menu; ?></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<textarea name="fish_singleclick[fish_singleclick_menu4a][<?php echo $language['language_id']; ?>]" rows="2" class="form-control" placeholder=""><?php echo isset($fish_singleclicks['fish_singleclick_menu4a'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_menu4a'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div>
           <div class="form-group">
			<label class="col-lg-3 col-md-12"><?php echo $entry_fonbox; ?> </label>
			<div class="col-lg-3 col-md-12">
			<a href="" id="fish_singleclick_img_prodthumba" data-toggle="image" class="img-thumbnail"><img src="<?php echo $fish_singleclick_img_prodthumba; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="fish_singleclick_img_proda" value="<?php echo $fish_singleclick_img_proda; ?>" id="fish_singleclick_imgfon_prod_inputa" />
			</div> 
				
				<div class="col-lg-3 col-md-6"><label class="control-label"><?php echo $entry_colorbox; ?></label><br />
                <input type="text" name="fish_singleclick_colorproda" value="<?php echo $fish_singleclick_colorproda; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                  
				<div class="col-lg-3 col-md-6"><label class="control-label"><?php echo $entry_colortext; ?></label><br />
                <input type="text" name="fish_singleclick_colorprodtexta" value="<?php echo $fish_singleclick_colorprodtexta; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                </div>
                
            

           
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_title; ?><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_prodtext<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_prodtexta][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_prodtexta'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_prodtexta'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>
        
     <p class="lead"><?php echo $entry_images; ?></p>     
         <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_colcol; ?></label>
		<div class="col-lg-3">
         <select name="fish_singleclick_columna" class="form-control" >
							<option value="1" selected="selected">1</option>
							<?php for ( $i = 2; $i <= 4; $i++) { 
                                     
									($fish_singleclick_columna == $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>
								<?php } ?>
						</select>
         </div>
         </div>
        
           
    <div class="form-group">
    <label class="col-lg-3"><?php echo $entry_size; ?></label>
    <div class="col-lg-9">
							<input name="fish_singleclick[fish_prod_widtha]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_prod_widtha']) ? $fish_singleclicks['fish_prod_widtha'] : ''; ?>" placeholder="260"/> x <input name="fish_singleclick[fish_prod_heighta]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_prod_heighta']) ? $fish_singleclicks['fish_prod_heighta'] : ''; ?>" placeholder="260"/>	
		</div>
		</div>
        
       <div class="form-group">
            <label class="col-lg-3" for="input-product"><span data-toggle="tooltip" title="<?php echo $help_product; ?>"><?php echo $entry_product; ?></span></label>
            <div class="col-lg-9">
              <input type="text" name="fish_singleclick_product_name" value="" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
              <div id="featured-product" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($fish_singleclick_products as $fish_singleclick_product) { ?>
                <div id="featured-product<?php echo $fish_singleclick_product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $fish_singleclick_product['name']; ?>
                  <input type="hidden" name="fish_singleclick_product[]" value="<?php echo $fish_singleclick_product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
          </div>  
        
        
   </div>            
   <!--Products//////////////////////////////////////////////////////////////////////////////////-->
            <div class="tab-pane" id="tab-6"> 
            <p class="lead">5. <?php echo $entry_textblock; ?></p>
                              <div class="form-group">
							<label class="col-lg-3"><?php echo $entry_menu; ?></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<textarea name="fish_singleclick[fish_singleclick_menu5][<?php echo $language['language_id']; ?>]" rows="2" class="form-control" placeholder=""><?php echo isset($fish_singleclicks['fish_singleclick_menu5'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_menu5'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div> 
       <div class="form-group">
                <label class="col-lg-3 col-md-3"><?php echo $entry_colorbox; ?> </label>
		<div class="col-lg-3 col-md-3">
                <input type="text" name="fish_singleclick_colortextbox" value="<?php echo $fish_singleclick_colortextbox; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                </div>                      
            
     <div class="form-group">
     <label class="col-lg-3"><?php echo $entry_size; ?></label>
    <div class="col-lg-9">
							<input name="fish_singleclick[fish_box_width]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_box_width']) ? $fish_singleclicks['fish_box_width'] : ''; ?>" placeholder="1000"/> x <input name="fish_singleclick[fish_box_height]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_box_height']) ? $fish_singleclicks['fish_box_height'] : ''; ?>" placeholder="600"/>	
		</div>
		</div>
        
        <div class="row" id="tabs_blockbox">
									<div class="col-lg-12 ">
										<ul class="nav nav-tabs" id="blockbox">
											<?php $blockbox_row = 1; ?>
											<?php foreach ($fish_singleclick_boxs as  $value) { ?>
											<li><a href="#tab-box<?php echo $blockbox_row; ?>" data-toggle="tab" id="addimgbox<?php echo $blockbox_row; ?>">
                                            <i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-box<?php echo $blockbox_row; ?>\']').parent().remove(); $('#tab-box<?php echo $blockbox_row; ?>').remove();"  title="<?php echo $button_remove; ?>"></i> <?php echo $entry_box; ?> <?php echo $blockbox_row; ?></a></li>
											<?php $blockbox_row++; ?>
											<?php } ?>
											<li>
											<button type="button" onclick="addboximg();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $entry_addtext; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-lg-12">
										<div class="tab-content">
											<?php $blockbox_row = 1; ?>
											<?php foreach ($fish_singleclick_boxs as $value) { ?>
											<div class="tab-pane" id="tab-box<?php echo $blockbox_row; ?>">
                                            
                                            <div class="form-group">
											<label class="col-lg-2 col-md-3"><?php echo $entry_image; ?></label>
											<div class="col-lg-2 col-md-9">
											<a href="" id="fish_singleclick_boxs_thumb<?php echo $blockbox_row; ?>" data-toggle="image" class="img-thumbnail">
                                            <img src="<?php echo $value['thumb']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a>
                                            <input type="hidden" name="fish_singleclick_box[<?php echo $blockbox_row; ?>][image]" value="<?php echo $value['image']; ?>" id="fish_singleclick_boxs_image_input<?php echo $blockbox_row; ?>" />           </div>
											</div>
                                            <div class="form-group">
                                            <label class="col-lg-2"><?php echo $entry_title; ?><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
											<div class="col-lg-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="fish_singleclick_box[<?php echo $blockbox_row; ?>][text][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?></textarea>
											</div>
											<?php } ?>
											</div>
											</div> 
                                            
                                           <div class="form-group">
                                            <label class="col-lg-2"><?php echo $entry_text; ?> 1<br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>  
											<div class="col-lg-10"> 
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="fish_singleclick_box[<?php echo $blockbox_row; ?>][mdtext][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($value['mdtext'][$language['language_id']]) ? $value['mdtext'][$language['language_id']] : ''; ?></textarea>
											</div>
											<?php } ?>
											</div>
											</div>
                                            
                                            <div class="form-group">
                                            <label class="col-lg-2"><?php echo $entry_text; ?> 2</label>  
											<div class="col-lg-10"> 
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="fish_singleclick_box[<?php echo $blockbox_row; ?>][smtext][<?php echo $language['language_id']; ?>]" class="form-control summernote"><?php echo isset($value['smtext'][$language['language_id']]) ? $value['smtext'][$language['language_id']] : ''; ?></textarea>
											</div>
											<?php } ?>
											</div>
											</div> 
                                            
                                            <div class="form-group">
                                            <label class="col-lg-2"><?php echo $entry_video; ?></label>  
											<div class="col-lg-10"> 
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="fish_singleclick_box[<?php echo $blockbox_row; ?>][overtext][<?php echo $language['language_id']; ?>]" class="form-control summernote"><?php echo isset($value['overtext'][$language['language_id']]) ? $value['overtext'][$language['language_id']] : ''; ?></textarea>
											</div>
											<?php } ?>
											</div>
											</div>  
                                                  
                                            
                                            </div>
                                            <?php $blockbox_row++; ?>
                                            <?php } ?>
                                            </div>
                                            </div>                
                  </div>  
      
      </div>
      
       <!--reviews//////////////////////////////////////////////////////////////////////////////////-->
            <div class="tab-pane" id="tab-7"> 
            <p class="lead">6. <?php echo $entry_reviews; ?></p> 
            <div class="form-group">
				<label class="col-lg-3"><?php echo $entry_enabled; ?></label>
				<div class="col-lg-9">
				<label class="radio-inline"><input type="radio" name="fish_singleclick_showreview" value="1"<?php echo $fish_singleclick_showreview ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                <label class="radio-inline"><input type="radio" name="fish_singleclick_showreview" value="0"<?php echo !$fish_singleclick_showreview ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
				</div>
            </div>
                              <div class="form-group">
							<label class="col-lg-3"><?php echo $entry_menu; ?></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<textarea name="fish_singleclick[fish_singleclick_menu6][<?php echo $language['language_id']; ?>]" rows="2" class="form-control" placeholder=""><?php echo isset($fish_singleclicks['fish_singleclick_menu6'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_menu6'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div>
         <p class="lead"><?php echo $entry_title; ?></p>                      
                         
            <div class="form-group">
			<label class="col-lg-3 col-md-12"><?php echo $entry_fonbox; ?> </label>
			<div class="col-lg-3 col-md-12">
			<a href="" id="fish_singleclick_img_reviewthumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $fish_singleclick_img_reviewthumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="fish_singleclick_img_review" value="<?php echo $fish_singleclick_img_review; ?>" id="fish_singleclick_imgfon_review_input" />
			</div> 
				
				<div class="col-lg-3 col-md-6"><label class="control-label"><?php echo $entry_colorbox; ?></label><br />
                <input type="text" name="fish_singleclick_colorreview" value="<?php echo $fish_singleclick_colorreview; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                <div class="col-lg-3 col-md-6">
                <label class="control-label"><?php echo $entry_colortext; ?></label><br />
                <input type="text" name="fish_singleclick_colorreviewtext" value="<?php echo $fish_singleclick_colorreviewtext; ?>" class="form-control btn-group color {required:false,hash:true}" /><br /><br />
                </div>
        </div>
         <div class="form-group">
        <label class="col-lg-3 col-md-3"><?php echo $entry_title; ?><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-md-9">
        <?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_reviewtext<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_reviewtext][<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_reviewtext'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_reviewtext'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>
         
            
         <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_colcol; ?></label>
		<div class="col-lg-3">
         <select name="fish_singleclick_columnreview" class="form-control" >
							<option value="1" selected="selected">1</option>
							<?php for ( $i = 2; $i <= 4; $i++) { 
                                     
									($fish_singleclick_columnreview == $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>
								<?php } ?>
						</select>
         </div>
         </div>
      
    <div class="form-group">
    <label class="col-lg-3"><?php echo $entry_size; ?></label>
    <div class="col-lg-9">
							<input name="fish_singleclick[fish_review_width]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_review_width']) ? $fish_singleclicks['fish_review_width'] : ''; ?>" placeholder="90"/> x <input name="fish_singleclick[fish_review_height]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_review_height']) ? $fish_singleclicks['fish_review_height'] : ''; ?>" placeholder="90"/>	
		</div>
		</div>
        
         
                        
               <div class="row" id="tabs_blockreview">
									<div class="col-lg-12 ">
										<ul class="nav nav-tabs" id="blockreview">
											<?php $blockreview_row = 1; ?>
											<?php foreach ($fish_singleclick_reviews as  $value) { ?>
											<li><a href="#tab-review<?php echo $blockreview_row; ?>" data-toggle="tab" id="addimgreview<?php echo $blockreview_row; ?>">
                                            <i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-review<?php echo $blockreview_row; ?>\']').parent().remove(); $('#tab-review<?php echo $blockreview_row; ?>').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_review; ?> <?php echo $blockreview_row; ?></a></li>
											<?php $blockreview_row++; ?>
											<?php } ?>
											<li>
											<button type="button" onclick="addreviewimg();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $entry_addtext; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-lg-12">
										<div class="tab-content">
											<?php $blockreview_row = 1; ?>
											<?php foreach ($fish_singleclick_reviews as $value) { ?>
											<div class="tab-pane" id="tab-review<?php echo $blockreview_row; ?>">
                                            
                                            <div class="form-group">
											<label class="col-lg-2 col-md-3"><?php echo $entry_image; ?></label>
											<div class="col-lg-2 col-md-9">
											<a href="" id="fish_singleclick_reviews_thumb<?php echo $blockreview_row; ?>" data-toggle="image" class="img-thumbnail">
                                            <img src="<?php echo $value['thumb']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a>
                                            <input type="hidden" name="fish_singleclick_review[<?php echo $blockreview_row; ?>][image]" value="<?php echo $value['image']; ?>" id="fish_singleclick_reviews_image_input<?php echo $blockreview_row; ?>" />           </div>
											</div>
                                            <div class="form-group">
                                            <label class="col-lg-2"><?php echo $entry_buyer; ?></label>
											<div class="col-lg-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="fish_singleclick_review[<?php echo $blockreview_row; ?>][text][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?></textarea>
											</div>
											<?php } ?>
											</div>
											</div> 
                                            
                                           <div class="form-group">
                                            <label class="col-lg-2"><?php echo $entry_review; ?></label>  
											<div class="col-lg-10"> 
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="fish_singleclick_review[<?php echo $blockreview_row; ?>][reviewtext][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($value['reviewtext'][$language['language_id']]) ? $value['reviewtext'][$language['language_id']] : ''; ?></textarea>
											</div>
											<?php } ?>
											</div>
											</div>  
                                                  
                                            
                                            </div>
                                            <?php $blockreview_row++; ?>
                                            <?php } ?>
                                            </div>
                                            </div>                
                  </div>      
        </div>
 <!--carousel//////////////////////////////////////////////////////////////////////////////////-->
            <div class="tab-pane" id="tab-8"> 
            <p class="lead">7. <?php echo $entry_carousel; ?></p> 
            <div class="form-group">
				<label class="col-lg-3"><?php echo $entry_enabled; ?></label>
				<div class="col-lg-9">
				<label class="radio-inline"><input type="radio" name="fish_singleclick_showcarousel" value="1"<?php echo $fish_singleclick_showcarousel ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                <label class="radio-inline"><input type="radio" name="fish_singleclick_showcarousel" value="0"<?php echo !$fish_singleclick_showcarousel ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
				</div>
            </div>
                              <div class="form-group">
							<label class="col-lg-3"><?php echo $entry_menu; ?></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<textarea name="fish_singleclick[fish_singleclick_menu6a][<?php echo $language['language_id']; ?>]" rows="2" class="form-control" placeholder=""><?php echo isset($fish_singleclicks['fish_singleclick_menu6a'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_menu6a'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div> 
                            
 
   <p class="lead"><?php echo $entry_title; ?></p>
              <div class="form-group">
			<label class="col-lg-3 col-md-12"><?php echo $entry_fonbox; ?> </label>
			<div class="col-lg-3 col-md-12">
			<a href="" id="fish_singleclick_img_carouselthumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $fish_singleclick_img_carouselthumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="fish_singleclick_img_carousel" value="<?php echo $fish_singleclick_img_carousel; ?>" id="fish_singleclick_imgfon_carousel_input" />
			</div> 


				
				<div class="col-lg-3 col-md-6">
                <label class="control-label"><?php echo $entry_colorbox; ?></label><br />
                <input type="text" name="fish_singleclick_colorcarousel" value="<?php echo $fish_singleclick_colorcarousel; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                <div class="col-lg-3 col-md-6">
               <label class="control-label"><?php echo $entry_colortext; ?></label><br />
                <input type="text" name="fish_singleclick_colorcarouseltext" value="<?php echo $fish_singleclick_colorcarouseltext; ?>" class="form-control btn-group color {required:false,hash:true}" /><br /><br />
                </div>
             </div>
		 <div class="form-group">
        <label class="col-lg-3 col-md-3"><?php echo $entry_title; ?><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
        <div class=" col-md-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_carouseltext<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_carouseltext][<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_carouseltext'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_carouseltext'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div> 
              <div class="form-group">
							<label class="col-lg-3"><?php echo $entry_text; ?><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<textarea name="fish_singleclick[fish_singleclick_carouseltext2][<?php echo $language['language_id']; ?>]" rows="2" class="form-control" placeholder=""><?php echo isset($fish_singleclicks['fish_singleclick_carouseltext2'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_carouseltext2'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div>        
              
           
 <p class="lead"><?php echo $entry_images; ?></p>       
        
         <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_vis; ?></label>
		<div class="col-lg-3">
         <select name="fish_singleclick_columncarousel" class="form-control" >
							<option value="1" selected="selected">1</option>
							<?php for ( $i = 2; $i <= 10; $i++) { 
                                     
									($fish_singleclick_columncarousel == $i) ? $currentpat = 'selected' : $currentpat = '';
								?>
								<option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?></option>
								<?php } ?>
						</select>
         </div>
         </div>

         
    <div class="form-group">
    <label class="col-lg-3"><?php echo $entry_size; ?></label>
    <div class="col-lg-9">
							<input name="fish_singleclick[fish_carousel_width]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_carousel_width']) ? $fish_singleclicks['fish_carousel_width'] : ''; ?>" placeholder="200"/> x <input name="fish_singleclick[fish_carousel_height]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_carousel_height']) ? $fish_singleclicks['fish_carousel_height'] : ''; ?>" placeholder="200"/>	
		</div>
		</div>
     <div class="form-group">
    <label class="col-lg-3"><?php echo $entry_bigsize; ?></label>
    <div class="col-lg-9">
							<input name="fish_singleclick[fish_carousel_bigwidth]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_carousel_bigwidth']) ? $fish_singleclicks['fish_carousel_bigwidth'] : ''; ?>" placeholder=""/> x <input name="fish_singleclick[fish_carousel_bigheight]" class="form-control btn-group short" value="<?php echo isset($fish_singleclicks['fish_carousel_bigheight']) ? $fish_singleclicks['fish_carousel_bigheight'] : ''; ?>" placeholder=""/>	
		</div>
		</div>      
        
         
                        
               <div class="row" id="tabs_blockcarousel">
									<div class="col-lg-12 ">
										<ul class="nav nav-tabs" id="blockcarousel">
											<?php $blockcarousel_row = 1; ?>
											<?php foreach ($fish_singleclick_carousels as  $value) { ?>
											<li><a href="#tab-carousel<?php echo $blockcarousel_row; ?>" data-toggle="tab" id="addimgcarousel<?php echo $blockcarousel_row; ?>">
                                            <i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-carousel<?php echo $blockcarousel_row; ?>\']').parent().remove(); $('#tab-carousel<?php echo $blockcarousel_row; ?>').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_box; ?> <?php echo $blockcarousel_row; ?></a></li>
											<?php $blockcarousel_row++; ?>
											<?php } ?>
											<li>
											<button type="button" onclick="addcarouselimg();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $entry_addtext; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-lg-12">
										<div class="tab-content">
											<?php $blockcarousel_row = 1; ?>
											<?php foreach ($fish_singleclick_carousels as $value) { ?>
											<div class="tab-pane" id="tab-carousel<?php echo $blockcarousel_row; ?>">
                                            
                                            <div class="form-group">
											<label class="col-lg-2 col-md-3"><?php echo $entry_image; ?></label>
											<div class="col-lg-2 col-md-9">
											<a href="" id="fish_singleclick_carousels_thumb<?php echo $blockcarousel_row; ?>" data-toggle="image" class="img-thumbnail">
                                            <img src="<?php echo $value['thumb']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a>
                                            <input type="hidden" name="fish_singleclick_carousel[<?php echo $blockcarousel_row; ?>][image]" value="<?php echo $value['image']; ?>" id="fish_singleclick_carousels_image_input<?php echo $blockcarousel_row; ?>" />           </div>
											</div>
                                            <div class="form-group">
                                            <label class="col-lg-2"><?php echo $entry_title; ?></label>
											<div class="col-lg-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="fish_singleclick_carousel[<?php echo $blockcarousel_row; ?>][text][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?></textarea>
											</div>
											<?php } ?>
											</div>
											</div> 
                                            
                                           <div class="form-group">
                                            <label class="col-lg-2"><?php echo $entry_text; ?></label>  
											<div class="col-lg-10"> 
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<textarea name="fish_singleclick_carousel[<?php echo $blockcarousel_row; ?>][carouseltext][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($value['carouseltext'][$language['language_id']]) ? $value['carouseltext'][$language['language_id']] : ''; ?></textarea>
											</div>
											<?php } ?>
											</div>
											</div>  
                                                  
                                            
                                            </div>
                                            <?php $blockcarousel_row++; ?>
                                            <?php } ?>
                                            </div>
                                            </div>                
                  </div>      
        </div>       
        
  <!--customs//////////////////////////////////////////////////////////////////////////////////-->
            <div class="tab-pane" id="tab-9"> 
            <p class="lead">8. <?php echo $entry_custombox; ?></p>
            <div class="form-group">
				<label class="col-lg-3"><?php echo $entry_enabled; ?></label>
				<div class="col-lg-9">
				<label class="radio-inline"><input type="radio" name="fish_singleclick_showcustom" value="1"<?php echo $fish_singleclick_showcustom ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?></label>
                <label class="radio-inline"><input type="radio" name="fish_singleclick_showcustom" value="0"<?php echo !$fish_singleclick_showcustom ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?></label>
				</div>
            </div>
                              <div class="form-group">
							<label class="col-lg-3"><?php echo $entry_menu; ?></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<textarea name="fish_singleclick[fish_singleclick_menu7][<?php echo $language['language_id']; ?>]" rows="2" class="form-control" placeholder=""><?php echo isset($fish_singleclicks['fish_singleclick_menu7'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_menu7'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div>
                            
             <div class="form-group">
			<label class="col-lg-3"><?php echo $entry_image60; ?></label>
			<div class="col-lg-9">
			<a href="" id="fish_singleclick_img_iconcustomthumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $fish_singleclick_img_iconcustomthumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="fish_singleclick_img_iconcustom" value="<?php echo $fish_singleclick_img_iconcustom; ?>" id="fish_singleclick_img_iconcustom_input" />
			</div> 
            </div>                  
             <div class="form-group">
			<label class="col-lg-3 col-md-12"><?php echo $entry_fonbox; ?> </label>
			<div class="col-lg-3 col-md-12">
			<a href="" id="fish_singleclick_img_customthumb" data-toggle="image" class="img-thumbnail"><img src="<?php echo $fish_singleclick_img_customthumb; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="fish_singleclick_img_custom" value="<?php echo $fish_singleclick_img_custom; ?>" id="fish_singleclick_imgfon_custom_input" />
			</div> 
	
				<div class="col-lg-3 col-md-6"><label class="control-label"><?php echo $entry_colorbox; ?></label><br />
                <input type="text" name="fish_singleclick_colorcustom" value="<?php echo $fish_singleclick_colorcustom; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                   
				<div class="col-lg-3 col-md-6"><label class="control-label"><?php echo $entry_colortext; ?></label><br />
                <input type="text" name="fish_singleclick_colorcustomtext" value="<?php echo $fish_singleclick_colorcustomtext; ?>" class="form-control btn-group color {required:false,hash:true}" />
                </div>
                </div>

           
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_title; ?><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_customtext<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_customtext][<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_customtext'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_customtext'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>
        
         <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_text; ?> 1<br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_customtext2<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_customtext2][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_customtext2'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_customtext2'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>
        
         <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_text; ?> 2</label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_customtext3<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_customtext3][<?php echo $language['language_id']; ?>]" class="form-control summernote"><?php echo isset($fish_singleclicks['fish_singleclick_customtext3'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_customtext3'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>

 <p class="lead"><?php echo $entry_network; ?></p> 
    <?php $icons 	= array( 'facebook', 'vk', 'twitter', 'google', 'instagram', 'odnoklassniki', 'pinterest-p', 'skype', 'youtube' );?>
  
  <div class="row" id="tabs_blocknetwork">
									<div class="col-lg-12">   

										<ul class="nav nav-tabs" id="blocknetwork">
											<?php $blocknetwork_row = 1; ?>
											<?php foreach ($fish_singleclick_netws as  $value) { ?>
											<li><a href="#tab-network<?php echo $blocknetwork_row; ?>" data-toggle="tab" id="addimgnet<?php echo $blocknetwork_row; ?>">
                                            <i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-network<?php echo $blocknetwork_row; ?>\']').parent().remove(); $('#tab-network<?php echo $blocknetwork_row; ?>').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_icon; ?> <?php echo $blocknetwork_row; ?></a></li>
											<?php $blocknetwork_row++; ?>
											<?php } ?>
											<li>
											<button type="button" onclick="addnetworkimg();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $entry_addtext; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-lg-12">
										<div class="tab-content">
											<?php $blocknetwork_row = 1; ?>
											<?php foreach ($fish_singleclick_netws as $value) { ?>
											<div class="tab-pane" id="tab-network<?php echo $blocknetwork_row; ?>">
                                            
                                            <div class="form-group">
                                            <div class="col-lg-4">
                  <?php 
							$valueq 	= isset($value['ico']) ? $value['ico'] : 'facebook'; 
                            $name = 'fish_singleclick_netw['. $blocknetwork_row .'][ico]'; 
						?>
                         
                         <select name="<?php echo $name; ?>" class="form-control">
															<?php foreach ($icons as $key => $icon) { ?>
															<option value="<?php echo $icon; ?>" <?php if ($valueq == $icon) { ?>selected="selected"<?php } ?>><?php echo $icon; ?></option>
															<?php } ?>
														</select>

         </div>
                                   
											<div class="col-lg-4">

											<input type="text" name="fish_singleclick_netw[<?php echo $blocknetwork_row; ?>][text]" value="<?php echo isset($value['text']) ? $value['text']: ''; ?>" class="form-control" placeholder="text">
											</div>
                                            <div class="col-lg-4">
											<input type="text" name="fish_singleclick_netw[<?php echo $blocknetwork_row; ?>][link]" value="<?php echo isset($value['link']) ? $value['link'] : ''; ?>" class="form-control" placeholder="link">
						
											</div>
											</div>       
                                            
                                            </div>
                                            <?php $blocknetwork_row++; ?>
                                            <?php } ?>
                                            </div>
                                            </div>                
                  </div> 
                  
  
    </div> 
     
      <!--Contact//////////////////////////////////////////////////////////////////////////////////-->
        <div class="tab-pane" id="tab-10"> 
                     <p class="lead">9. <?php echo $entry_contact; ?></p> 
                    <div class="form-group">
							<label class="col-lg-3"><?php echo $entry_menu; ?></label>
							<div class="col-lg-9">
							<?php foreach ($languages as $language) { ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
							<textarea name="fish_singleclick[fish_singleclick_menu8][<?php echo $language['language_id']; ?>]" rows="2" class="form-control" placeholder=""><?php echo isset($fish_singleclicks['fish_singleclick_menu8'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_menu8'][$language['language_id']] : ''; ?></textarea>
											
							</div>
							<?php } ?>
					         </div>
							</div>

              <div class="form-group">
		<label class="col-lg-3">Код карты <a href="https://tech.yandex.ru/maps/tools/constructor/" target="_blank" class="small">Конструктор карт</a><br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<textarea name="fish_singleclick[fish_singleclick_map]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_map']) ? $fish_singleclicks['fish_singleclick_map'] : ''; ?></textarea>		
		</div>
		</div>
        
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_contact; ?> 1<br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_customcontact1<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_customcontact1][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_customcontact1'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_customcontact1'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>
        <div class="form-group">
		<label class="col-lg-3"><?php echo $entry_contact; ?> 2<br /><a class="visible-edit-prod"><?php echo $entry_displayred; ?></a></label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_customcontact2<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_customcontact2][<?php echo $language['language_id']; ?>]" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_customcontact2'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_customcontact2'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>
         <div class="form-group">
		<label class="col-lg-3">Copyright</label>
		<div class="col-lg-9">
		<?php foreach ($languages as $language) { ?>
		<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
		<textarea id="fish_singleclick_customcopy<?php echo $language['language_id']; ?>" name="fish_singleclick[fish_singleclick_customcopy][<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo isset($fish_singleclicks['fish_singleclick_customcopy'][$language['language_id']]) ? $fish_singleclicks['fish_singleclick_customcopy'][$language['language_id']] : ''; ?></textarea>
		</div>
		<?php } ?>			
		</div>
		</div>
        <p class="lead"><?php echo $entry_footerlink; ?></p> 
  <div class="row" id="tabs_blockfooterlink">
									<div class="col-lg-12">   

										<ul class="nav nav-tabs" id="blockfooterlink">
											<?php $blockfooterlink_row = 1; ?>
											<?php foreach ($fish_singleclick_footerlinks as  $value) { ?>
											<li><a href="#tab-footerlink<?php echo $blockfooterlink_row; ?>" data-toggle="tab" id="addimgfooter<?php echo $blockfooterlink_row; ?>">
                                            <i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-footerlink<?php echo $blockfooterlink_row; ?>\']').parent().remove(); $('#tab-footerlink<?php echo $blockfooterlink_row; ?>').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_link; ?> <?php echo $blockfooterlink_row; ?></a></li>
											<?php $blockfooterlink_row++; ?>
											<?php } ?>
											<li>
											<button type="button" onclick="addfooterlinkimg();" class="btn btn-success form-control"><i class="fa fa-plus-circle"></i> <?php echo $entry_addtext; ?></button>
											</li>
										</ul>
									</div>
									<div class="col-lg-12">
										<div class="tab-content">
											<?php $blockfooterlink_row = 1; ?>
											<?php foreach ($fish_singleclick_footerlinks as $value) { ?>
											<div class="tab-pane" id="tab-footerlink<?php echo $blockfooterlink_row; ?>">
                                            
                                            <div class="form-group"> 
                                   
											<div class="col-lg-4">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="fish_singleclick_footerlink[<?php echo $blockfooterlink_row; ?>][text][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['text'][$language['language_id']]) ? $value['text'][$language['language_id']] : ''; ?>" class="form-control" placeholder="text">
											</div>
											<?php } ?>
											</div>
                                            
                                            <div class="col-lg-4">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
											<input type="text" name="fish_singleclick_footerlink[<?php echo $blockfooterlink_row; ?>][link][<?php echo $language['language_id']; ?>]" value="<?php echo isset($value['link'][$language['language_id']]) ? $value['link'][$language['language_id']] : ''; ?>" class="form-control" placeholder="link">
											</div>
											<?php } ?>
											</div>
                                            
                                             <div class="col-lg-4">
                  <?php 
							$valueq 	= isset($value['blank']) ? $value['blank'] : '0'; 
                            $name = 'fish_singleclick_footerlink['. $blockfooterlink_row .'][blank]'; 
						?>
                         
                         <select name="<?php echo $name; ?>" class="form-control">
						 <option value="0" <?php if ($valueq == 0) { ?>selected="selected"<?php } ?>><?php echo $entry_wind1; ?></option>
						 <option value="1" <?php if ($valueq == 1) { ?>selected="selected"<?php } ?>><?php echo $entry_wind2; ?></option>								
														</select>

         </div>
                                   

											</div>       
                                            
                                            </div>
                                            <?php $blockfooterlink_row++; ?>
                                            <?php } ?>
                                            </div>
                                            </div>                
                  </div>  
            
              
       </div>
       
       
            
            
            </div>
                
           </div>
           </div>
           </div>
            </form>

                <?php //Multi Fish Landing 2.3.x Begin ?>
                <?php /*
                <div>
                    <?php if ($module_id) { ?>
                        <a onclick="buttonApply();" class="btn btn-success"><i class="fa fa-check"></i> <?php echo $button_apply; ?></a>
                        <a onclick="location = '<?php echo $export_setting; ?>';" class="btn btn-success"><i class="fa fa-arrow-circle-up"></i> <?php echo $button_export_setting; ?></a>
                    <?php } ?>
                    <button type="button" data-loading-text="<?php echo $text_loading; ?>" data-url="<?php echo $import_setting; ?>" class="btn btn-danger button-upload"><i class="fa fa-arrow-circle-down"></i> <?php echo $button_import_setting; ?></button>
                </div>
                */ ?>

                <?php //Multi Fish Landing 2.3.x End ?>
            


      </div><!-- </div class="panel-body"> -->
    </div><!-- </div class="panel panel-default"> -->
  </div><!-- </div class="container-fluid"> -->
</div><!-- </div id="content"> -->
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<script type="text/javascript" src="view/javascript/summernote/fishopencart.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript"><!--
  $(function() { 
    $('a[data-toggle="tab"]').on('shown.bs.tab', function () {
    localStorage.setItem('lastTab', $(this).attr('href'));
  });
  var lastTab = localStorage.getItem('lastTab');
  if (lastTab) {
    $('a[href=' + lastTab + ']').tab('show');
  } else {
    $('a[data-toggle="tab"]:first').tab('show');
  }
});
$('#tabs a:first').tab('show');
$('#blockslider a:first').tab('show');
$('#blockadv a:first').tab('show');
$('#blockprod a:first').tab('show');
$('#blockbox a:first').tab('show');
$('#blockreview a:first').tab('show');
$('#blockcarousel a:first').tab('show');
$('#blocknetwork a:first').tab('show');
$('#blockfooterlink a:first').tab('show');
$('#blockheaderlink a:first').tab('show');

var blockslider_row = <?php echo $blockslider_row; ?>;
		function addSliderimg() {
			html = '<div class="tab-pane active" id="tab-slider' + blockslider_row + '">';

			html += '<div class="form-group">';
			html += '<label class="col-lg-3 col-md-3"><?php echo $entry_image; ?></label>';
			html += '<div class="col-lg-3 col-md-9">';
			html += '<a href="" id="fish_singleclick_imgs_image_thumb' + blockslider_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
			html += '<input type="hidden" name="fish_singleclick_img[' + blockslider_row + '][image]" value="" id="fish_singleclick_imgs_image_input' + blockslider_row + '" />';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#tabs_blockslider .tab-content').append(html);
			$('#blockslider li .btn-success').parent().before('<li><a href="#tab-slider' + blockslider_row + '" data-toggle="tab" id="addimg' + blockslider_row + '"><i class="fa fa-minus-circle" onclick="$(\'#addimg' + blockslider_row + '\').parent().remove(); $(\'#tab-slider' + blockslider_row + '\').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_image; ?> ' + blockslider_row + '</a></li>');

			$('#addimg' + blockslider_row).trigger('click');
			blockslider_row++;
		}
		
var blockadv_row = <?php echo $blockadv_row; ?>;
		function addAdvimg() {
			html = '<div class="tab-pane active" id="tab-adv' + blockadv_row + '">';

			html += '<div class="form-group">';
			html += '<label class="col-lg-2"><?php echo $entry_image; ?></label>';
			html += '<div class="col-lg-2">';
			html += '<a href="" id="fish_singleclick_advs_image_thumb' + blockadv_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
			html += '<input type="hidden" name="fish_singleclick_adv[' + blockadv_row + '][image]" value="" id="fish_singleclick_advs_image_input' + blockadv_row + '" />';
			html += '</div>';
			html += '<div class="col-lg-8">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea rows="2" name="fish_singleclick_adv[' + blockadv_row + '][text][<?php echo $language['language_id']; ?>]"  class="form-control"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#tabs_blockadv .tab-content').append(html);
			$('#blockadv li .btn-success').parent().before('<li><a href="#tab-adv' + blockadv_row + '" data-toggle="tab" id="addimgadv' + blockadv_row + '"><i class="fa fa-minus-circle" onclick="$(\'#addimgadv' + blockadv_row + '\').parent().remove(); $(\'#tab-adv' + blockadv_row + '\').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_text; ?> ' + blockadv_row + '</a></li>');

			$('#addimgadv' + blockadv_row).trigger('click');
			blockadv_row++;
		}
var blockprod_row = <?php echo $blockprod_row; ?>;
		function addprodimg() {
			html = '<div class="tab-pane active" id="tab-prod' + blockprod_row + '">';

			html += '<div class="form-group">';
			html += '<label class="col-lg-2 col-md-3"><?php echo $entry_image; ?></label>';
			html += '<div class="col-lg-2 col-md-9">';
			html += '<a href="" id="fish_singleclick_prods_image_thumb' + blockprod_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
			html += '<input type="hidden" name="fish_singleclick_prod[' + blockprod_row + '][image]" value="" id="fish_singleclick_prods_image_input' + blockprod_row + '" />';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-lg-2 col-md-3"><?php echo $entry_price; ?></label>';
			html += '<div class="col-lg-2 col-md-9">';
			html += '<input type="text" name="fish_singleclick_prod[' + blockprod_row + '][price]" value="" class="form-control">';
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-lg-2"><?php echo $entry_text; ?></label>';
			html += '<div class="col-lg-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea rows="2" name="fish_singleclick_prod[' + blockprod_row + '][text][<?php echo $language['language_id']; ?>]" class="form-control"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-lg-2"><?php echo $entry_popaptext; ?></label>';
			html += '<div class="col-lg-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea rows="2" name="fish_singleclick_prod[' + blockprod_row + '][popaptext][<?php echo $language['language_id']; ?>]" class="form-control summernote"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#tabs_blockprod .tab-content').append(html);
			$('#blockprod li .btn-success').parent().before('<li><a href="#tab-prod' + blockprod_row + '" data-toggle="tab" id="addimgprod' + blockprod_row + '"><i class="fa fa-minus-circle" onclick="$(\'#addimgprod' + blockprod_row + '\').parent().remove(); $(\'#tab-prod' + blockprod_row + '\').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_image; ?> ' + blockprod_row + '</a></li>');
			$('#addimgprod' + blockprod_row).trigger('click');
            <?php foreach ($languages as $language) { ?>
				$('textarea[name="fish_singleclick_prod[' + blockprod_row + '][popaptext][<?php echo $language['language_id']; ?>]"').summernote({height: 100});
			<?php } ?>
			
			blockprod_row++;
		}
var blockbox_row = <?php echo $blockbox_row; ?>;
		function addboximg() {
			html = '<div class="tab-pane active" id="tab-box' + blockbox_row + '">';

			html += '<div class="form-group">';
			html += '<label class="col-lg-2 col-md-3"><?php echo $entry_image; ?></label>';
			html += '<div class="col-lg-2 col-md-9">';
			html += '<a href="" id="fish_singleclick_boxs_image_thumb' + blockbox_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
			html += '<input type="hidden" name="fish_singleclick_box[' + blockbox_row + '][image]" value="" id="fish_singleclick_boxs_image_input' + blockbox_row + '" />';
			html += '</div></div>';
			html += '<div class="form-group">';
			html += '<label class="col-lg-2"><?php echo $entry_title; ?></label>';
			html += '<div class="col-lg-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea rows="2" name="fish_singleclick_box[' + blockbox_row + '][text][<?php echo $language['language_id']; ?>]" class="form-control"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-lg-2"><?php echo $entry_text; ?> 1</label>';
			html += '<div class="col-lg-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea rows="2" name="fish_singleclick_box[' + blockbox_row + '][mdtext][<?php echo $language['language_id']; ?>]" class="form-control"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
			html += '<div class="form-group">';
			html += '<label class="col-lg-2"><?php echo $entry_text; ?> 2</label>';
			html += '<div class="col-lg-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea rows="2" name="fish_singleclick_box[' + blockbox_row + '][smtext][<?php echo $language['language_id']; ?>]" class="form-control summernote"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';
				html += '<div class="form-group">';
			html += '<label class="col-lg-2"><?php echo $entry_video; ?></label>';
			html += '<div class="col-lg-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea rows="2" name="fish_singleclick_box[' + blockbox_row + '][overtext][<?php echo $language['language_id']; ?>]" class="form-control summernote"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#tabs_blockbox .tab-content').append(html);
			$('#blockbox li .btn-success').parent().before('<li><a href="#tab-box' + blockbox_row + '" data-toggle="tab" id="addimgbox' + blockbox_row + '"><i class="fa fa-minus-circle" onclick="$(\'#addimgbox' + blockbox_row + '\').parent().remove(); $(\'#tab-box' + blockbox_row + '\').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_box; ?> ' + blockbox_row + '</a></li>');
			$('#addimgbox' + blockbox_row).trigger('click');
            <?php foreach ($languages as $language) { ?>
				$('textarea[name="fish_singleclick_box[' + blockbox_row + '][smtext][<?php echo $language['language_id']; ?>]"').summernote({height: 100});
				$('textarea[name="fish_singleclick_box[' + blockbox_row + '][overtext][<?php echo $language['language_id']; ?>]"').summernote({height: 100});
			<?php } ?>
			
			blockbox_row++;
		}	
var blockreview_row = <?php echo $blockreview_row; ?>;
		function addreviewimg() {
			html = '<div class="tab-pane active" id="tab-review' + blockreview_row + '">';

			html += '<div class="form-group">';
			html += '<label class="col-lg-2 col-md-3"><?php echo $entry_image; ?></label>';
			html += '<div class="col-lg-2 col-md-9">';
			html += '<a href="" id="fish_singleclick_reviews_image_thumb' + blockreview_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
			html += '<input type="hidden" name="fish_singleclick_review[' + blockreview_row + '][image]" value="" id="fish_singleclick_reviews_image_input' + blockreview_row + '" />';
			html += '</div></div>';
			html += '<div class="form-group">';
			html += '<label class="col-lg-2"><?php echo $entry_buyer; ?></label>';
			html += '<div class="col-lg-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea rows="2" name="fish_singleclick_review[' + blockreview_row + '][text][<?php echo $language['language_id']; ?>]" class="form-control"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-lg-2"><?php echo $entry_review; ?></label>';
			html += '<div class="col-lg-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea rows="2" name="fish_singleclick_review[' + blockreview_row + '][reviewtext][<?php echo $language['language_id']; ?>]" class="form-control"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#tabs_blockreview .tab-content').append(html);
			$('#blockreview li .btn-success').parent().before('<li><a href="#tab-review' + blockreview_row + '" data-toggle="tab" id="addimgreview' + blockreview_row + '"><i class="fa fa-minus-circle" onclick="$(\'#addimgreview' + blockreview_row + '\').parent().remove(); $(\'#tab-review' + blockreview_row + '\').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_review; ?> ' + blockreview_row + '</a></li>');
			$('#addimgreview' + blockreview_row).trigger('click');
			
			blockreview_row++;
		}
	var blockcarousel_row = <?php echo $blockcarousel_row; ?>;
		function addcarouselimg() {
			html = '<div class="tab-pane active" id="tab-carousel' + blockcarousel_row + '">';

			html += '<div class="form-group">';
			html += '<label class="col-lg-2 col-md-3"><?php echo $entry_image; ?></label>';
			html += '<div class="col-lg-2 col-md-9">';
			html += '<a href="" id="fish_singleclick_carousels_image_thumb' + blockcarousel_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" /></a>';
			html += '<input type="hidden" name="fish_singleclick_carousel[' + blockcarousel_row + '][image]" value="" id="fish_singleclick_carousels_image_input' + blockcarousel_row + '" />';
			html += '</div></div>';
			html += '<div class="form-group">';
			html += '<label class="col-lg-2"><?php echo $entry_title; ?></label>';
			html += '<div class="col-lg-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea rows="2" name="fish_singleclick_carousel[' + blockcarousel_row + '][text][<?php echo $language['language_id']; ?>]" class="form-control"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '<div class="form-group">';
			html += '<label class="col-lg-2"><?php echo $entry_text; ?></label>';
			html += '<div class="col-lg-10">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<textarea rows="2" name="fish_singleclick_carousel[' + blockcarousel_row + '][carouseltext][<?php echo $language['language_id']; ?>]" class="form-control"></textarea>';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#tabs_blockcarousel .tab-content').append(html);
			$('#blockcarousel li .btn-success').parent().before('<li><a href="#tab-carousel' + blockcarousel_row + '" data-toggle="tab" id="addimgcarousel' + blockcarousel_row + '"><i class="fa fa-minus-circle" onclick="$(\'#addimgcarousel' + blockcarousel_row + '\').parent().remove(); $(\'#tab-carousel' + blockcarousel_row + '\').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_box; ?> ' + blockcarousel_row + '</a></li>');
			$('#addimgcarousel' + blockcarousel_row).trigger('click');
			
			blockcarousel_row++;
		}
	var blocknetwork_row = <?php echo $blocknetwork_row; ?>;
		function addnetworkimg() {
			html = '<div class="tab-pane active" id="tab-network' + blocknetwork_row + '">';

			html += '<div class="form-group">';
			html += '<div class="col-lg-4">';
			html += '<select name="fish_singleclick_netw[' + blocknetwork_row + '][ico]" class="form-control">';
			<?php foreach ($icons as $key => $icon) { ?>
			html += '<option value="<?php echo $icon; ?>" <?php if ($key == 0) { ?>selected="selected"<?php } ?>><?php echo $icon; ?></option>';
			<?php } ?>
			html += '</select>';
			html += '</div>';
			html += '<div class="col-lg-4">';
			html += '<input type="text" name="fish_singleclick_netw[' + blocknetwork_row + '][text]" value="" class="form-control" placeholder="text">';
			html += '</div>';
			html += '<div class="col-lg-4">';
			html += '<input type="text" name="fish_singleclick_netw[' + blocknetwork_row + '][link]" value="" class="form-control" placeholder="link">';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#tabs_blocknetwork .tab-content').append(html);
			$('#blocknetwork li .btn-success').parent().before('<li><a href="#tab-network' + blocknetwork_row + '" data-toggle="tab" id="addimgnet' + blocknetwork_row + '"><i class="fa fa-minus-circle" onclick="$(\'#addimgnet' + blocknetwork_row + '\').parent().remove(); $(\'#tab-network' + blocknetwork_row + '\').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_icon; ?> ' + blocknetwork_row + '</a></li>');

			$('#addimgnet' + blocknetwork_row).trigger('click');
			blocknetwork_row++;
		}	
		var blockfooterlink_row = <?php echo $blockfooterlink_row; ?>;
		function addfooterlinkimg() {
			html = '<div class="tab-pane active" id="tab-footerlink' + blockfooterlink_row + '">';

			html += '<div class="form-group">';
			html += '<div class="col-lg-4">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="fish_singleclick_footerlink[' + blockfooterlink_row + '][text][<?php echo $language['language_id']; ?>]" value="" class="form-control" placeholder="text">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '<div class="col-lg-4">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="fish_singleclick_footerlink[' + blockfooterlink_row + '][link][<?php echo $language['language_id']; ?>]" value="" class="form-control" placeholder="link">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '<div class="col-lg-4">';
			html += '<select name="fish_singleclick_footerlink[' + blockfooterlink_row + '][blank]" class="form-control">';
			html += '<option value="0" selected="selected"><?php echo $entry_wind1; ?></option>';
			html += '<option value="1" ><?php echo $entry_wind2; ?></option>';
			html += '</select>';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#tabs_blockfooterlink .tab-content').append(html);
			$('#blockfooterlink li .btn-success').parent().before('<li><a href="#tab-footerlink' + blockfooterlink_row + '" data-toggle="tab" id="addimgfooter' + blockfooterlink_row + '"><i class="fa fa-minus-circle" onclick="$(\'#addimgfooter' + blockfooterlink_row + '\').parent().remove(); $(\'#tab-footerlink' + blockfooterlink_row + '\').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_link; ?> ' + blockfooterlink_row + '</a></li>');

			$('#addimgfooter' + blockfooterlink_row).trigger('click');
			blockfooterlink_row++;
		}	
				var blockheaderlink_row = <?php echo $blockheaderlink_row; ?>;
		function addheaderlinkimg() {
			html = '<div class="tab-pane active" id="tab-headerlink' + blockheaderlink_row + '">';

			html += '<div class="form-group">';
			html += '<div class="col-lg-6">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="fish_singleclick_headerlink[' + blockheaderlink_row + '][text][<?php echo $language['language_id']; ?>]" value="" class="form-control" placeholder="text">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '<div class="col-lg-6">';
			<?php foreach ($languages as $language) { ?>
			html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
			html += '<input type="text" name="fish_singleclick_headerlink[' + blockheaderlink_row + '][link][<?php echo $language['language_id']; ?>]" value="" class="form-control" placeholder="link">';
			html += '</div>';
			<?php } ?>
			html += '</div>';
			html += '<div class="col-lg-6"><br>';
			html += '<select name="fish_singleclick_headerlink[' + blockheaderlink_row + '][blank]" class="form-control">';
			html += '<option value="0" selected="selected"><?php echo $entry_wind1; ?></option>';
			html += '<option value="1" ><?php echo $entry_wind2; ?></option>';
			html += '</select>';
			html += '</div>';
			html += '</div>';

			html += '</div>';
			$('#tabs_blockheaderlink .tab-content').append(html);
			$('#blockheaderlink li .btn-success').parent().before('<li><a href="#tab-headerlink' + blockheaderlink_row + '" data-toggle="tab" id="addimgheader' + blockheaderlink_row + '"><i class="fa fa-minus-circle" onclick="$(\'#addimgheader' + blockheaderlink_row + '\').parent().remove(); $(\'#tab-headerlink' + blockheaderlink_row + '\').remove();" title="<?php echo $button_remove; ?>"></i> <?php echo $entry_link; ?> ' + blockheaderlink_row + '</a></li>');

			$('#addimgheader' + blockheaderlink_row).trigger('click');
			blockheaderlink_row++;
		}
//<?php foreach ($languages as $language) { ?>
//$('#fish_singleclick_rultext<?php echo $language['language_id']; ?>').summernote({height:200});
//<?php } ?>		

$(document).ready(function() {
	$('.visible-edit-prod').click(function() {
			$(this).parent().parent().find('textarea').summernote({
				height: 100,
				toolbar: [
				['style', ['style']],
				['font', ['bold', 'underline', 'clear']],
				['fontsize', ['fontsize']], 
				['fontname', ['fontname']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table']],
				['insert', ['link', 'video']],
				['view', ['fullscreen', 'codeview', 'help']]
			],
			
	
		});
			$(this).remove();
		});		
	
	
});
$("#spectr").spectrum({
	showAlpha: true, 
	chooseText: "SAVE",  
	preferredFormat: "rgb", 
    allowEmpty:true,
	 showInput: true,
	selectionPalette: ['rgb(78,125,145);', 'rgb(255,102,0);']
	});
//--></script>
<script type="text/javascript"><!--
$('input[name=\'fish_singleclick_product_name\']').autocomplete({
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
		$('input[name=\'fish_singleclick_product_name\']').val('');
		
		$('#featured-product' + item['value']).remove();
		
		$('#featured-product').append('<div id="featured-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="fish_singleclick_product[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#featured-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>


                <?php //Multi Fish Landing 2.3.x Begin ?>
                <script type="text/javascript"><!--
                    function buttonApply() {$('#form').append('<input type="hidden" name="buttonForm" value="apply" />');$('#form').submit();}
                     $(document).ready(function(){
                         setTimeout ("$('.alert-success').fadeOut('slow');", 2000);
                    });

                    $('.button-upload').on('click', function() {
                      var node = $(this);
                      //var loading_text = '<i class="fa fa-circle-o-notch fa-spin"></i> ' + node.data('loading-text');
                      //node.data('loading-text', loading_text);
                      $('#form-upload').remove();

                      $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

                      $('#form-upload input[name=\'file\']').trigger('click');

                      if (typeof timer != 'undefined') {
                          clearInterval(timer);
                      }

                      timer = setInterval(function() {
                        if ($('#form-upload input[name=\'file\']').val() != '') {
                          clearInterval(timer);
                          $('.alert').remove();

                          $.ajax({
                            url: node.data('url'),
                            type: 'post',
                            dataType: 'json',
                            data: new FormData($('#form-upload')[0]),
                            cache: false,
                            contentType: false,
                            processData: false,
                            beforeSend: function() {
                              node.button('loading');
                            },
                            complete: function() {
                              node.button('reset');
                            },
                            success: function(json) {
                              if (json['success']) {
                                location = '<?php echo $action; ?>';
                              }

                              if (json['error']) {
                                $('#backup > h4').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                              }
                            },
                            error: function(xhr, ajaxOptions, thrownError) {
                              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                          });
                        }
                      }, 500);
                    });
                //--></script>
                <?php //Multi Fish Landing 2.3.x End ?>
            
<?php echo $footer; ?>