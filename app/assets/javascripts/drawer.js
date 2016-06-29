var ready = function() {

	var daysArray =[];
	var aopArray =[];
	var countyArray =[];

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
			$('#price').val($(this).val() * 1000);
		});
		$('#price-slider').mouseup(function(){
			$('#search_form').submit();
		});
	}

	function handleDayChange(){
		$('.checked-day').each(function (){
			daysArray.push($(this).attr('id').split('_')[1]);
			$('#day').val(daysArray);
		});
		$('.day-lab').mousedown(function(){
			var dayToBeAdded = $(this).children().first().attr('id').split('_')[1];
			if (daysArray.indexOf(dayToBeAdded) == -1){
				daysArray.push(dayToBeAdded);
			}else{
				daysArray.splice( daysArray.indexOf(dayToBeAdded) , 1);
			}
			$('#day').val(daysArray);
			$('#search_form').submit();
		});
	}

	function handleAmountPlayersChange(){
		$('.checked-aop').each(function(){
			aopArray.push($(this).attr('id').split('_')[1]);
			$('#amount_of_players').val(aopArray);
		});
		$('.aop-lab').mousedown(function() {
			var aopToBeAdded = $(this).children().first().attr('id').split('_')[1];
			if (aopArray.indexOf(aopToBeAdded) == -1){
				aopArray.push(aopToBeAdded);
			}else{
				aopArray.splice( aopArray.indexOf(aopToBeAdded) , 1);
			}
			$('#amount_of_players').val(aopArray);
			$('#search_form').submit();
		});
	}

	function handleCountyChange(){
		$('.checked-county').each(function(){
			countyArray.push($(this).attr('id').split('_')[1]);
			$('#county').val(countyArray);
		});
		$('.county-lab').mousedown(function(){
			var countyToBeAdded = $(this).children().first().attr('id').split('_')[1];
			if (countyArray.indexOf(countyToBeAdded) == -1){
				countyArray.push(countyToBeAdded);
			}else{
				countyArray.splice( countyArray.indexOf(countyToBeAdded) , 1);
			}
			$('#county').val(countyArray);
			$('#search_form').submit();
		})
	}

	function handleCountyFinderChange(){
		$('.county-search').keyup(function(){
			console.log('change');
			if($(this).val().length == 0){
				console.log('lenght 0')
				$('.no-check-county').each(function(){
					$(this).css('display', 'block');
				});
				return;	
			}
			$('.no-check-county').each(function(){
				str = $('.county-search').val().toLowerCase();
				rev = $(this).attr('for').split('_')[1].toLowerCase();
				if(rev.indexOf(str) == -1){
					$(this).css('display', 'none');
				}else{
					$(this).css('display', 'block');
				}
			});
		});
	}

	handleDayChange();
	handleAmountPlayersChange();
	dropDownInit();
	sliderChangeHandler();
	handleCountyChange();
	handleCountyFinderChange();
};

$(document).ready(ready);
$(document).on('page:load', ready);