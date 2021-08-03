<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;<?php echo $text_savenews; ?></button>
<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
</div>
<h1><?php echo $heading_title3; ?></h1>
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
<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title3; ?></h3>
</div>
<div class="panel-body">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
<ul class="nav nav-tabs">
<li class="active"><a href="#tab-language" data-toggle="tab"><?php echo $tab_language; ?></a></li>
<li><a href="#tab-setting" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
<li><a href="#tab-relatedproducts" data-toggle="tab"><?php echo $tab_relatedproducts; ?></a></li>
<li><a href="#tab-relatedaridius_news" data-toggle="tab"><?php echo $tab_relatednews; ?></a></li>  			
</ul>
<div class="tab-content">
<div class="tab-pane active" id="tab-language">
<ul class="nav nav-tabs" id="language">
<?php foreach ($languages as $language) { ?>
	<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
	<?php } ?>
</ul>
<div class="tab-content">
<?php foreach ($languages as $language) { ?>
	<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
	<div class="form-group required">
	<label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
	<div class="col-sm-10">
	<input type="text" name="aridius_news_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($aridius_news_description[$language['language_id']]) ? $aridius_news_description[$language['language_id']]['title'] : ''; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
	<?php if (isset($error_title[$language['language_id']])) { ?>
		<div class="text-danger"><?php echo $error_title[$language['language_id']]; ?></div>
		<?php } ?>
	</div>
	</div>
	<div class="form-group required">
	<label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
	<div class="col-sm-10">
	<textarea name="aridius_news_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($aridius_news_description[$language['language_id']]) ? $aridius_news_description[$language['language_id']]['description'] : ''; ?></textarea>
	<?php if (isset($error_description[$language['language_id']])) { ?>
		<div class="text-danger"><?php echo $error_description[$language['language_id']]; ?></div>
		<?php } ?>
	</div>
	</div>
	<div class="form-group">
	<label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
	<div class="col-sm-10">
	<textarea name="aridius_news_description[<?php echo $language['language_id']; ?>][meta_title]" rows="5" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($aridius_news_description[$language['language_id']]) ? $aridius_news_description[$language['language_id']]['meta_title'] : ''; ?></textarea>
	</div>
	</div>
	<div class="form-group">
	<label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
	<div class="col-sm-10">
	<textarea name="aridius_news_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($aridius_news_description[$language['language_id']]) ? $aridius_news_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
	</div>
	</div>
	<div class="form-group">
	<label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
	<div class="col-sm-10">
	<textarea name="aridius_news_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($aridius_news_description[$language['language_id']]) ? $aridius_news_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
	</div>
	</div>
	</div>
	<?php } ?>
</div>
</div>
<div class="tab-pane" id="tab-setting">
<div class="form-group">
<label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
<div class="col-sm-10">
<div class="well well-sm" style="height: 150px; overflow: auto;">
<div class="checkbox">
<label>
<?php if (in_array(0, $aridius_news_store)) { ?>
	<input type="checkbox" name="aridius_news_store[]" value="0" checked="checked" />
	<?php echo $text_default; ?>
	<?php } else { ?>
	<input type="checkbox" name="aridius_news_store[]" value="0" />
	<?php echo $text_default; ?>
	<?php } ?>
</label>
</div>
<?php foreach ($stores as $store) { ?>
	<div class="checkbox">
	<label>
	<?php if (in_array($store['store_id'], $aridius_news_store)) { ?>
		<input type="checkbox" name="aridius_news_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
		<?php echo $store['name']; ?>
		<?php } else { ?>
		<input type="checkbox" name="aridius_news_store[]" value="<?php echo $store['store_id']; ?>" />
		<?php echo $store['name']; ?>
		<?php } ?>
	</label>
	</div>
	<?php } ?>
