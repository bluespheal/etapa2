$(document).ready(function() {
 $("#slot-machine form").on("submit", function(event){
    event.preventDefault();
    var slot = $("die").serialize()
  });
 
});