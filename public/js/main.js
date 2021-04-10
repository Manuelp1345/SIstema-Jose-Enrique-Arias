let url = window.location.pathname.split("/", 2)[1]
let error = $(".alert-danger")
let succes = $(".alert-success")
let contenido = $(".table, .menu")
let tablaAlumno = $(".alumno")
let welcome = $(".welcome")
let token = localStorage.getItem("token")
let usuario = JSON.parse(localStorage.getItem("usuario"))
const primeraLetraMayuscula = (cadena) => cadena.charAt(0).toUpperCase().concat(cadena.substring(1, cadena.length));

if ((url === "login") || (url === "register")) {
    if (token) window.location = "inicio/" + token

    let body = $("body")

    let titulos = $("h1,h2")

    titulos.css("color", "black")

    body.css({
        "background": `url("/img/1.jpg")`,
        "background-repeat": "no-repeat",
        "background-size": "cover",
        "background-position": "center"

    })

    let form = document.querySelector("form")

    form.onsubmit = (e) => {
        e.preventDefault()

    }
}

if (url === "inicio") {
    let bienvenida = $(".welcome h5 span")
    let nombre = primeraLetraMayuscula(usuario.nombre)
    bienvenida.text(nombre)

}

if (url === "login") {
    function login() {
        let formData = new FormData()

        let form = {
            email: $("#email").val(),
            password: $("#password").val()
        }

        if (form.email === "") {
            error.css("display", "block")
            return error.html("Por Favor Ingrese un correo<br>")
        }
        if (form.password === "") {
            error.css("display", "block")
            return error.html("Por Favor Ingrese una contraseña<br>")

        }

        formData = form

        fetch("login", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            }).then(e => e.json())
            .then(e => {
                if (!e.ok) {

                    error.css("display", "block")
                    return error.html(e.mensaje)
                }

                let usuario = e.usuario
                let usuarioFinal = JSON.stringify(usuario)

                localStorage.setItem("usuario", usuarioFinal)
                localStorage.setItem("token", e.token)

                window.location = "inicio/" + e.token
            })
    }
}

if (url === "register") {

    function register() {
        let formData = new FormData()

        let form = {
            nombre: $("#nombre").val(),
            apellido: $("#apelldio").val(),
            email: $("#email").val(),
            password: $("#password").val()
        }
        if (form.email === "") {
            succes.css("display", "none")
            error.css("display", "block")
            return error.html("Por Favor Ingrese un correo<br>")
        }
        if (form.password === "") {
            succes.css("display", "none")
            error.css("display", "block")
            return error.html("Por Favor Ingrese una contraseña<br>")
        }
        if (form.nombre === "") {
            succes.css("display", "none")
            error.css("display", "block")
            return error.html("Por Favor Ingrese un nombre<br>")
        }
        if (form.apellido === "") {
            succes.css("display", "none")
            error.css("display", "block")
            return error.html("Por Favor Ingrese un apellido<br>")
        }

        formData = form

        fetch("register", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        }).then(e => e.json()).then(e => {
            if (!e.ok) {

                error.css("display", "block")
                return error.html(e.mensaje)
            }
            error.css("display", "none")
            succes.css("display", "block")
            succes.html(e.mensaje)

            setTimeout(() => {
                window.location = "/login"
            }, 1500);

        })

    }
}

let inicio = () => {
    window.location = "/inicio/" + token
}

function cerrar() {
    localStorage.removeItem("token")
}

