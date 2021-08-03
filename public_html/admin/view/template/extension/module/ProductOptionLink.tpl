<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-ProductOptionLink" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <br>
	  <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>

  <div class="container-fluid">
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
	<div class="panel panel-default">

		<style>
			<!--/* Стиль описания таба */-->
			.css_tab_info {
				color:red;

			}
			<!--/* Стиль названия значений в табах */-->
			.css_css_name {
				color:blue;
				background-color:#f1f1f1;
				font-size:14px
			}
			<!--/* Стиль описания значений в табах */-->
			.css_tab_info_mini {


			}
			<!--/* Стили значения стилей */-->
			.css_link_view_0 {
				 background-color: #8fbb6c;
			}
			.css_link_view_1 {
				 background-color: #a000005e;
			}
			.css_link_view_2 {
				 background-color: #8a8a8a36;
			}
			.css_link_view_3 {
				 background-color: #eaf54036;
			}
		</style>

		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
		</div>
		<div class="panel-body">
		  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-ProductOptionLink" class="form-horizontal">

				<!--Статус модуля-->
				<div class="form-group panel-heading">
				<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
					<div class="col-sm-10">
						<select name="ProductOptionLink_status" id="input-status" class="form-control">
							<?php if ($ProductOptionLink_status) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select>
					</div>
				</div>

			<div class="row panel-heading">
				<!--Вывод вкладок-->
				<div class="col-md-2">
					<ul class="nav nav-pills nav-stacked" >
						<li class="active"><a href="#tab_settings_admin" data-toggle="tab"><?php echo $tab_settings_admin; ?></a></li>
						<li ><a href="#tab_settings_user" data-toggle="tab"><?php echo $tab_settings_user; ?></a></li>
						<li ><a href="#tab_css" data-toggle="tab"><?php echo $tab_css; ?></a></li>
					</ul>
				</div>

				<!--Значение вкладок-->
			  <div class="col-md-10">
				<div class="tab-content">

				  <!--Значения таба админки-->
				  <div class="tab-pane active" id="tab_settings_admin">
					<div class="form-group text-center">
						<h2 class="text-center css_tab_info"><?php echo $text_info_tab_settings_admin; ?></h2>
					</div>

					<div class="form-group">
						<label class="control-label alert-info" ><?php echo $entry_on_of_admin; ?></label><br><br>

						<!--Статус Вывод опций-->
						<div class="form-group">
							<div class="col-sm-4">
								<?php echo $entry_link_view; ?>
							</div>
							<div class="col-sm-4">
								<select name="ProductOptionLink_link_view" class="form-control">
									<?php if ($ProductOptionLink_link_view == '1') { ?>
										<option value="0"><?php echo $link_view_0; ?></option>
										<option value="2"><?php echo $link_view_2; ?></option>
										<option value="1" selected><?php echo $link_view_1; ?></option>
										<option value="3"><?php echo $link_view_3; ?></option>
									<?php } elseif ($ProductOptionLink_link_view == '2') { ?>
										<option value="0"><?php echo $link_view_0; ?></option>
										<option value="2" selected><?php echo $link_view_2; ?></option>
										<option value="1"><?php echo $link_view_1; ?></option>
										<option value="3"><?php echo $link_view_3; ?></option>
									<?php } elseif ($ProductOptionLink_link_view == '3') { ?>
										<option value="0"><?php echo $link_view_0; ?></option>
										<option value="2"><?php echo $link_view_2; ?></option>
										<option value="1"><?php echo $link_view_1; ?></option>
										<option value="3" selected><?php echo $link_view_3; ?></option>
									<?php } else { ?>
										<option value="0" selected><?php echo $link_view_0; ?></option>
										<option value="2"><?php echo $link_view_2; ?></option>
										<option value="1"><?php echo $link_view_1; ?></option>
										<option value="3"><?php echo $link_view_3; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>

						 <!--Статус названия-->
						<div class="checkbox form-group">
							<div class="col-sm-4">
								<?php echo $entry_on_off_name; ?>
							</div>
							<div class="col-sm-6">
								<?php if ($ProductOptionLink_on_off_name) { ?>
									<input type="checkbox" name="ProductOptionLink_on_off_name" data-on="<?php echo $text_on; ?>" data-off="<?php echo $text_off; ?>" checked data-toggle="toggle" value="1" >
								<?php } else { ?>
									<input type="checkbox" name="ProductOptionLink_on_off_name" data-on="<?php echo $text_on; ?>" data-off="<?php echo $text_off; ?>" data-toggle="toggle" value="1">
								<?php } ?>
							</div>
						</div>

						 <!--Статус изображения-->
						<div class="checkbox form-group">
							<div class="col-sm-4">
								<?php echo $entry_on_off_images; ?>
							</div>
							<div class="col-sm-4">
								<select name="ProductOptionLink_on_off_images" class="form-control">
									<?php if ($ProductOptionLink_on_off_images == '1') { ?>
										<option value="0"><?php echo $text_off; ?></option>
										<option value="1" selected><?php echo $text_option; ?></option>
										<option value="2"><?php echo $text_product; ?></option>
									<?php } elseif ($ProductOptionLink_on_off_images == '2') { ?>
										<option value="0"><?php echo $text_off; ?></option>
										<option value="1"><?php echo $text_option; ?></option>
										<option value="2" selected><?php echo $text_product; ?></option>
									<?php } else { ?>
										<option value="0" selected><?php echo $text_off; ?></option>
										<option value="1"><?php echo $text_option; ?></option>
										<option value="2"><?php echo $text_product; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>

						<!--Статус полной проверки при копировании-->
						<div class="checkbox form-group" >
							<label class="col-sm-4 control-label" style="text-align: left">
								<span data-toggle="tooltip" title="<?php echo $help_fullcheck; ?>">
									<?php echo $entry_on_off_fullcheck; ?>
								</span>
							</label>
							<div class="col-sm-6">
								<?php if ($ProductOptionLink_on_off_fullcheck) { ?>
									<input type="checkbox" name="ProductOptionLink_on_off_fullcheck" data-on="<?php echo $text_on; ?>" data-off="<?php echo $text_off; ?>" checked data-toggle="toggle" value="1">
								<?php } else { ?>
									<input type="checkbox" name="ProductOptionLink_on_off_fullcheck" data-on="<?php echo $text_on; ?>" data-off="<?php echo $text_off; ?>" data-toggle="toggle" value="1">
								<?php } ?>
							</div>
						</div>

						<!--Статус пакетного сохранения-->
						<div class="checkbox form-group" >
							<label class="col-sm-4 control-label" style="text-align: left">
								<span data-toggle="tooltip" title="<?php echo $help_save; ?>">
									<?php echo $entry_on_off_save; ?>
								</span>
							</label>
							<div class="col-sm-6">
								<?php if ($ProductOptionLink_on_off_save) { ?>
									<input type="checkbox" name="ProductOptionLink_on_off_save" data-on="<?php echo $text_on; ?>" data-off="<?php echo $text_off; ?>" checked data-toggle="toggle" value="1">
								<?php } else { ?>
									<input type="checkbox" name="ProductOptionLink_on_off_save" data-on="<?php echo $text_on; ?>" data-off="<?php echo $text_off; ?>" data-toggle="toggle" value="1">
								<?php } ?>
							</div>
						</div>
					</div>
				  </div>



				  <!--Значения таба пользователя-->
				  <div class="tab-pane" id="tab_settings_user">
					<div class="form-group text-center">
						<h2 class="text-center css_tab_info"><?php echo $text_info_tab_settings_user; ?></h2>
					</div>

					<div class="form-group">
						 <!--Статус вывода при отсутсвии товара-->
						<div class="checkbox">
							<label >
								<?php if ($ProductOptionLink_on_off_stock) { ?>
									<input type="checkbox" name="ProductOptionLink_on_off_stock" data-on="<?php echo $text_on; ?>" data-off="<?php echo $text_off; ?>" checked data-toggle="toggle" value="1" class="text-center">
								<?php } else { ?>
									<input type="checkbox" name="ProductOptionLink_on_off_stock" data-on="<?php echo $text_on; ?>" data-off="<?php echo $text_off; ?>" data-toggle="toggle" value="1" class="text-center">
								<?php } ?>
								<?php echo $entry_on_off_stock; ?>
							</label>
						</div>

						 <!--Размер изображения-->
						<div class="input-group">
							<br><label class="control-label alert-info" for="input-style_name"><?php echo $entry_resize; ?></label><br><br>
								<div class="text-center">
									<?php echo $entry_resize_length; ?>
									<input
									class="text-center"
									type="number"
									min="1"
									name="ProductOptionLink_resize_length"
									value="<?php echo $ProductOptionLink_resize_length; ?>">

									<?php echo $entry_resize_height; ?>
									<input
									class="text-center"
									type="number"
									min="1"
									name="ProductOptionLink_resize_height"
									value="<?php echo $ProductOptionLink_resize_height; ?>">
								</div>

						</div>
					</div>
				  </div>

				  <!--Значения таба стилей-->
				  <div class="tab-pane" id="tab_css">
					<div class="form-group text-center">
						<h2 class="text-center css_tab_info"><?php echo $text_info_tab_css; ?></h2>
						<div class="text-center css_tab_info_mini">
							<?php echo $text_info_tab_css_mini; ?>
						</div>
					</div>

					 <!--Стили Название опции-->
					<div class="form-group">
						<label class="col-sm-2 control-label " for="input-style_name"><?php echo $entry_style_name; ?></label>
						<div class="col-sm-10">
							<textarea class = "css_css_name" name="ProductOptionLink_style[name]" placeholder="<?php echo $entry_style_name; ?>" cols="55" rows="5"><?php echo ($ProductOptionLink_style['name']); ?></textarea>
						</div>
					</div>

					<div class="form-group">

						<ul class="nav nav-tabs" >
							<li class="active css_link_view_0"><a href="#tab_link_view_0" data-toggle="tab"><?php echo $link_view_0; ?></a></li>
							<li class="css_link_view_1"><a href="#tab_link_view_1" data-toggle="tab"><?php echo $link_view_1; ?></a></li>
							<li class="css_link_view_3"><a href="#tab_link_view_3" data-toggle="tab"><?php echo $link_view_3; ?></a></li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane active css_link_view_0" id="tab_link_view_0">
								<!--Стили Основная ссылка-->
								<div class="form-group">
									<label class="col-sm-2 control-label " for="input-style"><?php echo $entry_style_link; ?></label>
									<div class="col-sm-10">
										<textarea class = "css_css_name" name="ProductOptionLink_style[view0][link]" placeholder="<?php echo $entry_style_link; ?>" cols="55" rows="5"><?php echo $ProductOptionLink_style['view0']['link']; ?></textarea>
									</div>
								</div>

								<!--Если совпадает с текущим товаром-->
								<div class="form-group">
									<label class="col-sm-2 control-label " for="input-style_product"><?php echo $entry_style_product; ?></label>
									<div class="col-sm-10">
										<textarea class = "css_css_name" name="ProductOptionLink_style[view0][product]" placeholder="<?php echo $entry_style_product; ?>" cols="55" rows="5"><?php echo $ProductOptionLink_style['view0']['product']; ?></textarea>
									</div>
								</div>

								<!--Если не задан товар-->
								<div class="form-group">
									<label class="col-sm-2 control-label " for="input-style_noproduct"><?php echo $entry_style_noproduct; ?></label>
									<div class="col-sm-10">
										<textarea class = "css_css_name" name="ProductOptionLink_style[view0][noproduct]" placeholder="<?php echo $entry_style_noproduct; ?>" cols="55" rows="5"><?php echo $ProductOptionLink_style['view0']['noproduct']; ?></textarea>
									</div>
								</div>
							</div>

							<div class="tab-pane css_link_view_1" id="tab_link_view_1">
								<!--Стили Основная ссылка-->
								<div class="form-group">
									<label class="col-sm-2 control-label " for="input-style"><?php echo $entry_style_link; ?></label>
									<div class="col-sm-10">
										<textarea class = "css_css_name" name="ProductOptionLink_style[view1][link]" placeholder="<?php echo $entry_style_link; ?>" cols="55" rows="5"><?php echo $ProductOptionLink_style['view1']['link']; ?></textarea>
									</div>
								</div>

								<!--Если совпадает с текущим товаром-->
								<div class="form-group">
									<label class="col-sm-2 control-label " for="input-style_product"><?php echo $entry_style_product; ?></label>
									<div class="col-sm-10">
										<textarea class = "css_css_name" name="ProductOptionLink_style[view1][product]" placeholder="<?php echo $entry_style_product; ?>" cols="55" rows="5"><?php echo $ProductOptionLink_style['view1']['product']; ?></textarea>
									</div>
								</div>

								<!--Если не задан товар-->
								<div class="form-group">
									<label class="col-sm-2 control-label " for="input-style_noproduct"><?php echo $entry_style_noproduct; ?></label>
									<div class="col-sm-10">
										<textarea class = "css_css_name" name="ProductOptionLink_style[view1][noproduct]" placeholder="<?php echo $entry_style_noproduct; ?>" cols="55" rows="5"><?php echo $ProductOptionLink_style['view1']['noproduct']; ?></textarea>
									</div>
								</div>
							</div>

							<div class="tab-pane css_link_view_3" id="tab_link_view_3">
								<!--Стили Основная ссылка-->
								<div class="form-group">
									<label class="col-sm-2 control-label " for="input-style"><?php echo $entry_style_link; ?></label>
									<div class="col-sm-10">
										<textarea class = "css_css_name" name="ProductOptionLink_style[view3][link]" placeholder="<?php echo $entry_style_link; ?>" cols="55" rows="5"><?php echo $ProductOptionLink_style['view3']['link']; ?></textarea>
									</div>
								</div>

								<!--Если совпадает с текущим товаром-->
								<div class="form-group">
									<label class="col-sm-2 control-label " for="input-style_product"><?php echo $entry_style_product; ?></label>
									<div class="col-sm-10">
										<textarea class = "css_css_name" name="ProductOptionLink_style[view3][product]" placeholder="<?php echo $entry_style_product; ?>" cols="55" rows="5"><?php echo $ProductOptionLink_style['view3']['product']; ?></textarea>
									</div>
								</div>

								<!--Если не задан товар-->
								<div class="form-group">
									<label class="col-sm-2 control-label " for="input-style_noproduct"><?php echo $entry_style_noproduct; ?></label>
									<div class="col-sm-10">
										<textarea class = "css_css_name" name="ProductOptionLink_style[view3][noproduct]" placeholder="<?php echo $entry_style_noproduct; ?>" cols="55" rows="5"><?php echo $ProductOptionLink_style['view3']['noproduct']; ?></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				  </div>
				</div>
			  </div>
			</div>
		  </form>
		</div>
	</div>
  </div>
</div>
<?php echo $footer; ?>