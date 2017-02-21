<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("*").dblclick(function(){
    $("*").css({"font-size": "300%"});
      });
});
</script>

$(document).ready(function(){
    $("button").click(function(){
        $("p").hide();
    });
});