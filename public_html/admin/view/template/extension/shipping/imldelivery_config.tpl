<script  type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<style>
input[type="text"], select, input[type="password"]
{
	max-width: 300px;
	display: inline-block !important;
}
.wpce-label
{
	width: 100px;
	display: inline-block;
}

.wpce-label + input
{
	width: 100px;
}

fieldset.fset-pack
{
	padding: 20px;
	width: 400px;
	border: 1px solid gray;
}
fieldset.fset-pack > select
{
	width: 40px;
}

.fs-table
{
	font-size: 13px;
}


.fg-va-center
{
	display: flex;
	align-items: center;
}


.method_name
{
	width: 300px;
}

.fail_price
{
	width: 100px;
}





</style>
<script>
jQuery(document).ready(function($)
{

	function checkCalcType()
	{
		if($('input[name=imldelivery_calcType]:checked').val() == "Таблица")
		{
			$('.mbdisabled').removeAttr("disabled");
		}else {
			$('.mbdisabled').attr('disabled', 'disabled');
		}
	}


	function changePackageCalcType()
	{

		var id = $('input[name="imldelivery_packageCalcType"]:checked').first().attr('id');
		$('.fset-pack').hide();
		$('.spn-lbl').hide();
		if($('.'+id).length)
		{
			$('.'+id).show(); 
		}
	}

	$('input[name="imldelivery_packageCalcType"]').change(function()
	{
		changePackageCalcType();
	});





	$('input[name=imldelivery_calcType]').change(
	                                 function(){
	                                 	checkCalcType();
	                                 }
	                                 );

	checkCalcType();
	changePackageCalcType();
});


</script>

<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
		<div class="page-header">
			<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-free" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
			<h1>IML доставка модуль</h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
			</div>
		</div>
		<div class="container-fluid">
		<?php if(isset($error_warning)) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
			<?php if(isset($success)) { ?>
				<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i><?php echo $success; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
				<?php } ?>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-imldelivery" class="form-horizontal">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"><i class="fa fa-cog"></i> IML доставка модуль</h3>
					</div>
					<div class="panel-body">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#1" data-toggle="tab">Авторизация</a></li>
							<li><a href="#2" data-toggle="tab">Расчет</a></li>
							<li><a href="#7" data-toggle="tab">Методы доставки</a></li>
							<li><a href="#4" data-toggle="tab">Коррекция</a></li>
							<li><a href="#6" data-toggle="tab">Заказ</a></li>
							<!-- <li><a href="#3" data-toggle="tab">Синхронизация статусов</a></li> -->
							<li><a href="#5" data-toggle="tab">Системные</a></li>
						</ul>
						<div class="container tab-content">
						<?php include DIR_APPLICATION . '/view/template/extension/shipping/imldelivery_parts/auth.tpl'; ?>
						<?php include DIR_APPLICATION . '/view/template/extension/shipping/imldelivery_parts/calc.tpl'; ?>
						<?php include DIR_APPLICATION . '/view/template/extension/shipping/imldelivery_parts/methods.tpl'; ?>
						<?php include DIR_APPLICATION . '/view/template/extension/shipping/imldelivery_parts/statuses.tpl'; ?>
						<?php include DIR_APPLICATION . '/view/template/extension/shipping/imldelivery_parts/correction.tpl'; ?>
						<?php include DIR_APPLICATION . '/view/template/extension/shipping/imldelivery_parts/system.tpl'; ?>
						<?php include DIR_APPLICATION . '/view/template/extension/shipping/imldelivery_parts/dict.tpl'; ?>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	


<script>
function filterDigits(e, allowFloat) {
	debugger;
  var code = (e.charCode == 0) ? e.keyCode : e.charCode;
  if (((code != 44 && code != 46) || !allowFloat) && (code < 48 || code > 57)) {
    e.preventDefault();
    return false;
  }
  return true;
  // return false;
}
	
</script>  
  
   



	<?php echo $footer; ?> 