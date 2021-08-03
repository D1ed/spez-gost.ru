<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
            <a href="<?php echo $settings; ?>" class="btn btn-success"><i class="fa fa-wrench"></i> <?php echo $button_settings; ?></a>
            <a onclick="$('form').submit();" class="btn btn-danger"><i class="fa fa-trash-o"></i> <?php echo $button_delete; ?></a>
            <a href="<?php echo $cancel; ?>" class="btn  btn-default"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a>
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
    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-body">


	      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
                        <td class="text-right">
                            <?php if ($sort == 'id') { ?>
                            <a href="<?php echo $sort_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_id; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_id; ?>"><?php echo $column_id; ?></a>
                            <?php } ?>
                        </td>
                        <td class="text-left">
                            <?php if ($sort == 'name') { ?>
                            <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                            <?php } ?>
                        </td>
                        <td class="text-left">
                            <?php if ($sort == 'phone') { ?>
                            <a href="<?php echo $sort_phone; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_phone; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_phone; ?>"><?php echo $column_phone; ?></a>
                            <?php } ?>
                        </td>
                         <td class="text-left">
                            <?php if ($sort == 'email') { ?>
                            <a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
                            <?php } ?>
                        </td>
                        <td class="text-left"> <?php echo $column_message; ?></td>
                        <td class="text-left">
                            <?php if ($sort == 'order_status_id') { ?>
                            <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                            <?php } ?>
                        </td>
                        <td class="text-left">
                            <?php if ($sort == 'date') { ?>
                            <a href="<?php echo $sort_date; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_date; ?>"><?php echo $column_date; ?></a>
                            <?php } ?></td>
                        <td class="text-left">
                            <?php if ($sort == 'date_modified') { ?>
                            <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_modified; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_date_modified; ?>"><?php echo $column_date_modified; ?></a>
                            <?php } ?></td>
                          <td class="text-left"></td>
                    </tr>
                </thead>
                <tbody id="module-row">
                    <tr class="filter">
                        <td></td>
                        <td class="text-left"><input type="text" name="filter_id" value="<?php echo $filter_id; ?>" size="2" /></td>
                        <td><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" size="10" /></td>
                        <td><input type="text" name="filter_phone" value="<?php echo $filter_phone; ?>" size="10" /></td>
                           <td><input type="text" name="filter_email" value="<?php echo $filter_email; ?>" size="10" /></td>
                        <td style="width:150px;"></td>
                        <td>
                            <select name="filter_order_status_id" style="width:100px;">
                                <option value="*"></option>
                                <option value="0"<?php if ($filter_order_status_id == '0') { ?> selected="selected"<?php } ?>><?php echo $text_missing; ?></option>
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>"<?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?> selected="selected"<?php } ?>><?php echo $order_status['name']; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td><input type="text" name="filter_date" value="<?php echo $filter_date; ?>" size="10" data-date-format="YYYY-MM-DD" class="date" /></td>
                        <td><input type="text" name="filter_date_modified" value="<?php echo $filter_date_modified; ?>" size="10" data-date-format="YYYY-MM-DD" class="date" /></td>
                        <td class="text-left"><a onclick="filter();" data-toggle="tooltip" title="<?php echo $button_filter; ?>" class="btn btn-primary pull-left"><i class="fa fa-search"></i></a></td>
                    </tr>
                    <?php if ($histories) { ?>
                    <?php foreach ($histories as $history) { ?>
                    <tr>
                        <td class="text-left"><input type="checkbox" name="selected[]" value="<?php echo $history['id']; ?>" /></td>
                        <td class="text-left"><?php echo $history['id']; ?></td>
                        <td class="text-left"><?php echo $history['name']; ?></td>
                        <td class="text-left"><?php echo $history['phone']; ?></td>
                         <td class="text-left"><?php echo $history['email']; ?></td>
                        <td class="text-left"><?php echo $history['message']; ?></td>
                        <td class="text-left"><?php echo $history['status']; ?></td>
                        <td class="text-left"><?php echo $history['date']; ?></td>
                        <td class="text-left"><?php echo $history['date_modified']; ?></td>
                        <td class="text-left"><a href="<?php echo $history['action']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-info"><i class="fa fa-pencil"></i></a></td>
                    </tr>
                     <?php } ?>
                     <?php } else { ?>
                    <tr>
                        <td class="text-center" colspan="12"><?php echo $text_no_results; ?></td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
          </div><!-- </div class="table-responsive"> -->
        </form>
      <div class="pagination"><?php echo $pagination; ?></div>


      </div><!-- </div class="panel-body"> -->
    </div><!-- </div class="panel panel-default"> -->
  </div><!-- </div class="container-fluid"> -->
</div><!-- </div id="content"> -->



<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<script type="text/javascript"><!--
function filter() {
    url = 'index.php?route=extension/module/fish_singleclick/getList&token=<?php echo $token; ?>';
    
    var filter_id = $('input[name=\'filter_id\']').val();
    
    if (filter_id) {
      url += '&filter_id=' + encodeURIComponent(filter_id);
    }
    
    
    var filter_phone = $('input[name=\'filter_phone\']').val();
    
    if (filter_phone) {
      url += '&filter_phone=' + encodeURIComponent(filter_phone);
    }
	var filter_email = $('input[name=\'filter_email\']').val();
    
    if (filter_email) {
      url += '&filter_email=' + encodeURIComponent(filter_email);
    }
    
    var filter_name = $('input[name=\'filter_name\']').val();
    
    if (filter_name) {
      url += '&filter_name=' + encodeURIComponent(filter_name);
    }
    
    var filter_order_status_id = $('select[name=\'filter_order_status_id\']').val();
    
    if (filter_order_status_id != '*') {
      url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
    }	

    var filter_date = $('input[name=\'filter_date\']').val();
    
    if (filter_date) {
      url += '&filter_date=' + encodeURIComponent(filter_date);
    }
    
    var filter_date_modified = $('input[name=\'filter_date_modified\']').val();
    
    if (filter_date_modified) {
      url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
    }
          
    location = url;
}

    $('#form input').keydown(function(e) {
        if (e.keyCode == 13) {
            filter();
        }
    });

    $(document).ready(function() {
      $('.date').datetimepicker({
        pickTime: false
      });
    });
//--></script> 
<?php echo $footer; ?>