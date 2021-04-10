const express = require('express');
const jwt = require("jsonwebtoken");
const bcrypt = require('bcrypt');
const { connection } = require("../mysql/connect")
const app = express()

app.get("/login", (req, res) => {
    res.render("login.hbs")
})

app.post("/login", (req, res) => {
    let data = req.body
    connection.query(`SELECT * FROM usuarios WHERE email = "${data.email}"`, (err, re, fields) => {
        if (err) throw err

        if (!re[0]) {
            return res.status(400).json({
                ok: false,
                mensaje: "El usuario no existe"
            })
        }

        if (!data.email === re[0].email) {
            return res.status(400).json({
                ok: false,
                mensaje: "Correo y/o Contraseña incorrectos"
            })
        }
        if (!bcrypt.compareSync(data.password, re[0].password)) {
            return res.status(400).json({
                mensaje: "Correo y/o Contraseña incorrectos"
            })
        }

        let usuario = {
            nombre: re[0].nombre,
            apellido: re[0].apellido,
            email: re[0].email,
            role: re[0].role
        }

        let token = jwt.sign(usuario, "secret", { expiresIn: 60 * 60 * 24 * 30 })

        res.status(200).json({
            ok: true,
            usuario,
            token
        })

    })

})
module.exports = app