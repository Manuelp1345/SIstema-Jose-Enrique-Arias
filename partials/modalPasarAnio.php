<div class="modal fade" id="eliminarTodos" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Pasar Sección de año</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <h4>Esta opción pasará a todos los alumnos que estén aprobados al siguiente año.
 <br><br> Los alumnos con dos o más materias reprobadas se quedarán en el año actual.
 <br><br>Los alumnos que tengan materias pendientes del año anterior no podrán pasar de año. </h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"  data-bs-dismiss="modal">Cerrar</button>
        <button  data-bs-dismiss="modal" type="button" onclick="PasarSeccion()" class="btn btn-warning">Confirmar</button>
      </div>
    </div>
  </div>