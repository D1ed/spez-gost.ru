
var headerHeight,
	footerHeight,
	footerVisibleScroll,
	sidebarHeight,
	windowHeight,
	wpAdminBar,
	wrapper
	ismobile = (/iphone|ipad|ipod|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase()));




jQuery(document).ready( function() {


//-------------------------no mobile devicies
    if(!ismobile) {
    	jQuery('body').removeClass('mobile-body').addClass('notouch');
	} else {
    	jQuery('body').removeClass('notouch').addClass('mobile-body');
    } //---if mobile
    
    
	header = jQuery('header'),
	footer = jQuery('#containerfooter-styled'),
	sidebar = jQuery('.kad-sidebar .inner'),
	wpAdminBar = jQuery('#wpadminbar'),
	wrapper = jQuery('#wrapper'),
	
	headerHeight = header.height(),
	footerHeight = footer.height(),
	sidebarHeight = sidebar.height();


//----------------------open header cart
	jQuery('.icon-cart-wrap').on('click', function() {
		jQuery(this).toggleClass('active');
	});
	
	


//-------------------------HEADER more phones
	jQuery('#phones-more').click( function(e) {
		e.preventDefault();
		jQuery(this).closest('.phones-collapse-wrap').toggleClass('open');
	});
	
	


//-------------------------modal-menu mobile
	jQuery('.mobile-menu').click( function(e) {
		e.preventDefault();
		jQuery('body').toggleClass('menu-open');
		if (jQuery('body').hasClass('menu-open')) {
			document.ontouchmove = function(event){
			    event.preventDefault();
			}
		} else {
			document.ontouchmove = function(event){
			    return true;
			}
		}
	});
	

});
//---ducument.ready end


jQuery(window).bind('scroll resize', function() {
	
	var windowScroll = jQuery(window).scrollTop();
	
	windowHeight = jQuery(window).height();
	windowMinusFooterHeight = windowHeight - footerHeight;
	
	footerVisibleScroll = jQuery('#wrapper').height() - footerHeight - windowHeight + wpAdminBar.height();
	
	if ( windowScroll > headerHeight ) {
		sidebar.addClass('sticky');
		
		if ( wpAdminBar ) {
			sidebar.css({
				'top': + wpAdminBar.height()
			});
		}
	} else {
		sidebar.removeClass('sticky').css({
			'top': 0
		});
	}
	
	if ( windowScroll >= footerVisibleScroll && sidebarHeight > windowMinusFooterHeight ) {
		sidebar.removeClass('sticky').css({
			'top': 'auto',
			'bottom': 0
		});
	}
	
	//---TEST line----- console.log(windowScroll + ' / ' + sidebar.offset().top + '; ' + sidebarHeight + ' / ' + windowMinusFooterHeight);
	
});
//---window.scroll end