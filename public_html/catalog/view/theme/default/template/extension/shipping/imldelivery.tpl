<div class="iml-widget-container" id="iml-widget-container" data-region="">
		<div id='IML_pvz'>
			<div id='IML_title'>
				<div id='IML_cityPicker'>
					<div></div>
					<div>
					</div>
				</div>
				<div id='IML_logoPlace'></div>
				<div id='IML_separator'></div>
				<div class='IML_mark' id="iml_price">
				</div>
				<div class='IML_mark'>
					<div id="IML_closer"></div>
				</div>
				<div style='float:none;clear:both'></div>
			</div>
			<div id='IML_map'></div>
			<div id='IML_info'>
				<div>
					<div id='IML_wrapper'></div>
					<div id='IML_detail'>
						<div id='IML_back' onclick='iml_backToPVZList()'>К общему списку</div>
						<div id='IML_fullInfo'></div>
					</div>
				</div>
			</div>
		</div>
</div>

<script>
var HTTPS_SERVER = '<?php echo HTTPS_SERVER ?>';
</script>


<?php include DIR_APPLICATION . 'view/theme/default/template/extension/shipping/imldelivery_preloader.tpl'; ?>
<?php include DIR_APPLICATION . 'view/theme/default/template/extension/shipping/imldelivery_modal.tpl'; ?>	  