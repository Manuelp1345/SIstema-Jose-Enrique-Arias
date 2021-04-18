<?php 
require_once "connect.php";


if(isset($_POST["actions"])){

    $action = $_POST["actions"];

    switch ($action) {
        case 'Buscar Alumnos':

                // buscamos todos los alumnos correspondientes al año y seccion
            try {
                $ano = $_POST["año"];
                $seccion = $_POST["seccion"];
                $sql = "SELECT * FROM alumnos  WHERE ano='$ano' AND seccion='$seccion' ORDER BY cedula ASC ";
                $resultado = $conn->query($sql)->fetch_all();
                
                echo json_encode($resultado);


            } catch (Exception $e) {
                echo $e->getMessage();
            }
            break; 

        case "Editar":

                //listamos las notas y materias correspondientes 

                try {
                    $año = $_POST["año"];
                    $notasClient = $_POST["notas"];
                    $notas = 0;

                    $sql = "SELECT * FROM notas WHERE id = '$notasClient'";
                    $resultado = $conn->query($sql);
                    $fields = $resultado->fetch_fields();
                    $idNotas = $resultado->fetch_assoc();

                    if ($fields[1]->name == $año) $notas = $idNotas["primer_año"];
                    if ($fields[2]->name == $año) $notas = $idNotas["segundo_año"];
                    if ($fields[3]->name == $año) $notas = $idNotas["tercer_año"];
                    if ($fields[4]->name == $año) $notas = $idNotas["cuarto_año"];
                    if ($fields[5]->name == $año) $notas = $idNotas["quinto_año"];

                    $sql = "SELECT * FROM $año WHERE id = '$notas' ";
                    $resultado = $conn->query($sql)->fetch_assoc();

                    echo json_encode($resultado);

                } catch (Exception $e) {
                    echo $e->getMessage();
                }
            break;

        
        case "Alumno":
            try {

                //validamos que el numero de cedula no se encuentra en la base de datos
                $año = $_POST["año"];
                $cedula = $_POST["cedula"];
                $sql = "SELECT cedula FROM alumnos WHERE cedula = '$cedula'";
                $resultado = $conn->query($sql)->fetch_assoc();
                
                if($resultado === null){
                    
                    //iniciamos las tablas de notas correspondientes al año

                    $sql = "INSERT INTO $año (`id`) VALUES (NULL)";
                    $resultado = $conn->query($sql);
                    $id = mysqli_insert_id($conn);
                    
                    $sql = "INSERT INTO `notas` (`id`, `$año`) VALUES (NULL, $id)";
                    
                    //insetamos el id guia de las notas correspondientes al año

                    $resultado= $conn->query($sql);
                    $id = mysqli_insert_id($conn);

                    //ingresamos los datos del representante

                    $cedulaR = $_POST["cedulaR"];
                    $nombreR = $_POST["nombreR"];
                    $apellidoR = $_POST["apellidoR"];
                    $sexoR = $_POST["sexoR"];
                    $Filiacion = $_POST["Filiacion"];
                    $DireccionR = $_POST["DireccionR"];
                    $TelfonoR = $_POST["TelfonoR"];
                    $CorreoR = $_POST["CorreoR"];

                    $sql = "INSERT INTO representante (cedula,nombre,apellido,sexo,filiacion,direccion,telefono,correo) VALUES ('$cedulaR','$nombreR','$apellidoR','$sexoR','$Filiacion','$DireccionR',$TelfonoR,'$CorreoR')";
                    $resultado = $conn->query($sql);
                    $idr = mysqli_insert_id($conn);

                    //insertamos el alumno con los datos correspondiente  (datos ingresador por el usuario y
                    // referencia a las tablas de notas y representante)

                    $cedula = $_POST["cedula"];
                    $cedulaE = $_POST["cedulaE"];
                    $nombre = $_POST["nombre"];
                    $apellido = $_POST["apellido"];
                    $sexo = $_POST["sexo"];
                    $Fnacimiento = $_POST["Fnacimiento"];
                    $edad = $_POST["edad"];
                    $LugarNacimiento = $_POST["LugarNacimiento"];
                    $Direccion = $_POST["Direccion"];
                    $Telfono = $_POST["Telfono"];
                    $Correo = $_POST["Correo"];
                    $seccion = $_POST["seccion"];


                    $sql = "INSERT INTO alumnos (cedula,cedula_escolar,nombre,apellido,sexo,fecha_de_nacimiento,edad,lugar_de_nacimiento,telefono,direccion,correo,ano,seccion,notas,Representate) VALUES
                    ($cedula,'$cedulaE','$nombre','$apellido','$sexo','$Fnacimiento',$edad,'$LugarNacimiento',$Telfono,'$Direccion','$Correo','$año','$seccion',$id,$idr)";
                    $resultado = $conn->query($sql);

                    if($resultado) echo "Alumno agregado con exito";
                    if(!$resultado) echo "No se pudo agregar el alumno, verifique que todos los campos esten llenos";

                }
                else{
                    echo "El Numero de cedula ya esta en el sistema";
                }


            } catch (Exception $e) {
                echo $e->getMessage();
            }
            break;

            case "mofificar Notas":
                try {
                    //actulizamos las notas de una materia en espesifico

                    $año = $_POST["año"];
                    $materia = $_POST["materia"];
                    $datos = $_POST["datos"];
                    $nota = $_POST["nota"];


                    $sql = "UPDATE $año SET $materia = '$datos' WHERE id = '$nota'";
                    $resultado = $conn->query($sql);
    
                    
                    echo json_encode($resultado);
    
    
                } catch (Exception $e) {
                    echo $e->getMessage();
                }
                break;
        default:
            echo "por favor incie sesion o recargue la pagina";
            break;
    }
    
}

?>