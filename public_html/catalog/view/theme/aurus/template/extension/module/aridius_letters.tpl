<div class="title-module"><?php echo $aridius_letters_title[$language_id]; ?></div>
<form action="#" method="post">
	<div class="mailletters colleft input-group">
	  <input type="email" name="mail_letters2" value="" placeholder="<?php echo $aridius_letters_placeholder[$language_id]; ?>" class="mail_letters2 form-control input-lg" />
	  <span class="input-group-btn">
	  <button type="submit" class="btn btn-send btn-lg" onclick="return subscribe();" ><span class="visible-xs visible-sm visible-md batsub2"><i class="fa fa-envelope"></i></span> <span class="hidden-xs hidden-sm hidden-md" ><?php echo $aridius_letters_pl[$language_id]; ?></span></button>
	  </span>
	</div>
</form>
	  <div class="message_email"></div>	
      <div class="message_compare"></div>	
	  <div class="message_success"></div>	
<?php if ($aridius_lettersdes_status == '1') { ?>	
<?php echo html_entity_decode($aridius_letters_description[$language_id]); ?>	
<?php } ?>	


