<div class="modal fade" id="agregarAlumno" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
          <div class=" d-flex flex-row justify-content-between">
            <h5 class="modal-title" id="exampleModalLabel">Agregar Alumno</h5>
            <button id="clean" onclick="clean()" type="button" class="btn btn-secondary ms-4" >Limpiar</button>
          </div>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div id="modalalumno" class="modal-body">
        <form>
          <div class="row g-3 d-flex flex-row align-items-start justify-content-start">
            <div class="form-group col-6">
              <h5>Datos del Alumno</h5>

                <label for="Apellido">Apellido</label>
                <input type="text" class="form-control" id="Apellido" placeholder="Apellido" onkeypress="return validar(event)">
                <label for="Nombre">Nombre</label>
                <input type="text" class="form-control" id="Nombre" placeholder="Nombre" pattern="[A-Z]" title="Nombre del estudiante" onkeypress="return validar(event)">
                <label for="Cedula">Cédula</label>
                <input type="number" class="form-control" id="Cedula" placeholder="Cedula">
                <div class=" p-3">
                  <input class=" form-check-input" type="radio" name="dni" id="dni">
                  <label class=" form-check-label" for="dni">Cédula </label>
                  <input class=" form-check-input ms-2" type="radio" name="dni" id="cedulaEscolar">
                  <label class=" form-check-label" for="cedulaEscolar">Cédula Escolar </label>
                  <input class=" form-check-input ms-2" type="radio" name="dni" id="pasaporte">
                  <label class=" form-check-label" for="pasaporte">Pasaporte</label>
                </div>
                <select class="form-select mb-2" aria-label="Default select example" name="Sexo" id="Sexo">
                    <option disabled selected value="s" > Sexo </option>
                    <option value="Masculino">Masculino</option>
                    <option value="Femenino">Femenino</option>
                </select>

                <label for="fechaNacimiento">Fecha de Nacimiento</label>
                <input  class="form-control" type="date" name="fechaNacimiento" id="fechaNacimiento">

                <label for="Edad">Edad</label>
                <input  class="form-control" disabled type="number" placeholder="Edad" name="Edad" id="Edad">

                <label for="LugarNacimiento">Lugar de Nacimineto</label>
                <div class=" form-group">
                  <input  class="form-control my-2" type="text" placeholder="País" name="pais" id="pais" onkeypress="return validar(event)">
                  <input  class="form-control my-2" type="text" placeholder="Estado" name="estado" id="estado" onkeypress="return validar(event)">
                  <input  class="form-control my-2" type="text" placeholder="Municipio" name="Municipio" id="Municipio" onkeypress="return validar(event)">
                </div>

                <label for="Telfono">Teléfono</label>
                <input  class="form-control" type="number" placeholder="Telefono" name="Telfono" id="Telfono">

                <label for="Direccion">Dirección</label>
                <input  class="form-control" type="text" placeholder="Direccion" name="Direccion" id="Direccion">
                
                <label for="Correo">Correo</label>
                <input  class="form-control" type="email" placeholder="Correo" name="Correo" id="Correo">
                <label for="gp">Grupo Estable</label>
                <input  class="form-control" type="text" placeholder="Grupo Estable" name="gp" id="gp">
                <select class="form-select my-3" name="Condicion" id="Condicion">
                    <option disabled selected value="c" > Condición </option>
                    <option value="cursando">Regular</option>
                    <option value="repitiente">Repitiente</option>
                </select>
              </div>


            <div class="form-group col-6">
            <h5>Datos del Representante</h5>
              <label for="ApellidoR">Apellido</label>
              <input type="text" class="form-control" name="ApellidoR" id="ApellidoR" placeholder="Apellido" onkeypress="return validar(event)">
              <label for="NombreR">Nombre</label>
              <input type="text" class="form-control" name="NombreR" id="NombreR" placeholder="Nombre" onkeypress="return validar(event)">
              <label for="CedulaR">Cédula</label>
              <input type="number" class="form-control" name="CedulaR" id="CedulaR" placeholder="Cedula">
              <select class="form-select my-3" name="SexoR" id="SexoR">
                  <option disabled selected value="s" > Sexo </option>
                  <option value="Masculino">Masculino</option>
                  <option value="Femenino">Femenino</option>
              </select>

              <label for="Filiacion">Filiación</label>
              <input  class="form-control" type="text" placeholder="Filiacion" name="Filiacion" id="Filiacion" onkeypress="return validar(event)">

              <label for="TelfonoR">Teléfono </label>
              <input  class="form-control" type="tel" placeholder="Telefono" name="TelfonoR" id="TelfonoR">

              <label for="DireccionR">Dirección</label>
              <input  class="form-control" type="text" placeholder="Direccion" name="DireccionR" id="DireccionR">
              
              <label for="CorreoR">Correo</label>
              <input  class="form-control" type="email" placeholder="Correo" name="CorreoR" id="CorreoR">
                <div id="areasRp" class="form-check d-none flex-column animate__animated animate__fadeInRight">
                  <h4 class=" mt-2">Selecione las areas repitientes</h4>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="1" >
                    <label class="form-check-label my-2" >
                      Castellano
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="2" >
                    <label class="form-check-label my-2" >
                      Ingles y otras lenguas extranjeras
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="3" >
                    <label class="form-check-label my-2" >
                      Matematicas
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="4" >
                    <label class="form-check-label my-2" >
                      Educacion Fisica
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="5" >
                    <label class="form-check-label my-2" >
                      Arte y Patrimonio
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="6" >
                    <label class="form-check-label my-2" >
                      Fisica
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="7" >
                    <label class="form-check-label my-2" >
                      Quimica
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="8" >
                    <label class="form-check-label my-2" >
                      Biologia
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="9" >
                    <label class="form-check-label my-2" >
                      Ciencias Naturales
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="10" >
                    <label class="form-check-label my-2" >
                      Geografia, Historia y Ciudadania
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="11" >
                    <label class="form-check-label my-2" >
                      Formacion para la Soberania Nacional
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="12" >
                    <label class="form-check-label my-2" >
                      Ciencias de la Tierra
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="13" >
                    <label class="form-check-label my-2" >
                      Orientacion y convivencia
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2"  type="checkbox" value="" id="14" >
                    <label class="form-check-label my-2" for="14">
                      Participaón en Grupos de creaón, Recreación y Producción
                    </label>
                  </div>


                </div>
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

<script>
  function validar(e) { // 1
tecla = (document.all) ? e.keyCode : e.which; // 2
if (tecla==8) return true; // 3
patron =/[A-Za-z\s]/; // 4
te = String.fromCharCode(tecla); // 5
return patron.test(te); // 6
}
</script>