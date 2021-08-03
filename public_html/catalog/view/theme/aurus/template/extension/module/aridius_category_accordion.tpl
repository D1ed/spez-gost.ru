<div class="box">
<div class="title-module"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-category">
      <ul class="accordion"  id="accordion">
        <?php foreach ($categories as $category) { ?>
        <li>
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"> <?php echo $category['name']; ?></a><div class="dcjq-icon">&nbsp;&nbsp;&nbsp;</div>
          <?php } else if($category['children']) { ?>
          <a href="<?php echo $category['href']; ?>"> <?php echo $category['name']; ?></a><div class="dcjq-icon">&nbsp;&nbsp;&nbsp;</div>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"> <?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <ul>
            <?php foreach ($category['children'] as $child) { ?>
            <li>
              <?php if ($child['category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="active"> <?php echo $child['name']; ?></a><div class="dcjq-icon">&nbsp;&nbsp;&nbsp;</div>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"> <?php echo $child['name']; ?></a><div class="dcjq-icon">&nbsp;&nbsp;&nbsp;</div>
              <?php } ?>
<!--3lv-->	
				  <?php if($child['sister_id'])  { ?> 
				<ul>
					<?php foreach ($child['sister_id'] as $sisters) { ?>
						<li>
						<?php if ($sisters['category_id'] == $sisters_id) { ?>
						<a href="<?php echo $sisters['href']; ?>" class="active"> - <?php echo $sisters['name']; ?></a>
						<?php } else { ?>
						<a href="<?php echo $sisters['href']; ?>"> - <?php echo $sisters['name']; ?></a>
						<?php } ?>
						</li>
					<?php } ?>
				</ul>
				<?php } ?>
<!--3lv-->				
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
		<?php if ($aurus_link_special) { ?>
   <li> <hr /></li>
<?php } ?>
<?php if ($aurus_link_special) { ?>		
<li class ="menu_special"><a href="<?php echo $aurus_link_special; ?>"><?php echo $aurus_menu_special[$language_id];?></a></li>	
<?php } ?>
      </ul>
    </div>
  </div>
</div>
<script>
$(document).ready(function($){
	$('#accordion').dcAccordion({
		eventType: 'click',
	});
});
</script>