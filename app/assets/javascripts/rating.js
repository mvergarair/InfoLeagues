var ready = function() {
	$('.rate-star').mouseover(function (){
		if($(this).parent().attr('data-disable') == "true"){
			return;
		}
		var hoveredStar = $(this).attr('data-star-number');
		hoveredStar = parseInt(hoveredStar);
		var hoveredResource = $(this).attr('data-star-id');
		if ($(this).hasClass('fa-futbol-o')){
			for (var i = hoveredStar; i >= 0; i--) {
				$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').css('color','grey');
			}
			for (var i = hoveredStar+1 ; i <= 4; i++) {
				$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').css('color','lightgrey');
			}
		}else{
			for (var i = hoveredStar; i >= 0; i--) {
				$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').text('star');
			}
			for (var i = hoveredStar+1 ; i <= 4; i++) {
				$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').text('star_border');
			}
		}
		$(this).parent().prev().prev().prev().val(parseInt(hoveredStar) + 1);
	});

	$('.rate').mouseleave(function(){
		var rating = $(this).attr("data-rate");
		var hoveredResource = $(this).attr('data-id');
		if($(this).children().first().hasClass('fa-futbol-o')){
			paintBalls(rating,hoveredResource);	
		}else{
			paintStars(rating,hoveredResource);
		}
		$(this).prev().prev().prev().val(null)
	});

	$('.rate-star').click(function(){
		if($(this).parent().attr('data-signed-in')== "false"){
			console.log('hola');
			var notification = document.querySelector('.mdl-js-snackbar');
			var data = {
			  message: 'Debe iniciar sessión para calificar.',
			  actionHandler: function(event) {
			  	var urld =  "http://" + location.host + "/users/sign_in";
			  	window.location.href = urld;
			  },
			  actionText: 'Iniciar Sessión',
			  timeout: 10000
			};
			notification.MaterialSnackbar.showSnackbar(data);
			return;
		}
		if($('#rating_grade').val() == null || $(this).parent().attr('data-disable') == "true"){
			return;
		}
		$(this).parent().parent().submit();
	})

	$('form').bind("ajax:success", function( e , data ) {
		rateDiv = $(this).children().last();
		rateDiv.attr('data-disable', 'true');
		rateDiv.attr('data-rate', data.new_rating);
		if(rateDiv.children().first().hasClass('fa-futbol-o')){
			console.log(data);
			paintBalls(data.new_rating, rateDiv.attr('data-id'));
		}else{
			paintStars(data.new_rating, rateDiv.attr('data-id'));
		}
		rateDiv.children().last().children().first().text('(tu evaluacion: '+ data.new_rating + ')')
		toolTip = rateDiv.children().last().children().last();
		toolTipText = toolTip.text()
		toolTipTextNum = parseInt(toolTipText.split(" ")[0]);
		toolTip.text((toolTipTextNum + 1) + " evaluaciones");
	});

	function paintStars(rating, hoveredResource){
		rating = parseFloat(rating);
		for (var i = Math.floor(rating) - 1; i >= 0; i--) {
			$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').text('star');
		}
		if (rating % 1 != 0){
			$('.rate-star[data-star-number="' + Math.floor(rating) + '"][data-star-id="'+ hoveredResource + '"]').text('star_half');
			for (var i = Math.floor(rating) + 1; i <= 4; i++) {
				$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').text('star_border');
			}
		}
		else {
			for (var i = Math.floor(rating); i <= 4; i++) {
				$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').text('star_border');
			}	
		}
	}

	function paintBalls(rating, hoveredResource){
		rating = parseFloat(rating);
		for (var i = Math.floor(rating) - 1; i >= 0; i--) {
			$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').css('grey');
		}
		if (rating % 1 != 0){
			$('.rate-star[data-star-number="' + Math.floor(rating) + '"][data-star-id="'+ hoveredResource + '"]').css('color', '#bbbaba');
			for (var i = Math.floor(rating) + 1; i <= 4; i++) {
				$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').css('color','lightgrey');
			}
		}
		else {
			for (var i = Math.floor(rating); i <= 4; i++) {
				$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').css('color','lightgrey');
			}	
		}
	}

	function handler(){
		console.log("holaasdf");
	}
};

$(document).ready(ready);
$(document).on('page:load', ready);