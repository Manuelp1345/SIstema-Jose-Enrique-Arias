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

let areas = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

const currentUrl = window.location.search.substring(1).split("&");

console.log(currentUrl);

if (window.location.pathname == "/admin.php") {
  localStorage.setItem("respaldo", "false");
}

//Utilidades
const fetchF = async (body) => {
  const e = await fetch(`${window.location.origin}/BackEnd/actions.php`, {
    method: "POST",
    body,
  });
  const data = await e.text();

  return data;
};

if (document.querySelector("#TotalAlumnos")) {
  const span = document.querySelector("#TotalAlumnos");
  const periodo = document.querySelector("#periodoIndex");
  periodo.innerHTML = `${new Date().getFullYear()}-${
    new Date().getFullYear() + 1
  }`;
  const form = new FormData();
  form.append("actions", "TotalAlumnos");
  fetchF(form).then((e) => {
    span.innerHTML = e;
  });
}

const primeraLetraMayuscula = (cadena) =>
  cadena.charAt(0).toUpperCase().concat(cadena.substring(1, cadena.length));

if (document.querySelector("#back")) {
  document.querySelector("#back").addEventListener("click", () => {
    const año = localStorage.getItem("año"),
      seccion = localStorage.getItem("seccion");
    localStorage.getItem("graduado") == "graduado"
      ? RenderGraduados()
      : seccionNav(año, seccion);
    areas = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];
  });
}

if (document.querySelector("#contenedorGp")) {
  document
    .querySelector("#contenedorGp")
    .addEventListener("click", function () {
      document.querySelector("#gpdb").removeAttribute("disabled");
    });
  document.querySelector("#gpdb").addEventListener("blur", function () {
    let form = new FormData();
    let dateTime = new Date();
    if (window.location.pathname.split("/")[2] == "periodo") {
      form.append("BDR", "BDR");
    }
    form.append("cedula", localStorage.getItem("cedula"));
    form.append("gp", document.querySelector("#gpdb").value);
    form.append("actions", "EditarGp");
    form.append("dateTime", dateTime);
    form.append(
      "userId",
      parseInt(JSON.parse(localStorage.getItem("user")).id)
    );

    fetchF(form).then((data) => {
      if (JSON.parse(data) == "True")
        document.querySelector("#gpdb").setAttribute("disabled", "disabled");
      Swal.fire({
        title: "Modificado!",
        text: "Cambios Realizados con Éxito",
        icon: "success",
        confirmButtonText: "Entendido",
      });
    });
  });

  document
    .querySelector("#contenedorRp")
    .addEventListener("click", function (e) {
      if (e.target.classList.contains("rp")) {
        e.target.addEventListener("change", () => {
          if (e.target.checked) areas[e.target.id - 1] = e.target.checked;
          if (!e.target.checked) areas[e.target.id - 1] = e.target.checked;
          let form = new FormData();
          let dateTime = new Date();
          if (window.location.pathname.split("/")[2] == "periodo") {
            form.append("BDR", "BDR");
          }

          form.append("cedula", localStorage.getItem("cedula"));
          form.append("repitiente", JSON.stringify(areas));
          form.append("actions", "modifi repitiente");
          form.append("dateTime", dateTime);
          form.append(
            "userId",
            parseInt(JSON.parse(localStorage.getItem("user")).id)
          );
          fetchF(form).then((data) => {
            if (JSON.parse(data) == "True") {
              Swal.fire({
                title: "Modificado!",
                text: "Cambios Realizados con Éxito",
                icon: "success",
                confirmButtonText: "Entendido",
              });
            }
          });
        });
      }
    });
}

if (document.querySelector("#State")) {
  estado = document.querySelector("#State");
  estado.addEventListener("change", () => {
    let form = new FormData();
    let dateTime = new Date();
    if (window.location.pathname.split("/")[2] == "periodo") {
      form.append("BDR", "BDR");
    }
    form.append("cedula", localStorage.getItem("cedula"));
    form.append("estado", estado.value);
    form.append("actions", "State");
    form.append("dateTime", dateTime);
    form.append(
      "userId",
      parseInt(JSON.parse(localStorage.getItem("user")).id)
    );

    fetchF(form).then((data) => {
      if (JSON.parse(data) == "True") {
        Swal.fire({
          title: "Modificado!",
          text: "Cambios Realizados con Éxito",
          icon: "success",
          confirmButtonText: "Entendido",
        });
        if (estado.value == "repitiente") {
          document
            .querySelector("#contenedorRp")
            .classList.replace("d-none", "d-flex");
        } else {
          document
            .querySelector("#contenedorRp")
            .classList.replace("d-flex", "d-none");
        }
      }
    });
  });
}
//funcion de separadores de miles para las cedulas
/* function format(input) {
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
} */

if (document.querySelector("#fechaNacimiento")) {
  document.querySelector("#fechaNacimiento").addEventListener("blur", () => {
    let añoActual = new Date(),
      FechaNacimiento = new Date($("#fechaNacimiento").val()),
      edad = añoActual.getFullYear() - FechaNacimiento.getFullYear(),
      m = añoActual.getMonth() - FechaNacimiento.getMonth();

    if (
      m < 0 ||
      (m === 0 && añoActual.getDate() < FechaNacimiento.getFullYear())
    ) {
      edad--;
    }
    document.querySelector("#Edad").value = parseInt(edad);
  });
}

