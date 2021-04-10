const express = require("express")
const hbs = require("hbs")

const bodyParser = require('body-parser')
const port = process.env.PORT || 3000


const app = express()

app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.use(express.static(__dirname + "/public"))
hbs.registerPartials(__dirname + '/views/partials');

app.set('view engine', 'hbs');



app.use(require("./src/routes/index"))


app.listen(port, () => {
    console.log("Servidor en el puerto " + port);
})

module.exports = app