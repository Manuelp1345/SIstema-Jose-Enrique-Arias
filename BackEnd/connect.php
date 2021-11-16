<?php 
error_reporting(E_PARSE);
date_default_timezone_set('America/Caracas');

//Nombre de usuario de mysql
const USER = "root";

//Servidor de mysql
 const SERVER = "localhost"; 

//Nombre de la base de datos
const BD = "notas";
//Nombre de la base de datos
const BDR = "notasrespaldo";

//Contraseña de myqsl
const PASS = "";

//Carpeta donde se almacenaran las copias de seguridad
const BACKUP_PATH =  "../respaldos/";

$conn = new mysqli(SERVER,USER,PASS,BD);

/* Comprueba la conexión */
if ($conn->connect_errno) {
    printf('<h1 class="text-center mt-5" >Por favor reincia el sistema</h1> <br>  Error al conectar con la base de datos: %s', $conn->connect_error);
    exit();
}


$connR = new mysqli(SERVER,USER,PASS,BDR);

if ($connR->connect_errno) {
    printf('<h1 class="text-center mt-5" >Por favor reincia el sistema</h1> <br>  Error al conectar con la base de datos: %s', $connR->connect_error);
    exit();
}
/*Configuración de zona horaria de tu país para más información visita
    http://php.net/manual/es/function.date-default-timezone-set.php
    http://php.net/manual/es/timezones.php
*/


class SGBD{
    //Funcion para hacer consultas a la base de datos
    public static function sql($query){
        $con=mysqli_connect(SERVER, USER, PASS, BD);
        mysqli_set_charset($con, "utf8");
        if (mysqli_connect_errno()) {
            printf("Conexion fallida: %s\n", mysqli_connect_error());
            exit();
        }else{
            mysqli_autocommit($con, false);
            mysqli_begin_transaction($con, MYSQLI_TRANS_START_WITH_CONSISTENT_SNAPSHOT);
            if($consul=mysqli_query($con, $query)){
                if (!mysqli_commit($con)) {
                    print("Falló la consignación de la transacción\n");
                    exit();
                }
            }else{
                mysqli_rollback($con);
                echo "Falló la transacción";
                exit();
            }
            return $consul;
        }
    }  

    //Funcion para limpiar variables que contengan inyeccion SQL
    public static function limpiarCadena($valor) {
        $valor=addslashes($valor);
        $valor = str_ireplace("<script>", "", $valor);
        $valor = str_ireplace("</script>", "", $valor);
        $valor = str_ireplace("SELECT * FROM", "", $valor);
        $valor = str_ireplace("DELETE FROM", "", $valor);
        $valor = str_ireplace("UPDATE", "", $valor);
        $valor = str_ireplace("INSERT INTO", "", $valor);
        $valor = str_ireplace("DROP TABLE", "", $valor);
        $valor = str_ireplace("TRUNCATE TABLE", "", $valor);
        $valor = str_ireplace("--", "", $valor);
        $valor = str_ireplace("^", "", $valor);
        $valor = str_ireplace("[", "", $valor);
        $valor = str_ireplace("]", "", $valor);
        $valor = str_ireplace("\\", "", $valor);
        $valor = str_ireplace("=", "", $valor);
        return $valor;
    }
}

?>