
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


<div class=" table-responsive">
  <table id="Alumnoexport" class="display py-3 my-3 col-auto table alumno center">
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
    <tr>
      <td>27.919.047</td>
      <td>Manuel Alejandro Puente Puente</td>
      <td>Masculino</td>
      <td>30/12/2000</td>
      <td>20</td>
      <td>Merida,merida Hula centro</td>
      <td>04247747455</td>
      <td>Merida,Ejido alfredo lara calle 1 casa #19</td>
      <td>manuelp1345@gmail.com</td>
    </tr>
  </tbody>
</table>
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
  
  añoInfo.innerHTML += localStorage.getItem("año")
  seccionInfo.innerHTML += localStorage.getItem("seccion")


    window.onload = ()=>{

      loading.classList.toggle("d-none")

      if(query === "notas"){
        tabla.classList.toggle("d-block")
        test()
      }
      else{
        alumnos.classList.toggle("d-block")
        console.log("datos")
      }
        
    }
</script>




</body>
</html>


<?php require "partials/footer.php";


?>