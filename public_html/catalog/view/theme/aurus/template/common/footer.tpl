<script>
   window.bLazy = new Blazy({ 
   });
</script>
<?php if ($aurus_show_fluid_map_footer == '0') { ?>
<div class="footerh"></div>
<?php } ?>
<?php if ($aurus_show_fluid_map_footer == '0' ) { ?>
<?php if ($class_home == "/" || $class_home == "/index.php?route=common/home") { ?>
<div class="line1"></div>
<div id="hfooter">
   <div class="container ">
      <div id="map-canvas2" style="position:relative; margin: 0 auto;">
      </div>
   </div>
   <div id="map_yak"></div>
   <?php if ($aurus_map_noapi == '1') { ?>
   <div id="map_canvas" style="width:auto; height:270px;position:relative;"></div>
   <?php } else { ?>
   <?php echo $aurus_mapcode; ?>	
   <?php } ?>
</div>
<div class="line12"></div>
<?php } ?>
<?php } ?>
<?php if ($aurus_show_fluid_map_footer == '1') { ?>
<div class="footerh"></div>
<?php } ?>
<footer>
   <div class="container no-flick">
      <div class="row">
         <!--col1 contact-->	  
         <div class="col-xs-6 col-sm-4 col-md-4 <?php if ($content_mail) { ?> col-lg-2 <?php } else { ?> col-lg-3 <?php } ?>">
            <div class="footer-name"><?php echo $text_footer_contacts; ?></div>
            <ul class="list-unstyled">
               <?php if ($aurus_top_links3 && $aurus_phone_footer == '0') { ?>
               <?php foreach ($aurus_top_links3 as $aurus_top_link3) { ?>
               <li class = "footer_tell">
                  <a <?php if ($aurus_top_link3['title'][$language_id]) { ?> href="tel:<?php echo $aurus_top_link3['title'][$language_id]; ?>"<?php } ?> > <?php echo html_entity_decode ($aurus_top_link3['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></a>
               </li>
               <?php } ?>
               <?php } ?>
               <?php if ($aurus_time_footer == '0') { ?>
               <?php if (!empty($aurus_work_time)) { ?>
               <li class = "work_time work_timef ">
                  <?php echo $aurus_work_time; ?>
               </li>
               <?php } ?>
               <?php if (!empty($aurus_work_time1)) { ?>
               <li class = "work_time">
                  <?php echo $aurus_work_time1; ?>
               </li>
               <?php } ?>
               <?php if (!empty($aurus_work_time2)) { ?>
               <li class = "work_time">
                  <?php echo $aurus_work_time2; ?>
               </li>
               <?php } ?>
               <?php } ?>
               <?php if ($aurus_mail_header[$language_id] && $aurus_mail_footer == '0' ) { ?>
               <li class = "footer_mail"><a onClick="javascript:window.open('mailto:<?php echo $aurus_mail_header[$language_id];?>', 'Mail');event.preventDefault()" ><?php echo $aurus_mail_header[$language_id];?></a></li>
               <?php } ?>
               <?php if ($aurus_address[$language_id] && $aurus_address_footer == '0' ) { ?>
               <li class = "address">
                  <?php echo html_entity_decode($aurus_address[$language_id]) ?>
               </li>
               <?php } ?>
            </ul>
         </div>
         <!--col3-->			 
         <div class="col-xs-6 col-sm-4 col-md-4 <?php if ($content_mail) { ?> col-lg-2 <?php } else { ?> col-lg-3 <?php } ?>">
            <div class="footer-name"><?php echo $text_information; ?></div>
            <ul class="list-unstyled">
               <?php foreach ($informations as $information) { ?>
               <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
               <?php } ?>
               <?php if ($aurus_contact_footer !=1) { ?>
               <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
               <?php } ?>
            </ul>
         </div>
         <div class="clearfix visible-xs"> </div>
         <div class="col-xs-6 col-sm-4 col-md-4 <?php if ($content_mail) { ?> col-lg-2 <?php } else { ?> col-lg-3 <?php } ?>">
            <div class="footer-name"><?php echo $text_account; ?></div>
            <ul class="list-unstyled">
               <?php if ($aurus_account_footer !=1) { ?>
               <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
               <?php } ?>
               <?php if ($aurus_order_footer !=1) { ?>
               <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
               <?php } ?>
               <?php if ($aurus_wishlist_footer !=1) { ?>
               <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
               <?php } ?>
               <?php if ($aurus_newsletter_footer !=1) { ?>
               <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
               <?php } ?>
               <?php if ($aurus_return_footer !=1) { ?>
               <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
               <?php } ?>
            </ul>
         </div>
         <div class="clearfix visible-sm visible-md"> </div>
         <!--col5-->			 
         <div class="col-xs-6 col-sm-4 col-md-4 <?php if ($content_mail) { ?> col-lg-2 <?php } else { ?> col-lg-3 <?php } ?>">
            <div class="footer-name"><?php echo $text_extra; ?></div>
            <ul class="list-unstyled" >
               <?php if ($aurus_manufacturer_footer !=1) { ?>
               <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
               <?php } ?>
               <?php if ($aurus_voucher_footer !=1) { ?>
               <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
               <?php } ?>
               <?php if ($aurus_affiliate_footer !=1) { ?>
               <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
               <?php } ?>
               <?php if ($aurus_sitemap_footer !=1) { ?>
               <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
               <?php } ?>
               <?php if ($aurus_special_footer !=1) { ?> 
               <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
               <?php } ?>
            </ul>
         </div>
         <div class="content_mail col-xs-12 col-sm-8 col-md-4 col-lg-4">
            <?php if (!empty($content_mail)) { ?>
            <div class="footer-name"><?php echo $text_footer_send; ?></div>
            <div class="footer_mailtext_back">
               <?php echo $content_mail; ?>
            </div>
            <?php } ?>
         </div>
         <div class="clearfix visible-lg"> </div>
         <div class="col-xs-6 col-sm-4 col-md-4 col-lg-6">
            <div class="setifooter">
               <?php if ($aurus_top_links2 ) { ?>
               <?php foreach ($aurus_top_links2 as $aurus_top_link2) { ?>
               <a <?php if ($aurus_top_link2['link_top']) { ?> href="<?php echo $aurus_top_link2['link_top']; ?>" target="_blank" <?php } ?>><?php if ($aurus_top_link2['faicons_top']) { ?><span class=" setib fa-stack fa-xs"><i data-toggle="tooltip" title="<?php echo $aurus_top_link2['tooltipseti']; ?>" class="<?php echo $aurus_top_link2['faicons_top']; ?> fa-stack-1x fa-inverse"></i></span><?php } ?></a>
               <?php } ?>
               <?php } ?>
            </div>
         </div>
         <div class="col-xs-6 col-sm-4 col-md-4 col-lg-6">
            <div class="footer_add">
               <?php if (!empty($footer_pay)) { ?>
               <img class="img-responsive rigimg" alt="payment" title="payment" src="<?php echo $footer_pay; ?>">
               <?php } ?>
            </div>
         </div>
         <div class="clearfix"> </div>
         <div class="col-xs-12">
            <div class="copyrightf">
               <?php echo html_entity_decode($aurus_license_text[$language_id]); ?>	
            </div>
         </div>
         <?php if ($content_top3) { ?>
         <div class="col-xs-12">
            <div class="footer_line"> </div>
            <?php echo $content_top3; ?>
         </div>
         <?php } ?>	
         <div class="clearfix"> </div>
         <div class="col-sm-9 ">
            <span class="col-sm-12 counter-footer">
            <?php echo html_entity_decode($aurus_counter); ?>
            </span>
         </div>
      </div>
   </div>
</footer>
<!--
   OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
   Please donate via PayPal to donate@opencart.com
   //-->
<!--код tooltip-->
<script><!--
   $(document).ready(function(){
   $(".tooltip-examples a").tooltip();
   $(".tooltip-examples button").tooltip();
   });
   //-->
</script>
<?php if ($aurus_show_fluid_map_footer == '0' && $aurus_map_noapi == '1') { ?>
<script src="https://maps.googleapis.com/maps/api/js?key=<?php echo $aurus_fluid_map_key; ?>&language=<?php echo $language_code; ?>"></script>
<script><!--
   function initialize() {
   var latlng = new google.maps.LatLng(<?php echo $aurus_latitude_fluid_map[$language_id]; ?>, <?php echo $aurus_longitude_fluid_map[$language_id]; ?>);
   <?php if(isset($aurus_map_links) && is_array($aurus_map_links)) foreach ($aurus_map_links as $key => $aurus_map_link) {  ?>
   var pos<?php echo $key; ?> = new google.maps.LatLng(<?php echo $aurus_map_link['latitude'][$language_id]; ?>, <?php echo $aurus_map_link['longitude'][$language_id]; ?>);
   <?php } ?>
   var settings = {
   zoom: <?php echo $aurus_fluid_map_zoom; ?>,
   center: latlng,
   zoomControl: true,
   scrollwheel: false,
   mapTypeControl: false,
   navigationControl: true,
   navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
   mapTypeId: google.maps.MapTypeId.ROADMAP,
   zoomControlOptions: {
   position: google.maps.ControlPosition.BOTTOM_CENTER
   },
   streetViewControlOptions: {
   position: google.maps.ControlPosition.RIGHT_TOP
   },
   styles: [
   {
   "featureType": "landscape.natural",
   "elementType": "geometry.fill",
   "stylers": [
   { "color": "#F2F2F2" }
   ]
   },
   {
   "featureType": "landscape.man_made",
   "stylers": [
   { "color": "#ffffff" },
   { "visibility": "off" }
   ]
   },
   {
   "featureType": "water",
   "stylers": [
   { "color": "#B4E5F0" },
   { "saturation": 0 }
   ]
   },
   {
   "featureType": "road.arterial",
   "elementType": "geometry",
   "stylers": [
   { "color": "#FDFDFD" }
   ]
   }
   ,{
   "elementType": "labels.text.stroke",
   "stylers": [
   { "visibility": "off" }
   ]
   }
   ,{
   "elementType": "labels.text",
   "stylers": [
   { "color": "#333333" }
   ]
   }
   ,{
   "featureType": "poi",
   "stylers": [
   { "visibility": "off" }
   ]
   }
   ]
   //------------конец --------------
   };
   var map = new google.maps.Map(document.getElementById("map_canvas"), settings);
   <?php if ($aurus_description_map_logo) { ?>
   var contentString = '<div id="content">'+
   '<div id="siteNotice">'+
   '</div>'+
   '<div id="bodyContent">'+
   '<?php echo html_entity_decode($aurus_description_map_logo[$language_id]); ?>'+
   '</div>'+
   '</div>';
   var infowindow = new google.maps.InfoWindow({
   content: contentString
   });
   <?php } ?>
   <?php if(isset($aurus_map_links) && is_array($aurus_map_links)) foreach ($aurus_map_links as $key => $aurus_map_link) {  ?>
   <?php if ($aurus_map_link['title'][$language_id]) { ?>
   var contentString<?php echo $key; ?> = '<div id="content<?php echo $key; ?>">'+
   '<div id="siteNotice<?php echo $key; ?>">'+
   '</div>'+
   '<div id="bodyContent<?php echo $key; ?>">'+
   '<?php echo html_entity_decode($aurus_map_link['title'][$language_id]); ?>'+
   '</div>'+
   '</div>';
   var infowindow<?php echo $key; ?> = new google.maps.InfoWindow({
   content: contentString<?php echo $key; ?>
   });
   <?php } ?>
   <?php } ?>
   var companyImage = new google.maps.MarkerImage('<?php echo $map_img; ?>',
   new google.maps.Size(80,80),
   new google.maps.Point(0,0),
   new google.maps.Point(50,50)
   );
   var companyMarker = new google.maps.Marker({
   position: latlng,
   map: map,
   icon: companyImage,
   zIndex: 3});
   <?php if(isset($aurus_map_links) && is_array($aurus_map_links)) foreach ($aurus_map_links as $key => $aurus_map_link) {  ?>
   var marker<?php echo $key; ?> = new google.maps.Marker({
   position: pos<?php echo $key; ?>,
   map: map,
   icon: companyImage,
   zIndex: 3});
   <?php } ?>
   <?php if ($aurus_show_info_marker_block !=1) { ?>
   google.maps.event.addListener(companyMarker, 'mouseover', function() {
   infowindow.open(map,companyMarker);
   });
   <?php if(isset($aurus_map_links) && is_array($aurus_map_links)) foreach ($aurus_map_links as $key => $aurus_map_link) {  ?>
   <?php if ($aurus_map_link['title'][$language_id]) { ?>  
   google.maps.event.addListener(marker<?php echo $key; ?>, 'mouseover', function() {
   infowindow<?php echo $key; ?>.open(map,marker<?php echo $key; ?>);
   });
   <?php } ?>   
   <?php } ?>
   <?php } ?>
   }
   google.maps.event.addDomListener(window, 'load', initialize);
   //-->
</script>
<?php } ?>
<?php if ($aurus_show_map_open == '1') { ?>
<script>
   $(document).ready(function(){
   $('#hfooter').prepend('<a class="link_footer"><i class="fa fa-map-marker"></i> <?php echo $text_map_open; ?></a>');
   $('#hfooter').css({'height': 50, 'opacity': 0.5, 'overflow': 'hidden' });
   $('.link_footer').on("click", function(){
   $('#hfooter').animate({
   height:270,
   opacity: 0.9
   }, 1200 );
   $('.link_footer').remove();
   });
   });
</script> 
<?php } ?>
</body></html>
