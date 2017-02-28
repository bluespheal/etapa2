function validateEmail(email){
  var emailre = /([\w_\d\-]+)?@[\w]+\.[\w]{2,}/
  return emailre.test(email);
}

function validatePasswordLen(password){
  var passwordre = /[A-Za-z0-9]{8,}/
  return passwordre.test(password);      
}

function validatePasswordUp(password){
  var passwordre = /(?=.*[A-Z])[A-Za-z0-9]/
  return passwordre.test(password);      
}

function validatePasswordNum(password){
  var passwordre = /(?=.*[0-9])[A-Za-z0-9]/
  return passwordre.test(password);      
}

function validate() {
    mail = document.getElementById("email").value;
    pass = document.getElementById("password").value;

    if (validateEmail(mail)) {
      $("#emailerr").removeClass('active');
    } else { 
      $("#emailerr").addClass('active');
      text = "Debes escribir una direccion de email valida";
      document.getElementById("emailerr").innerHTML = text;
    }

    if (validatePasswordLen(pass)) {
      $("#passlen").removeClass('active');
    } else { 
      $("#passlen").addClass('active');
      text = "El password debe de tener al menos 8 caracteres";
      document.getElementById("passlen").innerHTML = text;
    }

    if (validatePasswordUp(pass)) {
      $("#passup").removeClass('active');
    } else { 
      $("#passup").addClass('active');
      text = "El password debe contener al menos una mayuscula";
      document.getElementById("passup").innerHTML = text;
    }

    if (validatePasswordNum(pass)) {
      $("#passnum").removeClass('active');
    } else { 
      $("#passnum").addClass('active');
      text = "El password debe tener al menos un caracter numerico (0-9)";
      document.getElementById("passnum").innerHTML = text;
    }


}