if (document.querySelector("#Condicion")) {
  //verificar si seleciona repitiente para mostras las areas a selecionar
  document.querySelector("#Condicion").addEventListener("change", function () {
    this.value == "repitiente"
      ? document.querySelector("#areasRp").classList.replace("d-none", "d-flex")
      : document
          .querySelector("#areasRp")
          .classList.replace("d-flex", "d-none");
  });

  document
    .querySelector("#modalalumno")
    .addEventListener("click", function (e) {
      if (e.target.classList.contains("repitiente")) {
        e.target.addEventListener("change", () => {
          if (e.target.checked) areas[e.target.id - 1] = true;
          if (!e.target.checked) areas[e.target.id - 1] = false;
        });
      }
    });
}

//muetras una año y seccion
const seccionNav = (año, seccion) => {
  localStorage.removeItem("graduado");
  $("#TablaMain").DataTable().clear().destroy();

  const agregar = document.querySelector("tbody");

  localStorage.setItem("año", año);
  localStorage.setItem("seccion", seccion);

  history.pushState(null, null, `/?seccion&${año}&${seccion}`);

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
  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

  form.append("año", añoDB[año - 1]);
  form.append("seccion", seccion);
  form.append("actions", "Buscar Alumnos");

  let x = 0,
    x2 = 0;

  agregar.innerHTML = "";
  fetchF(form)
    .then((data) => {
      data = JSON.parse(data);
      let alumnos = data;

      x2 = alumnos.length;

      Promise.all(
        alumnos.map((alumno, i) => {
          let form2 = new FormData();
          let dateTime = new Date();
          if (window.location.pathname.split("/")[2] == "periodo") {
            form.append("BDR", "BDR");
          }

          form2.append("año", añoDB[año - 1]);
          form2.append("notas", alumno[14]);
          form2.append("actions", "Editar");
          form2.append("dateTime", dateTime);
          form2.append("cedula", localStorage.getItem("cedula"));
          form2.append(
            "userId",
            parseInt(JSON.parse(localStorage.getItem("user")).id)
          );

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
                            <td>${alumno[1]}</td>
                            <td>${alumno[3].toUpperCase()} </td>
                            <td>${alumno[4].toUpperCase()}</td>
                            <td>${parseInt(primer_lapso)}</td>
                            <td>${parseInt(segundo_lapso)}</td>
                            <td>${parseInt(tercer_lapso)}</td>
                            <td>${notaFinal.toFixed(1)}</td>
                            <td> 
                            <div class="btn-group">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                            <div class="dropdown-menu">
                            <a class="dropdown-item" onclick="editar(${
                              alumno[1]
                            },'${alumno[3].trim()} ${alumno[4].trim()}',${
              alumno[14]
            },'${seccion}',${año},'${alumno[15]}')" href="#">Editar</a>
                            </div>
                            </div>
                            </td>
                            </tr>`;
            if (alumnos.length == i + 1) {
              $("#TablaMain").DataTable({
                pageLength: 10,
                lengthMenu: [10, 20, 25, 30, 35],
                retrieve: true,
                order: [[1, "asc"]],
                language: {
                  url: "/DataTables/Spanish.json",
                },
              });
            }
          });
        })
      );
    })
    .catch((e) => {
      Swal.fire({
        title: "Opss!",
        text: "A ocurrido un error al intentar buscar los alumnos, Por favor Reinicia al sistema. Verifica la conexión a la base de datos",
        icon: "error",
      });
    });
};

//agregarmos un alumno
function alumno() {
  const año = localStorage.getItem("año"),
    seccion = localStorage.getItem("seccion");
  $("#modal").removeAttr("data-bs-dismiss");

  let form = new FormData();
  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

  let direcionNacimiento = `${primeraLetraMayuscula(
    $("#pais").val()
  )}, Edo. ${primeraLetraMayuscula(
    $("#estado").val()
  )}, ${primeraLetraMayuscula($("#Municipio").val())} `;

  let dni = "";

  if ($("#cedulaEscolar").prop("checked")) {
    dni = "CE";
  }
  if ($("#pasaporte").prop("checked")) {
    dni = "P";
  }
  if (
    $("#dni").prop("checked") ||
    (!$("#pasaporte").prop("checked") && $("#cedulaEscolar").prop("checked"))
  ) {
    dni = "V";
  }
  let dateTime = new Date();

  form.append("nombre", $("#Nombre").val().trim());
  form.append("apellido", $("#Apellido").val().trim());
  form.append("cedula", $("#Cedula").val());
  form.append("cedulaE", dni);
  form.append("sexo", $("#Sexo").val());
  form.append("Fnacimiento", $("#fechaNacimiento").val());
  form.append("edad", $("#Edad").val());
  form.append("LugarNacimiento", direcionNacimiento);
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
  form.append("estado", $("#Condicion").val());
  form.append("año", añoDB[año - 1]);
  form.append("seccion", seccion);
  form.append("gp", $("#gp").val());
  form.append("repitiente", JSON.stringify(areas));
  form.append("actions", "Alumno");
  form.append("dateTime", dateTime);
  form.append("userId", parseInt(JSON.parse(localStorage.getItem("user")).id));

  if ($("#Apellido").val() === "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese un apellido");
  }

  if ($("#Nombre").val() === "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese un nombre");
  }
  if ($("#Cedula").val() === "") {
    succes.css("display", "none");
    error.css({ display: "block" });
    return error.text("Por Favor Ingrese una cedula para el estudiante");
  }
  if ($("#Cedula").val().length < 8) {
    succes.css("display", "none");
    error.css({ display: "block" });
    return error.text("Por Favor Ingrese una cedula valida para el estudiante");
  }
  if (
    !$("#dni").prop("checked") &&
    !$("#pasaporte").prop("checked") &&
    !$("#cedulaEscolar").prop("checked")
  ) {
    succes.css("display", "none");
    error.css({ display: "block" });
    return error.text("Por Favor seleccione un tipo de documento");
  }
  if ($("#Sexo").val() == null) {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor seleccione el sexo del estudiante");
  }
  if (
    new Date().getFullYear() -
      parseInt($("#fechaNacimiento").val().split("-")[0]) <=
      9 ||
    $("#fechaNacimiento").val() == ""
  ) {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese una Fecha de Nacimiento valida");
  }
  if ($("#pais").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese el pais");
  }
  if ($("#estado").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese el estado");
  }
  if ($("#Municipio").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese el municipio");
  }
  if ($("#Telfono").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese el Numero de telefono del estudiante");
  }
  if ($("#Direccion").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese la direccion del estudiante");
  }
  if ($("#Correo").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese el correo del estudiante");
  }
  if ($("#gp").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese el grupo estable del estudiante");
  }
  if ($("#Condicion").val() == null) {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese la condicion del estudiante");
  }
  if ($("#NombreR").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese el nombre del representante");
  }
  if ($("#ApellidoR").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese el apellido del representante");
  }
  if ($("#CedulaR").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese la cedula del representante");
  }
  if ($("#SexoR").val() == null) {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese el sexo del representante");
  }
  if ($("#Filiacion").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese la filiacion con el representante");
  }
  if ($("#TelfonoR").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese el telefono del representante");
  }
  if ($("#DireccionR").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese la direccion del representante");
  }
  if ($("#CorreoR").val() == "") {
    succes.css("display", "none");

    error.css({ display: "block" });
    return error.text("Por Favor Ingrese el correo del representante");
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
  areas = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  document.querySelectorAll(".rp").forEach((value, i) => {
    value.checked = areas[i];
  });

  $("#notasexport").DataTable().clear().destroy();

  let form2 = new FormData();
  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }
  form2.append("cedula", cedula);
  form2.append("actions", "Grupo Estable");

  fetchF(form2).then((e) => {
    if (JSON.parse(e).grupo_estable)
      document.querySelector("#gpdb").value = JSON.parse(e).grupo_estable;
    if (JSON.parse(e).periodo)
      document.querySelector("#gpdb").value = JSON.parse(e).grupo_estable;
    document.querySelector("#periodo").innerHTML = JSON.parse(e).periodo;
  });

  localStorage.setItem("estado", state);
  localStorage.setItem("cedula", cedula);
  localStorage.setItem("nota", notas);
  localStorage.setItem("nombre", nombre);

  history.pushState(
    null,
    null,
    `?alumno&${cedula}&${nombre}&${notas}&${sec}&${año}&${state}`
  );

  const estado = document.querySelector("#State"),
    selector = document.querySelector("#SelectAÑo"),
    Select1 = document.querySelector("#Select1"),
    Select2 = document.querySelector("#Select2"),
    Select3 = document.querySelector("#Select3"),
    Select4 = document.querySelector("#Select4"),
    Select5 = document.querySelector("#Select5");

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

  if (state == "repitiente") {
    document
      .querySelector("#contenedorRp")
      .classList.replace("d-none", "d-flex");
    findRepitiente();
  } else {
    document
      .querySelector("#contenedorRp")
      .classList.replace("d-flex", "d-none");
  }

  selector.value =
    parseInt(localStorage.getItem("añoaux")) > año
      ? año
      : parseInt(localStorage.getItem("añoaux"));

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

  selector.addEventListener("change", () => {
    localStorage.setItem("añoaux", parseInt(selector.value));

    let form = new FormData();
    let dateTime = new Date();
    if (window.location.pathname.split("/")[2] == "periodo") {
      form.append("BDR", "BDR");
    }

    form.append("cedula", cedula);
    form.append("año", añoDB[parseInt(selector.value) - 1]);
    form.append("notas", notas);
    form.append("actions", "Editar");
    form.append("dateTime", dateTime);
    form.append(
      "userId",
      parseInt(JSON.parse(localStorage.getItem("user")).id)
    );

    $("#notasexport").DataTable().clear().destroy();
    fetchF(form).then((data) => {
      agregar.innerHTML = "";

      data = JSON.parse(data);
      data[0].Total =
        '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}';

      let notasObject = data[0];

      let materiasObject = data[0];

      localStorage.setItem("DBnotas", JSON.stringify(notasObject));

      notasObject = Object.values(notasObject);

      materiasObject = Object.entries(materiasObject);

      let P1 = 0,
        P2 = 0,
        P3 = 0,
        R = 0;

      for (let i = 1; i < materiasObject.length; i++) {
        P1 += parseFloat(JSON.parse(notasObject[i]).primer_lapso);
        P2 += parseFloat(JSON.parse(notasObject[i]).segundo_lapso);
        P3 += parseFloat(JSON.parse(notasObject[i]).tercer_lapso);
        R += parseFloat(JSON.parse(notasObject[i]).revision);

        if (i == materiasObject.length - 1) {
          notasObject[
            materiasObject.length - 1
          ] = `{"primer_lapso":"${parseFloat(P1 / (i - 1)).toFixed(
            1
          )}","segundo_lapso":"${parseFloat(P2 / (i - 1)).toFixed(
            1
          )}","tercer_lapso":"${parseFloat(P3 / (i - 1)).toFixed(1)}"
          ,"revision":"${parseInt(R / (i - 1).toFixed(1))}"}`;
        }

        agregar.innerHTML += `
                  <tr>
                  <th scope="row">${primeraLetraMayuscula(
                    materiasObject[i][0].replaceAll("_", " ")
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
                  <td class="text-center">${parseFloat(
                    JSON.parse(notasObject[i]).revision
                  )}</td>
                  <td class="text-center">${(
                    (parseFloat(JSON.parse(notasObject[i]).primer_lapso) +
                      parseFloat(JSON.parse(notasObject[i]).segundo_lapso) +
                      parseFloat(
                        JSON.parse(notasObject[i]).revision != 0
                          ? parseFloat(JSON.parse(notasObject[i]).revision)
                          : parseFloat(JSON.parse(notasObject[i]).tercer_lapso)
                      )) /
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
          url: "/DataTables/Spanish.json",
        },
        buttons: [
          {
            extend: "excelHtml5",
            className: "export",
            ttileAttr: "Exportar a Excel",
            text: "Exportar a Excel",
            title: `Alumno  ${nombre}   C.I: ${
              cedula + " "
            }  Año: ${primeraLetraMayuscula(
              añoDB[localStorage.getItem("añoaux") - 1].replace("_", " ")
            )}  Sección:  ${sec}`,
            exportOptions: {
              columns: ":visible",
            },
          },
          {
            text: "Exportar a excel (Boletin)",
            action: function (e, dt, node, config) {
              const form = new FormData();
              if (window.location.pathname.split("/")[2] == "periodo") {
                form.append("BDR", "BDR");
              }

              form.append("cedula", cedula);
              form.append("año", añoDB[localStorage.getItem("añoaux") - 1]);
              form.append("actions", "GenerarBoletin");
              fetchF(form).then((data) =>
                window.open(`backend/${data}`, "_blank")
              );
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

  agregar.innerHTML = ``;

  contenido.css("display", "none");
  graduados.css("display", "none");
  tablaAlumno.css("display", "block");

  const Infoalumno = document.querySelector("#InfoAlumno"),
    InfoCI = document.querySelector("#InfoCI"),
    InfoAnio = document.querySelector("#InfoAnio"),
    InfoSec = document.querySelector("#InfoSec");

  Infoalumno.innerHTML = `Alumno: ${nombre
    .toUpperCase()
    .replaceAll("%20", " ")}.`;
  InfoCI.innerHTML = `C.I: ${cedula}.`;
  InfoAnio.innerHTML = `Año: ${añoDB[año - 1]
    .replace("_", " ")
    .toUpperCase()}.`;
  InfoSec.innerHTML = `| Sección: ${sec} |`;

  document.querySelector("#seccionChange").value = sec;
  document.querySelector("#AñoChange").value = año;

  let form = new FormData();
  let dateTime = new Date();

  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

  form.append("cedula", cedula);
  form.append("año", añoDB[año - 1]);
  form.append("notas", notas);
  form.append("actions", "Editar");
  form.append("dateTime", dateTime);
  form.append("userId", parseInt(JSON.parse(localStorage.getItem("user")).id));

  fetchF(form).then((data) => {
    $("#notasexport").DataTable().clear().destroy();
    agregar.innerHTML = ``;
    data = JSON.parse(data);
    data[0].Total =
      '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}';

    let notasObject = data[0];

    let materiasObject = data[0];

    localStorage.setItem("DBnotas", JSON.stringify(notasObject));

    notasObject = Object.values(notasObject);

    materiasObject = Object.entries(materiasObject);

    let P1 = 0,
      P2 = 0,
      P3 = 0;
    R = 0;

    for (let i = 1; i < materiasObject.length; i++) {
      P1 += parseFloat(JSON.parse(notasObject[i]).primer_lapso);
      P2 += parseFloat(JSON.parse(notasObject[i]).segundo_lapso);
      P3 += parseFloat(JSON.parse(notasObject[i]).tercer_lapso);
      R += parseFloat(JSON.parse(notasObject[i]).revision);

      if (i == materiasObject.length - 1) {
        notasObject[materiasObject.length - 1] = `{"primer_lapso":"${parseFloat(
          P1 / (i - 1)
        ).toFixed(1)}","segundo_lapso":"${parseFloat(P2 / (i - 1)).toFixed(
          1
        )}","tercer_lapso":"${parseFloat(P3 / (i - 1)).toFixed(1)}"
        ,"revision":"${parseInt(R / (i - 1).toFixed(1))}"}`;
      }

      const btn = `                  <button type="button" class="btn btn-primary" onclick="editarN('${
        materiasObject[i][0]
      }',${JSON.parse(
        notasObject[0]
      )}, ${notas}, '${nombre}', ${cedula},${parseInt(
        JSON.parse(notasObject[i]).primer_lapso
      )},${parseInt(JSON.parse(notasObject[i]).segundo_lapso)},${parseInt(
        JSON.parse(notasObject[i]).tercer_lapso
      )})" data-bs-toggle="modal" data-bs-target="#editarnotas">
      Editar
      </button>`;

      agregar.innerHTML += `
                <tr>
                <th scope="row">${primeraLetraMayuscula(
                  materiasObject[i][0].replaceAll("_", " ")
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
                <td class="text-center">${parseFloat(
                  JSON.parse(notasObject[i]).revision
                )}</td>
                <td class="text-center">${(
                  (parseFloat(JSON.parse(notasObject[i]).primer_lapso) +
                    parseFloat(JSON.parse(notasObject[i]).segundo_lapso) +
                    parseFloat(
                      JSON.parse(notasObject[i]).revision != 0
                        ? parseFloat(JSON.parse(notasObject[i]).revision)
                        : parseFloat(JSON.parse(notasObject[i]).tercer_lapso)
                    )) /
                  3
                ).toFixed(1)}</td>
                <td class='ms-3'> 
                  ${materiasObject[i][0] == "Total" ? "" : btn}
                </td>
                </tr>`;
    }
    $("#notasexport").DataTable({
      paging: false,
      ordering: false,
      retrieve: true,
      dom: "Bfrtip",
      language: {
        url: "/DataTables/Spanish.json",
      },
      buttons: [
        {
          extend: "excelHtml5",
          className: "export",
          ttileAttr: "Exportar a excel",
          text: "Exportar a Excel",
          title: `Alumno  ${nombre}   C.I: ${
            cedula + " "
          }  Año: ${primeraLetraMayuscula(
            añoDB[año - 1].replace("_", " ")
          )}  Sección:  ${sec}`,
          exportOptions: {
            columns: ":visible",
          },
        },
        {
          text: "Exportar a excel (Boletin)",
          action: function (e, dt, node, config) {
            const form = new FormData();
            if (window.location.pathname.split("/")[2] == "periodo") {
              form.append("BDR", "BDR");
            }

            form.append("cedula", cedula);
            form.append("año", añoDB[año - 1]);
            form.append("actions", "GenerarBoletin");
            fetchF(form).then((data) =>
              window.open(`backend/${data}`, "_blank")
            );
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
    revision: 0,
    ap: 0,
  };

  lapsos.primer_lapso = $("#primer_lapso").val();
  lapsos.segundo_lapso = $("#segundo_lapso").val();
  lapsos.tercer_lapso = $("#tercer_lapso").val();
  lapsos.revision = $("#revision").val();

  let aux =
    (parseFloat(lapsos.primer_lapso) +
      parseFloat(lapsos.segundo_lapso) +
      parseFloat(lapsos.tercer_lapso)) /
    3;

  aux > 9 ? (lapsos.ap = 1) : (lapsos.ap = 0);

  let form = new FormData();
  let dateTime = new Date();
  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

  form.append("materia", materia);
  form.append("nota", id);
  form.append("cedula", cedula);
  form.append("año", añoDB[año - 1]);
  form.append("datos", JSON.stringify(lapsos));
  form.append("actions", "mofificar Notas");
  form.append("dateTime", dateTime);
  form.append("userId", parseInt(JSON.parse(localStorage.getItem("user")).id));

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
  if (lapsos.revision == "" || lapsos.revision > 20 || lapsos.revision < 0) {
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
    editar(cedula, nombre, nota, seccion, año, localStorage.getItem("estado"));
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
  let dateTime = new Date();
  if (window.location.pathname.split("/")[2] == "periodo") {
    data.append("BDR", "BDR");
  }

  data.append("año", añoDB[año - 1]);
  data.append("seccion", seccion);
  data.append("actions", "Pasar Seccion");
  data.append("dateTime", dateTime);
  data.append("userId", parseInt(JSON.parse(localStorage.getItem("user")).id));

  fetchF(data).then(() => seccionNav(año, seccion));
}

//generar reporte de notas de los alumnos de una seccion
function reporte(type) {
  switch (type) {
    case "notas":
      window.open(
        `/reporte.php?query=${type}`,
        "",
        "width=1024,height=720,toolbar=yes"
      );

      break;

    case "datos":
      window.open(
        `/reporte.php?query=${type}`,
        "",
        "width=1024,height=720,toolbar=yes"
      );
      break;
    case "datosAlumno":
      let ventana = window.open(
        `/reporte.php?query=${type}`,
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
function openBitacora() {
  window.open(`/bitacora.php`, "", "width=1024,height=720,toolbar=yes");
}

function openAdmin() {
  window.open(`/admin.php`, "", "width=1024,height=720,toolbar=yes");
}

function test() {
  const año = localStorage.getItem("año"),
    seccion = localStorage.getItem("seccion"),
    agregar = document.querySelector("#NotasAlumnos");

  let form = new FormData();

  $("#AreasAlumnos").DataTable().destroy();
  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

  form.append("año", añoDB[año - 1]);
  form.append("seccion", seccion);
  form.append("actions", "Buscar Alumnos");

  fetchF(form).then((data) => {
    data = JSON.parse(data);
    agregar.innerHTML = "";
    let alumnos = data;

    for (let i = 0; i < alumnos.length; i++) {
      let form2 = new FormData();

      if (window.location.pathname.split("/")[2] == "periodo") {
        form2.append("BDR", "BDR");
      }

      form2.append("año", añoDB[año - 1]);
      form2.append("notas", alumnos[i][14]);
      form2.append("actions", "Editar");

      fetchF(form2).then((data) => {
        data = JSON.parse(data);

        data[0].Total =
          '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}';
        let notas = data[0];

        materias = Object.entries(notas);
        notas = Object.values(notas);

        let P1 = 0,
          P2 = 0,
          P3 = 0;
        (R = 0),
          (agregar.innerHTML += `
                            <tr>
                            <th scope="row">${i + 1}</th>
                            <th>${alumnos[i][1]}</th>
                            <th>${alumnos[i][3].toUpperCase()} ${alumnos[
            i
          ][4].toUpperCase()} </th>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            </tr>`);

        for (let i = 1; i < notas.length; i++) {
          P1 += parseFloat(JSON.parse(notas[i]).primer_lapso);
          P2 += parseFloat(JSON.parse(notas[i]).segundo_lapso);
          P3 += parseFloat(JSON.parse(notas[i]).tercer_lapso);
          R += parseFloat(JSON.parse(notas[i]).revision);

          if (i == materias.length - 1) {
            notas[materias.length - 1] = `{"primer_lapso":"${parseFloat(
              P1 / (i - 1)
            ).toFixed(1)}","segundo_lapso":"${parseFloat(P2 / (i - 1)).toFixed(
              1
            )}","tercer_lapso":"${parseFloat(P3 / (i - 1)).toFixed(
              1
            )}","revision":"${parseFloat(R / (i - 1)).toFixed(1)}"}`;
          }
          agregar.innerHTML += `
                            <tr>
                            <td></td>
                            <td></td>

                            <td></td>
                            <th>${materias[i][0]
                              .replaceAll("_", " ")
                              .toUpperCase()}</th>
                            <td class="text-center">${parseFloat(
                              JSON.parse(notas[i]).primer_lapso
                            )}</td>
                            <td class="text-center">${parseFloat(
                              JSON.parse(notas[i]).segundo_lapso
                            )}</td>
                            <td class="text-center">${parseFloat(
                              JSON.parse(notas[i]).tercer_lapso
                            )}</td>
                            <td class="text-center">${parseFloat(
                              JSON.parse(notas[i]).revision
                            )}</td>
                            <td class="text-center">${(
                              (parseFloat(JSON.parse(notas[i]).primer_lapso) +
                                parseFloat(JSON.parse(notas[i]).segundo_lapso) +
                                parseFloat(JSON.parse(notas[i]).revision) !=
                              0
                                ? parseFloat(JSON.parse(notas[i]).revision)
                                : parseFloat(JSON.parse(notas[i]).tercer_año)) /
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
              url: "/DataTables/Spanish.json",
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
  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

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
      alumno.cedula_escolar == "CE" ? true : false;
    document.querySelector("#pasaporte").checked =
      alumno.cedula_escolar == "P" ? true : false;
    document.querySelector("#dni").checked =
      alumno.cedula_escolar == "V" ? true : false;
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
          <td>1</td>
          <td>${alumno.cedula_escolar}- ${alumno.cedula}</td>
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
        <th class="table-dark" ></th>
        <th class="table-dark" scope="col" >Representante</th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" scope="col"></th>

        </tr>

        <tr>
        <th class="table-dark" ></th>
        <th class="table-dark" scope="col">Cédula</th>
        <th class="table-dark" scope="col">Nombre y Apellido</th>
        <th class="table-dark" scope="col">Dirección</th>
        <th class="table-dark" scope="col">Correo</th>
        <th class="table-dark" scope="col">Filiación</th>
        <th class="table-dark" scope="col">Teléfono</th>
        <th class="table-dark" scope="col">Sexo</th>
        <th class="table-dark" scope="col"></th>
        <th class="table-dark" scope="col"></th>
        <th class="table-dark" scope="col"></th>

        </tr>

        <tr>
        <td></td>
        <td> ${representante.cedula} </td>
        <td> ${representante.nombre.toUpperCase()} ${representante.apellido.toUpperCase()} </td>
        <td> ${representante.direccion} </td>
        <td> ${representante.correo} </td>
        <td> ${representante.filiacion} </td>
        <td> ${representante.telefono} </td>
        <td> ${representante.sexo} </td>
        <td></td>
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
        url: "/DataTables/Spanish.json",
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
  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

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
        <th class="table-dark" ></th>


        </tr>

        <tr>
          <th>${i + 1}</th>
          <td>${alumno[i].cedula}</td>
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
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>
        <th class="table-dark" ></th>

        </tr>

        <tr>
        <td> ${representante.cedula} </td>
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
        url: "/DataTables/Spanish.json",
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

  let dni = "";

  if ($("#cedulaEscolar").prop("checked")) {
    dni = "CE";
  }
  if ($("#pasaporte").prop("checked")) {
    dni = "P";
  }
  if ($("#dni").prop("checked")) {
    dni = "V";
  }

  let form = new FormData();
  let dateTime = new Date();

  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

  form.append("idAlumno", ids.alumno);
  form.append("idRepresentante", ids.representante);
  form.append("nombre", $("#Nombre").val().trim());
  form.append("apellido", $("#Apellido").val().trim());
  form.append("cedula", $("#Cedula").val());
  form.append("cedulaE", dni);
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
  form.append("dateTime", dateTime);
  form.append("userId", parseInt(JSON.parse(localStorage.getItem("user")).id));

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
  let dateTime = new Date();
  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

  form.append("año", añoDB[año - 1]);
  form.append("cedula", cedula);
  form.append("seccion", seccion);
  form.append("dateTime", dateTime);
  form.append("actions", "CambiarSeccionAño");
  form.append("userId", parseInt(JSON.parse(localStorage.getItem("user")).id));

  fetchF(form)
    .then((data) => {
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
    })
    .catch((e) => {
      Swal.fire({
        title: "Opss!",
        text: "A ocurrido un error al intentar cambiar el año y/o sección del alumno. Por favor verifica que seleccionaste un año y/o sección validos",
        icon: "error",
      });
    });
}

function RenderGraduados(bdr = null) {
  if (document.querySelector("#sidebar"))
    history.pushState(null, null, "/?Alumnos");

  localStorage.removeItem("graduado");
  $("#TablaGraduados").DataTable().clear().destroy();
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
  if (bdr == "BDR") {
    form.append("BDR", bdr);
  }
  form.append("actions", "Buscar Graduados");

  fetchF(form)
    .then((data) => {
      localStorage.setItem("graduado", "graduado");
      data = JSON.parse(data);
      if (data == "False")
        return (tablaGraduados.innerHTML =
          "<h4 class='text-center'>No hay alumnos graduados</h4>");
      let i = 1;
      tablaGraduados.innerHTML = "";
      data.forEach((element) => {
        let nombre =
          element.nombre.toUpperCase() + " " + element.apellido.toUpperCase();
        tablaGraduados.innerHTML += `<tr>


        <th scope="row">${i}</th>
        <td>${element.cedula}</td>
        <td>${element.nombre.toUpperCase()}</td>
        <td>${element.apellido.toUpperCase()}</td>
        <td>${element.ano.replace("_", " ").toUpperCase()}</td>
        <td>${primeraLetraMayuscula(element.seccion)}</td>
        <td>${primeraLetraMayuscula(element.estado)}</td>
        <td>${primeraLetraMayuscula(element.periodo)}</td>
        <td> 
        <div class="btn-group">
        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
        <div class="dropdown-menu">
        <a class="dropdown-item" onclick="editar(${
          element.cedula
        },'${nombre.toString()}',${element.notas},'${element.seccion}',${
          años[element.ano]
        },'${element.estado}')" href="#">Editar</a>
        </div>
        </div>
        </td>
      </tr>`;
        i++;
      });
      $("#TablaGraduados").DataTable({
        pageLength: 10,
        lengthMenu: [10, 20, 25, 30, 35],
        retrieve: true,
        order: [[1, "asc"]],
        language: {
          url: "/DataTables/Spanish.json",
        },
      });
    })
    .catch((e) => {
      Swal.fire({
        title: "Opss!",
        text: "A ocurrido un error al intentar buscar los alumnos, Por favor Reinicia al sistema. Verifica la conexión a la base de datos",
        icon: "error",
      });
    });
}

function clean() {
  document.querySelector("#Nombre").value = "";
  document.querySelector("#Apellido").value = "";
  document.querySelector("#Cedula").value = "";
  document.querySelector("#cedulaEscolar").checked = false;
  document.querySelector("#pasaporte").checked = false;
  document.querySelector("#dni").checked = false;
  document.querySelector("#Sexo").value = "s";
  document.querySelector("#fechaNacimiento").value = "";
  document.querySelector("#Edad").value = "";
  document.querySelector("#pais").value = "";
  document.querySelector("#estado").value = "";
  document.querySelector("#Municipio").value = "";
  document.querySelector("#Telfono").value = "";
  document.querySelector("#Direccion").value = "";
  document.querySelector("#Correo").value = "";
  document.querySelector("#NombreR").value = "";
  document.querySelector("#ApellidoR").value = "";
  document.querySelector("#CedulaR").value = "";
  document.querySelector("#TelfonoR").value = "";
  document.querySelector("#SexoR").value = "s";
  document.querySelector("#Filiacion").value = "";
  document.querySelector("#DireccionR").value = "";
  document.querySelector("#CorreoR").value = "";
  document.querySelector("#gp").value = "";
  document.querySelector("#Condicion").value = "c";
  areas = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  document.querySelectorAll(".repitiente").forEach((value, i) => {
    value.checked = areas[i];
  });
  document.querySelector("#areasRp").classList.replace("d-flex", "d-none");
}

if (document.querySelector("#bitacora")) {
  let form = new FormData();
  contenidoBitacora = document.querySelector("#containerBitacora");

  contenidoBitacora.innerHTML = "";
  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

  form.append("actions", "Bitacora");
  fetchF(form).then((e) => {
    data = JSON.parse(e);
    data.forEach((value, i) => {
      if (i % 2 == 0) {
        contenidoBitacora.innerHTML += `<p class="m-0 list-group-item list-group-item-action list-group-item-secondary"> <span class=" fw-bold">${
          i + 1
        }# | ${moment(value[2]).calendar()}</span>: ${value[1]}</p>`;
      } else {
        contenidoBitacora.innerHTML += `<p class="m-0 list-group-item list-group-item-action list-group-item-dark"><span class=" fw-bold">${
          i + 1
        }# | ${moment(value[2]).calendar()}</span>: ${value[1]}</p>`;
      }
    });
  });
}

const renderUsers = () => {
  let contenido = document.querySelector("#adminTable tbody");
  let form = new FormData();
  contenido.innerHTML = "";
  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

  form.append("actions", "admin");
  fetchF(form).then((e) => {
    data = JSON.parse(e);
    data.forEach((value) => {
      contenido.innerHTML += `
    <tr>
      <th class=" px-5 mx-5" scope="row">${value[1].toLocaleUpperCase()}</th>
      <th class=" px-5 mx-5" scope="row">${value[2].toLocaleUpperCase()}</th>
      <th class=" px-5 mx-5" scope="row">${value[3]}</th>
      <th class=" px-5 mx-5" scope="row">
        <select id="${value[0]}" class="form-select me-5 ms-3" >
        <option ${
          value[5] == "admin" ? "selected" : ""
        } value="admin">Administrador </option>
        <option ${
          value[5] == "user" ? "selected" : ""
        } value="user">Usuario </option>
        </select>
      </th>
    </tr>
    `;
    });
  });
};

if (document.querySelector("#admin")) {
  renderUsers();
  document.querySelector("#admin").addEventListener("click", function (e) {
    if ("SELECT" == e.target.tagName) {
      e.target.addEventListener("change", () => {
        let form = new FormData();
        if (window.location.pathname.split("/")[2] == "periodo") {
          form.append("BDR", "BDR");
        }

        form.append("id", e.target.id);
        form.append("role", e.target.value);
        form.append(
          "userId",
          parseInt(JSON.parse(localStorage.getItem("user")).id)
        );
        form.append("actions", "admin users");
        fetchF(form).then((e) => {
          if (e == "True") {
            Swal.fire({
              title: "Modificado!",
              text: "Cambios Realizados con Éxito",
              icon: "success",
              confirmButtonText: "Entendido",
            });
          }
        });
      });
    }
  });
}

if (document.querySelector("#userInfo")) {
  let contenido = document.querySelector("#userInfo");
  const user = JSON.parse(localStorage.getItem("user"));
  const nameWelcome = document.querySelector("#NameWelcome");
  nameWelcome.innerHTML = `${user.nombre.toUpperCase()} ${user.apellido.toUpperCase()}`;

  contenido.innerHTML = `
 <li class="list-group-item"><span class=" fw-bold">Nombre:</span> ${user.nombre.toUpperCase()}</li>
 <li class="list-group-item"><span class=" fw-bold">Apellido:</span> ${user.apellido.toUpperCase()}</li>
 <li class="list-group-item"><span class=" fw-bold">Correo:</span> ${
   user.email
 }</li>
 <li class="list-group-item"><span class=" fw-bold">Rol:</span> ${
   user.role == "admin"
     ? "Administrador"
     : user.role == "superadmin"
     ? "Super Administrador"
     : "Usuario"
 }</li>
 `;
}

const findRepitiente = () => {
  let form = new FormData();
  if (window.location.pathname.split("/")[2] == "periodo") {
    form.append("BDR", "BDR");
  }

  form.append("cedula", localStorage.getItem("cedula"));
  form.append("userId", parseInt(JSON.parse(localStorage.getItem("user")).id));
  form.append("actions", "find repitientes");
  fetchF(form).then((e) => {
    areas = JSON.parse(JSON.parse(e).repitiente);
    document.querySelectorAll(".rp").forEach((value, i) => {
      value.checked = areas[i];
    });
  });
};

if (currentUrl[0] == "seccion") {
  seccionNav(currentUrl[1], currentUrl[2]);
} else if (currentUrl[0] == "alumno") {
  welcome.css("display", "none");
  editar(
    currentUrl[1],
    currentUrl[2],
    currentUrl[3],
    currentUrl[4],
    currentUrl[5],
    currentUrl[6]
  );
} else if (currentUrl[0] == "admin") {
  window.location.href = "./admin.php";
} else if (currentUrl[0] == "Alumnos") {
  RenderGraduados();
}

if (document.querySelector("#boletin")) {
  const btn = document.querySelector("#boletin"),
    cedula = localStorage.getItem("cedula"),
    año = localStorage.getItem("año");

  btn.addEventListener("click", (e) => {
    console.log("object");
    e.preventDefault();
    const form = new FormData();
    if (window.location.pathname.split("/")[2] == "periodo") {
      form.append("BDR", "BDR");
    }

    form.append("cedula", cedula);
    form.append("año", añoDB[año - 1]);
    form.append("actions", "GenerarBoletin");
    console.log(form);
    fetch("/backend/actions.php", {
      method: "POST",
      body: form,
    }).then((res) => {
      console.log(res);
    });
  });
}

const respaldo = async (e) => {
  history.pushState(null, null, "/?admin&save");
  const form = new FormData();

  form.append("actions", "respaldo");
  console.log(form);
  await fetch("/backend/actions.php", {
    method: "POST",
    body: form,
  }).then((res) => {
    Swal.fire({
      title: "Respaldo",
      text: "Copia de seguridad realizada con exito",
      icon: "success",
      confirmButtonText: "ok",
    });
  });
};

if (document.querySelector("#respaldo")) {
  const btn = document.querySelector("#respaldo");
  const formR = document.querySelector("#FormRespaldo");
  const btnR = document.querySelector("#btnR");
  const btnL = document.querySelector("#btnL");
  const confirmL = document.querySelector("#confirmL");
  const formFind = document.querySelector("#FormBuscar");
  const btnFind = document.querySelector("#buscarAlumno");
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    respaldo();
  });
  btnL.addEventListener("click", (e) => {
    e.preventDefault();
  });
  confirmL.addEventListener("click", (e) => {
    e.preventDefault();
    const form = new FormData();
    form.append("actions", "Limpiar");
    fetchF(form).then((e) => {
      Swal.fire({
        title: "Sistema",
        text: "Operacion Completada",
        icon: "success",
        confirmButtonText: "ok",
      });
    });
  });
  formR.addEventListener("submit", async (e) => {
    e.preventDefault();
    btnR.classList.toggle("disabled");
    btnR.innerHTML = `<div class="spinner-border text-light" role="status">
    <span class="visually-hidden">Loading...</span>
  </div>`;
    history.pushState(null, null, "/?admin&save");
    const form = new FormData(formR);
    form.append("actions", "restaurar");
    console.log(form);
    await fetch("/backend/actions.php", {
      method: "POST",
      body: form,
    }).then((res) => {
      btnR.classList.toggle("disabled");

      btnR.innerHTML = "Restaurar";
      Swal.fire({
        title: "Sistema",
        text: "Copia de seguridad Restauraza con exito",
        icon: "success",
        confirmButtonText: "ok",
      });
    });
  });
  formFind.addEventListener("submit", async (e) => {
    e.preventDefault();
    btnFind.classList.toggle("disabled");

    btnFind.innerHTML = `<div class="spinner-border text-light" role="status">
    <span class="visually-hidden">Loading...</span>
  </div>`;
    history.pushState(null, null, "/?admin&save");
    const form = new FormData(formFind);
    form.append("baseDeDatos", "baseDeDatos");
    form.append("actions", "restaurar");
    console.log(form);
    await fetch("/backend/actions.php", {
      method: "POST",
      body: form,
    }).then((res) => {
      btnFind.classList.toggle("disabled");
      btnFind.innerHTML = "Restaurar";
      Swal.fire({
        title: "Sistema",
        text: "Periodo cargado con exito",
        icon: "success",
        confirmButtonText: "ok",
      });
    });
  });
}
