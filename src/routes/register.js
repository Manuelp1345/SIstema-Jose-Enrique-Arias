const express = require('express');
const { connection } = require("../mysql/connect")
const bcrypt = require('bcrypt');
const app = express()


app.get("/register", (req, res) => {
    res.render("register.hbs")
})

app.post("/register", (req, res) => {
    let data = req.body

    connection.query(`SELECT email FROM usuarios WHERE email = "${data.email}"`, (err, re, fields) => {
        if (err) throw err
        if (!re[0]) {
            connection.query(`INSERT INTO usuarios (nombre,apellido,email,password,role) VALUES
                ("${data.nombre}","${data.apellido}","${data.email}","${bcrypt.hashSync(data.password, 10 )}","ROLE_USER")`, (error, results, fields) => {
                if (error) throw error

                res.status(200).json({
                    ok: true,
                    mensaje: "Usuario creado con exito"
                })
            })
        } else {
            return res.status(401).json({
                ok: false,
                mensaje: "el correo ya esta registrado"
            })
        }

    })
})
module.exports = app