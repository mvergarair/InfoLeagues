var ready = function() {
	$('#button-send').click(function(){
		//TODO validate text entry
		$('#comment-form').submit();
		$('#comment-modal').removeClass('modal--active');
		$('#comment-modal').children().children().children().first().removeClass('modal__content--active');
	});

	$('#comment-form').bind("ajax:success", function( e , data ) {
	});

	$('#comment_text').keyup(function(){
		if ($('#comment_text').val().length >=1){
			$('#button-send').removeClass('mdl-button--disabled');
		}else{
			$('#button-send').addClass('mdl-button--disabled');
		}
	});
}

$(document).on('turbolinks:load', ready);