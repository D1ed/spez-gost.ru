		  	<div class="tab-pane" id="2">

		  		<div class="form-group">
		  			<label class="col-sm-3 " >Расчет цен</label>
		  			<div class="col-sm-9">
						  <input type="radio"
						<?php if($imldelivery_calcType == 'Сервер IML'): ?>
		  				checked
						  <?php endif; ?> 
						  name='imldelivery_calcType'  value="Сервер IML">&nbsp;Сервер IML&nbsp;&nbsp;&nbsp;&nbsp;
		  				<input type="radio" 
		  				<?php if($imldelivery_calcType == 'Таблица'):?>
		  				checked
		  				<?php endif; ?> name='imldelivery_calcType'  value="Таблица">&nbsp;Таблица&nbsp;&nbsp;&nbsp;&nbsp;
		  			</div>
		  		</div>

		  		<div class="form-group">
		  			<label class="col-sm-3 " >Курьер. Стоимость доставки в своем регионе</label>
		  			<div class="col-sm-9">
						  <input type="text" name="imldelivery_cdOwnRegionPrice" 
						  value="<?php echo $imldelivery_cdOwnRegionPrice ?>" class="mbdisabled" onkeypress="return filterDigits(event, true)"/>&nbsp;₽
		  			</div>
		  		</div>

		  		<div class="form-group">
		  			<label class="col-sm-3 ">Курьер. Стоимость доставки в другие регионы</label>
		  			<div class="col-sm-9">
						  <input type="text" name="imldelivery_cdOtherRegionPrice" 
						  value="<?php echo $imldelivery_cdOtherRegionPrice ?>"  class="mbdisabled" onkeypress="return filterDigits(event, true)"/>&nbsp;₽
		  			</div>
		  		</div>

		  		<div class="form-group">
		  			<label class="col-sm-3 " >Самовывоз. Стоимость доставки в своем регионе</label>
		  			<div class="col-sm-9">
						  <input type="text" name="imldelivery_pkOwnRegionPrice" 
						  value="<?php echo $imldelivery_pkOwnRegionPrice ?>" id="input-price_pvz_same" class="mbdisabled" onkeypress="return filterDigits(event, true)"/>&nbsp;₽
		  			</div>
		  		</div>

		  		<div class="form-group">
		  			<label class="col-sm-3 " >Самовывоз. Стоимость доставки в другие регионы</label>
		  			<div class="col-sm-9">
						  <input type="text" name="imldelivery_pkOtherRegionPrice" 
						  value="<?php echo $imldelivery_pkOtherRegionPrice ?>" id="input-price_pvz_other" class="mbdisabled" onkeypress="return filterDigits(event, true)"/>&nbsp;₽
		  			</div>
		  		</div>
			<div class="form-group">
				<label class="col-sm-3 " >Расчет заказа</label>
				<div class="col-sm-9">
					<input type="radio" 
					<?php if($imldelivery_packageCalcType == 'fix-pack' ): ?>
					checked
					<?php endif; ?> name='imldelivery_packageCalcType'  id='fix-pack' value="fix-pack">&nbsp;Фиксированная упаковка&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" 
					<?php if($imldelivery_packageCalcType == 'pgood-pack'): ?>
					checked
					<?php endif; ?> name='imldelivery_packageCalcType'  id='pgood-pack' value="pgood-pack">&nbsp;Каждый товар в своей упаковке (1 товар - 1 место)&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>			  	  



			<div class="form-group">
				<label class="col-sm-3 "></label>
				<div class="col-sm-9">
					<table class="table fs-table">
						<tr>
							<th colspan="2">
								<fieldset class="fset-pack fix-pack">
									<legend>Параметры</legend>
									<div>Габариты места по-умолчанию:</div><br>
									<label class="wpce-label"  for="imldelivery_defaultWeightKg">Вес</label>
									<input type="text" name="imldelivery_defaultWeightKg" value="<?php echo $imldelivery_defaultWeightKg ?>" 
									onkeypress="return filterDigits(event, true)"
									/>&nbsp;&nbsp;кг<br>
									<label class="wpce-label"  for="imldelivery_defaultLength">Длина</label>
									<input type="text" name="imldelivery_defaultLength" value="<?php echo $imldelivery_defaultLength ?>"
									onkeypress="return filterDigits(event, true)" />&nbsp;&nbsp;см<br>
									<label class="wpce-label"  for="imldelivery_defaultWidth">Ширина</label>
									<input type="text" name="imldelivery_defaultWidth" value="<?php echo $imldelivery_defaultWidth?>" 
									onkeypress="return filterDigits(event, true)"/>&nbsp;&nbsp;см<br>
									<label class="wpce-label"  for="imldelivery_defaultHeight">Высота</label>
									<input type="text" name="imldelivery_defaultHeight" value="<?php echo $imldelivery_defaultHeight ?>"
									onkeypress="return filterDigits(event, true)" />&nbsp;&nbsp;см<br>
								</fieldset>


								<fieldset class="fset-pack pgood-pack">
									<legend>Параметры</legend>                    
									<div>Габариты товара по-умолчанию:</div><br>
									<label class="wpce-label"  for="imldelivery_default_good_weight_kg">Вес</label>
									<input type="text" name="imldelivery_defaultGoodWeightKg" value="<?php echo $imldelivery_defaultGoodWeightKg ?>" 
									onkeypress="return filterDigits(event, true)"/>&nbsp;&nbsp;кг<br>
									<label class="wpce-label"  for="imldelivery_defaultGoodLength">Длина</label>
									<input type="text" name="imldelivery_defaultGoodLength" value="<?php echo $imldelivery_defaultGoodLength?>" 
									onkeypress="return filterDigits(event, true)"/>&nbsp;&nbsp;см<br>
									<label class="wpce-label"  for="imldelivery_defaultGoodWidth">Ширина</label>
									<input type="text" name="imldelivery_defaultGoodWidth" value="<?php echo $imldelivery_defaultGoodWidth?>" 
									onkeypress="return filterDigits(event, true)"/>&nbsp;&nbsp;см<br>
									<label class="wpce-label"  for="imldelivery_defaultGoodHeight">Высота</label>
									<input type="text" name="imldelivery_defaultGoodHeight" value="<?php echo $imldelivery_defaultGoodHeight?>" 
									onkeypress="return filterDigits(event, true)"/>&nbsp;&nbsp;см<br>
								</fieldset>

							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 " >Дополнительный вес упаковки для каждого товара</label>
				<div class="col-sm-9">
					<input type="text" name="imldelivery_addExtraWeightKg" value="<?php echo $imldelivery_addExtraWeightKg ?>" id="input-imldelivery_weight_pack" class="" onkeypress="return filterDigits(event, true)"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 " >Включить комплектацию заказа (фулфилмент)</label>
				<div class="col-sm-9">
					<input type="checkbox" name="imldelivery_enableFullfilment" <?php echo $imldelivery_enableFullfilment  ? 'checked="checked"' : '' ?>/>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 " >Подключать javascript-файл Яндекс.Карт</label>
				<div class="col-sm-9">
					<input type="checkbox" name="imldelivery_yandex_map" <?php echo $imldelivery_yandex_map  ? 'checked="checked"' : '' ?>/>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 " >Ключ Яндекс.Карт</label>
				<div class="col-sm-9">
					<input type="text" style="width: 600px;" name="imldelivery_yandex_map_apikey" value="<?php echo $imldelivery_yandex_map_apikey ?>"/>
				</div>
			</div>

		</div>
		
		
		  
<script>
$(document).ready(function()
{
	
	$('input[name="imldelivery_yandex_map"]').change(function(e)
	{
		e.preventDefault();
		if($(this).prop('checked'))
		{
			$('input[name="imldelivery_yandex_map_apikey"]').prop('disabled', false);
		}
		else
		{
			$('input[name="imldelivery_yandex_map_apikey"]').prop('disabled', true);	
		}
	});
	
	
	$('input[name="imldelivery_yandex_map"]').change();
});
	
</script>  