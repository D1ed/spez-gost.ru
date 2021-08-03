			<div class="tab-pane" id="6">
			  		<div class="form-group">
		  			<label class="col-sm-3 " >Тестовый режим создания заказа</label>
		  			<div class="col-sm-9">
		  				<input type="checkbox" class="" name="imldelivery_testMode" <?php echo $imldelivery_testMode ? 'checked="checked"' : '' ?>/>
		  			</div>
		  		</div>			


				<div class="form-group">
					<label class="col-sm-3 " >Включать в заказ оценочную стоимость</label>
					<div class="col-sm-9">
						<input type="checkbox" class="" name="imldelivery_enableValuatedAmount" <?php echo $imldelivery_enableValuatedAmount ? 'checked="checked"' : '' ?>/>				
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 " >Включать услугу "Доставка" в чек покупателю</label>
					<div class="col-sm-9">
						<input type="checkbox" class="" name="imldelivery_isIncludedDeliveryCost" <?php echo $imldelivery_isIncludedDeliveryCost ? 'checked="checked"' : '' ?>/>				
					</div>
				</div>


		  		<div class="form-group">
		  			<label class="col-sm-3 " >НДС по-умолчанию для товаров</label>
		  			<div class="col-sm-9">
					<select name="imldelivery_defaultVATRate"  class="">
							<?php foreach($imldelivery_vatvariants as $item): ?>
								<option value="<?php echo $item->productNo?>" 
								<?php if($imldelivery_defaultVATRate == $item->productNo): ?>
								selected="selected"
								<?php endif; ?> ><?php echo $item->description ?></option>
							<?php endforeach; ?>			
					</select>	
					</div>
				</div>
				<?php include DIR_APPLICATION . '/view/template/extension/shipping/imldelivery_parts/conditions.tpl'; ?>
			</div>