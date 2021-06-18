<?php require "partials/header.php";

require "BackEnd/actions.php"

?>

<div id="index" class="container">


<div class="welcome"> 
  <div class="card text-center">
    <div class="card-body">
      <h5 class="card-title">Hola <span></span></h5>
      <p class="card-text">
        Te damos la bienvenida al nuevo sistema de notas automatizado para la unidad educativa José Enrique Arias 
      </p>
  </div>
</div><br>

<div class="row">
    <div class="col-sm-6">
      <div class="card">
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
    <div class="col-sm-6">
      <div class="card">
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
</div>


<?php 
  require "partials/alumnosMain.php";
  require "partials/alumno.php";
  require "partials/modalEditarNotas.php";
  require "partials/modalCambiarSeccionAnio.php";
  require "partials/modalAgregarAlumno.php";
  require "partials/modalPasarAnio.php";
  ?>


  <script src="js/sweetalert2.all.min.js"></script>



  <?php require "partials/footer.php" ?>

