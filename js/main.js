let url = window.location.pathname.split("/", 2)[1];
let error = $(".alert-danger");
let succes = $(".alert-success");
let contenido = $(".table, .menu");
let tablaAlumno = $(".alumno");
let welcome = $(".welcome");
let token = localStorage.getItem("token");
let usuario = JSON.parse(localStorage.getItem("usuario"));
const primeraLetraMayuscula = (cadena) =>
  cadena.charAt(0).toUpperCase().concat(cadena.substring(1, cadena.length));

if (url === "login" || url === "register") {
  if (token) window.location = "inicio/" + token;

  let body = $("body");

  let titulos = $("h1,h2");

  titulos.css("color", "black");

  body.css({
    background: `url("/img/1.jpg")`,
    "background-repeat": "no-repeat",
    "background-size": "cover",
    "background-position": "center",
  });

  let form = document.querySelector("form");

  form.onsubmit = (e) => {
    e.preventDefault();
  };
}

if (url === "inicio") {
  let bienvenida = $(".welcome h5 span");
  let nombre = primeraLetraMayuscula(usuario.nombre);
  bienvenida.text(nombre);
}

if (url === "login") {
  function login() {
    let formData = new FormData();

    let form = {
      email: $("#email").val(),
      password: $("#password").val(),
    };

    if (form.email === "") {
      error.css("display", "block");
      return error.html("Por Favor Ingrese un correo<br>");
    }
    if (form.password === "") {
      error.css("display", "block");
      return error.html("Por Favor Ingrese una contraseña<br>");
    }

    formData = form;

    fetch("login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    })
      .then((e) => e.json())
      .then((e) => {
        if (!e.ok) {
          error.css("display", "block");
          return error.html(e.mensaje);
        }

        let usuario = e.usuario;
        let usuarioFinal = JSON.stringify(usuario);

        localStorage.setItem("usuario", usuarioFinal);
        localStorage.setItem("token", e.token);

        window.location = "inicio/" + e.token;
      });
  }
}

if (url === "register") {
  function register() {
    let formData = new FormData();

    let form = {
      nombre: $("#nombre").val(),
      apellido: $("#apelldio").val(),
      email: $("#email").val(),
      password: $("#password").val(),
    };
    if (form.email === "") {
      succes.css("display", "none");
      error.css("display", "block");
      return error.html("Por Favor Ingrese un correo<br>");
    }
    if (form.password === "") {
      succes.css("display", "none");
      error.css("display", "block");
      return error.html("Por Favor Ingrese una contraseña<br>");
    }
    if (form.nombre === "") {
      succes.css("display", "none");
      error.css("display", "block");
      return error.html("Por Favor Ingrese un nombre<br>");
    }
    if (form.apellido === "") {
      succes.css("display", "none");
      error.css("display", "block");
      return error.html("Por Favor Ingrese un apellido<br>");
    }

    formData = form;

    fetch("register", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    })
      .then((e) => e.json())
      .then((e) => {
        if (!e.ok) {
          error.css("display", "block");
          return error.html(e.mensaje);
        }
        error.css("display", "none");
        succes.css("display", "block");
        succes.html(e.mensaje);

        setTimeout(() => {
          window.location = "/login";
        }, 1500);
      });
  }
}

function cerrar() {
  localStorage.removeItem("token");
}

//muetras una año y seccion

