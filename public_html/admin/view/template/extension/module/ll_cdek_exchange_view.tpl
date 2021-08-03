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
        <?php if (!in_array($order['status_id'], ['0', '2'])) { ?>
        <div class="btn-group">
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="caret"></span>
          </button>
          <ul class="dropdown-menu dropdown-menu-right">
            <li><a href="<?php echo $order['update']; ?>"><span class="text-primary"><i class="fa fa-refresh fa-fw"></i> <?php echo $button_update; ?></span></a></li>
            <li><a href="<?php echo $order['invoice']; ?>" target="_blank"><span class="text-primary"><i class="fa fa-print fa-fw"></i> <?php echo $button_invoice; ?></span></a></li>
            <li><a href="<?php echo $order['sticker']; ?>" target="_blank"><span class="text-primary"><i class="fa fa-sticky-note-o fa-fw"></i> <?php echo $button_sticker; ?></span></a></li>
            <?php if ($ll_invoice) { ?>
              <li><a href="<?php echo $order['torg']; ?>" target="_blank"><span class="text-primary"><i class="fa fa-barcode fa-fw"></i> <?php echo $button_torg; ?></span></a></li>
            <?php } else { ?>
              <li class="disabled"><a><span class="text-primary"><i class="fa fa-barcode fa-fw"></i> <?php echo $button_torg; ?></span></a></li>
            <?php } ?>
            <li><a href="<?php echo $order['email']; ?>"><span class="text-primary"><i class="fa fa-envelope-o fa-fw"></i> <?php echo $button_email; ?></span></a></li>
            <li><a href="<?php echo $order['courier']; ?>"><span class="text-primary"><i class="fa fa-calendar fa-fw"></i> <?php echo $button_courier; ?></span></a></li>
            <li class="hidden"><a href="<?php echo $order['call']; ?>"><span class="text-primary"><i class="fa fa-phone fa-fw"></i> <?php echo $button_call; ?></span></a></li>
            <li><a style="cursor: pointer;" onclick="confirm('<?php echo $text_clean_confirm; ?>') ? location = '<?php echo $order['remove']; ?>' : false;"><span class="text-warning"><i class="fa fa-eraser fa-fw"></i> <?php echo $button_delete; ?></span></a></li>
            <li><a style="cursor: pointer;" onclick="confirm('<?php echo $text_remove_confirm; ?>') ? location = '<?php echo $order['remove_db']; ?>' : false;"><span class="text-danger"><i class="fa fa-times fa-fw"></i> <?php echo $button_delete_db; ?></span></a></li>
          </ul>
        </div>
        <?php } ?>
        <a href="<?php echo $shipping; ?>" data-toggle="tooltip" title="<?php echo $button_shipping; ?>" class="btn btn-default"><i class="fa fa-truck"></i></a>
        <a href="<?php echo $exchange; ?>" data-toggle="tooltip" title="<?php echo $button_exchange; ?>" class="btn btn-default"><i class="fa fa-exchange"></i></a>
        <a href="<?php echo $orders; ?>" data-toggle="tooltip" title="<?php echo $button_order; ?>" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title_view; ?></h1>
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
    <div class="row">
      <div class="col-md-6">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-shopping-cart"></i> Заказ</h3>
          </div>
          <table class="table">
            <tbody>
              <tr>
                <td style="width: 30%;">Номер заказа</td>
                <td><a href="<?php echo $order['order_link']; ?>" target="_blank"><?php echo $order['order_id']; ?></a></td>
              </tr>
              <tr>
                <td>Номер заказа при отправлении</td>
                <td><?php echo $order['order_number']; ?></td>
              </tr>
              <tr>
                <td>Номер заказа в СДЭК</td>
                <td>
                  <div class="input-group input-group-sm" data-toggle="tooltip" title="Изменяйте только если по какой-то причине номер заказа СДЭК изменился и вы не можете обновить статусы.">
                    <input type="text" name="dispatch_number" value="<?php echo $order['dispatch_number']; ?>" class="form-control" />
                    <span class="input-group-btn">
                      <button type="button" class="btn btn-warning" id="change_dispatch_number"><i class="fa fa-exclamation-triangle"></i> Изменить</button>
                    </span>
                  </div>
                </td>
              </tr>
              <tr>
                <td>Номер ТТН</td>
                <td><?php echo $order['number']; ?></td>
              </tr>
              <tr>
                <td>Тариф</td>
                <td><?php echo $order['tariff']; ?></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="col-md-6">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-user"></i> Покупатель</h3>
          </div>
          <table class="table">
            <tbody>
              <tr>
                <td style="width: 30%;">ФИО</td>
                <td>
                  <?php if ($order['customer_link']) { ?>
                    <a href="<?php echo $order['customer_link']; ?>" target="_blank"><?php echo $order['customer']; ?></a>
                  <?php } else { ?>
                    <?php echo $order['customer']; ?>
                  <?php } ?>
                </td>
              </tr>
              <tr>
                <td>Страна</td>
                <td><?php echo $order['country']; ?></td>
              </tr>
              <tr>
                <td>Регион</td>
                <td><?php echo $order['zone']; ?></td>
              </tr>
              <tr>
                <td>Город</td>
                <td><?php echo $order['city']; ?></td>
              </tr>
              <tr>
                <td>ПВЗ/постамат</td>
                <td><?php echo $order['pvz']; ?></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-calendar"></i> Статусы заказа</h3>
          </div>
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-left">Дата</td>
                <td class="text-left">Статус</td>
                <td class="text-left">Комментарий</td>
                <td class="text-left">Покупатель уведомлен</td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($histories as $history) { ?>
              <tr>
                <td class="text-left"><?php echo $history['date_added']; ?></td>
                <td class="text-left"><?php echo $history['status']; ?></td>
                <td class="text-left"><?php echo $history['comment']; ?></td>
                <td class="text-left"><?php echo $history['notify']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </div>
      <div class="col-md-6">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-truck"></i> Статусы отправления</h3>
          </div>
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-left">Дата</td>
                <td class="text-left">Статус</td>
                <td class="text-left">Описание</td>
                <td class="text-left">Город</td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($statuses as $status) { ?>
              <tr class="<?php echo $status['color']; ?>">
                <td class="text-left"><?php echo $status['date']; ?></td>
                <td class="text-left"><?php echo $status['status']; ?></td>
                <td class="text-left"><?php echo $status['description']; ?></td>
                <td class="text-left"><?php echo $status['city']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
$('#change_dispatch_number').on('click', function() {
  var dispatch_number = $('input[name=\'dispatch_number\']').val();

  if (dispatch_number) {
    $.ajax({
      url: '<?php echo $change_dispatch_number; ?>&dispatch_number=' + encodeURIComponent(dispatch_number),
      dataType: 'json',
      beforeSend: function() {
        $('#change_dispatch_number').button('loading');
      },
      success: function(json) {
        $('.alert').remove();
        $('#change_dispatch_number').button('reset');

        if (json['success']) {
          $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          $('html, body').animate({ scrollTop: 0 });
        }

        if (json['error']) {
          $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          $('html, body').animate({ scrollTop: 0 });
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  }
});
</script>
<?php echo $footer; ?> 
