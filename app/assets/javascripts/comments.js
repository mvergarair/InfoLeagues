var ready = function() {
	$('#button-send').click(function(){
		//TODO validate text entry
		$('#comment-form').submit();
		$('#comment-modal').removeClass('modal--active');
		$('#comment-modal').children().children().children().first().removeClass('modal__content--active');
	});

	$('#comment-form').bind("ajax:success", function( e , data ) {
	});
}

$(document).on('turbolinks:load', ready);