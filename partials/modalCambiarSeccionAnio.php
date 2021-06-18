<div class="modal fade" id="CambiarAñoSeccion" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modificar Sección o Año</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form>
          <div class="form-group">
          <select class="form-select my-3" name="AñoChange" id="AñoChange">
                  <option selected > Año </option>
                  <option value="1">Primer Año</option>
                  <option value="2">Segundo Año</option>
                  <option value="3">Tercer Año</option>
                  <option value="4">Cuarto Año</option>
                  <option value="5">Quinto Año</option>
              </select>
          </div>
          <div class="form-group">
          <select class="form-select my-3" name="seccionChange" id="seccionChange">
                  <option selected > Sección </option>
                  <option value="A">A</option>
                  <option value="B">B</option>
                  <option value="C">C</option>
                  <option value="D">D</option>
                  <option value="F">F</option>
              </select>
          </div>
                <div class="alert alert-danger" role="alert"></div>
                <div class="alert alert-success" role="alert"></div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <button type="button" onclick="ModificarSeccionAño()" class="btn btn-primary">Guadar cambios</button>
      </div>
    </div>
  </div>
</div>