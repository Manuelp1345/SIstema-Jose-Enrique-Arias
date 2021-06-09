
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
<table id="AreasAlumnos" class="display d-block py-3 my-3 col-auto table alumno center">

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

</div>


</div>






<script>
    window.onload = ()=>{
        
    test()
    }
</script>




</body>
</html>


<?php require "partials/footer.php";


?>