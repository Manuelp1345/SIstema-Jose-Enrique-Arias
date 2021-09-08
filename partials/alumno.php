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
            <h4 class="col-3 my-4 mx-0">Condición:</h4>
            <select class="form-select py-1 my-4 mx-0 w-50 col-2" name="State" id="State">
                    <option id="State1" value="cursando">Cursando</option>
                    <option id="State2" value="retirado">Retirado</option>
                    <option id="State3" value="repitiente">Repitiente</option>
                    <option id="State3" value="graduado">Graduado</option>
            </select>
          </div>
        </div>
        <div class="col-12 d-flex flex-row">
          <h4 id="contenedorGp" class="col-6 my-4 mx-0">Grupo Estable: <input disabled type="text" id="gpdb"></input></h4>
        </div>
        <div  id="contenedorRp" class="col-12 d-none flex-row flex-wrap">
        <h4>Areas Repitiente:</h4>

          <div class="col-12 my-4 mx-0 d-flex flex-row flex-wrap">
              <div class="col-4">
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="1" >
                <label class="form-check-label my-2 ms-2 col-12" for="1">
                  Castellano
                </label>
              </div>
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="2" >
                <label class="form-check-label my-2 ms-2 col-12" for="2">
                  Ingles y otras lenguas extranjeras
                </label>
              </div>
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="3" >
                <label class="form-check-label my-2 ms-2 col-12" for="3">
                  Matematicas
                </label>
              </div>
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="4" >
                <label class="form-check-label my-2 ms-2 col-12" for="4">
                  Educacion Fisica
                </label>
              </div>
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="5" >
                <label class="form-check-label my-2 ms-2 col-12" for="5">
                  Arte y Patrimonio
                </label>
              </div>
              </div>
              <div class="col-4">
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="6" >
                <label class="form-check-label my-2 ms-2 col-12" for="6">
                  Fisica
                </label>
              </div>
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="7" >
                <label class="form-check-label my-2 ms-2 col-12" for="7">
                  Quimica
                </label>
              </div>
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="8" >
                <label class="form-check-label my-2 ms-2 col-12" for="8">
                  Biologia
                </label>
              </div>
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="9" >
                <label class="form-check-label my-2 ms-2 col-12" for="9">
                  Ciencias Naturales
                </label>
              </div>
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="10" >
                <label class="form-check-label my-2 ms-2 col-12" for="10">
                  Geografia, Historia y Ciudadania
                </label>
              </div>
              </div>
              <div class="col-4">
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="11" >
                <label class="form-check-label my-2 ms-2 col-12" for="11">
                  Formacion para la Soberania Nacional
                </label>
              </div>
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="12" >
                <label class="form-check-label my-2 ms-2 col-12" for="12">
                  Ciencias de la Tierra
                </label>
              </div>
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2" type="checkbox" value="" id="13" >
                <label class="form-check-label my-2 ms-2 col-12" for="13">
                  Orientacion y convivencia
                </label>
              </div>
              <div class="mx-4 d-flex flex-row">
                <input class="form-check-input px-2 rp my-2"  type="checkbox" value="" id="14" >
                <label class="form-check-label my-2 ms-2 col-12" for="14">
                  Participaón en Grupos de creaón, Recreación y Producción
                </label>
              </div>
              </div>
          </div>
          
        </div>
      </div>
      <br><br>
      <table id="notasexport" class="py-3 my-3 col-12 table alumno">
        <thead class="col-12 table-dark">
          <tr class="thead-dark">
            <th scope="col-4">Áreas</th >
            <th scope="col-2">Primer Momento</th>
            <th scope="col-2">Segundo Momento</th>
            <th scope="col-2">Tercer Momento</th>
            <th scope="col-2">Nota Final</th>
            <th class='ms-3' scope="col">Editar </th>
          </tr>
        </thead>
        <tbody id="notasAlumnos">

        </tbody>
      </table>

  </div>
</div>