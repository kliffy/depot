$(function(){
	$('.store .entry > img').click(function() {
		$(this).parent().find('input[type="submit"]').click()
	});
});