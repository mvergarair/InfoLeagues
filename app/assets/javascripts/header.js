var ready = function() {

  function searchFocusHandler(){
    $('.search-input').focus( function(){
      $('.search-div').toggleClass('box-shad');
      $('.search-div').css('background-color', "rgba(255,255,255,1)");
      $('.search-icon .material-icons').css("color", "black");      
    });
    $('.search-input').blur( function(){
      $('.search-div').toggleClass('box-shad');
      $('.search-icon .material-icons').css("color", "white");
      $('.search-div').css('background-color', "rgba(255,255,255,0.5)");
      $('.search-input').val("");
      $('.spin').hide();
      $('.search-icon').show();
    });
    $('.search-input').hover( function(){
      if (($('.search-input').is(":focus"))){
        $('.search-div').css('background-color', "rgba(255,255,255,1)"); 
      }else{
        $('.search-div').css('background-color', "rgba(255,255,255,0.6)"); 
      }
    }, function(){
      if (!($('.search-input').is(":focus"))){
        $('.search-div').css('background-color', "rgba(255,255,255,0.5)"); 
      }
    });
  }

	function setAutocompleteHandler() {
		$( "#search" ).autocomplete({
		  open: function() {
        var postition = $('.search-div').offset();
        postition = {left: postition.left, top: postition.top + $('.search-div').height()}
        $(".ui-autocomplete").css(postition);
        $(".ui-autocomplete").width($('.search-div').width());
        $('.search-div').css("border-bottom-left-radius" , "0px");
        $('.search-div').css("border-bottom-right-radius" , "0px");
		  },
		}).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
        return $( "<li style='display: flex; align-items: center; padding-top: 0.4em; padding-bottom: 0.4em;'></li>" )
            .data( "item.autocomplete", item )
            .append( "<i class='material-icons' style='margin: 0 0 0em 4%;'>search</i>" + 
              "<span class='item-span'>" +item.label + "</span>")
            .appendTo( ul );
   };

    $( "#search" ).bind( "autocompleteselect", function(event, ui) {
      $(this).parent().submit();
    });
    $("#search").on("autocompletefocus", function(event,ui) {
      $("#search").val($(".ui-state-focus").children().last().text());
    });
    $("#search").on("autocompletesearch", function(event,ui) {
      $('.search-icon').hide();
      $('.spin').show();
    });
    $("#search").on("autocompleteclose", function(event,ui) {
      $('.search-div').css("border-bottom-left-radius", "2px");
      $('.search-div').css("border-bottom-right-radius" , "2px"); 
    });
    $( "#search" ).on( "autocompleteresponse", function( event, ui ) {
      $(".spin").hide();
      $(".search-icon").show();
    });

	}


	setAutocompleteHandler();
  searchFocusHandler();

};


$(document).on('turbolinks:load', ready);