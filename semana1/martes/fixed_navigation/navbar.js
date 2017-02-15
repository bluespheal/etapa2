$(window).on("scroll", function () {
  // Aquí deberás escribir la lógica que modificará la barra
  var stick = $('nav'),
      scroll = $(window).scrollTop();

  if (scroll >= 150) stick.addClass('transparency')
    else stick.removeClass('transparency')
});