let seccionNav = (año, seccion) => {
  let agregar = document.querySelector("tbody");

  localStorage.setItem("año", año);
  localStorage.setItem("seccion", seccion);

  welcome.css("display", "none");
  tablaAlumno.css("display", "none");
  contenido.css("display", "block");

  let titulo = $(".menu h5");
  let añoDB = 0;

  if (año == 1) añoDB = "primer_año";
  if (año == 2) añoDB = "segundo_año";
  if (año == 3) añoDB = "tercer_año";
  if (año == 4) añoDB = "cuarto_año";
  if (año == 5) añoDB = "quinto_año";

  switch (año) {
    case 1:
      titulo.text(`Primer Año Seccion "${seccion}"`);
      break;
    case 2:
      titulo.text(`Segundo Año Seccion "${seccion}"`);
      break;
    case 3:
      titulo.text(`Tercer Año Seccion "${seccion}"`);
      break;
    case 4:
      titulo.text(`Cuarto Año Seccion "${seccion}"`);
      break;
    case 5:
      titulo.text(`Quinto Año Seccion "${seccion}"`);
      break;
  }

  let form = new FormData();

  form.append("año", añoDB);
  form.append("seccion", seccion);
  form.append("actions", "Buscar Alumnos");

  $("#exportAlumnosAreas").DataTable().destroy();

  fetch("BackEnd/actions.php", {
    method: "post",
    body: form,
  })
    .then((e) => e.text())
    .then((data) => {
      data = JSON.parse(data);
      agregar.innerHTML = "";
      let alumnos = data;

      for (let i = 0; i < alumnos.length; i++) {
        let form2 = new FormData();

        form2.append("año", añoDB);
        form2.append("notas", alumnos[i][14]);
        form2.append("actions", "Editar");

        fetch("BackEnd/actions.php", {
          method: "post",
          body: form2,
        })
          .then((e) => e.text())
          .then((data) => {
            data = JSON.parse(data);

            let notas = data;

            let primer_lapso = 0;

            let segundo_lapso = 0;

            let tercer_lapso = 0;

            let notaFinal = 0;

            materias = Object.entries(notas);
            notas = Object.values(notas);

            for (let i = 1; i < notas.length; i++) {
              primer_lapso += parseInt(JSON.parse(notas[i]).primer_lapso);
              segundo_lapso += parseInt(JSON.parse(notas[i]).segundo_lapso);
              tercer_lapso += parseInt(JSON.parse(notas[i]).tercer_lapso);
            }

            primer_lapso = primer_lapso / parseInt(notas.length - 1);
            segundo_lapso = segundo_lapso / parseInt(notas.length - 1);
            tercer_lapso = tercer_lapso / parseInt(notas.length - 1);

            notaFinal = (primer_lapso + segundo_lapso + tercer_lapso) / 3;

            agregar.innerHTML += `
                            <tr>
                            <th scope="row">${i + 1}</th>
                            <td>${format(alumnos[i][1])}</td>
                            <td>${alumnos[i][3].toUpperCase()} </td>
                            <td>${alumnos[i][4].toUpperCase()}</td>
                            <td>${parseInt(primer_lapso)}</td>
                            <td>${parseInt(segundo_lapso)}</td>
                            <td>${parseInt(tercer_lapso)}</td>
                            <td>${notaFinal.toFixed(1)}</td>
                            <td> 
                            <div class="btn-group">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Modificar
                            </button>
                            <div class="dropdown-menu">
                            <a class="dropdown-item" onclick="editar(${
                              alumnos[i][1]
                            },'${alumnos[i][3].trim()} ${alumnos[
              i
            ][4].trim()}',${alumnos[i][14]},'${seccion}',${
              alumnos[i][16]
            })" href="#">Editar</a>
                            <a class="dropdown-item" onclick="eliminarAlumno(${
                              alumnos[i][1]
                            })"  href="#">Eliminar</a>
                            </div>
                            </div>
                            </td>
                            </tr>`;
          });
      }
    });
};

//agregarmos un alumno

function alumno() {
  let año = localStorage.getItem("año");
  let seccion = localStorage.getItem("seccion");
  $("#modal").removeAttr("data-bs-dismiss");

  let añoDB = "";

  if (año == 1) añoDB = "primer_año";
  if (año == 2) añoDB = "segundo_año";
  if (año == 3) añoDB = "tercer_año";
  if (año == 4) añoDB = "cuarto_año";
  if (año == 5) añoDB = "quinto_año";

  let form = new FormData();
  form.append("nombre", $("#Nombre").val().trim());
  form.append("apellido", $("#Apellido").val().trim());
  form.append("cedula", $("#Cedula").val());
  form.append("cedulaE", $("#cedulaEscolar").prop("checked"));
  form.append("sexo", $("#Sexo").val());
  form.append("Fnacimiento", $("#fechaNacimiento").val());
  form.append("edad", $("#Edad").val());
  form.append("LugarNacimiento", $("#LugarNacimiento").val());
  form.append("Telfono", $("#Telfono").val());
  form.append("Direccion", $("#Direccion").val());
  form.append("Correo", $("#Correo").val());
  form.append("nombreR", $("#NombreR").val());
  form.append("apellidoR", $("#ApellidoR").val());
  form.append("cedulaR", $("#CedulaR").val());
  form.append("sexoR", $("#SexoR").val());
  form.append("Filiacion", $("#Filiacion").val());
  form.append("TelfonoR", $("#TelfonoR").val());
  form.append("DireccionR", $("#DireccionR").val());
  form.append("CorreoR", $("#CorreoR").val());
  form.append("año", añoDB);
  form.append("seccion", seccion);
  form.append("actions", "Alumno");

  if ($("#Nombre").val() === "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese un nombre");
  }
  if ($("#Apellido").val() === "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese un apellido");
  }
  if ($("#Cedula").val() === "") {
    succes.css("display", "none");
    error.css({ display: "block" });
    return error.text("Por Favor Ingrese un cedula");
  }
  $("#modal").attr("data-bs-dismiss", "modal");
  fetch("BackEnd/actions.php", {
    method: "POST",
    body: form,
  })
    .then((e) => e.text())
    .then((data) => {
      console.log(data);
      if (data !== "Alumno agregado con exito") {
        succes.css("display", "none");
        error.css("display", "block");
        return error.html(data);
      }
      error.css("display", "none");
      succes.css("display", "block");
      succes.html(data);
      setTimeout(() => {
        succes.css("display", "none");
      }, 5000);
      seccionNav(año, seccion);
    });
}

