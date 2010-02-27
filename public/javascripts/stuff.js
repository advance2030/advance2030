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