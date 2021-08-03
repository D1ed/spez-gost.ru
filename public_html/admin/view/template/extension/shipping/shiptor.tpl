<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<!--<a href="<?php echo $customer; ?>" class="btn btn-default"><?php echo $text_order_customer; ?></a> -->
				<a href="<?php echo $order; ?>" class="btn btn-default"><?php echo $text_order_store; ?></a> 
				<a href="<?php echo $shiptor; ?>" class="btn btn-default"><?php echo $text_order_shiptor; ?></a>			
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
				<?php if(isset($button_save)){ ?>
				<button type="submit" form="form-shiptor" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<?php } ?>
			</div>

			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<?php if (!empty($breadcrumb['separator'])) : ?>
						<li><?php echo $breadcrumb['separator']; ?></li>
					<?php endif; ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	
	<div class="container-fluid">
		<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>		
		<?php if ($error) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>		
	 
		<link href="view/javascript/shipping/shiptor/shiptor.css" rel="stylesheet" />
		<link href="view/javascript/shipping/shiptor/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" />

		<script src="view/javascript/shipping/shiptor/datetimepicker/moment.min.js"></script>	
		<script src="view/javascript/shipping/shiptor/datetimepicker/ru.min.js"></script>
		<script src="view/javascript/shipping/shiptor/datetimepicker/bootstrap-datetimepicker.min.js"></script>
		
		<div class="panel panel-default">
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-shiptor" class="form-horizontal">
				<?php if ($shipping_methods) { ?>
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
						<li><a href="#tab-delivery" data-toggle="tab"><?php echo $tab_delivery; ?></a></li>
						<li><a href="#tab-setting" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
					</ul>
					
					<div class="tab-content">

						<!-- методы доставки -->

						<div class="tab-pane active" id="tab-general">
							<div style="float: right;">
								<a href="https://shiptor.ru/help/integration/opencart/opencart-setting#article_2" target="_blank"><?= $text_faq; ?></a>
							</div>
							<div class="col-sm-2">
								<ul class="nav nav-pills nav-stacked">
								<?php foreach ($shipping_methods as $j => $shipping) { ?>
								<?php if($j == 0){ ?>
								<h4><span class="fa fa-tags icon-tags"></span>Прямая регион-регион</h4>
								<?php }else{ ?>
								<h4><span class="fa fa-tags icon-tags"></span>От склада Shiptor в г.Москва</h4>
								<?php } ?>
								<?php foreach ($shipping as $key => $shipping_method) { ?>
									
									<li data-id="<?php echo $shipping_method['id']; ?>" class="<?php echo (!$key && $j == 1) ? 'active' : ''; ?> <?php echo ${'status_' . $shipping_method['id']}?'status-on':'status-off'; ?>"><a href="#tab-<?php echo $shipping_method['id']; ?>" data-toggle="tab">
									<?php echo $shipping_method['name']; ?><br>
									<small><i><?php echo $shipping_method['group']; ?></i></small>
									<small><i><?php echo $shipping_method['category']; ?></i></small>
									</a>
									</li>
								<?php } ?>
								<?php } ?>
								</ul>
							</div>

							<div class="col-sm-10">
								<div class="tab-content">
								<?php foreach ($shipping_methods as $j => $shipping) { ?>
								<?php foreach ($shipping as $key => $shipping_method) { ?>
									<div class="tab-pane <?php echo (!$key && $j == 1) ? 'active' : ''; ?>" id="tab-<?php echo $shipping_method['id']; ?>">

										<h3><?php echo $shipping_method['name']; ?></h3>

										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_shipping_status; ?></label>
												<div class="col-sm-3">
													<div class="onoffswitch">
														<?php if (${'status_' . $shipping_method['id']}) { ?>
															<input type="checkbox" name="shiptor_<?php echo $shipping_method['id']; ?>_status" id="<?php echo $shipping_method['id']; ?>_status" data-id="<?php echo $shipping_method['id']; ?>" data-name="status" value="1" class="onoffswitch-checkbox" checked="checked" />
														<?php } else { ?>
															<input type="checkbox" name="shiptor_<?php echo $shipping_method['id']; ?>_status" id="<?php echo $shipping_method['id']; ?>_status" data-id="<?php echo $shipping_method['id']; ?>" data-name="status" value="1" class="onoffswitch-checkbox" />
														<?php } ?>
														 <label class="onoffswitch-label" for="<?php echo $shipping_method['id']; ?>_status"></label>
													</div>
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_shipping_status; ?></div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_shipping_name; ?></label>
												<div class="col-sm-3">
													<input name="shiptor_<?php echo $shipping_method['id']; ?>_name" value="<?php echo ${'name_' . $shipping_method['id']}; ?>" class="form-control" />
												</div>
												<div class="col-sm-7">
												</div>
											</div>
										</div>
										<?php if ($shipping_method['courier'] == 'shiptor-one-day') { ?>
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_shipping_time; ?></label>
												<div class="col-sm-3">
													<div class="input-group" id="datetimepicker">
														<input type="text" name="shiptor_<?php echo $shipping_method['id']; ?>_time" value="<?php echo preg_replace('/[a-zAZ\.*+? ]/' , '', ${'time_' . $shipping_method['id']}); ?>" class="form-control" />
														<span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-clock-o"></i></button></span>
													</div>
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_shipping_time; ?></div>
												</div>
											</div>
										</div>
										<?php } ?>
										
										<?php if ($shipping_method['category'] == 'delivery-point-to-door' 
										|| $shipping_method['category'] == 'delivery-point-to-delivery-point') { ?>
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_pvz; ?></label>
												<div class="col-sm-3">
													<select <?php if($shipping_method['category'] == 'delivery-point-to-delivery-point'){ ?>
													 disabled
													<?php } ?>
													name="shiptor_<?php echo $shipping_method['id']; ?>_pvz" class="form-control">
													<?php foreach(${'array_pvz_' . $shipping_method['id']} as $pvz){ ?>
														<?php if(${'pvz_' . $shipping_method['id']} == $pvz['id']){ ?>
															<option value="<?php echo $pvz['id']; ?>" selected="selected"><?php echo $pvz['address']; ?></option>
														<?php } else { ?>
															<option value="<?php echo $pvz['id']; ?>"><?php echo $pvz['address']; ?></option>
														<?php } ?>
														<?php } ?>
													</select>
												</div>
											</div>											
										</div>
										<?php } ?>

										
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_total_free; ?></label>
												<div class="col-sm-3">
													<input name="shiptor_<?php echo $shipping_method['id']; ?>_total_free" value="<?php echo ${'total_free_' . $shipping_method['id']}; ?>" class="form-control" />
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_total_free; ?></div>
												</div>
											</div>		
										</div>		
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_total_min; ?></label>
												<div class="col-sm-3">
													<input name="shiptor_<?php echo $shipping_method['id']; ?>_total_min" value="<?php echo ${'total_min_' . $shipping_method['id']}; ?>" class="form-control" />
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_total_min; ?></div>
												</div>
											</div>		
										</div>	
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_total_max; ?></label>
												<div class="col-sm-3">
													<input name="shiptor_<?php echo $shipping_method['id']; ?>_total_max" value="<?php echo ${'total_max_' . $shipping_method['id']}; ?>" class="form-control" />
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_total_max; ?></div>
												</div>
											</div>		
										</div>								
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_total_min_weight; ?></label>
												<div class="col-sm-3">
													<input name="shiptor_<?php echo $shipping_method['id']; ?>_total_min_weight" value="<?php echo ${'total_min_weight_' . $shipping_method['id']}; ?>" class="form-control" />
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_total_min_weight; ?></div>
												</div>
											</div>		
										</div>	
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_total_max_weight; ?></label>
												<div class="col-sm-3">
													<input name="shiptor_<?php echo $shipping_method['id']; ?>_total_max_weight" value="<?php echo ${'total_max_weight_' . $shipping_method['id']}; ?>" class="form-control" />
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_total_max_weight; ?></div>
												</div>
											</div>		
										</div>	
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_fixed; ?></label>
												<div class="col-sm-3">
													<input name="shiptor_<?php echo $shipping_method['id']; ?>_fixed" value="<?php echo ${'fixed_' . $shipping_method['id']}; ?>" class="form-control" />
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_fixed; ?></div>
												</div>
											</div>	
										</div>
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_weight_price; ?></label>
												<div class="col-sm-3">
													<textarea name="shiptor_<?php echo $shipping_method['id']; ?>_weight_price" class="form-control"><?php echo ${'weight_price_' . $shipping_method['id']}; ?></textarea>
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_weight_price; ?></div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_type; ?></label>
												<div class="col-sm-3">
													<select name="shiptor_<?php echo $shipping_method['id']; ?>_type" class="form-control">
														<option value="0"><?php echo $text_select; ?></option>
														<?php if (${'type_' . $shipping_method['id']} == 'P') { ?>
															<option value="P" selected="selected"><?php echo $text_percent; ?></option>
														<?php } else { ?>
															<option value="P"><?php echo $text_percent; ?></option>
														<?php } ?>
														<?php if (${'type_' . $shipping_method['id']} == 'F') { ?>
															<option value="F" selected="selected"><?php echo $text_amount; ?></option>
														<?php } else { ?>
															<option value="F"><?php echo $text_amount; ?></option>
														<?php } ?>
													</select>
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_type; ?></div>
												</div>
											</div>											
										</div>													
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_markup; ?></label>
												<div class="col-sm-3">
													<input type="text" name="shiptor_<?php echo $shipping_method['id']; ?>_markup" value="<?php echo ${'markup_' . $shipping_method['id']}; ?>" class="form-control" />
													<?php if (isset(${'error_'.$shipping_method['id'].'_markup'})) { ?><span class="text-danger"><?php echo ${'error_'.$shipping_method['id'].'_markup'}; ?></span><?php } ?>
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_markup; ?></div>
												</div>
											</div>
										</div>
										<!--<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_markup_surcharge; ?></label>
												<div class="col-sm-3">
													<input type="text" name="shiptor_<?php echo $shipping_method['id']; ?>_markup_surcharge" value="<?php echo ${'markup_surcharge_' . $shipping_method['id']}; ?>" class="form-control" />
													<?php if (isset(${'error_'.$shipping_method['id'].'_markup_surcharge'})) { ?><span class="text-danger"><?php echo ${'error_'.$shipping_method['id'].'_markup_surcharge'}; ?></span><?php } ?>
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_markup_surcharge; ?></div>
												</div>
											</div>
										</div>-->
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_comment; ?></label>
												<div class="col-sm-3">
													<div class="onoffswitch">
														<?php if (${'comment_' . $shipping_method['id']}) { ?>
															<input type="checkbox" name="shiptor_<?php echo $shipping_method['id']; ?>_comment" id="<?php echo $shipping_method['id']; ?>_comment" value="1" class="onoffswitch-checkbox" checked="checked" />
														<?php } else { ?>
															<input type="checkbox" name="shiptor_<?php echo $shipping_method['id']; ?>_comment" id="<?php echo $shipping_method['id']; ?>_comment" value="1" class="onoffswitch-checkbox" />
														<?php } ?>
														 <label class="onoffswitch-label comment-change" for="<?php echo $shipping_method['id']; ?>_comment"></label>
													</div>

												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_comment; ?></div>
												</div>
											</div>
										</div>
										<div class="form-group my-comment">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_my_comment; ?></label>
												<div class="col-sm-3">
													<input type="text" name="shiptor_<?php echo $shipping_method['id']; ?>_my_comment" value="<?php echo ${'my_comment_' . $shipping_method['id']}; ?>" class="form-control" />
												</div>
												<div class="col-sm-7">
													<div class="sh-help"><?php echo $help_my_comment; ?></div>
												</div>
											</div>	
										</div>							
										<div class="form-group">
											<div class="sh-flex">
												<label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>										
												<div class="col-sm-3">
													<input type="text" name="shiptor_<?php echo $shipping_method['id']; ?>_sort_order" value="<?php echo ${'sort_order_' . $shipping_method['id']}; ?>" class="form-control" />									
												</div>
												<div class="col-sm-7">
												</div>
											</div>
										</div>
										
										<?php if (!empty($regions)) { ?>
										<div class="form-group">
											<div class="col-sm-2">
												<ul class="nav nav-pills nav-stacked">
												<?php foreach ($regions as $i => $region) { ?>
												<li <?php echo ! $i ? 'class="active"' : ''; ?>><a href="#tab-<?php echo $shipping_method['id']; ?>-region-<?php echo $region['id']; ?>" data-toggle="tab"><?php echo $region['name']; ?></a></li>
												<?php } ?>
												</ul>
											</div>
											<div class="col-sm-10">
												<div class="tab-content">
													<?php foreach ($regions as $i => $region) { ?>
														<div class="tab-pane <?php echo ! $i ? 'active' : ''; ?>" id="tab-<?php echo $shipping_method['id']; ?>-region-<?php echo $region['id']; ?>">
															<div class="form-group">
																<div class="sh-flex">
																	<label class="col-sm-2 control-label"><?php echo $entry_weight_price; ?></label>
																	<div class="col-sm-3">
																		<textarea name="shiptor_<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_weight_price" class="form-control"><?php echo ${'weight_price_' . $shipping_method['id'] . '_' . $region['id']}; ?></textarea>
																	</div>
																	<div class="col-sm-7">
																		<div class="sh-help"><?php echo $help_weight_price; ?></div>
																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="sh-flex">
																	<label class="col-sm-2 control-label"><?php echo $entry_total_free; ?></label>
																	<div class="col-sm-3">
																		<input name="shiptor_<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_total_free" value="<?php echo ${'total_free_' . $shipping_method['id'] . '_' . $region['id']}; ?>" class="form-control" />
																	</div>
																	<div class="col-sm-7">
																		<div class="sh-help"><?php echo $help_total_free; ?></div>
																	</div>
																</div>		
															</div>
															<div class="form-group">
																<div class="sh-flex">
																	<label class="col-sm-2 control-label"><?php echo $entry_total_min; ?></label>
																	<div class="col-sm-3">
																		<input name="shiptor_<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_total_min" value="<?php echo ${'total_min_' . $shipping_method['id'] . '_' . $region['id']}; ?>" class="form-control" />
																	</div>
																	<div class="col-sm-7">
																		<div class="sh-help"><?php echo $help_total_min; ?></div>
																	</div>
																</div>		
															</div>
															<div class="form-group">
																<div class="sh-flex">
																	<label class="col-sm-2 control-label"><?php echo $entry_total_max; ?></label>
																	<div class="col-sm-3">
																		<input name="shiptor_<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_total_max" value="<?php echo ${'total_max_' . $shipping_method['id'] . '_' . $region['id']}; ?>" class="form-control" />
																	</div>
																	<div class="col-sm-7">
																		<div class="sh-help"><?php echo $help_total_max; ?></div>
																	</div>
																</div>		
															</div>
															<div class="form-group">
																<div class="sh-flex">
																	<label class="col-sm-2 control-label"><?php echo $entry_fixed; ?></label>
																	<div class="col-sm-3">
																		<input name="shiptor_<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_fixed" value="<?php echo ${'fixed_' . $shipping_method['id'] . '_' . $region['id']}; ?>" class="form-control" />
																	</div>
																	<div class="col-sm-7">
																		<div class="sh-help"><?php echo $help_fixed; ?></div>
																	</div>
																</div>	
															</div>	
															<div class="form-group">
																<div class="sh-flex">
																	<label class="col-sm-2 control-label"><?php echo $entry_type; ?></label>
																	<div class="col-sm-3">
																		<select name="shiptor_<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_type" class="form-control">
																			<option value="0"><?php echo $text_select; ?></option>
																			<?php if (${'type_' . $shipping_method['id'] . '_' . $region['id']} == 'P') { ?>
																				<option value="P" selected="selected"><?php echo $text_percent; ?></option>
																			<?php } else { ?>
																				<option value="P"><?php echo $text_percent; ?></option>
																			<?php } ?>
																			<?php if (${'type_' . $shipping_method['id'] . '_' . $region['id']} == 'F') { ?>
																				<option value="F" selected="selected"><?php echo $text_amount; ?></option>
																			<?php } else { ?>
																				<option value="F"><?php echo $text_amount; ?></option>
																			<?php } ?>
																		</select>
																	</div>
																	<div class="col-sm-7">
																		<div class="sh-help"><?php echo $help_type; ?></div>
																	</div>
																</div>													
															</div>													
															<div class="form-group">
																<div class="sh-flex">
																	<label class="col-sm-2 control-label"><?php echo $entry_markup; ?></label>
																	<div class="col-sm-3">
																		<input type="text" name="shiptor_<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_markup" value="<?php echo ${'markup_' . $shipping_method['id'] . '_' . $region['id']}; ?>" class="form-control" />
																	</div>
																	<div class="col-sm-7">
																		<div class="sh-help"><?php echo $help_markup; ?></div>
																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="sh-flex">
																	<label class="col-sm-2 control-label"><?php echo $entry_region_status; ?></label>
																	<div class="col-sm-3">
																		<div class="onoffswitch">
																			<?php if (${'status_' . $shipping_method['id'] . '_' . $region['id']}) { ?>
																				<input type="checkbox" name="shiptor_<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_status" id="<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_status" value="1" class="onoffswitch-checkbox" checked="checked" />
																			<?php } else { ?>
																				<input type="checkbox" name="shiptor_<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_status" id="<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_status" value="1" class="onoffswitch-checkbox" />
																			<?php } ?>
																			 <label class="onoffswitch-label" for="<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_status"></label>
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<div class="sh-help"><?php echo $help_region_status; ?></div>
																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="sh-flex">
																	<label class="col-sm-2 control-label"><?php echo $entry_region_hide; ?></label>
																	<div class="col-sm-3">
																		<div class="onoffswitch">
																			<?php if (${'hide_' . $shipping_method['id'] . '_' . $region['id']}) { ?>
																				<input type="checkbox" name="shiptor_<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_hide" id="<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_hide" value="1" class="onoffswitch-checkbox" checked="checked" />
																			<?php } else { ?>
																				<input type="checkbox" name="shiptor_<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_hide" id="<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_hide" value="1" class="onoffswitch-checkbox" />
																			<?php } ?>
																			 <label class="onoffswitch-label" for="<?php echo $shipping_method['id']; ?>_<?php echo $region['id']; ?>_hide"></label>
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<div class="sh-help"><?php echo $help_region_hide; ?></div>
																	</div>
																</div>
															</div>
														</div>
													<?php } ?>
												</div>
											</div>
										</div>
										<?php } ?>
									</div><!-- / tab-general -->

								<?php } ?>
								<?php } ?>
								</div><!-- / tab-content -->
							</div>

						</div>

						<!-- /методы доставки -->

						<!-- параметры доставки -->

						<div class="tab-pane" id="tab-delivery">
							<div style="float: right;">
								<a href="https://shiptor.ru/help/integration/opencart/opencart-setting#article_1" target="_blank"><?= $text_faq; ?></a>
							</div>
							<div class="form-group required">
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_weight; ?></label>
									<div class="col-sm-3">
										<input type="text" name="shiptor_weight" value="<?php echo $weight; ?>" class="form-control" />
										<?php if (isset($error_default_weight)) { ?><span class="text-danger"><?php echo $error_default_weight; ?></span><?php } ?>
									</div>
									<div class="col-sm-7">
										<div class="sh-help"><?php echo $help_dimensions; ?></div>
									</div>
								</div>
							</div>
							<div class="form-group required">
								<div class="sh-flex">
									<label class="col-sm-2 control-label" for="input-size"><?php echo $entry_size; ?></label>
									<div class="col-sm-3">
									  <select name="shiptor_size" id="input-size" class="form-control">
										<?php if ($shiptor_size) { ?>
										<option value="1" selected="selected"><?php echo $text_size_standart; ?></option>
										<option value="0"><?php echo $text_size_auto; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_size_standart; ?></option>
										<option value="0" selected="selected"><?php echo $text_size_auto; ?></option>
										<?php } ?>
									  </select>
									</div>
									<div class="col-sm-7">
										<div class="sh-help">Алгоритм вычисления итоговых измерений посылки</div>
									</div>
								</div>
								</br>
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_default_dimensions; ?></label>
									<div class="col-sm-3">
										<input type="text" name="shiptor_default_length" value="<?php echo $default_length; ?>" class="form-control" style="width: 25%; display: inline;" />
										&nbsp;x&nbsp;
										<input type="text" name="shiptor_default_width" value="<?php echo $default_width; ?>" class="form-control" style="width: 25%; display: inline;" />
										&nbsp;x&nbsp;
										<input type="text" name="shiptor_default_height" value="<?php echo $default_height; ?>" class="form-control" style="width: 25%; display: inline;" />
										<?php if (isset($error_default_dimensions)) { ?><span class="text-danger"><?php echo $error_default_dimensions; ?></span><?php } ?>
									</div>
									<div class="col-sm-7">
										<div class="sh-help"><?php echo $help_default_dimensions; ?></div>
									</div>
								</div>
							</div>
							<div class="form-group">
							</div>

							<?php /* единицы измерения веса - строго килограммы */ ?>
							<input type="hidden" name="shiptor_weight_class_id" value="1">

							<div class="form-group">	
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_region; ?></label>
									<div class="col-sm-3">
										<input type="text" name="shiptor_regions" value="" placeholder="Автодополнение" class="form-control" />
										<div id="shiptor-regions" class="well well-sm" style="height: 150px; overflow: auto;">
										<?php foreach ($regions as $region) { ?>
											<div id="shiptor-regions<?php echo $region['id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $region['name']; ?><input type="hidden" name="shiptor_regions[]" value="<?php echo $region['id']; ?>" /></div>
										<?php } ?>
										</div>
									</div>
									<div class="col-sm-7">
										<div class="sh-help"><?php echo $help_region; ?></div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_days; ?></label>
									<div class="col-sm-3">								
										<div class="onoffswitch">
											<?php if ($days) { ?>
												<input type="checkbox" name="shiptor_days" id="days" value="1" class="onoffswitch-checkbox" checked="checked" />
											<?php } else { ?>
												<input type="checkbox" name="shiptor_days" id="days" value="1" class="onoffswitch-checkbox" />
											<?php } ?>
											 <label class="onoffswitch-label" for="days"></label>
										
										</div>
									</div>
									<div class="col-sm-7">
										<div class="increase">
										<label>
										<?php echo $help_increase_days; ?>
										</label>
										</div>
										<input name="shiptor_increase_days" value="<?php echo $increase_days;?>" class="form-control" style="width: 10%; display: inline;">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_time; ?></label>
									<div class="col-sm-3">
										<div class="onoffswitch">
											<?php if ($time) { ?>
												<input type="checkbox" name="shiptor_time" id="time" value="1" class="onoffswitch-checkbox" checked="checked" />
											<?php } else { ?>
												<input type="checkbox" name="shiptor_time" id="time" value="1" class="onoffswitch-checkbox" />
											<?php } ?>
											 <label class="onoffswitch-label" for="time"></label>
										</div>
									</div>
									<div class="col-sm-7">
										<div class="sh-help"><?php echo $help_time; ?></div>
									</div>
								</div>
							</div>
							<div class="form-group required">
								<div class="col-sm-3"></div>
								<div class="col-sm-6">
									<h3><?php echo $entry_setting_line_delivery; ?></h3>
								</div>
								<div class="col-sm-3"></div>
							</div>
							<div class="form-group">
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_setting_city_delivery; ?></label>
									<div class="col-sm-3">
										<input type="hidden" id="city-value" name="shiptor_city_delivery_value" value="<?php echo $shiptor_city_delivery_value; ?>" class="form-control">
										<input type="text" <?php if(empty($shiptor_city_delivery)){ ?> style="background:#CBC3C3;" <?php } ?> name="shiptor_city_delivery" value="<?php echo $shiptor_city_delivery; ?>" class="form-control">
									</div>
								</div>
							</div>
							<div class="form-group required">
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_setting_fio_delivery; ?></label>
									<div class="col-sm-3">
										<input type="text" name="shiptor_fio_delivery" value="<?php echo $shiptor_fio_delivery; ?>" class="form-control">
									</div>
								</div>
							</div>
							<div class="form-group required">
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_setting_address_delivery; ?></label>
									<div class="col-sm-3">
										<input type="text" name="shiptor_address_delivery" value="<?php echo $shiptor_address_delivery; ?>" class="form-control">
									</div>
								</div>
							</div>
							<div class="form-group required">
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_setting_telephone_delivery; ?></label>
									<div class="col-sm-3">
										<input type="text" name="shiptor_telephone_delivery" value="<?php echo $shiptor_telephone_delivery; ?>" class="form-control">
									</div>
								</div>
							</div>
							<div class="form-group required">
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_setting_email_delivery; ?></label>
									<div class="col-sm-3">
										<input type="text" name="shiptor_email_delivery" value="<?php echo $shiptor_email_delivery; ?>" class="form-control">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_setting_postponement_delivery; ?></label>
									<div class="col-sm-3">
										 <select name="shiptor_postponement_delivery" id="input-postponement" class="form-control">
											<?php foreach ($postponement as $post) { ?>
											  <?php if ($post['value'] == $shiptor_postponement_delivery) { ?>
											  <option value="<?php echo $post['value']; ?>" selected="selected"><?php echo $post['day']; ?></option>
											  <?php } else { ?>
											  <option value="<?php echo $post['value']; ?>"><?php echo $post['day']; ?></option>
											  <?php } ?>
											<?php } ?>
										  </select>
									</div>
								</div>
							</div>
							<!--<div class="form-group required">
								<div class="sh-flex">
									<label class="col-sm-2 control-label"><?php echo $entry_setting_fence_interval_delivery; ?></label>
									<div class="col-sm-3">
										<input type="text" name="shiptor_fence_interval_delivery" value="" class="form-control">
									</div>
								</div>
							</div>-->
						</div>

						<!-- /параметры доставки -->


						<!-- настройки -->

						<div class="tab-pane" id="tab-setting">
							<div style="float: right;">
								<a href="https://shiptor.ru/help/integration/opencart/opencart-setting#article_0" target="_blank"><?= $text_faq; ?></a>
							</div>
							<div class="form-group required">
								<div class="sh-flex">
									<label class="col-sm-3 control-label"><?php echo $entry_authorization; ?></label>
									<div class="col-sm-3">
										<input type="text" name="shiptor_authorization" value="<?php echo $authorization; ?>" class="form-control" />									
										<?php if (isset($error_authorization)) { ?><span class="text-danger"><?php echo $error_authorization; ?></span><?php } ?>
									</div>
									<div class="col-sm-7">
										<div class="sh-help"><?php echo $help_authorization; ?></div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="sh-flex">
									<label class="col-sm-3 control-label"><?php echo $entry_logger; ?></label>
									<div class="col-sm-3">							
										<div class="onoffswitch">
											<?php if ($logger) { ?>
												<input type="checkbox" name="shiptor_logger" id="logger" value="1" class="onoffswitch-checkbox" checked="checked" />
											<?php } else { ?>
												<input type="checkbox" name="shiptor_logger" id="logger" value="1" class="onoffswitch-checkbox" />
											<?php } ?>
											 <label class="onoffswitch-label" for="logger"></label>
										</div>
									</div>
									<div class="col-sm-7">
										<div class="sh-help"><?php echo $help_logger; ?></div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="sh-flex">
									<label class="col-sm-3 control-label"><?php echo $entry_status; ?></label>
									<div class="col-sm-3">
										<div class="onoffswitch">
											<?php if ($status) { ?>
												<input type="checkbox" name="shiptor_status" id="status" value="1" class="onoffswitch-checkbox" checked="checked" />
											<?php } else { ?>
												<input type="checkbox" name="shiptor_status" id="status" value="1" class="onoffswitch-checkbox" />
											<?php } ?>
											 <label class="onoffswitch-label" for="status"></label>
										</div>
									</div>
									<div class="col-sm-7">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="sh-flex">
									<label class="col-sm-3 control-label"><?php echo $entry_sort_order; ?></label>
									<div class="col-sm-3">
										<input type="text" name="shiptor_sort_order" value="<?php echo $sort_order; ?>" class="form-control" />
									</div>
									<div class="col-sm-7">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="sh-flex">
									<label class="col-sm-3 control-label" for="input-id-product"><?php echo $entry_id_product; ?></label>
									<div class="col-sm-3">
									  <select name="shiptor_id_product" id="input-id-product" class="form-control">
										<?php if ($shiptor_id_product) { ?>
										<option value="1" selected="selected"><?php echo $text_article; ?></option>
										<option value="0"><?php echo $text_model; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_article; ?></option>
										<option value="0" selected="selected"><?php echo $text_model; ?></option>
										<?php } ?>
									  </select>
									</div>
									<div class="col-sm-7">
									</div>
								</div>	
							</div>
							<div class="form-group">
								<div class="sh-flex">
									<label class="col-sm-3 control-label" for="input-export-product"><?php echo $entry_export_product; ?></label>
									<div class="col-sm-3">
									  <input type="button" class="btn btn-default" value="<?php echo $button_export; ?>" onclick="exportProduct();" id="input-export-product">
									</div>
									<div class="col-sm-7">
									<div id="error-product"></div>
									<div id="success-product"></div>
									<div class="sh-help">Только для НОВЫХ пользователей услуги фуллфилмент Shiptor(<b>Не более 5 опций!</b>).</div>
									</div>
								</div>	
							</div>
							<div class="form-group">
								<div class="sh-flex">
								    <label class="col-sm-3 control-label"><?php echo $entry_validate_period; ?></label>
								    <div class="col-sm-3">
										<select name="shiptor_validate_period" class="form-control">
										<?php foreach ($validate_periods as $period) { ?>
											<?php if($period['second']==$shiptor_validate_period){?>
												<option value="<?php echo $period['second']; ?>" selected><?php echo $period['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $period['second']; ?>"><?php echo $period['name']; ?></option>
											<?php } ?>
										<?php } ?>
										</select>
									</div>
									<div class="col-sm-7">
										<div class="checkbox">
											<label class="control-label">
												<div class="col-sm-1"></div>
												<input type="checkbox" name="shiptor_auto_send" value="1" <?php if($auto_send > 0){ ?> checked="checked" <?php } ?>>
												<input type="hidden" name="shiptor_time_auto" value="<?php echo $shiptor_time_auto; ?>">
												<b><?php echo $entry_auto_send; ?></b>
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
							       <div class="sh-flex">
								       <label class="col-sm-3 control-label"><?php echo $entry_order_status_for_api; ?></label>
								       <div class="col-sm-3">
											<select name="shiptor_order_status_for_api" class="form-control">
												<?php foreach ($order_statuses as $order_status) { ?>
												<?php if($order_status['order_status_id']==$order_status_for_api){?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
												<?php }} ?>
											</select>
								       </div>
									<div class="col-sm-7">
									</div>
							       </div>
						       </div>
							  <table id="table" class="table table-bordered">
								<tbody>
								<tr>
									<td colspan="2" style="text-align: center; vertical-align: middle;" ><?php echo $entry_order_status_after_api; ?></td>
								</tr>
								<tr>
									<td style="text-align: center; vertical-align: middle;">
								       <label><?php echo $entry_order_status_after_new; ?></label>
										<select name="shiptor_order_status_after_api_new" class="form-control">
											<option value="0" <?php if($order_status_after_api_new==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_new){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
								    </td>
									<td style="text-align: center; vertical-align: middle;">
								       <label><?php echo $entry_order_status_after_waiting_pickup; ?></label>
										<select name="shiptor_order_status_after_api_waiting_pickup" class="form-control">
											<option value="0" <?php if($order_status_after_api_waiting_pickup==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_waiting_pickup){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
									</td>
								</tr>
								<tr>
									<td style="text-align: center; vertical-align: middle;">
										<label><?php echo $entry_order_status_after_waiting_send; ?></label>
										<select name="shiptor_order_status_after_api_waiting_send" class="form-control">
											<option value="0" <?php if($order_status_after_api_waiting_send==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_waiting_send){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
									</td>
									<td style="text-align: center; vertical-align: middle;">
								       <label><?php echo $entry_order_status_after_arrived_to_warehouse; ?></label>
										<select name="shiptor_order_status_after_api_arrived_to_warehouse" class="form-control">
											<option value="0" <?php if($order_status_after_api_arrived_to_warehouse==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_arrived_to_warehouse){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
									</td>
								</tr>	
								<tr>
									<td style="text-align: center; vertical-align: middle;">
										<label><?php echo $entry_order_status_after_packed; ?></label>
										<select name="shiptor_order_status_after_api_packed" class="form-control">
											<option value="0" <?php if($order_status_after_api_packed==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_packed){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
									</td>
								   <td style="text-align: center; vertical-align: middle;">
								       <label><?php echo $entry_order_status_after_prepared_to_send; ?></label>
										<select name="shiptor_order_status_after_api_prepared_to_send" class="form-control">
											<option value="0" <?php if($order_status_after_api_prepared_to_send==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_prepared_to_send){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
									</td>
								</tr>	
								<tr>
									<td style="text-align: center; vertical-align: middle;">
										<label><?php echo $entry_order_status_after_sent; ?></label>
										<select name="shiptor_order_status_after_api_sent" class="form-control">
											<option value="0" <?php if($order_status_after_api_sent==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_sent){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
								    </td>
									<td style="text-align: center; vertical-align: middle;">
										<label><?php echo $entry_order_status_after_delivered; ?></label>
										<select name="shiptor_order_status_after_api_delivered" class="form-control">
											<option value="0" <?php if($order_status_after_api_delivered==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_delivered){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
									</td>
								</tr>
								<tr>
									<td style="text-align: center; vertical-align: middle;">
										<label><?php echo $entry_order_status_after_waiting_on_delivery_point; ?></label>
										<select name="shiptor_order_status_after_api_waiting_on_delivery_point" class="form-control">
											<option value="0" <?php if($order_status_after_api_waiting_on_delivery_point==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_waiting_on_delivery_point){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
								    </td>
								   <td style="text-align: center; vertical-align: middle;">
								       <label><?php echo $entry_order_status_after_removed; ?></label>
										<select name="shiptor_order_status_after_api_removed" class="form-control">
											<option value="0" <?php if($order_status_after_api_removed==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_removed){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
									</td>
								</tr>
								<tr>
									<td style="text-align: center; vertical-align: middle;">
										<label><?php echo $entry_order_status_after_returned; ?></label>
										<select name="shiptor_order_status_after_api_returned" class="form-control">
											<option value="0" <?php if($order_status_after_api_returned==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_returned){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
								    </td>
								   <td style="text-align: center; vertical-align: middle;">
								       <label><?php echo $entry_order_status_after_reported; ?></label>
										<select name="shiptor_order_status_after_api_reported" class="form-control">
											<option value="0" <?php if($order_status_after_api_reported==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_reported){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
									</td>
								</tr>
								<tr>
									<td style="text-align: center; vertical-align: middle;">
										<label><?php echo $entry_order_status_after_lost; ?></label>
										<select name="shiptor_order_status_after_api_lost" class="form-control">
											<option value="0" <?php if($order_status_after_api_lost==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_lost){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
								    </td>
								   <td style="text-align: center; vertical-align: middle;">
								      <label><?php echo $entry_order_status_after_resend; ?></label>
										<select name="shiptor_order_status_after_api_resend" class="form-control">
											<option value="0" <?php if($order_status_after_api_resend==0){?> selected<?php }?>><?php echo $text_not_use; ?></option>
											<?php foreach ($order_statuses as $order_status) { ?>
											<?php if($order_status['order_status_id']==$order_status_after_api_resend){?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected><?php echo $order_status['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php }} ?>
										</select>
									</td>
								</tr>
							  </tbody>
							</table>
						</div>

						<!-- /настройки -->

					</div><!-- / tab-content -->

				<?php } else { ?>

					<div class="form-horizontal">
						<div class="form-group required">
							<div class="sh-flex">
								<label class="col-sm-2 control-label"><?php echo $entry_authorization; ?></label>
								<div class="col-sm-3">
									<input type="text" name="shiptor_authorization" value="<?php echo $authorization; ?>" class="form-control" />
								</div>
								<div class="col-sm-7">
									<div id="error-false" class="sh-help"><?php echo $help_authorization; ?></div>
								</div>
							</div>				
						</div>				
						<div class="form-group">
							<div class="col-sm-push-3 col-sm-9"><a onclick="Auth();" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-success"><?php echo $button_authorization; ?></a></div>
						</div>			
					</div>			
				<?php } ?>			
				</form>
			</div>
		</div>
	</div>
</div>


<link rel="stylesheet" href="view/javascript/shipping/shiptor/kladr/css/jquery.kladr.min.css" />
<script src="view/javascript/shipping/shiptor/kladr/js/jquery.kladr.min.js"></script>
<script>
	$(document).on("click", '[name="shiptor_city_delivery"]', function() {
		$('[name="shiptor_city_delivery"]').attr('style','');
	});

	$(document).on("keyup", '[name="shiptor_city_delivery"]', function() {
      $(this);
      var e = '<?php echo $country; ?>';
      $(this).kladr({
          type: $.kladr.type.city,
          withParents: !0,
          country: e,
          limit: 50,
		  select: function(e) {
			$('#city-value').val(e.kladr_id);
		  },
          labelFormat: function(e, t) {
              var a = "",
              n = e.name.toLowerCase();
              t = t.name.toLowerCase();
              var r = n.indexOf(t);
              return r = r > 0 ? r : 0, e.type_short && (a += e.type_short + ". "), t.length < e.name.length ? (a += e.name.substr(0, r), a += "<strong>" + e.name.substr(r, t.length) + "</strong>", a += e.name.substr(r + t.length, e.name.length - t.length - r)) : a += "<strong>" + e.name + "</strong>", e.administrative_area && (a += " <small>" + e.readable_parents + ".</small>"), a
          }
      })
	});
</script>
<script>
$('#datetimepicker').datetimepicker({language: 'ru', pickDate: false, icons: {time: "fa fa-clock-o", date: "fa fa-calendar", up: "fa fa-arrow-up", down: "fa fa-arrow-down"}});

$('input[name=shiptor_regions]').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=extension/shipping/shiptor/regions&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return { label: item.name, value: item.id }
				}));
			}
		});
	},
	select: function(item) {
		$('[name=shiptor_regions]').val('');
		$('#shiptor-regions' + item.value).remove();
		$('#shiptor-regions').append('<div id="shiptor-regions' + item.value + '"><i class="fa fa-minus-circle"></i> ' + item.label + '<input type="hidden" name="shiptor_regions[]" value="' + item.value + '" /></div>');	
	}
});
	
$('#shiptor-regions').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

function exportProduct() {
	$('#input-export-product').button('loading');
	if (confirm('"Выгрузить данные по товарам в Shiptor ?"')) {
		$("#success-product").html("");
		$("#error-product").html("");
		$.post('index.php?route=extension/shipping/shiptor/exportProduct&token=<?php echo $token; ?>', { type: 'export' }).done(function(json) {
			if (json.success) {
				$("#error-product").html("");
				$('#input-export-product').button('reset');
				$("#success-product").html("<b class='text-success'>" + json.success + "</a></b>");
			}
			if (json.error) {
				$("#success-product").html("");
				$('#input-export-product').button('reset');
				$("#error-product").html("<b class='text-danger'>" + json.error + "</a></b>");
			}
		});
	}else{
		$("#success-product").html("");
		$("#error-product").html("");
		$('#input-export-product').button('reset');
	}
}

function Auth() {
	$.ajax({
		url: 'index.php?route=extension/shipping/shiptor/auth&token=<?php echo $token; ?>',
		data: {'shiptor_authorization':$('input[name=shiptor_authorization]').val()},
		type: 'POST',
		dataType: 'json',
		beforeSend: function() {			
			$('.text-danger').remove();
		},
		success: function(json) {
			if (json.error) {
				$("#error-false").html("<b class='text-danger'>" + json.error + ". Проверьте ключ в <a class='help_authorization' href='https://shiptor.ru/account/settings/api' target='_blank'>личном кабинете</a></b>");
			}			
			if (json.success) {
				document.location.reload(true);
			}
		}
	});
}
function setCorrectPercent(id){
	if($('select[name=shiptor_'+id+'_type]').val()=='P' &&
	   ($('input[name=shiptor_'+id+'_markup]').val()>100 || $('input[name=shiptor_'+id+'_markup]').val()<-100)){
		
		if($('input[name=shiptor_'+id+'_markup]').val().indexOf('-')==-1){
			if($('input[name=shiptor_'+id+'_markup]').val()>100){
				$('input[name=shiptor_'+id+'_markup]').val('100');
			}
		}
		else {
			if($('input[name=shiptor_'+id+'_markup]').val()<-100){
				$('input[name=shiptor_'+id+'_markup]').val('-100');
			}
		}
	}
	$('#tab-'+id+' input.form-control:not(input[name=shiptor_'+id+'_markup],input[name=shiptor_'+id+'_my_comment],input[name=shiptor_'+id+'_sort_order])').each(function(){
		if($(this).val().indexOf('-')!=-1){
			$(this).val($(this).val().split('-')[1]);
		}
	});
}
$('#form-shiptor').on('focusout','input.form-control',function(){
	setCorrectPercent();
});
$('#form-shiptor').on('submit', function(event){
	var id = $('#tab-general .tab-content .tab-pane.active').attr('id').split('-')[1],
            timeVal, time;
	if($('select[name=shiptor_'+id+'_type]').val()!='0' && $('input[name=shiptor_'+id+'_markup]').val()==''){
		$('select[name=shiptor_'+id+'_type]').val(0);
	}
	event.preventDefault();
	setCorrectPercent(id);
	if($('#datetimepicker input').length > 0){
            timeVal = $('#datetimepicker input').val();
            if(!!timeVal){
                var time = timeVal.split(':');
                if(time[0]>=12 && time[0]<21){
                        $('.form-group .alert').remove();
                        $('#datetimepicker').parent().siblings('div').find('.sh-help').after('<div class="alert"><?php echo $error_is_time; ?></div>');
                        return;
                }
            }
	}
	$(this).unbind('submit').submit();
});
$('input[data-name=status]').on('change', function(){
	var shipping = $(this);
	if(shipping.is(':checked')){
		$('li[data-id='+shipping.attr('data-id')+']').removeClass('status-off').addClass('status-on');
	}
	else{
		$('li[data-id='+shipping.attr('data-id')+']').removeClass('status-on').addClass('status-off');
	}
});
</script>

<?php echo $footer; ?>
