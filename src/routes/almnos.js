const express = require('express');
const { verificaToken } = require("../middlewares/token")
const { connection } = require("../mysql/connect")
const app = express()



app.post("/alumno/:id", verificaToken, (req, res) => {
    let data = req.body

    console.log(data);

    connection.query(`SELECT cedula FROM alumnos WHERE cedula = "${data.cedula}"`, (err, re, fields) => {
        if (err) throw err
        if (!re[0]) {
            connection.query("INSERT INTO `" + data.año + "` (`id`) VALUES (NULL)", (err, re, fields) => {
                if (err) throw err

                let id = re.insertId
                let query = ""

                if (data.año == "primer_año") query = "INSERT INTO `notas` (`id`, `primer_año`) VALUES (NULL, " + id + ")"
                if (data.año == "segundo_año") query = "INSERT INTO `notas` (`id`, `segundo_año`) VALUES (NULL, " + id + ")"
                if (data.año == "tercer_año") query = "INSERT INTO `notas` (`id`,  `tercer_año`) VALUES (NULL, " + id + ")"
                if (data.año == "cuarto_año") query = "INSERT INTO `notas` (`id`, `cuarto_año`) VALUES (NULL, " + id + ")"
                if (data.año == "quinto_año") query = "INSERT INTO `notas` (`id`, `quinto_año`) VALUES (NULL, " + id + ")"



                connection.query(query, (err, re, fields) => {
                    if (err) throw err
                    let id = re.insertId
                    connection.query(`INSERT INTO alumnos (cedula,nombre,apellido,ano,seccion,notas) VALUES
                    ("${data.cedula}","${data.nombre}","${data.apellido}","${data.año}","${data.seccion}",${id})`, (error, results, fields) => {
                        if (error) throw error

                        res.status(200).json({
                            ok: true,
                            mensaje: "Alumno agregado con exito"
                        })
                    })
                })
            })

        } else {
            return res.status(401).json({
                ok: false,
                mensaje: "El alumno ya se encuentra en el sistema"
            })
        }

    })

})
app.post("/alumnos/:id", verificaToken, (req, res) => {

    let data = req.body

    connection.query(`SELECT * FROM alumnos WHERE ano = "${data.año}" AND seccion="${data.seccion}"`, (err, re, fields) => {
        if (err) throw err
        let alumnos = re



        res.status(200).json({
            alumnos
        })
    })

})

app.put("/editar/:id", verificaToken, (req, res) => {

    let data = req.body
    let año = req.body.año
    let notas = 0

    connection.query(`SELECT * FROM notas WHERE id = "${data.notas}"`, (err, re, fields) => {
        if (err) throw err

        if (fields[1].name == año) notas = re[0].primer_año
        if (fields[2].name == año) notas = re[0].segundo_año
        if (fields[3].name == año) notas = re[0].tercer_año
        if (fields[4].name == año) notas = re[0].cuarto_año
        if (fields[5].name == año) notas = re[0].quinto_año

        connection.query(`SELECT * FROM ${año} WHERE id = "${notas}"`, (err, re, fields) => {
            if (err) throw err
            res.status(200).json({
                materias: fields,
                notas: re[0]
            })
        })




    })

})

app.put("/notas/:id", verificaToken, (req, res) => {

    let data = req.body
    let año = req.body.año

    console.log(data);

    connection.query(`UPDATE ${año} SET ${data.materia} = '${data.datos}' WHERE id = "${data.nota}"`, (err, re, fields) => {
        if (err) throw err

        res.status(200).json({
            ok: true,
            mensaje: "Notas Actualizadas"
        })

    })

})

app.delete("/eliminarTodos/:id", verificaToken, (req, res) => {
    let data = req.body
    connection.query(`DELETE FROM alumnos WHERE ano = "${data.año}" AND seccion="${data.seccion} "`, (err, re, fields) => {
        if (err) throw err

        res.status(200).json({
            ok: true,
            mensaje: "Alumnos borrados con exito"
        })
    })

})

app.delete("/eliminar/:id", verificaToken, (req, res) => {
    let data = req.body

    connection.query(`DELETE FROM alumnos WHERE cedula = "${data.cedula}"`, (err, re, fields) => {
        if (err) throw err

        res.status(200).json({
            ok: true,
            mensaje: "Alumno borrados con exito"
        })
    })

})




module.exports = app