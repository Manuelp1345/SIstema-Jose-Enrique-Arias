<?php 
session_start();
if(!isset($_SESSION["usuario"])){
  header("Location: login.php");
}

require "partials/header.php";


?>

<div id="index" class="container">

<div class="welcome container-Home"> 

  <div class="d-flex justify-content-center align-items-center pb-2">
    <img src="img/logo.png" width="160" alt="">
  </div>
  <div class="card text-center shadow">
    <div class="card-body">
      <h5 class="card-title">HOLA <span id="NameWelcome"></span></h5>
      <p class="card-text">
        Te damos la bienvenida al nuevo Sistema de Notas Automatizado para la U.E. "José Enrique Arias" 
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
              El sistema de notas está hecho con las tecnologías más usadas a nivel mundial para el desarrollo de aplicaciones web
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
              <h5>Estatus del sistema</h5>
              <ul>
                <li>Versión del sistema: V-2.0</li>
                <li>Última actualización: 13/11/2021</li>
                <li>Estudiantes en el sistema: <span id="TotalAlumnos"></span></li>
                <li>Período escolar: <span id="periodoIndex"></span></li>
              </ul>
          </div>
          </div>
        </div>
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

