			<div class="tab-pane" id="5">
				<div class="form-group">
					<label class="col-sm-3 " >Статус модуля</label>
					<div class="col-sm-9">
						<select name="imldelivery_status"  class="">
							<?php if($imldelivery_status == 1): ?>
							<option value="1" selected="selected"><?php echo $text_enabled ?></option>
							<option value="0"><?php echo $text_disabled ?></option>
							<?php else:?>
							<option value="1"><?php echo $text_enabled ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled ?></option>
							<?php endif; ?>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 " >Позиция выдачи покупателю результатов расчета</label>
					<div class="col-sm-9">
						<input type="text" name="imldelivery_sort_order" value="<?php echo $imldelivery_sort_order ?>" placeholder="<?php echo $entry_sort_order ?>" id="input-sort-order" class="" />
					</div>
				</div>
			</div>