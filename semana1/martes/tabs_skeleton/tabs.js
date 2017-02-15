$(document).ready(function () {
  // Escribe tu código aquí

  $(".tabs li:eq(0)").click(function(){
    $(".tabs li:eq(0)").addClass("active");
    $(".tabs li:eq(1)").removeClass("active");
    $(".tabs li:eq(2)").removeClass("active");
    $("#tab1").show();
    $("#tab2").hide();
    $("#tab3").hide();

    });

  $(".tabs li:eq(1)").click(function(){
    $(".tabs li:eq(1)").addClass("active");
    $(".tabs li:eq(0)").removeClass("active");
    $(".tabs li:eq(2)").removeClass("active");
    $("#tab1").hide();
    $("#tab2").show();
    $("#tab3").hide();
    });

  $(".tabs li:eq(2)").click(function(){
    $(".tabs li:eq(2)").addClass("active");
    $(".tabs li:eq(1)").removeClass("active");
    $(".tabs li:eq(0)").removeClass("active");
    $("#tab1").hide();
    $("#tab2").hide();
    $("#tab3").show();
    });

});
