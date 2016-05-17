//= require jquery
//= require jquery_ujs
//= require selectize
//= require moment
//= require datetime_picker
//= require_tree .

var dat;
//facebook API
window.fbAsyncInit = function() {
  FB.init({
    appId      : '1756018021309970',
    xfbml      : true,
    version    : 'v2.6'
  });
};

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "//connect.facebook.net/en_US/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));

var ready = function() {

    var setNameInputBlurHandler = function(){
      $('#league_name').blur(function (argument) {

        //facebook call
        var urlCall = "/search?q="+ $('#league_name').val() + "&type=page&access_token=1756018021309970|ddll514iir8TI0cmv1oGlWijkO4";
        FB.api(urlCall, function(response) {
          if(response.data.length != 0){
            $('#league_facebook_link').val("https://www.facebook.com/" + response.data[0].id);
          }
        });

        //instagram call
        var instagramCall = "https://api.instagram.com/v1/users/search?q=" + $('#league_name').val() + "&access_token=15557922.1677ed0.55a4d614cb4a4bbbbaf48eb2894ad43c"
        $.ajax({
          url: instagramCall,
          dataType: 'jsonp',
          context: document.body,
          success: function(data){
            $('#league_instagram_link').val("https://www.instagram.com/" + data.data[0].username);
          }
        });

        //twitter call. goes through app server
        $.ajax({
          // beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: "http://" + (window.location.host) + "/twitter_search",
          type: 'GET',
          data: {
            "query" : $('#league_name').val()
          },
          dataType: 'jsonp',
          contentType: "application/json; charset=utf-8",
          context: document.body,
          success: function(data){
            console.log("data");
            console.log(data);
            dat=data;
          },
          error: function(data){
            console.log(data);
            console.log("eerrasd");
          }
        });
      })

    }

    setNameInputBlurHandler();
}

$(document).ready(ready);
$(document).on('page:load', ready);
