
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>U.E | Jose Enrique Arias | </title>
    	
    <link rel="icon" href="img/logo.png" type="image/png" />
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
</head>
<body>



<div class="container-fluid">
<div class="mt-5 d-flex justify-content-center align-items-center flex-column">



<div id="loading" class="d-flex align-items-center">
  <strong>Cargando...</strong>
  <div class="spinner-border ms-3" role="status" aria-hidden="true"></div>
</div>


<table id="AreasAlumnos" class="display py-3 my-3 col-auto table alumno center">

  <div class="d-flex flex-row">
    <h1 id="añoinfo" class="me-3" >Año: </h1>
    <h1 id="seccioninfo" >Seccion: </h1>
   </div>

  <thead class="table-dark">
    <tr>
      <th scope="col">C.I</th>
      <th scope="col">Nombre</th>
      <th scope="col">Area</th>
      <th scope="col">Primer Momento</th>
      <th scope="col">Segundo Momento</th>
      <th scope="col">Tercer Momento</th>
      <th scope="col">Nota Final</th>

    </tr>
  </thead>
  
  <tbody id="NotasAlumnos">

  </tbody>

</table>


<div class="table-responsive ms-sm-5 ps-sm-5">
  <table id="Alumnoexport" class="display py-3 my-3 col-auto table alumno center">

  <div class="">
    <button id="editar" class="mb-3 d-none btn btn-primary btn-sm col-3" data-bs-toggle="modal" data-bs-target="#modificarAlumno">Editar Datos</button>
  </div>

  <thead class="table-dark">
    <tr>
      <th scope="col">Cedula</th>
      <th scope="col">Nombre y Apellido</th>
      <th scope="col">Sexo</th>
      <th scope="col">Fecha de Nacimiento</th>
      <th scope="col">Edad</th>
      <th scope="col">Lugar de Nacimiento</th>
      <th scope="col">Telefono</th>
      <th scope="col">Direccion</th>
      <th scope="col">Correo</th>
    </tr>
  </thead>
  <tbody id="DatosAlumnos">

  </tbody>
</table>
</div>



</div>
</div>

<div class="modal fade" id="modificarAlumno" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modificar Datos</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="row g-3 d-flex flex-row align-items-start justify-content-start">
            <div class="form-group col-6">
            <h5>Datos del Alumno</h5>
              <label for="Nombre">Nombre</label>
              <input type="text" class="form-control" id="Nombre" placeholder="Nombre">
              <label for="Apellido">Apellido</label>
              <input type="text" class="form-control" id="Apellido" placeholder="Apellido">
              <label for="Cedula">Cedula</label>
              <input type="number" class="form-control" id="Cedula" placeholder="Cedula">
              <div class=" p-3">
                <input class=" form-check-input" type="checkbox" name="cedulaEscolar" id="cedulaEscolar">
                <label class=" form-check-label" for="cedulaEscolar">Cedula Escolar </label>
              </div>
              <select class="form-select mb-2" aria-label="Default select example" name="Sexo" id="Sexo">
                  <option selected > Sexo </option>
                  <option value="Masculino">Masculino</option>
                  <option value="Femenino">Femenino</option>
              </select>

              <label for="fechaNacimiento">Fecha de Nacimiento</label>
              <input  class="form-control" type="date" name="fechaNacimiento" id="fechaNacimiento">

              <label for="Edad">Edad</label>
              <input  class="form-control" type="number" placeholder="Edad" name="Edad" id="Edad">

              <label for="LugarNacimiento">Lugar de Nacimineto</label>
              <input  class="form-control" type="text" placeholder="Lugar de Nacimineto" name="LugarNacimiento" id="LugarNacimiento">

              <label for="Telfono">Telefono</label>
              <input  class="form-control" type="tel" placeholder="Telefono" name="Telfono" id="Telfono">

              <label for="Direccion">Direccion</label>
              <input  class="form-control" type="text" placeholder="Direccion" name="Direccion" id="Direccion">
              
              <label for="Correo">Correo</label>
              <input  class="form-control" type="email" placeholder="Correo" name="Correo" id="Correo">
              </div>

            <div class="form-group col-6">
            <h5>Datos del Representante</h5>
              <label for="NombreR">Nombre</label>
              <input type="text" class="form-control" name="NombreR" id="NombreR" placeholder="Nombre">
              <label for="ApellidoR">Apellido</label>
              <input type="text" class="form-control" name="ApellidoR" id="ApellidoR" placeholder="Apellido">
              <label for="CedulaR">Cedula</label>
              <input type="number" class="form-control" name="CedulaR" id="CedulaR" placeholder="Cedula">
              <select class="form-select my-3" name="SexoR" id="SexoR">
                  <option selected > Sexo </option>
                  <option value="Masculino">Masculino</option>
                  <option value="Femenino">Femenino</option>
              </select>

              <label for="Filiacion">Filiacion</label>
              <input  class="form-control" type="text" placeholder="Filiacion" name="Filiacion" id="Filiacion">

              <label for="TelfonoR">Telefono</label>
              <input  class="form-control" type="tel" placeholder="Telefono" name="TelfonoR" id="TelfonoR">

              <label for="DireccionR">Direccion</label>
              <input  class="form-control" type="text" placeholder="Direccion" name="DireccionR" id="DireccionR">
              
              <label for="CorreoR">Correo</label>
              <input  class="form-control" type="email" placeholder="Correo" name="CorreoR" id="CorreoR">
              </div>
          </div>
                <div class="alert alert-danger" role="alert"></div>
                <div class="alert alert-success" role="alert"></div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <button id="modal" onclick="ModificarDatosalumno()" type="submit" class="btn btn-primary">Agregar</button>
      </div>
    </div>
  </div>
</div>






<script>
  const query = window.location.search.split("=")[1]
  const tabla= document.querySelector("#AreasAlumnos")
  const loading = document.querySelector("#loading")
  const añoInfo = document.querySelector("#añoinfo")
  const seccionInfo =document.querySelector("#seccioninfo")
  const alumnos = document.querySelector("#Alumnoexport")
  const modificar = document.querySelector("#editar")


  
  añoInfo.innerHTML += localStorage.getItem("año")
  seccionInfo.innerHTML += localStorage.getItem("seccion")


    window.onload = ()=>{

      loading.classList.toggle("d-none")

      if(query === "notas"){
        tabla.classList.toggle("d-block")
        test()
      }
      else if(query === "datosAlumno"){
        alumnos.classList.toggle("d-block")
        modificar.classList.toggle("d-none")


        datosAlumno()

      }
      else{
        alumnos.classList.toggle("d-block")
        ReporteAlumnos()
      }
        
    }
</script>


<script src="js/sweetalert2.all.min.js"></script>

</body>
</html>


<?php require "partials/footer.php";


?>