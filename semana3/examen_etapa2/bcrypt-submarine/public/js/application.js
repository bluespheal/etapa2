//función que inicia el juego
function start_game(subOne, subTwo) {
  
  //variable que tiene un arreglo asignado con la posición de los dos submarinos a destruir
  var winner = randomCell();
  console.log(winner);
  
    $('.cell').on("click", function(evento){
      var playerClick = $(this).attr('id'); 
      var url = $('#play').attr('action');
      var lol = won(playerClick, winner);
      
      countForPlay += 1;
      if (countForPlay == 3 || (nowWinner == 2) ){
        $.post ("/games", {skill: nowWinner}, function(data){
        });
      }
    
    });
  
  //función para conocer el número de submarinos destruidos o si el jugador es ganador
  function won(playerValue, subValue) {
    if (nowWinner >= 2){
      status = true;
      alert("Game Over");
    }
    if (countForPlay <= 2) {
      if (playerValue == subValue[0] || playerValue == subValue[1]) {
        $('#' + playerValue).css("background","red");
        //variable que lleva el conteo de submarinos destruidos
        nowWinner += 1;
      }else{
        $('#' + playerValue).html("X");
      }
    }else{
      if (status == "false"){
        alert("Game Over");
      }
      if (countForPlay >= 2) {
        subValue.forEach(function(cel){
          $('#' + cel).css("background","red");
        });
      }
    }
    score(nowWinner);
  }
}

//función que muestra el score del jugador
function score(value) {
  if (value <= 2){
    $('h3').text('Destroyed Submarines: ' + value );
  }
  if (value == 2){
    $('#win').text('WINNER!');
  }
}

//función que genera el tablero de juego
var resetInit = function() {
  $("#container").empty();
  $("#container").innerHTML = '';
  $("#container div").fadeOut();
  $('#container').css('background','#FE7E25');
  $('.cell').css('color', 'orange');
  $('#container').css('background','#FFFFFF');
  $.each(new Array(9),
    function(n){ $('#container').append("<p class = 'cell'></p>");}
  );
  var i=0;
  $('.cell').each(function(){
    i++;
    var newID='c'+i;
    $(this).attr('id',newID);
    $(this).val(i);
});
}

//función que genera la posición de los dos submarinos
var randomCell = function() {
  //variables para asignar el valor de la posición de los submarinos
  var subOne = 0;
  var subTwo = 0;

  subOne = Math.floor((Math.random() * 9) + 1);  
  subTwo = Math.floor((Math.random() * 9) + 1);  

  if (subOne == subTwo){
    subTwo = Math.floor((Math.random() * 9) + 1);  
  }

  var valueSubOne = "c" + subOne;
  var valueSubTwo = "c" + subTwo;
  return [valueSubOne, valueSubTwo]
}


$(document).ready(function(){
	$('#play').on("submit", function(evento){
	  evento.preventDefault();
    var url = $('#play').attr('action');
    $('#win').text(" ");
    //variable que lleva el conteo de oportunidades por ronda
    countForPlay = 0;
    //variable que lleva el conteo de submarinos destruidos
    nowWinner = 0;
    //variable que termina el juego 'alert game over'
    status = false;
    //¿que debería ir aquí para comenzar el juego?
    resetInit();
    start_game();
  });
});