</div>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
<div class="col-sm-10">
<input type="text" name="keyword" value="<?php echo $keyword; ?>" id="input-keyword" class="form-control" />
<?php if ($error_keyword) { ?>
	<div class="text-danger"><?php echo $error_keyword; ?></div>
	<?php } ?>
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
<div class="col-sm-10">
<a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
<input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
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
<div class="form-group">
<label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort; ?></label>
<div class="col-sm-10">
<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" id="input-sort-order" class="form-control" />
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
<div class="col-sm-3">
<div class="input-group datetime">
<input type="text" name="date_added" value="<?php echo $date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD HH:mm:ss" id="input-date-added" class="form-control" />
<span class="input-group-btn">
<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
</span>
</div>
</div>
 </div>
</div>
<div class="tab-pane" id="tab-relatedproducts">			
<div class="form-group">
<label class="col-sm-2 control-label" for="input-related"><?php echo $entry_related; ?></label>
<div class="col-sm-10">
<input type="text" name="related" value="" id="input-related" class="form-control"/>
<div id="aridius_news-related" class="well well-sm" style="height: 150px; overflow: auto;">
<?php foreach ($aridius_news_related as $aridius_news_related) { ?>
	<div id="aridius_news-related<?php echo $aridius_news_related['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $aridius_news_related['name']; ?>
	<input type="hidden" name="aridius_news_related[]" value="<?php echo $aridius_news_related['product_id']; ?>" />
	</div>
	<?php } ?>
</div>
</div>
</div>			
</div>	
<div class="tab-pane" id="tab-relatedaridius_news">			
<div class="form-group">
<label class="col-sm-2 control-label" for="input-aridius_newsrelated"><?php echo $entry_relatedaridius_news; ?></label>
<div class="col-sm-10">
<input type="text" name="aridius_newsrelated" value="" id="input-aridius_newsrelated" class="form-control"/>
<div id="aridius_news-aridius_newsrelated" class="well well-sm" style="height: 150px; overflow: auto;">
<?php foreach ($aridius_news_aridius_newsrelated as $aridius_news_aridius_newsrelated) { ?>
	<div id="aridius_news-aridius_newsrelated<?php echo $aridius_news_aridius_newsrelated['aridius_news_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $aridius_news_aridius_newsrelated['title']; ?>
	<input type="hidden" name="aridius_news_aridius_newsrelated[]" value="<?php echo $aridius_news_aridius_newsrelated['aridius_news_id']; ?>" />
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
<script><!--
$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>
<?php if (!$ckeditor) { ?>
  <script src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script src="view/javascript/summernote/opencart.js"></script>
<?php } ?>
<script><!--
        <?php foreach ($languages as $language) { ?>
        <?php if ($ckeditor) { ?>
                ckeditorInit('description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
            <?php } ?>
        <?php } ?>
//--></script>
<script><!--
$('input[name=\'related\']').autocomplete({
	'source': function(request, response) {
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
	'select': function(item) {
		$('input[name=\'related\']').val('');
		$('#aridius_news-related' + item['value']).remove();
		$('#aridius_news-related').append('<div id="aridius_news-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="aridius_news_related[]" value="' + item['value'] + '" /></div>');	
	}	
});
$('#aridius_news-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script> 
<script><!--
$('input[name=\'aridius_newsrelated\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
url: 'index.php?route=extension/module/aridius_news/autocomplete&token=<?php echo $token; ?>&filter_aname=' +  encodeURIComponent(request),
dataType: 'json',			
success: function(json) {
				response($.map(json, function(item) {
					return {
label: item['title'],
value: item['aridius_news_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'aridius_newsrelated\']').val('');
		$('#aridius_news-aridius_newsrelated' + item['value']).remove();
		$('#aridius_news-aridius_newsrelated').append('<div id="aridius_news-aridius_newsrelated' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="aridius_news_aridius_newsrelated[]" value="' + item['value'] + '" /></div>');	
	}	
});
$('#aridius_news-aridius_newsrelated').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script> 
<script><!--
$('#language a:first').tab('show');
//--></script>
<?php echo $footer; ?>