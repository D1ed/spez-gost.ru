<div class="effectb">
<div class="effect-banner">
<div id="banner<?php echo $module; ?>" class="banner-margin">
<?php foreach ($banners as $banner) { ?>
	<div class="item">
	<?php if ($banner['link']) { ?>
		<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive scaleslide" /></a>
		<div class="hover-textbanner">
		<a href="<?php echo $banner['link']; ?>"></a>
		<?php if ($banner['description']) { ?>
		<div class="efhover visible-sm visible-md visible-lg"><?php echo htmlspecialchars_decode($banner['description']);?></div>
		<?php } ?>
		</div>	
		<?php } else { ?>
		<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive scaleslide" />
	<?php if ($banner['description']) { ?>	
		<div class="hover-textbanner">
		<div class="efhover visible-sm visible-md visible-lg"><?php echo htmlspecialchars_decode($banner['description']);?></div>
		</div>	
	<?php } ?>	
		<?php } ?>
	</div>
	<?php } ?>
</div>		
</div>
</div>

