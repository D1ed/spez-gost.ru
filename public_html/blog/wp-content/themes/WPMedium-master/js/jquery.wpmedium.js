jQuery(window).load(function() {
	
	var responsive_menu = function() {
		if ( jQuery(window).width() < 760 ) {
			jQuery('.site-menu ul').children('li').hide();
			if ( ! jQuery('#menu-item-toggle').length ) {
				jQuery('.site-menu > ul').prepend('<li id="menu-item-toggle"><a href="#" class="off">Menu »</a></li>');
			}
			else {
				jQuery('#menu-item-toggle').show();
			}
			jQuery('#menu-item-toggle a').unbind('click').bind('click', function(e) {
				e.preventDefault();
				if ( jQuery(this).hasClass('off') ) {
					jQuery('.site-menu ul').children('li').show();
					jQuery(this).removeClass('off').addClass('on').text('Menu «');
				}
				else {
					jQuery('.site-menu ul').children('li').not(':first').hide();
					jQuery(this).removeClass('on').addClass('off').text('Menu »');
				}
			});
		}
		else {
			jQuery('.site-menu ul').children('li').show();
			jQuery('#menu-item-toggle').remove();
		}
	};

	responsive_menu();

	if ( jQuery('#show_comments').length > 0 ) {
		jQuery('#show_comments').bind('click', function(e) {
			e.preventDefault();
			jQuery('#comments, #hide_comments').show();
			jQuery('body, html').animate({scrollTop: jQuery('#comments').offset().top}, 200);
			jQuery(this).hide();
		});
	}
	if ( jQuery('#hide_comments').length > 0 ) {
		jQuery('#hide_comments').bind('click', function(e) {
			e.preventDefault();
			jQuery('#comments').hide();
			jQuery(this).hide();
			jQuery('#show_comments').show();
		});
	}

	if ( jQuery('#content > .hentry').length > 1 ) {
		jQuery('#content').masonry();
	}

	jQuery(window).resize(function() {
		if ( jQuery('#content > .hentry').length > 1 ) {
			jQuery('#content').masonry('reload');
		}

		responsive_menu();
	});

	jQuery('#loadmore > a').on('click', function(e) {
		e.preventDefault();
		ajax_load( this.href );
	});

	var ajax_load = function( href ) {
		jQuery.ajax({
			type: 'GET',
			url: href,
			success: function( response ) {
				if ( '' != response ) {
					var helper = document.createElement('div');
					    helper = jQuery( helper );
					    helper.html( response );
					var content = jQuery('#content .hentry', helper);
					var newlink = jQuery('#loadmore a', helper);
					jQuery('#content').append( content );
					jQuery('#loadmore a').attr( 'href', jQuery(newlink).attr('href') );
					jQuery('#loadmore a').html( jQuery(newlink).html() );
					helper.remove();
					jQuery('#content').masonry('reload');
				}
			},
			beforeSend: function() {
				jQuery('#loadmore > a').text('...');
			}
		});
	};
	
});