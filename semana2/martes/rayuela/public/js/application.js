$(document).ready(function() {

  function throw_coin(player){
    n = 2;
    score1 = 0;
    m = 1;
    a = 2;
    score2 = 0;
    b = 1;
    $('td').removeClass("active");
    $('td').removeClass("winner");
    $('td').removeClass("lose");


    setTimeout(rollout, 30);
  }

  function rollout() {
    setTimeout(function () {
      $('#Player1>td:nth-child(' + n + ')').addClass("active");
      n++;
      $('#Player1>td:nth-child(' + m + ')').removeClass("active");
      m++;
      $('#Player2>td:nth-child(' + a + ')').addClass("active");
      a++;
      $('#Player2>td:nth-child(' + b + ')').removeClass("active");
      b++;

      $(document).keyup(function(e){
      var code = e.which
      if(code == 83) {n = 104; m = 104;}
      if(code == 75) {a = 104; b = 104;}
      });
      if (n < 104 || a < 104) {
        rollout();
      }
      if (n < 103){
        score1++;
      }
      if (a < 103){
        score2++;
      }
      if (n > 103 && a > 103) {
        checklast1();
        checklast2();
        checkwinner();
      }
    }, 10)
  }

  function checklast1(){
    var last_player1 = score1;
    console.log("Player1 = " +last_player1);
  }

  function checklast2(){
    var last_player2 = score2;
    console.log("Player2 = " +last_player2);
  }

  function checkwinner(){
    win_con = 89;
    if (score1 > score2){
      $("#player1").addClass("winner")
    }
    if (score1 < score2){
      $("#player2").addClass("winner")
    }
  }

	$("#start_btn").on("click", throw_coin);

});


