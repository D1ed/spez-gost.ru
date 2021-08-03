<?php echo $header; ?>
<div class="container" >
<div class="row">
<div id="cont">
<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-9'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?>
<div id="content" class="<?php echo $class; ?>">
<?php echo $content_top; ?>
<ul class="breadcrumb tab_mob_child" itemscope itemtype="http://schema.org/BreadcrumbList">
   <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
   <?php if($i==0) { ?>
   <li class="tab_mob_grandchild"><a href="<?php echo $breadcrumb['href']; ?>" class="current-link"><?php echo $breadcrumb['text'];?></a></li>
   <?php } else if($i+1<count($breadcrumbs)) { ?>
   <li class="tab_mob_grandchild" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
      <a href="<?php echo $breadcrumb['href']; ?>" itemprop="item" itemscope itemtype="https://schema.org/Thing" itemid="<?php echo $breadcrumb['href']; ?>" title="<?php echo $breadcrumb['text'];?>"><span itemprop="name"> <?php echo $breadcrumb['text'];?></span></a>
      <meta itemprop="position" content="<?php echo $i; ?>">
   </li>
   <?php } else { ?>
   <li class="tab_mob_grandchild" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
      <span itemprop="item" itemscope itemtype="https://schema.org/Thing" itemid="<?php echo $breadcrumb['href']; ?>" title="<?php echo $breadcrumb['text'];?>"><span itemprop="name"> <?php echo $breadcrumb['text'];?></span></span>
      <meta itemprop="position" content="<?php echo $i; ?>">
   </li>
   <?php } ?>
   <?php } ?>
</ul>
<h1><?php echo $heading_title; ?></h1>
<br />
<?php if ($aurus_description_pg1 !=1) { ?>
<?php if ($page == 1)  { ?>
<?php if ($aurus_description_top_or_bot !=1) { ?>
<?php if ($thumb || $description) { ?>
<div class="row desc-cat_top">
<?php if ($thumb && !$aurus_categories_img) { ?>
<div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
<?php } ?>
<?php if ($description) { ?>
<?php if ($aurus_description_length !=1 && strlen($description) > $aurus_categories_limit ) {
   if ($thumb && $aurus_categories_img !=1) { ?>
<div class="cat_desc col-sm-10">
<?php } else { ?>
<div class="cat_desc col-sm-12">
   <?php } ?>
   <div class="block_desc">
      <?php echo $description; ?>
   </div>
   <a class="button_sh"><?php echo $text_show_desc; ?></a>
</div>
<?php } else {
   if ($thumb && $aurus_categories_img !=1) { ?>
<div class="cat_desc col-sm-10">
   <?php } else { ?>
   <div class="cat_desc col-sm-12"><?php } ?><?php echo $description; ?></div>
   <?php } ?>
   <?php } ?>
</div>
<?php } ?>
<?php } ?>
<?php } ?>
<?php } else { ?>
<?php if ($aurus_description_top_or_bot !=1) { ?>
<?php if ($thumb || $description) { ?>
<div class="row desc-cat_top">
<?php if ($thumb && !$aurus_categories_img) { ?>
<div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
<?php } ?>
<?php if ($description) { ?>
<?php if ($aurus_description_length !=1 && strlen($description) > $aurus_categories_limit ) {
   if ($thumb && $aurus_categories_img !=1) { ?>
<div class="cat_desc col-sm-10">
<?php } else { ?>
<div class="cat_desc col-sm-12">
   <?php } ?>
   <div class="block_desc">
      <?php echo $description; ?>
   </div>
   <a class="button_sh"><?php echo $text_show_desc; ?></a>
</div>
<?php } else {
   if ($thumb && $aurus_categories_img !=1) { ?>
<div class="cat_desc col-sm-10">
   <?php } else { ?>
   <div class="cat_desc col-sm-12"><?php } ?><?php echo $description; ?></div>
   <?php } ?>
   <?php } ?>
</div>
<?php } ?>
<?php } ?>
<?php } ?>
<?php if ($categories && $aurus_categories_2lvshow !=1)  { ?>
<div class="category2lv-center">
   <div class="row">
      <?php foreach ($categories as $category) { ?>
      <div class="cat_clear col-xl-2 col-lg-3 col-md-3 col-sm-4 col-xs-6 catpr-all">
         <?php if ($aurus_categories_2lv !=1 && (!empty($category['thumb']))) { ?>
         <a class="catpr" href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" class="img-responsive opacityhv" /></a>
         <?php } ?>
         <a class="catpr2" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      </div>
      <?php } ?>
   </div>
</div>
<?php } ?>
<?php if ($products) { ?>
<div class="clearfix">	</div>
<div class="row rowf catfl">
   <div class="col-sm-3">
      <div class="btn-group hidden-xs">
         <button type="button" id="list-view" class="btn btn-default2" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
         <button type="button" id="grid-view" class="btn btn-default2" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
      </div>
   </div>
   <div class="col-sm-9">
      <div class="col-xs-12 col-sm-7 col-md-5 col-lg-5 navright">
         <?php if ($aurus_sort_cat !=1) { ?>
         <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-sort"><i class="fa fa-sort"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_sort; ?></span></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
               <?php foreach ($sorts as $sorts) { ?>
               <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
               <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
               <?php } else { ?>
               <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
               <?php } ?>
               <?php } ?>
            </select>
         </div>
         <?php } ?>
      </div>
      <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4 navright">
         <?php if ($aurus_count_cat !=1) { ?>
         <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><i class="fa fa-eye"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_limit; ?></span></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
               <?php foreach ($limits as $limits) { ?>
               <?php if ($limits['value'] == $limit) { ?>
               <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
               <?php } else { ?>
               <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
               <?php } ?>
               <?php } ?>
            </select>
         </div>
         <?php } ?>
      </div>
   </div>
