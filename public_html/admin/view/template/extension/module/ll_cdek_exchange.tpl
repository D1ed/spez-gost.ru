<?php 
/**
 * @author    p0v1n0m <support@lutylab.ru>
 * @license   Commercial
 * @link      https://lutylab.ru
 */
?>
<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a onclick="$('#form').submit();" class="btn btn-success"><i class="fa fa-save"></i> <?php echo $button_save; ?></a>
        <a href="<?php echo $shipping; ?>" data-toggle="tooltip" title="<?php echo $button_shipping; ?>" class="btn btn-default"><i class="fa fa-truck"></i></a>
        <a href="<?php echo $exchange; ?>" data-toggle="tooltip" title="<?php echo $button_exchange; ?>" class="btn btn-default"><i class="fa fa-exchange"></i></a>
        <a href="<?php echo $order; ?>" data-toggle="tooltip" title="<?php echo $button_order; ?>" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if (${$m . '_license'}) { ?>
    <div class="panel panel-primary">
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-log" data-toggle="tab"><i class="fa fa-bars"></i> <?php echo $tab_log; ?></a></li>
            <li><a href="#tab-api" data-toggle="tab"><i class="fa fa-terminal"></i> <?php echo $tab_api; ?></a></li>
            <li><a href="#tab-setting" data-toggle="tab"><i class="fa fa-cog"></i> <?php echo $tab_setting; ?></a></li>
            <li><a href="#tab-file" data-toggle="tab"><i class="fa fa-files-o"></i> <?php echo $tab_file; ?></a></li>
            <li><a href="#tab-preset" data-toggle="tab"><i class="fa fa-toggle-on"></i> <?php echo $tab_preset; ?></a></li>
            <li><a href="#tab-merge" data-toggle="tab"><i class="fa fa-compress"></i> <?php echo $tab_merge; ?></a></li>
            <li><a href="#tab-tracking" data-toggle="tab"><i class="fa fa-retweet"></i> <?php echo $tab_tracking; ?></a></li>
            <li><a href="#tab-alert" data-toggle="tab"><i class="fa fa-bell"></i> <?php echo $tab_alert; ?></a></li>
            <li><a href="#tab-cron" data-toggle="tab"><i class="fa fa-magic"></i> <?php echo $tab_cron; ?></a></li>
            <li><a href="#tab-sms" data-toggle="tab"><i class="fa fa-commenting"></i> <?php echo $tab_sms; ?></a></li>
            <li><a href="#tab-support" data-toggle="tab"><i class="fa fa-life-ring"></i> <?php echo $tab_support; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-log">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_logging; ?></label>
                <div class="col-sm-10">
                  <div class="btn-group" data-toggle="buttons">
                    <?php if (${$m . '_logging'}) { ?>
                    <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_logging" value="0" autocomplete="off"><?php echo $text_disabled; ?></label>
                    <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_logging" value="1" autocomplete="off" checked="checked"><?php echo $text_enabled; ?></label>
                    <?php } else { ?>
                    <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_logging" value="0" autocomplete="off" checked="checked"><?php echo $text_disabled; ?></label>
                    <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_logging" value="1" autocomplete="off"><?php echo $text_enabled; ?></label>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group" id="log-container">
                <div class="col-sm-12">
                  <div class="btn-group btn-group-justified btn-group-sm" role="group">
                    <a onclick="logLoad();" class="btn btn-success" id="log-load"><i class="fa fa-refresh"></i> <?php echo $button_load; ?></a>
                    <a onclick="logDownload();" class="btn btn-primary" id="log-download"><i class="fa fa-download"></i> <?php echo $button_download; ?></a>
                    <a onclick="logClear();" class="btn btn-danger" id="log-clear"><i class="fa fa-eraser"></i> <?php echo $button_clear; ?></a>
                  </div>
                </div>
                <div class="col-sm-12">
                  <textarea wrap="off" readonly class="form-control" id="log"><?php echo $help_log; ?></textarea>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-api">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_api_login; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_api_login" value="<?php echo ${$m . '_api_login'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_api_key; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_api_key" value="<?php echo ${$m . '_api_key'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_test; ?></label>
                <div class="col-sm-10">
                  <div class="btn-group" data-toggle="buttons">
                    <?php if (${$m . '_test'}) { ?>
                    <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_test" value="0" autocomplete="off"><?php echo $text_disabled; ?></label>
                    <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_test" value="1" autocomplete="off" checked="checked"><?php echo $text_enabled; ?></label>
                    <?php } else { ?>
                    <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_test" value="0" autocomplete="off" checked="checked"><?php echo $text_disabled; ?></label>
                    <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_test" value="1" autocomplete="off"><?php echo $text_enabled; ?></label>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_timeout; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_timeout" value="<?php echo ${$m . '_timeout'}; ?>" class="form-control" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-setting">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_timezone; ?></label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_timezone" class="form-control">
                    <?php foreach ($timezones as $timezone) { ?>
                    <option value="<?php echo $timezone; ?>" <?php if ($timezone == ${$m . '_timezone'}) { ?>selected="selected"<?php } ?>><?php echo $timezone; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_currency; ?></label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_currency" class="form-control">
                    <?php foreach ($currencies as $currency) { ?>
                    <option value="<?php echo $currency['code']; ?>" <?php if ($currency['code'] == ${$m . '_currency'}) { ?>selected="selected"<?php } ?>><?php echo $currency['title']; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_cod; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto; margin: 0;">
                    <?php if (!empty($payments)) { ?>
                    <?php foreach ($payments as $payment) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="<?php echo $m; ?>_cod[]" value="<?php echo $payment['code']; ?>" <?php if (in_array($payment['code'], ${$m . '_cod'})) { ?>checked="checked"<?php } ?> />
                        <?php echo $payment['name']; ?>
                      </label>
                    </div>
                    <?php } ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_service_count; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_service_count" value="<?php echo ${$m . '_service_count'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_list_order_status; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto; margin: 0;">
                    <?php foreach ($order_statuses as $order_status) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="<?php echo $m; ?>_list_order_status[]" value="<?php echo $order_status['order_status_id']; ?>" <?php if (in_array($order_status['order_status_id'], ${$m . '_list_order_status'})) { ?>checked="checked"<?php } ?> />
                        <?php echo $order_status['name']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-file">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_invoice_count; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_invoice_count" value="<?php echo ${$m . '_invoice_count'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_sticker_count; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_sticker_count" value="<?php echo ${$m . '_sticker_count'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_sticker_format; ?></label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_sticker_format" class="form-control">
                    <option value="A4" <?php if (${$m . '_sticker_format'} == 'A4') { ?>selected="selected"<?php } ?>>A4</option>
                    <option value="A5" <?php if (${$m . '_sticker_format'} == 'A5') { ?>selected="selected"<?php } ?>>A5</option>
                    <option value="A6" <?php if (${$m . '_sticker_format'} == 'A6') { ?>selected="selected"<?php } ?>>A6</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_files; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto; margin: 0;">
                    <?php foreach ($files as $type => $name) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="<?php echo $m; ?>_files[]" value="<?php echo $type; ?>" <?php if (in_array($type, ${$m . '_files'})) { ?>checked="checked"<?php } ?> <?php if ($type == 'torg' && !$ll_invoice) { ?>disabled<?php } ?> />
                        <?php echo $name; ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_files_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_files_email" value="<?php echo ${$m . '_files_email'}; ?>" class="form-control" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-preset">
              <div class="form-group">
                <label class="col-sm-2 control-label">Номер заказа</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_order_number" value="<?php echo ${$m . '_default_order_number'}; ?>" class="form-control" />
                  <small class="form-text text-muted">Обязательно должен содержать переменную <code>{{order_id}}</code>, передающую идентификатор заказа в магазине.</small>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Комментарий</label>
                <div class="col-sm-10">
                  <textarea type="text" name="<?php echo $m; ?>_default_order_comment" class="form-control"><?php echo ${$m . '_default_order_comment'}; ?></textarea>
                  <small class="form-text text-muted">Чтобы загружать значение из соответствующего поля заказа, необходимо добавить переменную <code>{{comment}}</code>.</small>
                </div>
              </div>
              <legend>Реквизиты истинного продавца</legend>
              <div class="form-group">
                <label class="col-sm-2 control-label">Адрес</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_seller_address" value="<?php echo ${$m . '_default_seller_address'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Наименование</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_seller_name" value="<?php echo ${$m . '_default_seller_name'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">ИНН</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_seller_inn" value="<?php echo ${$m . '_default_seller_inn'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Телефон</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_seller_phone" value="<?php echo ${$m . '_default_seller_phone'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Форма собственности</label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_default_seller_form" class="form-control">
                    <option value=""></option>
                    <?php foreach ($ownership_forms as $id => $title) { ?>
                    <option value="<?php echo $id; ?>" <?php if ($id == ${$m . '_default_seller_form'}) { ?>selected="selected"<?php } ?>><?php echo $title; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <legend>Если отправитель не клиент СДЭК</legend>
              <div class="form-group">
                <label class="col-sm-2 control-label">Наименование компании</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_sender_company" value="<?php echo ${$m . '_default_sender_company'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Контактное лицо</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_sender_name" value="<?php echo ${$m . '_default_sender_name'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Улица</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_sender_street" value="<?php echo ${$m . '_default_sender_street'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Дом</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_sender_house" value="<?php echo ${$m . '_default_sender_house'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Квартира/офис</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_sender_flat" value="<?php echo ${$m . '_default_sender_flat'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Телефон</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_sender_phone" value="<?php echo ${$m . '_default_sender_phone'}; ?>" class="form-control" />
                </div>
              </div>
              <legend>Данные для международного заказа</legend>
              <div class="form-group">
                <label class="col-sm-2 control-label">Грузоотправитель</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_shipper_name" value="<?php echo ${$m . '_default_shipper_name'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Адрес грузоотправителя</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_shipper_address" value="<?php echo ${$m . '_default_shipper_address'}; ?>" class="form-control" />
                </div>
              </div>
              <legend>Получатель</legend>
              <div class="form-group">
                <label class="col-sm-2 control-label">Фамилия</label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_default_recipient_f" class="form-control">
                    <?php foreach ($lastname_fields as $field) { ?>
                    <option value="<?php echo $field; ?>" <?php if ($field == ${$m . '_default_recipient_f'}) { ?>selected="selected"<?php } ?>><?php echo $field; ?></option>
                    <?php } ?>
                  </select>
                  <small class="form-text text-muted">Название поля в стандартной таблице заказов <strong>order</strong>.</small>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Имя</label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_default_recipient_i" class="form-control">
                    <?php foreach ($firstname_fields as $field) { ?>
                    <option value="<?php echo $field; ?>" <?php if ($field == ${$m . '_default_recipient_i'}) { ?>selected="selected"<?php } ?>><?php echo $field; ?></option>
                    <?php } ?>
                  </select>
                  <small class="form-text text-muted">Название поля в стандартной таблице заказов <strong>order</strong>.</small>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Улица</label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_default_address_street" class="form-control">
                    <?php foreach ($address_fields as $field) { ?>
                    <option value="<?php echo $field; ?>" <?php if ($field == ${$m . '_default_address_street'}) { ?>selected="selected"<?php } ?>><?php echo $field; ?></option>
                    <?php } ?>
                  </select>
                  <small class="form-text text-muted">Название поля в стандартной таблице заказов <strong>order</strong>.</small>
                </div>
              </div>
              <legend>Товары</legend>
              <div class="form-group">
                <label class="col-sm-2 control-label">Артикул</label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_default_product_article" class="form-control">
                    <option value="model" <?php if ('model' == ${$m . '_default_product_article'}) { ?>selected="selected"<?php } ?>>model</option>
                    <option value="sku" <?php if ('sku' == ${$m . '_default_product_article'}) { ?>selected="selected"<?php } ?>>sku</option>
                    <option value="upc" <?php if ('upc' == ${$m . '_default_product_article'}) { ?>selected="selected"<?php } ?>>upc</option>
                    <option value="ean" <?php if ('ean' == ${$m . '_default_product_article'}) { ?>selected="selected"<?php } ?>>ean</option>
                    <option value="jan" <?php if ('jan' == ${$m . '_default_product_article'}) { ?>selected="selected"<?php } ?>>jan</option>
                    <option value="isbn" <?php if ('isbn' == ${$m . '_default_product_article'}) { ?>selected="selected"<?php } ?>>isbn</option>
                    <option value="mpn" <?php if ('mpn' == ${$m . '_default_product_article'}) { ?>selected="selected"<?php } ?>>mpn</option>
                    <option value="location" <?php if ('location' == ${$m . '_default_product_article'}) { ?>selected="selected"<?php } ?>>location</option>
                    <option value="product_id" <?php if ('product_id' == ${$m . '_default_product_article'}) { ?>selected="selected"<?php } ?>>product_id</option>
                  </select>
                  <small class="form-text text-muted">Название поля в стандартной таблице заказов <strong>product</strong>.</small>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Упаковка</label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_default_product_pack" class="form-control">
                    <option value="0" <?php if (0 == ${$m . '_default_product_pack'}) { ?>selected="selected"<?php } ?>>Нет</option>
                    <option value="1" <?php if (1 == ${$m . '_default_product_pack'}) { ?>selected="selected"<?php } ?>>Да</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Вес упаковки</label>
                <div class="col-sm-10">
                  <div class="input-group">
                    <input type="text" name="<?php echo $m; ?>_default_product_pack_weight" value="<?php echo ${$m . '_default_product_pack_weight'}; ?>" class="form-control" />
                    <div class="input-group-addon">г</div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Ставка НДС товара</label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_default_product_vat_rate" class="form-control">
                    <?php foreach ($vats as $id => $title) { ?>
                    <option value="<?php echo $id; ?>" <?php if ($id == ${$m . '_default_product_vat_rate'}) { ?>selected="selected"<?php } ?>><?php echo $title; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_merge_cost; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_merge_cost" value="<?php echo ${$m . '_merge_cost'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_merge_cost_type; ?></label>
                <div class="col-sm-10">
                  <div class="btn-group" data-toggle="buttons">
                    <?php if (${$m . '_merge_cost_type'}) { ?>
                    <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_merge_cost_type" value="0" autocomplete="off"><?php echo $text_disabled; ?></label>
                    <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_merge_cost_type" value="1" autocomplete="off" checked="checked"><?php echo $text_enabled; ?></label>
                    <?php } else { ?>
                    <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_merge_cost_type" value="0" autocomplete="off" checked="checked"><?php echo $text_disabled; ?></label>
                    <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_merge_cost_type" value="1" autocomplete="off"><?php echo $text_enabled; ?></label>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <legend>Вызов курьера</legend>
              <div class="form-group">
                <label class="col-sm-2 control-label">Дата ожидания курьера</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_courier_date" value="<?php echo ${$m . '_default_courier_date'}; ?>" class="form-control" />
                  <small class="form-text text-muted">Количество дней, которые необходимо добавить к дате создания заявки.</small>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Время ожидания курьера</label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <div class="input-group-addon">с</div>
                        <input type="text" name="<?php echo $m; ?>_default_courier_time_beg" value="<?php echo ${$m . '_default_courier_time_beg'}; ?>" class="form-control" />
                        <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <div class="input-group-addon">до</div>
                        <input type="text" name="<?php echo $m; ?>_default_courier_time_end" value="<?php echo ${$m . '_default_courier_time_end'}; ?>" class="form-control" />
                        <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Время обеда</label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <div class="input-group-addon">с</div>
                        <input type="text" name="<?php echo $m; ?>_default_courier_lunch_beg" value="<?php echo ${$m . '_default_courier_lunch_beg'}; ?>" class="form-control" />
                        <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <div class="input-group-addon">до</div>
                        <input type="text" name="<?php echo $m; ?>_default_courier_lunch_end" value="<?php echo ${$m . '_default_courier_lunch_end'}; ?>" class="form-control" />
                        <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                      </div>
                    </div>
                  </div>
                  <small class="form-text text-muted">Заполнять только если входит во временной диапазон времени ожидания курьера.</small>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Улица отправителя</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_courier_street" value="<?php echo ${$m . '_default_courier_street'}; ?>" class="form-control" maxlength="50" />
                  <small class="form-text text-muted">На один адрес может быть не более одного вызова курьера в день. Не надо указывать префиксы значений, вроде «ул.».</small>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Дом, корпус, строение отправителя</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_courier_house" value="<?php echo ${$m . '_default_courier_house'}; ?>" class="form-control" maxlength="30" />
                  <small class="form-text text-muted">Не надо указывать префиксы значений, вроде «дом».</small>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Квартира/офис отправителя</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_courier_flat" value="<?php echo ${$m . '_default_courier_flat'}; ?>" class="form-control" maxlength="10" />
                  <small class="form-text text-muted">Не надо указывать префиксы значений, вроде «кв.».</small>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">ФИО отправителя</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_courier_sender_name" value="<?php echo ${$m . '_default_courier_sender_name'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Телефон отправителя</label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_default_courier_send_phone" value="<?php echo ${$m . '_default_courier_send_phone'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Комментарий</label>
                <div class="col-sm-10">
                  <textarea type="text" name="<?php echo $m; ?>_default_courier_comment" class="form-control"><?php echo ${$m . '_default_courier_comment'}; ?></textarea>
                  <small class="form-text text-muted">Описание груза.</small>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-12">
                  <table id="services" class="table table-striped table-bordered table-hover">
                    <thead>
                      <tr>
                        <td class="text-left">Тарифы СДЭК</td>
                        <td class="text-left">Доп. услуги</td>
                        <td></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php $service_row = 0; ?>
                      <?php foreach (${$m . '_default_services'} as $default_service) { ?>
                        <tr id="service-row-<?php echo $service_row; ?>">
                          <td class="text-left">
                            <div class="well well-sm" style="height: 150px; overflow: auto; margin: 0;">
                              <?php foreach ($variants as $variant) { ?>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="<?php echo $m; ?>_default_services[<?php echo $service_row; ?>][variants][]" value="<?php echo $variant['code']; ?>" <?php if (in_array($variant['code'], $default_service['variants'])) { ?>checked="checked"<?php } ?> />
                                  <?php echo $variant['name']; ?>
                                </label>
                              </div>
                              <?php } ?>
                            </div>
                          </td>
                          <td class="text-left">
                            <div class="well well-sm" style="height: 150px; overflow: auto; margin: 0;">
                              <?php foreach ($services as $service) { ?>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="<?php echo $m; ?>_default_services[<?php echo $service_row; ?>][services][]" value="<?php echo $service['code']; ?>" <?php if (in_array($service['code'], $default_service['services'])) { ?>checked="checked"<?php } ?> />
                                  <?php echo $service['name']; ?>
                                </label>
                              </div>
                              <?php } ?>
                            </div>
                          </td>
                          <td class="text-right">
                            <button type="button" onclick="$('#service-row-<?php echo $service_row; ?>').remove();" class="btn btn-danger btn-sm"><i class="fa fa-minus-circle"></i></button>
                          </td>
                        </tr>
                        <?php $service_row++; ?>
                      <?php } ?>
                    </tbody>
                    <tfoot>
                      <tr>
                        <td colspan="3">
                          <button type="button" onclick="addService(<?php echo $service_row; ?>);" class="btn btn-success btn-block btn-sm"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
                        </td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-merge">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_merge; ?></label>
                <div class="col-sm-10">
                  <div class="btn-group" data-toggle="buttons">
                    <?php if (${$m . '_merge'}) { ?>
                    <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_merge" value="0" autocomplete="off"><?php echo $text_disabled; ?></label>
                    <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_merge" value="1" autocomplete="off" checked="checked"><?php echo $text_enabled; ?></label>
                    <?php } else { ?>
                    <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_merge" value="0" autocomplete="off" checked="checked"><?php echo $text_disabled; ?></label>
                    <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_merge" value="1" autocomplete="off"><?php echo $text_enabled; ?></label>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_merge_name; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_merge_name" value="<?php echo ${$m . '_merge_name'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_merge_model; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_merge_model" value="<?php echo ${$m . '_merge_model'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_merge_link; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_merge_link" value="<?php echo ${$m . '_merge_link'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_merge_vat; ?></label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_merge_vat" class="form-control">
                    <?php foreach ($vats as $id => $title) { ?>
                    <option value="<?php echo $id; ?>" <?php if ($id == ${$m . '_merge_vat'}) { ?>selected="selected"<?php } ?>><?php echo $title; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_merge_from_model; ?></label>
                <div class="col-sm-10">
                  <div class="btn-group" data-toggle="buttons">
                    <?php if (${$m . '_merge_from_model'}) { ?>
                    <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_merge_from_model" value="0" autocomplete="off"><?php echo $text_disabled; ?></label>
                    <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_merge_from_model" value="1" autocomplete="off" checked="checked"><?php echo $text_enabled; ?></label>
                    <?php } else { ?>
                    <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_merge_from_model" value="0" autocomplete="off" checked="checked"><?php echo $text_disabled; ?></label>
                    <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_merge_from_model" value="1" autocomplete="off"><?php echo $text_enabled; ?></label>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-tracking">
              <div class="form-group">
                <div class="col-sm-12">
                  <table id="trackings" class="table table-striped table-bordered table-hover">
                    <thead>
                      <tr>
                        <td class="text-left"><?php echo $column_status; ?></td>
                        <td class="text-left"><?php echo $column_order_status; ?></td>
                        <td class="text-left"><?php echo $column_notify; ?></td>
                        <td></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php $tracking_row = 0; ?>
                      <?php foreach (${$m . '_trackings'} as $tracking) { ?>
                        <tr id="tracking-row-<?php echo $tracking_row; ?>">
                          <td class="text-left">
                            <select name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][shipping_status]" class="form-control">
                              <?php foreach ($statuses as $id => $status) { ?>
                                <option value="<?php echo $id; ?>" <?php if ($tracking['shipping_status'] == $id) { ?>selected="selected"<?php } ?>><?php echo $status['title']; ?></option>
                              <?php } ?>
                            </select>
                          </td>
                          <td class="text-left">
                            <select name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][order_status]" class="form-control">
                              <?php foreach ($order_statuses as $order_status) { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>" <?php if ($tracking['order_status'] == $order_status['order_status_id']) { ?>selected="selected"<?php } ?>><?php echo $order_status['name']; ?></option>
                              <?php } ?>
                            </select>
                          </td>
                          <td class="text-left">
                            <table class="table" style="background: transparent;">
                              <tr>
                                <td style="border: none;">
                                  <div class="form-group">
                                    <label class="col-sm-6 control-label"><?php echo $text_notify; ?></label>
                                    <div class="col-sm-6">
                                      <div class="btn-group" data-toggle="buttons">
                                        <?php if ($tracking['notify']) { ?>
                                        <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify]" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                                        <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify]" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
                                        <?php } else { ?>
                                        <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify]" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                                        <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify]" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
                                        <?php } ?>
                                      </div>
                                    </div>
                                  </div>
                                </td>
                                <td style="border: none;">
                                  <?php foreach ($languages as $language) { ?>
                                    <div class="input-group pull-left">
                                      <span class="input-group-addon">
                                        <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                      </span>
                                      <textarea name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][comment][<?php echo $language['language_id']; ?>]" class="form-control" rows="3"><?php echo $tracking['comment'][$language['language_id']]; ?></textarea>
                                    </div>
                                  <?php } ?>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <div class="form-group">
                                    <label class="col-sm-6 control-label"><?php echo $text_notify_email; ?></label>
                                    <div class="col-sm-6">
                                      <div class="btn-group" data-toggle="buttons">
                                        <?php if ($tracking['notify_email']) { ?>
                                        <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify_email]" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                                        <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify_email]" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
                                        <?php } else { ?>
                                        <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify_email]" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                                        <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify_email]" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
                                        <?php } ?>
                                      </div>
                                    </div>
                                  </div>
                                </td>
                                <td>
                                  <?php foreach ($languages as $language) { ?>
                                    <div class="input-group pull-left">
                                      <span class="input-group-addon">
                                        <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                      </span>
                                      <textarea name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][email][<?php echo $language['language_id']; ?>]" class="form-control" rows="3"><?php echo $tracking['email'][$language['language_id']]; ?></textarea>
                                    </div>
                                  <?php } ?>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <div class="form-group">
                                    <label class="col-sm-6 control-label"><?php echo $text_notify_sms; ?></label>
                                    <div class="col-sm-6">
                                      <div class="btn-group" data-toggle="buttons">
                                        <?php if ($tracking['notify_sms']) { ?>
                                        <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify_sms]" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                                        <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify_sms]" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
                                        <?php } else { ?>
                                        <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify_sms]" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                                        <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][notify_sms]" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
                                        <?php } ?>
                                      </div>
                                    </div>
                                  </div>
                                </td>
                                <td>
                                  <?php foreach ($languages as $language) { ?>
                                    <div class="input-group pull-left">
                                      <span class="input-group-addon">
                                        <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                      </span>
                                      <textarea name="<?php echo $m; ?>_trackings[<?php echo $tracking_row; ?>][sms][<?php echo $language['language_id']; ?>]" class="form-control" rows="3"><?php echo $tracking['sms'][$language['language_id']]; ?></textarea>
                                    </div>
                                  <?php } ?>
                                </td>
                              </tr>
                            </table>
                          </td>
                          <td class="text-right">
                            <button type="button" onclick="$('#tracking-row-<?php echo $tracking_row; ?>').remove();" class="btn btn-danger btn-sm"><i class="fa fa-minus-circle"></i></button>
                          </td>
                        </tr>
                        <?php $tracking_row++; ?>
                      <?php } ?>
                    </tbody>
                    <tfoot>
                      <tr>
                        <td colspan="4">
                          <button type="button" onclick="addTracking(<?php echo $tracking_row; ?>);" class="btn btn-success btn-block btn-sm"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
                        </td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-alert">
              <div class="form-group">
                <div class="col-sm-12">
                  <table id="alerts" class="table table-striped table-bordered table-hover">
                    <thead>
                      <tr>
                        <td class="text-left"><?php echo $column_start; ?></td>
                        <td class="text-left"><?php echo $column_delay; ?></td>
                        <td class="text-left"><?php echo $column_stop; ?></td>
                        <td class="text-left"><?php echo $column_notify; ?></td>
                        <td></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php $alert_row = 0; ?>
                      <?php foreach (${$m . '_alerts'} as $alert) { ?>
                        <tr id="alert-row-<?php echo $alert_row; ?>">
                          <td class="text-left">
                            <select name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][start_status]" class="form-control">
                              <?php foreach ($statuses as $id => $status) { ?>
                                <?php if (!in_array($id, ['-1', '0', '999'])) { ?>
                                <option value="<?php echo $id; ?>" <?php if ($alert['start_status'] == $id) { ?>selected="selected"<?php } ?>><?php echo $status['title']; ?></option>
                                <?php } ?>
                              <?php } ?>
                            </select>
                          </td>
                          <td class="text-left">
                            <input type="text" name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][delay]" class="form-control" value="<?php echo $alert['delay']; ?>" />
                          </td>
                          <td class="text-left">
                            <div class="well well-sm" style="height: 300px; overflow: auto; margin: 0;">
                              <?php foreach ($statuses as $id => $status) { ?>
                              <?php if (!in_array($id, ['-1', '0', '999'])) { ?>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][stop_status][]" value="<?php echo $id; ?>" <?php if (isset($alert['stop_status']) && in_array($id, $alert['stop_status'])) { ?>checked="checked"<?php } ?> />
                                  <?php echo $status['title']; ?>
                                </label>
                              </div>
                              <?php } ?>
                              <?php } ?>
                            </div>
                          </td>
                          <td class="text-left">
                            <table class="table" style="background: transparent;">
                              <tr>
                                <td style="border: none;">
                                  <div class="form-group">
                                    <label class="col-sm-6 control-label"><?php echo $text_notify_email; ?></label>
                                    <div class="col-sm-6">
                                      <div class="btn-group" data-toggle="buttons">
                                        <?php if ($alert['notify_email']) { ?>
                                        <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][notify_email]" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                                        <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][notify_email]" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
                                        <?php } else { ?>
                                        <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][notify_email]" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                                        <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][notify_email]" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
                                        <?php } ?>
                                      </div>
                                    </div>
                                  </div>
                                </td>
                                <td style="border: none;">
                                  <?php foreach ($languages as $language) { ?>
                                    <div class="input-group pull-left">
                                      <span class="input-group-addon">
                                        <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                      </span>
                                      <textarea name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][email][<?php echo $language['language_id']; ?>]" class="form-control" rows="3"><?php echo $alert['email'][$language['language_id']]; ?></textarea>
                                    </div>
                                  <?php } ?>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <div class="form-group">
                                    <label class="col-sm-6 control-label"><?php echo $text_notify_sms; ?></label>
                                    <div class="col-sm-6">
                                      <div class="btn-group" data-toggle="buttons">
                                        <?php if ($alert['notify_sms']) { ?>
                                        <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][notify_sms]" value="0" autocomplete="off"><?php echo $text_no; ?></label>
                                        <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][notify_sms]" value="1" autocomplete="off" checked="checked"><?php echo $text_yes; ?></label>
                                        <?php } else { ?>
                                        <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][notify_sms]" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>
                                        <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][notify_sms]" value="1" autocomplete="off"><?php echo $text_yes; ?></label>
                                        <?php } ?>
                                      </div>
                                    </div>
                                  </div>
                                </td>
                                <td>
                                  <?php foreach ($languages as $language) { ?>
                                    <div class="input-group pull-left">
                                      <span class="input-group-addon">
                                        <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                      </span>
                                      <textarea name="<?php echo $m; ?>_alerts[<?php echo $alert_row; ?>][sms][<?php echo $language['language_id']; ?>]" class="form-control" rows="3"><?php echo $alert['sms'][$language['language_id']]; ?></textarea>
                                    </div>
                                  <?php } ?>
                                </td>
                              </tr>
                            </table>
                          </td>
                          <td class="text-right">
                            <button type="button" onclick="$('#alert-row-<?php echo $alert_row; ?>').remove();" class="btn btn-danger btn-sm"><i class="fa fa-minus-circle"></i></button>
                          </td>
                        </tr>
                        <?php $alert_row++; ?>
                      <?php } ?>
                    </tbody>
                    <tfoot>
                      <tr>
                        <td colspan="5">
                          <button type="button" onclick="addAlert(<?php echo $alert_row; ?>);" class="btn btn-success btn-block btn-sm"><i class="fa fa-plus-circle"></i> <?php echo $button_add; ?></button>
                        </td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-cron">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_cron_key; ?></label>
                <div class="col-sm-10">
                  <div class="input-group">
                    <input type="text" name="<?php echo $m; ?>_cron_key" value="<?php echo ${$m . '_cron_key'}; ?>" class="form-control" readonly />
                    <span class="input-group-btn">
                      <button type="button" class="btn btn-success" id="cron-key" data-toggle="tooltip" title="<?php echo $button_edit; ?>" onclick="getCronKey();"><i class="fa fa-refresh"></i></button>
                    </span>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_update_statuses; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto; margin: 0;">
                    <?php foreach ($order_statuses as $order_status) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($order_status['order_status_id'], ${$m . '_update_statuses'})) { ?>
                        <input type="checkbox" name="<?php echo $m; ?>_update_statuses[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
                        <?php echo $order_status['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="<?php echo $m; ?>_update_statuses[]" value="<?php echo $order_status['order_status_id']; ?>" />
                        <?php echo $order_status['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_update_day; ?></label>
                <div class="col-sm-10">
                  <div class="input-group">
                    <input type="text" name="<?php echo $m; ?>_update_day" value="<?php echo ${$m . '_update_day'}; ?>" class="form-control" />
                    <div class="input-group-addon"><?php echo $text_day; ?></div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_update_url; ?></label>
                <div class="col-sm-10">
                  <div class="input-group">
                    <input type="text" name="<?php echo $m; ?>_update_url" value="<?php echo $update_url; ?>" class="form-control" readonly />
                    <span class="input-group-btn">
                      <a class="btn btn-success" href="<?php echo $update_url; ?>" target="_blank"><i class="fa fa-arrow-right"></i></a>
                    </span>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_update_pvz_url; ?></label>
                <div class="col-sm-10">
                  <div class="input-group">
                    <input type="text" name="<?php echo $m; ?>_update_pvz_url" value="<?php echo $update_pvz_url; ?>" class="form-control" readonly />
                    <span class="input-group-btn">
                      <a class="btn btn-success" href="<?php echo $update_pvz_url; ?>" target="_blank"><i class="fa fa-arrow-right"></i></a>
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-sms">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_sms_gate; ?></label>
                <div class="col-sm-10">
                  <select name="<?php echo $m; ?>_sms_gate" class="form-control">
                    <?php foreach ($sms_gates as $sms_gate) { ?>
                    <option value="<?php echo $sms_gate['code']; ?>" <?php if ($sms_gate['code'] == ${$m . '_sms_gate'}) { ?>selected="selected"<?php } ?>><?php echo $sms_gate['title']; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_sms_login; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_sms_login" value="<?php echo ${$m . '_sms_login'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_sms_password; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_sms_password" value="<?php echo ${$m . '_sms_password'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_sms_sender; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="<?php echo $m; ?>_sms_sender" value="<?php echo ${$m . '_sms_sender'}; ?>" class="form-control" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-support">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_license; ?></label>
                <div class="col-sm-10">
                  <input type="hidden" value="<?php echo $host; ?>" />
                  <input type="text" name="<?php echo $m; ?>_license" value="<?php echo ${$m . '_license'}; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_site; ?></label>
                <div class="col-sm-10"><a href="<?php echo $site; ?>" target="_blank" class="btn"><?php echo $site; ?></a></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_docs; ?></label>
                <div class="col-sm-10"><a href="<?php echo $docs; ?>" target="_blank" class="btn"><?php echo $docs; ?></a></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_email; ?></label>
                <div class="col-sm-10"><a href="mailto:<?php echo $email; ?>" class="btn"><?php echo $email; ?></a></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_service; ?></label>
                <div class="col-sm-10"><a href="<?php echo $api_service; ?>" target="_blank" class="btn"><?php echo $api_service; ?></a></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_api_docs; ?></label>
                <div class="col-sm-10"><a href="<?php echo $api_docs; ?>" target="_blank" class="btn"><?php echo $api_docs; ?></a></div>
              </div>
            </div>
          </div>
        </form>
      </div>
      <div class="panel-footer">
        <img src="../image/catalog/<?php echo $m; ?>/logo.png" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="pull-right">
        <span class="label label-default"><?php echo $m; ?></span>
        <span class="label label-default"><?php echo $version; ?></span>
      </div>
    </div>
    <?php } else { ?>
    <div class="panel panel-danger">
      <div class="panel-heading"><?php echo $heading_license; ?></div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_license; ?></label>
            <div class="col-sm-10">
              <input type="hidden" value="<?php echo $host; ?>" />
              <input type="text" name="<?php echo $m; ?>_license" value="<?php echo ${$m . '_license'}; ?>" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $text_site; ?></label>
            <div class="col-sm-10"><a href="<?php echo $site; ?>" target="_blank" class="btn"><?php echo $site; ?></a></div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $text_docs; ?></label>
            <div class="col-sm-10"><a href="<?php echo $docs; ?>" target="_blank" class="btn"><?php echo $docs; ?></a></div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $text_email; ?></label>
            <div class="col-sm-10"><a href="mailto:<?php echo $email; ?>" class="btn"><?php echo $email; ?></a></div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $text_service; ?></label>
            <div class="col-sm-10"><a href="<?php echo $api_service; ?>" target="_blank" class="btn"><?php echo $api_service; ?></a></div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $text_api_docs; ?></label>
            <div class="col-sm-10"><a href="<?php echo $api_docs; ?>" target="_blank" class="btn"><?php echo $api_docs; ?></a></div>
          </div>
        </form>
      </div>
      <div class="panel-footer">
        <img src="../image/catalog/<?php echo $m; ?>/logo.png" alt="<?php echo $heading_title; ?>" class="pull-right">
        <span class="label label-default"><?php echo $m; ?></span>
        <span class="label label-default"><?php echo $version; ?></span>
      </div>
    </div>
    <?php } ?>
  </div>
</div>
<?php if (${$m . '_license'}) { ?>
<script>
var service_row = <?php echo $service_row; ?>;

function addService() {
  html  = '<tr id="service-row-' + service_row + '">';
  html += '  <td class="text-left">';
  html += '    <div class="well well-sm" style="height: 150px; overflow: auto; margin: 0;">';
  <?php foreach ($variants as $variant) { ?>
  html += '      <div class="checkbox"><label><input type="checkbox" name="<?php echo $m; ?>_default_services[' + service_row  + '][variants][]" value="<?php echo $variant['code']; ?>" /><?php echo $variant['name']; ?></label></div>';
  <?php } ?>
  html += '    </div>';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <div class="well well-sm" style="height: 150px; overflow: auto; margin: 0;">';
  <?php foreach ($services as $service) { ?>
  html += '      <div class="checkbox"><label><input type="checkbox" name="<?php echo $m; ?>_default_services[' + service_row  + '][services][]" value="<?php echo $service['code']; ?>" /><?php echo $service['name']; ?></label></div>';
  <?php } ?>
  html += '    </div>';
  html += '  </td>';
  html += '  <td class="text-right"><button type="button" onclick="$(\'#service-row-' + service_row  + '\').remove();" class="btn btn-danger btn-sm"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';

  $('#services > tbody').append(html);

  service_row++;
}

var tracking_row = <?php echo $tracking_row; ?>;

function addTracking() {
  html  = '<tr id="tracking-row-' + tracking_row + '">';
  html += '  <td class="text-left">';
  html += '    <select name="<?php echo $m; ?>_trackings[' + tracking_row + '][shipping_status]" class="form-control">';
  <?php foreach ($statuses as $id => $status) { ?>
  html += '      <option value="<?php echo $id; ?>"><?php echo $status['title']; ?></option>';
  <?php } ?>
  html += '    </select>';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <select name="<?php echo $m; ?>_trackings[' + tracking_row + '][order_status]" class="form-control">';
  <?php foreach ($order_statuses as $status) { ?>
  html += '      <option value="<?php echo $status['order_status_id']; ?>"><?php echo $status['name']; ?></option>';
  <?php } ?>
  html += '    </select>';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <table class="table" style="background: transparent;">';
  html += '      <tr>';
  html += '        <td style="border: none;">';
  html += '          <div class="form-group">';
  html += '            <label class="col-sm-6 control-label"><?php echo $text_notify; ?></label>';
  html += '            <div class="col-sm-6">';
  html += '              <div class="btn-group" data-toggle="buttons">';
  html += '               <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_trackings[' + tracking_row + '][notify]" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>';
  html += '               <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_trackings[' + tracking_row + '][notify]" value="1" autocomplete="off"><?php echo $text_yes; ?></label>';
  html += '            </div>';
  html += '          </div>';
  html += '        </td>';
  html += '        <td style="border: none;">';
  <?php foreach ($languages as $language) { ?>
  html += '          <div class="input-group pull-left">';
  html += '            <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
  html += '            <textarea name="<?php echo $m; ?>_trackings[' + tracking_row + '][comment][<?php echo $language['language_id']; ?>]" class="form-control" rows="3"></textarea>';
  html += '          </div>';
  <?php } ?>
  html += '        </td>';
  html += '      </tr>';
  html += '      <tr>';
  html += '        <td>';
  html += '          <div class="form-group">';
  html += '            <label class="col-sm-6 control-label"><?php echo $text_notify_email; ?></label>';
  html += '            <div class="col-sm-6">';
  html += '              <div class="btn-group" data-toggle="buttons">';
  html += '               <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_trackings[' + tracking_row + '][notify_email]" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>';
  html += '               <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_trackings[' + tracking_row + '][notify_email]" value="1" autocomplete="off"><?php echo $text_yes; ?></label>';
  html += '            </div>';
  html += '          </div>';
  html += '        </td>';
  html += '        <td>';
  <?php foreach ($languages as $language) { ?>
  html += '          <div class="input-group pull-left">';
  html += '            <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
  html += '            <textarea name="<?php echo $m; ?>_trackings[' + tracking_row + '][email][<?php echo $language['language_id']; ?>]" class="form-control" rows="3"></textarea>';
  html += '          </div>';
  <?php } ?>
  html += '        </td>';
  html += '      </tr>';
  html += '      <tr>';
  html += '        <td>';
  html += '          <div class="form-group">';
  html += '            <label class="col-sm-6 control-label"><?php echo $text_notify_sms; ?></label>';
  html += '            <div class="col-sm-6">';
  html += '              <div class="btn-group" data-toggle="buttons">';
  html += '               <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_trackings[' + tracking_row + '][notify_sms]" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>';
  html += '               <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_trackings[' + tracking_row + '][notify_sms]" value="1" autocomplete="off"><?php echo $text_yes; ?></label>';
  html += '            </div>';
  html += '          </div>';
  html += '        </td>';
  html += '        <td>';
  <?php foreach ($languages as $language) { ?>
  html += '          <div class="input-group pull-left">';
  html += '            <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
  html += '            <textarea name="<?php echo $m; ?>_trackings[' + tracking_row + '][sms][<?php echo $language['language_id']; ?>]" class="form-control" rows="3"></textarea>';
  html += '          </div>';
  <?php } ?>
  html += '        </td>';
  html += '      </tr>';
  html += '    </table>';
  html += '  </td>';
  html += '  <td class="text-right"><button type="button" onclick="$(\'#tracking-row-' + tracking_row  + '\').remove();" class="btn btn-danger btn-sm"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';

  $('#trackings > tbody').append(html);

  tracking_row++;
}

var alert_row = <?php echo $alert_row; ?>;

function addAlert() {
  html  = '<tr id="alert-row-' + alert_row + '">';
  html += '  <td class="text-left">';
  html += '    <select name="<?php echo $m; ?>_alerts[' + alert_row + '][start_status]" class="form-control">';
  <?php foreach ($statuses as $id => $status) { ?>
  <?php if (!in_array($id, ['-1', '0', '999'])) { ?>
  html += '      <option value="<?php echo $id; ?>"><?php echo $status['title']; ?></option>';
  <?php } ?>
  <?php } ?>
  html += '    </select>';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <input type="text" name="<?php echo $m; ?>_alerts[' + alert_row + '][delay]" class="form-control" value="" />';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <div class="well well-sm" style="height: 300px; overflow: auto; margin: 0;">';
  <?php foreach ($statuses as $id => $status) { ?>
  <?php if (!in_array($id, ['-1', '0', '999'])) { ?>
  html += '      <div class="checkbox"><label>';
  html += '       <input type="checkbox" name="<?php echo $m; ?>_alerts[' + alert_row + '][stop_status][]" value="<?php echo $id; ?>" /> <?php echo $status['title']; ?>';
  html += '      </label></div>';
  <?php } ?>
  <?php } ?>
  html += '    </div>';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <table class="table" style="background: transparent;">';
  html += '      <tr>';
  html += '        <td style="border: none;">';
  html += '          <div class="form-group">';
  html += '            <label class="col-sm-6 control-label"><?php echo $text_notify_email; ?></label>';
  html += '            <div class="col-sm-6">';
  html += '              <div class="btn-group" data-toggle="buttons">';
  html += '               <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_alerts[' + alert_row + '][notify_email]" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>';
  html += '               <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_alerts[' + alert_row + '][notify_email]" value="1" autocomplete="off"><?php echo $text_yes; ?></label>';
  html += '            </div>';
  html += '          </div>';
  html += '        </td>';
  html += '        <td style="border: none;">';
  <?php foreach ($languages as $language) { ?>
  html += '          <div class="input-group pull-left">';
  html += '            <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
  html += '            <textarea name="<?php echo $m; ?>_alerts[' + alert_row + '][email][<?php echo $language['language_id']; ?>]" class="form-control" rows="3"></textarea>';
  html += '          </div>';
  <?php } ?>
  html += '        </td>';
  html += '      </tr>';
  html += '      <tr>';
  html += '        <td>';
  html += '          <div class="form-group">';
  html += '            <label class="col-sm-6 control-label"><?php echo $text_notify_sms; ?></label>';
  html += '            <div class="col-sm-6">';
  html += '              <div class="btn-group" data-toggle="buttons">';
  html += '               <label class="btn btn-default active"><input type="radio" name="<?php echo $m; ?>_alerts[' + alert_row + '][notify_sms]" value="0" autocomplete="off" checked="checked"><?php echo $text_no; ?></label>';
  html += '               <label class="btn btn-default"><input type="radio" name="<?php echo $m; ?>_alerts[' + alert_row + '][notify_sms]" value="1" autocomplete="off"><?php echo $text_yes; ?></label>';
  html += '            </div>';
  html += '          </div>';
  html += '        </td>';
  html += '        <td>';
  <?php foreach ($languages as $language) { ?>
  html += '          <div class="input-group pull-left">';
  html += '            <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
  html += '            <textarea name="<?php echo $m; ?>_alerts[' + alert_row + '][sms][<?php echo $language['language_id']; ?>]" class="form-control" rows="3"></textarea>';
  html += '          </div>';
  <?php } ?>
  html += '        </td>';
  html += '      </tr>';
  html += '    </table>';
  html += '  </td>';
  html += '  <td class="text-right"><button type="button" onclick="$(\'#alert-row-' + alert_row  + '\').remove();" class="btn btn-danger btn-sm"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';

  $('#alerts > tbody').append(html);

  alert_row++;
}

function getCronKey() {
  $.ajax({
    url: '<?php echo $get_cron_key; ?>',
    dataType: 'json',
    beforeSend: function() {
      $('#cron-key i').addClass('fa-spin');
      $('.alert').remove();
    },
    success: function(json) {
      $('#cron-key i').removeClass('fa-spin');

      if (json['success']) {
        $('input[name=<?php echo $m; ?>_cron_key]').val(json['success']['cron_key']);
        $('input[name=<?php echo $m; ?>_update_url]').val(json['success']['update_url']);
        $('input[name=<?php echo $m; ?>_update_pvz_url]').val(json['success']['update_pvz_url']);
      }

      if (json['error']) {
        $('#tab-cron').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('html, body').animate({ scrollTop: 0 });
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}

function logLoad() {
  $.ajax({
    url: '<?php echo $load_log; ?>',
    dataType: 'json',
    beforeSend: function() {
      $('#log-load i').addClass('fa-spin');
      $('.alert').remove();
    },
    success: function(json) {
      $('#log-load i').removeClass('fa-spin');

      if (json['success']) {
        $('#log').css('height', $(window).height() - 100);
        $('#log').val(json['success']);
        $("html, body").animate({ scrollTop: $('#log-container').offset().top });
      }

      if (json['error']) {
        $('#tab-log').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('html, body').animate({ scrollTop: 0 });
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}

function logDownload() {
  $.ajax({
    url: '<?php echo $download_log; ?>',
    dataType: 'json',
    beforeSend: function() {
      $('#log-download i').addClass('fa-spin');
      $('.alert').remove();
    },
    success: function(json) {
      $('#log-download i').removeClass('fa-spin');

      if (json['success']) {
        window.open(json['success']);
      }

      if (json['error']) {
        $('#tab-log').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('html, body').animate({ scrollTop: 0 });
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}

function logClear() {
  $.ajax({
    url: '<?php echo $clear_log; ?>',
    dataType: 'json',
    beforeSend: function() {
      $('#log-clear i').addClass('fa-spin');
      $('.alert').remove();
    },
    success: function(json) {
      $('#log-clear i').removeClass('fa-spin');

      if (json['success']) {
        $('#tab-log').prepend('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('#log').css('height', '');
        $('#log').val('');
        $('html, body').animate({ scrollTop: 0 });
      }

      if (json['error']) {
        $('#tab-log').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('html, body').animate({ scrollTop: 0 });
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}

$('.date').datetimepicker({
  pickTime: false,
  locale: 'ru',
  format: 'HH:mm',
});

$('.time').datetimepicker({
  pickDate: false,
  locale: 'ru',
  format: 'HH:mm',
});
</script>
<?php } ?>
<?php echo $footer; ?> 
