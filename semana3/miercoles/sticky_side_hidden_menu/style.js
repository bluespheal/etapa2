$(function(){
  $( "#pop" ).click(function( event ) {
    event.preventDefault();
    if ($(this).hasClass("toggle") ){
    $("#pop").text('\u2190');
    $("nav li:not(#pop)").addClass("active");
    $("nav").animate({
    left: "0px",
    }, 500 );
    } else {
    $("#pop").text('\u2192');
    $("nav li:not(#pop)").removeClass("active");
    $("nav").animate({
    left: "-110px",
    }, 500 );
    }
    $("#pop").toggleClass("toggle")
  });
});
