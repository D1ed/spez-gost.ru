			<div class="tab-pane" id="7">
				<div class="form-group">
					<label class="col-sm-3 " >Название блока IML доставки в корзине</label>
					<div class="col-sm-9">
						<input type="text" name="imldelivery_headline_cart" value="<?php echo $imldelivery_headline_cart ?>" id="input-imldelivery_headline_cart" class="" />
					</div>
				</div>


				<div class="form-group fg-va-center">
					<label class="col-sm-3 align-self-center" >Курьерская доставка IML с кассовым обслуживанием</label>
					<div class="col-sm-9">
		          <table class="table fs-table">
		            <tr>
		              <th style="width: 50px;">Включено</th>
		              <th >Название в корзине</th>
		              <th>Стоимость при неответе API</th>
		            </tr>
		            <tr>
		              <td>
						<input type="checkbox" class="" name="imldelivery_enable_method_24ko" <?php echo $imldelivery_enable_method_24ko ? 'checked="checked"' : '' ?>/>						              	
		              </td>
		              <td>
						<input type="text" name="imldelivery_method_24ko_Name" value="<?php echo $imldelivery_method_24ko_Name ?>"  class="method_name" />
		              </td>
		              <td>
						<input type="text" name="imldelivery_fail_con_method_24ko_price" value="<?php echo $imldelivery_fail_con_method_24ko_price ?>"  class="fail_price" 
						onkeypress="return filterDigits(event, true)"/>&nbsp;₽
		              </td>
		            </tr>
		          </table>						
				</div>
				</div>


				<div class="form-group fg-va-center">
					<label class="col-sm-3 " >Предоплаченная курьерская доставка IML</label>
					<div class="col-sm-9">
		          <table class="table fs-table">
		            <tr>
		              <th style="width: 50px;">Включено</th>
		              <th >Название в корзине</th>
		              <th>Стоимость при неответе API</th>
		            </tr>
		            <tr>
		              <td>
						<input type="checkbox" class="" name="imldelivery_enable_method_24" <?php echo $imldelivery_enable_method_24 ? 'checked="checked"' : '' ?>/>						              	
		              </td>
		              <td>
						<input type="text" name="imldelivery_method_24_Name" value="<?php echo $imldelivery_method_24_Name ?>"  class="method_name" />
		              </td>
		              <td>
						<input type="text" name="imldelivery_fail_con_method_24_price" value="<?php echo $imldelivery_fail_con_method_24_price ?>"  class="fail_price" 
						onkeypress="return filterDigits(event, true)"/>&nbsp;₽
		              </td>
		            </tr>
		          </table>						
					</div>
				</div>


				<div class="form-group fg-va-center">
					<label class="col-sm-3 " >Доставки IML до ПВЗ с кассовым обслуживанием</label>
					<div class="col-sm-9">
		          <table class="table fs-table">
		            <tr>
		              <th style="width: 50px;">Включено</th>
		              <th >Название в корзине</th>
		              <th>Стоимость при неответе API</th>
		            </tr>
		            <tr>
		              <td>
						<input type="checkbox" class="" name="imldelivery_enable_method_c24ko" <?php echo $imldelivery_enable_method_c24ko ? 'checked="checked"' : '' ?>/>						              	
		              </td>
		              <td>
						<input type="text" name="imldelivery_method_c24ko_Name" value="<?php echo $imldelivery_method_c24ko_Name ?>"  class="method_name" />
		              </td>
		              <td>
						<input type="text" name="imldelivery_fail_con_method_c24ko_price" value="<?php echo $imldelivery_fail_con_method_c24ko_price ?>"  class="fail_price" 
						onkeypress="return filterDigits(event, true)"/>&nbsp;₽
		              </td>
		            </tr>
		          </table>						
					</div>
				</div>



				<div class="form-group fg-va-center">
					<label class="col-sm-3 " >Предоплаченная доставка IML до ПВЗ</label>
					<div class="col-sm-9">
		          <table class="table fs-table">
		            <tr>
		              <th style="width: 50px;">Включено</th>
		              <th >Название в корзине</th>
		              <th>Стоимость при неответе API</th>
		            </tr>
		            <tr>
		              <td>
						<input type="checkbox" class="" name="imldelivery_enable_method_c24" <?php echo $imldelivery_enable_method_c24 ? 'checked="checked"' : '' ?>/>						              	
		              </td>
		              <td>
						<input type="text" name="imldelivery_method_c24_Name" value="<?php echo $imldelivery_method_c24_Name ?>"  class="method_name" />
		              </td>
		              <td>
						<input type="text" name="imldelivery_fail_con_method_c24_price" value="<?php echo $imldelivery_fail_con_method_c24_price ?>"  class="fail_price" 
						onkeypress="return filterDigits(event, true)"/>&nbsp;₽
		              </td>
		            </tr>
		          </table>						
					</div>
				</div>




				<div class="form-group">
					<label class="col-sm-3 " >Время ожидания ответа от API, сек. (Рекомендуется 10 сек)</label>
					<div class="col-sm-9">
						<input type="text" name="imldelivery_conIMLtimeout" value="<?php echo $imldelivery_conIMLtimeout ?>" id="input-imldelivery_time_api" class="" 
						onkeypress="return filterDigits(event, false)"/>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 " >Отображать доставку при неответе API</label>
					<div class="col-sm-9">
						<input type="checkbox" class="" name="imldelivery_showIMLDelWhenFailCon" <?php echo $imldelivery_showIMLDelWhenFailCon ? 'checked="checked"' : '' ?>/>

					</div>
				</div>
				

				
				
				
				<div class="form-group">
					<label class="col-sm-3 " >Отображать дату доставки</label>
					<div class="col-sm-9">
						<input type="checkbox" class="" name="imldelivery_showDateDelivery" <?php echo $imldelivery_showDateDelivery ? 'checked="checked"' : '' ?>/>								
					</div>
				</div>
				

				<div class="form-group">
					<label class="col-sm-3 " >Доставка в пункты выдачи</label>
					<div class="col-sm-9">
						<select name="imldelivery_deliveryInPickpointType"  class="">
							<option value="all"
							<?php if($imldelivery_deliveryInPickpointType == false or  $imldelivery_deliveryInPickpointType == 'all'):?>
							selected 
							<?php endif; ?>
							>В ПВЗ и в постаматы</option>
							<option value="pvz"
							<?php if ($imldelivery_deliveryInPickpointType == 'pvz'): ?>
							selected 
							<?php endif; ?>
							>Только в ПВЗ</option>
							<option value="postamats"
							<?php if ($imldelivery_deliveryInPickpointType == 'postamats'): ?>
							selected 
							<?php endif; ?>
							>Только в постаматы</option>
						</select>																
					</div>
				</div>
			</div>