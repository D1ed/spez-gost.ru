<div class="form-group">
	<label class="col-sm-3 " ></label>
	<label class="col-sm-9 "><strong></strong></label>
</div>

<div class="form-group">
	<label class="col-sm-3 " ></label>
	<label class="col-sm-6 text-center"><strong>УСЛОВИЯ ВЫДАЧИ</strong></label>
</div>

<?php foreach($imldelivery_customservicesvals as $item): ?>
<div class="form-group">
	<label class="col-sm-3 " ></label>
	<div class="col-sm-5">
		<?php echo $item->name ?>
	</div>
	<div class="col-sm-4">
		<select name="imldelivery_customservices[]">
			<option 
			<?php echo $order_text_disabled ?> 
			value="<?php echo $item->productNo ?>" 
			<?php if(is_array($imldelivery_customservices) && in_array($item->productNo, $imldelivery_customservices)): ?>
			selected="selected"
			<?php endif; ?> >Разрешено</option>
			<option <?php echo $order_text_disabled ?> value=""
			<?php if(is_array($imldelivery_customservices) && !in_array($item->productNo, $imldelivery_customservices)): ?>
			selected="selected"
			<?php endif; ?>
			>Запрещено</option>		
		</select>
	</div>
</div>
<?php endforeach; ?>
