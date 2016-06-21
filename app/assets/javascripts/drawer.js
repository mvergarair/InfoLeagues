var ready = function() {

	var daysArray =[];
	var playersArray =[];

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
			$('#price-span').text($(this).val());
			$('#price').val($(this).val());
		});
	}

	function handleDayChange(){
		$('.checked-day').each(function (){
			daysArray.push($(this).attr('id').split('_')[1]);

		});
		$('.day-lab').mousedown(function(){
			var dayToBeAdded = $(this).children().first().attr('id').split('_')[1]
			if (daysArray.indexOf(dayToBeAdded) == -1){
				daysArray.push(dayToBeAdded)
			}else{
				daysArray.splice( daysArray.indexOf(dayToBeAdded) , 1)
			}
			$('#day').val(daysArray);
			$('#search_form').submit();
		});
	}

	
	handleDayChange();
	dropDownInit();
	sliderChangeHandler();
};

$(document).ready(ready);
$(document).on('page:load', ready);