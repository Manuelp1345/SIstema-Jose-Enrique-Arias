<div class="modal fade" id="editarnotas" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <p>Modifique únicamente
 los campos que desea cambiar</p>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
          <div class="form-group">
            <label for="tercer_lapso">Revisión</label>
            <input type="number" max="20" value="0" min="0" class="form-control" id="revision" placeholder="Revision">
          </div>
                <div class="alert alert-danger" role="alert"></div>
                <div class="alert alert-success" role="alert"></div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"  data-bs-dismiss="modal">Cerrar</button>
        <button id="btnAgragar" onclick="enviarNotas()" data-bs-dismiss="modal" type="submit" class="btn btn-primary">Agregar</button>
      </div>
    </div>
  </div>
</div>