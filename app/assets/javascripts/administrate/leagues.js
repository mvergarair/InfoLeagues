var map;
function initMap() {

map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: -34.397, lng: 150.644},
  zoom: 15
});
}

var ready = function() {

	$("#modal-map-close").click(function(){
		$('#map-modal').removeClass('modal--active');
		$('#map-modal').children().children().first().removeClass('modal__content--active');
	});

	$('.location').click(function() {
		var location = $(this).attr('data-location').split(',');
		map.setCenter({ lat: parseFloat(location[0]), lng: parseFloat(location[1]) });
		var marker = new google.maps.Marker({
	    	position: { lat: parseFloat(location[0]), lng: parseFloat(location[1]) },
	    	map: map,
	    	title: ''
	  	});
	  	$('#title-map-modal').text($(this).children().last().text());
		$('#map-modal').addClass('modal--active');
		$('#map-modal').children().children().first().addClass('modal__content--active');
	})
	

	$('.mdl-tabs__tab-bar').each(function() {
		if ($(window).width() >= 400){
			return;
		}
		console.log($(this).children().length);
		if ($(this).children().length >=6){
			$(this).children().each(function(){
				$(this).css('padding' , '0 7px');
				$(this).css('font-size' , '12px');
			});
		}else if($(this).children().length>= 5){
			$(this).children().each(function(){
				$(this).css('padding' , '0 10px');
			});
		}
	});

	$('h3').each(function(){
		if ($(this).text().length > 16){
			$(this).css('font-size', '25px');
		}
	})
}

$(document).on('turbolinks:load', ready);