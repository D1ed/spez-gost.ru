			<div class="tab-pane" id="4">
				<div class="form-group">
					<label class="col-sm-3 " >Увеличить срок доставки</label>
					<div class="col-sm-9">
						<input type="text" name="imldelivery_addDeliveryDateDays" value="<?php echo $imldelivery_addDeliveryDateDays ?>" id="input-imldelivery_vals_date_val" class="" 
						onkeypress="return filterDigits(event, false)"/>&nbsp;дней
					</div>
					
				</div>
				
				
				<div class="form-group">
					<label class="col-sm-3 " >Изменить стоимость доставки</label>
					
					<div class="col-sm-1">
					<select id="imldelivery_dpExtraOper" name="imldelivery_dpExtraOper">
					<option value="+"
		            <?php if($imldelivery_dpExtraOper == '+' ):?>
		            selected="selected"
		            <?php endif; ?>			            					
					>+</option>
					<option value="-"
		            <?php if($imldelivery_dpExtraOper == '-' ):?>
		            selected="selected"
		            <?php endif; ?>			            					
					>-</option>
					</select>						
					</div>
					
					<div class="col-sm-3">
						<input type="text" name="imldelivery_dpExtraNumber" value="<?php echo $imldelivery_dpExtraNumber ?>" 
						onkeypress="return filterDigits(event, false)"/>
					</div>
					<div class="col-sm-2">
			          <select id="imldelivery_dpExtraMeasure" name="imldelivery_dpExtraMeasure">
			          	<option value="руб"
			          	<?php if($imldelivery_dpExtraMeasure == 'руб' ):?>
			            selected="selected"
			            <?php endif; ?>
			            >руб</option>
			            <option value="%"
			            <?php if($imldelivery_dpExtraMeasure == '%' ):?>
			            selected="selected"
			            <?php endif; ?>			            
			            >%</option>
			          </select>						
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 " >Округлять стоимость доставки</label>
					<div class="col-sm-3">
			          <select id="imldelivery_roundingOper" name="imldelivery_roundingOper">
			            <option value="no"
			          	<?php if($imldelivery_roundingOper == 'no' ):?>
			            selected="selected"
			            <?php endif; ?>			            
			            >
			            не округлять</option>            
			            <option value="+"
			            <?php if($imldelivery_roundingOper == '+' ):?>
			            selected="selected"
			            <?php endif; ?>			            			            
			            >
			            в большую сторону</option>
			            <option value="-"
			            <?php if($imldelivery_roundingOper == '-' ):?>
			            selected="selected"
			            <?php endif; ?>			            
			            >
			            в меньшую сторону</option>
			            <option value="math"
			            <?php if($imldelivery_roundingOper == 'math' ):?>
			            selected="selected"
			            <?php endif; ?>			            
			            >
			            по правилам математики</option>            
			          </select>
					</div>
					
					<div class="col-sm-4">
			          <select id="imldelivery_roundingMeasure" name="imldelivery_roundingMeasure">
			            <option value="unit"
			            <?php if($imldelivery_roundingMeasure == 'unit' ):?>
			            selected="selected"
			            <?php endif; ?>			            
			            >до единиц рублей</option>
			            <option value="dozens"
			            <?php if($imldelivery_roundingMeasure == 'dozens' ):?>
			            selected="selected"
			            <?php endif; ?>			            			            
			            >до десятков рублей</option>
			            <option value="hundreds"
			            <?php if($imldelivery_roundingMeasure == 'hundreds' ):?>
			            selected="selected"
			            <?php endif; ?>			            
			            >до сотен рублей</option>
			          </select>						
					</div>

				</div>			  
				

			</div>