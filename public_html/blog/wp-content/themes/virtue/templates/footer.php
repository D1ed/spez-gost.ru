<footer id="containerfooter-styled" class="footerclass-styled" role="contentinfo">
    <?php global $virtue; if(isset($virtue['footer_layout'])) { $footer_layout = $virtue['footer_layout']; } else { $footer_layout = 'fourc'; }?>
    <!--<section class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-5 wrapper-clearboth footer-logo-wrap">
					<?php if (is_active_sidebar('footer_1') ) { ?> 
						<?php dynamic_sidebar('footer_1'); ?>
			        <?php }; ?>
				</div>

				<div class="col-md-3 col-sm-4 col-xs-7 col-md-offset-2 col-xs-offset-0">
					<?php if (is_active_sidebar('footer_2') ) { ?> 
						<?php dynamic_sidebar('footer_2'); ?>
			        <?php }; ?>
					
					
					<div class="footer-phones">
						<?php
			             if (has_nav_menu('footer_navigation')) : wp_nav_menu(array('menu' => 'phones', 'container_class' => 'footer-phones', 'menu_class' => 'unstyled')); endif;
			            ?>
					</div>
					
					<!--footer-phones
				
				
				</div>

				<div class="col-md-3 col-sm-3 col-xs-5 footer-nav">
					<ul class="unstyled">
						<li>
							<a href="/index.php?route=information/shipping">Доставка и оплата</a>
						</li>
					</ul>
					
                    <?php
		              if (has_nav_menu('footer_navigation')) : wp_nav_menu(array('theme_location' => 'footer_navigation', 'menu_class' => 'unstyled')); endif;
		            ?>
                    <?php if(isset($informations)){ ?>
                        <?php foreach($informations as $information){ ?>
                            <li>
                            	<a href="<?php echo $information['href'];?>"><?php echo $information['title']; ?></a>
                            </li>
                        <?php } ?>
                    <?php } ?>

					<ul class="unstyled">
						<li>
							<a href="/kamni-dlya-wiski">Камни для виски SPARQ</a>
						</li>
					</ul>
				</div>
			</div>
			
			<!--row
		
		</div>
		
		<!--container
		
	</section>-->
	
	
	<section class="copyright">
		<div class="container">
            <div class="wrapper-clearboth">
                <p class="copyright-text float-left-sm">
                   <?php if(isset($virtue['footer_text'])) { $footertext = $virtue['footer_text'];} else {$footertext = '[copyright] [the-year] [site-name] [theme-credit]';}
	        		$footertext = str_replace('[copyright]','&copy;',$footertext);
	        		$footertext = str_replace('[the-year]',date('Y'),$footertext);
	        		$footertext = str_replace('[site-name]',get_bloginfo('name'),$footertext);
	        		$footertext = str_replace('[theme-credit]','- WordPress Theme by <a href="http://www.kadencethemes.com/" target="_blank">Kadence Themes</a>',$footertext);
	        		echo do_shortcode($footertext); ?>
                </p>

                <ul class="list-inline float-left-sm unstyled payment-system">
                    <li>
                        <img src="<?php echo (esc_url(getDomain()) . '/image/rbkm_logo.png'); ?>" alt="" title=""/>
                    </li>
                    <li>
                        <img src="<?php echo (esc_url(getDomain()) . '/image/visamastercard.png'); ?>" alt="" title=""/>
                    </li>
                </ul>
            </div>

		</div><!--container-->
	</section>

</footer>

<?php wp_footer(); ?>