let seccionNav = (año, seccion) => {
    let agregar = document.querySelector("tbody")

    localStorage.setItem("año", año)
    localStorage.setItem("seccion", seccion)

    welcome.css("display", "none")
    tablaAlumno.css("display", "none")
    contenido.css("display", "block")

    let titulo = $(".menu h5")
    let añoDB = 0

    if (año == 1) añoDB = "primer_año"
    if (año == 2) añoDB = "segundo_año"
    if (año == 3) añoDB = "tercer_año"
    if (año == 4) añoDB = "cuarto_año"
    if (año == 5) añoDB = "quinto_año"

    switch (año) {
        case 1:
            titulo.text(`Primer Año Seccion "${seccion}"`)
            break;
        case 2:
            titulo.text(`Segundo Año Seccion "${seccion}"`)
            break;
        case 3:
            titulo.text(`Tercer Año Seccion "${seccion}"`)
            break;
        case 4:
            titulo.text(`Cuarto Año Seccion "${seccion}"`)
            break;
        case 5:
            titulo.text(`Quinto Año Seccion "${seccion}"`)
            break;
    }

    let form = {
        año: añoDB,
        seccion
    }
    fetch("/alumnos/" + token, {
            method: 'post',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(form)
        }).then(e => e.json())
        .then(data => {
            agregar.innerHTML = ""
            let alumnosDB = JSON.stringify(data)
            let alumnosObject = JSON.parse(alumnosDB)
            alumnosObject = alumnosObject.alumnos

            for (let i = 0; i < alumnosObject.length; i++) {

                let form2 = {
                    año: añoDB,
                    notas: alumnosObject[i].notas
                }

                fetch("/editar/" + token, {
                        method: 'PUT',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(form2)
                    }).then(e => e.json())
                    .then(data => {
                        let notasDB = data

                        let notasObject = notasDB.notas

                        let materiasDB = JSON.stringify(data)
                        let materiasObject = JSON.parse(materiasDB)
                        materiasObject = materiasObject.materias

                        let primer_lapso = 0

                        let segundo_lapso = 0

                        let tercer_lapso = 0

                        let notaFinal = 0

                        notasObject = Object.values(notasObject)

                        for (let i = 1; i < materiasObject.length; i++) {

                            primer_lapso += parseInt((JSON.parse(notasObject[i]).primer_lapso))
                            segundo_lapso += parseInt((JSON.parse(notasObject[i]).segundo_lapso))
                            tercer_lapso += parseInt((JSON.parse(notasObject[i]).tercer_lapso))
                        }

                        primer_lapso = primer_lapso / parseInt(materiasObject.length - 1)
                        segundo_lapso = segundo_lapso / parseInt(materiasObject.length - 1)
                        tercer_lapso = tercer_lapso / parseInt(materiasObject.length - 1)

                        notaFinal = (primer_lapso + segundo_lapso + tercer_lapso) / 3

                        agregar.innerHTML += `
                            <tr>
                            <th scope="row">${i+1}</th>
                            <td>${format(alumnosObject[i].cedula)}</td>
                            <td>${alumnosObject[i].nombre.toUpperCase()} </td>
                            <td>${alumnosObject[i].apellido.toUpperCase()}</td>
                            <td>${parseInt(primer_lapso)}</td>
                            <td>${parseInt(segundo_lapso)}</td>
                            <td>${parseInt(tercer_lapso)}</td>
                            <td>${notaFinal.toFixed(1)}</td>
                            <td> 
                            <div class="btn-group">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Modificar
                            </button>
                            <div class="dropdown-menu">
                            <a class="dropdown-item" onclick="editar(${alumnosObject[i].cedula},'${alumnosObject[i].nombre} ${alumnosObject[i].apellido}',${alumnosObject[i].notas})" href="#">Editar</a>
                            <a class="dropdown-item" onclick="eliminarAlumno(${alumnosObject[i].cedula})"  href="#">Eliminar</a>
                            </div>
                            </div>
                            </td>
                            </tr>`
                    })
            }
        })
}

