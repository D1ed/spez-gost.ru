		<div id="IML_baloon">
			<div>
				<div id="IML_iPlace" class="iml_icon"></div>
				<div class="iml_baloonDiv">
					<?php echo $Name ?>

					<br />
					<?php echo $Address ?>
				</div>
				<div style="clear:both"></div>
			</div>
			<div>
				<div id="IML_iTelephone" class="iml_icon"></div>
				<div class="iml_baloonDiv">
					<?php echo $Phone ?>
				</div>
				<div style="clear:both"></div>
			</div>
			<div>
				<div id="IML_iTime" class="iml_icon"></div>
				<div class="iml_baloonDiv">
					<?php echo $WorkMode ?>
				</div>
				<div style="clear:both"></div>
			</div>
			<div>
				<div class="iml_icon"></div>
				<div class="iml_baloonDiv">
					<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 334.877 334.877" style="enable-background:new 0 0 334.877 334.877;" xml:space="preserve" width="18px" height="18px">
						<g>
							<path d="M333.196,155.999h-16.067V82.09c0-17.719-14.415-32.134-32.134-32.134h-21.761L240.965,9.917   C237.571,3.798,231.112,0,224.107,0c-3.265,0-6.504,0.842-9.364,2.429l-85.464,47.526H33.815   c-17.719,0-32.134,14.415-32.134,32.134v220.653c0,17.719,14.415,32.134,32.134,32.134h251.18   c17.719,0,32.134-14.415,32.134-32.134v-64.802h16.067V155.999z M284.995,62.809c9.897,0,17.982,7.519,19.068,17.14h-24.152   l-9.525-17.14H284.995z M220.996,13.663c3.014-1.69,7.07-0.508,8.734,2.494l35.476,63.786H101.798L220.996,13.663z    M304.275,302.742c0,10.63-8.651,19.281-19.281,19.281H33.815c-10.63,0-19.281-8.651-19.281-19.281V82.09   c0-10.63,8.651-19.281,19.281-19.281h72.353L75.345,79.95H37.832c-3.554,0-6.427,2.879-6.427,6.427s2.873,6.427,6.427,6.427h14.396   h234.83h17.217v63.201h-46.999c-21.826,0-39.589,17.764-39.589,39.589v2.764c0,21.826,17.764,39.589,39.589,39.589h46.999V302.742z    M320.342,225.087h-3.213h-59.853c-14.743,0-26.736-11.992-26.736-26.736v-2.764c0-14.743,11.992-26.736,26.736-26.736h59.853   h3.213V225.087z M276.961,197.497c0,7.841-6.35,14.19-14.19,14.19c-7.841,0-14.19-6.35-14.19-14.19s6.35-14.19,14.19-14.19   C270.612,183.306,276.961,189.662,276.961,197.497z" fill="<?php echo $fillColorCash ?>"/>
						</g>
					</svg>
					<svg style="position: relative; top: 2px; margin-left: 5px;" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					width="20px" height="20px" viewBox="0 0 548.176 548.176" style="enable-background:new 0 0 548.176 548.176;"
					xml:space="preserve">
					<g>
						<g>
							<path d="M534.754,68.238c-8.945-8.945-19.698-13.417-32.258-13.417H45.681c-12.562,0-23.313,4.471-32.264,13.417
							C4.471,77.185,0,87.936,0,100.499v347.173c0,12.566,4.471,23.318,13.417,32.264c8.951,8.946,19.702,13.419,32.264,13.419h456.815
							c12.56,0,23.312-4.473,32.258-13.419c8.945-8.945,13.422-19.697,13.422-32.264V100.499
							C548.176,87.936,543.699,77.185,534.754,68.238z M511.627,447.679c0,2.478-0.903,4.613-2.711,6.427
							c-1.807,1.8-3.949,2.703-6.42,2.703H45.681c-2.473,0-4.615-0.903-6.423-2.71c-1.807-1.813-2.712-3.949-2.712-6.427V274.088
							h475.082V447.679z M511.627,164.449H36.545v-63.954c0-2.474,0.902-4.611,2.712-6.423c1.809-1.803,3.951-2.708,6.423-2.708h456.815
							c2.471,0,4.613,0.901,6.42,2.708c1.808,1.812,2.711,3.949,2.711,6.423V164.449L511.627,164.449z" fill="<?php echo $fillColorCard ?>"/>
						</g>
					</g>
				</svg>
			</div>
			<div style="clear:both"></div>
		</div>
		<div>
			<div class="iml_icon"></div>
			<div class="iml_baloonDiv">
				<a href="javascript:void(0);" onClick="iml_showDetailPvz('<?php echo $key ?>')">Подробная информация</a>
			</div>
			<div style="clear:both"></div>
		</div>
		<div>
			<a id="IML_button" data-specialcode="<?php echo $Special_Code ?>" data-id="<?php echo $key ?>"></a>
		</div>
	</div>