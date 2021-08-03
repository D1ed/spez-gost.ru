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
        <a onclick="$('#form').submit()" class="btn btn-success"><i class="fa fa-play"></i> <?php echo $button_export; ?></a>
        <a href="<?php echo $shipping; ?>" data-toggle="tooltip" title="<?php echo $button_shipping; ?>" class="btn btn-default"><i class="fa fa-truck"></i></a>
        <a href="<?php echo $exchange; ?>" data-toggle="tooltip" title="<?php echo $button_exchange; ?>" class="btn btn-default"><i class="fa fa-exchange"></i></a>
        <a href="<?php echo $order; ?>" data-toggle="tooltip" title="<?php echo $button_order; ?>" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title_send; ?> <span class="label label-default">№ <?php echo $number; ?></span></h1>
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
    <div class="panel panel-primary">
      <div class="panel-body">
        <form method="post" action="<?php echo $action; ?>" enctype="multipart/form-data" id="form" class="form-horizontal">
          <div class="row">
            <div class="col-sm-1">
              <ul class="nav nav-pills nav-stacked" id="orders">
                <?php $row = 0; ?>
                <?php foreach ($orders as $order) { ?>
                <li><a href="#tab-order-<?php echo $row; ?>" data-toggle="tab"><?php echo $order['id']; ?></a></li>
                <?php $row++; ?>
                <?php } ?>
              </ul>
            </div>
            <div class="col-sm-11">
              <div class="tab-content">
                <?php $row = 0; ?>
                <?php foreach ($orders as $order) { ?>
                  <div class="tab-pane" id="tab-order-<?php echo $row; ?>">
                    <input type="hidden" name="DeliveryRequest[Account]" value="<?php echo $order['Account']; ?>" />
                    <input type="hidden" name="DeliveryRequest[Secure]" value="<?php echo $order['Secure']; ?>" />
                    <input type="hidden" name="DeliveryRequest[Number]" value="<?php echo $order['Number']; ?>" />
                    <input type="hidden" name="DeliveryRequest[Date]" value="<?php echo $order['Date']; ?>" />
                    <input type="hidden" name="DeliveryRequest[OrderCount]" value="<?php echo count($orders); ?>" />
                    <input type="hidden" name="DeliveryRequest[Order][<?php echo $row; ?>][SendCityCode]" value="<?php echo $order['Order']['SendCityCode']; ?>" />
                    <input type="hidden" name="DeliveryRequest[Order][<?php echo $row; ?>][RecCityCode]" value="<?php echo $order['Order']['RecCityCode']; ?>" />
                    <ul class="nav nav-tabs">
                      <li class="active"><a href="#tab-general-<?php echo $row; ?>" data-toggle="tab">Общее</a></li>
                      <li><a href="#tab-sender-<?php echo $row; ?>" data-toggle="tab">Отправитель</a></li>
                      <li><a href="#tab-recipient-<?php echo $row; ?>" data-toggle="tab">Получатель</a></li>
                      <li><a href="#tab-product-<?php echo $row; ?>" data-toggle="tab">Товары</a></li>
                      <li><a href="#tab-vat-<?php echo $row; ?>" data-toggle="tab">Сборы</a></li>
                      <li><a href="#tab-service-<?php echo $row; ?>" data-toggle="tab">Услуги</a></li>
                      <li><a href="#tab-shedule-<?php echo $row; ?>" data-toggle="tab">Расписание доставки</a></li>
                      <li><a href="#tab-call-<?php echo $row; ?>" data-toggle="tab">Курьер</a></li>
                    </ul>
                    <div class="tab-content">
                      <div class="tab-pane active" id="tab-general-<?php echo $row; ?>">
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Заказ</label>
                          <div class="col-sm-10">
                            <a href="<?php echo $order['order_link']; ?>" target="_blank" class="btn"><?php echo $order['id']; ?></a>
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">Номер заказа</label>
                          <div class="col-sm-10">
                            <input type="hidden" name="DeliveryRequest[Order][<?php echo $row; ?>][order_id]" value="<?php echo $order['id']; ?>" />
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Number]" value="<?php echo $order['Order']['Number']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">Тариф</label>
                          <div class="col-sm-10">
                            <div class="input-group">
                              <select name="DeliveryRequest[Order][<?php echo $row; ?>][TariffTypeCode]" class="form-control" readonly>
                                <?php foreach ($variants as $variant) { ?>
                                  <?php if ($variant['code'] == $order['Order']['TariffTypeCode']) { ?>
                                  <option value="<?php echo $variant['code']; ?>" selected="selected"><?php echo $variant['name']; ?></option>
                                  <?php } ?>
                                <?php } ?>
                              </select>
                              <span class="input-group-btn">
                                <a href="<?php echo $order['edit']; ?>" class="btn btn-primary" target="_blank"><i class="fa fa-pencil"></i> <?php echo $button_edit; ?></a>
                              </span>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Международный заказ</label>
                          <div class="col-sm-10">
                            <select id="international" class="form-control">
                              <option value="0">Нет</option>
                              <option value="1">Да</option>
                            </select>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Комментарий</label>
                          <div class="col-sm-10">
                            <textarea name="DeliveryRequest[Order][<?php echo $row; ?>][Comment]" class="form-control"><?php echo $order['Order']['Comment']; ?></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" id="tab-sender-<?php echo $row; ?>">
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">Город</label>
                          <div class="col-sm-10">
                            <input type="text" value="<?php echo $order['from']; ?>" class="form-control" readonly />
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">Индекс</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][SendCityPostCode]" value="<?php echo $order['Order']['SendCityPostCode']; ?>" class="form-control" />
                          </div>
                        </div>
                        <legend class="hidden international">Данные для международного заказа</legend>
                        <div class="form-group required hidden international">
                          <label class="col-sm-2 control-label">Дата инвойса</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][DateInvoice]" value="<?php echo $order['Order']['DateInvoice']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group required hidden international">
                          <label class="col-sm-2 control-label">Грузоотправитель</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][ShipperName]" value="<?php echo $order['Order']['ShipperName']; ?>" class="form-control" />
                            <small class="form-text text-muted">Используется при печати накладной.</small>
                          </div>
                        </div>
                        <div class="form-group required hidden international">
                          <label class="col-sm-2 control-label">Адрес грузоотправителя</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][ShipperAddress]" value="<?php echo $order['Order']['ShipperAddress']; ?>" class="form-control" />
                            <small class="form-text text-muted">Используется при печати накладной.</small>
                          </div>
                        </div>
                        <legend>Реквизиты истинного продавца</legend>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Адрес</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Seller][Address]" value="<?php echo $order['Order']['Seller']['Address']; ?>" class="form-control" />
                            <small class="form-text text-muted">Используется при печати инвойсов для отображения адреса настоящего продавца товара, либо торгового названия. Обязательно для международных заказов.</small>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Наименование</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Seller][Name]" value="<?php echo $order['Order']['Seller']['Name']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">ИНН</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Seller][INN]" value="<?php echo $order['Order']['Seller']['INN']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Телефон</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Seller][Phone]" value="<?php echo $order['Order']['Seller']['Phone']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Форма собственности</label>
                          <div class="col-sm-10">
                            <select name="DeliveryRequest[Order][<?php echo $row; ?>][Seller][OwnershipForm]" class="form-control">
                              <option value=""></option>
                              <?php foreach ($ownership_forms as $id => $title) { ?>
                              <option value="<?php echo $id; ?>" <?php if ($id == $order['Order']['Seller']['OwnershipForm']) { ?>selected="selected"<?php } ?>><?php echo $title; ?></option>
                              <?php } ?>
                            </select>
                          </div>
                        </div>
                        <legend>Если отправитель не клиент СДЭК</legend>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Наименование компании</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Sender][Company]" value="<?php echo $order['Order']['Sender']['Company']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Контактное лицо</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Sender][Name]" value="<?php echo $order['Order']['Sender']['Name']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Улица</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Sender][Address][Street]" value="<?php echo $order['Order']['Sender']['Address']['Street']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Дом</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Sender][Address][House]" value="<?php echo $order['Order']['Sender']['Address']['House']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Квартира/офис</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Sender][Address][Flat]" value="<?php echo $order['Order']['Sender']['Address']['Flat']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Телефон</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Sender][Phone]" value="<?php echo $order['Order']['Sender']['Phone']; ?>" class="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" id="tab-recipient-<?php echo $row; ?>">
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">Город</label>
                          <div class="col-sm-10">
                            <input type="text" value="<?php echo $order['to']; ?>" class="form-control" readonly />
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">Индекс</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][RecCityPostCode]" value="<?php echo $order['Order']['RecCityPostCode']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">ФИО</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][RecipientName]" value="<?php echo $order['Order']['RecipientName']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Email</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][RecipientEmail]" value="<?php echo $order['Order']['RecipientEmail']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">Телефон</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Phone]" value="<?php echo $order['Order']['Phone']; ?>" class="form-control" />
                          </div>
                        </div>
                        <?php if ($order['Order']['Address']['PvzCode']) { ?>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">ПВЗ/постамат</label>
                          <div class="col-sm-10">
                            <select name="DeliveryRequest[Order][<?php echo $row; ?>][Address][PvzCode]" class="form-control">
                              <?php if ($order['pvzs'] && !empty($order['pvzs'])) { ?>
                              <?php foreach ($order['pvzs'] as $pvz) { ?>
                              <option value="<?php echo $pvz['code']; ?>" <?php if ($pvz['code'] == $order['Order']['Address']['PvzCode']) { ?>selected="selected"<?php } ?>><?php echo $pvz['type']; ?> - <?php echo $pvz['code']; ?> - <?php echo $pvz['fullAddress']; ?></option>
                              <?php } ?>
                              <?php } ?>
                            </select>
                          </div>
                        </div>
                        <?php } else { ?>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">Улица</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Address][Street]" value="<?php echo $order['Order']['Address']['Street']; ?>" class="form-control" />
                            <small class="form-text text-muted">Адрес, указанный при оформлении заказа: <?php echo $order['address']; ?></small>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Дом</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Address][House]" value="<?php echo $order['Order']['Address']['House']; ?> " class="form-control" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Квартира</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Address][Flat]" value="<?php echo $order['Order']['Address']['Flat']; ?> " class="form-control" />
                          </div>
                        </div>
                        <?php } ?>
                        <legend class="hidden international">Данные для международного заказа</legend>
                        <div class="form-group hidden international">
                          <label class="col-sm-2 control-label">ИНН</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][RecipientINN]" value="<?php echo $order['Order']['RecipientINN']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group hidden international">
                          <label class="col-sm-2 control-label">Серия паспорта</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Passport][Series]" value="<?php echo $order['Order']['Passport']['Series']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group hidden international">
                          <label class="col-sm-2 control-label">Номер паспорта</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Passport][Number]" value="<?php echo $order['Order']['Passport']['Number']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group hidden international">
                          <label class="col-sm-2 control-label">Дата выдачи паспорта</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Passport][IssueDate]" value="<?php echo $order['Order']['Passport']['IssueDate']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group hidden international">
                          <label class="col-sm-2 control-label">Кем выдан паспорт</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Passport][IssuedBy]" value="<?php echo $order['Order']['Passport']['IssuedBy']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group hidden international">
                          <label class="col-sm-2 control-label">Дата рождения</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Passport][DateBirth]" value="<?php echo $order['Order']['Passport']['DateBirth']; ?>" class="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" id="tab-product-<?php echo $row; ?>">
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Номер упаковки</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Number]" value="<?php echo $order['Order']['Package']['Number']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">BarCode</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][BarCode]" value="<?php echo $order['Order']['Package']['BarCode']; ?>" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label">Общий вес с упаковкой</label>
                          <div class="col-sm-10">
                            <div class="input-group">
                              <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Weight]" value="<?php echo $order['Order']['Package']['Weight']; ?>" class="form-control" />
                              <div class="input-group-addon">г</div>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Упаковка</label>
                          <div class="col-sm-10">
                            <select id="package" class="form-control">
                              <option value="0">Нет</option>
                              <option value="1" <?php if ($order['pack']) { ?>selected="selected"<?php } ?>>Да</option>
                            </select>
                          </div>
                        </div>
                        <div class="form-group required <?php if (!$order['pack']) { ?>hidden<?php } ?> package">
                          <label class="col-sm-2 control-label">Габариты упаковки</label>
                          <div class="col-sm-10">
                            <div class="row">
                              <div class="col-sm-4">
                                <div class="input-group">
                                  <div class="input-group-addon">Длина</div>
                                  <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][SizeA]" value="<?php echo $order['Order']['Package']['SizeA']; ?>" class="form-control" <?php if (!$order['pack']) { ?>disabled="disabled"<?php } ?> />
                                  <div class="input-group-addon">см</div>
                                </div>
                              </div>
                              <div class="col-sm-4">
                                <div class="input-group">
                                  <div class="input-group-addon">Ширина</div>
                                  <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][SizeB]" value="<?php echo $order['Order']['Package']['SizeB']; ?>" class="form-control" <?php if (!$order['pack']) { ?>disabled="disabled"<?php } ?> />
                                  <div class="input-group-addon">см</div>
                                </div>
                              </div>
                              <div class="col-sm-4">
                                <div class="input-group">
                                  <div class="input-group-addon">Высота</div>
                                  <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][SizeC]" value="<?php echo $order['Order']['Package']['SizeC']; ?>" class="form-control" <?php if (!$order['pack']) { ?>disabled="disabled"<?php } ?> />
                                  <div class="input-group-addon">см</div>
                                </div>
                              </div>
                            </div>
                            <small class="form-text text-muted">Каждый габарит в пределах от 1см до 1500см.</small>
                          </div>
                        </div>
                        <table class="table table-bordered table-hover table-condensed">
                          <thead>
                            <tr>
                              <td colspan="3">
                                <button type="button" onclick="mergeProducts(<?php echo $row; ?>);" class="btn btn-success btn-block btn-sm"><i class="fa fa-compress"></i> Объединить товары</button>
                              </td>
                            </tr>
                          </thead>
                          <tbody>
                            <?php $product_row = 0; ?>
                            <?php foreach ($order['products'] as $product) { ?>
                            <tr>
                              <td rowspan="14" class="col-xs-2"><a href="<?php echo $product['edit']; ?>" target="_blank"><?php echo $product['Comment']; ?></a></td>
                            </tr>
                            <tr>
                              <td class="col-xs-2">Наименование</td>
                              <td>
                                <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][Comment]" value="<?php echo $product['Comment']; ?>" class="form-control input-sm" />
                              </td>
                            </tr>
                            <tr>
                              <td>Наименование на английском</td>
                              <td>
                                <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][CommentEx]" value="<?php echo $product['CommentEx']; ?>" class="form-control input-sm" />
                              </td>
                            </tr>
                            <tr>
                              <td>Артикул</td>
                              <td>
                                <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][WareKey]" value="<?php echo $product['WareKey']; ?>" class="form-control input-sm" />
                              </td>
                            </tr>
                            <tr>
                              <td>Ссылка</td>
                              <td>
                                <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][Link]" value="<?php echo $product['Link']; ?>" class="form-control input-sm" />
                              </td>
                            </tr>
                            <tr>
                              <td>Вес за единицу товара</td>
                              <td>
                                <div class="input-group input-group-sm">
                                  <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][Weight]" value="<?php echo $product['Weight']; ?>" class="form-control input-sm" />
                                  <div class="input-group-addon">г</div>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>Вес брутто за единицу товара</td>
                              <td>
                                <div class="input-group input-group-sm">
                                  <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][WeightBrutto]" value="<?php echo $product['WeightBrutto']; ?>" class="form-control input-sm" />
                                  <div class="input-group-addon">г</div>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>Ставка НДС</td>
                              <td>
                                <select name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][PaymentVATRate]" class="form-control input-sm" <?php if ($product['Payment'] == 0) { ?>disabled<?php } ?>>
                                  <?php foreach ($vats as $id => $title) { ?>
                                  <option value="<?php echo $id; ?>" <?php if ($id === $product['PaymentVATRate']) { ?>selected="selected"<?php } ?>><?php echo $title; ?></option>
                                  <?php } ?>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td>Сумма НДС</td>
                              <td>
                                <div class="input-group input-group-sm">
                                  <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][PaymentVATSum]" value="<?php echo $product['PaymentVATSum']; ?>" class="form-control input-sm" <?php if ($product['Payment'] == 0) { ?>disabled<?php } ?> />
                                  <div class="input-group-addon"><?php echo $order['payment_currency']; ?></div>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>Маркировка (если она указана, то количество не может быть больше 1)</td>
                              <td>
                                <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][Marking]" value="<?php echo $product['Marking']; ?>" class="form-control input-sm" />
                              </td>
                            </tr>
                            <tr>
                              <td>Количество</td>
                              <td>
                                <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][Amount]" value="<?php echo $product['Amount']; ?>" class="form-control input-sm" />
                              </td>
                            </tr>
                            <tr>
                              <td>Цена для страховки</td>
                              <td>
                                <div class="input-group input-group-sm">
                                  <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][Cost]" value="<?php echo $product['Cost']; ?>" class="form-control input-sm" />
                                  <div class="input-group-addon"><?php echo $order['cost_currency']; ?></div>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>К оплате за единицу</td>
                              <td>
                                <div class="input-group input-group-sm">
                                  <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][<?php echo $product_row; ?>][Payment]" value="<?php echo $product['Payment']; ?>" class="form-control input-sm" />
                                  <div class="input-group-addon"><?php echo $order['payment_currency']; ?></div>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>К оплате за товар</td>
                              <td class="success"><strong><?php echo $product['total']; ?></strong> <?php echo $order['payment_currency']; ?></td>
                            </tr>
                              <?php $product_row++; ?>
                            <?php } ?>
                          </tbody>
                          <tfoot>
                            <tr>
                              <td class="text-right">Стоимость доставки</td>
                              <td colspan="2" class="success"><strong><?php echo $order['Order']['DeliveryRecipientCost']; ?></strong> <?php echo $order['payment_currency']; ?> (редактируется на вкладке Сборы)</td>
                            </tr>
                            <tr>
                              <td class="text-right">Итого к оплате клиентом</td>
                              <td colspan="2" class="success"><strong><?php echo $order['total']; ?></strong> <?php echo $order['payment_currency']; ?> (если вы вручную изменили стоимость товаров или доставки, то данная величина динамически не пересчитывается, но в СДЭК будет передана новая)</td>
                            </tr>
                          </tfoot>
                        </table>
                      </div>
                      <div class="tab-pane" id="tab-vat-<?php echo $row; ?>">
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Доп. сбор за доставку</label>
                          <div class="col-sm-10">
                            <select id="vat" class="form-control">
                              <option value="0">Нет</option>
                              <option value="1" selected="selected">Не зависящий от стоимости заказа</option>
                              <option value="2">Зависящий от стоимости заказа</option>
                            </select>
                          </div>
                        </div>
                        <div class="form-group vat1">
                          <label class="col-sm-2 control-label">Сумма сбора</label>
                          <div class="col-sm-10">
                            <div class="input-group">
                              <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][DeliveryRecipientCost]" value="<?php echo $order['Order']['DeliveryRecipientCost']; ?>" class="form-control" />
                              <div class="input-group-addon"><?php echo $order['payment_currency']; ?></div>
                            </div>
                          </div>
                        </div>
                        <div class="form-group vat1">
                          <label class="col-sm-2 control-label">Ставка НДС</label>
                          <div class="col-sm-10">
                            <select name="DeliveryRequest[Order][<?php echo $row; ?>][DeliveryRecipientVATRate]" class="form-control">
                              <option value=""></option>
                              <?php foreach ($vats as $id => $title) { ?>
                              <option value="<?php echo $id; ?>" <?php if ($id === $order['Order']['DeliveryRecipientVATRate']) { ?>selected="selected"<?php } ?>><?php echo $title; ?></option>
                              <?php } ?>
                            </select>
                          </div>
                        </div>
                        <div class="form-group vat1">
                          <label class="col-sm-2 control-label">Сумма НДС</label>
                          <div class="col-sm-10">
                            <div class="input-group">
                              <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][DeliveryRecipientVATSum]" value="<?php echo $order['Order']['DeliveryRecipientVATSum']; ?>" class="form-control" />
                              <div class="input-group-addon"><?php echo $order['payment_currency']; ?></div>
                            </div>
                          </div>
                        </div>
                        <div class="form-group required hidden vat2">
                          <label class="col-sm-2 control-label">Порог стоимости товара</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][DeliveryRecipientCostAdv][Threshold]" value="<?php echo $order['Order']['DeliveryRecipientCostAdv']['Threshold']; ?>" class="form-control" />
                            <small class="form-text text-muted">Действует по условию меньше или равно, в целых единицах валюты.</small>
                          </div>
                        </div>
                        <div class="form-group required hidden vat2">
                          <label class="col-sm-2 control-label">Сумма сбора</label>
                          <div class="col-sm-10">
                            <div class="input-group">
                              <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][DeliveryRecipientCostAdv][Sum]" value="<?php echo $order['Order']['DeliveryRecipientCostAdv']['Sum']; ?>" class="form-control" />
                              <div class="input-group-addon"><?php echo $order['payment_currency']; ?></div>
                            </div>
                            <small class="form-text text-muted">Доп. сбор за доставку товаров, общая стоимость которых попадает в интервал.</small>
                          </div>
                        </div>
                        <div class="form-group hidden vat2">
                          <label class="col-sm-2 control-label">Ставка НДС</label>
                          <div class="col-sm-10">
                            <select name="DeliveryRequest[Order][<?php echo $row; ?>][DeliveryRecipientCostAdv][VATRate]" class="form-control">
                              <option value=""></option>
                              <?php foreach ($vats as $id => $title) { ?>
                              <option value="<?php echo $id; ?>" <?php if ($id === $order['Order']['DeliveryRecipientCostAdv']['VATRate']) { ?>selected="selected"<?php } ?>><?php echo $title; ?></option>
                              <?php } ?>
                            </select>
                          </div>
                        </div>
                        <div class="form-group hidden vat2">
                          <label class="col-sm-2 control-label">Сумма НДС</label>
                          <div class="col-sm-10">
                            <div class="input-group">
                              <input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][DeliveryRecipientCostAdv][VATSum]" value="<?php echo $order['Order']['DeliveryRecipientCostAdv']['VATSum']; ?>" class="form-control" />
                              <div class="input-group-addon"><?php echo $order['payment_currency']; ?></div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" id="tab-service-<?php echo $row; ?>">
                        <div class="form-group">
                          <div class="col-sm-12">
                            <div class="well well-sm" style="height: 150px; overflow: auto; margin: 0;">
                              <?php $service_row = 0; ?>
                              <?php foreach ($services as $service) { ?>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="DeliveryRequest[Order][<?php echo $row; ?>][AddService][<?php echo $service_row; ?>][ServiceCode]" value="<?php echo $service['code']; ?>" <?php if (in_array($service['code'], $order['Order']['services'])) { ?>checked="checked"<?php } ?> />
                                  <?php echo $service['name']; ?>
                                  <?php if (in_array($service['code'], $order['Order']['services']) && $service['code'] == 24) { ?>
                                    <input type="hidden" name="DeliveryRequest[Order][<?php echo $row; ?>][AddService][<?php echo $service_row; ?>][Count]" value="<?php echo $order['Order']['service_count']; ?>" />
                                  <?php } ?>
                                </label>
                              </div>
                              <?php $service_row++; ?>
                              <?php } ?>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" id="tab-shedule-<?php echo $row; ?>">
                        <div class="form-group">
                          <div class="col-sm-12">
                            <table id="shedules" class="table table-striped table-bordered table-hover">
                              <thead>
                                <tr>
                                  <td class="text-center" colspan="4">Временной интервал доставки</td>
                                  <td class="text-center" colspan="4">Новый адрес доставки (если требуется изменить)</td>
                                  <td rowspan="2"></td>
                                </tr>
                                <tr>
                                  <td class="text-left required">Дата</td>
                                  <td class="text-left required">Время начала</td>
                                  <td class="text-left required">Время окончания</td>
                                  <td class="text-left">Комментарий</td>
                                  <td class="text-left">Улица</td>
                                  <td class="text-left">Дом</td>
                                  <td class="text-left">Квартира</td>
                                  <td class="text-left">Код ПВЗ/постамата</td>
                                </tr>
                              </thead>
                              <tbody></tbody>
                              <tfoot>
                                <tr>
                                  <td colspan="9">
                                    <button type="button" onclick="addSchedule(<?php echo $row; ?>);" class="btn btn-success btn-block btn-sm"><i class="fa fa-plus-circle"></i> Добавить</button>
                                  </td>
                                </tr>
                              </tfoot>
                            </table>
                            <small class="form-text text-muted">Заполняется ИМ самостоятельно, если это определено в договоре.<br>В один день возможен только один временной интервал не менее 3 часов.<br>На одну дату по одному заказу может быть только одно расписание.<br>Расписание может иметь несколько дней доставки.<br>Расписание может быть передано позже.</small>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" id="tab-call-<?php echo $row; ?>">
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Вызвать курьера</label>
                          <div class="col-sm-10">
                            <select id="call" class="form-control">
                              <option value="0">Нет</option>
                              <option value="1">Да</option>
                            </select>
                          </div>
                        </div>
                        <div class="form-group required hidden call">
                          <label class="col-sm-2 control-label">Дата ожидания курьера</label>
                          <div class="col-sm-10">
                            <div class="input-group date">
                              <input type="text" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][Date]" value="<?php echo $order['call']['date']; ?>" data-date-format="YYYY-MM-DD" class="form-control" disabled="disabled" />
                              <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                            </div>
                          </div>
                        </div>
                        <div class="form-group required hidden call">
                          <label class="col-sm-2 control-label">Время ожидания курьера</label>
                          <div class="col-sm-10">
                            <div class="row">
                              <div class="col-sm-6">
                                <div class="input-group time">
                                  <div class="input-group-addon">с</div>
                                  <input type="text" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][TimeBeg]" value="<?php echo $order['call']['time_beg']; ?>" class="form-control" disabled="disabled" />
                                  <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                                </div>
                              </div>
                              <div class="col-sm-6">
                                <div class="input-group time">
                                  <div class="input-group-addon">до</div>
                                  <input type="text" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][TimeEnd]" value="<?php echo $order['call']['time_end']; ?>" class="form-control" disabled="disabled" />
                                  <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="form-group hidden call">
                          <label class="col-sm-2 control-label">Время обеда</label>
                          <div class="col-sm-10">
                            <div class="row">
                              <div class="col-sm-6">
                                <div class="input-group time">
                                  <div class="input-group-addon">с</div>
                                  <input type="text" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][LunchBeg]" value="<?php echo $order['call']['lunch_beg']; ?>" class="form-control" disabled="disabled" />
                                  <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                                </div>
                              </div>
                              <div class="col-sm-6">
                                <div class="input-group time">
                                  <div class="input-group-addon">до</div>
                                  <input type="text" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][LunchEnd]" value="<?php echo $order['call']['lunch_end']; ?>" class="form-control" disabled="disabled" />
                                  <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                                </div>
                              </div>
                            </div>
                            <small class="form-text text-muted">Заполнять только если входит во временной диапазон времени ожидания курьера.</small>
                          </div>
                        </div>
                        <div class="form-group required hidden call">
                          <label class="col-sm-2 control-label">Город отправителя</label>
                          <div class="col-sm-10">
                            <input type="hidden" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][SendCityCode]" value="<?php echo $order['Order']['SendCityCode']; ?>" disabled="disabled" />
                            <input type="text" value="<?php echo $order['from']; ?>" class="form-control" readonly />
                          </div>
                        </div>
                        <div class="form-group required hidden call">
                          <label class="col-sm-2 control-label">Улица отправителя</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][SendAddress][Street]" value="<?php echo $order['call']['street']; ?>" class="form-control" maxlength="50" disabled="disabled" />
                            <small class="form-text text-muted">На один адрес может быть не более одного вызова курьера в день. Не надо указывать префиксы значений, вроде «ул.».</small>
                          </div>
                        </div>
                        <div class="form-group required hidden call">
                          <label class="col-sm-2 control-label">Дом, корпус, строение отправителя</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][SendAddress][House]" value="<?php echo $order['call']['house']; ?>" class="form-control" maxlength="30" disabled="disabled" />
                            <small class="form-text text-muted">Не надо указывать префиксы значений, вроде «дом».</small>
                          </div>
                        </div>
                        <div class="form-group required hidden call">
                          <label class="col-sm-2 control-label">Квартира/офис отправителя</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][SendAddress][Flat]" value="<?php echo $order['call']['flat']; ?>" class="form-control" maxlength="10" disabled="disabled" />
                            <small class="form-text text-muted">Не надо указывать префиксы значений, вроде «кв.».</small>
                          </div>
                        </div>
                        <div class="form-group hidden call">
                          <label class="col-sm-2 control-label">ФИО отправителя</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][SenderName]" value="<?php echo $order['call']['sender_name']; ?>" class="form-control" disabled="disabled" />
                          </div>
                        </div>
                        <div class="form-group hidden call">
                          <label class="col-sm-2 control-label">Телефон отправителя</label>
                          <div class="col-sm-10">
                            <input type="text" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][SendPhone]" value="<?php echo $order['call']['send_phone']; ?>" class="form-control" disabled="disabled" />
                          </div>
                        </div>
                        <div class="form-group hidden call">
                          <label class="col-sm-2 control-label">Комментарий</label>
                          <div class="col-sm-10">
                            <textarea type="text" name="DeliveryRequest[CallCourier][<?php echo $row; ?>][Call][Comment]" class="form-control" disabled="disabled"><?php echo $order['call']['comment']; ?></textarea>
                            <small class="form-text text-muted">Описание груза.</small>
                          </div>
                        </div>
                      </div>
                    </div>
                    <?php $row++; ?>
                  </div>
                <?php } ?>
              </div>
            </div>
          </div>
        </form>
      </div>
      <div class="panel-footer">
        <img src="../image/catalog/<?php echo $m; ?>/logo.png" class="pull-right">
        <span class="label label-default"><?php echo $m; ?></span>
        <span class="label label-default"><?php echo $version; ?></span>
      </div>
    </div>
  </div>
