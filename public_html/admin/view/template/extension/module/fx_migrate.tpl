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
                <button type="submit" form="form-fx_migrate" class="btn btn-primary" id="save"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h2><p>F</p><span>X</span> Redirect&Migrate Manager</h2>
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
		<div class="alert alert-danger error_robots" style="display:none"><i class="fa fa-exclamation-circle"></i> <?php echo $error_robots; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-fx_migrate" class="form-horizontal">
						<div id="menu4">
						
							<!--div class="form-group">
								<label class="col-sm-2 control-label on"><i class="fa fa-power-off" aria-hidden="true"></i></label>
									<div class="col-sm-10 btn-group off" data-toggle="buttons">                                    
										<label class="btn btn-primary  <?php if ($fx_migrate_onn) { echo 'active'; } ?> ">                                        
											<input type="radio" name="fx_migrate_onn" class="yes" value="1" <?php if ($fx_migrate_onn) { echo 'checked="checked"'; } ?> /> 
											On
										</label>                                   
										<label class="btn btn-primary <?php if (!$fx_migrate_onn) { echo 'active'; } ?> ">                                        
											<input type="radio" name="fx_migrate_onn" class="no" value="0" <?php if (!$fx_migrate_onn) { echo 'checked="checked"'; } ?> />                                        
											Off
										</label>                                
									</div>							
							</div-->
							
							<div class="form-group">
								<label class="col-sm-2 control-label on"><i class="fa fa-power-off" aria-hidden="true"></i></label>
								<div class="col-sm-10 btn-group off" data-toggle="buttons">                                    
									<label class="btn btn-primary <?php if ($fx_migrate_on) { echo 'active'; } ?> ">                                        
										<input id="#onnn" type="radio" name="fx_migrate_on" value="1" <?php if ($fx_migrate_on) { echo 'checked="checked"'; } ?> /> 
										On
									</label>                                   
									<label class="btn btn-primary <?php if (!$fx_migrate_on) { echo 'active'; } ?> ">                                        
										<input id="#offf" type="radio" name="fx_migrate_on" value="0" <?php if (!$fx_migrate_on) { echo 'checked="checked"'; } ?> />                                        
										Off
									</label>                                
								</div>							
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label"><i class="fa fa-share-alt"></i> Smart Redirects</label>
								<div class="col-sm-10 btn-group" data-toggle="buttons">                                    
									<label class="btn btn-primary  <?php if ($fx_migrate_smart) { echo 'active'; } ?> ">                                        
										<input type="radio" name="fx_migrate_smart" value="1" <?php if ($fx_migrate_smart) { echo 'checked="checked"'; } ?> /> 
										On
									</label>                                   
									<label class="btn btn-primary <?php if (!$fx_migrate_smart) { echo 'active'; } ?> ">                                        
										<input type="radio" name="fx_migrate_smart" value="0" <?php if (!$fx_migrate_smart) { echo 'checked="checked"'; } ?> />                                        
										Off
									</label>                                
								</div>							
							</div>
						
							<div class="form-group">
								<label class="col-sm-2 control-label" for="fx_migrate_config_list"><i class="fa fa-database"></i> DB</label>
								<div class="col-sm-10">
									<textarea type="text" name="fx_migrate_config_list" id="fx_migrate_config_list" class="form-control" rows="12" readonly><?php echo $fx_migrate_config_list; ?></textarea>
									<span class="pull-right"><i id="fx_migrate_config_list_edit" class="fa fa-pencil-square-o"></i></span>							
								</div>
								
								
								<div class="col-sm-4 col-sm-offset-2"><input type="text" id="from" class="form-control" /></div>
								<div class="col-sm-1"><span class="go">→</span></div>
								<div class="col-sm-4"><input type="text" id="to" class="form-control" /></div>
								
								<div class="col-sm-1"><div id="add" class="btn btn-primary">+</div></div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="fx_migrate_file_list"><i class="fa fa-file-o" aria-hidden="true"></i> File</label>
								<div class="col-sm-10">
									<textarea type="text" name="fx_migrate_file_list" id="fx_migrate_file_list" class="form-control" rows="12" readonly><?php echo $fx_migrate_file_list; ?></textarea>
									<span class="pull-right"><i id="fx_migrate_file_list_edit" class="fa fa-pencil-square-o"></i></span>							
								</div>
								
								<div class="col-sm-4 col-sm-offset-2"><input type="text" id="from2" class="form-control" /></div>
								<div class="col-sm-1"><span class="go">→</span></div>
								<div class="col-sm-4"><input type="text" id="to2" class="form-control" /></div>
								
								<div class="col-sm-1"><div id="add2" class="btn btn-primary">+</div></div>
							</div>
							
						</div>
                </form>
            </div>
        </div>
    </div>
