$(document).ready(function() {

  $("#tweet").submit(function(event){
    event.preventDefault();
    var tweet = $(this).serialize();
    $.post("/tweet", tweet, function(data){
      $("present").text("EXITO!");
    });
      $("present").text("Mandando tweet...");
  });


  $("#tweet_f").submit(function(event){
    event.preventDefault();
    var tweet = $(this).serialize();
    $.post("/tweet_f", tweet, function(data){
      $("future").text("EXITO!");
    });
      $("future").text("Mandando tweet...");
  });
});
