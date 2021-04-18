
    .then((e) => e.json())
    .then((data) => {
      console.log(data);

      agregar.innerHTML = "";
      tableExport.innerHTML = "";
      let alumnosDB = JSON.stringify(data);
      let alumnosObject = JSON.parse(alumnosDB);
      alumnosObject = alumnosObject.alumnos;

      for (let i = 0; i < alumnosObject.length; i++) {
        let form2 = {
          año: añoDB,
          notas: alumnosObject[i].notas,
        };

        fetch("/editar/" + token, {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(form2),
        })
          .then((e) => e.json())
          .then((data) => {
            let notasDB = data;

            let notasObject = notasDB.notas;

            let materiasDB = JSON.stringify(data);
            let materiasObject = JSON.parse(materiasDB);
            materiasObject = materiasObject.materias;

            let primer_lapso = 0;

            let segundo_lapso = 0;

            let tercer_lapso = 0;

            let notaFinal = 0;

            notasObject = Object.values(notasObject);

            for (let i = 1; i < materiasObject.length; i++) {
              primer_lapso += parseInt(JSON.parse(notasObject[i]).primer_lapso);
              segundo_lapso += parseInt(
                JSON.parse(notasObject[i]).segundo_lapso
              );
              tercer_lapso += parseInt(JSON.parse(notasObject[i]).tercer_lapso);
            }

            primer_lapso = primer_lapso / parseInt(materiasObject.length - 1);
            segundo_lapso = segundo_lapso / parseInt(materiasObject.length - 1);
            tercer_lapso = tercer_lapso / parseInt(materiasObject.length - 1);

            notaFinal = (primer_lapso + segundo_lapso + tercer_lapso) / 3;

            agregar.innerHTML += `
                            <tr>
                            <th scope="row">${i + 1}</th>
                            <td>${format(alumnosObject[i].cedula)}</td>
                            <td>${alumnosObject[i].nombre.toUpperCase()} </td>
                            <td>${alumnosObject[i].apellido.toUpperCase()}</td>
                            <td>${parseInt(primer_lapso)}</td>
                            <td>${parseInt(segundo_lapso)}</td>
                            <td>${parseInt(tercer_lapso)}</td>
                            <td>${notaFinal.toFixed(1)}</td>
                            <td> 
                            <div class="btn-group">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Modificar
                            </button>
                            <div class="dropdown-menu">
                            <a class="dropdown-item" onclick="editar(${
                              alumnosObject[i].cedula
                            },'${alumnosObject[i].nombre} ${
              alumnosObject[i].apellido
            }',${alumnosObject[i].notas},'${seccion}')" href="#">Editar</a>
                            <a class="dropdown-item" onclick="eliminarAlumno(${
                              alumnosObject[i].cedula
                            })"  href="#">Eliminar</a>
                            </div>
                            </div>
                            </td>
                            </tr>`;
          });
      }
    });