function format(input) {
  var num = input;
  if (!isNaN(num)) {
    num = num
      .toString()
      .split("")
      .reverse()
      .join("")
      .replace(/(?=\d*\.?)(\d{3})/g, "$1.");
    num = num.split("").reverse().join("").replace(/^[\.]/, "");
    return num;
  }
}

//motramos las notas de un alumno

function editar(cedula, nombre, notas, sec, representante) {
  $("#notasexport").DataTable().destroy();

  let agregar = document.getElementById("notasAlumnos");

  contenido.css("display", "none");
  tablaAlumno.css("display", "block");

  let año = localStorage.getItem("año");

  let añoDB = "";

  if (año == 1) añoDB = "primer_año";
  if (año == 2) añoDB = "segundo_año";
  if (año == 3) añoDB = "tercer_año";
  if (año == 4) añoDB = "cuarto_año";
  if (año == 5) añoDB = "quinto_año";

  let form = new FormData();

  form.append("cedula", cedula);
  form.append("año", añoDB);
  form.append("notas", notas);
  form.append("actions", "Editar");

  $("#Alumnoexport").DataTable({
    paging: false,
    searching: false,
    ordering: false,
    retrieve: true,
    dom: "Bfrtip",
    language: {
      url: "http://localhost/sistema/DataTables/Spanish.json",
    },
    buttons: [
      {
        extend: "excelHtml5",
        ttileAttr: "Exportar a excel",
        text: "Exportar a Excel",
        title: `Alumno  ${nombre}   C.I: ${
          format(cedula) + " "
        }  Año: ${año}  Seccion:  ${sec}`,
      },
    ],
  });

  agregar.innerHTML = ``;

  fetch("BackEnd/actions.php", {
    method: "POST",
    body: form,
  })
    .then((e) => e.text())
    .then((data) => {
      data = JSON.parse(data);

      let notasObject = data;

      let materiasObject = data;

      localStorage.setItem("DBnotas", JSON.stringify(notasObject));

      notasObject = Object.values(notasObject);

      materiasObject = Object.entries(materiasObject);

      for (let i = 1; i < materiasObject.length; i++) {
        agregar.innerHTML += `
                <tr>
                <th scope="row">${materiasObject[i][0].replaceAll(
                  "_",
                  " "
                )}</th>
                <td class="text-center">${parseInt(
                  JSON.parse(notasObject[i]).primer_lapso
                )}</td>
                <td class="text-center">${parseInt(
                  JSON.parse(notasObject[i]).segundo_lapso
                )}</td>
                <td class="text-center">${parseInt(
                  JSON.parse(notasObject[i]).tercer_lapso
                )}</td>
                <td class="text-center">${(
                  (parseInt(JSON.parse(notasObject[i]).primer_lapso) +
                    parseInt(JSON.parse(notasObject[i]).segundo_lapso) +
                    parseInt(JSON.parse(notasObject[i]).tercer_lapso)) /
                  3
                ).toFixed(1)}</td>
                <td></td>
                <td></td>
                <td></td>
                <td> 
                <button type="button" class="btn btn-primary" onclick="editarN('${
                  materiasObject[i][0]
                }',${JSON.parse(
          notasObject[0]
        )}, ${notas}, '${nombre}', ${cedula},${parseInt(
          JSON.parse(notasObject[i]).primer_lapso
        )},${parseInt(JSON.parse(notasObject[i]).segundo_lapso)},${parseInt(
          JSON.parse(notasObject[i]).tercer_lapso
        )})" data-bs-toggle="modal" data-bs-target="#editarnotas">
                editar
                </button>
                </td>
                </tr>`;
      }
      $("#notasexport").DataTable({
        paging: false,
        ordering: false,
        retrieve: true,
        dom: "Bfrtip",
        language: {
          url: "http://localhost/sistema/DataTables/Spanish.json",
        },
        buttons: [
          {
            extend: "excelHtml5",
            className: "export",
            ttileAttr: "Exportar a excel",
            text: "Exportar a Excel",
            title: `Alumno  ${nombre}   C.I: ${
              format(cedula) + " "
            }  Año: ${año}  Seccion:  ${sec}`,
            exportOptions: {
              columns: ":visible",
            },
          },
          "colvis",
        ],
        columnDefs: [
          {
            targets: -1,
            visible: false,
          },
        ],
      });
    });
}

