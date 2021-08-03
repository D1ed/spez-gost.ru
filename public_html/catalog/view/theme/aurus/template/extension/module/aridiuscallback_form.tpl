<div class="callback">
<div class="callbackbor">
<button title="close" type="button" class="mfp-close">&#215;</button>
<div class="name-popup"><?php echo $heading_title; ?></div>
</div>
<div class="callback2">
<div class="form-horizontal formcallback">	
<?php if (!$aridiuscallback_firstnameshow == '1') { ?>		
<div class="form-group <?php if (!$aridiuscallback_firstnamevalid) { ?>required<?php } ?>">
  <label class="control-label" for="input-firstname"><?php echo $enter_firstname; ?></label>
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="aridiuscallback_firstname" placeholder="<?php echo $aridiuscallback_placeholderfirstname[$language_id]; ?>" class="form-control"  type="text">
  </div>
  <div class="aridiuscallback_errorfirstname"></div>
</div>
<?php } ?>	
<div class="form-group required">
  <label class="control-label" for="input-contact"><?php echo $enter_phone; ?></label>
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input id="telephone" name="aridiuscallback_contact" placeholder="<?php echo $aridiuscallback_placeholdertell[$language_id]; ?>" class="form-control" type="text">
  </div>
  <div class="aridiuscallback_errorcontact"></div>
</div>

<?php if (!$aridiuscallback_emailshow == '1') { ?>		
<div class="form-group <?php if (!$aridiuscallback_emailvalid) { ?>required<?php } ?>">
  <label class="control-label" for="input-email"><?php echo $enter_email; ?></label>
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="aridiuscallback_email" placeholder="<?php echo $aridiuscallback_placeholderemail[$language_id]; ?>" class="form-control"  type="text">
  </div>
  <div class="aridiuscallback_erroremail"></div>
</div>	
<?php } ?>
<?php if (!$aridiuscallback_timetshow == '1') { ?>	
	  <div class="row">
<div class="col-sm-12" >
 <div class="form-group">
<label class="control-label" for="input-customer"><?php echo $enter_time; ?></label>
</div>
</div>
          <div class="col-sm-6" >
          <div class="form-group fixformtime2">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>            
              <input id='datetimepickerin' name="aridiuscallback_timein" placeholder="<?php echo $aridiuscallback_placeholdertimein[$language_id]; ?>" type='text' class="form-control"  />
          </div>
		  </div>
		  </div>
          <div class="col-sm-6" >
          <div class="form-group fixformtime">
                 <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>      
           <input id='datetimepickeroff' name="aridiuscallback_timeoff" placeholder="<?php echo $aridiuscallback_placeholdertimeoff[$language_id]; ?>" type='text' class="form-control"  />
          </div>
       	  </div>
           </div>
</div>
<?php } ?>
<?php if (!$aridiuscallback_commentshow == '1') { ?>	
<div class="form-group">
  <label class="control-label" for="input-comment"><?php echo $enter_comment; ?></label>
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
  <textarea class="form-control" name="aridiuscallback_comment" placeholder="<?php echo $aridiuscallback_placeholdercomment[$language_id]; ?>"></textarea>
  </div>
</div>	
<?php } ?>		
</div>	
<?php if ($aridiuscallback_adddescriptionshow == '1') { ?>
<br />		
<div class="row">	
<div class="col-xs-12">
<?php echo html_entity_decode($aridiuscallback_description[$language_id]); ?>
</div>
</div>
<?php } ?>	
<br />	
	<button type="button" id="call-order-submit" data-loading-text="<?php echo $enter_load; ?>" class="btn-cart fixcenter"><?php echo $button_send; ?></button>
	</div>
</div>
<script>
jQuery(function(a){a("#telephone").mask("<?php echo $aridiuscallback_mask[$language_id]; ?>")});
jQuery(function(a){a("#datetimepickerin, #datetimepickeroff").mask("99:99")});
</script>
