<?php 
session_start();


require_once "connect.php";

if(isset($_POST["actions"])){

    $action = $_POST["actions"];

    switch ($action) {
        case 'Buscar Alumnos':

                // buscamos todos los alumnos correspondientes al año y seccion
            try {
                $ano = $_POST["año"];
                $seccion = $_POST["seccion"];
                $sql = "SELECT * FROM alumnos  WHERE ano='$ano' AND seccion='$seccion' AND estado='cursando' OR estado='Repitiente' ORDER BY cedula ASC ";
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
                    $resultado = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);

                    if(empty($resultado)){
                        echo "Error";

                    }else{

                        echo json_encode($resultado);
                    }


                } catch (Exception $e) {
                    echo $e->getMessage();
                }
            break;

        case "Alumno":
            try {
                $userId = $_POST["userId"];
                $sql = "SELECT * FROM usuarios WHERE id='$userId'";
                $resultado = $conn->query($sql)->fetch_assoc();
                $user = $resultado;
                $fecha = $_POST["dateTime"];



                if("admin" == $resultado["role"]){

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
                    
                    //incertamos el id guia de las notas correspondientes al año

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
                    $estado = $_POST["estado"];
                    $GrupoEstable = $_POST["gp"];

                    $sql = "INSERT INTO alumnos (cedula,cedula_escolar,nombre,apellido,sexo,fecha_de_nacimiento,edad,lugar_de_nacimiento,telefono,direccion,correo,ano,seccion,notas,estado,Representate,grupo_estable) VALUES
                    ($cedula,'$cedulaE','$nombre','$apellido','$sexo','$Fnacimiento',$edad,'$LugarNacimiento',$Telfono,'$Direccion','$Correo','$año','$seccion',$id,'$estado',$idr,'$GrupoEstable')";
                    $resultado = $conn->query($sql);

                    if(!$resultado) echo "No se pudo agregar el alumno, verifique que todos los campos esten llenos";
                    if($resultado){
                        echo "Alumno agregado con exito";
                        $correoUser = $user['email'];
                        $data = "El usuario $correoUser Ingreso al estudiante con la cedula $cedula en $año Seccion $seccion";
                        $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                        $resultado = $conn->query($sql);
                    };

                }
                else{
                    echo "El Numero de cedula ya esta en el sistema";
                }
            }

            } catch (Exception $e) {
                echo $e->getMessage();
            }
            break;

            case "mofificar Notas":
                try {
                    //actulizamos las notas de una materia en espesifico
                    $userId = $_POST["userId"];
                    $sql = "SELECT * FROM usuarios WHERE id='$userId'";
                    $resultado = $conn->query($sql)->fetch_assoc();
                    $user = $resultado;
                    $fecha = $_POST["dateTime"];


                    if("admin" == $resultado["role"]){

                    $año = $_POST["año"];
                    $materia = $_POST["materia"];
                    $datos = $_POST["datos"];
                    $nota = $_POST["nota"];

                    $sql = "UPDATE $año SET $materia = '$datos' WHERE id = '$nota'";
                    $resultado = $conn->query($sql);
    
                    echo json_encode($resultado);

                    $correoUser = $user['email'];
                    $cedula = $_POST["cedula"];
                    $np = json_decode($datos);
                    $data = "El usuario $correoUser Modifico y/o ingreso notas de $materia (Primer lapso: $np->primer_lapso, Segundo lapso: $np->segundo_lapso, Tercer lapso: $np->tercer_lapso) del alumno con el numero de cedula: $cedula";
                    $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                    $resultado = $conn->query($sql);
                }
    
    
                } catch (Exception $e) {
                    echo $e->getMessage();
                }
                break;
            case "Pasar Seccion":
                try {
                    //Pasar alumnos al siguiente año 
                    $userId = $_POST["userId"];
                    $sql = "SELECT * FROM usuarios WHERE id='$userId'";
                    $resultado = $conn->query($sql)->fetch_assoc();
                    $user = $resultado;
                    $fecha = $_POST["dateTime"];

                    if("admin" == $resultado["role"]){

                    $año = $_POST["año"];
                    $seccion = $_POST["seccion"];
                    $consulta = false;

                    $SiguienteAño = "";

                    $AnteriorAño = "";

                    if($año == "primer_año" ) $SiguienteAño = "segundo_año";
                    if($año == "segundo_año" ) $SiguienteAño = "tercer_año";
                    if($año == "tercer_año" ) $SiguienteAño = "cuarto_año";
                    if($año == "cuarto_año" ) $SiguienteAño = "quinto_año";
                    if($año == "quinto_año" ) $SiguienteAño = "Graduado";

                    if($año == "segundo_año" ) $AnteriorAño = "primer_año";
                    if($año == "tercer_año" ) $AnteriorAño = "segundo_año";
                    if($año == "cuarto_año" ) $AnteriorAño = "tercer_año";
                    if($año == "quinto_año" ) $AnteriorAño = "cuarto_año";


                    $sql = "SELECT * FROM alumnos WHERE ano = '$año' AND seccion='$seccion'";
                    $resultado = $conn->query($sql)->fetch_all();

                    
                    foreach ($resultado as $key => $value) {
                        $rp = 0;
                        $rpa= 0;
                        $cedula = $value[1];
                        $notas = $value[14];
                        $estado = $value[15];

                            if($AnteriorAño != ""){

                                $sql = "SELECT * FROM notas WHERE id = '$notas' ";
                                $resultado = $conn->query($sql)->fetch_object();
                                $id = $resultado->$AnteriorAño;
    
                                $sql = "SELECT * FROM $AnteriorAño WHERE id = '$id' ";
                                $resultado = $conn->query($sql)->fetch_all();
    
                                foreach ($resultado as $key => $value) {
                                        for ($i=1; $i < count($value); $i++) { 
                                            $value[$i] = json_decode($value[$i]);
                                            if ($value[$i]->ap === 0) {
                                                $rpa++;
                                            }
                                        }
                                }

                            }

                            $sql = "SELECT * FROM notas WHERE id = '$notas' ";
                            $resultado = $conn->query($sql)->fetch_object();
                            $id = $resultado->$año;

                            $sql = "SELECT * FROM $año WHERE id = '$id' ";
                            $resultado = $conn->query($sql)->fetch_all();

                            foreach ($resultado as $key => $value) {
                                    for ($i=1; $i < count($value); $i++) { 
                                        $value[$i] = json_decode($value[$i]);
                                        if ($value[$i]->ap === 0) {
                                            $rp++;
                                        }
                                    }
                            }

                            if($rp<3 && $rpa <1){

                                if($estado == "repitiente"){
                                    $sql = "UPDATE alumnos SET estado='cursando' WHERE cedula='$cedula'";
                                    $resultado = $conn->query($sql);
                                }


                                if($SiguienteAño == "Graduado"){
                                    if($rp == 0 ){
                                        $sql = "UPDATE alumnos SET estado = '$SiguienteAño' WHERE cedula = '$cedula'";
                                        $resultado = $conn->query($sql);
                                    }
                                }else{
                                    $sql = "INSERT INTO $SiguienteAño (`id`) VALUES (NULL)";
                                    $resultado = $conn->query($sql);
                                    $id = mysqli_insert_id($conn);

                                    $sql = "UPDATE notas SET $SiguienteAño = '$id' WHERE id = '$notas'";
                                    $resultado = $conn->query($sql);
                                    
                                    $sql = "UPDATE alumnos SET ano = '$SiguienteAño' WHERE cedula = '$cedula'";
                                    $resultado = $conn->query($sql);
                                    }

                                $consulta = true;

                            }

                    }

                    if($consulta) {
                    
                        echo "Se ha pasado la sección de año";
                        $correoUser = $user['email'];
                        $cedula = $_POST["cedula"];
                        $data = "El usuario $correoUser paso de año a: $año seccion $seccion";
                        $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                        $resultado = $conn->query($sql);
                    }
                }
    
                } catch (Exception $e) {
                    echo $e->getMessage();
                }

                break;
            case 'datosAlumno':

                // buscamos todos los alumnos correspondientes al año y seccion
            try {

                $data = new stdClass();

                $ano = $_POST["año"];
                $cedula = $_POST["cedula"];
                $sql = "SELECT * FROM alumnos WHERE cedula='$cedula'";
                $resultado = $conn->query($sql)->fetch_object();
                
                $data->alumno=$resultado;

                $representante = $resultado->Representate;

                $sql2 = "SELECT * FROM representante WHERE id='$representante'";
                $resultado2 = $conn->query($sql2)->fetch_object();

                $data->representante=$resultado2;

                echo json_encode($data);

            } catch (Exception $e) {
                echo $e->getMessage();
            }
            break; 
        case 'ReporteAlumno':
        try {

            $ano = $_POST["año"];
            $seccion = $_POST["seccion"];
            $sql = "SELECT * FROM alumnos  WHERE ano='$ano' AND seccion='$seccion' ORDER BY cedula ASC ";
            $resultado = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);
            
            for ($i=0; $i < count($resultado); $i++) { 

                $rep = $resultado[$i]["Representate"];

                $sql2 = "SELECT * FROM representante WHERE id='$rep'";
                $resultado2 = $conn->query($sql2)->fetch_object();

                $resultado[$i]["Representate"]= $resultado2;
                
            }

            echo json_encode($resultado);

        } catch (Exception $e) {
            echo $e->getMessage();
        }
        break; 

        case 'ModoficarDatos':
            try {
                $userId = $_POST["userId"];
                $sql = "SELECT * FROM usuarios WHERE id='$userId'";
                $resultado = $conn->query($sql)->fetch_assoc();
                $user = $resultado;
                $fecha = $_POST["dateTime"];

                if("admin" == $resultado["role"]){
                    
                   //ingresamos los datos del representante
                    $idR = $_POST["idRepresentante"];
                    $cedulaR = $_POST["cedulaR"];
                    $nombreR = $_POST["nombreR"];
                    $apellidoR = $_POST["apellidoR"];
                    $sexoR = $_POST["sexoR"];
                    $Filiacion = $_POST["Filiacion"];
                    $DireccionR = $_POST["DireccionR"];
                    $TelfonoR = $_POST["TelfonoR"];
                    $CorreoR = $_POST["CorreoR"];

                    $sql = "UPDATE representante SET cedula=$cedulaR,nombre='$nombreR',apellido='$apellidoR',sexo='$sexoR',filiacion='$Filiacion',direccion='$DireccionR',telefono=$TelfonoR,correo='$CorreoR' WHERE id = $idR";
                    $resultado = $conn->query($sql);

                    //insertamos el alumno con los datos correspondiente  (datos ingresador por el usuario y
                    // referencia a las tablas de notas y representante)
                    $id = $_POST["idAlumno"];
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

                    $sql = "UPDATE alumnos SET cedula=$cedula,cedula_escolar='$cedulaE',nombre='$nombre',apellido='$apellido',sexo='$sexo',fecha_de_nacimiento='$Fnacimiento',edad=$edad,lugar_de_nacimiento='$LugarNacimiento',telefono=$Telfono,direccion='$Direccion',correo='$Correo' WHERE id = $id";
                    $resultado = $conn->query($sql);

                    if($resultado){
                        echo "True";
                        $correoUser = $user['email'];
                        $cedula = $_POST["cedula"];
                        $data = "El usuario $correoUser Modifico los datos del alumno: $cedula";
                        $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                        $resultado = $conn->query($sql);
                    };
                    if(!$resultado) echo "False";
                }
    
            } catch (Exception $e) {
                echo $e->getMessage();
            }
            break; 

            case 'CambiarSeccionAño':
                try {

                    $userId = $_POST["userId"];
                    $sql = "SELECT * FROM usuarios WHERE id='$userId'";
                    $resultado = $conn->query($sql)->fetch_assoc();
                    $user = $resultado;
                    $fecha = $_POST["dateTime"];

                    if("admin" == $resultado["role"]){
        
                        $ano = $_POST["año"];
                        $seccion = $_POST["seccion"];
                        $cedula = $_POST["cedula"];

                        $sql = "SELECT notas FROM `alumnos` WHERE cedula='$cedula'";
                        $notas = $conn->query($sql)->fetch_object();
    
                        $sql = "SELECT $ano FROM notas WHERE id = '$notas->notas'";
                        $resultado = $conn->query($sql)->fetch_object();

                        if($resultado->$ano == null){
                            $sql = "INSERT INTO $ano (`id`) VALUES (NULL)";
                            $resultado = $conn->query($sql);
                            $id = mysqli_insert_id($conn);
                            
                            $sql = "UPDATE notas SET $ano = '$id' WHERE id = '$notas->notas'";
                            $resultado = $conn->query($sql);
                        }

                        $sql = "UPDATE alumnos SET seccion='$seccion',ano='$ano' WHERE cedula='$cedula'";
                        $resultado = $conn->query($sql);
                        

                        if($resultado){ 
                            echo json_encode("True");
                            $correoUser = $user['email'];
                            $cedula = $_POST["cedula"];
                            $data = "El usuario $correoUser Modifico de año y/o seccion del alumno: $cedula";
                            $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                            $resultado = $conn->query($sql);
                        } ;
                        if(!$resultado) echo json_encode("False");
                    }
        
        
                } catch (Exception $e) {
                    echo $e->getMessage();
                }
                break; 
            case 'State':
                try {
                    $userId = $_POST["userId"];
                    $sql = "SELECT * FROM usuarios WHERE id='$userId'";
                    $resultado = $conn->query($sql)->fetch_assoc();
                    $user = $resultado;
                    $fecha = $_POST["dateTime"];

                    if("admin" == $resultado["role"]){

                        $estado = $_POST["estado"];
                        $cedula = $_POST["cedula"];

                        $sql = "UPDATE alumnos SET estado='$estado' WHERE cedula='$cedula'";
                        $resultado = $conn->query($sql);
                        

                        if($resultado) {
                            echo json_encode("True");
                            $correoUser = $user['email'];
                            $cedula = $_POST["cedula"];
                            $data = "El usuario $correoUser cambio la condicion del alumno: $cedula";
                            $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                            $resultado = $conn->query($sql);
                        } ;
                        if(!$resultado) echo json_encode("False");
                    }
        
                } catch (Exception $e) {
                    echo $e->getMessage();
                }
                break; 
            case 'Buscar Graduados':
                try {
                
                    $sql = "SELECT * FROM alumnos";
                    $resultado = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);
                    

                    if($resultado) echo json_encode($resultado) ;
                    if(!$resultado) echo json_encode("False");
        
                } catch (Exception $e) {
                    echo $e->getMessage();
                }
                break; 
            case 'Registro':
                try {
                    
                    $nombre = filter_var( strtolower($_POST["nombre"]), FILTER_SANITIZE_STRING) ;
                    $apellido =filter_var( strtolower($_POST["apellido"]), FILTER_SANITIZE_STRING) ;
                    $Correo =filter_var( strtolower($_POST["correo"]), FILTER_SANITIZE_EMAIL) ;
                    $clave = $_POST["clave"];
                    $clave = hash("sha512", $clave);

                    $sql = "SELECT * FROM usuarios WHERE email='$Correo'";
                    $resultado = $conn->query($sql)->fetch_assoc();

                    if($resultado === null){

                        $sql = "INSERT INTO usuarios (`id`, `nombre`, `apellido`, `email`, `password`, `role`) VALUES (null,'$nombre','$apellido','$Correo','$clave','user') ";
                        $resultado = $conn->query($sql);
                        $id = mysqli_insert_id($conn);

                        if($id != 0) echo "True";
                        if($id == 0) echo "false";
                    }else{
                        echo "false";
                    }
        
                } catch (Exception $e) {
                    echo $e->getMessage();
                }
                
            break; 

            case "Login":
                $Correo =filter_var( strtolower($_POST["correo"]), FILTER_SANITIZE_EMAIL) ;
                $clave = $_POST["clave"];
                $clave = hash("sha512", $clave);
                
                $sql = "SELECT * FROM usuarios WHERE email='$Correo'";
                $resultado = $conn->query($sql)->fetch_assoc();

                if($clave === $resultado["password"]){
                    unset($resultado["password"]);
                    $_SESSION["usuario"]= $resultado;
                    echo json_encode($resultado);
                }else{
                    echo "False";
                }

            break;

            case "Grupo Estable":
                
                $cedula = $_POST["cedula"];
                
                $sql = "SELECT * FROM alumnos WHERE cedula='$cedula'";
                $resultado = $conn->query($sql)->fetch_object();
                echo $resultado->grupo_estable;

            break;

            case "EditarGp":
                $userId = $_POST["userId"];
                $sql = "SELECT * FROM usuarios WHERE id='$userId'";
                $resultado = $conn->query($sql)->fetch_assoc();
                $user = $resultado;
                $fecha = $_POST["dateTime"];

                if("admin" == $resultado["role"]){

                    $cedula = $_POST["cedula"];
                    $GrupoEstable = $_POST["gp"];

                        
                    $sql = "UPDATE alumnos SET grupo_estable='$GrupoEstable' WHERE cedula='$cedula'";
                    $resultado = $conn->query($sql);
                        

                    if($resultado) {
                        echo json_encode("True");
                        $correoUser = $user['email'];
                        $cedula = $_POST["cedula"];
                        $data = "El usuario $correoUser Modifico el grupo estable del alumno: $cedula";
                        $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                        $resultado = $conn->query($sql);
                    } ;
                    if(!$resultado) echo json_encode("False");
                }

            break;

            case "Bitacora":
                                
                $sql = "SELECT * FROM bitacora ORDER BY id DESC";
                $resultado = $conn->query($sql)->fetch_all();
                echo json_encode($resultado);

            break;
            case "admin":
                                
                $sql = "SELECT * FROM usuarios WHERE `role`='admin' OR `role`='user'";
                $resultado = $conn->query($sql)->fetch_all();
                echo json_encode($resultado);

            break;
            case "admin users":
                $id = $_POST["id"];
                $role = $_POST["role"];
                                
                $sql = "UPDATE usuarios SET `role`='$role' WHERE id='$id'";
                $resultado = $conn->query($sql);
                
                if($resultado) echo "True";
                if(!$resultado) echo "False";


            break;
        default:
            echo "Por favor, inicie sesión o recargue la página";
            break;
    }
    
}
?>