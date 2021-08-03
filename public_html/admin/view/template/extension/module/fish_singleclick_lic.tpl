<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <?php if (!$error) { ?>
          <button type="submit" form="form-shoputils-lic" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
        <?php } ?>
        <a href="<?php echo $cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a>
      </div>
      <h1><img src="<?php echo $icon; ?>"> <?php echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-shoputils-lic" class="form-horizontal">
          <div class="form-group">
            <div class="col-sm-12">
                <table class="form">
                    <tr>
                        <td colspan="2">
                            <img src="<?php echo $logo; ?>" alt="logo" />
                            <?php if (!$error) { ?>
                                <br /><br /><?php echo $entry_key; ?>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <?php if (!$error) { ?>
                            <td>
                                <textarea rows="13" cols="50" name="lic_data"></textarea>
                            </td>
                        <?php } ?>
                        <td style="vertical-align:top; padding-left:10px;"<?php echo $error ? ' colspan="2"' : ''; ?>>
                            <?php if (!$error) { ?>
                                <?php echo $text_get_key; ?><br /><br />
                                <?php echo $text_domain; ?><br /><br />
                            <?php } ?>
                            <?php if ($loader) { ?>
                                <?php echo $text_loader; ?>
                                <?php if (!$loader_compare) { ?>
                                    <?php echo $text_error; ?><br /><?php echo $error_loader_version; ?>
                                <?php } else { ?>
                                    <?php echo $text_ok; ?>
                                <?php } ?>
                            <?php } else { ?>
                                <?php echo $error_loader; ?>
                            <?php } ?>
                            <br /><br /><?php echo $text_php; ?>
                            <?php if (!$php_compare) { ?>
                                <?php echo $text_error; ?><br /><?php echo $error_php_version; ?>
                            <?php } else { ?>
                                <?php echo $text_ok; ?>
                            <?php } ?>
                        </td>
                    </tr>
                </table>
            </div><!-- </div class="col-sm-12">  -->
          </div><!-- </div class="form-group"> -->
        </form>
      </div><!-- </div class="panel-body"> -->
    </div><!-- </div class="panel panel-default"> -->
  </div><!-- </div class="container-fluid"> -->
</div><!-- </div id="content"> -->
<?php echo $footer; ?>