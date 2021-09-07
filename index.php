<?php 
session_start();
if(!isset($_SESSION["usuario"])){
  header("Location: login.php");
}

require "partials/header.php";


?>

<div id="index" class="container">


<div class="welcome"> 
  <div class="card text-center shadow">
    <div class="card-body">
      <h5 class="card-title">Hola <span></span></h5>
      <p class="card-text">
        Te damos la bienvenida al nuevo sistema de notas automatizado para la unidad educativa José Enrique Arias 
      </p>
  </div>
</div><br>

<div class="row ">
    <div class="col-12 d-flex flex-row justify-content-center align-items-center">
      <div class="col-6 d-flex flex-column flex-wrap mx-2">
        <div class="col-12 my-2 shadow-lg ">
          <div class="card rounded rounded-3 ">
            <div class="card-body">
              <h5 class="card-title">Ayuda</h5>
              <p class="card-text">
                Para sacarle el mayor provecho al nuevo sistema de notas te recomendamos
                darle un vistazo al manual de uso <br><br>
                </p>
              <a href="#" class="btn btn-primary">Ver Manual</a>
            </div>
          </div>
        </div>
        <div class="col-12 my-2 shadow-lg ">
          <div class="card rounded rounded-3 ">
            <div class="card-body">
              <h5 class="card-title ">Acerca del sistema</h5>
              <p class="card-text">
              El sistema de notas esta hecho en una de las tecnologías más usadas a nivel mundial para el desarrollo de aplicaciones web
                </p>
              <a href="#" class="btn btn-primary">Leer más</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-6 d-flex flex-column flex-wrap mx-2">
        <div class="col-12 my-2 shadow-lg ">
          <div class="card rounded rounded-3 ">
            <div class="card-body">
              <h5 class="card-title">Información del usuario</h5>
                <ul id="userInfo" class="list-group">

                </ul>
            </div>
          </div>
        </div>
      </div>
      

    </div>
  </div>
</div>



<?php 
  require "partials/alumnosMain.php";
  require "partials/alumnosGraduados.php";
  require "partials/alumno.php";
  require "partials/modalEditarNotas.php";
  require "partials/modalCambiarSeccionAnio.php";
  require "partials/modalAgregarAlumno.php";
  require "partials/modalPasarAnio.php";
?>

  <?php require "partials/footer.php" ?>

