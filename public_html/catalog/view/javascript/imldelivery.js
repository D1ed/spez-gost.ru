var myMap;
var mapObjects = {};
var arrData;
var pvzType;
var checkPvzFlag = 'error';
var selectedPvzInfo;
var checkImlDeliveryFlag = false;
localStorage.setItem('checked_iml_pvz', 'init');





function initWidget() 
{
	if (!myMap) {
		var pane = $('#IML_wrapper');
		var api = pane.data('jsp');
		
		if (typeof ymaps == "undefined") 
		{
		  return;
		}		
		
		myMap = new ymaps.Map('IML_map', {
			center: [55.76, 37.64], // Новосибирск
			zoom: 11
		}, {
			searchControlProvider: 'yandex#search'
		}),
		objectManager = new ymaps.ObjectManager({
			clusterize: true,
			gridSize: 32,
			clusterDisableClickZoom: false
		});
		objectManager.objects.options.set('preset', 'islands#greenDotIcon');
		objectManager.clusters.options.set('clusterIconColor', '#FFC145');
		objectManager.objects.options.set({
			iconLayout: 'default#image',
			iconImageHref: 'image/catalog/widjet/imlNActive.png',
			iconImageSize: [40, 43],
			iconImageOffset: [-10, -31]
		});
		myMap.geoObjects.add(objectManager);
		preloaderShow();
		//var region = $('#iml-widget-container').attr('data-region');
		$.ajax({
			url: `${HTTPS_SERVER}index.php?route=extension/shipping/imldelivery/formattedPvzList`,
			type: "POST",
			data: "pvzType="+pvzType
		}).done(function(data) {
			objectManager.add(data);
			arrData = $.parseJSON(data);
			
			mapObjects = JSON.stringify(arrData['features']);
			var allHtml = '';
			console.log(arrData['lists']);
			for(i in arrData['lists']['items'])
			{
				allHtml += '<p class="pvz_item" id="PVZ_'+arrData['lists']['items'][i]['id']+
				'" data-placemark="'+arrData['lists']['items'][i]['id']+
				'" data-pvzid="'+arrData['lists']['items'][i]['pvzid']+
				'" data-id="'+arrData['lists']['items'][i]['id']+
				'" onClick="choosePVZ('+i+')"><span>'+
				arrData['lists']['items'][i]['name']+'</span><br />'+
				arrData['lists']['items'][i]['address']+'</p>';				
			}
			// for(var i = 0; i < arrData['lists']['items'].length; i++) {

			// }
			$('#IML_wrapper').html(allHtml);
			myMap.setCenter(arrData['lists']['center'], 11);
			// showPvzPrice(arrData['lists']['items'][0]['pvzid']);
			if(localStorage.getItem("checked_iml_pvz") != "init") {
				MapWidgetShow();
				preloaderHide();
			}
			// $('#IML_wrapper').jScrollPane();
		});



		function onObjectEvent (e) {
			var objectId = e.get('objectId');
			if (e.get('type') == 'mouseenter') {
				// Метод setObjectOptions позволяет задавать опции объекта "на лету".
				objectManager.objects.setObjectOptions(objectId, {
					preset: 'islands#yellowIcon'
				});
			} else {
				objectManager.objects.setObjectOptions(objectId, {
					preset: 'islands#blueIcon'
				});
			}
		}

		function onClusterEvent (e) {
			var objectId = e.get('objectId');
			if (e.get('type') == 'mouseenter') {
				objectManager.clusters.setClusterOptions(objectId, {
					preset: 'islands#yellowClusterIcons'
				});
			} else {
				objectManager.clusters.setClusterOptions(objectId, {
					preset: 'islands#blueClusterIcons'
				});
			}
		}
		
	}
	else {
		myMap.destroy();// Деструктор карты
		myMap = null;
	}
}

/*проверка simple перед отправкой заказа*/
window.simpleValidate = function() {
	var checkDelivery = checkImldelivery(); //вернет false если не выбран пункт ПВЗ
	if (!checkDelivery) {
		imlModalShow("Не выбран пункт ПВЗ");
		return false;
	}
	return true;
}

function choosePVZ(i) 
{
	myMap.geoObjects.get(0).objects.balloon.open(i);
	$('p.pvz_item').removeClass('iml_chosen');
	$('p#PVZ_'+i).addClass('iml_chosen');
}


