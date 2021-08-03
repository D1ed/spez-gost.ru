
// console.log(volumeAr);
var placesApp = new Vue({
  el: '#placesApp',
  data: {
    readOnly: readOnly,
    placesAr: volumeAr
  },
  computed: {
    linksCursor: function() {
      if (this.readOnly) {
        return 'default';
      } else {
        return 'pointer';
      }
    }
  },
  methods: {
    filterNCalcWeight: function(event, allowFloat) {
      if (!this.filterDigits(event, allowFloat))
        return false;
    },
    filterDigits: function(e, allowFloat) {

      return filterDigits(e, allowFloat);
    },
    removePlace: function(index) {
      // return confirm('Удалить грузовое  место?');
      if (index > -1) {
        this.placesAr.splice(--index, 1);
      }
      // this.calcTotalWeight();
    },
    addNewPlace: function() {
      // if (this.placesAr.length == 9) 
      // {
      //   alert('Максимальное количество мест - 9');
      // } else {
        var nobj = {
          Weight: '1',
          Length: '1',
          Width: '1',
          Height: '1'
        };
        this.placesAr.push(nobj);
      // }
      // this.calcTotalWeight();
    },
  }
});


function filterDigits(e, allowFloat) {
  var code = (e.charCode == 0) ? e.keyCode : e.charCode;
  if (((code != 44 && code != 46) || !allowFloat) && (code < 48 || code > 57)) {
    e.preventDefault();
    return false;
  }
  return true;
  // return false;
}

