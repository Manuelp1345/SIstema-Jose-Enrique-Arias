<div class="modal fade" id="agregarAlumno" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Agregar Alumno</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
              <label for="Cedula">Cédula</label>
              <input type="number" class="form-control" id="Cedula" placeholder="Cedula">
              <div class=" p-3">
                <input class=" form-check-input" type="checkbox" name="cedulaEscolar" id="cedulaEscolar">
                <label class=" form-check-label" for="cedulaEscolar">Cédula Escolar </label>
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

              <label for="Telfono">Teléfono</label>
              <input  class="form-control" type="tel" placeholder="Telefono" name="Telfono" id="Telfono">

              <label for="Direccion">Dirección</label>
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
              <label for="CedulaR">Cédula</label>
              <input type="number" class="form-control" name="CedulaR" id="CedulaR" placeholder="Cedula">
              <select class="form-select my-3" name="SexoR" id="SexoR">
                  <option selected > Sexo </option>
                  <option value="Masculino">Masculino</option>
                  <option value="Femenino">Femenino</option>
              </select>

              <label for="Filiacion">Filiación</label>
              <input  class="form-control" type="text" placeholder="Filiacion" name="Filiacion" id="Filiacion">

              <label for="TelfonoR">Teléfono </label>
              <input  class="form-control" type="tel" placeholder="Telefono" name="TelfonoR" id="TelfonoR">

              <label for="DireccionR">Dirección</label>
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