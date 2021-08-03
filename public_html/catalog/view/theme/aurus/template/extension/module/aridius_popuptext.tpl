<div id="textModal" class="modal fade">
  <div class="ptext modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      </div>
      <div class="modal-body">
<?php echo html_entity_decode($aridius_popuptext_description[$language_id]); ?>
      </div>
    </div>
  </div>
</div>
<script>
// 1 min = 1000ms*60s*60min = 60000ms
$(function() {
  var dateModalShow = localStorage.getItem("dateModalShow");
  var currentDate = new Date().toString();
  var currentDate2 = new Date();
  var currentDay = currentDate2.getDay();
  var period = (((new Date(currentDate)).getTime())- ((new Date(dateModalShow)).getTime()))/60000;
  if ( ((dateModalShow==null) || (period><?php echo $aridius_popuptext_time; ?>))
  <?php if ($aridius_popuptext_day == '0') { ?>
	 && ((currentDay==0) || (currentDay==1) || (currentDay==2) || (currentDay==3) || (currentDay==4) || (currentDay==5) || (currentDay==6))
	<?php } elseif ($aridius_popuptext_day == '2') { ?>
	 && ((currentDay==1) || (currentDay==2) || (currentDay==3) || (currentDay==4) || (currentDay==5))
	<?php } elseif ($aridius_popuptext_day == '3') { ?>
     && ((currentDay==0) || (currentDay==6))
  <?php } ?>
  ) {
setTimeout(function(){	
    $("#textModal").modal('show');
// save date open popup modal in LocalStorage
    localStorage.setItem("dateModalShow", currentDate);
},<?php echo $aridius_popuptext_delay; ?>*1000);	
  }
});
</script>