function alumno() {
    let año = localStorage.getItem("año")
    let seccion = localStorage.getItem("seccion")
    $("#modal").removeAttr("data-dismiss")

    let añoDB = ""

    if (año == 1) añoDB = "primer_año"
    if (año == 2) añoDB = "segundo_año"
    if (año == 3) añoDB = "tercer_año"
    if (año == 4) añoDB = "cuarto_año"
    if (año == 5) añoDB = "quinto_año"

    let form = {
        nombre: $("#Nombre").val(),
        apellido: $("#Apellido").val(),
        cedula: $("#Cedula").val(),
        año: añoDB,
        seccion
    }

    if (form.nombre === "") {
        succes.css("display", "none")

        error.css({ display: "block" })
        return error.text("Por Favor Ingrese un nombre")
    }
    if (form.apellido === "") {
        succes.css("display", "none")

        error.css({ display: "block" })
        return error.text("Por Favor Ingrese un apellido")
    }
    if (form.cedula === "") {
        succes.css("display", "none")
        error.css({ display: "block" })
        return error.text("Por Favor Ingrese un cedula")
    }
    $("#modal").attr("data-dismiss", "modal")
    fetch("/alumno/" + token, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(form)
        }).then(e => e.json())
        .then(data => {
            console.log(data);
            if (!data.ok) {
                succes.css("display", "none")
                error.css("display", "block")
                return error.html(data.mensaje)
            }
            error.css("display", "none")
            succes.css("display", "block")
            succes.html(data.mensaje)
            setTimeout(() => {
                succes.css("display", "none")
            }, 5000);
            seccionNav(año, seccion)
        })
}

function format(input) {
    var num = input
    if (!isNaN(num)) {
        num = num.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g, '$1.');
        num = num.split('').reverse().join('').replace(/^[\.]/, '');
        return num
    }
}

function editar(cedula, nombre, notas) {
    let agregar = document.getElementById("notasAlumnos")
    let titulo = $(".alumno h5")

    titulo.html(`C.I: ${format(cedula)}<br> Alumno: ${nombre.toUpperCase()}`)

    contenido.css("display", "none")
    tablaAlumno.css("display", "block")

    let año = localStorage.getItem("año")

    let añoDB = ""

    if (año == 1) añoDB = "primer_año"
    if (año == 2) añoDB = "segundo_año"
    if (año == 3) añoDB = "tercer_año"
    if (año == 4) añoDB = "cuarto_año"
    if (año == 5) añoDB = "quinto_año"

    let form = {
        cedula,
        año: añoDB,
        notas
    }
    agregar.innerHTML = ""

    fetch("/editar/" + token, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(form)
        }).then(e => e.json())
        .then(data => {
            let notasDB = data
            let notasObject = notasDB.notas
            let materiasDB = JSON.stringify(data)
            let materiasObject = JSON.parse(materiasDB)

            materiasObject = materiasObject.materias
            notasObject = Object.values(notasObject)

            console.log(parseInt(JSON.parse(notasObject[1]).primer_lapso) + parseInt(JSON.parse(notasObject[1]).segundo_lapso) + parseInt(JSON.parse(notasObject[1]).tercer_lapso))

            for (let i = 1; i < materiasObject.length; i++) {

                agregar.innerHTML += `
                <tr>
                <th scope="row">${materiasObject[i].name}</th>
                <td>${parseInt(JSON.parse(notasObject[i]).primer_lapso)}</td>
                <td>${parseInt(JSON.parse(notasObject[i]).segundo_lapso)}</td>
                <td>${parseInt(JSON.parse(notasObject[i]).tercer_lapso)}</td>
                <td>${((parseInt(JSON.parse(notasObject[i]).primer_lapso) + parseInt(JSON.parse(notasObject[i]).segundo_lapso) + parseInt(JSON.parse(notasObject[i]).tercer_lapso))/3).toFixed(1)}</td>
                <td></td>
                <td></td>
                <td></td>
                <td> 
                <button type="button" class="btn btn-primary" onclick="editarN('${materiasObject[i].name}',${JSON.parse(notasObject[0])}, ${notas}, '${nombre}', ${cedula})" data-toggle="modal" data-target="#editarnotas">
                editar
                </button>
                </td>
                </tr>`
            }
        })
}

