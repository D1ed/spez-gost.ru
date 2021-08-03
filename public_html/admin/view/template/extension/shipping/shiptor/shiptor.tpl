<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<a href="<?php echo $module; ?>" class="btn btn-default"><?php echo $text_module_setting; ?></a> 
				<!--<a href="<?php echo $customer; ?>" class="btn btn-default"><?php echo $text_order_customer; ?></a> -->
				<a href="<?php echo $order; ?>" class="btn btn-default"><?php echo $text_order_store; ?></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<?php if (!empty($breadcrumb['separator'])) : ?>
						<li><?php echo $breadcrumb['separator']; ?></li>
					<?php endif; ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i></h3>
				<div style="float: right;">
					<a href="https://shiptor.ru/help/integration/opencart/opencart-setting#article_8" target="_blank"><?= $text_faq; ?></a>
				</div>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<div id="toolbar">
						<div class="form-inline" role="form">
							<div class="form-group">
								<select name="filter" class="form-control">
									<option value="">Показать все</option>
									<option value="delivered">Не показывать доставленные</option>
									<option value="returned">Не показывать возвратные</option>
								</select>			
							</div>
						</div>
					</div>
					<table id="table"></table>
				</div>
			</div>
		</div>
	</div>

	<!-- HTML-код модального окна-->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body"></div>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="view/javascript/shipping/shiptor/shiptor.css" rel="stylesheet" />
	<link rel="stylesheet" href="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" />
	<script src="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-table.min.js"></script>
	<script src="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-table-export.min.js"></script>
	<script src="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-export.min.js"></script>

	<script>
	function PrintPreview() {
		
		var checkboxes = document.getElementsByClassName('chckbx');
		var checkboxesChecked = []; // можно в массиве их хранить, если нужно использовать
		
		if($(".chckbx").prop('checked')){
			printWindow = window.open("", "", "location=1,status=1,fullscreen=yes,scrollbars=1,width=800,height=680");
			printWindow.document.write('<html><head>');
			printWindow.document.write('<style type="text/css">@media print{.no-print, .no-print *{display: none !important;}</style>');
			printWindow.document.write('</head><body>');
			
			for (var index = 0; index < checkboxes.length; index++) {
				if (checkboxes[index].checked) {
					if(checkboxes[index].value){
						printWindow.document.write('<img width="400" height="340" src="' + checkboxes[index].value + '" alt="" title="">');
					}
				}
			}
			
			printWindow.document.write('</body></html>');
			
			printWindow.document.close();
			printWindow.focus();
			
			printWindow.window.onload = function(){
				printWindow.print();
				
				printWindow.window.close();
			}		
		}else{
			alert('Вы не выбрали наклейки для печати!');
		}
	}

	function CheckAll() {
		$('.chckbx').trigger('click');
	}
	
	var $table = $('#table'), $toolbar = $('#toolbar'), filter_data = {};

	$(function () {
		var filter = '';

		$toolbar.find('select').change(function () {
			filter_data[$(this).attr('name')] = $(this).val();		
			$table.bootstrapTable('refresh');
		});

		$table.bootstrapTable({
			locale: 'ru-RU',
			url: 'index.php?route=extension/shipping/shiptor/shiptor_table&token=<?php echo $token; ?>', 
			queryParams: function (params) {
				filter_data['per_page'] = params.limit;
				filter_data['page'] = params.offset;

				return filter_data;
			},
			idField: 'shiptor_id',
			uniqueId: 'shiptor_id',
			cache: 0,
			showPrint: 1,
			showRefresh: 1,
			showFilter: 1,
			showColumns: 1,
			minimumCountColumns: 3,
			toolbar: '#toolbar',
			toolbarAlign: 'left',
			pageSize: 10,
			pageList: [10, 20, 50],
			pagination: 1,
			sidePagination: 'server',
			iconsPrefix: 'fa',
					icons: { refresh: 'fa-refresh icon-refresh', print: 'fa-print icon-print', columns: 'fa-table icon-th' },
			columns: 
				[{
					title: '<a href="javascript:" onclick="CheckAll();">check all</a>', 
					field: 'label_url', align:	'center', valign: 'middle', 
					formatter: function (value, i) { 
						return '<input type="checkbox" class="chckbx" value="' + value + '">' 
						}
				},{
					title: '<?php echo $column_shiptor_id; ?>', 
					field: 'shiptor_id', valign: 'middle', align:	'center'
				},{
					title: '<?php echo $column_shipment_id; ?>', 
					field: 'shipment_id', valign: 'middle', align:	'center', visible: false,
				},{
					title: '<?php echo $column_order_id; ?>', 
					field: 'order', valign: 'middle', align:	'center', 
					formatter: function (value, i) { 
						return '<a target="_blank" href="' + value.href + '">' + value.order_id + '</a>' 
					}
				},{
					title: '<?php echo $column_status; ?>', 
					field: 'status', valign: 'middle', align:	'center',
					formatter: function (value) {
						if (value == 'new') {
							return '<span class="label label-success" style="font-size: 95%; font-weight: normal; line-height: none;">' +	value + '</span>';
						} else if (value == 'removed') {
							return '<span class="label label-danger" style="font-size: 95%; font-weight: normal; line-height: none;">' +	value + '</span>';
						} else {
							return '<span class="label label-primary" style="font-size: 95%; font-weight: normal; line-height: none;">' +	value + '</span>';
						}
					}
				},{
					title: '<?php echo $column_label; ?>', 
					field: 'label_url', align:	'center', valign: 'middle', 
					formatter: function (value, i) { 
						return '<img class="shiptor-label" style="cursor: pointer;" src="' + value + '" title="' + i.name + '" width="100" height="100">' 
						}
				},{
					title: '<?php echo $column_customer; ?>', 
					field: 'name', valign: 'middle', align:	'left', 
					formatter: function (value, i) { 
						html	= '<p>' + value + '</p>';
						html += '<p>' + i.phone + '</p>';
						html += '<p>' + i.email + '</p>';

						return html
					}
				},{
					title: '<?php echo $column_delivery; ?>', 
					field: 'shipping_method', align:	'left', valign: 'middle'
				},{
					title: '<?php echo $column_time; ?>',
					field: 'delivery_time', valign: 'middle', align:	'center'
				},{
					title: '<?php echo $column_address; ?>',
					field: 'address', valign: 'middle', align:	'left'
				},{
					title:	'<?php echo $column_tracking; ?>',
					field:	'tracking', valign: 'middle', align:	'center', 
					formatter: function (value, i) { 
						return '<a target="_blank" href="https://shiptor.ru/tracking?tracking=' + value + '">' + value + '</a>' 
					}
				},{
					title: '<?php echo $column_external_tracking_number; ?>',
					field: 'external_t_n', valign: 'middle', align:	'left'
				},{
					title:	'<?php echo $column_weight; ?>', visible: false,
					field:	'weight', valign: 'middle', align:	'center'
				},{
					title:	'<?php echo $column_limits; ?>',
					field:	'limits', valign: 'middle', align:	'left',  visible: false,
					formatter: function (value, i) { 
						html = '';

						if (value) {
							if (value.max_weight) {
								html += '<p>' + value.max_weight.value + ' ' + value.max_weight.unit + '</p>';
							}

							if (value.max_dimensions) {
								if (value.max_dimensions.length && value.max_dimensions.width && value.max_dimensions.height) {
									html += '<p>' + value.max_dimensions.length + 'x' + value.max_dimensions.width + 'x' + value.max_dimensions.height + ' ' + value.max_dimensions.unit + '</p>';
								}
							}				
						}

						return html;
					}
				},{
					title:	'<?php echo $column_cod; ?>',
					field:	'cod', valign: 'middle', align:	'center'
				},{
					title: '<?php echo $column_date_shipment; ?>', 
					field: 'date', valign: 'middle', align:	'center', visible: false,
				},{
					title: '<?php echo $column_confirmed; ?>', visible: false,
					field: 'confirmed', valign: 'middle', align:	'center', 
				},{
					title:	'<?php echo $column_checkpoints; ?>',
					field:	'checkpoints', valign: 'middle', align:	'left', 
					formatter: function (value, i) { 
						html = '';
						if (value) {						
							$.each(value, function(i, e){
								html += '<p>' + e.date + '</p>';
								html += '<p><span class="label label-primary">' + e.message + '</span></p>';
							});						
						}

						return html;
					}
				},{
					title:	'<?php echo $column_problems; ?>',
					field:	'problems', valign: 'middle', align: 'left', visible: false,
					formatter: function (value, i) { 
						html = '';
						if (value) {						
							$.each(value, function(i, e){
								html += '<p>' + e.created_at + '</p>';
								html += '<p><span class="label label-primary">' + e.name + '</span></p>';

							});						
						}

						return html;
					}
				},{
					title:	'<?php echo $column_history; ?>',
					field:	'history', valign: 'middle', align:	'left', 
					formatter: function (value, i) { 
						html = '';

						if (value) {						
							$.each(value, function(i, e){
								html += '<p>' + e.date + '</p>';
								if (e.event == 'Посылка создана') {
									html += '<p><span class="label label-success">' + e.event + '</span></p>';
								} else {
									html += '<p><span class="label label-primary">' + e.event + '</span></p>';
								}

							});						
						}

						return html;
					}
				}]
		});
	});

		$(document).on('click', '.shiptor-label', function() {
		var modal = $('#modal');

		modal.find('.modal-body').html('<img src="' + $(this).attr('src') + '" alt="" title=""/>');
			modal.modal('show');
		});
	</script>
</div>
<?php echo $footer; ?>
