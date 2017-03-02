$(document).ready(function() {

  $("#tweet").submit(function(event){
    event.preventDefault();
    var tweet = $(this).serialize();
    $.post("/tweet", tweet, function(data){
      $("span").text("EXITO!");
    });
      $("span").text("Mandando tweet...");
  });
});
