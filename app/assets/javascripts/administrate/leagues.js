var ready = function() {

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