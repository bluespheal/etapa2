$(document).ready(function() {
  $("form").on("submit", function(event){
    event.preventDefault();
    var cereal = $(this).serialize()
    $.post( "/abuelita", cereal ,function(data){
    $("#results").text(data)
    });
  });
});
