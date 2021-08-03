<?php if (count($currencies) > 1) { ?>
<div class="pull-left">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
  <div class="open_btn btn-group">
    <button class="serv2_none btn btnh btn-link dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
    <strong><?php echo $currency['symbol_left']; ?></strong>
    <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
    <strong><?php echo $currency['symbol_right']; ?></strong>
    <?php } ?>
    <?php } ?>
    <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_currency; ?></span> <i class="fa fa-caret-down"></i></button>
    <ul class="serv2_pos dropdown-menu">
      <?php foreach ($currencies as $currency) { ?>
      <?php if ($currency['symbol_left']) { ?>
      <li <?php if ($currency['code'] == $code) { echo 'class="active"'; } ?>><button class="currency-select btn btnh btn-link btn-block btn_left" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?> <span class="serv2_none"><?php echo $currency['title']; ?></span></button></li>
      <?php } else { ?>
      <li <?php if ($currency['code'] == $code) { echo 'class="active"'; } ?>><button class="currency-select btn btnh btn-link btn-block btn_left" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?> <span class="serv2_none"><?php echo $currency['title']; ?></span></button></li>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