</div>
<script>
$('#orders a:first').tab('show');

let html = [];

<?php $row = 0; ?>
<?php foreach ($orders as $order) { ?>
  $('#tab-order-<?php echo $row; ?> #international').on('change', function() {
    if (this.value > 0) {
      $('#tab-order-<?php echo $row; ?> .international').removeClass('hidden');
    } else {
      $('#tab-order-<?php echo $row; ?> .international').addClass('hidden');
    }
  });

  $('#tab-order-<?php echo $row; ?> #package').on('change', function() {
    if (this.value > 0) {
      $('#tab-order-<?php echo $row; ?> .package').removeClass('hidden');
      $('#tab-order-<?php echo $row; ?> .package input').prop('disabled', false);
    } else {
      $('#tab-order-<?php echo $row; ?> .package').addClass('hidden');
      $('#tab-order-<?php echo $row; ?> .package input').prop('disabled', true);
    }
  });

  $('#tab-order-<?php echo $row; ?> #vat').on('change', function() {
    $('#tab-order-<?php echo $row; ?> .vat1,#tab-order-<?php echo $row; ?> .vat2').addClass('hidden');

    if (this.value > 0) {
      $('#tab-order-<?php echo $row; ?> .vat' + this.value).removeClass('hidden');
    }
  });

  $('#tab-order-<?php echo $row; ?> #call').on('change', function() {
    if (this.value > 0) {
      $('#tab-order-<?php echo $row; ?> .call').removeClass('hidden');
      $('#tab-order-<?php echo $row; ?> .call input, #tab-order-<?php echo $row; ?> .call textarea').prop('disabled', false);
    } else {
      $('#tab-order-<?php echo $row; ?> .call').addClass('hidden');
      $('#tab-order-<?php echo $row; ?> .call input, #tab-order-<?php echo $row; ?> .call textarea').prop('disabled', true);
    }
  });

  $('#tab-order-<?php echo $row; ?> .date').datetimepicker({
    pickTime: false,
    locale: 'ru',
    format: 'HH:mm',
  });

  $('#tab-order-<?php echo $row; ?> .time').datetimepicker({
    pickDate: false,
    locale: 'ru',
    format: 'HH:mm',
  });

  html[<?php echo $row; ?>]  = '<tr>';
  html[<?php echo $row; ?>] += '  <td rowspan="14" class="col-xs-2"><a href="<?php echo $order['merge']['edit']; ?>" target="_blank"><?php echo $order['merge']['Comment']; ?></a></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td class="col-xs-2">Наименование</td>';
  html[<?php echo $row; ?>] += '  <td><input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][Comment]" value="<?php echo $order['merge']['Comment']; ?>" class="form-control input-sm" /></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>Наименование на английском</td>';
  html[<?php echo $row; ?>] += '  <td><input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][CommentEx]" value="<?php echo $order['merge']['CommentEx']; ?>" class="form-control input-sm" /></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>Артикул</td>';
  html[<?php echo $row; ?>] += '  <td><input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][WareKey]" value="<?php echo $order['merge']['WareKey']; ?>" class="form-control input-sm" /></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>Ссылка</td>';
  html[<?php echo $row; ?>] += '  <td><input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][Link]" value="<?php echo $order['merge']['Link']; ?>" class="form-control input-sm" /></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>Вес за единицу товара</td>';
  html[<?php echo $row; ?>] += '  <td><div class="input-group input-group-sm"><input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][Weight]" value="<?php echo $order['merge']['Weight']; ?>" class="form-control input-sm" /><div class="input-group-addon">г</div></div></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>Вес брутто за единицу товара</td>';
  html[<?php echo $row; ?>] += '  <td><div class="input-group input-group-sm"><input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][WeightBrutto]" value="<?php echo $order['merge']['WeightBrutto']; ?>" class="form-control input-sm" /><div class="input-group-addon">г</div></div></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>Ставка НДС</td>';
  html[<?php echo $row; ?>] += '  <td>';
  html[<?php echo $row; ?>] += '   <select name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][PaymentVATRate]" class="form-control input-sm" <?php if ($order['merge']['Payment'] == 0) { ?>disabled<?php } ?>>';
  <?php foreach ($vats as $id => $title) { ?>
  html[<?php echo $row; ?>] += '     <option value="<?php echo $id; ?>" <?php if ($id === $order['merge']['PaymentVATRate']) { ?>selected="selected"<?php } ?>><?php echo $title; ?></option>';
  <?php } ?>
  html[<?php echo $row; ?>] += '   </select>';
  html[<?php echo $row; ?>] += '  </td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>Сумма НДС</td>';
  html[<?php echo $row; ?>] += '  <td><div class="input-group input-group-sm"><input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][PaymentVATSum]" value="<?php echo $order['merge']['PaymentVATSum']; ?>" class="form-control input-sm" <?php if ($order['merge']['Payment'] == 0) { ?>disabled<?php } ?> /><div class="input-group-addon"><?php echo $order['payment_currency']; ?></div></div></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>Маркировка (если она указана, то количество не может быть больше 1)</td>';
  html[<?php echo $row; ?>] += '  <td><input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][Marking]" value="<?php echo $order['merge']['Marking']; ?>" class="form-control input-sm" /></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>Количество</td>';
  html[<?php echo $row; ?>] += '  <td><input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][Amount]" value="<?php echo $order['merge']['Amount']; ?>" class="form-control input-sm" /></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>Цена для страховки</td>';
  html[<?php echo $row; ?>] += '  <td><div class="input-group input-group-sm"><input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][Cost]" value="<?php echo $order['merge']['Cost']; ?>" class="form-control input-sm" /><div class="input-group-addon"><?php echo $order['cost_currency']; ?></div></div></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>К оплате за единицу</td>';
  html[<?php echo $row; ?>] += '  <td><div class="input-group input-group-sm"><input type="text" name="DeliveryRequest[Order][<?php echo $row; ?>][Package][Item][0][Payment]" value="<?php echo $order['merge']['Payment']; ?>" class="form-control input-sm" /><div class="input-group-addon"><?php echo $order['payment_currency']; ?></div></div></td>';
  html[<?php echo $row; ?>] += '</tr>';
  html[<?php echo $row; ?>] += '<tr>';
  html[<?php echo $row; ?>] += '  <td>К оплате за товар</td>';
  html[<?php echo $row; ?>] += '  <td class="success"><strong><?php echo $order['merge']['total']; ?></strong> <?php echo $order['payment_currency']; ?></td>';
  html[<?php echo $row; ?>] += '</tr>';

<?php $row++; ?>
<?php } ?>