function MapWidgetShow(){
	localStorage.setItem('checked_iml_pvz', 'yes');
	$("#iml-widget-container").show();
}

function MapWidgetHide(){
	localStorage.setItem('checked_iml_pvz', 'no');
	$("#iml-widget-container").hide();
}


$('html').delegate('a#IML_button', 'click', function() {
	var pvz = $(this).attr('data-specialcode');
	var id = $(this).attr('data-id');
	var date = $('div.IML_mark#iml_price').attr('data-date');
	var address = arrData["lists"]["items"][id]["address"];
	preloaderShow();
	$.ajax({
		url: `${HTTPS_SERVER}index.php?route=extension/shipping/imldelivery/selectPVZ`,
		type: "POST",
		data: {id}
	}).done(function(retdata) 
	{
		retdata = JSON.parse(retdata);
		selectedPvzInfo = retdata.selectedPvzDescriptionHTML;
		$('div.imlpvz-info').html('');
		$('input[name="shipping_method"]:checked').parent().find('div.imlpvz-info').html(selectedPvzInfo);
		MapWidgetHide();
		preloaderHide();
	});
});




function checkImldelivery() 
{
	// debugger;
	var val = $('input[name="shipping_method"]:checked').val();
	if(typeof val !== 'undefined' && (val.indexOf('method_c24') != -1 ||  val.indexOf('method_c24ko') != -1)
	   && typeof ymaps != "undefined")
	{

		var html = $('input[name="shipping_method"]:checked').parent().find('div.imlpvz-info').html();
		checkImlDeliveryFlag = (html.length > 0);
	}else
	{
		checkImlDeliveryFlag = true;
	}

	return checkImlDeliveryFlag;
}




function showPvzPrice(pvz) 
{
}

$('html').delegate('.iml-select-pvz', 'click', function() {
	debugger;
	localStorage.setItem('checked_iml_pvz', 'yes');
	var tempPvzType = $(this).attr('data-type');
	if(myMap) {
		myMap.destroy();
		myMap = null;
		pvzType = null;
	}
	pvzType = tempPvzType;
	initWidget();
	// MapWidgetShow();
});

$('html').delegate('div#IML_closer', 'click', function() {
	MapWidgetHide();
});


var jscrlpn;
function iml_showDetailPvz(id) {
	var outHtml = '<p><strong>Адрес пункта самовывоза:</strong><br />'
	+arrData["lists"]["items"][id]["address"]
	+'<br />'
	+arrData["lists"]["items"][id]["worktime"]
	+'</p>'
	+'<p>'
	+'<strong>Как к нам проехать:</strong><br />'
	+arrData["lists"]["items"][id]["HowToGet"]
	+'</p>';
	$('div#IML_fullInfo').html(outHtml);
	jscrlpn = $('#IML_detail').jScrollPane({autoReinitialise: true});
	$('#IML_info').children('div').animate({'marginLeft':'-300px'},500);
}

function iml_backToPVZList() {
	if(jscrlpn.scrollDetail && typeof(jscrlpn.scrollDetail.data('jsp'))!='undefined')
		jscrlpn.scrollDetail.data('jsp').destroy();
	$('#IML_info').children('div').animate({'marginLeft':'0px'},500);
}





$(document).ready(function() {


	$('html').delegate('input[name="shipping_method"]', 'change', function()
	{
		// debugger;
		var val = $('input[name="shipping_method"]:checked').val();
		if(typeof val !== 'undefined' && (val.indexOf('method_c24') != -1 ||  val.indexOf('method_c24ko') != -1))
		{
			if(typeof ymaps != "undefined")
			{
				$('.iml-select-pvz, .imlpvz-info').show();			
			}
			$('div.imlpvz-info').html('');
			$('input[name="shipping_method"]:checked').parent().find('div.imlpvz-info').html(selectedPvzInfo);
		}
		else
		{
			$('.iml-select-pvz, .imlpvz-info').hide();
		}	

	});
	
	$('input[name="shipping_method"]').trigger("change");
	
	if (typeof ymaps != "undefined") 
	{
	  // ymaps.ready(initWidget);
	  // document.write(unescape("<script src='https://api-maps.yandex.ru/2.1/?lang=ru_RU'></script>"));
	}
});