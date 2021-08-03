<div id="cart" class="btn-group btn-block cart_openp">
<button type="button" data-toggle="dropdown" data-loading-text="" class="btn btn-inverse btn-block btn-lg dropdown-toggle ">
   <img id="frame2" class="img-responsive cartphotos" alt="cart" title="cart" src="<?php echo $body_background; ?>"> 
  <span><span id="cart-total"><?php echo $text_items; ?></span>&nbsp;<span class="caret"></span></span></button>
 </div>
   
<script>
$(".cart_openp").click(function(){$.magnificPopup.open({removalDelay:500,fixedContentPos:!0,items:{src:"index.php?route=common/aridius_cart/info"},type:"ajax",mainClass:"mfp-fade"})});
</script>