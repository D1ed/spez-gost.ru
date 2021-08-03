			<div class="tab-pane" id="3">
				<div class="form-group">
					<label class="col-sm-3 ">
					<strong><p><u>Статус IML-заказа</u></p></strong>
					</label>
					<div class="col-sm-9">
						<strong><p><u>Статус заказа в Opencart</u></p></strong>
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 ">
					
					</label>
					<div class="col-sm-9">
					
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 " >Заказ принят</label>
					<div class="col-sm-9">
						<select name="imldelivery_StsAccepted"  class="">
							{% set selected_default = '' %}
							{% if (imldelivery_StsAccepted == false) or (imldelivery_StsAccepted == 'nostatus') %}
							{% set selected_default = ' selected="selected"' %}
							{% endif %}
							<option value="nostatus"{{ selected_default }}>{{ entity_imldelivery_orderstatus_sent_default }}</option>
							{% for val in imldelivery_payment_status_values %}
							{% set selected = '' %}
							{% if (val['order_status_id'] == imldelivery_orderstatus_sent) %}
							{% set selected = ' selected="selected"' %}
							{% endif %}
							<option value="{{ val['order_status_id'] }}"{{ selected }}>{{ val['name'] }}</option>
							{% endfor %}
						</select>
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 " >Заказ передан курьеру</label>
					<div class="col-sm-9">
						<select name="imldelivery_StsHand2Courier"  class="">
							{% set selected_default = '' %}
							{% if (imldelivery_StsHand2Courier == false) or (imldelivery_StsHand2Courier == 'nostatus') %}
							{% set selected_default = ' selected="selected"' %}
							{% endif %}
							<option value="nostatus"{{ selected_default }}>{{ entity_imldelivery_orderstatus_courier_default }}</option>
							{% for val in imldelivery_payment_status_values %}
							{% set selected = '' %}
							{% if (val['order_status_id'] == imldelivery_orderstatus_courier) %}
							{% set selected = ' selected="selected"' %}
							{% endif %}
							<option value="{{ val['order_status_id'] }}"{{ selected }}>{{ val['name'] }}</option>
							{% endfor %}
						</select>
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 " >Заказ доставлен в пункт самовывоза</label>
					<div class="col-sm-9">
						<select name="imldelivery_StsOnPickpont"  class="">
							{% set selected_default = '' %}
							{% if (imldelivery_StsOnPickpont == false) or (imldelivery_StsOnPickpont == 'nostatus') %}
							{% set selected_default = ' selected="selected"' %}
							{% endif %}
							<option value="nostatus"{{ selected_default }}>{{ entity_imldelivery_orderstatus_pvz_default }}</option>
							{% for val in imldelivery_payment_status_values %}
							{% set selected = '' %}
							{% if (val['order_status_id'] == imldelivery_orderstatus_pvz) %}
							{% set selected = ' selected="selected"' %}
							{% endif %}
							<option value="{{ val['order_status_id'] }}"{{ selected }}>{{ val['name'] }}</option>
							{% endfor %}
						</select>
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 " >Заказ доставлен клиенту</label>
					<div class="col-sm-9">
						<select name="imldelivery_StsDelivered"  class="">
							{% set selected_default = '' %}
							{% if (imldelivery_StsDelivered == false) or (imldelivery_StsDelivered == 'nostatus') %}
							{% set selected_default = ' selected="selected"' %}
							{% endif %}
							<option value="nostatus"{{ selected_default }}>{{ entity_imldelivery_orderstatus_done_default }}</option>
							{% for val in imldelivery_payment_status_values %}
							{% set selected = '' %}
							{% if (val['order_status_id'] == imldelivery_orderstatus_done) %}
							{% set selected = ' selected="selected"' %}
							{% endif %}
							<option value="{{ val['order_status_id'] }}"{{ selected }}>{{ val['name'] }}</option>
							{% endfor %}
						</select>
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3 " >Отмененный клиентом заказ</label>
					<div class="col-sm-9">
						<select name="imldelivery_StsCanceled"  class="">
							{% set selected_default = '' %}
							{% if (imldelivery_StsCanceled == false) or (imldelivery_StsCanceled == 'nostatus') %}
							{% set selected_default = ' selected="selected"' %}
							{% endif %}
							<option value="nostatus"{{ selected_default }}>{{ entity_imldelivery_orderstatus_refused_default }}</option>
							{% for val in imldelivery_payment_status_values %}
							{% set selected = '' %}
							{% if (val['order_status_id'] == imldelivery_orderstatus_refused) %}
							{% set selected = ' selected="selected"' %}
							{% endif %}
							<option value="{{ val['order_status_id'] }}"{{ selected }}>{{ val['name'] }}</option>
							{% endfor %}
						</select>
					</div>
				</div>
				
			</div>