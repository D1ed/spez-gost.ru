<?php if (!$aridiusundersell_descriptionshow == '1' || !$aridiusundersell_img == '1') { ?>
<div class="undersell">
<?php } else { ?>
<div class="undersell_fl">
<?php } ?>
<div class="undersellf">
<button title="close" type="button" class="mfp-close">&#215;</button>
<div class="name-popup"><?php echo $heading_title; ?></div>
</div>
<div class="undersell2">
<div class="row">
<?php if (!$aridiusundersell_descriptionshow == '1' || !$aridiusundersell_img == '1') { ?>
<div class="col-sm-6">
<div class="name-product"><?php echo $product_name; ?></div>
<?php if (!$aridiusundersell_img == '1') { ?>
<div class="image_wrap">
<img src="<?php echo $popup; ?>" title="<?php echo $product_name; ?>" alt="<?php echo $product_name; ?>" class="img-responsive" />
</div>
<?php } ?>
<?php if (!$aridiusundersell_descriptionshow == '1') { ?>
<?php echo $product_description; ?>
<?php } ?>
<div class="priceall" <?php if ($aridiusundersell_price == '1') { ?> style="display: none"<?php } ?>	>
<?php if ($formated_special) { ?>
	<div class="price-new"><?php echo $formated_special; ?></div>
	<input type="hidden" value="<?php echo $not_formated_special; ?>" name="fo_total_price"/>
	<?php } ?>
<?php if ($formated_special != $formated_price ) { ?>
	<div class="price-old"><?php echo $formated_price; ?></div>
<?php } ?>
</div>
</div>
<?php } ?>
<?php if (!$aridiusundersell_descriptionshow == '1' || !$aridiusundersell_img == '1' ) { ?>
<div class="col-sm-6">
<?php } else { ?>
<div class="col-sm-12">
<?php } ?>
<?php if ($aridiusundersell_descriptionshow == '1' && $aridiusundersell_img == '1' ) { ?>
<div class="name-product"><?php echo $product_name; ?></div>
<?php } ?>
<div class="form-horizontal formundersell">	
<?php if (!$aridiusundersell_firstnameshow == '1') { ?>		
	<div class="form-group <?php if (!$aridiusundersell_firstnamevalid) { ?>required<?php } ?>">
	<label class="control-label" for="input-firstname"><?php echo $enter_firstname; ?></label>
	<div class="input-group">
	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	<input  name="aridiusundersell_firstname" placeholder="<?php echo $aridiusundersell_placeholderfirstname[$language_id]; ?>" class="form-control"  type="text">
	</div>
	<div class="aridiusundersell_errorfirstname"></div>
	</div>
	<?php } ?>	
<div class="form-group required">
<label class="control-label" for="input-contact"><?php echo $enter_phone; ?></label>
<div class="input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
<input id="telephone" name="aridiusundersell_contact" placeholder="<?php echo $aridiusundersell_placeholdertell[$language_id]; ?>" class="form-control" type="text">
</div>
<div class="aridiusundersell_errorcontact"></div>
</div>
<?php if (!$aridiusundersell_emailshow == '1') { ?>		
	<div class="form-group <?php if (!$aridiusundersell_emailvalid) { ?>required<?php } ?>">
	<label class="control-label" for="inputt-email"><?php echo $enter_email; ?></label>
	<div class="input-group">
	<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
	<input name="aridiusundersell_email" placeholder="<?php echo $aridiusundersell_placeholderemail[$language_id]; ?>" class="form-control"  type="text">
	</div>
	<div class="aridiusundersell_erroremail"></div>
	</div>	
	<?php } ?>
<?php if (!$aridiusundersell_linkshow == '1') { ?>	
	<div class="form-group <?php if (!$aridiusundersell_linkvalid) { ?>required<?php } ?>">
	<label class="control-label" for="input-link"><?php echo $enter_link; ?></label>
	<div class="input-group">
	<span class="input-group-addon"><i class="glyphicon glyphicon-link"></i></span>
	<input name="aridiusundersell_link" placeholder="<?php echo $aridiusundersell_placeholderlink[$language_id]; ?>" class="form-control"  type="text">
	</div>
	<div class="aridiusundersell_errorlink"></div>
	</div>	
	<?php } ?>
<?php if (!$aridiusundersell_commentshow == '1') { ?>	
	<div class="form-group">
	<label class="control-label" for="input-firstname"><?php echo $enter_comment; ?></label>
	<div class="input-group">
	<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
	<textarea class="form-control" name="aridiusundersell_comment" placeholder="<?php echo $aridiusundersell_placeholdercomment[$language_id]; ?>"></textarea>
	</div>
	</div>	
	<?php } ?>		
</div>
</div>
</div>
<?php if ($aridiusundersell_adddescriptionshow == '1') { ?>	
	<br />	
	<div class="row">	
	<div class="col-xs-12">
	<?php echo html_entity_decode($aridiusundersell_description[$language_id]); ?>	
	</div>
	</div>
<?php } ?>	
<br />
<button type="button" id="undersell-order-submit" data-loading-text="<?php echo $enter_load; ?>" class="btn-cart fixcenter"><?php echo $button_send; ?></button>
</div>
</div>
<script>
jQuery(function($){
	$("#telephone").mask("<?php echo $aridiusundersell_mask[$language_id]; ?>");
});
</script>