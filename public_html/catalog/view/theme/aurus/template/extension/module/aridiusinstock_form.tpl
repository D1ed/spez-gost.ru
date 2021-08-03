<?php if (!$aridiusinstock_descriptionshow == '1' || !$aridiusinstock_img == '1' ) { ?>
<div class="instock">
<?php } else { ?>
<div class="instock_fl">
<?php } ?>
<div class="instockf">
<button title="close" type="button" class="mfp-close">&#215;</button>
<div class="name-popup"><?php echo $heading_title; ?></div>
</div>
<div class="instock2">
<div class="row">
<?php if (!$aridiusinstock_descriptionshow == '1' || !$aridiusinstock_img == '1' ) { ?>
<div class="col-sm-6">
<div class="name-product"><?php echo $product_name; ?></div>
<?php if (!$aridiusinstock_img == '1') { ?>
<div class="image_wrap">
<a href="<?php echo $product_href; ?>"><img src="<?php echo $popup; ?>" title="<?php echo $product_name; ?>" alt="<?php echo $product_name; ?> class="img-responsive"></a>
</div>
<?php } ?>
<?php if (!$aridiusinstock_descriptionshow == '1') { ?>
<?php echo $product_description; ?>
<?php } ?>
</div>
<?php } ?>
<?php if (!$aridiusinstock_descriptionshow == '1' || !$aridiusinstock_img == '1' ) { ?>
<div class="col-sm-6">
<?php } else { ?>
<div class="col-sm-12">
<?php } ?>
<?php if ($aridiusinstock_descriptionshow == '1' && $aridiusinstock_img == '1' ) { ?>
<div class="name-product"><?php echo $product_name; ?></div>
<?php } ?>
<div class="form-horizontal forminstock">
<?php if (!$aridiusinstock_firstnameshow == '1') { ?>
<div class="form-group <?php if (!$aridiusinstock_firstnamevalid) { ?>required<?php } ?>">
<label class="control-label" for="input-firstname"><?php echo $enter_firstname; ?></label>
<div class="input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
<input  name="aridiusinstock_firstname" placeholder="<?php echo $aridiusinstock_placeholderfirstname[$language_id]; ?>" class="form-control"  type="text">
</div>
<div class="aridiusinstock_errorfirstname"></div>
</div>
<?php } ?>
<?php if (!$aridiusinstock_tellshow == '1') { ?>
<div class="form-group <?php if (!$aridiusinstock_tellvalid) { ?>required<?php } ?>">
<label class="control-label" for="input-contact"><?php echo $enter_phone; ?></label>
<div class="input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
<input id="telephone" name="aridiusinstock_contact" placeholder="<?php echo $aridiusinstock_placeholdertell[$language_id]; ?>" class="form-control" type="text">
</div>
<div class="aridiusinstock_errorcontact"></div>
</div>
<?php } ?>
<?php if (!$aridiusinstock_emailshow == '1') { ?>
<div class="form-group <?php if (!$aridiusinstock_emailvalid) { ?>required<?php } ?>">
<label class="control-label" for="input-email"><?php echo $enter_email; ?></label>
<div class="input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
<input name="aridiusinstock_email" placeholder="<?php echo $aridiusinstock_placeholderemail[$language_id]; ?>" class="form-control"  type="text">
</div>
<div class="aridiusinstock_erroremail"></div>
</div>
<?php } ?>
</div>
</div>
</div>
<?php if ($aridiusinstock_adddescriptionshow == '1') { ?>
	<br />
	<div class="row">
	<div class="col-xs-12">
	<?php echo html_entity_decode($aridiusinstock_description[$language_id]); ?>
	</div>
	</div>
<?php } ?>
<br />
<button type="button" id="instock-order-submit" data-loading-text="<?php echo $enter_load; ?>" class="btn btn-primary btnfast" data-product-id="<?php echo $product_id ?>"><?php echo $button_send ?></button>
</div>
</div>
<script>
jQuery(function($){
$("#telephone").mask("<?php echo $aridiusinstock_mask[$language_id]; ?>");
});
</script>