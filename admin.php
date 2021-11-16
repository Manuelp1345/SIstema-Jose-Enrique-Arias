
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
    <div id="" class=" container">
    <h2 class="mb-3" >Administración de Respaldos, consultas de periodos y limpieza de datos</h2>
      <div class=" d-flex justify-content-center align-items-center flex-row col-12 gap-3">
        <form id="FormRespaldo" class="d-flex justify-content-center align-content-center flex-column col-6 p-5 card shadow border border-1 border-dark">
          <h4 class=" fw-light">Copia de seguridad</h4>

            <button id="respaldo" class="btn btn-primary m-2">Realizar copia de seguridad</button>
          <select class=" form-select" name="restorePoint">
            <option class=" selection" value="" disabled="" selected="">Selecciona un punto de restauración</option>
            <?php
              include_once './BackEnd/connect.php';
              $ruta="./respaldos";
              if(is_dir($ruta)){
                  if($aux=opendir($ruta)){
                      while(($archivo = readdir($aux)) !== false){
                          if($archivo!="."&&$archivo!=".."){
                            $nombrearchivo=str_replace("&", "", str_replace(".sql", "", $archivo));
                              $ruta_completa=$ruta."/".$archivo;
                              if(is_dir($ruta_completa)){
                              }else{
                                  echo '<option value=".'.$ruta_completa.'">'.$nombrearchivo.'</option>';
                              }
                          }
                      }
                      closedir($aux);
                  }
              }else{
                  echo $ruta." No es ruta válida";
              }
            ?>
          </select>
          <button id="btnR" class="btn btn-success m-2 mt-5" type="submit" >Restaurar</button>
          <button id="btnL" class="btn btn-danger m-2" data-bs-toggle="modal" data-bs-target="#eliminarTodos">Limpiar base de datos</button>
        </form>
        <form id="FormBuscar" class="d-flex justify-content-center align-content-center flex-column col-6 p-5 card shadow border border-1 border-dark" action="./Restore.php" method="POST">
              <h4>Busca alumnos por periodo escolar</h4>
          <select class=" form-select" name="restorePoint2">
            <option class=" selection" value="" disabled="" selected="">Selecciona un periodo escolar</option>
            <?php
              include_once './BackEnd/connect.php';
              $ruta="./respaldos";
              if(is_dir($ruta)){
                  if($aux=opendir($ruta)){
                      while(($archivo = readdir($aux)) !== false){
                          if($archivo!="."&&$archivo!=".."){
                              $nombrearchivo=str_replace(".sql", "", $archivo);
                              $ruta_completa=$ruta."/".$archivo;
                              if(is_dir($ruta_completa)){
                              }else{
                                  echo '<option value=".'.$ruta_completa.'">'.explode("&",$nombrearchivo)[0].'</option>';
                              }
                          }
                      }
                      closedir($aux);
                  }
              }else{
                  echo $ruta." No es ruta válida";
              }
            ?>
          </select>
          <button id="buscarAlumno" class="btn btn-dark m-2" type="submit" >Cargar alumnos</button>
          <a id="buscarAlumno" class="btn btn-secondary m-2" href="/periodos.php" >Buscar alumnos</a>
        </form>
      </div>
      <h2 class="mb-3 mt-4" >Administración de usuarios</h2>
      <div class=" d-flex justify-content-center align-items-center flex-row card shadow p-4 border border-1 border-dark">
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
    </div>

    <?php 
    require "./partials/modalLimpiarBD.php"
    ?>

  
  </body>
  <script src="js/sweetalert2.all.min.js"></script>
  <script src="js/moment-with-locales.js"></script>

  <script>
    moment().format();
    moment.locale('es')

  </script>
  <?php require "partials/footer.php";?>

</html>


