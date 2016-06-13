"use strict";
$(document).ready(function() {
// For sign up/log in/log out functionality and windows
  var signUpClick = $(".signUpClick");
  var loginClick  = $(".loginClick");
  var tempHide    = $('div#tempHide');
  var chatBox    = $('div#chatBox');
  var chatBtn     = $('button#chatBtn');
  var closeChatBtn= $('button#closeChatBtn');
  var halfPanel   = $("div.half_bg");
  var fullPanel   = $("div.full_bg");
  var allPanels   = $("div.panel");
  var halfRandNum = 0;
  var fullRandNum = 0;
  var allRandNum  = 0;
  var cssOption   = [{ 'width': '200px', 'height': '80px', '-webkit-transform': 'skew(20deg)', '-moz-transform': 'skew(20deg)', '-o-transform': 'skew(20deg)', 'background': 'beige'},
  { 'width': '350px', 'height': '100px', '-webkit-transform': 'skew(-20deg)', '-moz-transform': 'skew(-20deg)', '-o-transform': 'skew(-20deg)', 'background': 'lightgreen'},
  { 'width': '350px', 'height': '100px', '-webkit-transform': 'skew(5deg)', '-moz-transform': 'skew(5deg)', '-o-transform': 'skew(5deg)', 'background': 'lightblue'},
  { 'width': '350px', 'height': '100px', '-webkit-transform': 'skew(-5deg)', '-moz-transform': 'skew(-5deg)', '-o-transform': 'skew(-5deg)', 'background': 'yellow'}];

  var chatBoxPositioning = [{ 'height': '200px', 'width': '200px'},{ 'position': 'absolute', 'right': '0', 'height': '340px', 'width': '320px'}];
  var ccbCSS = [{'display': 'block', 'position': 'relative', 'right': '125px'},{'display': 'inherit', 'position': 'inherit', 'right': 'auto'}];

  signUpClick.click(function() {
    $('#modal1').openModal();
  });

  loginClick.click(function() {
    $('#modal2').openModal();
  });
// End of sign up/log in/log out functionality and windows section

// VIDEO WINDOW SHOWING!
  chatBtn.click(function() {
    tempHide.show();
    chatBtn.hide();
    closeChatBtn.show();

    tempHide.css( chatBoxPositioning[1] );
    //closeChatBtn.css( ccbCSS[0] );
  });

// HIDE VIDEO WINDOW!
  closeChatBtn.click(function() {
    tempHide.hide();
    chatBtn.show();
    closeChatBtn.hide();

    tempHide.css( chatBoxPositioning[0] );
    //closeChatBtn.css( ccbCSS[1] );
  });

  halfPanel.each(function() {
    halfRandNum = Math.floor(Math.random() * 12) + 1;
    $(this).css(
      'background', 'white url("/assets/half_row_bgs/half_'+halfRandNum+'.jpg") no-repeat 0 0'
    );
  });

  fullPanel.each(function() {
    fullRandNum = Math.floor(Math.random() * 8) + 1;
    $(this).css(
      'background', 'white url("/assets/full_row_bgs/full_'+fullRandNum+'.jpg") no-repeat 0 0'
    );
  });

  allPanels.each(function() {
    // whichPanel = Math.floor(Math.random() * (allPanels.length)) + 1;
    allRandNum = Math.floor(Math.random() + 4) + 1;

    $(this).css(cssOption[allRandNum]);
  });


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


// Mobile hamburger menu
  (function($){
    $(function(){
      $('.button-collapse').sideNav();
    }); // end of document ready
  })(jQuery); // end of jQuery name space
// End of hamburger menu code
});