</div>
<br />
<div class="row rowf flex_height_row">
   <?php foreach ($products as $product) { ?>
   <div class=" product-layout_cat product-list col-xs-12 ">
      <div class="gtile-i-wrap">
         <div class="gtile-i">
            <div class="gtile-i-box">
               <div class="item_cat caption">
                  <div class="<?php if ($aurus_rating_cat !=1) { ?>raiting_thumb<?php } ?> product-thumb">
                     <?php if ($aurus_rating_cat !=1) { ?>
                     <div class="rating rating_sm">
                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <?php if ($product['rating'] < $i) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } else { ?>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } ?>
                        <?php } ?>
                     </div>
                     <?php } ?>
                     <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                     <div class="snav en">
                        <ul>
                           <?php if ($aurus_wishlist_cat !=1) { ?>
                           <li>
                              <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                              <i class="fa fa-heart"></i>
                              <span><?php echo $button_wishlist; ?></span>
                              </a>
                           </li>
                           <?php } ?>
                           <?php if ($aurus_compare_cat !=1) { ?>
                           <li>
                              <a onclick="compare.add('<?php echo $product['product_id']; ?>');">
                              <i class="fa fa-exchange"></i>
                              <span><?php echo $button_compare; ?></span>
                              </a>
                           </li>
                           <?php } ?>
                           <?php if ($aridius_qckview_status) { ?>
                           <li>
                              <a onclick="quickview_open('<?php echo $product['product_id']; ?>');">
                              <i class="fa fa-search"></i>
                              <span><?php echo $text_quickview; ?></span>
                              </a>
                           </li>
                           <?php } ?>
                        </ul>
                     </div>
                     <div class="positionsticker">
                        <!-- special -->
                        <?php if ($aurus_sticker_sale_product_auto !=1 && $product['special'] && $product['price_sticker'] != 0 ) { ?>
                        <?php  $percent = round(100 - ($product['special_sticker'] / $product['price_sticker']) * 100); ?>
                        <div class="stickers-special">-<?php echo $percent; ?>%</div>
                        <?php } ?>
                        <!-- special END -->
                        <!-- new -->
                        <?php
                           $startDate1 = strtotime(mb_substr($product['dateadded'], 0, 10));
                           $endDate2 = strtotime(date("Y-m-d"));
                           $days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
                           ?>
                        <?php if($aurus_sticker_new_product_auto !=1 && $days < $aurus_sticker_product_new_day) { ?>
                        <div class="stickers-new"><?php echo $aurus_name_sticker_product_new[$language_id]; ?></div>
                        <?php } ?>
                        <!-- new END -->
                        <!-- top -->
                        <?php if ($aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 1 && $product['rating'] == $aurus_sticker_product_top_rating || $aurus_sticker_top_product_auto !=1 && $aurus_sticker_product_top_ratinr == 2 && $product['viewed'] >  $aurus_sticker_product_top_viewed ) { ?>
                        <div class="stickers-top"><?php echo $aurus_name_sticker_product_top[$language_id]; ?></div>
                        <?php } ?>
                        <!-- top END -->
                        <?php if ($product['stickers2']) { ?>
                        <?php foreach ($product['stickers2'] as $sticker2) { ?>
                        <div class="stickers-all" style="color:<?php echo $sticker2['color']; ?>;background:<?php echo $sticker2['background']; ?>;"><?php echo $sticker2['name']; ?></div>
                        <?php } ?>
                        <?php } ?>
                     </div>
                     <?php if ($aurus_rating_cat !=1) { ?>
                     <div class="rating rating_lg">
                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <?php if ($product['rating'] < $i) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } else { ?>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } ?>
                        <?php } ?>
                     </div>
                     <?php } ?>
                     <div class="product-name">
                        <a href="<?php echo $product['href']; ?>">
                        <?php
                           if( strlen($product['name'] ) < $aurus_limit_symbolst) {
                           echo $product['name'];
                           }
                           else {
                           echo mb_substr( $product['name'],0,$aurus_limit_symbolst,'utf-8' )."..."; }
                           ?>
                        </a>
                     </div>
                     <?php if ($product['price']) { ?>
                     <p class="price">
                        <?php if (!$product['special']) { ?>
                        <?php echo $product['price']; ?>
                        <?php } else { ?>
                        <span class="price-new"><?php echo $product['special']; ?></span><span class="price-old"><?php echo $product['price']; ?></span>
                        <?php } ?>
                        <?php if ($product['tax']) { ?>
                        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                        <?php } ?>
                     </p>
                     <?php } ?>
                     <div class="cart">
                        <?php if ($product['quantity'] <= 0 && $aridiusinstock_status ) { ?>
                        <button type="button" class="btn-instock" onclick="instock.add('<?php echo $product['product_id']; ?>');" data-product-id="<? echo $product['product_id']; ?>"><?php echo $button_instock; ?></button>
                        <?php } else { ?>
                        <button type="button" class="btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
                        <?php } ?>
                     </div>
								 <?php if ((!$aurus_description_cat) || ($product['attribute'] && !$aurus_atr_cat)) { ?>
                                 <div class="boxadd">
                                    <?php if (!$aurus_description_cat) { ?>
                                    <div class="<?php if ($aurus_description_catsm) { ?>desc_hide <?php } else { ?>desc_show <?php } ?>">
                                       <p><?php echo $product['description']; ?></p>
                                    </div>
                                    <?php } ?>
                                    <?php if($product['attribute'] && !$aurus_atr_cat) { ?>
                                    <div class="<?php if ($aurus_atr_catsm) { ?>atr_hide <?php } else { ?>atr_show <?php } ?>">
                                       <hr>
                                       <div class="attribute_cat">
                                          <?php $v = 0 ?>
                                          <?php foreach($product['attribute'] as $attribute_group) { ?>
                                          <?php foreach($attribute_group['attribute'] as $key => $attribute) { ?>
                                          <?php $v++; ?>
                                          <?php if($v > $aurus_limit_atr) break; ?>
                                          <?php echo $attribute['name']; ?> - <?php echo $attribute['text']; ?> <?php if($v < $aurus_limit_atr  ) { ?>  / <?php } ?>
                                          <?php } ?>
                                          <?php if($v > $aurus_limit_atr) break; ?>
                                          <?php } ?>
                                       </div>
                                    </div>
                                    <?php } ?>
                                 </div>
								 <?php } ?>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <?php } ?>
