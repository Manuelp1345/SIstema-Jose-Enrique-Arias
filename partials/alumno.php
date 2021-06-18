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
          <div class=" d-flex flex-row justify-content-between col-12">
            <div class="col-5 d-flex flex-row">
              <h4 class="col-3 my-4 mx-0">Notas de:</h4>
              <select class="form-select py-1 my-4 mx-0  w-50 col-2" name="SelectAÑo" id="SelectAÑo">
                    <option  id="Select1" value="1">Primer Año</option>
                    <option id="Select2" class="d-none" value="2">Segundo Año</option>
                    <option id="Select3" class="d-none" value="3">Tercer Año</option>
                    <option id="Select4" class="d-none" value="4">Cuarto Año</option>
                    <option id="Select5" class="d-none" value="5">Quinto Año</option>
              </select>
            </div>
            <div class="col-5 d-flex flex-row">
              <h4 class="col-3 my-4 mx-0">Estado:</h4>
              <select class="form-select py-1 my-4 mx-0 w-50 col-2" name="State" id="State">
                      <option id="State1" value="1">Cursando</option>
                      <option id="State2" value="2">Retirado</option>
                      <option id="State3" value="3">Graduado</option>
              </select>
            </div>
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
  <th class='ms-3' scope="col">Editar </th>
  </tr>
  </thead>
  <tbody id="notasAlumnos">

  </tbody>
</table>
  </div>
</div>


</div>