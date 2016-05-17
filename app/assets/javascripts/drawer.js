var ready = function() {

	function dropDownInit() {
		$('.word-menu').click(function(){
			$(this).next().slideToggle("fast", function(){
				if($(this).is(":visible")){
					$(this).prev().children().last().text("arrow_drop_up");	
				}else{
					$(this).prev().children().last().text("arrow_drop_down");	
				}
			});
		});	
	}

	function sliderChangeHandler(){
		$("#price-slider").on("input change", function() {
			$('#price').text($(this).val());
		});
	}

	

	dropDownInit();
	sliderChangeHandler();
};

$(document).ready(ready);
$(document).on('page:load', ready);