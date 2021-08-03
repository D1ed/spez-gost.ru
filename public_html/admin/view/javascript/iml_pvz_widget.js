
var myMap;
var mapObjects = {};
var arrData;
var pvzType;
var checkPvzFlag = 'error';
var selectedPvzInfo;
localStorage.setItem('checked_iml_pvz', 'init');

function initWidget() 
{
	if (!myMap) {
		var pane = $('#IML_wrapper');
		var api = pane.data('jsp');
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
		//var region = $('#popup1').attr('data-region');
		var path = `${HTTPS_SERVER}/index.php?route=extension/module/imldelivery_order/ajaxHandler&user_token=${ajaxToken}`;
    	$.post(path, {'action':'getPvzList4Widget'}, function(data) 
    	{		
			debugger;
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
				PopUpShow();
			}
			$('#IML_wrapper').jScrollPane();
				
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

/*simple*/
window.simpleValidate = function() {
	var checkDelivery = checkImldelivery(); //вернет false если не выбран пункт ПВЗ
	if (!checkDelivery) {
		alert("Не выбран пункт ПВЗ");
		return false;
	}
	return true;
}

function choosePVZ(i) {
	/*
	var pvzid = $('p#PVZ_'+i).attr('data-pvzid');
	$.ajax({
		url: "index.php?route=shipping/imldelivery/getPvzPrice&pvzid="+pvzid,
	}).done(function(data) {
		//var arr = $.parseJSON(data);
		console.log(data);
	});
	*/
	myMap.geoObjects.get(0).objects.balloon.open(i);
	$('p.pvz_item').removeClass('iml_chosen');
	$('p#PVZ_'+i).addClass('iml_chosen');
}


function PopUpShow(){
	localStorage.setItem('checked_iml_pvz', 'yes');
	$("#popup1").show();
}

function PopUpHide(){
	localStorage.setItem('checked_iml_pvz', 'no');
	$("#popup1").hide();
}


$('html').delegate('a#IML_button', 'click', function() {
	var $this = $(this);
	var pvz = $this.attr('data-specialcode');
	var id = $this.attr('data-id');
	var date = $('div.IML_mark#iml_price').attr('data-date');
	var address = arrData["lists"]["items"][id]["address"];
	$.ajax({
		url: `${HTTPS_SERVER}index.php?route=extension/shipping/imldelivery/selectPVZ`,
		type: "POST",
		data: "pvzid=" + pvz + "&pvztype=" + pvzType + "&address=" + address + "&date=" + date
	}).done(function(retdata) {
		/*
		var ardata = $.parseJSON(retdata);
		$('div.IML_mark#iml_price').html(ardata['mess']);
		*/
		var divPvz = '';
		var valueInput = '';
		if(pvzType == 'pvz_nal') {
			divPvz = 'iml_text_pvz_nal';
			valueInput = 'imldelivery.imldelivery_pvz_nal';
		} else if(pvzType == 'pvz_beznal') {
			divPvz = 'iml_text_pvz_beznal';
			valueInput = 'imldelivery.imldelivery_pvz_beznal';
		}

		selectedPvzInfo = arrData["lists"]["items"][id]["address"]+'</span><br /><span>'+arrData["lists"]["items"][id]["worktime"];
		$('input[name="shipping_method"]').change();
		PopUpHide();

	});
});


var checkImlDeliveryFlag = false;

function checkImldelivery() {
	var dfd = jQuery.Deferred();
	var boolReturn = false;
	var $elem = $('div#collapse-shipping-method').find('input[type="radio"]:checked');
	if($elem.val() == 'imldelivery.imldelivery_pvz_nal' || $elem.val() == 'imldelivery.imldelivery_pvz_beznal') {
		if($elem.attr('data-pvzid') !== undefined && $elem.attr('data-pvzType') !== undefined) {
			var pvz = $elem.attr('data-pvzid');
			var pvzType = $elem.attr('data-pvzType');
			var addressPvz = $elem.attr('data-address');
			var date = $('div.IML_mark#iml_price').attr('data-date');
			$.ajax({
				url: "index.php?route=extension/shipping/imldelivery/selectPVZ",
				type: "POST",
				async: false,
				data: "pvzid=" + pvz + "&pvztype=" + pvzType + "&address=" + addressPvz + "&date=" + date,
				complete: function() {
					dfd.resolve(true);
					checkImlDeliveryFlag = true;
				}
			});
		} else {
			checkImlDeliveryFlag = false;
		}
	} else if($elem.val() == 'imldelivery.imldelivery_courier_nal' || $elem.val() == "imldelivery.imldelivery_courier_bnal") {
		var elemid = $elem.val();
		var $dataelem = $elem.siblings('span[data-id="'+elemid+'"]');
		var dataelemtype = $dataelem.attr('data-id');
		var date = $dataelem.attr('data-date');
		console.log(dataelemtype);
		var type;
		if(dataelemtype == 'imldelivery.imldelivery_courier_nal') {
			type = 'courier_nal';
		} else if(dataelemtype == 'imldelivery.imldelivery_courier_bnal') {
			type = 'courier_bnal';
		}
		var address = $dataelem.attr('data-address');
		$.ajax({
			url: `${HTTPS_SERVER}index.php?route=extension/shipping/imldelivery/selectCourier`,
			type: "POST",
			async: false,
			data: "type=" + type + "&address=" + address + "&date=" + date,
			complete: function() {
				dfd.resolve(true);
				checkImlDeliveryFlag = true;
			}
		});
	} else {
		dfd.resolve(true);
		checkImlDeliveryFlag = true;
	}
	
	return checkImlDeliveryFlag;
}




function showPvzPrice(pvz) {
	$.ajax({
		url: `${HTTPS_SERVER}index.php?route=extension/shipping/imldelivery/getPvzPrice`,
		type: "POST",
		data: "pvzid=" + pvz
	}).done(function(retdata) {
		var ardata = $.parseJSON(retdata);
		$('div.IML_mark#iml_price').html(ardata['mess']);
		$('div.IML_mark#iml_price').attr('data-price', ardata['price']);
		$('div.IML_mark#iml_price').attr('data-date', ardata['date']);
	});
}

$('html').delegate('.select-pvz-on-map', 'click', function() {
	localStorage.setItem('checked_iml_pvz', 'yes');
	var tempPvzType = $(this).attr('data-type');
	if(myMap) {
		myMap.destroy();
		myMap = null;
		pvzType = null;
	}
	pvzType = tempPvzType;
	initWidget();
});

$('html').delegate('div#IML_closer', 'click', function() {
	PopUpHide();
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





// $(document).ready(function() {
// 	ymaps.ready(initWidget);
// });
