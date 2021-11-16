
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

    <div id="periodos" class=" container">
      <div id="AlumnosGraduados" class="animate__animated animate__fadeInLeft animate__faster">
          <div class="card text-center">
              <div class="card-body">
                <h4 class="card-title">Alumnos Graduados / Retirados / Cursando</h4>
              </div>
              <div class="alert alert-danger" role="alert"></div>
              <div class="alert alert-success" role="alert"></div>
            <div class=" d-flex justify-content-center align-items-center flex-row">
              <table id="TablaGraduados"  class="table center my-2 p-2">
                <thead class="table-dark">
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">C.I</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Año</th>
                    <th scope="col">Sección</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Periodo</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody id="TBGraduados">
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <?php
         require "./partials/alumno.php" ;
         require "./partials/modalEditarNotas.php" ;
         require "./partials/modalCambiarSeccionAnio.php" ;
      ?>
    </div>

  
  </body>
  <script src="js/sweetalert2.all.min.js"></script>
  <script src="js/moment-with-locales.js"></script>


  <?php require "partials/footer.php";?>
  <script>
    moment().format();
    moment.locale('es')
    RenderGraduados("BDR")

  </script>

</html>


