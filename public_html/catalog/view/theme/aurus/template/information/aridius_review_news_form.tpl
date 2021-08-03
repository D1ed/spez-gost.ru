<!-- Reply form -->
<form class="form-horizontal review_news-form">
<?php if ($review_guest) { ?>
    <div class="review_shop"></div>
    <div class="form-group required">
        <div class="col-sm-12">
            <label class="control-label" for="input-name-<?php echo $parent;?>"><?php echo $entry_name; ?></label>
            <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name-<?php echo $parent;?>" class="form-control"/>
        </div>
    </div>
    <div class="form-group required">
        <div class="col-sm-12">
            <label class="control-label" for="input-review_shop-<?php echo $parent;?>"><?php echo $entry_review; ?></label>
            <textarea name="text" rows="5" id="input-review_shop-<?php echo $parent;?>" class="form-control"></textarea>
        </div>
    </div>
<?php echo $captcha; ?>
    <div class="buttons clearfix">
        <div class="pull-left"><a href="javascript:void(0);" class="btn-cart cancel-review"><?php echo $button_cancel; ?></a></div>
        <div class="pull-right">
            <button type="submit" data-loading-text="<?php echo $text_loading; ?>"  class="btn-cart"><?php echo $button_continue; ?></button>
        </div>
    </div>
    <input type="hidden" name="parent" value="<?php echo $parent;?>">
	<?php } else { ?>
	<br />
<?php echo $text_login; ?>
	<br /><br />
<?php } ?>
</form>