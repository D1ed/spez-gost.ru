<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
		<div class="page-header">
			<div class="container-fluid">
			<h1>IML доставка модуль</h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
			</div>
		</div>
  <div class="container-fluid">
  		<?php if ($error_warning): ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning ?><button type="button" class="close" data-dismiss="alert"></button></div>
		<?php endif; ?>
		<?php if ($success): ?>
			<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i><?php echo $success ?><button type="button" class="close" data-dismiss="alert"></button></div>
		<?php endif; ?>
		<div class="panel panel-default">
			<div class="panel-heading" style="display: none;">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title ?></h3>
			</div>
			<div class="panel-body">
				<div class="form-group row">
					<form action="<?php echo $HTTPS_SERVER ?>index.php?route=extension/shipping/imldelivery/menuindex"  method="get">
						<div class="col-md-3">
							<input type="hidden" value="extension/shipping/imldelivery/menuindex" name="route">
							<input type="hidden" value="<?php echo $token ?>" name="token">
						</div>
						<div class="col-md-3">
							<select class="form-control" id="filter_key" name="filter_key">
								<option value="order_id"
								<?php if(is_null($filter_key)  || $filter_key == 'order_id'): ?> 
									selected)
								<?php endif; ?>
								>	<?php echo $text_iml_order_id ?></option>
								<option value="order_iml_status_name"
								<?php if($filter_key == 'order_iml_status_name'): ?> 
									selected
								<?php endif; ?>
								> <?php echo $text_iml_order_status ?></option>
								<option value="iml_order_fio"
								<?php if($filter_key == 'iml_order_fio'): ?> 
									selected
								<?php endif; ?>><?php echo $text_iml_order_fio ?></option>
							</select>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control" id="filter_value" name="filter_value" 
							<?php if(!is_null($filter_value)): ?> 
								value="<?php echo $filter_value ?>"
							<?php endif; ?> 
							/>
						</div>
						<div class="col-md-3">
							<button class="btn btn-primary btn-lg" style="line-height: 1;" id="" type="submit">Фильтр</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-danger btn-lg do_reset"
							<?php if (is_null($filter_value)): ?> 
							 disabled
							<?php endif; ?> style="line-height: 1;">Сброс</button>
						</div>
					</form>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<!-- <td class="text-left">
									&nbsp;
								</td> -->
								<td class="text-left">
									<a href="<?php echo $links['order_id']['nextlink'] ?>" <?php echo $links['order_id']['class'] ?>>
											№ заказа
									</a>
								</td>
								<td class="text-left">
									<a href="<?php echo $links['shipping_firstname']['nextlink'] ?>" <?php echo $links['shipping_firstname']['class'] ?>>
										Покупатель
									</a>
								</td>
								<td class="text-left">
									<a href="<?php echo $links['date_create']['nextlink'] ?>" <?php echo $links['date_create']['class'] ?> >
										Дата создания
									</a>
								</td>
								<td class="text-left">
									<a href="<?php echo $links['date_modified']['nextlink'] ?>" <?php echo $links['date_modified']['class'] ?> >
										Дата изменения
								  </a>
	  							</td>
								<td class="text-left">
									<a href="<?php echo $links['order_iml_status_name']['nextlink'] ?>" <?php echo $links['order_iml_status_name']['class'] ?> >
										Статус IML заявки
									</a>
								</td>
								<td class="text-left">
									<a href="<?php echo $links['order_status_name']['nextlink'] ?>" <?php echo $links['order_status_name']['class'] ?> >
										Статус заказа
									</a>
								</td>
								<td class="text-center"><?php echo $text_iml_order_actions ?></td>
							</tr>
						</thead>
						<tbody>
							<?php foreach($orders as $order): ?>
								<tr>
									<td class="text-left">
										<?php echo $order['order_id'] ?>
									</td>
									<td class="text-left">
											<?php echo $order['purchaser'] ?> 
									</td>
									<td class="text-left">
											<?php echo $order['date_added'] ?>
									</td>
									<td class="text-left">
											<?php echo $order['date_modified'] ?>
									</td>
									<td class="text-left">
											<?php echo $order['order_iml_status_name'] ?>
									</td>
									<td class="text-left">
											<?php echo $order['order_status_name'] ?>
									</td>
									<td class="text-center">
										<a class="btn btn-warning openorder" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i>" data-order_id="<?php echo $order['order_id'] ?>" data-original-title="<?php echo $text_iml_send_order ?>" href="<?php echo HTTPS_SERVER ?>index.php?route=extension/shipping/imldelivery/orderindex&token=<?php echo $token ?>&order_id=<?php echo $order['order_id'] ?>">
											<i class="fa fa-truck" ></i>
										</a>
									</td>
								</tr>
							<?php endforeach; ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
  </div>
<div class="IML_menu_popup">
	<div class="IML_menu_popup_inside">
			<div id='IML_title'>
				<div id='IML_logoPlace' style="background-position: 10px 5px;"></div>
				<div class='IML_mark'>
					<div id="IML_closer"></div>
				</div>
				<div style='float:none;clear:both'></div>
			</div>
		<div class="pure-g">
		</div>
	</div>
</div>
</div>

  
<script>
var ajaxToken = '<?php echo $token ?>';
var HTTPS_SERVER = '<?php echo HTTPS_SERVER ?>';
</script>
  
  


<script>
$(document).ready(function()
{
	
	$('.do_reset').click(function(e)
	{
		e.preventDefault();
		location.href = `${HTTPS_SERVER}index.php?route=extension/shipping/imldelivery/menuindex&token=${ajaxToken}`;
	});
});
	
</script>  
  
   

  
  
<?php echo $footer; ?> 