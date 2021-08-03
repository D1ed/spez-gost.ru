<?php echo $header; ?>
<?php if((float)VERSION < 2) { ?>
<script   src="https://code.jquery.com/jquery-1.9.1.min.js"   integrity="sha256-wS9gmOZBqsqWxgIVgA8Y9WcQOa7PgSIX+rPA0VL2rbQ="   crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<?php } else { echo $column_left; } ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-seoh1" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-seoh1" class="form-horizontal">
		
		<h2><?php echo $header_1;?></h2>

		
		<div class="form-group">
            <label class="col-sm-3 control-label" for="sortslimits"><span data-toggle="tooltip"><?php echo $entry_sortslimits_default; ?></span></label>
            <div class="col-sm-9">
              <select name="sortslimits_default" id="sortslimits_default" class="form-control">
                <?php if ($sortslimits_default == 'p.sort_order') { ?>
                <option value="p.sort_order" selected="selected"><?php echo $sort_order ?></option>
                <?php } else { ?>
                <option value="p.sort_order"><?php echo $sort_order ?></option>
                <?php } ?>
                <?php if ($sortslimits_default == 'p.product_id') { ?>
                <option value="p.product_id" selected="selected"><?php echo $date_added ?></option>
                <?php } else { ?>
                <option value="p.product_id"><?php echo $date_added ?></option>
                <?php } ?>
				<?php if ($sortslimits_default == 'p.quantity') { ?>
                <option value="p.quantity" selected="selected"><?php echo $quantity; ?></option>
                <?php } else { ?>
                <option value="p.quantity"><?php echo $quantity; ?></option>
                <?php } ?>
				<?php if ($sortslimits_default == 'p.model') { ?>
                <option value="p.model" selected="selected"><?php echo $model; ?></option>
                <?php } else { ?>
                <option value="p.model"><?php echo $model; ?></option>
                <?php } ?>
				<?php if ($sortslimits_default == 'rating') { ?>
                <option value="rating" selected="selected"><?php echo $rating; ?></option>
                <?php } else { ?>
                <option value="rating"><?php echo $rating; ?></option>
                <?php } ?>
				<?php if ($sortslimits_default == 'p.price') { ?>
                <option value="p.price" selected="selected"><?php echo $price; ?></option>
                <?php } else { ?>
				<option value="p.price"><?php echo $price; ?></option>
				<?php } ?>
				<?php if ($sortslimits_default == 'pd.name') { ?>
                <option value="pd.name" selected="selected"><?php echo $name; ?></option>
                <?php } else { ?>
                <option value="pd.name"><?php echo $name; ?></option>
                <?php } ?>
              </select>
            </div>
        </div>
		<div class="form-group">
            <label class="col-sm-3 control-label" for="sortslimits_default2"><span data-toggle="tooltip"><?php echo $entry_sortslimits_default2; ?></span></label>
            <div class="col-sm-9">
              <select name="sortslimits_default2" id="sortslimits_default2" class="form-control">
                <?php if ($sortslimits_default2 == 'DESC') { ?>
                <option value="DESC" selected="selected"><?php echo $desc ?></option>
                <?php } else { ?>
                <option value="DESC"><?php echo $desc ?></option>
                <?php } ?>
				<?php if ($sortslimits_default2 == 'ASC') { ?>
                <option value="ASC" selected="selected"><?php echo $asc; ?></option>
                <?php } else { ?>
                <option value="ASC"><?php echo $asc; ?></option>
                <?php } ?>
              </select>
            </div>
        </div>
		<hr>
		
		<h2><?php echo $header_2;?></h2>		

          <div class="form-group">

			<label class="col-sm-3 control-label"><?php echo $sort_order; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_order_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_order_ASC" value="1" <?php if ($sortslimits_order_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_order_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_order_ASC" value="0" <?php if (!$sortslimits_order_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>	


			<label class="col-sm-3 control-label"><?php echo $name.' ▲'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_name_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_name_ASC" value="1" <?php if ($sortslimits_name_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_name_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_name_ASC" value="0" <?php if (!$sortslimits_name_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>	
			

			<label class="col-sm-3 control-label"><?php echo $name.' ▼'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_name_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_name_DESC" value="1" <?php if ($sortslimits_name_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_name_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_name_DESC" value="0" <?php if (!$sortslimits_name_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>	
			

			<label class="col-sm-3 control-label"><?php echo $price.' ▲'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_price_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_price_ASC" value="1" <?php if ($sortslimits_price_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_price_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_price_ASC" value="0" <?php if (!$sortslimits_price_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>		
			

			<label class="col-sm-3 control-label"><?php echo $price.' ▼'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_price_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_price_DESC" value="1" <?php if ($sortslimits_price_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_price_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_price_DESC" value="0" <?php if (!$sortslimits_price_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>

			<label class="col-sm-3 control-label"><?php echo $rating.' ▲'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_rating_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_rating_ASC" value="1" <?php if ($sortslimits_rating_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_rating_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_rating_ASC" value="0" <?php if (!$sortslimits_rating_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>
			

			<label class="col-sm-3 control-label"><?php echo $rating.' ▼'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_rating_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_rating_DESC" value="1" <?php if ($sortslimits_rating_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_rating_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_rating_DESC" value="0" <?php if (!$sortslimits_rating_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>
			

			<label class="col-sm-3 control-label"><?php echo $model.' ▲'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_model_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_model_ASC" value="1" <?php if ($sortslimits_model_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_model_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_model_ASC" value="0" <?php if (!$sortslimits_model_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>	
			

			<label class="col-sm-3 control-label"><?php echo $model.' ▼'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_model_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_model_DESC" value="1" <?php if ($sortslimits_model_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_model_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_model_DESC" value="0" <?php if (!$sortslimits_model_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>	
			

			<label class="col-sm-3 control-label"><?php echo $quantity.' ▲'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_quantity_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_quantity_ASC" value="1" <?php if ($sortslimits_quantity_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_quantity_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_quantity_ASC" value="0" <?php if (!$sortslimits_quantity_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>	
			

			<label class="col-sm-3 control-label"><?php echo $quantity.' ▼'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_quantity_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_quantity_DESC" value="1" <?php if ($sortslimits_quantity_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_quantity_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_quantity_DESC" value="0" <?php if (!$sortslimits_quantity_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>	
			

			<label class="col-sm-3 control-label"><?php echo $date_added.' ▲'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_date_added_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_date_added_ASC" value="1" <?php if ($sortslimits_date_added_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_date_added_ASC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_date_added_ASC" value="0" <?php if (!$sortslimits_date_added_ASC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>			

			<label class="col-sm-3 control-label"><?php echo $date_added.' ▼'; ?></label>
			<div class="col-sm-9 btn-group" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_date_added_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_date_added_DESC" value="1" <?php if ($sortslimits_date_added_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_date_added_DESC) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_date_added_DESC" value="0" <?php if (!$sortslimits_date_added_DESC) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>
			
          </div>
		
			<div class="form-group">
				<label class="col-sm-3 control-label" for="sortslimits_limits"><?php echo $limits; ?></label>
				<div class="col-sm-9">
				  <input type="text" name="sortslimits_limits" value="<?php echo $sortslimits_limits; ?>" id="sortslimits_limits" class="form-control" />
				</div>
			</div>
			
		<div class="form-group">
		
			<label class="col-sm-3 control-label"><?php echo $hide; ?></label>
			<div class="col-sm-9 btn-group one" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_hide) { echo 'active'; } ?> ">
					<input type="radio" class="yes" name="sortslimits_hide" value="1" <?php if ($sortslimits_hide) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_hide) { echo 'active'; } ?> ">
					<input type="radio" class="no" name="sortslimits_hide" value="0" <?php if (!$sortslimits_hide) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>
			
			<label class="col-sm-3 control-label two"><?php echo $in_stock; ?></label>
			<div class="col-sm-9 btn-group two" data-toggle="buttons">
				<label class="btn btn-primary  <?php if ($sortslimits_in_stock) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_in_stock" value="1" <?php if ($sortslimits_in_stock) { echo 'checked="checked"'; } ?> />
					<?php echo $text_yes; ?>
				</label>
				<label class="btn btn-primary <?php if (!$sortslimits_in_stock) { echo 'active'; } ?> ">
					<input type="radio" name="sortslimits_in_stock" value="0" <?php if (!$sortslimits_in_stock) { echo 'checked="checked"'; } ?> />
					<?php echo $text_no; ?>
				</label>
			</div>
			
            <label class="col-sm-3 control-label"><?php echo $entry_sortslimits_stock_status; ?></label>
			<div class="col-sm-9">
			  <select name="sortslimits_stock_status" id="input-stock-status" class="form-control">
				<?php foreach ($stock_statuses as $stock_status) { ?>
				<?php if ($sortslimits_stock_status == $stock_status['stock_status_id']) { ?>
				<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
				<?php } ?>
				<?php } ?>
			  </select>
			</div>
        </div>

        </form>
      </div>
    </div>
  </div>
</div>
<style>
<?php if((float)VERSION < 2) { ?>
.form-group {
    padding-top: 15px;
    padding-bottom: 15px;
    margin-bottom: 0;
}
#menu{display:none}
.page-header{margin-top:0}
.pull-right{padding-top: 15px}
<?php } ?>
label.control-label span:after {
	color: #000;
	content: none;
	margin-left: 4px;
}
.form-group {
  margin-bottom: 5px;
}
h1 p {color:#29D!important; display:inline}
h1 span{color:#FB5151}
.alert-danger {
  background-color: #FB5151;
  border: none;
  font-size: 1.25em;
  color: #FFF; }
.delborder{border: none!important}
.btn-group > label{padding: 5px 10px;}
.btn-group > label:not(.active){opacity:.5!important;padding: 5px 10px;}
.col-sm-7 > .help-block {margin-bottom: 20px;}
.form-group + .form-group { border-top: 1px solid #ededed; }
.btn-group {margin: 5px 0}
</style>
<script>
$(document).ready(function () {                            
    $(".yes").change(function () {
        if ($(".yes").prop("checked", true) ) {
            $('.two').hide("slow");
        }
    });
    $(".no").change(function () {
        if ($(".no").prop("checked", true) ) {
            $('.two').show("slow");
        }
    });
<?php if ($sortslimits_hide) { ?>
	$('.two').hide();
<?php } ?>
});
</script>
 <?php echo $footer; ?>