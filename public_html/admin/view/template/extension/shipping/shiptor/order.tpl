<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
	
			<div class="pull-right">
				<a href="<?php echo $module; ?>" class="btn btn-default"><?php echo $text_module_setting; ?></a> 
				<!--<a href="<?php echo $customer; ?>" class="btn btn-default"><?php echo $text_order_customer; ?></a> -->
				<a href="<?php echo $shiptor; ?>" class="btn btn-default"><?php echo $text_order_shiptor; ?></a>
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
		<link rel="stylesheet" href="view/javascript/shipping/shiptor/shiptor.css" rel="stylesheet" />
		<link href="view/javascript/shipping/shiptor/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-editable.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="view/javascript/shipping/shiptor/kladr/css/jquery.kladr.min.css" />

		<script src="view/javascript/shipping/shiptor/datetimepicker/moment.min.js"></script>
		<script src="view/javascript/shipping/shiptor/datetimepicker/ru.min.js"></script>
		<script src="view/javascript/shipping/shiptor/datetimepicker/bootstrap-datetimepicker.min.js"></script>
		<script src="view/javascript/shipping/shiptor/notify.min.js"></script>
		<script src="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-table.min.js"></script>
		<script src="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-table-editable.min.js"></script>
		<script src="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-editable.min.js"></script>
		<script src="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-table-export.min.js"></script>
		<script src="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-export.min.js"></script>
		<script src="view/javascript/shipping/shiptor/bootstrap-table/bootstrap-table-cookie.min.js"></script>
		<script src="view/javascript/shipping/shiptor/kladr/js/jquery.kladr.min.js"></script>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i></h3>
				<div style="float: right;">
					<a href="https://shiptor.ru/help/integration/opencart/opencart-setting#article_7" target="_blank"><?= $text_faq; ?></a>
				</div>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<div id="toolbar">
						<form class="form-inline">
							<div class="bs-bars pull-left">
								<input type="text" name="filter_customer" placeholder="<?php echo $text_filter_customer; ?>" class="form-control" /> 
								<input type="text" name="filter_email" placeholder="<?php echo $text_filter_email; ?>" class="form-control" /> 
								<input type="text" name="filter_telephone" placeholder="<?php echo $text_filter_telephone; ?>" class="form-control" /> 
								<input type="text" name="filter_date_added" placeholder="<?php echo $text_filter_date_added; ?>" class="form-control" id="datetimepicker" data-date-format="YYYY-MM-DD" /> 			
								<select name="filter_order_status" id="input-order-status" class="form-control">
									<option value="*"><?php echo $entry_all_order_status; ?></option>
									<?php foreach ($order_statuses as $order_status) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
									<?php } ?>
								</select>
								<button type="button" class="btn btn-primary sh-filter-button"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
							</div>
						</form>
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
							<div class="modal-content">
							  <div class="modal-header">
								<h4 class="modal-title" align="center" id="myModalLabel">Отправить <?php echo $counts; ?> заказов в Shiptor ?"</h4>
							  </div>
							  <div class="modal-body">
								<div class="form-group">
									<label for="inputDate">Дата отгрузки:</label>
									<input type="text" id="date" value="<?php echo $date; ?>" class="form-control">
								  </div>
								  <div class="form-group">
								   <label>Подтвердить отгрузку автоматически: <input type="checkbox" id="check_sh" value=""></label>
								   </div>
							  </div>
							  <div class="modal-footer">
								<button type="button" id="cancel" class="btn btn-default" data-dismiss="modal">Нет</button>
								<button type="button" id="okay" class="btn btn-primary" data-dismiss="modal">Да</button>
							  </div>
							</div>
						  </div>
						</div>
					</div>
					<table id="table"></table>
				</div>
			</div>
		</div>
	</div>

	<script>
	$('#datetimepicker').datetimepicker({language: 'ru', pickTime: false, icons: {date: "fa fa-calendar", up: "fa fa-arrow-up", down: "fa fa-arrow-down"}});

	var $table = $('#table'), $toolbar = $('#toolbar'), filter_data = {};
	var city_validate = <?php echo $city_valid ?>;
	var page = 1;
	var locationHref = location.href;
	var S = location.search.split('&');
	for (i in S){
		if(S[i].indexOf('page_id')==0){
			page = parseInt(unescape(S[i].split('=')[1]));
			delete S[i];
		}
	}
	locationHref = location.origin+location.pathname+S.join('&')+(typeof(S[S.length-1])!='undefined'?'&':'');
	$table.on('page-change.bs.table',function(e,number, size){
		history.pushState('', '', locationHref+'page_id='+number);
	});
		
	$(function () {
		
		$(document).on('click', '.sh-filter-button', function () {
			var object = $toolbar.find('form').serializeArray();

			filter_data = {}

			$.each(object, function(i, e){
				if (e.value) {
					filter_data[e.name] = encodeURIComponent(e.value);
				}
			});

			$table.bootstrapTable('refresh');
			
			if(filter_data['page'] !== 0 && <?php echo $total; ?> > 10){
				setTimeout(function() { 
					$('button[name=\'refresh\']').trigger('click')
				}, 500);
			}
		});

		$table.bootstrapTable({
			locale: 'ru-RU',
			url: 'index.php?route=extension/shipping/shiptor/order_table&token=<?php echo $token; ?>', 
			queryParams: function (params) {
				filter_data['per_page'] = params.limit;
				filter_data['page'] = params.offset;
				return filter_data;
			},
			idField: 'order_id',
			uniqueId: 'order_id',		
			cache: 0,
			showRefresh: 1,
			showSend: 1,
			showComparisons: 1,
			sendcourier: city_validate,
			showFilter: 1,
			showColumns: 1,
			minimumCountColumns: 3,
			toolbar: '#toolbar',
			toolbarAlign: 'left',
			pageSize: 10,
			pageNumber: page,
			cookie: true,
			cookieIdTable: 'shiptorSaveId',
			cookieExpire: '1y',
			cookiesEnabled: ['bs.table.sortOrder', 'bs.table.sortName', 'bs.table.pageList', 'bs.table.columns', 'bs.table.searchText', 'bs.table.filterControl'],
			pageList: [10, 20, 50],
			pagination: 1,
			sidePagination: 'server',
			iconsPrefix: 'fa',
			icons: { send: 'fa-cogs icon-cogs', sendcourier: 'fa-cogs icon-cogs', refresh: 'fa-refresh icon-refresh', columns: 'fa-table icon-th', export: 'fa-share', comparisons: 'fa-plane icon-plane' },
			rowStyle: function(row, index) {
				if (row.shiptor_id != 0) {
					return {
						classes: 'success'
					};
				}
				return {};
			},
			columns: 
				[{
					title: '<?php echo $column_order_id; ?>', 
					field: 'order_id', valign: 'middle', align:	'center',
					switchable: false
				},{
					title: '<?php echo $column_shiptor_id; ?>', 
					field: 'shiptor_id', valign: 'middle', align:	'center'
				},{
					title: '<?php echo $column_shipment_id; ?>', 
					field: 'shipment_id', valign: 'middle'
				},{
					title: '<?php echo $column_customer; ?>', 
					field: 'customer', valign: 'middle'
				},{
					title: '<?php echo $column_telephone; ?>', 
					field: 'telephone', valign: 'middle',
					editable: {
						clear: true,
						emptytext: '<?php echo $text_not_selected; ?>',
						validate: function(value) {
							if (! isPhone(value)) {
								return '<?php echo $error_is_telephone; ?>';
							}
						},
					}
				},{
					title: '<?php echo $column_email; ?>', 
					field: 'email', valign: 'middle',
					editable: {
						clear: true,
						emptytext: '<?php echo $text_not_selected; ?>',
						validate: function(value) {
							if (! isEmail(value)) {
								return '<?php echo $error_is_email; ?>';
							}
						},
					}
				},{
					title: '<?php echo $column_delivery; ?>', 
					field: 'delivery', valign: 'middle'
				},{
					title: '<?php echo $column_time; ?>', 
					field: 'time', valign: 'middle', 
					editable: {
						type: 'select',
						emptytext: '<?php echo $text_not_selected; ?>',
						source: [
						<?php if ($times){ ?>
							<?php foreach ($times as $key => $time) { ?>
							{ value: '<?php echo $key; ?>', text: '<?php echo $time; ?>' },
							<?php } ?>
						<?php } ?>
						],
						display: function(value, sourceData) {
							var elem = $.grep(sourceData, function(o){ return o.value == value; });

							if (elem.length) {		
								$(this).text(elem[0].text); 
							} else {
								$(this).text(value);
							}
						}
					}
				},{
					title: '<?php echo $column_point_address; ?>', 
					field: 'address', valign: 'middle', width: 250,
				},{
					title: '<?php echo $column_city; ?>', 
					field: 'city', valign: 'middle', width: 250,
				},{
					title: '<?php echo $column_kladr_id; ?>', 
					field: 'kladr_id', valign: 'middle', visible: false,
					editable: {
						clear: true,
						emptytext: '<?php echo $text_not_selected; ?>',
					}
				},{
					title: '<?php echo $column_street; ?>', 
					field: 'street', valign: 'middle', 				
					editable: {
						clear: true,
						emptytext: '<?php echo $text_not_selected; ?>',
						display: function(value) {
							address(value, this);
						}
					}
				},{
					title: '<?php echo $column_house; ?>', 
					field: 'house', valign: 'middle', visible: false, 				
					editable: {
						clear: true,
						emptytext: '<?php echo $text_not_selected; ?>',
						display: function(value) {
							address(value, this);
						}
					}
				},{
					title: '<?php echo $column_apartment; ?>', 
					field: 'apartment', valign: 'middle', visible: false, 				
					editable: {
						clear: true,
						emptytext: '<?php echo $text_not_selected; ?>',
						display: function(value) {
							address(value, this);
						}
					}
				},{
					title: '<?php echo $column_weight; ?>', 
					field: 'weight', valign: 'middle', visible: false,			
					editable: {
						clear: true,
						emptytext: 0,
						validate: function(value) {
							if (! $.isNumeric(value)) {
								return '<?php echo $error_is_numeric; ?>';
							}
						}
					}
				},{
					title: '<?php echo $column_payment; ?>', 
					field: 'payment', valign: 'middle',
				},{
					title: '<?php echo $column_cod; ?>', 
					field: 'total', valign: 'middle',
				},{
					title: '<?php echo $column_status; ?>', 
					field: 'status', valign: 'middle',
					switchable: false
				},{
					title: '<?php echo $column_date_added; ?>', 
					field: 'date_added', valign: 'middle'
				},{
					title: '<?php echo $column_date_shipment; ?>', 
					field: 'date_shipment', valign: 'middle'
				},{
					field: 'action', 
					valign: 'middle', align:	'left', width: 120,
					formatter: function(value, row) {
						html	= '<button type="button" onclick="remove(' + row.order_id + ');" class="btn btn-xs btn-danger"><i class="fa fa-trash-o"></i></button> ';
						html += '<a href="' + row.view + '&return=' + escape(locationHref+'page_id='+parseInt($('.pagination .page-number.active a').text())) + '" class="btn btn-xs btn-info"><i class="fa fa-eye"></i></a> ';
						html += '<a href="' + row.edit + '&return=' + escape(locationHref+'page_id='+parseInt($('.pagination .page-number.active a').text())) + '" class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i></a> ';

						if (row.shiptor_id == 0 && row.canApi==true  && row.date_shipment=='-') {
							html += '<button type="button" onclick="api(' + row.order_id + ');" class="btn btn-xs btn-success"><i class="fa fa-cogs"></i></button>';
						}
						
						if (row.shiptor_id == 0 && row.canApi==true && row.date_shipment!=='-' && row.shiptor_city_delivery!=='') {
							html += '<button type="button" onclick="shipment(' + row.order_id + ');" class="btn btn-xs btn-default"><i class="fa fa-cogs"></i></button>';
						}

						return html;
						
					}
							}]
		}).on('editable-save.bs.table', function (e, field, row) {
			save(field, row);
		});	
	});
	
	function shipment(order_id) {
		$.post('index.php?route=extension/shipping/shiptor/order_table&token=<?php echo $token; ?>', { type: 'shipment', order_id: order_id }).done(function(json) {
			if (json.success) {
				$.notify(json.success, 'success');
				$table.bootstrapTable('refresh');
			}
			if (json.error) {
				$.each(json.error, function(key, value) {
					$.notify(value, 'error');
				});
			}
		});
	}

	function save(field, row) {
		var data = {};

		data['type']		 = 'save';
		data['order_id'] = row.order_id;
		data[field]			= row[field];

		$.post('index.php?route=extension/shipping/shiptor/order_table&token=<?php echo $token; ?>', data).done(function(json) {
			if (json.success) {
				$.notify(json.success, 'success');
				$table.bootstrapTable('refresh');
			}
		});
	}
	
	function comparisons() {
		$('#comparisons').button('loading');
		if (confirm('"Обновить статусы Shiptor ?"')) {
			$.post('index.php?route=extension/shipping/shiptor/comparisons&token=<?php echo $token; ?>', { type : 'status' }).done(function(json) {
				if (json.success) {
					$.notify(json.success, 'success');
					$('#comparisons').button('reset');
					$table.bootstrapTable('refresh');
				}
				if (json.error) {
					$.each(json.error, function(key, value) {
						$.notify(value, 'error');
						$('#comparisons').button('reset');
					});
				}
			});
		}else{
			$('#comparisons').button('reset');
		}
	}
	
	function sendtoshiptor() {
		$.post('index.php?route=extension/shipping/shiptor/shiptor_orders&token=<?php echo $token; ?>', { type: 'send' }).done(function(json) {
			$('#sendtoshiptor').button('loading');
			if (json.orders.length !== 0) {
				if (confirm('"Отправить ' + json.orders.length +  ' заказов в Shiptor ?"')) {
					for (var key in json.orders) {
						$.post('index.php?route=extension/shipping/shiptor/send_to_shiptor&token=<?php echo $token; ?>', { order_id : json.orders[key].order_id }).done(function(json) {
							if (json.success) {
								$.notify(json.success, 'success');
								$table.bootstrapTable('refresh');
								$('#sendtoshiptor').button('reset');
							}

							if (json.error) {
								$.each(json.error, function(key, value) {
									$.notify(value, 'error');
									$('#sendtoshiptor').button('reset');
								});
							}
						});
					}
				}else{
					$('#sendtoshiptor').button('reset');
				}
			}else if(json.error) {
				$('#sendtoshiptor').button('reset');
				$.each(json.error, function(key, value) {
					$.notify(value, 'error');
				});
			}
		});
	}
	
	function sendcourier() {
		$.post('index.php?route=extension/shipping/shiptor/shiptor_orders_courier&token=<?php echo $token; ?>', { type: 'send' }).done(function(json) {
			$('#sendcourier').button('loading');
			if (json.orders.length !== 0) {
				
					$(document).ready(function() {
					$("#myModal").modal('show');
					});
					
					var todayDate = new Date().getDate();
					
					$('#date').datetimepicker(
						{format: 'DD.MM.YYYY ', 
						pickTime: false,
						defaultDate: json.date,
						minDate: new Date(new Date().setDate(todayDate + 1)),
						maxDate: new Date(json.date_shipment),
						//daysOfWeekDisabled: [0,6],
						disabledDates: json.days,
						locale: 'ru'}
					);
					
					$('#cancel').on('click', function() {
						//alert($('#check_sh').is(':checked'));
						$('#sendcourier').button('reset');
						
					});
					
					$('#okay').on('click', function() {
						if($('#check_sh').is(':checked') == true){
							var check_sh = 'yes';
						}else{
							var check_sh = 'no';
						}
						var date_reload = $('#date').val();
						for (var key in json.orders_group) {
							$.post('index.php?route=extension/shipping/shiptor/send_to_shiptor_courier&token=<?php echo $token; ?>', { check_sh: check_sh, date: date_reload, key : key, orders: json.orders_group[key] }).done(function(json) {
								if (json.success) {
									$.notify(json.success, 'success');
									$table.bootstrapTable('refresh');
									$('#sendcourier').button('reset');
								}

								if (json.error) {
									$.each(json.error, function(key, value) {
										$.notify(value, 'error');
										$('#sendcourier').button('reset');
									});
								}
							});
						}
					});
			}else if(json.error) {
				$('#sendcourier').button('reset');
				$.each(json.error, function(key, value) {
					$.notify(value, 'error');
				});
			}
		});
	}
	
	function remove(order_id) {
		$.post('index.php?route=extension/shipping/shiptor/shiptor_status&token=<?php echo $token; ?>', { type: 'status', order_id: order_id }).done(function(json) {
			if (json.status) {
				if(json.status == 'new'){
					if (confirm('"Вы уверены? При использовании услуги фуллфилмента заказ будет удален в Shiptor"')) {
						$.post('index.php?route=extension/shipping/shiptor/order_table&token=<?php echo $token; ?>', { shiptor_status: 'new', type: 'remove', order_id: order_id }).done(function(json) {
							if (json.success) {
								$.notify(json.success, 'success');
								$table.bootstrapTable('removeByUniqueId', order_id);
							}
						});
					}
				}else if(json.status == 'old'){
					if (confirm('"Вы уверены? Заказ НЕ будет удален в Shiptor"')) {
						$.post('index.php?route=extension/shipping/shiptor/order_table&token=<?php echo $token; ?>', { shiptor_status: 'old', type: 'remove', order_id: order_id }).done(function(json) {
							if (json.success) {
								$.notify(json.success, 'success');
								$table.bootstrapTable('removeByUniqueId', order_id);
							}
						});
					}
				}else if(json.status == 'none'){
					if (confirm('"Вы уверены?"')) {
						$.post('index.php?route=extension/shipping/shiptor/order_table&token=<?php echo $token; ?>', { shiptor_status: 'none', type: 'remove', order_id: order_id }).done(function(json) {
							if (json.success) {
								$.notify(json.success, 'success');
								$table.bootstrapTable('removeByUniqueId', order_id);
							}
						});
					}
				}
			}	
		});
	}

	function api(order_id) {	
		$.post('index.php?route=extension/shipping/shiptor/order_table&token=<?php echo $token; ?>', { type: 'shiptor', order_id: order_id }).done(function(json) {
			if (json.success) {
				$.notify(json.success, 'success');
				$table.bootstrapTable('refresh');
			}

			if (json.error) {
				$.each(json.error, function(key, value) {
					$.notify(value, 'error');
				});
			}
		});
	}

	function address(value, self) {
		var order_id = $(self).data('pk'), row = $.grep($('#table').bootstrapTable('getData'), function(e){
			return e.order_id == order_id;
		})[0];

		if ((typeof row.point_id == 'undefined') || (row.point_id === 0)) {
			$(self).text(value);
		} else {
			$(self).remove();
		}
	}

	function isPhone(a){var b=new RegExp(/^(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)?$/);return b.exec(a)}
	function isEmail(a){var b=new RegExp(/^[-0-9a-z_\.]+@[-0-9a-z^\.]+\.[a-z]{2,4}$/i);return b.exec(a)}

	$('[name="filter_customer"]').autocomplete({source:function(a,b){$.ajax({url:"index.php?route=customer/customer/autocomplete&token=<?php echo $token; ?>&filter_name="+encodeURIComponent(a),dataType:"json",success:function(a){b($.map(a,function(a){return{label:a.name,value:a.customer_id}}))}})},select:function(a){$('[name="filter_customer"]').val(a.label)}});

	$(document).on("click",'[data-name="kladr_id"]',function(){var a=$(this).closest("td").find(".editable-input input");a.kladr({type:$.kladr.type.city,withParents:!0,select:function(b){a.val(b.id.substr(0,11))},labelFormat:function(a,b){var c="",d=a.name.toLowerCase();b=b.name.toLowerCase();var e=d.indexOf(b);if(e=e>0?e:0,a.typeShort&&(c+=a.typeShort+". "),b.length<a.name.length?(c+=a.name.substr(0,e),c+="<strong>"+a.name.substr(e,b.length)+"</strong>",c+=a.name.substr(e+b.length,a.name.length-b.length-e)):c+="<strong>"+a.name+"</strong>",a.parents)for(var f=a.parents.length-1;f>-1;f--){var g=a.parents[f];g.name&&(c&&(c+="<small>, </small>"),c+="<small>"+g.name+" "+g.typeShort+".</small>")}return c}})});
	</script>
</div>
<?php echo $footer; ?>
