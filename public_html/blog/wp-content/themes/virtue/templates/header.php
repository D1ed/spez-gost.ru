<?php global $virtue; ?>

<?php if (kadence_display_topbar()) : ?>
<header id="header" class="banner headerclass main-header" role="banner">
	<nav class="navbar" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle mobile-menu">
					<i class="iconico-bars"></i>
				</button>
           
				
				
				<a class="navbar-brand" href="<?php echo home_url(); ?>/">
					<img src="<?php echo esc_url($virtue['x1_virtue_logo_upload']['url']); ?>" alt="<?php bloginfo('name');?>" />
				</a>
				
				
				
		        <div class="top-center top-center-main visible-xs float-left">
					<div class="top-contacts">
						<div class="hidden-lg phones-collapse-wrap">
							<p class="phones">
								<a class="tel-ios" href="tel: 88005052649">тел.: 8 (800) 505-26-49</a>
							</p>
							<!-- <a id="phones-more" class="dotted-link" href="#" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Еще
							</a>

							<ul class="dropdown-menu" role="menu" aria-labelledby="phones-more">
								<li>
									<a class="tel-ios" href="tel: 84956696738">8 (495) 669-67-38</a>
								</li>
								<li>
									<a class="tel-ios" href="tel: 88123092702">8 (812) 309-27-02</a>
								</li>
							</ul> -->
						</div>
						<p class="work-time">
							Пн-Пт: 10:00-18:00
						</p>
					</div>
				</div>
				
				
				<div class="cart-styled-mobile-w">
					<ul class="nav navbar-nav float-left visible-xs cart-xs cart-styled-mobile">
						<li>
							<p class="cart-count"></p>
						</li>
						<li class="icon-cart-wrap">
							<a class="cart">
								<i class="iconico-cart"></i>
							</a>
							<div class="s_submenu s_cart_holder">
								<div class="empty">Здесь пока пусто :(</div>
							</div>
						</li>
					</ul>
				</div>
			</div><!--navbar-header-->
			
			
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="menu">
	          <?php if (has_nav_menu('topbar_navigation')) :
	              wp_nav_menu(array('theme_location' => 'topbar_navigation', 'menu_class' => 'nav navbar-nav top-main-nav'));
	            endif;?>
	            
	            
				<div class="top-center top-center-main">
					<div class="top-contacts bg-image hidden-sm hidden-xs">
						<div class="hidden-lg phones-collapse-wrap">
							<p class="phones">
								<a class="tel-ios" href="tel: 88005052649">тел.: 8 (800) 505-26-49</a>
							</p>
							<!-- <a id="phones-more" class="dotted-link" href="#" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Еще
							</a>

							<ul class="dropdown-menu" role="menu" aria-labelledby="phones-more">
								<li>
									<a class="tel-ios" href="tel: 84956696738">8 (495) 669-67-38</a>
								</li>
								<li>
									<a class="tel-ios" href="tel: 88123092702">8 (812) 309-27-02</a>
								</li>
							</ul> -->
						</div>
						
						
						<p class="phones visible-lg">
							8 (800) 505-26-49
						</p>
						<p class="work-time">
							Пн-Пт: 10:00-18:00
						</p>
					</div>
				</div><!--top-center top-center-main-->
				
				
				<ul class="nav navbar-nav navbar-right cart-styled">
					<li>
						<p class="cart-count">
						</p>
					</li>
					<li class="icon-cart-wrap">
						<a href="/shopping-cart/" class="cart">
							<i class="iconico-cart"></i>
						</a>
						<div class="s_submenu s_cart_holder">
							<div class="empty">Перейти в корзину</div>
						</div>
					</li>
					<li class="w-account collapsed-wrap">
					
					<!-- <?php if (!isset($_SESSION['customer_id'])) { ?>
					    <a class="signin-out block collapsed b-login-btn i-login" data-toggle="collapse" data-target="#login">
					        <i class="iconico-login"></i>
					    </a>
					
					    <div id="login" class="collapse">
					       <div class="login-form-wrap">
				                <div class="inner-pd">
				                    <form class="form-horizontal" role="form" method="post"
				                          action="/index.php?route=account/login">
				                        <input type="hidden" name="redirect" value="" />
				                        <div class="form-group">
				                            <label for="inputEmail3" class="col-sm-3 control-label">E-mail</label>
				
				                            <div class="col-sm-9">
				                                <input type="email" name="email" class="form-control" id="inputEmail3"
				                                       placeholder="mail@example.com">
				                            </div>
				                        </div>
				                        <div class="form-group">
				                            <label for="inputPassword3" class="col-sm-3 control-label">Пароль</label>
				
				                            <div class="col-sm-9">
				                                <input type="password" name="password" class="form-control"
				                                       id="inputPassword3" placeholder="password">
				                            </div>
				                        </div>
				                        <div class="form-group">
				                            <div class="col-sm-6 col-xs-4">
				                                <button type="submit" class="btn btn-info btn-info-styled">Войти</button>
				                            </div>
				                            <div class="col-sm-6 col-xs-8 forgot-password">
				                                <a href="/index.php?route=account/forgotten">
				                                    Забыли пароль?
				                                </a>
				                            </div>
				                        </div>
				                    </form>
				                </div> --><!--inner-pd-->
				
				               <!-- <div class="b-registr">
				                    <a href="/index.php?route=account/register">Зарегистрироваться</a>
				                </div>
					        </div><!--login-form-wrap-->
						<!-- </div>
					<?php } else { ?>
						<a href="/index.php?route=account/account" class="i-account">
							<i class="iconico-user"></i>
						</a>
					<?php } ?>
						
					</li> -->
				</ul>
			</div><!--collapse navbar-collapse-->
		</div><!--container-->
	</nav>
<?php endif; ?>
</header>