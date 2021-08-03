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
      <h1><?php echo $heading_title_courier; ?></h1>
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
          <input type="hidden" name="CallCourier[Date]" value="<?php echo $courier['send_date']; ?>" />
          <input type="hidden" name="CallCourier[Account]" value="<?php echo $courier['account']; ?>" />
          <input type="hidden" name="CallCourier[Secure]" value="<?php echo $courier['secure']; ?>" />
          <input type="hidden" name="CallCourier[CallCount]" value="1" />
          <input type="hidden" name="CallCourier[Call][0][DispatchNumber]" value="<?php echo $courier['dispatch_number']; ?>" />
          <input type="hidden" name="CallCourier[Call][0][SendCityCode]" value="<?php echo $courier['send_city_code']; ?>" />
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group">
                <label class="col-sm-2 control-label">Заказ</label>
                <div class="col-sm-10">
                  <a href="<?php echo $courier['order_link']; ?>" target="_blank" class="btn"><?php echo $courier['order_id']; ?></a>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Отправление</label>
                <div class="col-sm-10">
                  <a href="<?php echo $courier['dispatch_link']; ?>" target="_blank" class="btn"><?php echo $courier['dispatch_number']; ?></a>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label">Дата ожидания курьера</label>
                <div class="col-sm-10">
                  <div class="input-group date">
                    <input type="text" name="CallCourier[Call][0][Date]" value="<?php echo $courier['date']; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                    <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                  </div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label">Время ожидания курьера</label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <div class="input-group-addon">с</div>
                        <input type="text" name="CallCourier[Call][0][TimeBeg]" value="<?php echo $courier['time_beg']; ?>" class="form-control" />
                        <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <div class="input-group-addon">до</div>
                        <input type="text" name="CallCourier[Call][0][TimeEnd]" value="<?php echo $courier['time_end']; ?>" class="form-control" />
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
                        <input type="text" name="CallCourier[Call][0][LunchBeg]" value="<?php echo $courier['lunch_beg']; ?>" class="form-control" />
                        <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="input-group time">
                        <div class="input-group-addon">до</div>
                        <input type="text" name="CallCourier[Call][0][LunchEnd]" value="<?php echo $courier['lunch_end']; ?>" class="form-control" />
                        <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                      </div>
                    </div>
                  </div>
                  <small class="form-text text-muted">Заполнять только если входит во временной диапазон времени ожидания курьера.</small>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label">Город отправителя</label>
                <div class="col-sm-10">
                  <input type="text" value="<?php echo $courier['city']; ?>" class="form-control" readonly />
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label">Улица отправителя</label>
                <div class="col-sm-10">
                  <input type="text" name="CallCourier[Call][0][Address][Street]" value="<?php echo $courier['street']; ?>" class="form-control" maxlength="50" />
                  <small class="form-text text-muted">На один адрес может быть не более одного вызова курьера в день. Не надо указывать префиксы значений, вроде «ул.».</small>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label">Дом, корпус, строение отправителя</label>
                <div class="col-sm-10">
                  <input type="text" name="CallCourier[Call][0][Address][House]" value="<?php echo $courier['house']; ?>" class="form-control" maxlength="30" />
                  <small class="form-text text-muted">Не надо указывать префиксы значений, вроде «дом».</small>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label">Квартира/офис отправителя</label>
                <div class="col-sm-10">
                  <input type="text" name="CallCourier[Call][0][Address][Flat]" value="<?php echo $courier['flat']; ?>" class="form-control" maxlength="10" />
                  <small class="form-text text-muted">Не надо указывать префиксы значений, вроде «кв.».</small>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">ФИО отправителя</label>
                <div class="col-sm-10">
                  <input type="text" name="CallCourier[Call][0][SenderName]" value="<?php echo $courier['sender_name']; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Телефон отправителя</label>
                <div class="col-sm-10">
                  <input type="text" name="CallCourier[Call][0][SendPhone]" value="<?php echo $courier['send_phone']; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Комментарий</label>
                <div class="col-sm-10">
                  <textarea type="text" name="CallCourier[Call][0][Comment]" class="form-control"><?php echo $courier['comment']; ?></textarea>
                  <small class="form-text text-muted">Описание груза.</small>
                </div>
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
<?php echo $footer; ?> 
