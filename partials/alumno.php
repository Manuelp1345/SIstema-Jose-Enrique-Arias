<div class="alumno animate__animated animate__fadeInLeft animate__faster">
  <div class="card p-2">
      <div class="alert alert-danger" role="alert"></div>
      <div class="alert alert-success" role="alert"></div>
      
<div class=" d-flex flex-row justify-content-between">
    <button id="back" class="btn btn-primary mt-4  col-3" >Volver</button>
    <button class="btn btn-dark mt-4  col-3" data-bs-toggle="modal" data-bs-target="#CambiarAñoSeccion" >Cambiar (Sección / año) </button>
    <button class="btn btn-primary mt-4 col-3" onclick="reporte('datosAlumno')" >Datos del alumno</button>
</div>
      
      <div class="mt-4 d-flex flex-row flex-wrap">
          <h4 id="InfoAlumno" class="col-4" ></h4>
          <h4 id="InfoCI" class="col-3" ></h4>
          <h4 id="InfoAnio" class="col-3" ></h4>
          <h4 id="InfoSec" class="col-2" ></h4>
          <div class=" d-flex flex-row">
          <h4 class="col-5 my-3 pt-1">Notas de: </h4>
          <select class="form-select my-3 col-5" name="SelectAÑo" id="SelectAÑo">
                  <option  id="Select1" value="1">Primer Año</option>
                  <option id="Select2" class="d-none" value="2">Segundo Año</option>
                  <option id="Select3" class="d-none" value="3">Tercer Año</option>
                  <option id="Select4" class="d-none" value="4">Cuarto Año</option>
                  <option id="Select5" class="d-none" value="5">Quinto Año</option>
              </select>
          </div>
      </div>

<br><br>

<div class="table-responsive">
  <table id="notasexport" class="display py-3 my-3 col-auto table alumno center">
  <thead class="table-dark">
  <tr class="thead-dark">
  <th scope="col">Áreas</th>
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


</div>