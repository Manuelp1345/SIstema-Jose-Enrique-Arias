const express = require('express')
const app = express()


app.use(require("./inicio"))
app.use(require("./login"))
app.use(require("./register"))
app.use(require("./almnos"))










module.exports = app