const fetchF = async (body) => {
  const e = await fetch("BackEnd/actions.php", {
    method: "POST",
    body,
  });
  const data = await e.text();

  return data;
};

let btn_r = document.querySelector("#btnR"),
  btn_L = document.querySelector("#btnL"),
  btn_Login = document.querySelector("#btn-ingresar"),
  btn_Registro = document.querySelector("#btn-registro"),
  form = new FormData();

//funciones de la pagina de login

if (btn_r) {
  btn_r.addEventListener("click", (e) => {
    e.preventDefault();
    window.location = "/sistema/register.php";
  });
  btn_Login.addEventListener("click", (e) => {
    e.preventDefault();
    (correo = document.querySelector("#email")),
      (clave = document.querySelector("#password"));

    if (correo.value == "" || clave.value == "") {
      swal.fire("Opps!", "Por Favor rellene todos los campos", "error");
    } else {
      form.append("correo", correo.value);
      form.append("clave", clave.value);
      form.append("actions", "Login");

      fetchF(form).then((e) => {
        console.log(e);
        if (e == "True") {
          window.location = "/sistema/";
        }
        if (e == "False") {
          swal.fire(
            "Sistema!",
            "El correo y/o Contraseña son incorrectos",
            "error"
          );
        }
      });
    }
  });
}

//funciones de la pagina de registro

if (btn_L) {
  btn_L.addEventListener("click", (e) => {
    e.preventDefault();
    window.location = "/sistema/login.php";
  });

  btn_Registro.addEventListener("click", (e) => {
    e.preventDefault();
    const nombre = document.querySelector("#nombre"),
      apellido = document.querySelector("#apellido"),
      correo = document.querySelector("#email"),
      clave = document.querySelector("#password");

    //validamos que todos los campos del formulario esten llenos
    if (
      nombre.value == "" ||
      apellido.value == "" ||
      correo.value == "" ||
      clave.value == ""
    ) {
      swal.fire("Opps!", "Por Favor rellene todos los campos", "error");
    } else {
      form.append("nombre", nombre.value);
      form.append("apellido", apellido.value);
      form.append("correo", correo.value);
      form.append("clave", clave.value);
      form.append("actions", "Registro");

      fetchF(form).then((e) => {
        if (e == "True") {
          swal.fire(
            "Sistema!",
            "Usuario Registrado Con exito, pulse el boton de ingresar para entrar al sistema",
            "success"
          );
        }
        if (e == "false") {
          swal.fire(
            "Sistema!",
            "El correo ya se encuentra en el sistema",
            "error"
          );
        }
      });
    }
  });
}