function eliminarTodos() {
    let año = localStorage.getItem("año")
    let seccion = localStorage.getItem("seccion")

    let añoDB = ""

    if (año == 1) añoDB = "primer_año"
    if (año == 2) añoDB = "segundo_año"
    if (año == 3) añoDB = "tercer_año"
    if (año == 4) añoDB = "cuarto_año"
    if (año == 5) añoDB = "quinto_año"

    let form = {
        año: añoDB,
        seccion
    }
    fetch("/eliminarTodos/" + token, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(form)
        }).then(e => e.json())
        .then(data => {
            console.log(data);
            if (!data.ok) {
                succes.css("display", "none")
                error.css("display", "block")
                return error.html(data.mensaje)
            }
            error.css("display", "none")
            succes.css("display", "block")
            succes.html(data.mensaje)
            setTimeout(() => {
                succes.css("display", "none")
            }, 5000);
            seccionNav(año, seccion)
        })
}

function eliminarAlumno(cedula) {
    let año = localStorage.getItem("año")
    let seccion = localStorage.getItem("seccion")

    let form = {
        cedula
    }
    fetch("/eliminar/" + token, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(form)
        }).then(e => e.json())
        .then(data => {
            console.log(data);
            if (!data.ok) {
                succes.css("display", "none")
                error.css("display", "block")
                return error.html(data.mensaje)
            }
            error.css("display", "none")
            succes.css("display", "block")
            succes.html(data.mensaje)
            setTimeout(() => {
                succes.css("display", "none")
            }, 5000);
            seccionNav(año, seccion)
        })
}

function editarN(materia, id, nota, nombre, cedula) {

    console.log(id);

    localStorage.setItem("materia", materia)
    localStorage.setItem("idMaterias", id)
    localStorage.setItem("nota", nota)
    localStorage.setItem("nombre", nombre)
    localStorage.setItem("cedula", cedula)

}

function enviarNotas() {
    let año = localStorage.getItem("año")
    let materia = localStorage.getItem("materia")
    let nota = localStorage.getItem("nota")
    let nombre = localStorage.getItem("nombre")
    let cedula = localStorage.getItem("cedula")
    let id = localStorage.getItem("idMaterias")

    let añoDB = ""

    if (año == 1) añoDB = "primer_año"
    if (año == 2) añoDB = "segundo_año"
    if (año == 3) añoDB = "tercer_año"
    if (año == 4) añoDB = "cuarto_año"
    if (año == 5) añoDB = "quinto_año"

    let lapsos = {
        primer_lapso: 0,
        segundo_lapso: 0,
        tercer_lapso: 0
    }

    lapsos.primer_lapso = $("#primer_lapso").val()
    lapsos.segundo_lapso = $("#segundo_lapso").val()
    lapsos.tercer_lapso = $("#tercer_lapso").val()

    let form = {
        materia,
        nota: id,
        año: añoDB,
        datos: JSON.stringify(lapsos)
    }

    if ((lapsos.primer_lapso == "") || (lapsos.primer_lapso > 20) || (lapsos.primer_lapso < 0)) {
        succes.css("display", "none")
        error.css("display", "block")
        return error.html("Por favor ingrese una nota ( minimo: 0 / maximo: 20 )")
    }
    if ((lapsos.segundo_lapso == "") || (lapsos.segundo_lapso > 20) || (lapsos.segundo_lapso < 0)) {
        succes.css("display", "none")
        error.css("display", "block")
        return error.html("Por favor ingrese una nota ( minimo: 0 / maximo: 20 )")
    }
    if ((lapsos.tercer_lapso == "") || (lapsos.tercer_lapso > 20) || (lapsos.tercer_lapso < 0)) {
        succes.css("display", "none")
        error.css("display", "block")
        return error.html("Por favor ingrese una nota ( minimo: 0 / maximo: 20 )")
    }

    $("#btnAgragar").attr("data-dismiss", "modal")
    error.css("display", "none")
    fetch("/notas/" + token, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(form)
        }).then(e => e.json())
        .then(data => {
            console.log(data);
            error.css("display", "none")
            succes.css("display", "block")
            succes.html("Las notas han sido actualizadas")
            editar(cedula, nombre, nota)
            setTimeout(() => {
                succes.css("display", "none")
            }, 5000);
        })

}