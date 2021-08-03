<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<button id="button-send" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_send; ?>" class="btn btn-primary" onclick="send('index.php?route=common/aridius_letters_send/send&token=<?php echo $token; ?>');"><i class="fa fa-envelope"></i></button>
<a href="<?php echo $aridius_letters; ?>" data-toggle="tooltip" title="<?php echo $button_email; ?>" class="btn btn-default"><i class="fa fa-at"></i></a>   
<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
<h1><?php echo $heading_title; ?></h1>
<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	<?php } ?>
</ul>
</div>
</div>
<div class="container-fluid">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-envelope"></i> <?php echo $heading_title; ?></h3>
</div>
<div class="panel-body">
<form class="form-horizontal">
<div class="form-group required">
<label class="col-sm-2 control-label" for="input-subject"><?php echo $entry_subject; ?></label>
<div class="col-sm-10">
<input type="text" name="subject" value="" placeholder="<?php echo $entry_subject; ?>" id="input-subject" class="form-control" />
</div>
</div>
<div class="form-group required">
<label class="col-sm-2 control-label" for="input-message"><?php echo $entry_message; ?></label>
<div class="col-sm-10">
<textarea name="message" placeholder="<?php echo $entry_message; ?>" id="input-message" class="form-control summernote"></textarea>
</div>
</div>
</form>
</div>
</div>
</div>
  <script src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script src="view/javascript/summernote/opencart.js"></script>
<script><!--
function send(url) {
	<?php if ($ckeditor) { ?>
	    $('textarea[name=\'message\']').val(CKEDITOR.instances['input-message'].getData());
	<?php } ?>
	$.ajax({
url: url,
type: 'post',
data: $('#content input, #content textarea'),
dataType: 'json',
beforeSend: function() {
			$('#button-send').button('loading');
		},
complete: function() {
			$('#button-send').button('reset');
		},
success: function(json) {
			$('.alert, .text-danger').remove();
			if (json['error']) {
				if (json['error']['warning']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '</div>');
				}
				if (json['error']['subject']) {
					$('input[name=\'subject\']').after('<div class="text-danger">' + json['error']['subject'] + '</div>');
				}
				if (json['error']['message']) {
					$('textarea[name=\'message\']').parent().append('<div class="text-danger">' + json['error']['message'] + '</div>');
				}
			}
			if (json['next']) {
				if (json['success']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i>  ' + json['success'] + '</div>');
					send(json['next']);
				}
			} else {
				if (json['success']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				}
			}
		}
	});
}
//--></script></div>
<?php echo $footer; ?>