function isNumeric(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

function showMessage(msg) {
  imlModalShow(msg);
}





$(document).ready(function($) {  

  window.selRealCityName = '';
  window.selRealRegionName = '';



  $('.recalc-delivery-cost').click(function(e) {
    e.preventDefault();
    $(this).prop('disabled', true);
    $(this).addClass('disabled-button');

    var data = {
      'action': 'recalcDeliveryCost',
      'formData': $("form[name='request-iml']").serialize()
    };
    btn = this;
    $('input[name="DeliveryDate"]').prop('disabled', true);
    $('input[name="DeliveryCost"]').prop('disabled', true);
    preloaderShow();
    var path = `${HTTPS_SERVER}index.php?route=extension/shipping/imldelivery/ajaxHandler&token=${ajaxToken}`;
    
    $.post(path, data, function(response) 
    {
      // debugger;
      response = JSON.parse(response);

      if (response.hasOwnProperty('error')) {
        showMessage(response.error);
        console.log(response.console);
      } else {
        $('input[name="DeliveryCost"]').val(response.price);
        $('input[name="DeliveryDate"]').val(response.date);
      }

      $(btn).removeAttr("disabled");
      $(btn).removeClass('disabled-button');
      $('input[name="DeliveryDate"]').removeAttr("disabled");
      $('input[name="DeliveryCost"]').removeAttr("disabled");
      preloaderHide();
    });


  });


  $('.create-order').click(function(e) {
    e.preventDefault();
    $(this).prop('disabled', true);
    $(this).addClass('disabled-button');

    var data = {
      'action': 'createOrder',
      'formData': $("form[name='request-iml']").serialize()
    };
    btn = this;
    var path = `${HTTPS_SERVER}index.php?route=extension/shipping/imldelivery/ajaxHandler&token=${ajaxToken}`;
    preloaderShow();
    $.post(path, data, function(response) 
    {
      // debugger;
      response = JSON.parse(response);

      if (response.hasOwnProperty('error')) {
        showMessage(response.error);
      } else {
        showMessage("Заказ успешно создан");
        location.reload();
      }

      $(btn).removeAttr("disabled");
      $(btn).removeClass('disabled-button');
      preloaderHide();
    });


  });
  
  
$('.status-check').click(function(e) {
    e.preventDefault();
    $(this).prop('disabled', true);
    $(this).addClass('disabled-button');

    var data = {
      'action': 'getStatus',
      'barcode': $("input[name='barcode']").val(),
      'order_id': $("input[name='order_id']").val()
    };
    btn = this;
    preloaderShow();
    var path = `${HTTPS_SERVER}index.php?route=extension/shipping/imldelivery/ajaxHandler&token=${ajaxToken}`;
    
    $.post(path, data, function(response) 
    {
      // debugger;
      response = JSON.parse(response);

      if (response.hasOwnProperty('error')) {
        showMessage(response.error);
      } else {
        location.reload();
      }

      $(btn).removeAttr("disabled");
      $(btn).removeClass('disabled-button');
      preloaderHide();
    });
  });  
  


$('.print-barcode').click(function(e) {
    e.preventDefault();
    $(this).prop('disabled', true);
    $(this).addClass('disabled-button');
    var data = {
      'action': 'printBarcode',
      'barcode': $("input[name='barcode']").val(),
      'order_id': $("input[name='order_id']").val()
    };
    btn = this;
    var path = `${HTTPS_SERVER}index.php?route=extension/shipping/imldelivery/ajaxHandler&token=${ajaxToken}`;
    preloaderShow();
    $.post(path, data, function(response) 
    {
      // debugger;
      response = JSON.parse(response);

      if (response.hasOwnProperty('error')) {
        showMessage(response.error);
      } else {
        // window.location.href= response.url;
        window.open(response.url, '_blank');
      }

      $(btn).removeAttr("disabled");
      $(btn).removeClass('disabled-button');
      preloaderHide();
    });
  });  


//   $('.select-pvz-on-map').click(function(e) {
// e.preventDefault();
//     $(this).prop('disabled', true);
//     $(this).addClass('disabled-button');
//     var data = {
//       'action': 'getPvzList4Widget'
//     };
//     btn = this;
//     var path = `/admin/index.php?route=catalog/imldelivery_order/ajaxHandler&token=${ajaxToken}`;
    
//     $.post(path, data, function(response) 
//     {
//       debugger;
//       response = JSON.parse(response);

//       if (response.hasOwnProperty('error')) {
//         showMessage(response.error);
//       } else {
//         window.location.href = response.url;
//       }

//       $(btn).removeAttr("disabled");
//       $(btn).removeClass('disabled-button');
//     });
    
//   });



  $('form[name="request-iml"]').submit(function() {
    var sumWeight = 0;
    placesApp.$data.placesAr.forEach(
      function(item) {
        sumWeight += parseFloat(item.Weight);
      });

    $('input[name="Weight"]').val(sumWeight);
    return true;
  });


  $('input[name="DeliveryDate"]').datepicker({
    dateFormat: 'dd.mm.yy'
  });







  // доставка на ПВЗ
  function isPvzMode() {
    var courierDeliveryJobs = ['24КО', '24'];
    var selJob = $('select[name="Job"] option:selected').val();
    return selJob && courierDeliveryJobs.indexOf(selJob) === -1;
  }

  // возможно КО
  function isCashMode() {
    var cashJobs = ['24КО', 'С24КО'];
    var selJob = $('select[name="Job"] option:selected').val();
    return selJob && cashJobs.indexOf(selJob) !== -1;
  }









  function toggleAddressFields() {
    if (isPvzMode()) {
      $('#selPvzTr').show();
      $('#addressTr').hide();
    } else {
      $('#selPvzTr').hide();
      $('#addressTr').show();
    }
  }



  $('select[name="Job"]').change(function() {
    toggleAddressFields();
    togglePvzBtn();
    // if (isPvzMode()) {
    //   getPvzList();
    // }
  });

  function togglePvzBtn() {
    if (!readOnly) {
      if (isPvzMode()) {
        $('.select-pvz-on-map').show();
      } else {
        $('.select-pvz-on-map').hide();
      }
    }
  }



  toggleAddressFields();
  togglePvzBtn();
  // if (isPvzMode()) {
  //   getPvzList();
  // }

});
