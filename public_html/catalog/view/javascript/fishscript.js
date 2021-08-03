$(document).ready(function() {
	// Language
	$('#form-language .language-select').on('click', function(e) {
		e.preventDefault();

		$('#form-language input[name=\'code\']').val($(this).attr('name'));

		$('#form-language').submit();
	});
/* Agree to Terms */
  $('body').on('click', '.agree', function () {
 $('#agree-text').modal({
                  backdrop: true,
                  keyboard: true
                });
		});

    var $menu = $(".topmenu");
 
        $(window).scroll(function(){
            if ( $(this).scrollTop() > 200 && $menu.hasClass("default") ){
				
				var contH = document.body.scrollHeight - 300  - window.innerHeight;
              if (contH >0) {
                     $menu.removeClass("default").addClass("fixed");
               }                    
				
               
            } else if($(this).scrollTop() <= 200 && $menu.hasClass("fixed")) {
                $menu.removeClass("fixed").addClass("default");
            }
        });	
		
$(function(){
        $("a[href^='#']").click(function(){
                var _href = $(this).attr("href");
                $("html, body").animate({scrollTop: $(_href).offset().top+"px"});
                return false;
        });
});

    $('header .topmenu .mobilebutton').click(function() {
        $('header .topmenu .boxmenu').slideToggle(500);
    });	
	$(window).resize(function (){	
	   if ($(window).width() >= '1200'){
		 $('header .topmenu .boxmenu').removeAttr('style'); 
	   }
	});
		
		
	});