<ul class="line_cat">
<?php foreach ($categories as $category) { ?>
<li><a class="cat_footer" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
<?php } ?>
</ul>