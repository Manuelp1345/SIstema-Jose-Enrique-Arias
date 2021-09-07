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
      <div class="modal-body">
        <form>
          <div class="row g-3 d-flex flex-row align-items-start justify-content-start">
            <div class="form-group col-6">
              <h5>Datos del Alumno</h5>

                <label for="Apellido">Apellido</label>
                <input type="text" class="form-control" id="Apellido" placeholder="Apellido">
                <label for="Nombre">Nombre</label>
                <input type="text" class="form-control" id="Nombre" placeholder="Nombre">
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
                  <input  class="form-control my-2" type="tel" placeholder="País" name="pais" id="pais">
                  <input  class="form-control my-2" type="tel" placeholder="Estado" name="estado" id="estado">
                  <input  class="form-control my-2" type="tel" placeholder="Municipio" name="Municipio" id="Municipio">
                </div>

                <label for="Telfono">Teléfono</label>
                <input  class="form-control" type="tel" placeholder="Telefono" name="Telfono" id="Telfono">

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
              <input type="text" class="form-control" name="ApellidoR" id="ApellidoR" placeholder="Apellido">
              <label for="NombreR">Nombre</label>
              <input type="text" class="form-control" name="NombreR" id="NombreR" placeholder="Nombre">
              <label for="CedulaR">Cédula</label>
              <input type="number" class="form-control" name="CedulaR" id="CedulaR" placeholder="Cedula">
              <select class="form-select my-3" name="SexoR" id="SexoR">
                  <option disabled selected value="s" > Sexo </option>
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
                <div id="areasRp" class="form-check d-none flex-column animate__animated animate__fadeInRight">
                  <h4 class=" mt-2">Selecione las areas repitientes</h4>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m1" >
                    <label class="form-check-label my-2" for="m1">
                      Castellano
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m2" >
                    <label class="form-check-label my-2" for="m2">
                      Ingles y otras lenguas extranjeras
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m3" >
                    <label class="form-check-label my-2" for="m3">
                      Matematicas
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m4" >
                    <label class="form-check-label my-2" for="m4">
                      Educacion Fisica
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m5" >
                    <label class="form-check-label my-2" for="m5">
                      Arte y Patrimonio
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m6" >
                    <label class="form-check-label my-2" for="m6">
                      Fisica
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m7" >
                    <label class="form-check-label my-2" for="m7">
                      Quimica
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m8" >
                    <label class="form-check-label my-2" for="m8">
                      Biologia
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m9" >
                    <label class="form-check-label my-2" for="m9">
                      Ciencias Naturales
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m10" >
                    <label class="form-check-label my-2" for="m10">
                      Geografia, Historia y Ciudadania
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m11" >
                    <label class="form-check-label my-2" for="m11">
                      Formacion para la Soberania Nacional
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m12" >
                    <label class="form-check-label my-2" for="m12">
                      Ciencias de la Tierra
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2" type="checkbox" value="" id="m13" >
                    <label class="form-check-label my-2" for="m13">
                      Orientacion y convivencia
                    </label>
                  </div>
                  <div class="">
                    <input class="form-check-input repitiente my-2"  type="checkbox" value="" id="m14" >
                    <label class="form-check-label my-2" for="m14">
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