<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
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
                <h3 class="panel-title"><?php echo $text_edit; ?></h3>
            </div>
			
<div class="col-sm-12" style="position: relative; text-align: center; font-size: 15px;">
<?php echo $license_info; ?>
<?php
echo $_SERVER['SERVER_NAME'];
?><br /><br />
</div>
			
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-slideshow" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $license_code_name; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="license_code" value="<?php echo $license_code; ?>" placeholder="<?php echo $license_code_name; ?>" id="input-license_code" class="form-control" />
                            <?php if ($error_license_code) { ?>
                            <div class="text-danger"><?php echo $error_license_code; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="col-sm-offset-2">
                        <button type="submit" class="btn btn-default"><?php echo $button_license_check; ?></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>