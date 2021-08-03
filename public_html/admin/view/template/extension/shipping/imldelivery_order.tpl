<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
    <div class="pull-right">
      </div>
    <h1>IML заказ</h1>
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
    </div>
  </div>
<div class="container-fluid">
  <?php if ($error_warning): ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning ?><button type="button" class="close" data-dismiss="alert"><?php echo $times ?>;</button></div>
<?php endif; ?>
<?php if ($success): ?>
  <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i><?php echo $success ?><button type="button" class="close" data-dismiss="alert"><?php echo $times ?>;</button></div>
<?php endif; ?>  
<form action="<?php echo $action ?>" method="post" enctype="multipart/form-data" id="form-module" name="request-iml">
  <div class="container tab-content">
    <div class="form-horizontal request-iml">
      <input type="hidden" name="order_id" value="<?php echo $order_id ?>">
      <input type="hidden" name="barcode" value="<?php echo $shipping_iml_custom_field['imlBarcode'] ?>">

          <div class="form-group">
            <label class="col-sm-3" >Заказ №</label>
            <div class="col-sm-9">
              <strong><?php echo $order_id ?></strong>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3" >IML статус</label>
            <div class="col-sm-2">
              <strong><?php echo $imlStatusName ?></strong>
            </div>
            <div class="col-sm-4">
                <p class="submit">
                  <?php if($readOnly): ?>
                    <input type="button" class="btn btn-primary status-check" value="Запросить статус" />
                  <?php endif; ?>
                </p>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 " >IML штрих-код</label>
            <div class="col-sm-2">
              <strong><?php echo $shipping_iml_custom_field['imlBarcode'] ?></strong>
          </div> 
            <div class="col-sm-4">
            <?php if($readOnly): ?>
              <input type="button" class="btn btn-primary print-barcode" value="Печать штрих-кода" />
            <?php endif; ?>
            </div>           
          </div>         
      <?php if(!$readOnly): ?>
          <div class="form-group">
            <label class="col-sm-1"></label>
            <div class="col-sm-8">
                  <div style="padding: 10px; margin: 5px; border: 1px solid #CB4335; border-radius: 8px;  color: #CB4335;">
                  Внимание! При редактировании заявки необходимо пересчитать стоимость доставки с помощью соответствующей кнопки
                </div>
          </div>
          </div> 
      <?php endif; ?>            


          <div class="form-group">
            <label class="col-sm-3 "></label>
            <div class="col-sm-9 text-uppercase">
              Заявка на доставку с помощью IML
          </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 " >Услуга</label>
            <div class="col-sm-3">
              <select name="Job" id="Job" <?php echo $order_text_disabled ?>  >
                <option 
                  <?php if($shipping_iml_custom_field['shipping_method_job'] == '24КО'): ?>
                  selected
                  <?php endif; ?>
                  value="24КО">IML доставка курьером (с наложенным платежом)
                </option>
                <option 
                  <?php if($shipping_iml_custom_field['shipping_method_job'] == '24'): ?>
                  selected
                  <?php endif; ?>
                  value="24">IML доставка курьером (с предоплатой)
                </option>

                <option 
                  <?php if($shipping_iml_custom_field['shipping_method_job'] == 'С24КО'): ?>
                  selected
                  <?php endif; ?>
                  value="С24КО">IML доставка до ПВЗ (с наложенным платежом)
                </option>

                <option 
                  <?php if($shipping_iml_custom_field['shipping_method_job'] == 'С24'): ?>
                  selected
                  <?php endif; ?>
                  value="С24">IML доставка до ПВЗ (с предоплатой)
                </option>
              </select>
          </div>
              <div class="col-sm-3">
              <?php if(!$readOnly): ?>
                <input type="button" style="display: none;" class="button-primary select-pvz-on-map-hd" value="Выбрать ПВЗ на карте" />
              <?php endif; ?>            
              </div>
          </div>
          
          
          

          <div class="form-group">
            <div class="col-sm-3">
              <strong>Город отправления</strong>
            </div>
            <div class="col-sm-9">
                <select name="cityFrom" id="input-cityfrom" <?php echo $order_text_disabled ?> class="">
                  <?php foreach($imldelivery_cityfrom_values as $key => $item): ?>
                  <?php if($shipping_iml_custom_field['cityFrom'] == $key): ?>
                  <option value="<?php echo $key ?>" selected="selected"><?php echo $item['name'] ?></option>
                  <?php  else: ?>
                  <option value="<?php echo $key ?>"><?php echo $item['name'] ?></option>
                  <?php  endif; ?>
                  <?php  endforeach; ?>
                </select>
              </div>
            </div>
            
            <div id="addressTr" class="form-group">
              <div class="col-sm-3 ">
              <strong>Город получения</strong>
              </div>
              <div class="col-sm-9">
                <select name="cityTo" <?php echo $order_text_disabled ?>>
                  <?php foreach($courierCityToCollection as $key => $item): ?>
                  <?php if($shipping_iml_custom_field['cityTo'] == $item->City
                  && 
                  $shipping_iml_custom_field['regionTo'] == $item->Region):?>
                  <option value="<?php echo $item->City ?>__|__<?php echo $item->Region ?>" selected="selected">
                  <?php echo $item->City ?>&nbsp;&nbsp;&nbsp;(<?php echo $item->Region ?>)
                  </option>
                  <?php else: ?>
                  <option value="<?php echo $item->City ?>__|__<?php echo $item->Region ?>">
                  <?php echo $item->City ?>&nbsp;&nbsp;&nbsp;(<?php echo $item->Region ?>)
                  </option>
                  <?php endif; ?>
                  <?php endforeach; ?>            
                </select>
                <br>
                <div><strong>Доставка будет по адресу получателя</strong></div>
              </div>
            </div>
            
            
            <div id="selPvzTr" class="form-group">
              <div class="col-sm-3 ">
              <strong>Адрес ПВЗ получения</strong>
              </div>
              <div class="col-sm-9">
                <select name="pvzPointToID" id="" <?php echo $order_text_disabled ?> style="width: 600px;">
                  <?php 
                  foreach($deliveryPointsCollection as $key => $item): ?>
                  <!-- attribute(item, '__call', ['get', 'ID']) -->
                  <?php if ($shipping_iml_custom_field['pvzPointToID'] == $item->getID()): ?>
                  <option value="<?php echo $item->getID() ?>" selected="selected">
                  <?php echo $item->getFormAddress() ?>
                  </option>
                  <?php else: ?>
                  <option value="<?php echo $item->getID() ?>">
                  <?php echo $item->getFormAddress() ?>
                  </option>
                  <?php endif; ?>
                  <?php endforeach; ?>            
                </select>
              </div>
            </div>
    
    
            
            <div class="form-group">
              <div class="col-sm-3 ">
              <strong>Дата доставки</strong>
              </div>
              <div class="col-sm-9">
                <input <?php echo $order_text_disabled ?> type="text" name="DeliveryDate"
                value="<?php echo $shipping_iml_custom_field['shipping_method_date_delivery'] ?>"/>
              </div>
            </div>
            
            <div class="form-group">
              <div class="col-sm-3 ">
              <strong>Стоимость доставки</strong>
              </div>
              <div class="col-sm-3 ">
                <input <?php echo $order_text_disabled ?> type="text" name="DeliveryCost"
                value="<?php echo $shipping_iml_custom_field['shipping_method_cost'] ?>" onkeypress="filterDigits(event, true)"/>&nbsp;₽
              </div>
                <?php if(!$readOnly): ?>
                <div class="col-sm-3 ">
                  <input type="button"  class="button-primary recalc-delivery-cost" value="Рассчитать стоимость доставки" />
                </div>
                <?php endif; ?>
            </div>
    
            <div class="form-group">
              <label class="col-sm-3 " >Включать услугу "Доставка" в чек покупателю</label>
              <div class="col-sm-3">
                <input type="checkbox" <?php echo $order_text_disabled ?> name="isIncludedDeliveryCost" 
                <?php echo $shipping_iml_custom_field['isIncludedDeliveryCost'] ? 'checked="checked"' : '' ?>/>   
              </div>
            </div>
    
    
            
            <div class="form-group">
              <div class="col-sm-3 ">
              <strong>Сумма заказа</strong>
              </div>
              <div class="col-sm-9">
                <input readonly="readonly" type="text" name="Amount"
                value="<?php echo $shipping_iml_custom_field['Amount'] ?>"/>
                &nbsp;₽
              </div>
            </div>
            
            <div class="form-group">
              <div class="col-sm-3 ">
              <strong>Оценочная стоимость заказа</strong>
              </div>
              <div class="col-sm-9">
                <input <?php echo $order_text_disabled ?> type="text" name="ValuatedAmount"
                value="<?php echo $shipping_iml_custom_field['ValuatedAmount'] ?>" onkeypress="filterDigits(event, true)"/>
                &nbsp;₽
              </div>
            </div>
            
            <div class="form-group">
              <div class="col-sm-3 ">
              <strong>Комментарий</strong>
              </div>
              <div class="col-sm-9"><textarea <?php echo $order_text_disabled ?> name='comment'>
                <?php echo $order['comment'] ?>
              </textarea></div>
            </div>
    
            <div class="form-group">
              <div class="col-sm-3 "></div>
              <div class="col-sm-9 text-uppercase">Получатель</div>
            </div>
    
    
            <div class="form-group">
              <div class="col-sm-3 ">
              <strong>
                Контактное лицо
              </strong>
              </div>
              <div class="col-sm-3">
                <input style="margin-right: 10px;" type="text" placeholder="Имя" name="firstname" <?php echo $order_text_disabled ?> 
                value="<?php echo $order['firstname'] ?>">
              </div>
              <div class="col-sm-3">
                <input type="text" placeholder="Фамилия" name="lastname" <?php echo $order_text_disabled ?> 
                value="<?php echo $order['lastname'] ?>">
              </div>                   
            </div>
    
            <div class="form-group">
              <div class="col-sm-3 ">
              <strong>
              Телефон  
              </strong>
              </div>
              <div class="col-sm-9"><input <?php echo $order_text_disabled ?> name='telephone'  type="text" 
                value="<?php echo $order['telephone'] ?>"/></div>
            </div>
    
            <div class="form-group">
              <div class="col-sm-3 ">
              <strong>
              Email  
              </strong>
              </div>
              <div class="col-sm-9"><input <?php echo $order_text_disabled ?> name='email'  
                type="text" value="<?php echo $order['email'] ?>"/></div>
            </div>
    
            <div class="form-group">
              <div class="col-sm-3 ">
                <strong>
                  Адрес
                </strong>
              </div>
              <div class="col-sm-9">
                <textarea name="shipping_address_1" <?php echo $order_text_disabled ?>>
                  <?php echo $order['shipping_address_1'] ?></textarea>
              </div>
            </div>
    
    
            <div class="form-group">
              <div class="col-sm-3 "></div>
              <div class="col-sm-9 text-uppercase">Прочее</div>
            </div>
    
    
            <div class="form-group">
              <div class="col-sm-3 ">
              <strong>
              НДС  
              </strong>
              </div>
              <div class="col-sm-9">
              <select <?php echo $order_text_disabled ?> name="VATRate" id="input-cityfrom" class="">
                <?php foreach($imldelivery_vatvariants as $item): ?>
                    <option value="<?php echo $item->productNo ?>" 
                    <?php if( $shipping_iml_custom_field['VATRate'] == $item->productNo):  ?>
                    selected="selected"
                    <?php endif; ?> ><?php echo $item->description ?></option>
                  <?php endforeach; ?>      
              </select> 
              </div>
            </div>
            
            
            
            <div class="form-group">
              <div class="col-sm-3 ">
              <strong>
              Грузовые места
              </strong>
              </div>
              <div class="col-sm-9">
                <div id="placesApp">
                  <div v-if="readOnly == 0"><a v-bind:style="{ cursor: linksCursor}"
                    v-on:click.stop.prevent="addNewPlace()">Добавить место</a></div>
                  <div>
                    <table class="placesTable">
                        <th>Место №</th>
                        <th>Вес, кг</th>
                        <th>Длина, см</th>
                        <th>Ширина, см</th>
                        <th>Высота, см</th>
                        <th></th>
                      <tr v-for="(placeItem,index) in placesAr">
                        <td>{{ ++index }}</td>
                        <td><input v-on:keypress="filterNCalcWeight($event, true)" :disabled="readOnly == 1" type="text" :name="'place['+index+'][Weight]'"  v-model="placeItem.Weight"></td>
                        <td><input v-on:keypress="filterDigits($event, false)" :disabled="readOnly == 1" type="text" :name="'place['+index+'][Length]'"  v-model="placeItem.Length"></td>
                        <td><input v-on:keypress="filterDigits($event, false)" :disabled="readOnly == 1" type="text" :name="'place['+index+'][Width]'"  v-model="placeItem.Width"></td>
                        <td><input v-on:keypress="filterDigits($event, false)" :disabled="readOnly == 1" type="text" :name="'place['+index+'][Height]'"  v-model="placeItem.Height"></td>
                        <td>
                          <a v-bind:style="{ cursor: linksCursor}" v-if="placesAr.length > 1 && readOnly == 0" v-on:click.stop.prevent="removePlace(index)">Удалить</a>
                        </td>
                    </table>
                    </div>
                  </div>
                </div>           
              </div>
                <div class="form-group">
                <div class="col-sm-3"><strong>Включить комплектацию заказа</strong></div>
                <div class="col-sm-9">
                  <input  <?php echo $order_text_disabled ?> type="checkbox" 
                  <?php if($shipping_iml_custom_field['enableFullfilment'] == true): ?>
                  checked
                  <?php endif; ?>
                  name="enableFullfilment" />
                </div>
                </div>
                
                <?php include DIR_APPLICATION . '/view/template/extension/shipping/imldelivery_parts/conditions.tpl'; ?>
                
    
    
                <div class="form-group">
                <div class="col-sm-3"></div>
                <div class="col-sm-9">
    
                    <p class="submit">
                      <?php if($readOnly): ?>
                      <?php else: ?>
                        <input type="submit" class="btn btn-primary create-order" value="Отправить заказ" />
                      <?php endif; ?>
                    </p>
                </div>
                </div>
                
                
              </div>
            </div>
          </form>
        </div>
    </div>
    
    
    <?php include DIR_APPLICATION . '/view/template/extension/shipping/imldelivery_preloader.tpl'; ?>
    <?php include DIR_APPLICATION . '/view/template/extension/shipping/imldelivery_modal.tpl'; ?>
    
 
  

<script>
console.log('<?php echo $volumeAr ?>');
var volumeAr = JSON.parse('<?php echo $volumeAr ?>'); 
var ajaxToken = '<?php echo $token ?>';
var readOnly = false;
var HTTPS_SERVER = '<?php echo $HTTPS_SERVER ?>';

<?php if($readOnly): ?>
  var readOnly = true;
<?php endif; ?>  

</script>

<?php foreach($styles as $style): ?>
<link href="<?php echo $style['href'] ?>" type="text/css" rel="<?php echo $style['rel'] ?>" media="<?php echo $style['media'] ?>" />
<?php endforeach; ?>

<?php foreach($scripts as $script): ?>
<script src="<?php echo $script ?>" type="text/javascript"></script>
<?php endforeach;?>
  
  
<?php echo $footer; ?> 






    