//editar las notas del alumno

function editarN(materia, id, nota, nombre, cedula, p, s, t) {
  document.querySelector("#primer_lapso").value = p;
  document.querySelector("#segundo_lapso").value = s;
  document.querySelector("#tercer_lapso").value = t;

  localStorage.setItem("materia", materia);
  localStorage.setItem("idMaterias", id);
  localStorage.setItem("nota", nota);
  localStorage.setItem("nombre", nombre);
  localStorage.setItem("cedula", cedula);
}

function enviarNotas() {
  let año = localStorage.getItem("año");
  let materia = localStorage.getItem("materia");
  let nota = localStorage.getItem("nota");
  let nombre = localStorage.getItem("nombre");
  let cedula = localStorage.getItem("cedula");
  let id = localStorage.getItem("idMaterias");

  let añoDB = "";

  if (año == 1) añoDB = "primer_año";
  if (año == 2) añoDB = "segundo_año";
  if (año == 3) añoDB = "tercer_año";
  if (año == 4) añoDB = "cuarto_año";
  if (año == 5) añoDB = "quinto_año";

  let lapsos = {
    primer_lapso: 0,
    segundo_lapso: 0,
    tercer_lapso: 0,
    ap: 0,
  };

  lapsos.primer_lapso = $("#primer_lapso").val();
  lapsos.segundo_lapso = $("#segundo_lapso").val();
  lapsos.tercer_lapso = $("#tercer_lapso").val();

  let aux =
    (parseFloat(lapsos.primer_lapso) +
      parseFloat(lapsos.segundo_lapso) +
      parseFloat(lapsos.tercer_lapso)) /
    3;

  aux >= 10 ? (lapsos.ap = 1) : (lapsos.ap = 0);

  let form = new FormData();

  form.append("materia", materia);
  form.append("nota", id);
  form.append("año", añoDB);
  form.append("datos", JSON.stringify(lapsos));
  form.append("actions", "mofificar Notas");

  if (
    lapsos.primer_lapso == "" ||
    lapsos.primer_lapso > 20 ||
    lapsos.primer_lapso < 0
  ) {
    succes.css("display", "none");
    error.css("display", "block");
    return error.html("Por favor ingrese una nota ( minimo: 0 / maximo: 20 )");
  }
  if (
    lapsos.segundo_lapso == "" ||
    lapsos.segundo_lapso > 20 ||
    lapsos.segundo_lapso < 0
  ) {
    succes.css("display", "none");
    error.css("display", "block");
    return error.html("Por favor ingrese una nota ( minimo: 0 / maximo: 20 )");
  }
  if (
    lapsos.tercer_lapso == "" ||
    lapsos.tercer_lapso > 20 ||
    lapsos.tercer_lapso < 0
  ) {
    succes.css("display", "none");
    error.css("display", "block");
    return error.html("Por favor ingrese una nota ( minimo: 0 / maximo: 20 )");
  }

  $("#btnAgragar").attr("data-dismiss", "modal");
  error.css("display", "none");
  fetch("BackEnd/actions.php", {
    method: "POST",
    body: form,
  })
    .then((e) => e.text())
    .then((data) => {
      data = JSON.parse(data);
      error.css("display", "none");
      succes.css("display", "block");
      succes.html("Las notas han sido actualizadas");
      editar(cedula, nombre, nota);
      setTimeout(() => {
        succes.css("display", "none");
      }, 5000);
    });
}

