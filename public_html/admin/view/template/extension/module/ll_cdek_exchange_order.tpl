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
        <a onclick="$('#form').attr('action', '<?php echo $send; ?>'); $('#form').submit();" data-toggle="tooltip" title="<?php echo $button_create; ?>" class="btn btn-success disabled" id="button-send"><i class="fa fa-plus"></i></a>
        <a onclick="$('#form').attr('action', '<?php echo $update; ?>'); $('#form').submit();" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary disabled" id="button-update"><i class="fa fa-refresh"></i></a>
        <a onclick="$('#form').attr('action', '<?php echo $invoice; ?>'); $('#form').submit();" data-toggle="tooltip" title="<?php echo $button_invoice; ?>" class="btn btn-primary disabled" id="button-invoice"><i class="fa fa-print"></i></a>
        <a onclick="$('#form').attr('action', '<?php echo $sticker; ?>'); $('#form').submit();" data-toggle="tooltip" title="<?php echo $button_sticker; ?>" class="btn btn-primary disabled" id="button-sticker"><i class="fa fa-sticky-note-o"></i></a>
        <a href="<?php echo $shipping; ?>" data-toggle="tooltip" title="<?php echo $button_shipping; ?>" class="btn btn-default"><i class="fa fa-truck"></i></a>
        <a href="<?php echo $exchange; ?>" data-toggle="tooltip" title="<?php echo $button_exchange; ?>" class="btn btn-default"><i class="fa fa-exchange"></i></a>
        <a href="<?php echo $orderr; ?>" data-toggle="tooltip" title="<?php echo $button_order; ?>" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title_order; ?></h1>
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
        <div class="well well-sm">
          <div class="row">
            <div class="col-sm-3">
              <div class="input-group">
                <div class="input-group-addon"><?php echo $column_id; ?></div>
                <input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" class="form-control" />
              </div>
              <br>
              <div class="input-group">
                <div class="input-group-addon"><?php echo $column_to; ?></div>
                <input type="text" name="filter_to_name" value="<?php echo $filter_to_name; ?>" class="form-control" />
                <input type="hidden" name="filter_to" value="<?php echo $filter_to; ?>" class="form-control" />
              </div>
              <br>
              <div class="input-group">
                <div class="input-group-addon"><?php echo $entry_pvz; ?></div>
                <input type="text" name="filter_pvz" value="<?php echo $filter_pvz; ?>" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="input-group">
                <div class="input-group-addon"><?php echo $column_total; ?></div>
                <input type="text" name="filter_total" value="<?php echo $filter_total; ?>" class="form-control" />
              </div>
              <br>
              <div class="input-group">
                <div class="input-group-addon"><?php echo $column_tariff; ?></div>
                <select name="filter_tariff" class="form-control">
                  <option value="*"></option>
                  <?php foreach ($variants as $variant) { ?>
                  <option value="<?php echo $variant['code']; ?>" <?php if ($variant['code'] == $filter_tariff) { ?>selected="selected"<?php } ?>><?php echo $variant['name']; ?></option>
                  <?php } ?>
                </select>
              </div>
              <br>
              <div class="input-group">
                <div class="input-group-addon"><?php echo $column_order_status; ?></div>
                <select name="filter_order_status" class="form-control">
                  <option value="*"></option>
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"  <?php if ($order_status['order_status_id'] == $filter_order_status) { ?>selected="selected"<?php } ?>><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="input-group">
                <div class="input-group-addon"><?php echo $entry_number; ?></div>
                <input type="text" name="filter_number" value="<?php echo $filter_number; ?>" class="form-control" />
              </div>
              <br>
              <div class="input-group">
                <div class="input-group-addon"><?php echo $column_dispatch; ?></div>
                <input type="text" name="filter_dispatch" value="<?php echo $filter_dispatch; ?>" class="form-control" />
              </div>
              <br>
              <div class="input-group">
                <div class="input-group-addon"><?php echo $column_status; ?></div>
                <select name="filter_cdek_status" class="form-control">
                  <option value="*"></option>
                  <?php foreach ($statuses as $status_id => $status) { ?>
                  <option value="<?php echo $status_id; ?>" <?php if ($status_id == $filter_cdek_status && is_numeric($filter_cdek_status)) { ?>selected="selected"<?php } ?>><?php echo $status['title']; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="input-group date">
                <div class="input-group-addon"><?php echo $column_date; ?></div>
                <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" class="form-control" />
                <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span>
              </div>
              <br>
              <div class="input-group">
                <div class="input-group-addon"><?php echo $entry_customer; ?></div>
                <input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" class="form-control" />
              </div>
              <br>
              <div class="row">
                <div class="col-sm-6">
                  <a href="<?php echo $orderr; ?>" class="btn btn-warning btn-block"><i class="fa fa-eraser"></i> <?php echo $button_clear; ?></a>
                </div>
                <div class="col-sm-6">
                  <button type="button" id="button-filter" class="btn btn-primary btn-block"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php if ($orders) { ?>
        <form method="post" action="" enctype="multipart/form-data" id="form">
          <div>
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" name="onselected" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td style="width: 1px;" class="text-center">#</td>
                  <td class="text-left"><?php echo $column_to; ?></td>
                  <td class="text-center"><?php echo $column_total; ?></td>
                  <td class="text-center"><?php echo $column_date; ?></td>
                  <td class="text-center"><?php echo $column_order_status; ?></td>
                  <td class="text-center"><?php echo $column_customer; ?></td>
                  <td class="text-center"><?php echo $column_tariff; ?></td>
                  <td class="text-center"><?php echo $column_dispatch; ?></td>
                  <td class="text-center"><?php echo $column_status; ?></td>
                  <td></td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($orders as $order) { ?>
                <tr class="<?php echo $order['color']; ?>">
                  <td class="text-center">
                    <?php if (in_array($order['order_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
                    <?php } ?>
                  </td>
                  <td class="text-center">
                    <a href="<?php echo $order['order_view']; ?>" target="_blank"><?php echo $order['order_id']; ?></a>
                  </td>
                  <td class="text-left"><?php echo $order['to']; ?></td>
                  <td class="text-center"><?php echo $order['total']; ?></td>
                  <td class="text-center"><?php echo $order['date_added']; ?></td>
                  <td class="text-center"><?php echo $order['order_status']; ?></td>
                  <td class="text-center">
                    <span id="ll_checkclient_<?php echo $order['order_id']; ?>" class="ll_checkclient_popover label label-<?php echo $order['check_color']; ?>" data-content="<?php echo $order['check']; ?>" style="cursor: pointer;"><?php echo $order['customer']; ?></span>
                  </td>
                  <td class="text-center"><span class="label label-default"><?php echo $order['tariff']; ?></span></td>
                  <td class="text-center"><?php echo $order['dispatch_number']; ?></td>
                  <td class="text-center">
                    <label class="control-label"><span data-toggle="tooltip" title="<?php echo $order['description']; ?>"><?php echo $order['status']; ?></span></label>
                    <br>
                    <small class="form-text text-muted"><?php echo $order['date']; ?></small>
                  </td>
                  <td class="text-center">
                    <?php if ($order['status_id'] >= 0) { ?>
                    <div class="btn-group">
                      <?php if ($order['status_id']) { ?>
                        <a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-default"><i class="fa fa-eye"></i></a>
                        <?php if (!in_array($order['status_id'], ['0', '2'])) { ?>
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
                        <?php } ?>
                      <?php } else { ?>
                        <a onclick="$('input[value=<?php echo $order['order_id']; ?>]').prop('checked', true); $('#form').attr('action', '<?php echo $send; ?>'); $('#form').submit();" data-toggle="tooltip" title="<?php echo $button_create; ?>" class="btn btn-success"><i class="fa fa-plus"></i></a>
                        <a style="cursor: pointer;" onclick="confirm('<?php echo $text_clean_confirm; ?>') ? location = '<?php echo $order['remove']; ?>' : false;" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-warning"><i class="fa fa-eraser fa-fw"></i></a>
                        <a style="cursor: pointer;" onclick="confirm('<?php echo $text_remove_confirm; ?>') ? location = '<?php echo $order['remove_db']; ?>' : false;" data-toggle="tooltip" title="<?php echo $button_delete_db; ?>" class="btn btn-danger"><i class="fa fa-times"></i></a>
                      <?php } ?>
                    </div>
                    <?php } ?>
                  </td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
        <?php } else { ?>
        <div class="row">
          <div class="col-sm-12 text-center"><?php echo $text_no_results; ?></div>
        </div>
        <?php } ?>
      </div>
      <div class="panel-footer">
        <img src="../image/catalog/<?php echo $m; ?>/logo.png" class="pull-right">
        <span class="label label-default"><?php echo $m; ?></span>
        <span class="label label-default"><?php echo $version; ?></span>
      </div>
    </div>
  </div>
</div>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<script>
$('.date').datetimepicker({
  pickTime: false,
  format: 'YYYY-MM-DD'
});

$('input[name*=\'selected\'], input[name*=\'onselected\']').on('change', function() {
  $('#button-send, #button-update, #button-invoice, #button-sticker').addClass('disabled');

  var selected = $('input[name*=\'selected\']:checked');

  if (selected.length) {
    $('#button-send, #button-update, #button-invoice, #button-sticker').removeClass('disabled');
  }
});

$('input[name=\'filter_order_id\'], input[name=\'filter_to\'], input[name=\'filter_pvz\'], input[name=\'filter_total\'], input[name=\'filter_number\'], input[name=\'filter_dispatch\'], input[name=\'filter_date_added\']').on('keydown', function(e) {
  if (e.keyCode == 13) {
    $('#button-filter').trigger('click');
  }
});

$('#button-filter').on('click', function() {
  url = '<?php echo $orderr; ?>';

  var filter_order_id = $('input[name=\'filter_order_id\']').val();

  if (filter_order_id) {
    url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
  }

  var filter_to = $('input[name=\'filter_to\']').val();

  if (filter_to) {
    url += '&filter_to=' + encodeURIComponent(filter_to);
  }

  var filter_pvz = $('input[name=\'filter_pvz\']').val();

  if (filter_pvz) {
    url += '&filter_pvz=' + encodeURIComponent(filter_pvz);
  }

  var filter_total = $('input[name=\'filter_total\']').val();

  if (filter_total) {
    url += '&filter_total=' + encodeURIComponent(filter_total);
  }

  var filter_tariff = $('select[name=\'filter_tariff\']').val();

  if (filter_tariff != '*') {
    url += '&filter_tariff=' + encodeURIComponent(filter_tariff);
  }

  var filter_order_status = $('select[name=\'filter_order_status\']').val();

  if (filter_order_status != '*') {
    url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
  }

  var filter_number = $('input[name=\'filter_number\']').val();

  if (filter_number) {
    url += '&filter_number=' + encodeURIComponent(filter_number);
  }

  var filter_dispatch = $('input[name=\'filter_dispatch\']').val();

  if (filter_dispatch) {
    url += '&filter_dispatch=' + encodeURIComponent(filter_dispatch);
  }

  var filter_cdek_status = $('select[name=\'filter_cdek_status\']').val();

  if (filter_cdek_status != '*') {
    url += '&filter_cdek_status=' + encodeURIComponent(filter_cdek_status);
  }

  var filter_date_added = $('input[name=\'filter_date_added\']').val();

  if (filter_date_added) {
    url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
  }

  var filter_customer = $('input[name=\'filter_customer\']').val();

  if (filter_customer) {
    url += '&filter_customer=' + encodeURIComponent(filter_customer);
  }

  location = url;
});

$('input[name=\'filter_customer\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: '<?php echo $customer_autocomplete; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['customer_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'filter_customer\']').val(item['label']);
  }
});

$('input[name=\'filter_to_name\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: '<?php echo $to_autocomplete; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['full'],
            value: item['id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'filter_to\']').val(item['value']);
    $('input[name=\'filter_to_name\']').val(item['label']);
  }
});

$('.ll_checkclient_popover').popover({
  animation: 'false',
  placement: 'left auto',
  html: 'true',
  trigger: 'hover click'
});

function checkPhone(id, phone, customer_id) {
  $.ajax({
    url: '<?php echo $check_phone_url; ?>&phone=' + encodeURIComponent(phone) + '&customer_id=' + encodeURIComponent(customer_id),
    dataType: 'json',
    success: function(json) {
      if (json['success']) {
        $('#ll_checkclient_' + id).removeAttr('data-content');
        $('#ll_checkclient_' + id).data('bs.popover').options.content = json['success'];
        $('#ll_checkclient_' + id).popover('show');
      }

      if (json['error']) {
        $('#ll_checkclient_' + id).removeAttr('data-content');
        $('#ll_checkclient_' + id).data('bs.popover').options.content = json['error'];
        $('#ll_checkclient_' + id).popover('show');
      }

      if (json['color']) {
        $('#ll_checkclient_' + id).removeClass('label-default label-success label-warning label-danger');
        $('#ll_checkclient_' + id).addClass('label-' + json['color']);
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}
</script>
<?php echo $footer; ?> 
