$(function() {



  $("#previous_frame").click(function(){
  $('.frames li:first').before($('.frames li:last'));
  $('.frames li:first').css({"margin-left": "-620px"});

  $(".frames li:first").animate({
    marginLeft: "+=620px"}, 1500 );
  });

  $("#next_frame").click(function(){
  $('li').css({"right": "auto"});
  $(".frames li").animate({
    right: "+=620px"}, 1500 );
  $('.frames').append($('.frames li:first'));
  });




  // $("#next_frame").click(function(){

  //   if (cd >= 3){
  //   cd = 3;
  //   } else {
  //   cd +=1
  //   $(".frames li:nth-child("+(cd)+")").animate({
  //   marginLeft: "-=620px"
  //   }, 1500 );
  //   console.log(cd);
  // }

  // });




  // });


});