$(document).ready(function() {
  $player1 = $('#Player1');
  $player2 = $('#Player2');
  scores = {};

  $("#start_btn").on("click", throw_coin);
});

function throw_coin(){
  reset_game();
  timer_c = setInterval(function(){ start_timer() }, 1000);
}

function start_timer(){
  $('#timer').text("Empieza en : " + timer);
  timer--;

  if (timer < 0) {

    // $('#timer').text("YA!");
    clearInterval(timer_c);

    game1 = setInterval(function(){ rollout($player1)}, 10);
    game2 = setInterval(function(){ rollout($player2)}, 10);
    
    $(document).keyup(function(e){
      var code = e.which

      if(code == 83){ 
        clearInterval(game1);
        place = $player1.find(".active").attr("id");
        scores.player1 = place
      }

      if(code == 75) { 
        clearInterval(game2);
        place = $player2.find(".active").attr("id");
        scores.player2 = place
      }

      if (Object.keys(scores).length == 2) {
          check_winner(scores);
      }

    });
  }
}

function rollout(player) {
  player.find('.active').next().addClass('active');
  player.find('.active').prev().removeClass('active');

  if ($("#Player1 #101").hasClass("active")){
    clearInterval(game1);
  }

  if ($("#Player2 #101").hasClass("active")){
    clearInterval(game2);
  }

}

function check_winner(scores){   

  $("#start_btn").on("click", throw_coin);

  win_con = 89;

  score1 = Number(scores.player1);
  score2 = Number(scores.player2);

  if (score1 > 89 && score2 > 89){
    $("#result").text("Ambos pierden :(")
    $("td").addClass("lose")
  }

  if ((score1 > score2 || score2 > 89) && score1 <= 89 ){
    $("#result").text("Gana Jugador1! :D")
    $("#Player1 td").addClass("winner")
  }

  if ((score1 < score2 || score1 > 89) && score2 <= 89 ){
    $("#result").text("Gana Jugador2! :D")
    $("#Player2 td").addClass("winner")
  }

  if (score1 == score2 && (score1 < 89 || score2 < 89)){
    $("#result").text("Es un empate! :O")
    $("td").addClass("draw")
  }
}

function reset_game(){
  timer = 3;
  $("#result").text("")
  $('td').removeClass("winner");
  $('td').removeClass("draw");
  $('td').removeClass("lose");
  $('td').removeClass("active");
  $('td:nth-child(2)').addClass("active");
  $(document).off("click", "#start_btn");

}
