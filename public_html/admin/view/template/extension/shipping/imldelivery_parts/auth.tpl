		  	<div class="tab-pane active" id="1">
		  		<div class="form-group">
		  			<label class="col-sm-3 ">Логин</label>
		  			<div class="col-sm-9">
		  				<input type="text" name="imldelivery_login" value="<?php echo $imldelivery_login ?>"  id="imldelivery_login" class="" />
		  			</div>
		  		</div>
		  		<div class="form-group">
		  			<label class="col-sm-3 " >Пароль</label>
		  			<div class="col-sm-9">
		  				<input type="password" name="imldelivery_password" value="<?php echo $imldelivery_password ?>"  id="imldelivery_password" class="" />
		  			</div>
		  		</div>
		  		<div class="form-group">
		  			<label class="col-sm-3 " >Город отправителя</label>
		  			<div class="col-sm-9">
		  				<select name="imldelivery_departureCity"  class="">
						  <?php foreach($imldelivery_cityfrom_values as $key => $item): ?>
							<?php if($imldelivery_departureCity == $key): ?>
							<option value="<?php echo $key ?>" selected="selected"><?php echo $item['name']?></option>
							<?php else:?>
							<option value="<?php echo $key ?>"><?php echo $item['name']?></option>
							<?php endif; ?>
						  <?php endforeach; ?>
		  				</select>
		  			</div>
		  		</div>
		  	</div>