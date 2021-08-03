<!-- Echo reviews -->
<?php if ($reviews) { ?>
	<div id="reviewst">
	<?php foreach ($reviews as $review) { ?>
		<table class="table table-striped table-bordered">
		<tr>
		<td style="width: 50%;"><strong><?php echo $review['author']; ?></strong></td>
		<td class="text-right"><?php echo $review['date_added']; ?></td>
		</tr>
		<tr>
		<td colspan="2"><p><?php echo $review['text']; ?></p>
		<?php if ($aridius_news_display_answer_button !=1) { ?>
		<a data-parent="<?php echo $review['review_id']; ?>" class="comment-reply" href="javascript:void(0);"><?php echo $text_write_reply; ?></a>
		<?php } ?>
		</td>
		</tr>
		</table>
	<?php if ($review['parent_id']) { ?>	
		<?php foreach ($review['parent_id'] as $parent) { ?>
			<table style = "width: 95%;float: right;" class="table table-striped table-bordered"> 
			<tr>
			<td style="width: 50%;"><strong><?php echo $parent['author']; ?></strong></td>
			<td class="text-right"><?php echo $parent['date_added']; ?></td>
			</tr>
			<tr>
			<td colspan="2">
			<div class="review-parent-text">
			<p><?php echo $parent['text']; ?></p>
			</div>
			</td>
			</tr>
			</table>
			<?php } ?>
	<?php } ?>		
		<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>