</div>
<div class="row pag_res">
   <div class="col-sm-7 text-left"><?php echo $pagination; ?>
   </div>
   <div class="col-sm-5 text-right"><?php echo $results; ?></div>
</div>
<?php if ($aurus_showmore !=1) { ?>
					<div id="load_more" style="display:none;">
						<div class="row text-center">
							<a href="#" class="load_more"> <i class="pr_spinner"></i> <?php echo $pr_load_more; ?></a>
						</div>
					</div>
<?php } ?>
<?php } ?>
<?php if (!$categories && !$products) { ?>
<p><?php echo $text_empty; ?></p>
<div class="buttons">
   <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn-cart"><?php echo $button_continue; ?></a></div>
</div>
<?php } ?>
<br />
<?php if ($aurus_description_pg1 !=1) { ?>
<?php if ($page == 1)  { ?>
<?php if ($aurus_description_top_or_bot !=0) { ?>
<?php if ($thumb || $description) { ?>
<div class="row desc-cat_top">
   <?php if ($thumb && !$aurus_categories_img) { ?>
   <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
   <?php } ?>
   <?php if ($description) { ?>
   <?php if ($aurus_description_length !=1 && strlen($description) > $aurus_categories_limit ) {
      if ($thumb && $aurus_categories_img !=1) { ?>
   <div class="cat_desc col-sm-10">
      <?php } else { ?>
      <div class="cat_desc col-sm-12">
         <?php } ?>
         <div class="block_desc">
            <?php echo $description; ?>
         </div>
         <a class="button_sh"><?php echo $text_show_desc; ?></a>
      </div>
      <?php } else {
         if ($thumb && $aurus_categories_img !=1) { ?>
      <div class="cat_desc col-sm-10">
         <?php } else { ?>
         <div class="cat_desc col-sm-12"><?php } ?><?php echo $description; ?></div>
         <?php } ?>
         <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      <?php } else { ?>
      <?php if ($aurus_description_top_or_bot !=0) { ?>
      <?php if ($thumb || $description) { ?>
      <div class="row desc-cat_top">
         <?php if ($thumb && !$aurus_categories_img) { ?>
         <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
         <?php } ?>
         <?php if ($description) { ?>
         <?php if ($aurus_description_length !=1 && strlen($description) > $aurus_categories_limit ) {
            if ($thumb && $aurus_categories_img !=1) { ?>
         <div class="cat_desc col-sm-10">
            <?php } else { ?>
            <div class="cat_desc col-sm-12">
               <?php } ?>
               <div class="block_desc">
                  <?php echo $description; ?>
               </div>
               <a class="button_sh"><?php echo $text_show_desc; ?></a>
            </div>
            <?php } else {
               if ($thumb && $aurus_categories_img !=1) { ?>
            <div class="cat_desc col-sm-10">
               <?php } else { ?>
               <div class="cat_desc col-sm-12"><?php } ?><?php echo $description; ?></div>
               <?php } ?>
               <?php } ?>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php echo $content_bottom; ?>
         </div>
         <?php echo $column_right; ?>
      </div>
   </div>
</div>
<?php if ($aurus_description_length !=1 && strlen($description) > $aurus_categories_limit ) { ?>
<script>
   $(document).ready(function(){
   $('.button_sh').click(function(){
   $(this).toggleClass('active');
   $('.block_desc').toggleClass('opener');
   if (!$(this).data('status')) {
   $(this).data('status', true).html('<?php echo $text_hide_desc; ?>');
   } else {
   $(this).data('status', false).html('<?php echo $text_show_desc; ?>');
   }
   });
   });
</script>
<?php } ?>
<?php if ($aurus_showmore !=1) { ?>
<script>
var pagination_exist = true; 
var button_more = true; 
var window_height = 0; 
var product_block_offset = 0;
var product_block = '.product-layout_cat';
var pages_count = 0; 
var pages = []; 
	function gettNextProductPage(pages, pages_count) {
		if (pages_count >= pages.length) return;
		$.ajax({
			url:pages[pages_count], 
			type:"GET", 
			data:'',
			beforeSend: function(){
			       $(".pr_spinner").addClass("fa fa-spinner fa-spin");
			},
			success:function (data) {
				$data = $(data);
			
				if ($data) {
					if (localStorage.getItem('display') == 'list') {
						$(product_block).parent().append($data.find('.product-list').parent().html());
						$('#list-view').trigger('click');
						if (product_block == '.product-grid') {$('#grid-view').trigger('click')};
					} else if (localStorage.getItem('display') == 'price') {
						$(product_block).parent().append($data.find('.product-list').parent().html());
						$('#price-view').trigger('click');
					} else {
						$(product_block).parent().append($data.find('.product-list').parent().html());
						$('#grid-view').trigger('click');
					}
					if (pagination_exist) {
						$('.pagination').html($data.find('.pagination'));
					}
				
					if (pages_count+1 >= pages.length) {$('.load_more').hide();};
				}
				  $(".pr_spinner").removeClass("fa fa-spinner fa-spin");
				
			}
		});
	}
$(document).ready(function(){ 
    window_height = $(window).height();
	var button_more_block = $('#load_more').html(); //
	var arrow_top = $('#arrow_top'); //
    if ($(product_block).length > 0) {
        product_block_offset = $(product_block).offset().top;
		var href = $('.pagination').find('li:last a').attr('href');
        $('.pagination').each(function(){
			if (href) {
				TotalPages = href.substring(href.indexOf("page=")+5);
				First_index = $(this).find('li.active span').html();
				i = parseInt(First_index) + 1;
				while (i <= TotalPages) {
					pages.push(href.substring(0,href.indexOf("page=")+5) + i);
					i++;
				}
			}		
        });	
		
		if (button_more && href) {
			$('.pagination').parent().parent().before(button_more_block);
			if (!pagination_exist) {
				$('.pagination').parent().parent().remove();
			} else {
				$('.pagination').parent().parent().find('.col-sm-6.text-right').remove();
			}
			$('.load_more').click( function(event) {
			event.preventDefault();
					gettNextProductPage(pages, pages_count);
				pages_count++;
			});
		} else if (href) { 
			$('.pagination').parent().parent().hide();
			$(window).scroll(function(){
				product_block = getProductBlock();
				product_block_height = $(product_block).parent().height();
				if (pages.length > 0) {
					if((product_block_offset+product_block_height-window_height)<($(this).scrollTop())){
						getNextProductPage(pages, pages_count);
						pages_count++;
					}
				}
			});
		}
    }
	
});
</script>
<?php } ?>
<?php echo $footer; ?>
