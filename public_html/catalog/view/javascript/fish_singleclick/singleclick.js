$(document).ready(function () {
	
	    $('.container').on('click', '.feedcall', function () {
			    $('#fast_order_button').css('display','block');
				 $('#fast_order_result').html('');
				 $("#popaptext").html('');
				 
				 var popapparam = $(this).find('.fish-popaptext');
				   $("#popaptext").html($(popapparam).html());	
				  
                $('#fast_order_form').modal({
                  backdrop: true,
                  keyboard: true
                });
    });


    $('#fast_order_button').on('click', function () {
		var textst = $('body').find('.entryfeedback').text();
		var danns = $('body').find('.danns').text();
		
		var $sendparam = $(this).closest("#fast_order_form");
      $('#fast_order_result', $sendparam).text(danns);
        $.post('index.php?route=extension/module/fish_singleclick', {
            'customer_name':    $('#customer_name', $sendparam).val(),
            'customer_phone':   $('#customer_phone', $sendparam).val(),
			'customer_email':   $('#customer_email', $sendparam).val(),
            'order_status_id':  $('#order_status_id', $sendparam).val(),
            'customer_message': $('#customer_message', $sendparam).val(),
            'captcha':          $('#captcha', $sendparam).val(), 
            'pr':               $('#pr', $sendparam).val(),
			'fish_agree':       $('#fish_agree', $sendparam).prop('checked') ? 1 : 0
        },
        
        function (data) {
            var data = $.parseJSON(data);
            if ('error' in data) {
                $('#fast_order_result', $sendparam).html('<span class="singleclick_error">' + data.error + '</span>');
            } else {
                $('#fast_order_result', $sendparam).html('<span class="singleclick_success">' + textst + '</span>');
				$('#fast_order_button', $sendparam).css('display','none');
            }
        });
    });
	
	 $('#fast_order_button2').on('click', function () {
		var textst = $('body').find('.entryfeedback').text();
		var danns = $('body').find('.danns').text();
		
		var $sendparam = $(this).closest("#fast_order_form2");
      $('#fast_order_result2', $sendparam).text(danns);
        $.post('index.php?route=extension/module/fish_singleclick', {
            'customer_name':    $('#customer_name2', $sendparam).val(),
            'customer_phone':   $('#customer_phone2', $sendparam).val(),
			'customer_email':   $('#customer_email2', $sendparam).val(),
            'order_status_id':  $('#order_status_id2', $sendparam).val(),
            'customer_message': $('#customer_message2', $sendparam).val(),
            'captcha':          $('#captcha2', $sendparam).val(), 
            'pr':               $('#pr2', $sendparam).val(),
			'fish_agree':       $('#fish_agree2', $sendparam).prop('checked') ? 1 : 0
        },
        
        function (data) {
            var data = $.parseJSON(data);
            if ('error' in data) {
                $('#fast_order_result2', $sendparam).html('<span class="singleclick_error">' + data.error + '</span>');
            } else {
                $('#fast_order_result2', $sendparam).html('<span class="singleclick_success">' + textst + '</span>');
				$('#fast_order_button2', $sendparam).css('display','none');
            }
        });
    });
	
	 $('#fast_order_button3').on('click', function () {
		var textst = $('body').find('.entryfeedback').text();
		var danns = $('body').find('.danns').text();
		
		var $sendparam = $(this).closest("#fast_order_form3");
      $('#fast_order_result3', $sendparam).text(danns);
        $.post('index.php?route=extension/module/fish_singleclick', {
            'customer_name':    $('#customer_name3', $sendparam).val(),
            'customer_phone':   $('#customer_phone3', $sendparam).val(),
			'customer_email':   $('#customer_email3', $sendparam).val(),
            'order_status_id':  $('#order_status_id3', $sendparam).val(),
            'customer_message': $('#customer_message3', $sendparam).val(),
            'captcha':          $('#captcha3', $sendparam).val(), 
            'pr':               $('#pr3', $sendparam).val(),
			'fish_agree':       $('#fish_agree3', $sendparam).prop('checked') ? 1 : 0
        },
        
        function (data) {
            var data = $.parseJSON(data);
            if ('error' in data) {
                $('#fast_order_result3', $sendparam).html('<span class="singleclick_error">' + data.error + '</span>');
            } else {
                $('#fast_order_result3', $sendparam).html('<span class="singleclick_success">' + textst + '</span>');
				$('#fast_order_button3', $sendparam).css('display','none');
            }
        });
    });


});

