
<form action="" method="post" enctype="multipart/form-data" id="form_OptionLink">
	<div class="modal-dialog modal-lg"  role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
			  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			  <h3 class="modal-title"><?php echo $heading_title; ?></h3>
			</div>

			<?php $option_row = 0; ?>
			<?php $option_value_row = 0; ?>

			<table class="table table-striped table-bordered table-hover">
				<div class="modal-body">
				<?php if (isset ($data_copyOptionLink)) { ?>
					<thead>
						<tr>
							<td class="text-center">
								<button type="button" id="delete_all" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="del_name();"><i class="fa fa-trash-o"></i></button>
							</td>

							<td class="text-center"><?php echo $entry_copy_name; ?></td>
							<td class="text-center"><?php echo $entry_copy_name_option; ?></td>
							<td class="text-center"><?php echo $entry_option_value; ?></td>
							<td class="text-center" style="width:40px">
								<?php echo $entry_link_name; ?>
							</td>
							<td class="text-center"><?php echo $entry_link_image; ?></td>

						</tr>
					</thead>

					<?php foreach ($data_copyOptionLink as $copyOptionLink_main) { ?>
						<?php if ($copyOptionLink_main['quantity'] && ($copyOptionLink_main['quantity'] != $product_main['product_id'])) { ?>
							<tbody id="linkcopy<?php echo $option_row; ?>">
								<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
								<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
								<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][required]" value="0" />

								<tr class="info alert-info" id="copyOptionLink_main<?php echo $option_row; ?>">

									<td class="text-center">
										<input type="checkbox" onclick="$('input[name*=\'selected[<?php echo $option_row; ?>]\']').prop('checked', this.checked);" />
									</td>

									<td>
										<label>
											<div id="errorname<?php echo $option_row; ?>"><?php echo $copyOptionLink_main['product_name']; ?></div>

											<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_id]" value="<?php echo $copyOptionLink_main['quantity'] ?>" />
										</label>
									</td>

									<td id="copyOptionLink_warning<?php echo $option_row; ?>" class="text-center">	</td>

									<td class="text-center">
										<div>
											<?php echo $entry_product_option; ?>
											<?php echo $product_option['name']; ?>
											<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />

											<select name="product_option_link[<?php echo $option_row; ?>][product_option_id]" class="form-control">
													<option value=""><?php echo $text_new; ?></option>

													<?php foreach ($copyOptionLink_main['product_option'] as $link_product_option_id) { ?>
														<?php if ($product_option['option_id'] == $link_product_option_id['option_id']) { ?>
															<option selected value="<?php echo $link_product_option_id['product_option_id']; ?>">	<?php echo $text_join; ?>
															</option>
															<script>
																//Подсвечиваем главный товар
																document.getElementById('copyOptionLink_main<?php echo $option_row; ?>').classList.add("danger", "alert-danger");

																//Выводим предупреждение в главном товаре
																document.getElementById('copyOptionLink_warning<?php echo $option_row; ?>').innerHTML='<?php echo $entry_product_option_danger; ?>';
															</script>
														<?php } ?>
													<?php } ?>
											</select>
										</div>
										<div>
											<?php echo $entry_link_view; ?>
											<?php if ($product_option_value == '0') { ?>
												<?php echo $link_view_0; ?>
											<?php } elseif ($product_option_value == '1') { ?>
												<?php echo $link_view_1; ?>
											<?php } elseif ($product_option_value == '2') { ?>
												<?php echo $link_view_2; ?>
											<?php } elseif ($product_option_value == '3') { ?>
												<?php echo $link_view_3; ?>
											<?php } ?>

											<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][value]" value="<?php echo $product_option_value ?>" />
										</div>
									</td>
									<td></td>
									<td></td>
									<td></td>
								</tr>

								<?php foreach ($data_copyOptionLink as $copyOptionLink_links) { ?>
								<?php if ($copyOptionLink_links['quantity'] && ($copyOptionLink_links['quantity'] != $copyOptionLink_main['quantity']) && ($copyOptionLink_links['quantity'] != $product_main['product_id'])) { ?>
									<tr id="link-option-value-row<?php echo $option_value_row; ?>">

										<td class="text-center" id="selected_del">
											<input type="checkbox" id="selected[<?php echo $option_row; ?>][<?php echo $option_value_row; ?>]" name="selected[<?php echo $option_row; ?>]"  value="<?php echo $option_value_row; ?>"/>
										</td>

										<td id="copyOptionLink_warning_link<?php echo $option_value_row; ?>" class="text-center"></td>

										<td>
											<?php echo $copyOptionLink_links['product_name']; ?>

											<input size="1" type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $copyOptionLink_links['quantity']; ?>" />
										</td>

										<td class="text-center">
											<?php echo $copyOptionLink_links['option_name']; ?>

											<input size="1" type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]" value="<?php echo $copyOptionLink_links['option_value_id']; ?>" />
										</td>

										<td class="text-center">
											<?php if (isset($copyOptionLink_links['subtract'])) { ?>
												<input disabled type="checkbox" checked >
												<input type="hidden" type="checkbox" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" checked value="<?php echo $copyOptionLink_links['subtract']; ?>" >
											<?php } else { ?>
												<input disabled type="checkbox" >
												<input type="hidden" type="checkbox" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" value="" >
											<?php } ?>
										</td>

										<td class="text-center">
											<select name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" class="form-control">
												<?php if ($copyOptionLink_links['price_prefix'] == '1') { ?>
													<option value="0"><?php echo $text_off; ?></option>
													<option value="1" selected><?php echo $text_option; ?></option>
													<option value="2"><?php echo $text_product; ?></option>
												<?php } elseif ($copyOptionLink_links['price_prefix'] == '2') { ?>
													<option value="0"><?php echo $text_off; ?></option>
													<option value="1"><?php echo $text_option; ?></option>
													<option value="2" selected><?php echo $text_product; ?></option>
												<?php } else { ?>
													<option value="0" selected><?php echo $text_off; ?></option>
													<option value="1"><?php echo $text_option; ?></option>
													<option value="2"><?php echo $text_product; ?></option>
												<?php } ?>
											</select>
										</td>

										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value=" " />

										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $copyOptionLink_links['price']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]" value="<?php echo $copyOptionLink_links['points_prefix']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $copyOptionLink_links['points']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]" value="<?php echo $copyOptionLink_links['weight_prefix']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $copyOptionLink_links['weight']; ?>"/>

										<td class="text-left"><button type="button" onclick="$(this).tooltip('destroy');$('#link-option-value-row<?php echo $option_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
									</tr>
								<?php } elseif ($copyOptionLink_links['quantity'] && ($copyOptionLink_links['quantity'] == $copyOptionLink_main['quantity'])) { ?>
									<tr id="link-option-value-row<?php echo $option_value_row; ?>">

										<td class="text-center" id="selected_del">
											<input type="checkbox" id="selected[<?php echo $option_row; ?>][<?php echo $option_value_row; ?>]" name="selected[<?php echo $option_row; ?>]" value="<?php echo $option_value_row; ?>"/>
										</td>

										<td id="copyOptionLink_warning_link<?php echo $option_value_row; ?>" class="text-center"></td>

										<td>
											<?php echo $product_main['product_name']; ?>

											<input size="1" type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_main['product_id']; ?>" />
										</td>

										<td class="text-center">
											<?php echo $product_main['option_value_id_name']; ?>

											<input size="1" type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]" value="<?php echo $product_main['option_value_id']; ?>" />
										</td>

										<td class="text-center">
											<?php if (isset($copyOptionLink_main['subtract'])) { ?>
												<input disabled type="checkbox" checked>
												<input type="hidden" type="checkbox" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" checked value="<?php echo $copyOptionLink_main['subtract']; ?>" >
											<?php } else { ?>
												<input disabled type="checkbox" >
												<input type="hidden" type="checkbox" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" value="" >
											<?php } ?>
										</td>

										<td class="text-center">
											<select name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" class="form-control">
												<?php if ($copyOptionLink_main['price_prefix'] == '1') { ?>
													<option value="0"><?php echo $text_off; ?></option>
													<option value="1" selected><?php echo $text_option; ?></option>
													<option value="2"><?php echo $text_product; ?></option>
												<?php } elseif ($copyOptionLink_main['price_prefix'] == '2') { ?>
													<option value="0"><?php echo $text_off; ?></option>
													<option value="1"><?php echo $text_option; ?></option>
													<option value="2" selected><?php echo $text_product; ?></option>
												<?php } else { ?>
													<option value="0" selected><?php echo $text_off; ?></option>
													<option value="1"><?php echo $text_option; ?></option>
													<option value="2"><?php echo $text_product; ?></option>
												<?php } ?>
											</select>
										</td>

										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value=" " />

										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $copyOptionLink_main['price']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]" value="<?php echo $copyOptionLink_main['points_prefix']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $copyOptionLink_main['points']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]" value="<?php echo $copyOptionLink_main['weight_prefix']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $copyOptionLink_main['weight']; ?>"/>

										<td class="text-left"><button type="button" onclick="$(this).tooltip('destroy');$('#link-option-value-row<?php echo $option_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
								<?php } elseif ($copyOptionLink_links['quantity'] && ($copyOptionLink_links['quantity'] == $product_main['product_id'])) { ?>
									<tr id="link-option-value-row<?php echo $option_value_row; ?>">

										<td class="text-center" id="selected_del">
											<input type="checkbox" id="selected[<?php echo $option_row; ?>][<?php echo $option_value_row; ?>]" name="selected[<?php echo $option_row; ?>]" value="<?php echo $option_value_row; ?>"/>
										</td>

										<td id="copyOptionLink_warning_link<?php echo $option_value_row; ?>" class="text-center"></td>

										<td>
											<?php echo $copyOptionLink_main['product_name']; ?>

											<input size="1" type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $copyOptionLink_main['quantity']; ?>" />
										</td>

										<td class="text-center">
											<?php echo $copyOptionLink_main['option_name']; ?>

											<input size="1" type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]" value="<?php echo $copyOptionLink_main['option_value_id']; ?>" />
										</td>

										<td class="text-center">
											<?php if (isset($copyOptionLink_main['subtract'])) { ?>
												<input disabled type="checkbox" checked >
												<input type="hidden" type="checkbox" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" checked value="<?php echo $copyOptionLink_main['subtract']; ?>" >
											<?php } else { ?>
												<input disabled type="checkbox" >
												<input type="hidden" type="checkbox" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" value="" >
											<?php } ?>
										</td>

										<td class="text-center">
											<select name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" class="form-control">
												<?php if ($copyOptionLink_main['price_prefix'] == '1') { ?>
													<option value="0"><?php echo $text_off; ?></option>
													<option value="1" selected><?php echo $text_option; ?></option>
													<option value="2"><?php echo $text_product; ?></option>
												<?php } elseif ($copyOptionLink_main['price_prefix'] == '2') { ?>
													<option value="0"><?php echo $text_off; ?></option>
													<option value="1"><?php echo $text_option; ?></option>
													<option value="2" selected><?php echo $text_product; ?></option>
												<?php } else { ?>
													<option value="0" selected><?php echo $text_off; ?></option>
													<option value="1"><?php echo $text_option; ?></option>
													<option value="2"><?php echo $text_product; ?></option>
												<?php } ?>
											</select>
										</td>

										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value=" " />

										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $copyOptionLink_main['price']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]" value="<?php echo $copyOptionLink_main['points_prefix']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $copyOptionLink_main['points']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]" value="<?php echo $copyOptionLink_main['weight_prefix']; ?>"/>
										<input type="hidden" name="product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $copyOptionLink_main['weight']; ?>"/>

										<td class="text-left"><button type="button" onclick="$(this).tooltip('destroy');$('#link-option-value-row<?php echo $option_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
									</tr>
								<?php } ?>

								<?php if ($ProductOptionLink_on_off_fullcheck) { ?>
									<?php foreach ($copyOptionLink_main['product_option'] as $product_option_new) { ?>
										<?php if ($product_option_new['option_id'] == $product_option['option_id']) { ?>
											<?php foreach ($product_option_new['product_option_value'] as $product_option_new1) { ?>

												<script>
													var quantity_link = $('input[name=\'product_option_link[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]\']').prop('value');

													if (quantity_link == <?php echo $product_option_new1['quantity']; ?>) {

														//Подсвечиваем совпадающую опцию
														document.getElementById('link-option-value-row<?php echo $option_value_row; ?>').classList.add("danger", "alert-danger");

														//Выводим предупреждение в товаре создаваемой опции
														document.getElementById('copyOptionLink_warning_link<?php echo $option_value_row; ?>').innerHTML='<?php echo $entry_product_link_danger; ?>';

														//Меняем product_option_id на существующий
														$('input[name*=\'product_option_link[<?php echo $option_row; ?>][product_option_id]\']').prop ('value', <?php echo $product_option_new['product_option_id']; ?>);

														//Проставляем checked
														document.getElementById('selected[<?php echo $option_row; ?>][<?php echo $option_value_row; ?>]').checked = 'checked';
													};
												</script>

											<?php } ?>
										<?php } ?>
									<?php } ?>
								<?php } ?>

								<?php $option_value_row++; ?>
								<?php } ?>
							<?php $option_row++; ?>
							</tbody>
						<?php } ?>
					<?php } ?>
				<?php } else { ?>
					<div class="text-center alert alert-info"  role="alert">
						<?php echo $text_copyOptionLink_no; ?>
					</div>
				<?php } ?>
				</div>
			</table>
			<div class="modal-footer">
				<?php if (isset ($data_copyOptionLink)) { ?>
					<button type="button" class="btn btn-primary" onclick="copy_data();" ><?php echo $entry_save ?></button>
				<?php } ?>
				<button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $entry_close ?></button>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
	function copy_data() {
		if (<?php echo $ProductOptionLink_on_off_save; ?>) {

			var number_error = new Array();

			(function copy_link (i) {
				 if (i < <?php echo $option_row; ?>) {

					var newOptionLink = $('#linkcopy'+i+' :input').serialize();

					$.ajax({
						url:     'index.php?route=catalog/copyOptionLink/newOptionLink&token=' + getURLVar('token'),
						type:     'POST',
						data: newOptionLink,
						success: function() {
							copy_link(i+1);
						},
						error: function() {
							number_error[i] = document.getElementById('errorname'+i).textContent;
							copy_link(i+1);
						}
					})
				} else {
					if (number_error && number_error.length == 0) {
						alert('<?php echo $entry_copy_data; ?>');
						$('#modal_copyOptionLink').modal('hide');
					} else {
						alert('<?php echo $entry_copy_data_error; ?> ( '+number_error+' )');
						$('#modal_copyOptionLink').modal('hide');
					}
				}
			})(0);
		} else {
			$.ajax({
				url:     'index.php?route=catalog/copyOptionLink/newOptionLink&token=' + getURLVar('token'),
				type:     'POST',
				data: $("#"+'form_OptionLink').serialize(),
				success: function(response) {
					alert('<?php echo $entry_copy_data; ?>');
					$('#modal_copyOptionLink').modal('hide');
				},
				error: function(response) {
					alert('<?php echo $entry_copy_data_error; ?>');
				}
			});
		}
	}

	function del_name() {
		var selected_del = $('#selected_del input:checked' ).serializeArray();

		selected_del.forEach (function(option_value_row) {
			$('#link-option-value-row'+option_value_row['value']).remove();
		});

		$('#delete_all').tooltip('destroy');
	}
</script>