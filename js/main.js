const error = $(".alert-danger"),
  succes = $(".alert-success"),
  contenido = $("#AlumnosMain,#TablaMain"),
  tablaAlumno = $(".alumno"),
  graduados = $("#AlumnosGraduados,#TablaGraduados");
welcome = $(".welcome");

const añoDB = [
  "primer_año",
  "segundo_año",
  "tercer_año",
  "cuarto_año",
  "quinto_año",
];

const fetchF = async (body) => {
  const e = await fetch("BackEnd/actions.php", {
    method: "POST",
    body,
  });
  const data = await e.text();

  return data;
};

//Utilidades
const primeraLetraMayuscula = (cadena) =>
  cadena.charAt(0).toUpperCase().concat(cadena.substring(1, cadena.length));
const back = document.querySelector("#back").addEventListener("click", () => {
  const año = localStorage.getItem("año"),
    seccion = localStorage.getItem("seccion");
  localStorage.getItem("graduado") == "graduado"
    ? RenderGraduados()
    : seccionNav(año, seccion);
});
function format(input) {
  let num = input;
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

//muetras una año y seccion
const seccionNav = (año, seccion) => {
  localStorage.removeItem("graduado");
  $("#TablaMain").DataTable().clear().destroy();

  const agregar = document.querySelector("tbody");

  localStorage.setItem("año", año);
  localStorage.setItem("seccion", seccion);

  localStorage.removeItem("añoaux");

  welcome.css("display", "none");
  tablaAlumno.css("display", "none");
  graduados.css("display", "none");
  contenido.css("display", "block");

  let titulo = $(".menu h5");

  if (año == 1) Menu = document.querySelector("#primer-año");
  if (año == 2) Menu = document.querySelector("#segundo-año");
  if (año == 3) Menu = document.querySelector("#tercer-año");
  if (año == 4) Menu = document.querySelector("#Cuarto-año");
  if (año == 5) Menu = document.querySelector("#Quinto-año");

  Menu.classList.toggle("show");

  año = parseInt(localStorage.getItem("año"));

  switch (año) {
    case 1:
      titulo.text(`Primer Año Sección "${seccion}"`);
      break;
    case 2:
      titulo.text(`Segundo Año Sección "${seccion}"`);
      break;
    case 3:
      titulo.text(`Tercer Año Sección "${seccion}"`);
      break;
    case 4:
      titulo.text(`Cuarto Año Sección "${seccion}"`);
      break;
    case 5:
      titulo.text(`Quinto Año Sección "${seccion}"`);
      break;
  }

  let form = new FormData();

  form.append("año", añoDB[año - 1]);
  form.append("seccion", seccion);
  form.append("actions", "Buscar Alumnos");

  let x = 0,
    x2 = 0;

  agregar.innerHTML = "";
  fetchF(form).then((data) => {
    data = JSON.parse(data);
    let alumnos = data;

    x2 = alumnos.length;

    for (let i = 0; i < alumnos.length; i++, x++) {
      let form2 = new FormData();

      form2.append("año", añoDB[año - 1]);
      form2.append("notas", alumnos[i][14]);
      form2.append("actions", "Editar");

      fetchF(form2).then((data) => {
        data = JSON.parse(data);

        let notas = data[0];

        let primer_lapso = 0,
          segundo_lapso = 0,
          tercer_lapso = 0,
          notaFinal = 0;

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
                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                            <div class="dropdown-menu">
                            <a class="dropdown-item" onclick="editar(${
                              alumnos[i][1]
                            },'${alumnos[i][3].trim()} ${alumnos[
          i
        ][4].trim()}',${alumnos[i][14]},'${seccion}',${año},'${
          alumnos[i][15]
        }')" href="#">Editar</a>
                            </div>
                            </div>
                            </td>
                            </tr>`;
        if (x == x2) {
          setTimeout(() => {
            console.log("hello");
            $("#TablaMain").DataTable({
              pageLength: 10,
              lengthMenu: [10, 20, 25, 30, 35],
              retrieve: true,
              order: [[1, "asc"]],
              language: {
                url: "/sistema/DataTables/Spanish.json",
              },
            });
          }, 250);
        }
      });
    }
  });
};

//agregarmos un alumno
function alumno() {
  const año = localStorage.getItem("año"),
    seccion = localStorage.getItem("seccion");
  $("#modal").removeAttr("data-bs-dismiss");

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
  form.append("año", añoDB[año - 1]);
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
  fetchF(form).then((data) => {
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

//motramos las notas de un alumno
function editar(cedula, nombre, notas, sec, año, state) {
  const agregar = document.getElementById("notasAlumnos");
  agregar.innerHTML = ``;

  localStorage.setItem("estado", state);

  const estado = document.querySelector("#State");
  (selector = document.querySelector("#SelectAÑo")),
    (Select1 = document.querySelector("#Select1")),
    (Select2 = document.querySelector("#Select2")),
    (Select3 = document.querySelector("#Select3")),
    (Select4 = document.querySelector("#Select4")),
    (Select5 = document.querySelector("#Select5"));

  Select2.classList.replace("d-block", "d-none");
  Select3.classList.replace("d-block", "d-none");
  Select4.classList.replace("d-block", "d-none");
  Select5.classList.replace("d-block", "d-none");
  Select1.removeAttribute("selected");
  Select2.removeAttribute("selected");
  Select3.removeAttribute("selected");
  Select4.removeAttribute("selected");
  Select5.removeAttribute("selected");

  estado.value = state;

  if (año == 1) Select1.setAttribute("selected", "");

  if (año >= 2) {
    Select2.classList.replace("d-none", "d-block");
    if (año == 2) Select2.setAttribute("selected", "");
  }
  if (año >= 3) {
    Select3.classList.replace("d-none", "d-block");
    if (año == 3) Select3.setAttribute("selected", "");
  }
  if (año >= 4) {
    Select4.classList.replace("d-none", "d-block");
    if (año == 4) Select4.setAttribute("selected", "");
  }
  if (año >= 5) {
    Select5.classList.replace("d-none", "d-block");
    if (año == 5) Select5.setAttribute("selected", "");
  }

  estado.addEventListener("change", () => {
    let form = new FormData();

    form.append("cedula", cedula);
    form.append("estado", estado.value);
    form.append("actions", "State");

    fetchF(form).then((data) => {
      if (JSON.parse(data) == "True")
        Swal.fire({
          title: "Modificado!",
          text: "Cambios Realizados con Éxito",
          icon: "success",
          confirmButtonText: "Entendido",
        });
    });
  });

  selector.addEventListener("change", () => {
    localStorage.setItem("añoaux", parseInt(selector.value));

    let form = new FormData();

    form.append("cedula", cedula);
    form.append("año", añoDB[parseInt(selector.value) - 1]);
    form.append("notas", notas);
    form.append("actions", "Editar");

    fetchF(form).then((data) => {
      agregar.innerHTML = "";
      data = JSON.parse(data);

      let notasObject = data[0];

      let materiasObject = data[0];

      localStorage.setItem("DBnotas", JSON.stringify(notasObject));

      notasObject = Object.values(notasObject);

      materiasObject = Object.entries(materiasObject);

      let P1 = 0,
        P2 = 0,
        P3 = 0;

      for (let i = 1; i < materiasObject.length; i++) {
        P1 += parseFloat(JSON.parse(notasObject[i]).primer_lapso);
        P2 += parseFloat(JSON.parse(notasObject[i]).segundo_lapso);
        P3 += parseFloat(JSON.parse(notasObject[i]).tercer_lapso);

        if (i == materiasObject.length - 1) {
          notasObject[10] = `{"primer_lapso":"${parseFloat(
            P1 / (i - 1)
          ).toFixed(1)}","segundo_lapso":"${parseFloat(P2 / (i - 1)).toFixed(
            1
          )}","tercer_lapso":"${parseFloat(P3 / (i - 1)).toFixed(1)}"}`;
        }

        agregar.innerHTML += `
                  <tr>
                  <th scope="row">${materiasObject[i][0].replaceAll(
                    "_",
                    " "
                  )}</th>
                  <td class="text-center">${parseFloat(
                    JSON.parse(notasObject[i]).primer_lapso
                  )}</td>
                  <td class="text-center">${parseFloat(
                    JSON.parse(notasObject[i]).segundo_lapso
                  )}</td>
                  <td class="text-center">${parseFloat(
                    JSON.parse(notasObject[i]).tercer_lapso
                  )}</td>
                  <td class="text-center">${(
                    (parseFloat(JSON.parse(notasObject[i]).primer_lapso) +
                      parseFloat(JSON.parse(notasObject[i]).segundo_lapso) +
                      parseFloat(JSON.parse(notasObject[i]).tercer_lapso)) /
                    3
                  ).toFixed(1)}</td>
                  <td class='ms-3'> 
                  <button type="button" class="btn btn-primary" onclick="editarN('${
                    materiasObject[i][0]
                  }',${JSON.parse(
          notasObject[0]
        )}, ${notas}, '${nombre}', ${cedula},${parseInt(
          JSON.parse(notasObject[i]).primer_lapso
        )},${parseInt(JSON.parse(notasObject[i]).segundo_lapso)},${parseInt(
          JSON.parse(notasObject[i]).tercer_lapso
        )})" data-bs-toggle="modal" data-bs-target="#editarnotas">
                  Editar
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
          url: "/sistema/DataTables/Spanish.json",
        },
        buttons: [
          {
            extend: "excelHtml5",
            className: "export",
            ttileAttr: "Exportar a excel",
            text: "Exportar a Excel",
            title: `Alumno  ${nombre}   C.I: ${
              format(cedula) + " "
            }  Año: ${año}  Sección:  ${sec}`,
            exportOptions: {
              columns: ":visible",
            },
          },
          {
            extend: "colvis",
            text: "Visor de columnas",
          },
        ],
        columnDefs: [
          {
            targets: -2,
            visible: true,
          },
        ],
      });
    });
  });

  $("#notasexport").DataTable().destroy();

  localStorage.setItem("cedula", cedula);
  localStorage.setItem("nota", notas);
  localStorage.setItem("nombre", nombre);

  contenido.css("display", "none");
  graduados.css("display", "none");
  tablaAlumno.css("display", "block");

  const Infoalumno = document.querySelector("#InfoAlumno"),
    InfoCI = document.querySelector("#InfoCI"),
    InfoAnio = document.querySelector("#InfoAnio"),
    InfoSec = document.querySelector("#InfoSec");

  Infoalumno.innerHTML = `Alumno: ${nombre.toUpperCase()}.`;
  InfoCI.innerHTML = `C.I: ${format(cedula)}.`;
  InfoAnio.innerHTML = `Año: ${añoDB[año - 1]
    .replace("_", " ")
    .toUpperCase()}.`;
  InfoSec.innerHTML = `| Sección: ${sec} |`;

  document.querySelector("#seccionChange").value = sec;
  document.querySelector("#AñoChange").value = año;

  let form = new FormData();

  form.append("cedula", cedula);
  form.append("año", añoDB[año - 1]);
  form.append("notas", notas);
  form.append("actions", "Editar");

  agregar.innerHTML = ``;

  fetchF(form).then((data) => {
    data = JSON.parse(data);
    console.log(data);
    console.log(
      (data[0].Total =
        '{"primer_lapso":"0","segundo_lapso":"0","tercer_lapso":"0"}')
    );

    let notasObject = data[0];

    let materiasObject = data[0];

    console.log(notasObject, materiasObject);

    localStorage.setItem("DBnotas", JSON.stringify(notasObject));

    notasObject = Object.values(notasObject);

    materiasObject = Object.entries(materiasObject);

    console.log(notasObject, materiasObject);

    let P1 = 0,
      P2 = 0,
      P3 = 0;

    for (let i = 1; i < materiasObject.length; i++) {
      P1 += parseFloat(JSON.parse(notasObject[i]).primer_lapso);
      P2 += parseFloat(JSON.parse(notasObject[i]).segundo_lapso);
      P3 += parseFloat(JSON.parse(notasObject[i]).tercer_lapso);

      if (i == materiasObject.length - 1) {
        notasObject[10] = `{"primer_lapso":"${parseFloat(P1 / (i - 1)).toFixed(
          1
        )}","segundo_lapso":"${parseFloat(P2 / (i - 1)).toFixed(
          1
        )}","tercer_lapso":"${parseFloat(P3 / (i - 1)).toFixed(1)}"}`;
      }

      agregar.innerHTML += `
                <tr>
                <th scope="row">${materiasObject[i][0].replaceAll(
                  "_",
                  " "
                )}</th>
                <td class="text-center">${parseFloat(
                  JSON.parse(notasObject[i]).primer_lapso
                )}</td>
                <td class="text-center">${parseFloat(
                  JSON.parse(notasObject[i]).segundo_lapso
                )}</td>
                <td class="text-center">${parseFloat(
                  JSON.parse(notasObject[i]).tercer_lapso
                )}</td>
                <td class="text-center">${(
                  (parseFloat(JSON.parse(notasObject[i]).primer_lapso) +
                    parseFloat(JSON.parse(notasObject[i]).segundo_lapso) +
                    parseFloat(JSON.parse(notasObject[i]).tercer_lapso)) /
                  3
                ).toFixed(1)}</td>
                <td class='ms-3'> 
                <button type="button" class="btn btn-primary" onclick="editarN('${
                  materiasObject[i][0]
                }',${JSON.parse(
        notasObject[0]
      )}, ${notas}, '${nombre}', ${cedula},${parseInt(
        JSON.parse(notasObject[i]).primer_lapso
      )},${parseInt(JSON.parse(notasObject[i]).segundo_lapso)},${parseInt(
        JSON.parse(notasObject[i]).tercer_lapso
      )})" data-bs-toggle="modal" data-bs-target="#editarnotas">
                Editar
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
        url: "/sistema/DataTables/Spanish.json",
      },
      buttons: [
        {
          extend: "excelHtml5",
          className: "export",
          ttileAttr: "Exportar a excel",
          text: "Exportar a Excel",
          title: `Alumno  ${nombre}   C.I: ${
            format(cedula) + " "
          }  Año: ${año}  Sección:  ${sec}`,
          exportOptions: {
            columns: ":visible",
          },
        },
        {
          extend: "colvis",
          text: "Visor de columnas",
        },
      ],
      columnDefs: [
        {
          targets: -2,
          visible: true,
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
  const auxAño = localStorage.getItem("añoaux"),
    año = auxAño != null ? auxAño : localStorage.getItem("año"),
    materia = localStorage.getItem("materia"),
    nota = localStorage.getItem(
      "nota",
      (nombre = localStorage.getItem("nombre"))
    ),
    cedula = localStorage.getItem("cedula"),
    id = localStorage.getItem("idMaterias"),
    seccion = localStorage.getItem("seccion");

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
  form.append("año", añoDB[año - 1]);
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

  fetchF(form).then((data) => {
    error.css("display", "none");
    succes.css("display", "block");
    succes.html("Las notas han sido actualizadas");
    editar(
      cedula,
      nombre,
      nota,
      seccion,
      localStorage.getItem("año"),
      localStorage.getItem("estado")
    );
    setTimeout(() => {
      succes.css("display", "none");
    }, 5000);
  });
}

//pasar alumnos de seccion
function PasarSeccion() {
  const año = localStorage.getItem("año"),
    seccion = localStorage.getItem("seccion");

  let data = new FormData();

  data.append("año", añoDB[año - 1]);
  data.append("seccion", seccion);
  data.append("actions", "Pasar Seccion");

  fetchF(data).then(() => seccionNav(año, seccion));
}

//generar reporte de notas de los alumnos de una seccion
function reporte(type) {
  switch (type) {
    case "notas":
      window.open(
        `/sistema/reporte.php?query=${type}`,
        "",
        "width=1024,height=720,toolbar=yes"
      );

      break;

    case "datos":
      window.open(
        `/sistema/reporte.php?query=${type}`,
        "",
        "width=1024,height=720,toolbar=yes"
      );
      break;
    case "datosAlumno":
      let ventana = window.open(
        `/sistema/reporte.php?query=${type}`,
        "",
        "width=1024,height=720,toolbar=yes"
      );

      let intervalo = setInterval(() => {
        if (ventana.closed !== false) {
          window.clearInterval(intervalo);
          editar(
            localStorage.getItem("cedula"),
            `${localStorage.getItem("nombre")}`,
            localStorage.getItem("nota"),
            localStorage.getItem("seccion"),
            localStorage.getItem("año"),
            localStorage.getItem("estado")
          );
        }
      }, 1000);
      break;
  }
}
function test() {
  const año = localStorage.getItem("año"),
    seccion = localStorage.getItem("seccion"),
    agregar = document.querySelector("#NotasAlumnos");

  let form = new FormData();

  $("#AreasAlumnos").DataTable().destroy();

  form.append("año", añoDB[año - 1]);
  form.append("seccion", seccion);
  form.append("actions", "Buscar Alumnos");

  fetchF(form).then((data) => {
    data = JSON.parse(data);
    agregar.innerHTML = "";
    let alumnos = data;

    for (let i = 0; i < alumnos.length; i++) {
      let form2 = new FormData();

      form2.append("año", añoDB[año - 1]);
      form2.append("notas", alumnos[i][14]);
      form2.append("actions", "Editar");

      fetchF(form2).then((data) => {
        data = JSON.parse(data);

        let notas = data[0];

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
            searching: false,
            retrieve: true,
            dom: "Bfrtip",
            language: {
              url: "/sistema/DataTables/Spanish.json",
            },
            buttons: [
              {
                extend: "excelHtml5",
                className: "export",
                ttileAttr: "Exportar a excel",
                text: "Exportar a Excel",
                title: `Reporte Grupal de Notas | Año: ${añoDB[año - 1].replace(
                  "_",
                  " "
                )} Sección: ${seccion} `,
              },
            ],
          });
        }
      });
    }
  });
}

function datosAlumno() {
  const año = localStorage.getItem("año"),
    seccion = localStorage.getItem("seccion"),
    cedula = localStorage.getItem("cedula");

  let form = new FormData();

  form.append("cedula", cedula);
  form.append("año", añoDB[año - 1]);
  form.append("actions", "datosAlumno");

  const tabla = document.querySelector("#DatosAlumnos");

  fetchF(form).then((data) => {
    data = JSON.parse(data);
    const alumno = data.alumno,
      representante = data.representante;

    let ids = { alumno: alumno.id, representante: representante.id };

    ids = JSON.stringify(ids);

    localStorage.setItem("ids", ids);

    document.querySelector("#Nombre").value = alumno.nombre.toUpperCase();
    document.querySelector("#Apellido").value = alumno.apellido.toUpperCase();
    document.querySelector("#Cedula").value = alumno.cedula;
    document.querySelector("#cedulaEscolar").checked =
      alumno.cedula_escolar == "true" ? true : false;
    document.querySelector("#Sexo").value = alumno.sexo;
    document.querySelector("#fechaNacimiento").value =
      alumno.fecha_de_nacimiento;
    document.querySelector("#Edad").value = alumno.edad;
    document.querySelector("#LugarNacimiento").value =
      alumno.lugar_de_nacimiento;
    document.querySelector("#Telfono").value = alumno.telefono;
    document.querySelector("#Direccion").value = alumno.direccion;
    document.querySelector("#Correo").value = alumno.correo;
    document.querySelector("#NombreR").value =
      representante.nombre.toUpperCase();
    document.querySelector("#ApellidoR").value =
      representante.apellido.toUpperCase();
    document.querySelector("#CedulaR").value = representante.cedula;
    document.querySelector("#TelfonoR").value = representante.telefono;
    document.querySelector("#SexoR").value = representante.sexo;
    document.querySelector("#Filiacion").value = representante.filiacion;
    document.querySelector("#DireccionR").value = representante.direccion;
    document.querySelector("#CorreoR").value = representante.correo;

    tabla.innerHTML = `
        <tr>
          <td>${format(alumno.cedula)}</td>
          <td>${alumno.nombre.toUpperCase()} ${alumno.apellido.toUpperCase()}</td>
          <td>${alumno.sexo}</td>
          <td>${alumno.fecha_de_nacimiento}</td>
          <td>${alumno.edad}</td>
          <td>${alumno.lugar_de_nacimiento}</td>
          <td>${alumno.telefono}</td>
          <td>${alumno.direccion}</td>
          <td>${alumno.correo}</td>
        </tr>

        <tr>
        <th class="table-dark" ></th>
        <th class="table-dark" scope="col" >Representante</th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        </tr>

        <tr>
        <th class="table-dark" scope="col">Cédula</th>
        <th class="table-dark" scope="col">Nombre y Apellido</th>
        <th class="table-dark" scope="col">Dirección</th>
        <th class="table-dark" scope="col">Correo</th>
        <th class="table-dark" scope="col">Filiación</th>
        <th class="table-dark" scope="col">Teléfono</th>
        <th class="table-dark" scope="col">Sexo</th>
        <th class="table-dark" scope="col"></th>
        <th class="table-dark" scope="col"></th>
        </tr>

        <tr>
        <td> ${format(representante.cedula)} </td>
        <td> ${representante.nombre.toUpperCase()} ${representante.apellido.toUpperCase()} </td>
        <td> ${representante.direccion} </td>
        <td> ${representante.correo} </td>
        <td> ${representante.filiacion} </td>
        <td> ${representante.telefono} </td>
        <td> ${representante.sexo} </td>
        <td></td>
        <td></td>
        </tr>
        
        `;

    $("#Alumnoexport").DataTable({
      paging: false,
      ordering: false,
      searching: false,
      retrieve: true,
      dom: "Bfrtip",
      language: {
        url: "/sistema/DataTables/Spanish.json",
      },
      buttons: [
        {
          extend: "excelHtml5",
          className: "export",
          ttileAttr: "Exportar a excel",
          text: "Exportar a Excel",
          title: `Reporte de datos | Alumno: ${alumno.nombre.toUpperCase()} ${alumno.apellido.toUpperCase()} Año: ${añoDB[
            año - 1
          ].replace("_", " ")} Sección: ${seccion} `,
        },
      ],
    });
  });
}

function ReporteAlumnos() {
  const año = localStorage.getItem("año"),
    seccion = localStorage.getItem("seccion"),
    tabla = document.querySelector("#DatosAlumnos");

  let form = new FormData();

  form.append("seccion", seccion);
  form.append("año", añoDB[año - 1]);
  form.append("actions", "ReporteAlumno");

  fetchF(form).then((data) => {
    const alumno = JSON.parse(data);

    for (let i = 0; i < alumno.length; i++) {
      const representante = alumno[i].Representate;

      tabla.innerHTML += `
        <tr>
        <th class="table-dark" ></th>
        <th class="table-dark" scope="col" >Alumno</th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        </tr>

        <tr>
          <td>${format(alumno[i].cedula)}</td>
          <td>${alumno[i].nombre.toUpperCase()} ${alumno[
        i
      ].apellido.toUpperCase()}</td>
          <td>${alumno[i].sexo}</td>
          <td>${alumno[i].fecha_de_nacimiento}</td>
          <td>${alumno[i].edad}</td>
          <td>${alumno[i].lugar_de_nacimiento}</td>
          <td>${alumno[i].telefono}</td>
          <td>${alumno[i].direccion}</td>
          <td>${alumno[i].correo}</td>
        </tr>

        <tr>
        <th class="table-dark" ></th>
        <th class="table-dark" scope="col" >Representante</th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        </tr>

        <tr>
        <th class="table-dark" scope="col">Cédula</th>
        <th class="table-dark" scope="col">Nombre y Apellido</th>
        <th class="table-dark" scope="col">Dirección</th>
        <th class="table-dark" scope="col">Correo</th>
        <th class="table-dark" scope="col">Filiación</th>
        <th class="table-dark" scope="col">Teléfono</th>
        <th class="table-dark" scope="col">Sexo</th>
        <th class="table-dark" scope="col"></th>
        <th class="table-dark" scope="col"></th>
        </tr>

        <tr>
        <td> ${format(representante.cedula)} </td>
        <td> ${
          representante.nombre.toUpperCase() +
          representante.apellido.toUpperCase()
        } </td>
        <td> ${representante.direccion} </td>
        <td> ${representante.correo} </td>
        <td> ${representante.filiacion} </td>
        <td> ${representante.telefono} </td>
        <td> ${representante.sexo} </td>
        <td></td>
        <td></td>
        </tr>
        
        `;
    }
    $("#Alumnoexport").DataTable({
      paging: false,
      ordering: false,
      searching: false,
      retrieve: true,
      dom: "Bfrtip",
      language: {
        url: "/sistema/DataTables/Spanish.json",
      },
      buttons: [
        {
          extend: "excelHtml5",
          className: "export",
          ttileAttr: "Exportar a excel",
          text: "Exportar a Excel",
          title: `Reporte grupal de datos | Año: ${añoDB[año - 1].replace(
            "_",
            " "
          )} Sección: ${seccion} `,
        },
      ],
    });
  });
}
function ModificarDatosalumno() {
  const año = localStorage.getItem("año"),
    seccion = localStorage.getItem("seccion");
  let ids = localStorage.getItem("ids");
  ids = JSON.parse(ids);
  $("#modal").removeAttr("data-bs-dismiss");

  let form = new FormData();
  form.append("idAlumno", ids.alumno);
  form.append("idRepresentante", ids.representante);
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
  form.append("año", añoDB[año - 1]);
  form.append("seccion", seccion);
  form.append("actions", "ModoficarDatos");

  fetchF(form).then((data) => {
    if (data == "True")
      Swal.fire({
        title: "Modificado!",
        text: "Cambios Realizados con Éxito",
        icon: "success",
        confirmButtonText: "Entendido",
      }).then((e) => {
        localStorage.setItem("cedula", $("#Cedula").val());

        if (e.isConfirmed == true) location.reload();
      });
  });
}

function ModificarSeccionAño() {
  const año = document.querySelector("#AñoChange").value,
    seccion = document.querySelector("#seccionChange").value,
    cedula = localStorage.getItem("cedula");

  let form = new FormData();
  form.append("año", añoDB[año - 1]);
  form.append("cedula", cedula);
  form.append("seccion", seccion);
  form.append("actions", "CambiarSeccionAño");

  fetchF(form).then((data) => {
    if (JSON.parse(data) == "True")
      Swal.fire({
        title: "Modificado!",
        text: "Cambios Realizados con Éxito",
        icon: "success",
        confirmButtonText: "Entendido",
      }).then((e) => {
        localStorage.setItem("año", año);
        localStorage.setItem("seccion", seccion);

        if (e.isConfirmed == true)
          editar(
            localStorage.getItem("cedula"),
            `${localStorage.getItem("nombre")}`,
            localStorage.getItem("nota"),
            seccion,
            año,
            localStorage.getItem("estado")
          );
      });
  });
}

function RenderGraduados() {
  localStorage.removeItem("graduado");
  welcome.css("display", "none");
  tablaAlumno.css("display", "none");
  contenido.css("display", "none");
  graduados.css("display", "block");

  const años = {
    primer_año: 1,
    segundo_año: 2,
    tercer_año: 3,
    cuarto_año: 4,
    quinto_año: 5,
  };

  const tablaGraduados = document.querySelector("#TBGraduados");

  let form = new FormData();

  form.append("actions", "Buscar Graduados");

  fetchF(form).then((data) => {
    localStorage.setItem("graduado", "graduado");
    data = JSON.parse(data);
    console.log(data);
    if (data == "False")
      return (tablaGraduados.innerHTML =
        "<h4 class='text-center'>No hay alumnos graduados</h4>");
    let i = 1;
    tablaGraduados.innerHTML = "";
    data.forEach((element) => {
      tablaGraduados.innerHTML += `<tr>
        <th scope="row">${i}</th>
        <td>${format(element.cedula)}</td>
        <td>${element.nombre.toUpperCase()}</td>
        <td>${element.apellido.toUpperCase()}</td>
        <td>${element.ano.replace("_", " ").toUpperCase()}</td>
        <td>${element.seccion}</td>
        <td> 
        <div class="btn-group">
        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
        <div class="dropdown-menu">
        <a class="dropdown-item" onclick="editar(${
          element.cedula
        },'${element.nombre.toUpperCase()} ${element.apellido.toUpperCase()}',${
        element.notas
      },'${element.seccion}',${años[element.ano]},'${
        element.estado
      }')" href="#">Editar</a>
        </div>
        </div>
        </td>
      </tr>`;
      i++;
    });
  });
}