function mergeProducts(row) {
  $('#tab-product-' + row + ' table tbody').html(html[row]);
}

let schedule_row = 0;

function addSchedule(row) {
  html  = '<tr class="schedule-row-' + schedule_row + '">';
  html += '  <td class="text-left">';
  html += '    <div class="input-group date"><input type="text" name="DeliveryRequest[Order][' + row + '][Schedule][Attempt][' + schedule_row + '][Date]" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <div class="input-group time"><input type="text" name="DeliveryRequest[Order][' + row + '][Schedule][Attempt][' + schedule_row + '][TimeBeg]" data-date-format="HH:mm" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <div class="input-group time"><input type="text" name="DeliveryRequest[Order][' + row + '][Schedule][Attempt][' + schedule_row + '][TimeEnd]" data-date-format="HH:mm" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <input type="text" name="DeliveryRequest[Order][' + row + '][Schedule][Attempt][' + schedule_row + '][Comment]" class="form-control" />';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <input type="text" name="DeliveryRequest[Order][' + row + '][Schedule][Attempt][' + schedule_row + '][Address][Street]" class="form-control" <?php if ($order['Order']['Address']['PvzCode']) { ?>disabled<?php } ?> />';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <input type="text" name="DeliveryRequest[Order][' + row + '][Schedule][Attempt][' + schedule_row + '][Address][House]" class="form-control" <?php if ($order['Order']['Address']['PvzCode']) { ?>disabled<?php } ?> />';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <input type="text" name="DeliveryRequest[Order][' + row + '][Schedule][Attempt][' + schedule_row + '][Address][Flat]" class="form-control" <?php if ($order['Order']['Address']['PvzCode']) { ?>disabled<?php } ?> />';
  html += '  </td>';
  html += '  <td class="text-left">';
  html += '    <input type="text" name="DeliveryRequest[Order][' + row + '][Schedule][Attempt][' + schedule_row + '][Address][PvzCode]" class="form-control" <?php if (!$order['Order']['Address']['PvzCode']) { ?>disabled<?php } ?> />';
  html += '  </td>';
  html += '  <td class="text-right"><button type="button" onclick="$(\'#tab-order-' + row + ' .schedule-row-' + schedule_row  + '\').remove();" data-toggle="tooltip" title="Удалить" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';

  $('#tab-order-' + row + ' #shedules tbody').append(html);

  $('#tab-order-' + row + ' .date').datetimepicker({
    pickTime: false,
  });

  $('#tab-order-' + row + ' .time').datetimepicker({
    pickDate: false,
  });

  schedule_row++;
}
</script>
<?php echo $footer; ?> 
