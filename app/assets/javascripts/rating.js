var ready = function() {
	$('.rate-star').mouseover(function (){
		var hoveredStar = $(this).attr('data-star-number');
		hoveredStar = parseInt(hoveredStar);
		var hoveredResource = $(this).attr('data-star-id');
		for (var i = hoveredStar; i >= 0; i--) {
			$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').text('star');
		}
		for (var i = hoveredStar+1 ; i <= 4; i++) {
			$('.rate-star[data-star-number="' + i + '"][data-star-id="'+ hoveredResource + '"]').text('star_border');
		}
	});

	$('.rate').mouseleave(function(){
		var rating = $(this).attr("data-rate");
		var hoveredResource = $(this).attr('data-id');
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
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);