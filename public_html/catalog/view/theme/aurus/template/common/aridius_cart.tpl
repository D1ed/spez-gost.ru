<div id="aridius_cart">
   <div class="aridius_cart">
      <button title="close" type="button" class="mfp-close">&#215;</button>
      <div class="name-popup"><?php echo $heading_title; ?></div>
   </div>
   <ul class="arcart_popup">
      <?php if ($products || $vouchers) { ?>
      <li>
         <table class="table table-striped">
            <?php foreach ($products as $product) { ?>
            <tr>
               <td class="text-center hidden-xs "><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?>
               </td>
               <td class="text-left table_cartw">
                  <a href="<?php echo $product['href']; ?>"><span class="aridius_cart_name"><?php echo $product['name']; ?></span></a>
                  <div class="aridius_cart_price">
                     <?php echo $product['price']; ?>
                  </div>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
                  <?php } ?>
               </td>
               <td class="quantity">
                  <div class="pull-left1">
                     <button onclick="cart.update('<?php echo $product['id']; ?>', '<?php echo $product['cart_id']; ?>', '-')" type="button" id="minus" class="items-countcart"><i class="fa fa-minus">&nbsp;</i></button>
                     <input type="text" name="<?php echo $product['cart_id']; ?>" size="2" id="input-quantitycart" value="<?php echo $product['quantity']; ?>" onchange="cart.update('<?php echo $product['id']; ?>', '<?php echo $product['cart_id']; ?>')" />
                     <button  onclick="cart.update('<?php echo $product['id']; ?>', '<?php echo $product['cart_id']; ?>', '+')"type="button" id="plus" class="items-countcart2" ><i class="fa fa-plus">&nbsp;</i></button>
                  </div>
               </td>
               <td class="text-right table_carts"><?php echo $product['total']; ?></td>
               <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="cart_trash"><i class="fa fa-trash-o"></i></button></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
               <td class="text-center"></td>
               <td class="text-left"><?php echo $voucher['description']; ?></td>
               <td class="text-right">x&nbsp;1</td>
               <td class="text-right"><?php echo $voucher['amount']; ?></td>
               <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
            </tr>
            <?php } ?>
         </table>
      </li>
      <li>
         <div>
            <table class="table table-bordered table_cartt">
               <?php foreach ($totals as $total) { ?>
               <tr>
                  <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
                  <td class="text-right"><?php echo $total['text']; ?></td>
               </tr>
               <?php } ?>
            </table>
            <div class="cart">
               <?php if ($aurus_cart_continue !=1) { ?> 
               <button type="button" class="btn-cart continue_cart" data-dismiss="modal"><?php echo $text_continue; ?></button>
               <div class = "visible-xs"><br /></div>
               <?php } ?>
               <?php if ($aurus_cart_open !=1) { ?> 
               <a class="btn-cart cart_cartp" href="<?php echo $cart; ?>" role="button"><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></a>
               <?php } ?>
               <a class="btn-cart" href="<?php echo $checkout; ?>" role="button"><i class="fa fa-share"></i> <?php echo $text_checkout; ?></a>
            </div>
         </div>
      </li>
      <?php } else { ?>
      <li>
         <p class="text-center"><?php echo $text_empty; ?></p>
         <?php echo $aurus_cart_description; ?>
         <button type="button" class="btn-cart continue_cart" data-dismiss="modal"><?php echo $text_continue; ?></button>
      </li>
      <?php if ($aurus_cart_viewed !=1 && $products_viewed) { ?> 
      <div class="tittle_cart"><?php echo $text_viewed; ?></div>
      <div id="products_viewed" class="swiper-container">
         <div class="swiper-wrapper">
            <?php foreach ($products_viewed as $product) { ?>
            <div class="swiper-slide product-layout_carusel">
               <div class="caption">
                  <div class="raiting_thumb product-thumb">
                     <div class="box_spec">
                        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                        <div class="product-name"><a href="<?php echo $product['href']; ?>">
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
                           <button type="button" class="btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <?php } ?>
         </div>
         <div class="#products_viewed swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
         <div class="#products_viewed swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($aurus_cart_relpr !=1 && $products_cart) { ?>   
      <div class="tittle_cart"><?php echo $text_rel; ?></div>
      <div id="related_cart" class="swiper-container">
         <div class="swiper-wrapper">
            <?php foreach ($products_cart as $product) { ?>
            <div class="swiper-slide product-layout_carusel">
               <div class="caption">
                  <div class="raiting_thumb product-thumb">
                     <div class="box_spec">
                        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                        <div class="product-name"><a href="<?php echo $product['href']; ?>">
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
                           <button type="button" class="btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <?php } ?>
         </div>
         <div class="#related_cart swiper-button-next"><i class="fa fa-chevron-right fa-5x"></i></div>
         <div class="#related_cart swiper-button-prev"><i class="fa fa-chevron-left fa-5x"></i></div>
      </div>
      <?php } ?>
   </ul>
</div>
<script><!--
   function carousel_cart_related () {
   var ocSwiper = new Swiper('#related_cart.swiper-container', {
   slidesPerView: 4,
   mode: 'horizontal',
   pagination: false,
   autoplay: false,
   breakpoints: {
   768: {
   slidesPerView: 2,
   },
   992: {
   slidesPerView: 3,
   },
   1200: {
   slidesPerView: 4,
   },
   1600: {
   slidesPerView: 4,
   }
   },
   navigation: {
   nextEl: '#related_cart .swiper-button-next',
   prevEl: '#related_cart .swiper-button-prev',
   },
   });
   }
   $(document).ready(function(){
   carousel_cart_related();
   });
   
   //-->
</script>
<script><!--
   function carousel_cart_viewed () {
   var ocSwiper = new Swiper('#products_viewed.swiper-container', {
   slidesPerView: 4,
   mode: 'horizontal',
   pagination: false,
   autoplay: false,
   
   breakpoints: {
   768: {
   slidesPerView: 2,
   },
   992: {
   slidesPerView: 3,
   },
   1200: {
   slidesPerView: 4,
   },
   1600: {
   slidesPerView: 4,
   }
   },
   navigation: {
   nextEl: '#products_viewed .swiper-button-next',
   prevEl: '#products_viewed .swiper-button-prev',
   },
   });
   }
   $(document).ready(function(){
   carousel_cart_viewed();
   });
   
   //-->
</script>
<script><!--
   $(document).on("click",'.continue_cart',function(){
   $.magnificPopup.close();
   });
   //-->
</script>
