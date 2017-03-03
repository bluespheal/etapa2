$(document).ready(function() {
  $player1 = $('#Player1');
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

    game1 = setInterval(function(){ rollout($player1)}, 50);
    
    $(document).keyup(function(e){
      var code = e.which

      if(code == 83){ 
        place = $player1.find(".active").attr("id");
        scores.player1 = place
      }

      if (Object.keys(scores).length == 1) {
          check_winner(scores);
      }

    });
  }
}

function rollout(player) {
  player.find('.active').next().addClass('active');
  player.find('.active').prev().removeClass('active');
  
  if ($("#Player1 #101").hasClass("active")){
    game1_1 = setInterval(function(){ rollin($player1)}, 40);
    clearInterval(game1);
    clearInterval(game1_2);

  }
}

function rollin(player) {
  player.find('.active').prev().addClass('active');
  player.find('.active').next().removeClass('active');

  if ($("#Player1 #2").hasClass("active")){
  game1_2 = setInterval(function(){ rollout($player1)}, 30);
  clearInterval(game1_1);
  clearInterval(game1);

  }

}

function check_winner(scores){   

  win_con = 50;

  score1 = Number(scores.player1);

  console.log(score1);
}

function reset_game(){
  timer = 2;
  $("#result").text("")
  $('td').removeClass("winner");
  $('td').removeClass("draw");
  $('td').removeClass("lose");
  $('td').removeClass("active");
  $('td:nth-child(2)').addClass("active");
  $(document).off("click", "#start_btn");

}
