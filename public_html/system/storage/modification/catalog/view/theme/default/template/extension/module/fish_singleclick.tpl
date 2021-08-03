<?php if ((isset($showl)) && ($showl)) { ?>
 <?php
    // title font
	if ((isset($titlefont)) && ($titlefont)) { 
	$regfonts = array('Arial', 'Verdana', 'Helvetica', 'Lucida Grande', 'Trebuchet MS', 'Times New Roman', 'Tahoma', 'Georgia' );
    if (in_array($titlefont, $regfonts)==false) { ?>
    <link href='//fonts.googleapis.com/css?family=<?php echo $titlefont; ?>:400,500,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
    <?php } }?>
    <?php   
     // body font
	if ((isset($bodyfont)) && ($bodyfont)) { 
	$regfonts = array('Arial', 'Verdana', 'Helvetica', 'Lucida Grande', 'Trebuchet MS', 'Times New Roman', 'Tahoma', 'Georgia' );
    if (in_array($bodyfont, $regfonts)==false) { ?>
    <link href='//fonts.googleapis.com/css?family=<?php echo $bodyfont; ?>:400,500,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
    <?php } }?>


 <?php if (isset($showstyle) && ($showstyle)) { ?>
 <link href="catalog/view/theme/default/stylesheet/fishstylesheet<?php echo $showstyle; ?>.css<?php echo isset($file_version_fishstylesheet[$showstyle]) ? '?v=' . $file_version_fishstylesheet[$showstyle] : ''; ?>" rel="stylesheet">
 <?php } else { ?>
<link href="catalog/view/theme/default/stylesheet/fishstylesheet0.css" rel="stylesheet">
 <?php }  ?>
 
  <?php if ($showbigimage) { ?>
  <script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/jquery/magnific/magnific-popup.css" rel="stylesheet">
  <?php } ?> 
  

                <?php //Multi Fish Landing 2.3.x Begin ?>
                <link href="catalog/view/theme/default/stylesheet/multifishstylesheet.css<?php echo isset($file_version_multifishstylesheet) ? '?v=' . $file_version_multifishstylesheet : ''; ?>" rel="stylesheet">
                <?php //Multi Fish Landing 2.3.x End ?>
            
<style>
<?php if ($showmenu2) { ?>.topmenu.default{opacity: 0;visibility: hidden; height:1px;} 
.topmenu.default{
    -webkit-transform: translateY(-100%);
    -moz-transform: translateY(-100%);
    -ms-transform: translateY(-100%);
    -o-transform: translateY(-100%);
    transform: translateY(-100%);  }
	<?php }  ?>
<?php if ($bodyfon) { ?> body, body .modal-content, body .modal-dialog {background-color:<?php echo $bodyfon; ?>;} 
.block-divider .dc {border-color:<?php echo $bodyfon; ?>;} <?php } ?> 	
<?php if ($colormenutext) { ?> .topmenu a, .topmenu .mobilebutton, .topmenu .btn-group>.btn{ color:<?php echo $colormenutext; ?>;}  <?php }  ?>	
<?php if ($colormenu) { ?> .topmenu { background:<?php echo $colormenu; ?>;}  <?php }  ?>		
<?php if ($colorfootertext) { ?>  footer, footer a, footer a:hover { color:<?php echo $colorfootertext; ?>;}  <?php }  ?>	
<?php if ($colorfooter) { ?> footer { background-color:<?php echo $colorfooter; ?>;}  <?php }  ?>	
<?php if ($colorsaletext) { ?> .big-saletext-box .big-saletext1,.big-saletext-box .big-saletext2, .big-saletext-box .big-toptext3, #note{ color:<?php echo $colorsaletext; ?>;} <?php }  ?>						   							<?php if ($colorsale) { ?> .colorsale {background-color:<?php echo $colorsale; ?>;} <?php } ?> 
<?php if ($imgfon_sale) { ?> .colorsale { background-image: url(<?php echo $imgfon_sale; ?>);} <?php } ?>
<?php if ($coloradvtext) { ?>.coloradv { color:<?php echo $coloradvtext; ?>;}
                               .fish_adv .item { border-color:<?php echo $coloradvtext; ?>;} <?php }  ?>
<?php if ($coloradv) { ?> .coloradv { background-color:<?php echo $coloradv; ?>;} <?php } ?>
<?php if ($img_adv) { ?> .coloradv { background-image: url(<?php echo $img_adv; ?>);} <?php } ?> 							   
<?php if ($colorprodtext) { ?> .colorprod .fish_prod > div > a , .colorprod .bigtitle { color:<?php echo $colorprodtext; ?>;}
                               .colorprod .bigtitle + i{ background-color:<?php echo $colorprodtext; ?>;} <?php }  ?>
<?php if ($colorprod) { ?> .colorprod { background-color:<?php echo $colorprod; ?>;} <?php }  ?>
<?php if ($img_prod) { ?> .colorprod { background-image: url(<?php echo $img_prod; ?>);} <?php } ?>	
<?php if ($colorprodtexta) { ?>.colorproda .bigtitle, .colorproda .fish_prod > div > a div, .colorproda .fish_prod h4 { color:<?php echo $colorprodtexta; ?>;}
                               .colorproda .bigtitle + i{ background-color:<?php echo $colorprodtexta; ?>;} <?php }  ?>	
<?php if ($colorproda) { ?> .colorproda { background-color:<?php echo $colorproda; ?>;} <?php }  ?>	
<?php if ($img_proda) { ?> .colorproda { background-image: url(<?php echo $img_proda; ?>);} <?php } ?>			   
<?php if ($colorcustomtext) { ?> .custombox, .custombox a  { color:<?php echo $colorcustomtext; ?>;}
                               .custombox .bigtitle:after{ background-color:<?php echo $colorcustomtext; ?>;} <?php }  ?>	
<?php if ($colorreviewtext) { ?>.colorreview .bigtitle{ color:<?php echo $colorreviewtext; ?>;}
                               .colorreview .bigtitle + i{ background-color:<?php echo $colorreviewtext; ?>;} <?php }  ?>
<?php if ($colorreview) { ?> .colorreview { background-color:<?php echo $colorreview; ?>;} <?php } ?> 
<?php if ($img_review) { ?> .colorreview { background-image: url(<?php echo $img_review; ?>);} <?php } ?>
<?php if ($colorcarousel) { ?> .colorcarousel { background-color:<?php echo $colorcarousel; ?>;} <?php } ?> 
<?php if ($img_carousel) { ?> .colorcarousel { background-image: url(<?php echo $img_carousel; ?>);} <?php } ?>							   
<?php if ($colorcarouseltext) { ?>.colorcarousel .bigtitle, .colorcarousel .undertitle{ color:<?php echo $colorcarouseltext; ?>;}
                               .colorcarousel .bigtitle + i{ background-color:<?php echo $colorcarouseltext; ?>;} <?php }  ?>	
<?php if ($colortextbox) { ?> .fish_box {background-color:<?php echo $colortextbox; ?>;} <?php } ?> 								   
<?php if ($colorcustom) { ?> .colorcustom { background-color:<?php echo $colorcustom; ?>;} <?php } ?>	
<?php if ($img_custom) { ?> .colorcustom { background-image: url(<?php echo $img_custom; ?>);} <?php } ?>	
<?php if ((isset($titlefont)) && ($titlefont)) {  $fontpre =  $titlefont; $font1 = str_replace("+", " ", $fontpre); ?>  
.bigtitle, h1, .bigtitle.modal-title{ font-family: '<?php echo $font1; ?>';}
		<?php } ?>	
<?php if ((isset($bodyfont)) && ($bodyfont)) { $fontpre =  $bodyfont; $font1 = str_replace("+", " ", $fontpre); ?> 
 body, .button{ font-family: '<?php echo $font1; ?>';}
		<?php } ?>	
<?php if (isset($bodyfont_size) && ($bodyfont_size != 'none')) {  ?>
@media (min-width: 768px) {  body { font-size: <?php echo $bodyfont_size; ?>px;} }
		<?php } ?>		
<?php if (isset($titlefonth1_size) && ($titlefonth1_size  != 'none')) { ?>		
@media (min-width: 768px) {	h1 { font-size: <?php echo $titlefonth1_size; ?>px;} }
<?php } ?>								   					   
	 <?php if ((isset($titlefonth1_weigh)) && ($titlefonth1_weigh)) { ?>  h1 {font-weight: normal; } <?php } ?>	
	 <?php if ((isset($titlefonth1_trans)) && ($titlefonth1_trans)) { ?>  h1 {text-transform:none; } <?php } ?>
<?php if (isset($titlefonth2_size) && ($titlefonth2_size  != 'none')) { ?>		
@media (min-width: 768px) {	.bigtitle { font-size: <?php echo $titlefonth2_size; ?>px;} }
<?php } ?>								   					   
	 <?php if ((isset($titlefonth2_weigh)) && ($titlefonth2_weigh)) { ?>  .bigtitle {font-weight: normal; } <?php } ?>	
	 <?php if ((isset($titlefonth2_trans)) && ($titlefonth2_trans)) { ?>  .bigtitle {text-transform:none; } <?php } ?>
<?php if (isset($titlefonth3_size) && ($titlefonth3_size  != 'none')) { ?>		
.middletitle, h2 { font-size: <?php echo $titlefonth3_size; ?>px;} 
<?php } ?>								   					   
	 <?php if ((isset($titlefonth3_weigh)) && ($titlefonth3_weigh)) { ?>  .middletitle, h2 {font-weight: bold; } <?php } ?>	
	 <?php if ((isset($titlefonth3_trans)) && ($titlefonth3_trans)) { ?>  .middletitle, h2 {text-transform:none; } <?php } ?>	 	 	 

</style>


</head>
<body class="common-home">
  <header>          
<?php if ($showmenu) { ?>

     <div class="topmenu default">
     <div class="mobilebutton"><i class="fa fa-bars"></i></div>
       <div class="boxmenu"> 
       <?php echo $languagefish; ?>
          <?php if ($topmenu1) { ?> <a href ="#menu1"><?php echo $topmenu1; ?></a><?php } ?>
          <?php if (($showsale) && ($topmenu2)) { ?> <a href ="#menu2"><?php echo $topmenu2; ?></a><?php } ?>
          <?php if (($showadv) && ($topmenu3)) { ?> <a href ="#menu3"><?php echo $topmenu3; ?></a><?php } ?>
          <?php if (($showprod) && ($topmenu4)) { ?> <a href ="#menu4"><?php echo $topmenu4; ?></a><?php } ?>
          <?php if (($showproda) && ($topmenu4a)) { ?> <a href ="#menu4a"><?php echo $topmenu4a; ?></a><?php } ?>
          <?php if ((isset($fish_box)) && ($topmenu5)) { ?> <a href ="#menu5"><?php echo $topmenu5; ?></a><?php } ?>
          <?php if (($showreview) && ($topmenu6)) { ?> <a href ="#menu6"><?php echo $topmenu6; ?></a><?php } ?>
           <?php if (($showcarousel) && ($topmenu6a)) { ?> <a href ="#menu6a"><?php echo $topmenu6a; ?></a><?php } ?>
          <?php if (($showcustom) && ($topmenu7)) { ?> <a href ="#menu7"><?php echo $topmenu7; ?></a><?php } ?>
          <?php if ((($customcontact1) || ($customcontact2)) && ($topmenu8)) { ?> <a href ="#menu8"><?php echo $topmenu8; ?></a><?php } ?>
           <?php if (isset($fish_headerlink)) { ?>
          <?php foreach ($fish_headerlink as $result) { ?>
          <a href="<?php echo $result['link']; ?>"  <?php if ($result['blank']) { ?>target="_blank"<?php } ?>><?php echo $result['text']; ?></a>
          <?php }  ?>  
         <?php }  ?> 
    </div>
    
     </div>
      <?php } ?>
    
  <div class="container" id="menu1">
    <div class="row">

     <div class="col-md-5 col-sm-2 col-xs-12"></div>
      <div class="col-md-7 col-sm-10 col-xs-12">
      
       <div class="row">
       <div class="col-sm-5  col-xs-12 logo">
         <div id="logo">
          <?php if ($logo) { ?>
            <?php if ($home == $og_url) { ?>
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
            <?php } else { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } ?>
          <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
        
        </div>
         <div class="col-sm-7  col-xs-12 top-contact">
        <?php if ($phone) { ?><div class="big-phone"><?php echo $phone; ?></div><?php } ?>
         <?php if ($topcontact) { ?><div class="big-topcontact"><?php echo $topcontact; ?></div><?php } ?>
         <div class="feedcall button"><span><?php echo $text_order; ?></span></div>
         </div>
         
      
      <div class="col-xs-12">
       <?php if ($toptext1 || ($toptext2) || ($toptext3)) { ?>
      <div class="big-toptext-box bounceInRight wow">
       <?php if ($toptext1) { ?> <div class="big-toptext1"><h1><?php echo $toptext1; ?></h1></div><?php } ?>
       <?php if ($toptext2) { ?> <div class="big-toptext2"><h2><?php echo $toptext2; ?></h2></div><?php } ?>
       <?php if ($toptext3) { ?> <div class="big-toptext3"><?php echo $toptext3; ?></div><?php } ?>
       </div>
       <?php } ?>
      </div>
     </div>
     
    </div>
  </div>
  </div>
</header>



<div id="fishslider" <?php if (isset($slider_height)) { ?>style="height:<?php echo $slider_height; ?>px"<?php } ?>> 
<?php if (isset($fish_slider)) { ?>
<ul>
  <?php foreach ($fish_slider as $banner) { ?>
  <li data-background="<?php echo $banner['image']; ?>"></li>
  <?php } ?>
  </ul>
   <?php } ?>
  </div>
<?php if (isset($fish_slider)) { ?>
<script type="text/javascript"><!--
$(document).ready(function(){
		new flickerplate({
	selector: '#fishslider',
	arrows: false,
	autoFlickDelay: <?php echo $slider_speed; ?>,
	dots: false,
});
	});
--></script>
 <?php } ?>
 
 <?php if ($showsale) { ?>
 <!--sale-->
 <div id="menu2" class="colorsale bigblock">
 <div class="container">
    <div class="row">
     <div class="col-md-5 col-sm-12">

<div id="fast_order_form2"  class="viewblock fast_order_form">
         
         <?php if ($img_sale) { ?>
       <div class="icon_sale"><img src="<?php echo $img_sale; ?>"  alt="sale" /> </div>
       <?php } ?>
      <p class="entrycallback middletitle"><?php echo $entry_callback; ?><br /><?php echo $text_helptext; ?></p>
        <input id="order_status_id2" type="hidden" value="<?php echo $order_status_id; ?>">
        <div class="customer_name"><input type="text" id="customer_name2" placeholder="<?php echo $text_name; ?>"/></div>
        <div class="customer_phone"><input type="text" id="customer_phone2" placeholder="<?php echo $text_phone; ?>"/></div>
         <div class="customer_email"><input type="text" id="customer_email2" placeholder="<?php echo $text_email; ?>"/></div>
         <div class="customer_message"><input type="hidden"  id="customer_message2" name="customer_message"/></div>	
        <?php if ($is_capcha) { ?>
            <input id="pr2" type="text" placeholder="<?php echo $text_captcha; ?>">     
            <?php 
            $i=1;
            do
            {
            $num[$i] = mt_rand(0,9);
            echo "<img src='catalog/view/javascript/fish_singleclick/img/".$num[$i].".gif' alt='captcha'>";
            $i++;
            }
            while ($i<5);
            $captcha = $num[1].$num[2].$num[3].$num[4];
            ?>
            <input id="captcha2" type="hidden" value="<?php echo $captcha ;?>">
        <?php } ?>
        <div class="fish_agree"><input id="fish_agree2" type="checkbox" name="fish_agree" value="1" checked="checked"/>&nbsp;<?php echo $text_fish_agree; ?></div>
        <button id="fast_order_button2" class="button"><span><?php echo $text_send; ?></span></button>
        <p id="fast_order_result2" class="fast_order_result"></p>

      </div>
      </div>
   


      <div class="col-md-7 col-sm-12">
      
       <div class="big-saletext-box">
        <?php if ($saletext1) { ?><div class="big-saletext1 bigtitle"><?php echo $saletext1; ?></div><?php } ?>
        <?php if ($saletext2){ ?><div class="big-saletext2 middletitle"><?php echo $saletext2; ?></div><?php } ?>
       <?php if ($saletext3) { ?> <div class="big-toptext3"><?php echo $saletext3; ?></div><?php } ?>
       </div>
 <?php if ($showsale2) { ?>       
<div class="big-saletimer-box">  
<div id="countdown"></div>
<p id="note"></p>
<script type="text/javascript" src="catalog/view/javascript/countdown/jquery.countdown.js"></script>     
<script type="text/javascript">
$(function(){
	
	var note = $('#note'),
		ts = new Date(<?php echo $year; ?>, <?php echo $month; ?>, <?php echo $day; ?>);

		
	$('#countdown').countdown({
		timestamp	: ts,
		callback	: function(days, hours, minutes){
			
			var message = "";
			
			message += "<?php echo $entry_live; ?>";
			message += days +" <?php echo $entry_day; ?>, ";
			message +=  + hours + " <?php echo $entry_hour; ?>, ";
			message +=  + minutes + " <?php echo $entry_min; ?> ";
			
			
			note.html(message);
		}
	});
	
});


</script>
</div>      
<?php } ?>      
      
      </div>
      
     </div>
     </div>
     
     </div>
     <!--end sale-->
<?php } ?>


 <?php if ($showadv) { ?>
 <!--advantages-->
 <div id="menu3" class="bigblock coloradv">
 <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <?php if ($advtext != '') { ?><div class="big-zxctext bigtitle"><?php echo $advtext; ?></div><?php } ?>  
        

<?php if (isset($fish_adv)) { ?>
        
<div class="fish_zxc">

 <?php for ($i = 0; $i < count($fish_adv);) { ?>
 
 <div class="col-sm-6 <?php if ($i == 0) { ?> bounceInLeft<?php } else { ?>bounceInRight<?php }  ?> wow">
  <?php $j = $i + ceil(count($fish_adv) / 2); ?>
  <?php for (; $i < $j; $i++) { ?>
     <?php if (isset($fish_adv[$i])) { ?>
     <div class="item">
     <?php if ($fish_adv[$i]['image']) { ?>
     <div class="zxc-img"><img src="<?php echo $fish_adv[$i]['image']; ?>" alt=""></div>
     <?php } ?>
     <div class="zxc333-text"><?php echo $fish_adv[$i]['text']; ?></div>
     <i class="ring"></i>
     </div>

   <?php }  ?>
  <?php }  ?>
</div> 

 <?php }  ?>       
 </div>
<?php } ?> 



    </div>
    </div>
    </div>
    </div>
        <!--end advantages-->
<?php } ?>


 <?php if ($showprod) { ?>
 <!--products-->
 <div id="menu4" class="bigblock colorprod">
 <div class="container">
    <div class="row">
      <div class="col-sm-12">
       <?php if ($prodtext != '') { ?> <div class="big-zxctext bigtitle"><?php echo $prodtext; ?></div><i></i>  <?php } ?>    

<?php if (isset($fish_prod)) { ?>
        
<div class="fish_prod row">

<?php foreach ($fish_prod as $result) { ?>
     <div class="item col-md-<?php echo $columnprod; ?> col-sm-<?php echo $columnprod2; ?> col-xs-12 fadeInUp wow">
     <a class="feedcall">
    
     <?php if ($result['image']) { ?> 
     <div class="fish_prod_img">
     <img src="<?php echo $result['image']; ?>" alt="" class="img-responsive"></div>
     <?php } ?> 
   
   <div class="fish_prod_descr">  
     <?php if ($result['price']) { ?>
     <div class="fish-price"><?php echo $result['price']; ?></div>
     <?php } ?>
      <div class="sm-button"><?php echo $text_learn; ?></div>
      <?php if ($result['text']) { ?><div class="descr"><?php echo $result['text']; ?></div><?php } ?>
   </div>
    
     <?php if (isset($result['popaptext']) && (strlen($result['popaptext']) > 11)) { ?>
     <div class="fish-popaptext"><?php echo $result['popaptext']; ?></div>
     <?php } ?>
     </a>  
     </div>
 <?php }  ?>       
 </div>
<?php } ?> 

</div>
</div>
</div>
</div>

        <!--end products-->
<?php } ?>

 <?php if ($showproda) { ?>
 <!--products bd-->
 <div id="menu4a" class="bigblock colorproda">
 <div class="container">
    <div class="row">
      <div class="col-sm-12">
       <?php if ($prodtexta != '') { ?> <div class="big-zxctext bigtitle"><?php echo $prodtexta; ?></div><i></i> <?php } ?>     

<?php if (isset($products)) { ?>
        
<div class="fish_prod row">

<?php foreach ($products as $result) { ?>
     <div class="item col-md-<?php echo $columnproda; ?> col-sm-<?php echo $columnprod2a; ?> col-xs-12 fadeInUp wow">
     <a href="<?php echo $result['href']; ?>" target="_blank">
    
     <?php if ($result['thumb']) { ?> 
     <div class="fish_prod_img">
      <img src="<?php echo $result['thumb']; ?>" alt="<?php echo $result['name']; ?>" class="img-responsive"></div>
    
     <?php } ?>
     
       <div class="fish_prod_descr"> 
       <h4 class="middletitle"><?php echo $result['name']; ?></h4>    
      <?php if ($result['price']) { ?>
       <?php if ($result['special']) { ?>
     <div class="fish-price"><del><?php echo $result['price']; ?></del><?php echo $result['special']; ?></div>
     <?php } else { ?>
      
                <?php if (!$result['special']) { ?>
                    <div class="fish-price"><?php echo $result['price']; ?></div>
                <?php } else { ?>
                    <span class="price-new"><?php echo $result['special']; ?></span> <span class="price-old"><?php echo $result['price']; ?></span>
                <?php } ?>
            
     <?php } ?>
     <?php } ?>
    <div class="sm-button"><?php echo $text_learn; ?></div>
     <?php if ($result['description']) { ?>
     <div class="descr"><?php echo $result['description']; ?></div>
     <?php } ?>
     </div>
     </a>  
     </div>
 <?php }  ?>       
 </div>
<?php } ?> 

</div>
</div>
</div>
</div>

        <!--end products bd-->
<?php } ?>


 <!--text blocks-->
<?php if (isset($fish_box)) { ?>
        
<div id="menu5" class="fish_box">

<?php foreach ($fish_box as $key => $result) { ?>
   <div class="container">
    <div class="row">
    <div class="col-sm-12"> 

    <div class="bgfon">
    <div class="container">
    <div class="row">
  <?php if(($key % 2) == 0){ ?>
     <div class="col-md-6 bgfon0">   
     <div class="bgfon-text fadeIn wow">
    <?php if ($result['text']) { ?> <div class="bigtitle"><?php echo $result['text']; ?></div><?php } ?>  
     <?php if ($result['mdtext']) { ?><div class="middletitle"><?php echo $result['mdtext']; ?></div><?php } ?>
    <?php if (isset($result['smtext']) && (strlen($result['smtext']) > 11)) { ?> <div class="fish-smtext"><?php echo $result['smtext']; ?></div><?php } ?>
     </div>
    </div>
     <div class="col-md-6 bgfon-img" <?php if ($result['image']) { ?>style="background-image: url(<?php echo $result['image']; ?>);"<?php } ?>>
        <?php if (isset($result['overtext']) && (strlen($result['overtext']) > 11)) { ?> <div class="fish-overtext"><?php echo $result['overtext']; ?></div><?php } ?>
     </div>
    
     <?php } else {  ?>
     <div class="col-md-6 bgfon-img bgimg1" <?php if ($result['image']) { ?>style="background-image: url(<?php echo $result['image']; ?>);"<?php } ?>>
     <?php if (isset($result['overtext']) && (strlen($result['overtext']) > 11)) { ?>  <div class="fish-overtext"><?php echo $result['overtext']; ?></div><?php } ?>
     </div>
      <div class="col-md-6 bgfon1">   
     <div class="bgfon-text">
       <?php if ($result['text']) { ?> <div class="bigtitle"><?php echo $result['text']; ?></div><?php } ?>  
        <?php if ($result['mdtext']) { ?> <div class="middletitle"><?php echo $result['mdtext']; ?></div><?php } ?>
      <?php if ($result['smtext']) { ?><div class="fish-smtext"><?php echo $result['smtext']; ?></div><?php } ?>
     </div>
    </div>

      <?php }  ?>  
    
    </div>
    
    </div>
    
    </div>

</div>
</div>
</div>
 <?php }  ?>       
 </div>

 <script type="text/javascript"><!--
 $("iframe").wrap("<div class='fish-video'></div>");
              function Indentation() {
              var p = $(".bgfon");
               if(p.size() > 0) {
               p.width($('body').width());
               p.css("left", "0px");
               var position = p.offset();
               p.css("left", "-" + position.left + "px");
               p.find(".bgfon0 .bgfon-text").css("padding-left", position.left);
			   p.find(".bgfon1 .bgfon-text").css("padding-right", position.left);                  
          }              
               }
     
     Indentation();
     
     $(window).resize(function() {
         Indentation();
     });
        //--></script>    
  <?php }  ?>     
      
 
 
  <?php if ($showreview) { ?>
 <!--reviews-->
 <div id="menu6" class="colorreview bigblock">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <?php if ($reviewtext != '') { ?><div class="big-zxctext bigtitle"><?php echo $reviewtext; ?></div><i></i> <?php }  ?>  
         <div class="feedcall button fadeIn wow"><span><?php echo $entry_review; ?></span></div>
        </div>
        </div>
    
        </div>
     <div class="block-divider"><div class="dc dc-1">&nbsp;</div><div class="dc dc-2">&nbsp;</div></div>
 </div>
 <div class="container">
    <div class="row">
      <div class="col-sm-12"> 
      <?php if (isset($fish_review)) { ?>
        
<div class="fish_review row">

<?php foreach ($fish_review as $result) { ?>
     <div class="item col-md-<?php echo $columnreview; ?> col-sm-<?php echo $columnreview2; ?> col-xs-12 fadeInUp wow">
  
     <?php if ($result['reviewtext']) { ?><div class="fish-reviewtext"><?php echo $result['reviewtext']; ?></div> <?php }  ?>
     <?php if ($result['image']) { ?> 
      <div class="fish_review_img"><img src="<?php echo $result['image']; ?>" alt=""></div>
     <?php } ?>
     
    <?php if ($result['text']) { ?><div class="fish-reviewbuyer"><?php echo $result['text']; ?></div> <?php }  ?>  


     </div>
 <?php }  ?>       
 </div>
<?php } ?> 
      </div>
      </div>
      </div>  
 <!--end reviews-->      
 <?php }  ?>  
 
<?php if ($showcarousel) { ?>
 <!--carousel-->

 <div id="menu6a" class="colorcarousel bigblock">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <?php if ($carouseltext != '') { ?><div class="big-zxctext bigtitle"><?php echo $carouseltext; ?></div><i></i> <?php }  ?> 
         <div class="undertitle"><?php echo $carouseltext2; ?></div>
        </div>
        </div>
    
        </div>
     <div class="block-divider"><div class="dc dc-1">&nbsp;</div><div class="dc dc-2">&nbsp;</div></div>
 </div>
 <div class="container">
    <div class="row">
      <div class="col-sm-12"> 
   <?php if (isset($fish_carousel)) { ?>
  <script type="text/javascript" src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js"></script>       
<div class="fish_carousel row">
 <div id="fish-carousel" class="owl-carousel fadeInUp wow">
<?php foreach ($fish_carousel as $result) { ?>
     <div class="item">
     <?php if ($result['image']) { ?>
     <div class="fish_carousel_img"> 
     <?php if ($showbigimage) { ?><a href="<?php echo $result['bigimage']; ?>"><?php } ?> 
     <img src="<?php echo $result['image']; ?>" alt="<?php if ($result['text']) { ?><?php echo $result['text']; ?><?php } ?>">
      <?php if ($showbigimage) { ?></a><?php } ?> 
      </div> 
     <?php } ?>
     <div class="fish_prod_descr">
      <?php if ($result['text']) { ?><h4 class="middletitle"><?php echo $result['text']; ?></h4><?php } ?>    
      <?php if ($result['carouseltext']) { ?><div class="descr"><?php echo $result['carouseltext']; ?></div> <?php }  ?>
     </div>


     </div>
 <?php }  ?> 
 </div>      
 </div>
 
 <script type="text/javascript"><!--
<?php if ($showbigimage) { ?> 
$('#fish-carousel').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
 <?php } ?>
$('#fish-carousel').owlCarousel({
	items: <?php echo $columncarousel; ?>,
	itemsDesktop : [1199, <?php echo $columncarousel2; ?>],
    itemsDesktopSmall : [979, <?php echo $columncarousel3; ?>],
	autoPlay: false,
    navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: false,
});
--></script>
<?php } ?> 
      </div>
      </div>
      </div>  
 <!--end carousel-->      
 <?php }  ?>   
 
  <?php if ($showcustom) { ?>
 <!--customs-->
 <div id="menu7" class="colorcustom bigblock">
  <div class="container">
    <div class="row">

        <div class="col-md-7 col-sm-12 custombox"> 
        <?php if ($customtext) { ?><div class="bigtitle"><?php echo $customtext; ?></div> <?php }  ?>  
        <?php if ($customtext2) { ?><div class="middletitle"><?php echo $customtext2; ?></div> <?php }  ?>  
         <?php if (isset($customtext3)  && (strlen($customtext3) > 11)) { ?><div><?php echo $customtext3; ?></div> <?php }  ?>  
         <?php if (isset($fish_netw)) { ?>
        <?php foreach ($fish_netw as $result) { ?>
     <div class="fish-netw"><a href="<?php echo $result['link']; ?>" target="_blank"><i class="fa fa-<?php echo $result['ico']; ?> fa-2x"  title="<?php echo $result['text']; ?>"></i></a></div>
       <?php }  ?>  
       <?php }  ?>      
        </div>
        <div class="col-md-5 col-sm-12">
         
        <div id="fast_order_form3"  class="viewblock fast_order_form">
         
         <?php if ($img_iconcustom) { ?>
       <div class="icon_sale"><img src="<?php echo $img_iconcustom; ?>"  alt="sale" /> </div>
       <?php } ?>
      <p class="entrycallback middletitle"><?php echo $entry_callback; ?><br /><?php echo $text_helptext; ?></p>
        <input id="order_status_id3" type="hidden" value="<?php echo $order_status_id; ?>">
        <div class="customer_name"><input type="text" id="customer_name3" placeholder="<?php echo $text_name; ?>"/></div>
        <div class="customer_phone"><input type="text" id="customer_phone3" placeholder="<?php echo $text_phone; ?>"/></div>
         <div class="customer_email"><input type="text" id="customer_email3" placeholder="<?php echo $text_email; ?>"/></div>
         <div class="customer_message"><input type="hidden"  id="customer_message3" name="customer_message"/></div>	
        <?php if ($is_capcha) { ?>
            <input id="pr3" type="text" placeholder="<?php echo $text_captcha; ?>">     
            <?php 
            $i=1;
            do
            {
            $num[$i] = mt_rand(0,9);
            echo "<img src='catalog/view/javascript/fish_singleclick/img/".$num[$i].".gif' alt='captcha'>";
            $i++;
            }
            while ($i<5);
            $captcha = $num[1].$num[2].$num[3].$num[4];
            ?>
            <input id="captcha3" type="hidden" value="<?php echo $captcha ;?>">
        <?php } ?>
        <div class="fish_agree"><input id="fish_agree3" type="checkbox" name="fish_agree" value="1" checked="checked" />&nbsp;<?php echo $text_fish_agree; ?></div>
        <button id="fast_order_button3" class="button"><span><?php echo $text_send; ?></span></button>
        <p id="fast_order_result3" class="fast_order_result"></p>
        
        </div> 
        
        </div>
        </div>
 
 </div> 
 </div>
  <!--end customs-->      
 <?php }  ?> 
 

  
  <?php if (($customcontact1) || ($customcontact2)) { ?>
  <!--contact-->
  <div class="container" id="menu8">
    <div class="row customcontact">
     <?php if ($customcontact1) { ?><div class="col-md-<?php echo $customclass; ?> col-sm-12"><?php echo $customcontact1; ?> </div><?php }  ?> 
     <?php if ($customcontact2) { ?> <div class="col-md-<?php echo $customclass; ?> col-sm-12"><?php echo $customcontact2; ?> </div><?php }  ?> 
     </div>
  </div>
  <!--end contact-->
  <?php }  ?> 
  <?php if (isset($fishmap) && (strlen($fishmap) > 11)) { ?><div class="fishmap"><?php echo $fishmap; ?> </div><?php }  ?> 
     
  
 
        
      
 <div id="agree-text" class="modal fade" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>
         <div class="modal-body">
 <?php echo $rultext; ?>
       </div><!-- </div class="modal-body"> -->
    </div><!-- </div class="modal-content"> -->
  </div><!-- </div class="modal-dialog"> -->
</div>
 


<div id="fast_order_form"  class="fast_order_form modal fade" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       
      </div>  <div id="popaptext"></div>
      <div class="modal-body">
      <div class="modal-title bigtitle"><?php echo $entry_callback; ?></div>  
      <p class="text_helptext"><?php echo $text_helptext; ?></p> 
        <input id="order_status_id" type="hidden" value="<?php echo $order_status_id; ?>">
      
        <div class="customer_name"><input type="text" id="customer_name" placeholder="<?php echo $text_name; ?>"/></div>
        <div class="customer_phone"><input type="text" id="customer_phone" placeholder="<?php echo $text_phone; ?>"/></div>
         <div class="customer_email"><input type="text" id="customer_email" placeholder="<?php echo $text_email; ?>"/></div>
        <div class="customer_message"><textarea  id="customer_message" name="customer_message" placeholder="<?php echo $text_comment; ?>"></textarea></div>	
        <?php if ($is_capcha) { ?>
            <input id="pr" type="text" placeholder="<?php echo $text_captcha; ?>">     
            <?php 
            $i=1;
            do
            {
            $num[$i] = mt_rand(0,9);
            echo "<img src='catalog/view/javascript/fish_singleclick/img/".$num[$i].".gif' alt='captcha'>";
            $i++;
            }
            while ($i<5);
            $captcha = $num[1].$num[2].$num[3].$num[4];
            ?>
            <input id="captcha" type="hidden" value="<?php echo $captcha ;?>">
        <?php } ?>
         <p class="entryfeedback"><?php echo $entry_feedtext; ?></p>
         <p class="danns"><?php echo $entry_danns; ?></p>
        <div class="fish_agree"><input id="fish_agree" type="checkbox" name="fish_agree" value="1" checked="checked" />&nbsp;<?php echo $text_fish_agree; ?></div>
        <button id="fast_order_button" class="button"><span><?php echo $text_send; ?></span></button>
        <p id="fast_order_result" class="fast_order_result"></p>
         <?php if ($phone_mask) { ?>
        <script type="text/javascript" src="catalog/view/javascript/fish_singleclick/jquery.inputmask.bundle.min.js"></script>
        <script type="text/javascript"><!--
            $(function(){
                $('#customer_phone').inputmask({
                    mask: '<?php echo $phone_mask; ?>',
                    clearMaskOnLostFocus: true,
                    clearIncomplete: true
                });
            });
			     $(function(){
                $('#customer_phone2').inputmask({
                    mask: '<?php echo $phone_mask; ?>',
                    clearMaskOnLostFocus: true,
                    clearIncomplete: true
                });
            });
			     $(function(){
                $('#customer_phone3').inputmask({
                    mask: '<?php echo $phone_mask; ?>',
                    clearMaskOnLostFocus: true,
                    clearIncomplete: true
                });
            });
        //--></script>
        <?php } ?>
    
      </div><!-- </div class="modal-body"> -->
    </div><!-- </div class="modal-content"> -->
  </div><!-- </div class="modal-dialog"> -->
</div><!-- </div id="fast_order_form" >  -->

<footer>
  <div class="container">
      <div class="row">
    <div class="col-md-6 col-sm-12">
   <?php if ($customcopy) { ?><?php echo $customcopy; ?><?php } else {?><?php echo $powered; ?><?php } ?>
    </div>
      <div class="col-md-6 col-sm-12">
               <?php if (isset($fish_footerlink)) { ?>
        <?php foreach ($fish_footerlink as $result) { ?>
     <div class="fish-footerlink"><a href="<?php echo $result['link']; ?>"  <?php if ($result['blank']) { ?>target="_blank"<?php } ?>><?php echo $result['text']; ?></a></div>
       <?php }  ?>  
       <?php }  ?>
      </div>
     </div

></div>
</footer>

<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/javascript/flick/flickerplate.css" rel="stylesheet">
<link href="catalog/view/javascript/countdown/jquery.countdown.css" rel="stylesheet">
<link href="catalog/view/javascript/animation/animate.css" rel="stylesheet">
<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="catalog/view/javascript/jquery/owl-carousel/owl.transitions.css" rel="stylesheet">
<script type="text/javascript" src="catalog/view/javascript/animation/wow.min.js"></script>
<script>new WOW().init();</script>
<script src="catalog/view/javascript/fish_singleclick/singleclick.js" type="text/javascript"></script>
<script type="text/javascript" src="catalog/view/javascript/flick/flickerplate.js"></script>
<script type="text/javascript" src="catalog/view/javascript/flick/modernizr-2.7.1.custom.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/fishscript.js"></script>


</body></html>
 <?php }  ?>

