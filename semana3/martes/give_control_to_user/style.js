$(function(){
  $( "#style_editor" ).submit(function( event ) {
  event.preventDefault();

  var selector = $("#style_editor input:first").val();
  var property = $("#style_editor input:nth-child(2)").val();
  var value = $("#style_editor input:nth-child(3)").val();

  $(selector).css(property , value);

  });
});
