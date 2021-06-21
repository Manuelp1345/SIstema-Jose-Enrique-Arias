<?php require "partials/header.php";

require "BackEnd/actions.php"

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

<div class="row">
    <div class="col-12 d-flex flex-row justify-content-center align-items-center">
      <div class="col-6 d-flex flex-column flex-wrap">
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
    <div class="light col-6 d-flex justify-content-center align-items-center rounded-3">
            <div class="calendar">
          <div class="calendar-header">
            <span class="month-picker" id="month-picker">February</span>
            <div class="year-picker">
              <span class="year-change" id="prev-year">
                <pre><</pre>
              </span>
              <span id="year">2021</span>
              <span class="year-change" id="next-year">
                <pre>></pre>
              </span>
            </div>
          </div>
          <div class="calendar-body">
            <div class="calendar-week-day">
              <div>Dom</div>
              <div>Lun</div>
              <div>Mar</div>
              <div>Mié</div>
              <div>Jue</div>
              <div>Vie</div>
              <div>Sab</div>
            </div>
            <div class="calendar-days"></div>
          </div>
          <div class="month-list"></div>
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


  <script src="js/sweetalert2.all.min.js"></script>



  <?php require "partials/footer.php" ?>

