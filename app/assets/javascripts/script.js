"use strict";
$(document).ready(function() {
// For sign up/log in/log out functionality and windows
  var signUpClick = $("li.signUpClick");
  var loginClick = $("li.loginClick");

  signUpClick.click(function() {
    $('#modal1').openModal();
  });

  loginClick.click(function() {
    $('#modal2').openModal();
  });
// End of sign up/log in/log out functionality and windows section


// Where API calls will be placed
  // $.ajax({           // 37bb9104ec72a52e1e0db0a67b4e5928
  //   method: "GET",
  //   url: "https://favqs.com/api/quotes/?filter=funny",
  //   dataType: 'json',
  //   success: function(data){
  //     console.log(data);
  //   }
  // })
  // .done(function() {
  //   console.log("success");
  // })
  // .fail(function() {
  //   console.log("error");
  // });
  // .always(function() {
  //   console.log("complete");
  // });
// End of section for API calls
});
