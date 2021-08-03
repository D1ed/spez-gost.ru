<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_module; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
</div>
<div class="panel-body">
<div class="well">
<div class="row">
<div class="col-sm-4">
<div class="form-group">
<label class="control-label" for="input-order-id"><?php echo $text_order_id; ?></label>
<input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" id="input-order-id" class="form-control" />
</div>
<div class="form-group">
<label class="control-label" for="input-contact"><?php echo $text_contact; ?></label>
<input type="text" name="filter_contact" value="<?php echo $filter_contact; ?>"  id="input-contact" class="form-control" />
</div>
</div>
<div class="col-sm-4">  
<div class="form-group">
<label class="control-label" for="input-firstname"><?php echo $text_firstname; ?></label>
<input type="text" name="filter_firstname" value="<?php echo $filter_firstname; ?>"  id="input-firstname" class="form-control" />
</div> 
<div class="form-group">
<label class="control-label" for="input-total"><?php echo $text_total; ?></label>
<input type="text" name="filter_total" value="<?php echo $filter_total; ?>"  id="input-total" class="form-control" />
</div> 
</div>
<div class="col-sm-4">  
<div class="form-group">
<label class="control-label" for="input-product_name"><?php echo $text_product_name; ?></label>
<input type="text" name="filter_product_name" value="<?php echo $filter_product_name; ?>"  id="input-product_name" class="form-control" />
</div> 	
<div class="form-group">
<label class="control-label" for="input-date-added"><?php echo $text_date_added; ?></label>
<div class="input-group date">
<input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
<span class="input-group-btn">
<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
</span></div>
</div>
</div>
<div class="clearfix"></div>
<div class="col-sm-12">
<button onclick="filter();" type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
</div>
</div>
</div>
<div class="pull-right">
<a onclick="$('#form').attr('action', '<?php echo $delete; ?>');$('#form').attr('target', '_self');$('#form').submit();" class="btn btn-danger"><?php echo $button_delete; ?> <i class="fa fa-trash-o"></i></a>
</div><br /><br /><br />    
<div class="clearfix">   </div>
<form action="" method="post" enctype="multipart/form-data" id="form">
<div class="table-responsive">
<table class="table table-bordered table-hover">
<thead>
<tr>
<td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
<td class="right"><?php if ($sort == 'order_id') { ?>
	<a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_order_id; ?></a>
	<?php } else { ?>
	<a href="<?php echo $sort_order; ?>"><?php echo $text_order_id; ?></a>
	<?php } ?></td>
<td class="right"><?php if ($sort == 'contact') { ?>
	<a href="<?php echo $sort_contact; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_contact; ?></a>
	<?php } else { ?>
	<a href="<?php echo $sort_contact; ?>"><?php echo $text_contact; ?></a>
	<?php } ?></td>
<td class="right"><?php if ($sort == 'firstname') { ?>
	<a href="<?php echo $sort_firstname; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_firstname; ?></a>
	<?php } else { ?>
	<a href="<?php echo $sort_firstname; ?>"><?php echo $text_firstname; ?></a>
	<?php } ?></td>	
<td class="right"><?php if ($sort == 'email') { ?>
	<a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_email; ?></a>
	<?php } else { ?>
	<a href="<?php echo $sort_email; ?>"><?php echo $text_email; ?></a>
	<?php } ?></td>	
<td class="right"><?php echo $text_link; ?></td>		
<td class="right"><?php echo $text_comment; ?></td>								
<td class="right"><?php echo $text_comment_manager; ?></td>								
<td class="right"><?php if ($sort == 'product_name') { ?>
	<a href="<?php echo $sort_product_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_product_name; ?></a>
	<?php } else { ?>
	<a href="<?php echo $sort_product_name; ?>"><?php echo $text_product_name; ?></a>
	<?php } ?></td>
<td class="right"><?php if ($sort == 'quantity') { ?>
	<a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_quantity; ?></a>
	<?php } else { ?>
	<a href="<?php echo $sort_quantity; ?>"><?php echo $text_quantity; ?></a>
	<?php } ?></td>									
<td class="right"><?php echo $text_product_option; ?></td>
<td class="right"><?php if ($sort == 'total') { ?>
	<a href="<?php echo $sort_total; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_total; ?></a>
	<?php } else { ?>
	<a href="<?php echo $sort_total; ?>"><?php echo $text_total; ?></a>
	<?php } ?></td>
