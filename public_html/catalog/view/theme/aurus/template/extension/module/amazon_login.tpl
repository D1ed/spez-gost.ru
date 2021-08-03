<div id="amazon-root"></div>
<script>
	$(document).ready(function() {
		amazon.Login.setClientId('<?php echo $amazon_login_pay_client_id; ?>');
		(function(d) {
			var a = d.createElement('script');
			a.type = 'text/javascript';
			a.async = true;
			a.id = 'amazon-login-sdk';
			a.src = 'https://api-cdn.amazon.com/sdk/login1.js';
			d.getElementById('amazon-root').appendChild(a);
		})(document);
	});
</script>
<?php if (isset($amazon_login_pay_test)) { ?>
	<label>Debug Error Code     :</label>
	<div id="errorCode"></div>
	<br>
	<label>Debug Error Message  :</label>
	<div id="errorMessage"></div>
<?php } ?>
<div id="AmazonLoginButton"></div>
<script>
	$(document).ready(function() {
		var authRequest;
		OffAmazonPayments.Button("AmazonLoginButton", "<?php echo $amazon_login_pay_client_id; ?>", {
			type: "<?php echo $amazon_login_button_type; ?>",
			color: "<?php echo $amazon_login_button_colour; ?>",
			size: "<?php echo $amazon_login_button_size; ?>",
			language: "<?php echo $amazon_login_pay_language; ?>",
			authorization: function() {
				var loginOptions = {scope: 'profile payments:widget payments:shipping_address'};
				authRequest = amazon.Login.authorize(loginOptions, "<?php echo $amazon_login_return_url; ?>");
			},
			onError: function(error) {
				document.getElementById("errorCode").innerHTML = error.getErrorCode();
				document.getElementById("errorMessage").innerHTML = error.getErrorMessage();
			}
		});
	});
</script>