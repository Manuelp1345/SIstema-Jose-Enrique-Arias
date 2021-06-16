<?php 
error_reporting(E_ERROR);

$conn = new mysqli("localhost","root","","notas");

/* Comprueba la conexión */
if ($conn->connect_errno) {
    printf('<h1 class="text-center" >Por favor reincia el sistema</h1> <br>  Error al conectar con la base de datos: %s', $conn->connect_error);
    exit();
}


?>