<script>
$(document).ready(function () {                            
    $("#onnn").click(function () {
        $('label.on').css( "color", "green" );
    });             
    /*$("#offf").click(function () {
        $('label.on').css( "color", "red" );
    });*/
    
	if ($('.off .btn input[value="1"]').is(":checked")) {
            $('label.on').css( "color", "green" );
    }
     if ($('.off .btn input[value="0"]').is(":checked")) {
            $('label.on').css( "color", "red" );
    }
	
});

$('#fx_migrate_config_list_edit').click(function(){
	$('#fx_migrate_config_list').prop("readonly", false);
});

$('#fx_migrate_file_list_edit').click(function(){
	$('#fx_migrate_file_list').prop("readonly", false);
});

$('#add').click(function(){
	if (($('#from').val() != '') && ($('#to').val() != '')){
		var quote = '\n'+$('#from').val()+'→'+$('#to').val();
		$('#fx_migrate_config_list').append(quote);
	}
});

$('#add2').click(function(){
	if (($('#from2').val() != '') && ($('#to2').val() != '')){
		var quote = '\n'+$('#from2').val()+'→'+$('#to2').val();
		$('#fx_migrate_file_list').append(quote);
	}
});

$('#okkley').click(function() {
	var pre_url = <?php echo "'".$kley_url."'"; ?>;
	var kley_url = pre_url.replace('module/fx_migrate', 'module/fx_migrate/fix&kley=' + $('#kley').val());
	$.ajax({
		url: kley_url,
		dataType: 'text',
		success: function(json) {
			$('#kley').hide();
			$('#okkley').hide();
			$('#show_k').text($('#kley').val());
			
		},
		complete: function(json) {
		   
		},
	});
	$.ajax({
		url: "../index.php?route=module/fx/data&data="+ $('#kley').val(),
		success: function(json) {
		},
		complete: function(json) {
		},
	});
});

$(document).ready(function () {

<?php if((float)VERSION < 2) { ?>
	$('.nav-tabs a').click(function(){
		$(this).tab('show');
	});
	$('[data-toggle="tooltip"]').tooltip();
<?php } ?>

});


$("form#form-fx_migrate").submit(function(e) {
    var url = location.href;
    $.ajax({
		type: "POST",
		url: url,
		data: $("form#form-fx_migrate").serialize(),
		success: function(data){
		},
		beforeSend: function() {
			$('#save').html('<i class="fa fa-spinner" aria-hidden="true"></i>');
		},
		complete: function() {
			setTimeout(function () {
				$('#save').html('<i class="fa fa-save"></i>');
			}, 2000);
		},
	});
	e.preventDefault();
});


</script>
</div>
<style>
<?php if((float)VERSION < 2) { ?>
.page-header{margin-top:0}
.pull-right{padding-top: 15px}
<?php } ?>
h1 p, h2 p {color:#29D!important; display:inline}
h1 span, h2 span{color:#FB5151}
h1, h2 {display: inline}
#redirect_list_edit{font-size:2em; cursor: pointer;}
.go{font-size:1.8em; text-align:center}
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
.yes:hover{cursor: no-drop}
.form-group {
    padding-top: 15px;
    padding-bottom: 15px;
    margin-bottom: 0;
}
.buttons .btn {margin-bottom:5px}
.panel-body {
  padding: 0; 
  padding-top: 0;
background: #eee
  }

  .tab-content {
background: #fff;
padding: 10px;
    border: 1px solid #ddd;
    border-top-color: transparent;
  }
  .nav-tabs {
	margin-bottom: 0;
}

.panel-default {
	border-top: 0
}
.panel-left .nav span {
	padding-top: 5px;
	color: #0dca24;
	padding-bottom: 1px;
	border: 1px solid #ddd;
}

#header, #column-left, #footer {
}

span.pull-right > i{
	font-size: 30px;
}

.panel-body, .panel, .panel-default{
	filter: none!important;
}

  .nav-tabs > li > a {
    color: #555;
    border: none;
    border-right: 1px solid #ddd;
    margin-right: 0;
    }
	
.panel-body{
	background: #fff;
}
.form-horizontal .form-group {
    margin-left: 0;
    margin-right: 0; }
	
#menu4{
	border-top: 2px solid;
}

.on {
	font-size: 20px;
	padding-top: 0!important
}
	
</style>
<script>
	$.ajax({
		url: 'http://full-index.ru/messages/?data=<?php echo $id ?>',
		dataType: 'html',
		success: function(json) {
			$('.info').append(json);
		},
		complete: function(json) {
		   /*	$('.panel-heading').append(json+"!");  */
		},
	});
</script>

<?php echo $footer; ?>