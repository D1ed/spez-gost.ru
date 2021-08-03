<?php echo $header; ?>
<div class="container">
<div class="row">
<div id="cont" class="col-sm-12">
<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-9'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
	<li><?php if($i+1<count($breadcrumbs)) { ?><a
		href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { ?><?php echo $breadcrumb['text']; ?><?php } ?>
	</li>
	<?php } ?>
</ul>
<?php if ($aridius_store_review_status ==1) { ?>
<form id="store-review" class="form-horizontal review-form" style="display: none;">
<?php if ($review_guest) { ?>
<div class="review_shop"></div>
<div class="form-group required">
<div class="col-sm-12">
<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
<input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control"/>
</div>
</div>
<div class="form-group required">
<div class="col-sm-12">
<label class="control-label" for="input-review_shop"><?php echo $entry_review; ?></label>
<textarea name="text" rows="5" id="input-review_shop" class="form-control"></textarea>
</div>
</div>
<div class="form-group required">
<div class="col-sm-12">
<label class="control-label"><?php echo $entry_rating; ?></label>
<input type="hidden" name="rating" value="<?php echo $aridius_store_review_default_rating; ?>" class="rating-tooltip"/>
</div>
</div>
<?php echo $captcha; ?>
<div class="buttons clearfix">
<div class="pull-right">
<button type="submit" data-loading-text="<?php echo $text_loading; ?>"  class="btn-cart add-review"><?php echo $button_continue; ?></button>
</div>
</div>
<input type="hidden" name="parent" value="0">
<?php } else { ?>
<?php echo $text_login; ?>
<br /><br />
<?php } ?>
</form>
<button type="button" class="btn-cart" onclick="hide_show(event, '#store-review')"><?php echo $text_write_review; ?></button>
<div class="clearh"></div>
<?php if (($aridius_store_review_display_average_rating !=1) && ($rating_avr >= 1)) { ?>
	<div class="rating_avr">
	<span class="rating_avrsm"><?php echo $text_rating_avr; ?></span>
		<input type="hidden" class="rating" data-readonly value="<?php echo round($rating_avr, 2);?>"/>
	</div>
	<?php } ?>
<?php if ($reviews) { ?>
	<div id="reviewst">
	<?php foreach ($reviews as $review) { ?>
		<table class="table table-striped table-bordered">
		<tr>
		<td style="width: 50%;"><strong><?php echo $review['author']; ?></strong></td>
		<td class="text-right"><?php echo $review['date_added']; ?></td>
		</tr>
		<tr>
		<td colspan="2"><p><?php echo $review['text']; ?></p>
		<?php for ($i = 1; $i <= 5; $i++) { ?>
			<?php if ($review['rating'] < $i) { ?>
				<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } else { ?>
				<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } ?>
			<?php } ?>
		<?php if ($aridius_store_review_display_answer_button !=1) { ?>
			<br/>
			<a data-parent="<?php echo $review['review_id']; ?>" class="comment-reply" href="javascript:void(0);"><?php echo $text_write_reply; ?></a>
			<?php } ?>
		</td>
		</tr>
		</table>
		<?php foreach ($review['parent'] as $parent) { ?>
			<table class="table table-striped table-bordered review-parent">
			<tr>
			<td style="width: 50%;"><strong><?php echo $parent['author']; ?></strong></td>
			<td class="text-right"><?php echo $parent['date_added']; ?></td>
			</tr>
			<tr>
			<td colspan="2">
			<div class="review-parent-text">
			<p><?php echo $parent['text']; ?></p>
			</div>
			</td>
			</tr>
			</table>
			<?php } ?>
		<?php } ?>
	<div class="row">
	<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
	<div class="col-sm-6 text-right"><?php echo $results; ?></div>
	</div>
	</div>
	<?php } else { ?>
	<br /><br />
	<p><?php echo $text_no_reviews; ?></p>
	<?php } ?>
	<?php } ?>
<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
</div></div>
<?php if ($aridius_store_review_status ==1) { ?>
<!-- rating -->

<script src="catalog/view/theme/aurus/js/bootstrap_rating/bootstrap-rating.js"></script>
<script><!--
$('#review_shop').delegate('.pagination a', 'click', function (e) {
	e.preventDefault();
	$('#review_shop').fadeOut('slow');
	$('#review_shop').load(this.href);
	$('#review_shop').fadeIn('slow');
});
$(document).on('submit','form.review-form',function(e){
	e.preventDefault();
	var $this=$(this);
	$.ajax({
url: 'index.php?route=extension/module/aridius_store_review/write',
type: 'post',
dataType: 'json',
data: $this.serialize(),
beforeSend: function () {
			$this.find('.button-review_shop').button('loading');
		},
complete: function () {
			$this.find('.button-review_shop').button('reset');
		},
success: function (json) {
			$('.alert-success, .alert-danger').remove();
			if (json['error']) {
				$this.find('.review_shop').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			if (json['success']) {
				$this.find('.review_shop').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				$this.find('input[name=\'name\']').val('');
				$this.find('textarea[name=\'text\']').val('');
				$this.find('input[name=\'rating\']:checked').prop('checked', false);
				setTimeout(function(){ $('.reply-form').remove();},2500)
			}
		}
	});
});
$(document).on('click', '.cancel-review', function () {
	$('.reply-form').remove();
});
$(document).on('click', '.comment-reply', function () {
	var $this=$(this);
	$.post( "index.php?route=extension/module/aridius_store_review/reply", { parent: $this.attr("data-parent") }, function( data ) {
		$('.reply-form').remove();
		$this.parent().append('<div class="reply-form">' + data.html + '</div>');
	}, "json");
});
//--></script>
<script><!--
function hide_show(event, selector) {
	var form = document.querySelector(selector)
	if (form.style.display == "none") {
		form.style.display = "block"
	} else {
		form.style.display = "none"
	}
	event.currentTarget.style.display = 'none';
}
//--></script>
<script><!--
$(function () {
	$('.rating-tooltip').ar_rating({
extendSymbol: function (rate) {
			$(this).tooltip({
container: 'body',
placement: 'bottom',
title: rate
			});
		}
	});
});
//--></script>
<?php } ?>
<?php echo $footer; ?>