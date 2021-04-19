<?php require "partials/header.php";

require "BackEnd/actions.php"

?>

<div id="index" class="container">


<div class="welcome"> 
  <div class="card text-center">
    <div class="card-body">
      <h5 class="card-title">Hola <span></span></h5>
      <p class="card-text">
        Te damos la bienvenida al nuevo sistema de notas automatizado para la unidad educativa
          Jose Enrique Arias 
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
          <h5 class="card-title">Acerca Del Sistema</h5>
          <p class="card-text">
            El sistema de notas esta hecho en una de las tecnologias mas usadas a nivel mundial 
            para el desarrolo de aplicaciones web

            </p>
          <a href="#" class="btn btn-primary">Leer Mas</a>

        </div>
      </div>
    </div>
  </div>
</div>


  <div class="menu">
      <div class="card text-center">
      <div class="card-body">
        <h5 class="card-title"></h5>
      </div>
        <div class="alert alert-danger" role="alert"></div>
        <div class="alert alert-success" role="alert"></div>
    <ul class="nav nav-pills nav-justified">
      <li class="nav-item">
        <button class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#agregarAlumno">Agregar Alumno</button>
      </li>
      <li class="nav-item">
        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#eliminarTodos" >Pasar Año</button>
      </li>
    </ul>

  <div class=" d-flex justify-content-center align-items-center flex-row">
    
    <table class="table alumnos center">
  <thead class="table-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">C.I</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Primer Momento</th>
      <th scope="col">Segundo Momento</th>
      <th scope="col">Tercer Momento</th>
      <th scope="col">Nota Final</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>

  </tbody>
</table>
  </div>

  <div class=" d-flex justify-content-center align-items-center flex-row">
    
    <table class="table alumnos center">
  <thead class="table-dark">
    <tr>
      <th scope="col">C.I</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Primer Momento</th>
      <th scope="col">Segundo Momento</th>
      <th scope="col">Tercer Momento</th>
      <th scope="col">Nota Final</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody id="tablaExoport">

  </tbody>
</table>
  </div>

  </div>


</div>

<div class="alumno">
  <div class="card">
      <div class="alert alert-danger" role="alert"></div>
      <div class="alert alert-success" role="alert"></div>

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

<br><br>

<div class="table-responsive">
  <table id="notasexport" class="display py-3 my-3 col-auto table alumno center">
  <thead class="table-dark">
  <tr class="thead-dark">
  <th scope="col">Areas</th>
  <th scope="col">Primer Momento</th>
  <th scope="col">Segundo Momento</th>
  <th scope="col">Tercer Momento</th>
  <th scope="col">Nota Final</th>
  <th scope="col"> </th>
  <th scope="col"> </th>
  <th scope="col"> </th>
  <th scope="col">Editar </th>
  </tr>
  </thead>
  <tbody id="notasAlumnos">

  </tbody>
</table>
  </div>
</div>




<div class="modal fade" id="editarnotas" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <p>Modifique unicamente los campos que desea cambiar</p>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="primer_lapso">Primer Momento</label>
            <input type="number" max="20" value="0" min="0" class="form-control" id="primer_lapso" placeholder="primer_lapso">
          </div>
          <div class="form-group">
            <label for="segundo_lapso">Segundo Momento</label>
            <input type="number" max="20" value="0" min="0" class="form-control" id="segundo_lapso" placeholder="segundo_lapso">
          </div>
          <div class="form-group">
            <label for="tercer_lapso">Tercer Momento</label>
            <input type="number" max="20" value="0" min="0" class="form-control" id="tercer_lapso" placeholder="tercer_lapso">
          </div>
                <div class="alert alert-danger" role="alert"></div>
                <div class="alert alert-success" role="alert"></div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button id="btnAgragar" onclick="enviarNotas()" type="submit" class="btn btn-primary">Agregar</button>
      </div>
    </div>
  </div>
</div>
</div>

<div class="modal fade" id="agregarAlumno" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Agregar Alumno</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
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
                  <option value="1">Masculino</option>
                  <option value="2">Femenino</option>
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
        <button id="modal" onclick="alumno()" type="submit" class="btn btn-primary">Agregar</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="eliminarTodos" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Pasar Seccion de año</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <h4>Esta opcion Pasara a todos los alumnos al siguiente año </h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button data-dismiss="modal" type="button" onclick="PasarSeccion()" class="btn btn-warning">Confirmar</button>
      </div>
    </div>
  </div>




  <?php require "partials/footer.php" ?>

