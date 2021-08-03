<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
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
      <button type="button" form="form-installtheme" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-exchange"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
	  <button type="submit" form="form-install" data-toggle="tooltip" title="<?php echo $entry_install; ?>" class="btn btn-default"><i class="fa fa-download"></i><?php echo $button_install; ?></button>
	  <button type="submit" form="form-restore" data-toggle="tooltip" title="<?php echo $entry_restore; ?>" class="btn btn-default"><i class="fa fa-refresh"></i><?php echo $button_restore; ?></button>
	  <div style="font-size: 17px;margin-top: 20px;"><?php echo $text_explanations_install; ?></div>
	  <div style="font-size: 17px;margin-top: 20px;"><?php echo $text_explanations_restore; ?></div>
	  <div style="font-size: 17px;margin-top: 20px;color: red;"><?php echo $text_warnings; ?></div>
        <form action="<?php echo $install; ?>" method="post" enctype="multipart/form-data" id="form-install" class="form-horizontal">
        </form>
		<form action="<?php echo $restore; ?>" method="post" enctype="multipart/form-data" id="form-restore" class="form-horizontal">
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
