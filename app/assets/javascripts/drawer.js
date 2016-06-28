var ready = function() {

	var daysArray =[];
	var aopArray =[];

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

	function closestCounties(){
		var urlID = location.protocol + "/closest_counties";
        $.ajax({
          url: urlID,
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          dataType: 'json',
          success: function(data){
          	console.log(data);
          }
        });
	}

	handleDayChange();
	handleAmountPlayersChange();
	dropDownInit();
	sliderChangeHandler();
	closestCounties();
};

$(document).ready(ready);
$(document).on('page:load', ready);