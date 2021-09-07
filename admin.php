
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
    <div id="admin" class=" container">
        <h2 class="mb-5" >Administración de usuarios</h2>
        <div class=" d-flex justify-content-center align-items-center flex-row">
        <table id="adminTable"  class="table center table-hover">
          <thead class="table-dark">
            <tr>
              <th class=" px-5 mx-5" scope="col">Nombre</th>
              <th class=" px-5 mx-5" scope="col">Apellido</th>
              <th class=" px-5 mx-5" scope="col">Correo</th>
              <th class=" px-5 mx-5" scope="col">Rol</th>
            </tr>
          </thead>
          <tbody>

          </tbody>
        </table>
    </div>
    </div>

  
  </body>
  <script src="js/sweetalert2.all.min.js"></script>
  <script src="js/moment-with-locales.js"></script>

  <script>
    moment().format();
    moment.locale('es')

  </script>
  <?php require "partials/footer.php";?>

</html>


