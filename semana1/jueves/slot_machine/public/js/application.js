$(document).ready(function() {
 $("#slot").on("submit", function(event){
    event.preventDefault();
    var slot = $(this).serialize()
    // console.log( "Data Loaded: " + slot );
    $.post( "/rolls", slot ,function(data){
      // console.log( "Data Loaded: " + data );
    $("#die").html(data)
    });
  });
});