<?php 
$Host = "localhost";
$Usuario= "root" ;
$Contraseña = "";
$base_de_datos = "notas";

$conn = new mysqli($Host,$Usuario,$Contraseña,$base_de_datos);

/* Comprueba la conexión */
if ($conn->connect_errno) {
    printf('<h1 class="text-center mt-5" >Por favor reincia el sistema</h1> <br>  Error al conectar con la base de datos: %s', $conn->connect_error);
    exit();
}


?>