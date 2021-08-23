<div id="AlumnosMain" class="menu animate__animated animate__fadeInLeft animate__faster">
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
        <button class="btn btn-success" onclick="reporte('notas')" >Reporte Grupal (Notas)</button>
      </li>
      <li class="nav-item">
        <button class="btn btn-success" onclick="reporte('datos')" >Reporte Grupal (Datos)</button>
      </li>
      <li class="nav-item">
        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#eliminarTodos" >Pasar Año</button>
      </li>
    </ul>
    <div class=" d-flex justify-content-center align-items-center flex-row">
      <table id="TablaMain"  class="table alumnos center">
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
  </div>
</div>