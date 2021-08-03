<div class="subhead">
    <span class="postauthortop author vcard">
    <?php echo __('by', 'virtue');?>  <span itemprop="author"><a href="<?php echo get_author_posts_url(get_the_author_meta('ID')); ?>" class="fn" rel="author"><u><?php echo get_the_author() ?></u></a>
    <?php $post_category = get_the_category($post->ID); if ( $post_category==true ) { ?>  
    <?php _e('posted in:', 'virtue'); ?> <u><?php the_category(', ') ?></u></span> <?php }?>
    <span class="kad-hidepostedin"></span>
    <div><span class="postauthortop author vcard"><?php echo get_the_date('j'); ?> <?php echo get_the_date('M Y');?></span> 
    |
    <span class="postcommentscount">
    <i class="icon-comments-alt"></i> <?php comments_number( '0', '1', '%' ); ?>
    </span>
    |
    <span class="postcommentscount">
    <i class="icon-eye-open"></i>
<?php echo getPostViews(get_the_ID()); ?>    </span>
	</span>
    </div>
</div>


