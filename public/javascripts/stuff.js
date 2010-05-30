//show and hide for different OAUTH and FACEBOOK Connect
$(document).ready(function() {
	$("#otherLogins fieldset").hide();
	$("#otherLogins div.formAction").hide();
	
	$("#service").change(function () {
		$("#service option:selected").each(function() {
			var e = $(this).val();
			$("#otherLogins fieldset").hide().filter('#' + e).show();
			$("#otherLogins div.formAction").show();
		});
	});
});

//show and hide for user wether addmision to an event will be charged
$(document).ready(function() {
	$(".attendeeCharged").hide();
	$("#attendeeCharge").change(function(e){
		$(".attendeeCharged").toggle();
	});
});