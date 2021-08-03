<?php get_template_part('templates/head'); ?>
  <body <?php body_class(); ?>>
    <div id="wrapper" class="container">
    <?php do_action('get_header');
        get_template_part('templates/header');
    ?>
      <div class="wrap contentclass contentclass-relative" role="document" id="main-content">
      
			<div class="visible-sm visible-xs kad-sidebar sidebar-mobile">
				<div class="inner">
					<div class="menu-home-store">
				    	<a class="sidebar__collapse-control collapsed" role="button" data-toggle="collapse" href="#sidebar__mobile-collapse" aria-expanded="false" aria-controls="sidebar__mobile-collapse">
						    <i class="icon-caret-up"></i>
					    </a>
						<?php dynamic_sidebar('menu-home-store'); ?>
					</div><!--menu-home-store-->
				    
				    
					<div class="sidebar collapse" id="sidebar__mobile-collapse">
						<?php include kadence_sidebar_path(); ?>
					</div><!-- /.sidebar -->
				</div><!--inner-->
			</div><!--sidebar-mobile-->


			<?php do_action('kt_afterheader');
	      		
				include kadence_template_path(); ?>
            
            
				<?php if (kadence_display_sidebar()) : ?>
					<aside class="<?php echo esc_attr(kadence_sidebar_class()); ?> kad-sidebar hidden-xs hidden-sm" role="complementary">
						<div class="inner">
							<div class="menu-home-store">
								<?php dynamic_sidebar('menu-home-store'); ?>
							</div><!--menu-home-store-->
						    
						    
							<div class="sidebar">
								<?php include kadence_sidebar_path(); ?>
							</div><!-- /.sidebar -->
							
							
							<!-- Begin MailChimp Signup Form
							<link href="//cdn-images.mailchimp.com/embedcode/classic-10_7.css" rel="stylesheet" type="text/css">
							<style type="text/css">
								/* Add your own MailChimp form style overrides in your site stylesheet or in this style block.
								   We recommend moving this block and the preceding CSS link to the HEAD of your HTML file. */
							</style>
							
							<div id="mc_embed_signup">
								<form action="//shtooq.us5.list-manage.com/subscribe/post?u=08d6bfd8a2201591c63c1ae1a&amp;id=f47a139af9" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
									<div id="mc_embed_signup_scroll">
										<h3 class="sidebar__header-text">
											Подпишитесь на новые посты
										</h3>
										<div class="mc-field-group">
											<input type="email" value="" name="EMAIL" class="form-control required email" id="mce-EMAIL" placeholder="Email">
										</div>
										<div class="mc-field-group">
											<input type="text" value="" name="FNAME" class="form-control" id="mce-FNAME" placeholder="Имя">
										</div>
										<div id="mce-responses" class="clear">
											<div class="response" id="mce-error-response" style="display:none"></div>
											<div class="response" id="mce-success-response" style="display:none"></div>
										</div>    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups
										<div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_08d6bfd8a2201591c63c1ae1a_f47a139af9" tabindex="-1" value=""></div>
										<div class="text-center"><input type="submit" value="Получать новые посты" name="subscribe" id="mc-embedded-subscribe" class="btn btn-primary btn-primary-styled"></div>
									</div>
								</form>
							</div>
							<script type='text/javascript' src='//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js'></script><script type='text/javascript'>(function($) {window.fnames = new Array(); window.ftypes = new Array();fnames[0]='EMAIL';ftypes[0]='email';fnames[1]='FNAME';ftypes[1]='text';}(jQuery));var $mcj = jQuery.noConflict(true);</script>
							<!--End mc_embed_signup-->
						</div><!--inner-->
					</aside><!-- /aside -->
				<?php endif; ?>
          </div><!-- /.row-->
        </div><!-- /.content -->
      </div><!-- /.wrap -->
      <?php do_action('get_footer');
      get_template_part('templates/footer'); ?>
    </div><!--Wrapper-->
  </body>
</html>
