const jwt = require("jsonwebtoken");

let verificaToken = (req, res, next) => {

    let token = req.params.id

    jwt.verify(token, "secret", (err, decoded) => {

        if (err) {
            return res.status(401).redirect("/login")
        }

        req.usuario = decoded.usuario
        next()
    })

}


module.exports = { verificaToken }