//pasar alumnos de seccion

function PasarSeccion() {
  console.log("object");
  let año = localStorage.getItem("año");
  let seccion = localStorage.getItem("seccion");

  let añoDB = "";

  if (año == 1) añoDB = "primer_año";
  if (año == 2) añoDB = "segundo_año";
  if (año == 3) añoDB = "tercer_año";
  if (año == 4) añoDB = "cuarto_año";
  if (año == 5) añoDB = "quinto_año";

  let data = new FormData();

  data.append("año", añoDB);
  data.append("seccion", seccion);
  data.append("actions", "Pasar Seccion");

  fetch("BackEnd/actions.php", {
    method: "POST",
    body: data,
  })
    .then((r) => r.text())
    .then((data) => {
      console.log(data);
    });
}

//generar reporte de notas de los alumnos de una seccion

function reporte() {
  let año = localStorage.getItem("año");
  let seccion = localStorage.getItem("seccion");
  window.open(
    `/sistema/reporte.php?anio=${año}&seccion=${seccion}`,
    "",
    "width=1024,height=720,toolbar=yes"
  );
}
function test() {
  let data = window.location.search.split("&", 3);
  let año = data[0];
  let seccion = data[1];
  año = parseInt(año.split("=")[1]);
  seccion = seccion.split("=")[1];

  let agregar = document.querySelector("#NotasAlumnos");

  let añoDB = 0;

  if (año == 1) añoDB = "primer_año";
  if (año == 2) añoDB = "segundo_año";
  if (año == 3) añoDB = "tercer_año";
  if (año == 4) añoDB = "cuarto_año";
  if (año == 5) añoDB = "quinto_año";

  let form = new FormData();

  $("#AreasAlumnos").DataTable().destroy();

  form.append("año", añoDB);
  form.append("seccion", seccion);
  form.append("actions", "Buscar Alumnos");

  fetch("BackEnd/actions.php", {
    method: "post",
    body: form,
  })
    .then((e) => e.text())
    .then((data) => {
      data = JSON.parse(data);
      agregar.innerHTML = "";
      let alumnos = data;

      for (let i = 0; i < alumnos.length; i++) {
        let form2 = new FormData();

        form2.append("año", añoDB);
        form2.append("notas", alumnos[i][14]);
        form2.append("actions", "Editar");

        fetch("BackEnd/actions.php", {
          method: "post",
          body: form2,
        })
          .then((e) => e.text())
          .then((data) => {
            data = JSON.parse(data);

            let notas = data;

            materias = Object.entries(notas);
            notas = Object.values(notas);

            agregar.innerHTML += `
                            <tr>
                            <td>${format(alumnos[i][1])}</td>
                            <td>${alumnos[i][3].toUpperCase()} ${alumnos[
              i
            ][4].toUpperCase()} </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            </tr>`;

            for (let i = 1; i < notas.length; i++) {
              agregar.innerHTML += `
                            <tr>
                            <td></td>
                            <td></td>
                            <td>${materias[i][0].replaceAll("_", " ")}</td>
                            <td class="text-center">${parseInt(
                              JSON.parse(notas[i]).primer_lapso
                            )}</td>
                            <td class="text-center">${parseInt(
                              JSON.parse(notas[i]).segundo_lapso
                            )}</td>
                            <td class="text-center">${parseInt(
                              JSON.parse(notas[i]).tercer_lapso
                            )}</td>
                            <td class="text-center">${(
                              (parseInt(JSON.parse(notas[i]).primer_lapso) +
                                parseInt(JSON.parse(notas[i]).segundo_lapso) +
                                parseInt(JSON.parse(notas[i]).tercer_lapso)) /
                              3
                            ).toFixed(1)}</td>
                            </tr>`;
            }
            if (i + 1 == alumnos.length) {
              $("#AreasAlumnos").DataTable({
                paging: false,
                ordering: false,
                retrieve: true,
                dom: "Bfrtip",
                language: {
                  url: "http://localhost/sistema/DataTables/Spanish.json",
                },
                buttons: [
                  {
                    extend: "excelHtml5",
                    className: "export",
                    ttileAttr: "Exportar a excel",
                    text: "Exportar a Excel",
                    title: `Reporte`,
                  },
                ],
              });
            }
          });
      }
    });
}
