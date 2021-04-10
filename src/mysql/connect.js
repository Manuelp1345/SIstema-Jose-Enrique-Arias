let mysql = require("mysql");

let connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "notas",
});

connection.connect((err) => {
  if (err) {
    console.error("error al conectar: " + err.stack);
    return;
  }

  console.log("Conectado:" + connection.threadId);
});

module.exports = { connection, mysql };