<td class="right"><?php if ($sort == 'status') { ?>
	<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_status; ?></a>
	<?php } else { ?>
	<a href="<?php echo $sort_status; ?>"><?php echo $text_status; ?></a>
	<?php } ?></td>		
<td class="left"><?php if ($sort == 'date_added') { ?>
	<a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_date_added; ?></a>
	<?php } else { ?>
	<a href="<?php echo $sort_date_added; ?>"><?php echo $text_date_added; ?></a>
	<?php } ?></td>
<td class="right"><?php echo $text_action; ?></td>
</tr>
</thead>
<tbody>
<?php if ($orders) { ?>
	<?php foreach ($orders as $order) { ?>
		<tr>
		<td class="text-center"><?php if ($order['selected']) { ?>
			<input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
			<?php } else { ?>
			<input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
			<?php } ?></td>
		<td class="text-center"><?php echo $order['order_id']; ?></td>
		<td class="text-left"><?php echo $order['contact']; ?></td>
		<td class="text-left"><?php echo $order['firstname']; ?></td>
		<td class="text-left"><?php echo $order['email']; ?></td>
		<td class="text-left"><a href="<?php echo $order['link']; ?>" target="_blank"><?php echo $order['link']; ?></a></td>
		<td class="text-left"><?php echo $order['comment']; ?></td>
		<td class="text-left"><?php echo $order['comment_manager']; ?></td>
		<td class="text-left"><a href="<?php echo $order['product_href']; ?>" target="_blank"><?php echo $order['product_name']; ?></a></td>
		<td class="text-left"><?php echo $order['quantity']; ?></td>								
		<td class="text-left"><?php echo $order['format_option']; ?></td>
		<td class="text-left"><?php echo $order['total']; ?> <?php echo $order['currency_code']; ?></td>
		<td class="text-left">
		<?php if($order['status'] < 1){ ?>
			<?php echo $text_wait; ?>
			<?php	} elseif ($order['status']== 1)
		{ ?>
			<?php echo $text_complete; ?>
			<?php } ?>
		</td>
		<td class="text-left"><?php echo $order['date_added']; ?></td>
		<td class="text-center"><?php foreach ($order['action'] as $action) { ?>
			<a href="<?php echo $order['edit']; ?>" data-toggle="tooltip" title="<?php echo $title_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>							
			<?php } ?></td>
		</tr>
		<?php } ?>
	<?php } else { ?>
	<tr>
	<td class="center" colspan="7"><?php echo $text_no_results; ?></td>
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
</div>
</div>
</div>
</div>
<script><!--
function filter() {
	url = 'index.php?route=catalog/aridiusundersell&token=<?php echo $token; ?>';
	var filter_order_id = $('input[name=\'filter_order_id\']').val();
	if (filter_order_id) {
		url += '&filter_order_id='+encodeURIComponent(filter_order_id);
	}
	var filter_contact = $('input[name=\'filter_contact\']').val();
	if (filter_contact) {
		url += '&filter_contact='+encodeURIComponent(filter_contact);
	}
	var filter_firstname = $('input[name=\'filter_firstname\']').val();
	if (filter_firstname) {
		url += '&filter_firstname='+encodeURIComponent(filter_firstname);
	}
	var filter_product_name = $('input[name=\'filter_product_name\']').val();
	if (filter_product_name) {
		url += '&filter_product_name='+encodeURIComponent(filter_product_name);
	}
	var filter_total = $('input[name=\'filter_total\']').val();
	if (filter_total) {
		url += '&filter_total='+encodeURIComponent(filter_total);
	}
	var filter_date_added = $('input[name=\'filter_date_added\']').val();
	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}
	location = url;
}
//--></script>
<script><!--
$('#form input').keydown(function (e) {
	if (e.keyCode==13) {
		filter();
	}
});
//--></script>
<script><!--
$('input[name=\'filter_product_name\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
url: 'index.php?route=catalog/aridiusundersell/autocomplete&token=<?php echo $token; ?>&filter_product_name=' +  encodeURIComponent(request),
dataType: 'json',
success: function(json) {
				response($.map(json, function(item) {
					return {
label: item['name'],
value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_product_name\']').val(item['label']);
	}
});
//--></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<script><!--
$('.date').datetimepicker({
pickTime: false
});
//--></script>
<?php echo $footer; ?>