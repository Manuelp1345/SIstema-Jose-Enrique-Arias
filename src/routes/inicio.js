const express = require('express');
const { verificaToken, verificaToken2 } = require("../middlewares/token");
const app = express()

app.get("/", (req, res) => {
    res.redirect("/inicio")
})



app.get("/inicio/:id", verificaToken, (req, res) => {

    res.render("index.hbs")

})

app.get("/inicio/", (req, res) => {
    res.redirect("/login")
})



module.exports = app