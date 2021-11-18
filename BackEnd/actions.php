<?php 
session_start();

require '../vendor/autoload.php';
require_once "connect.php";

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

if(isset($_POST["actions"])){

    $action = $_POST["actions"];

    switch ($action) {
        case 'Buscar Alumnos':

                // buscamos todos los alumnos correspondientes al año y seccion
            try {
                $ano = $_POST["año"];
                $seccion = $_POST["seccion"];
                
                $sql = "SELECT * FROM alumnos  WHERE ano='$ano' AND seccion='$seccion' AND estado='cursando' OR ano='$ano' AND seccion='$seccion' AND estado='Repitiente' ORDER BY cedula ASC ";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_all();
                else
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
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql);
                    else
                    $resultado = $conn->query($sql);
                    $fields = $resultado->fetch_fields();
                    $idNotas = $resultado->fetch_assoc();

                    if ($fields[1]->name == $año) $notas = $idNotas["primer_año"];
                    if ($fields[2]->name == $año) $notas = $idNotas["segundo_año"];
                    if ($fields[3]->name == $año) $notas = $idNotas["tercer_año"];
                    if ($fields[4]->name == $año) $notas = $idNotas["cuarto_año"];
                    if ($fields[5]->name == $año) $notas = $idNotas["quinto_año"];

                    $sql = "SELECT * FROM $año WHERE id = '$notas' ";
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql)->fetch_all(MYSQLI_ASSOC);
                    else
                    $resultado = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);


                    if(!$resultado){
                        echo json_encode("Error");

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
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_assoc();
                else
                $resultado = $conn->query($sql)->fetch_assoc();
                $user = $resultado;
                $fecha = $_POST["dateTime"];



                if("admin" == $resultado["role"] || "superadmin" == $resultado["role"]){

                //validamos que el numero de cedula no se encuentra en la base de datos
                $año = $_POST["año"];
                $seccion = $_POST["seccion"];
                $cedula = $_POST["cedula"];
                $sql = "SELECT cedula FROM alumnos WHERE cedula = '$cedula'";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_assoc();
                else
                $resultado = $conn->query($sql)->fetch_assoc();


                if($resultado === null){

                //verificamos cuantos alumnos hay en la seccion
                    $sql = "SELECT * FROM alumnos WHERE ano = '$año' AND seccion = '$seccion'";
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql);
                    else
                    $resultado = $conn->query($sql);
                    $filas = $resultado->num_rows;

                if($filas < 35){
                        //iniciamos las tablas de notas correspondientes al año
                        $sql = "INSERT INTO $año (`id`) VALUES (NULL)";
                        if($_POST["BDR"] != null)
                        $resultado = $connR->query($sql);
                        else
                        $resultado = $conn->query($sql);
                        $id = mysqli_insert_id($conn);
                        
                        $sql = "INSERT INTO `notas` (`id`, `$año`) VALUES (NULL, $id)";
                        
                        //incertamos el id guia de las notas correspondientes al año
                        if($_POST["BDR"] != null)
                        $resultado = $connR->query($sql);
                        else
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
                        if($_POST["BDR"] != null)
                        $resultado = $connR->query($sql);
                        else
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
                        $estado = $_POST["estado"];
                        $GrupoEstable = $_POST["gp"];
                        $repitiente = $_POST["repitiente"];
                        
                        $sql = "SELECT * FROM periodo ORDER BY ID DESC LIMIT 1";
                        $resultado = $conn->query($sql)->fetch_assoc();
                        echo $resultado['periodo'];
                        $periodo =$resultado["periodo"];
                        


                        $sql = "INSERT INTO alumnos (cedula,cedula_escolar,nombre,apellido,sexo,fecha_de_nacimiento,edad,lugar_de_nacimiento,telefono,direccion,correo,ano,seccion,notas,estado,Representate,grupo_estable,repitiente,periodo) VALUES
                        ($cedula,'$cedulaE','$nombre','$apellido','$sexo','$Fnacimiento',$edad,'$LugarNacimiento',$Telfono,'$Direccion','$Correo','$año','$seccion',$id,'$estado',$idr,'$GrupoEstable','$repitiente','$periodo')";
                        if($_POST["BDR"] != null)
                        $resultado = $connR->query($sql);
                        else
                        $resultado = $conn->query($sql);

                        if(!$resultado) echo "No se pudo agregar el alumno, verifique que todos los campos esten llenos";
                        if($resultado){
                            echo "Alumno agregado con éxito";
                            $correoUser = $user['email'];
                            $data = "El usuario $correoUser Ingresó al estudiante con la cédula $cedula en $año Sección $seccion";
                            $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                            if($_POST["BDR"] != null)
                            $resultado = $connR->query($sql);
                            else
                            $resultado = $conn->query($sql);
                        };
                    }
                    else{
                        echo "La sección esta llena";
                    }
                }
                else{
                    echo "El Número de cédula ya está en el sistema";
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
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql)->fetch_assoc();
                    else
                    $resultado = $conn->query($sql)->fetch_assoc();
                    $user = $resultado;
                    $fecha = $_POST["dateTime"];


                    if("admin" == $resultado["role"] || "superadmin" == $resultado["role"]){

                    $año = $_POST["año"];
                    $materia = $_POST["materia"];
                    $datos = $_POST["datos"];
                    $nota = $_POST["nota"];

                    $sql = "UPDATE $año SET $materia = '$datos' WHERE id = '$nota'";
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql);
                    else
                    $resultado = $conn->query($sql);
    
                    echo json_encode($resultado);

                    $correoUser = $user['email'];
                    $cedula = $_POST["cedula"];
                    $np = json_decode($datos);
                    $data = "El usuario $correoUser Modificó y/o ingresó notas de $materia (Primer lapso: $np->primer_lapso, Segundo lapso: $np->segundo_lapso, Tercer lapso: $np->tercer_lapso) del alumno con el número de cédula: $cedula";
                    $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql);
                    else
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
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql)->fetch_assoc();
                    else
                    $resultado = $conn->query($sql)->fetch_assoc();
                    $user = $resultado;
                    $fecha = $_POST["dateTime"];

                    if("admin" == $resultado["role"] || "superadmin" == $resultado["role"]){

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
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql)->fetch_all();
                    else
                    $resultado = $conn->query($sql)->fetch_all();

                    
                    foreach ($resultado as $key => $value) {
                        $rp = 0;
                        $rpa= 0;
                        $cedula = $value[1];
                        $notas = $value[14];
                        $estado = $value[15];

                            if($AnteriorAño != ""){

                                $sql = "SELECT * FROM notas WHERE id = '$notas' ";
                                if($_POST["BDR"] != null)
                                $resultado = $connR->query($sql)->fetch_object();
                                else
                                $resultado = $conn->query($sql)->fetch_object();
                                $id = $resultado->$AnteriorAño;
    
                                $sql = "SELECT * FROM $AnteriorAño WHERE id = '$id' ";
                                if($_POST["BDR"] != null)
                                $resultado = $connR->query($sql)->fetch_all();
                                else
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
                            if($_POST["BDR"] != null)
                            $resultado = $connR->query($sql)->fetch_object();
                            else
                            $resultado = $conn->query($sql)->fetch_object();
                            $id = $resultado->$año;

                            $sql = "SELECT * FROM $año WHERE id = '$id' ";
                            if($_POST["BDR"] != null)
                            $resultado = $connR->query($sql)->fetch_all();
                            else
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
                                    if($_POST["BDR"] != null)
                                    $resultado = $connR->query($sql);
                                    else
                                    $resultado = $conn->query($sql);

                                    $repitiente = "[false,false,false,false,false,false,false,false,false,false,false,false,false,false]";

                                    $sql = "UPDATE alumnos SET `repitiente`='$repitiente' WHERE cedula='$cedula'";
                                    if($_POST["BDR"] != null)
                                    $resultado = $connR->query($sql);
                                    else
                                    $resultado = $conn->query($sql);
                                }


                                if($SiguienteAño == "Graduado"){
                                    if($rp == 0 ){
                                        $sql = "UPDATE alumnos SET estado = '$SiguienteAño' WHERE cedula = '$cedula'";
                                        if($_POST["BDR"] != null)
                                        $resultado = $connR->query($sql);
                                        else
                                        $resultado = $conn->query($sql);
                                    }
                                }else{
                                    $sql = "INSERT INTO $SiguienteAño (`id`) VALUES (NULL)";
                                    if($_POST["BDR"] != null)
                                    $resultado = $connR->query($sql);
                                    else
                                    $resultado = $conn->query($sql);
                                    $id = mysqli_insert_id($conn);

                                    $sql = "UPDATE notas SET $SiguienteAño = '$id' WHERE id = '$notas'";
                                    if($_POST["BDR"] != null)
                                    $resultado = $connR->query($sql);
                                    else
                                    $resultado = $conn->query($sql);
                                    
                                    $sql = "UPDATE alumnos SET ano = '$SiguienteAño' WHERE cedula = '$cedula'";
                                    if($_POST["BDR"] != null)
                                    $resultado = $connR->query($sql);
                                    else
                                    $resultado = $conn->query($sql);
                                    }

                                $consulta = true;

                            }

                    }

                    if($consulta) {
                    
                        echo "Se ha pasado la sección de año";
                        $correoUser = $user['email'];
                        $cedula = $_POST["cedula"];
                        $data = "El usuario $correoUser pasó de año a: $año sección $seccion";
                        $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                        if($_POST["BDR"] != null)
                        $resultado = $connR->query($sql);
                        else
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
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_object();
                else
                $resultado = $conn->query($sql)->fetch_object();
                
                $data->alumno=$resultado;

                $representante = $resultado->Representate;

                $sql2 = "SELECT * FROM representante WHERE id='$representante'";
                if($_POST["BDR"] != null)
                $resultado2 = $connR->query($sql)->fetch_object();

                else
                $resultado2 = $conn->query($sql2)->fetch_object();

                $data->representante=$resultado2;

                echo json_encode($data);

            } catch (Exception $e) {
                echo $e->getMessage();
            }
            break; 
            case 'TotalAlumnos':

                // buscamos todos los alumnos correspondientes al año y seccion
            try {

                function obtener_estructura_directorios($ruta){
                    // Se comprueba que realmente sea la ruta de un directorio
                    if (is_dir($ruta)){
                        // Abre un gestor de directorios para la ruta indicada
                        $gestor = opendir($ruta);
                
                        // Recorre todos los elementos del directorio
                        while (($archivo = readdir($gestor)) !== false)  {
                                
                            $ruta_completa = $ruta . "/" . $archivo;
                
                            // Se muestran todos los archivos y carpetas excepto "." y ".."
                            if ($archivo != "." && $archivo != "..") {
                                // Si es un directorio se recorre recursivamente
                                if (is_dir($ruta_completa)) {
                                    

                                    obtener_estructura_directorios($ruta_completa);
                                } else {
                                    if(stristr($archivo, 'xlsx') == "xlsx"){
                                        if(stristr($archivo, 'template') == false && stristr($archivo, 'notes') == false && stristr($archivo, 'data') == false)
                
                                        unlink($archivo);
                                    }

                                }
                            }
                        }
                        
                        // Cierra el gestor de directorios
                        closedir($gestor);

                    } else {
                    }
                }
                
                obtener_estructura_directorios("./");

                $sql = "SELECT * FROM alumnos";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql);
                else
                $resultado = $conn->query($sql);
                $filas = $resultado->num_rows;

                echo $filas;

            } catch (Exception $e) {
                echo $e->getMessage();
            }
            break; 
        case 'ReporteAlumno':
        try {

            $ano = $_POST["año"];
            $seccion = $_POST["seccion"];
            $sql = "SELECT * FROM alumnos  WHERE ano='$ano' AND seccion='$seccion' ORDER BY cedula ASC ";
            if($_POST["BDR"] != null)
            $resultado = $connR->query($sql)->fetch_all(MYSQLI_ASSOC);
            else
            $resultado = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);
            
            for ($i=0; $i < count($resultado); $i++) { 

                $rep = $resultado[$i]["Representate"];

                $sql2 = "SELECT * FROM representante WHERE id='$rep'";
                if($_POST["BDR"] != null)
                $resultado2 = $connR->query($sql)->fetch_object();
                else
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
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_assoc();
                else
                $resultado = $conn->query($sql)->fetch_assoc();
                $user = $resultado;
                $fecha = $_POST["dateTime"];

                if("admin" == $resultado["role"] || "superadmin" == $resultado["role"]){
                    
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
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql);
                    else
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
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql);
                    else
                    $resultado = $conn->query($sql);


                    if($resultado){
                        echo "True";
                        $correoUser = $user['email'];
                        $cedula = $_POST["cedula"];
                        $data = "El usuario $correoUser Modificó los datos del alumno: $cedula";
                        $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                        if($_POST["BDR"] != null)
                        $resultado = $connR->query($sql);
                        else
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
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql)->fetch_assoc();
                    else
                    $resultado = $conn->query($sql)->fetch_assoc();
                    $user = $resultado;
                    $fecha = $_POST["dateTime"];

                    if("admin" == $resultado["role"] || "superadmin" == $resultado["role"]){
        
                        $ano = $_POST["año"];
                        $seccion = $_POST["seccion"];
                        $cedula = $_POST["cedula"];

                        $sql = "SELECT notas FROM `alumnos` WHERE cedula='$cedula'";
                        if($_POST["BDR"] != null)
                        $resultado = $connR->query($sql)->fetch_object();
                        else
                        $notas = $conn->query($sql)->fetch_object();
    
                        $sql = "SELECT $ano FROM notas WHERE id = '$notas->notas'";
                        if($_POST["BDR"] != null)
                        $resultado = $connR->query($sql)->fetch_object();
                        else
                        $resultado = $conn->query($sql)->fetch_object();

                        if($resultado->$ano == null){
                            $sql = "INSERT INTO $ano (`id`) VALUES (NULL)";
                            if($_POST["BDR"] != null)
                            $resultado = $connR->query($sql);
                            else
                            $resultado = $conn->query($sql);
                            $id = mysqli_insert_id($conn);
                            
                            $sql = "UPDATE notas SET $ano = '$id' WHERE id = '$notas->notas'";
                            if($_POST["BDR"] != null)
                            $resultado = $connR->query($sql);
                            else
                            $resultado = $conn->query($sql);
                        }

                        $sql = "UPDATE alumnos SET seccion='$seccion',ano='$ano' WHERE cedula='$cedula'";
                        if($_POST["BDR"] != null)
                        $resultado = $connR->query($sql);
                        else
                        $resultado = $conn->query($sql);
                        

                        if($resultado){ 
                            echo json_encode("True");
                            $correoUser = $user['email'];
                            $cedula = $_POST["cedula"];
                            $data = "El usuario $correoUser Modificó de año y/o sección del alumno: $cedula";
                            $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                            if($_POST["BDR"] != null)
                            $resultado = $connR->query($sql);
                            else
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
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql)->fetch_assoc();
                    else
                    $resultado = $conn->query($sql)->fetch_assoc();
                    $user = $resultado;
                    $fecha = $_POST["dateTime"];

                    if("admin" == $resultado["role"] || "superadmin" == $resultado["role"]){

                        $estado = $_POST["estado"];
                        $cedula = $_POST["cedula"];

                        $sql = "UPDATE alumnos SET estado='$estado' WHERE cedula='$cedula'";
                        if($_POST["BDR"] != null)
                        $resultado = $connR->query($sql);
                        else
                        $resultado = $conn->query($sql);
                        

                        if($resultado) {
                            echo json_encode("True");
                            $correoUser = $user['email'];
                            $cedula = $_POST["cedula"];
                            $data = "El usuario $correoUser cambió la condición del alumno: $cedula";
                            $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                            if($_POST["BDR"] != null)
                            $resultado = $connR->query($sql);
                            else
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
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql)->fetch_all(MYSQLI_ASSOC);
                    else
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
            case "GenerarBoletin":
                            
                $data = new stdClass();
                $ano = $_POST["año"];
                $cedula= $_POST["cedula"];
                $sql = "SELECT * FROM alumnos WHERE cedula='$cedula'";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_object();
                else
                $resultado = $conn->query($sql)->fetch_object();
                
                $data->alumno=$resultado;
                
                $representante = $resultado->Representate;
                
                $sql2 = "SELECT * FROM representante WHERE id='$representante'";
                if($_POST["BDR"] != null)
                $resultado2 = $connR->query($sql)->fetch_object();
                else
                $resultado2 = $conn->query($sql2)->fetch_object();
                
                $data->representante=$resultado2;
                
                $notasClient = $data->alumno->notas;
                
                $sql = "SELECT * FROM notas WHERE id = '$notasClient'";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql);
                else
                $resultado = $conn->query($sql);
                $fields = $resultado->fetch_fields();
                $idNotas = $resultado->fetch_assoc();
                $notas = 0;
                
                if ($fields[1]->name == $ano) $notas = $idNotas["primer_año"];
                if ($fields[2]->name == $ano) $notas = $idNotas["segundo_año"];
                if ($fields[3]->name == $ano) $notas = $idNotas["tercer_año"];
                if ($fields[4]->name == $ano) $notas = $idNotas["cuarto_año"];
                if ($fields[5]->name == $ano) $notas = $idNotas["quinto_año"];
                
                $sql = "SELECT * FROM $ano WHERE id = '$notas' ";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql);
                else
                $resultado = $conn->query($sql);
                $notas = $resultado->fetch_assoc();
                $fields = $resultado->fetch_fields();
                            
                $añoexcel = "";
                
                if($ano == "primer_año") $añoexcel = "PRIMER AÑO";
                if($ano == "segundo_año") $añoexcel = "SEGUNDO AÑO";
                if($ano == "tercer_año") $añoexcel = "TERCER AÑO";
                if($ano == "cuarto_año") $añoexcel = "CUARTO AÑO";
                if($ano == "quinto_año") $añoexcel = "QUINTO AÑO";
                
                $añoSeccion =  $añoexcel." ". $data->alumno->seccion;
                
                $nombreApellido= strtoupper($data->alumno->apellido." ".$data->alumno->nombre);
                $lugarNacimiento= strtoupper($data->alumno->lugar_de_nacimiento);
                $fechaNacimiento=  new DateTime($data->alumno->fecha_de_nacimiento);
                $periodo = $data->alumno->periodo;

                $fechaNacimiento =$fechaNacimiento->format('d/m/Y');
                
                $indexNotas = 14;
                $aux = 0;
                $momento = 1;
                $total = count($notas) ;
                $date = new DateTime();
                $date =$date->format('d/m/Y-H:i');

                $dm1O = 0;
                $dm2O = 0;
                $dm3O = 0;
                $dm1P = 0;
                $dm2P = 0;
                $dm3P = 0;
                
                if(json_decode($notas["CASTELLANO"])->segundo_lapso > 0){
                    $momento = 2;
                }
                if(json_decode($notas["CASTELLANO"])->tercer_lapso > 0){
                    $momento = 3;
                }
                 
                unset($notas["id"]);
                $spreadsheet =  \PhpOffice\PhpSpreadsheet\IOFactory::load('template.xlsx');
                $sheet = $spreadsheet->getActiveSheet();
                $sheet->setTitle("Notas");
                $sheet->setCellValue('H1', $date);
                $sheet->setCellValue('E9', "MOMENTO ESCOLAR: $momento");
                $sheet->setCellValue('H9', "AÑO ESCOLAR: $periodo");
                $sheet->setCellValue('A9', "AÑO Y SECCIÓN DE ESTUDIO: $añoSeccion");
                $sheet->setCellValue('A10', "CEDULA O IDENTIFICACION: $cedula");
                $sheet->setCellValue('E10', "APELLIDOS Y NOMBRES: $nombreApellido");
                $sheet->setCellValue('A11', "LUGAR DE NACIMIENTO: $lugarNacimiento");
                $sheet->setCellValue('I11', "FECHA DE NACIMIENTO: $fechaNacimiento");
                foreach($notas as $key => $value){

                    $sheet->setCellValue('A'.$indexNotas,strtoupper( str_replace("_", " ", $key)));
                    $sheet->setCellValue('D'.$indexNotas, intval(json_decode($notas[$key])->primer_lapso));
                    $sheet->setCellValue('E'.$indexNotas, intval(json_decode($notas[$key])->segundo_lapso));
                    $sheet->setCellValue('F'.$indexNotas, intval(json_decode($notas[$key])->tercer_lapso));
                    $sheet->setCellValue('G'.$indexNotas, "=ROUND((D$indexNotas+E$indexNotas+F$indexNotas)/3,0)");
                    if(strtoupper( str_replace("_", " ", $key)) == "PARTICIPACIÓN EN GRUPOS"){
                        if(intval(json_decode($notas[$key])->primer_lapso) >= 0 && intval(json_decode($notas[$key])->primer_lapso)  <= 9)
                        $sheet->setCellValue('D'.$indexNotas, "I");
                        if(intval(json_decode($notas[$key])->primer_lapso) <= 12 && intval(json_decode($notas[$key])->primer_lapso) >= 10)
                        $sheet->setCellValue('D'.$indexNotas, "D");
                        if(intval(json_decode($notas[$key])->primer_lapso) >= 13 && intval(json_decode($notas[$key])->primer_lapso) <= 15)
                        $sheet->setCellValue('D'.$indexNotas, "C");
                        if(intval(json_decode($notas[$key])->primer_lapso) >= 16 && intval(json_decode($notas[$key])->primer_lapso) <= 18)
                        $sheet->setCellValue('D'.$indexNotas, "B");
                        if(intval(json_decode($notas[$key])->primer_lapso) >= 18 && intval(json_decode($notas[$key])->primer_lapso) <= 20)
                        $sheet->setCellValue('D'.$indexNotas, "A");
                        $dm1P = intval(json_decode($notas[$key])->primer_lapso);
                        $dm2P = intval(json_decode($notas[$key])->segundo_lapso);
                        $dm3P = intval(json_decode($notas[$key])->tercer_lapso);

                        
                        if(intval(json_decode($notas[$key])->segundo_lapso) >= 0 && intval(json_decode($notas[$key])->segundo_lapso)  <= 9)
                        $sheet->setCellValue('E'.$indexNotas, "I");
                        if(intval(json_decode($notas[$key])->segundo_lapso) <= 12 && intval(json_decode($notas[$key])->segundo_lapso) >= 10)
                        $sheet->setCellValue('E'.$indexNotas, "D");
                        if(intval(json_decode($notas[$key])->segundo_lapso) >= 13 && intval(json_decode($notas[$key])->segundo_lapso) <= 15)
                        $sheet->setCellValue('E'.$indexNotas, "C");
                        if(intval(json_decode($notas[$key])->segundo_lapso) >= 16 && intval(json_decode($notas[$key])->segundo_lapso) <= 18)
                        $sheet->setCellValue('E'.$indexNotas, "B");
                        if(intval(json_decode($notas[$key])->segundo_lapso) >= 18 && intval(json_decode($notas[$key])->segundo_lapso) <= 20)
                        $sheet->setCellValue('E'.$indexNotas, "A");


                        if(intval(json_decode($notas[$key])->tercer_lapso) >= 0 && intval(json_decode($notas[$key])->tercer_lapso)  <= 9)
                        $sheet->setCellValue('F'.$indexNotas, "I");
                        if(intval(json_decode($notas[$key])->tercer_lapso) <=12 && intval(json_decode($notas[$key])->tercer_lapso) >= 10)
                        $sheet->setCellValue('F'.$indexNotas, "D");
                        if(intval(json_decode($notas[$key])->tercer_lapso) >= 13 && intval(json_decode($notas[$key])->tercer_lapso) <= 15)
                        $sheet->setCellValue('F'.$indexNotas, "C");
                        if(intval(json_decode($notas[$key])->tercer_lapso) >= 16 && intval(json_decode($notas[$key])->tercer_lapso) <= 18)
                        $sheet->setCellValue('F'.$indexNotas, "B");
                        if(intval(json_decode($notas[$key])->tercer_lapso) >= 18 && intval(json_decode($notas[$key])->tercer_lapso) <= 20)
                        $sheet->setCellValue('F'.$indexNotas, "A");

                        $DF = (intval(json_decode($notas[$key])->primer_lapso) + intval(json_decode($notas[$key])->segundo_lapso) + intval(json_decode($notas[$key])->tercer_lapso))/3;

                        if($DF >= 0 && $DF  <= 9)
                        $sheet->setCellValue('G'.$indexNotas, "I");
                        if($DF <= 12 && $DF >= 10)
                        $sheet->setCellValue('G'.$indexNotas, "D");
                        if($DF >= 13 && $DF <= 15)
                        $sheet->setCellValue('G'.$indexNotas, "C");
                        if($DF >= 16 && $DF <= 18)
                        $sheet->setCellValue('G'.$indexNotas, "B");
                        if($DF >= 18 && $DF <= 20)
                        $sheet->setCellValue('G'.$indexNotas, "A");

                    }
                    if(strtoupper( str_replace("_", " ", $key)) == "ORIENTACIÓN Y CONVIVENCIA"){
                        if(intval(json_decode($notas[$key])->primer_lapso) >= 0 && intval(json_decode($notas[$key])->primer_lapso)  <= 9)
                        $sheet->setCellValue('D'.$indexNotas, "I");
                        if(intval(json_decode($notas[$key])->primer_lapso) <= 12 && intval(json_decode($notas[$key])->primer_lapso) >= 10)
                        $sheet->setCellValue('D'.$indexNotas, "D");
                        if(intval(json_decode($notas[$key])->primer_lapso) >= 13 && intval(json_decode($notas[$key])->primer_lapso) <= 15)
                        $sheet->setCellValue('D'.$indexNotas, "C");
                        if(intval(json_decode($notas[$key])->primer_lapso) >= 16 && intval(json_decode($notas[$key])->primer_lapso) <= 18)
                        $sheet->setCellValue('D'.$indexNotas, "B");
                        if(intval(json_decode($notas[$key])->primer_lapso) >= 18 && intval(json_decode($notas[$key])->primer_lapso) <= 20)
                        $sheet->setCellValue('D'.$indexNotas, "A");


                        if(intval(json_decode($notas[$key])->segundo_lapso) >= 0 && intval(json_decode($notas[$key])->segundo_lapso)  <= 9)
                        $sheet->setCellValue('E'.$indexNotas, "I");
                        if(intval(json_decode($notas[$key])->segundo_lapso) <= 12 && intval(json_decode($notas[$key])->segundo_lapso) >= 10)
                        $sheet->setCellValue('E'.$indexNotas, "D");
                        if(intval(json_decode($notas[$key])->segundo_lapso) >= 13 && intval(json_decode($notas[$key])->segundo_lapso) <= 15)
                        $sheet->setCellValue('E'.$indexNotas, "C");
                        if(intval(json_decode($notas[$key])->segundo_lapso) >= 16 && intval(json_decode($notas[$key])->segundo_lapso) <= 18)
                        $sheet->setCellValue('E'.$indexNotas, "B");
                        if(intval(json_decode($notas[$key])->segundo_lapso) >= 18 && intval(json_decode($notas[$key])->segundo_lapso) <= 20)
                        $sheet->setCellValue('E'.$indexNotas, "A");



                        if(intval(json_decode($notas[$key])->tercer_lapso) >= 0 && intval(json_decode($notas[$key])->tercer_lapso)  <= 9)
                        $sheet->setCellValue('F'.$indexNotas, "I");
                        if(intval(json_decode($notas[$key])->tercer_lapso) <= 12 && intval(json_decode($notas[$key])->tercer_lapso) >= 10)
                        $sheet->setCellValue('F'.$indexNotas, "D");
                        if(intval(json_decode($notas[$key])->tercer_lapso) >= 13 && intval(json_decode($notas[$key])->tercer_lapso) <= 15)
                        $sheet->setCellValue('F'.$indexNotas, "C");
                        if(intval(json_decode($notas[$key])->tercer_lapso) >= 16 && intval(json_decode($notas[$key])->tercer_lapso) <= 18)
                        $sheet->setCellValue('F'.$indexNotas, "B");
                        if(intval(json_decode($notas[$key])->tercer_lapso) >= 18 && intval(json_decode($notas[$key])->tercer_lapso) <= 20)
                        $sheet->setCellValue('F'.$indexNotas, "A");

                        $DF = (intval(json_decode($notas[$key])->primer_lapso) + intval(json_decode($notas[$key])->segundo_lapso) + intval(json_decode($notas[$key])->tercer_lapso))/3;

                        if($DF >= 0 && $DF  <= 9)
                        $sheet->setCellValue('G'.$indexNotas, "I");
                        if($DF <= 12 && $DF >= 10)
                        $sheet->setCellValue('G'.$indexNotas, "D");
                        if($DF >= 13 && $DF <= 15)
                        $sheet->setCellValue('G'.$indexNotas, "C");
                        if($DF >= 16 && $DF <= 18)
                        $sheet->setCellValue('G'.$indexNotas, "B");
                        if($DF >= 18 && $DF <= 20)
                        $sheet->setCellValue('G'.$indexNotas, "A");

                        $dm1O = intval(json_decode($notas[$key])->primer_lapso);
                        $dm2O = intval(json_decode($notas[$key])->segundo_lapso);
                        $dm3O = intval(json_decode($notas[$key])->tercer_lapso);
                    }

                    $indexNotas++;
                    $aux++;
                }
                $sheet->getStyle('A13:I13')->getFill()
                    ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                    ->getStartColor()->setRGB('595959');

                
                $sheet->getStyle('A8:I8')->getFill()
                    ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                    ->getStartColor()->setRGB('595959');
                $sheet->getStyle('A8:I8')->getFont()->getColor()->setRGB('ffffff');;
                
                
                $indexNotas--;
                
                $sheet->setCellValue('I14', "=ROUND((SUM(D14:D20)+$dm1O+$dm1P)/$aux,2)");
                if($momento >= 2)
                    $sheet->setCellValue('I15', "=ROUND((SUM(E14:E20)+$dm2O+$dm2P)/$aux,2)");
                if($momento == 3){
                    $sheet->setCellValue('I16', "=ROUND((SUM(F14:F20)+$dm3O+$dm3P)/$aux,2)");
                    $sheet->setCellValue('I17', "=ROUND(SUM(I14:I16)/3,2)");
                }
                

                $currentAño = str_replace("_"," ",$ano);

                $boletin = "Boletin $nombreApellido CI $cedula Año $currentAño.xlsx";

                $writer = new Xlsx($spreadsheet);
                $writer->save($boletin);

                echo $boletin;
  
            
                
            break;
            case "ReporteDatos":
                $spreadsheet =  \PhpOffice\PhpSpreadsheet\IOFactory::load('data.xlsx');
                $sheet = $spreadsheet->getActiveSheet();
                $data = new stdClass();
                $ano = $_POST["año"];
                $seccion = $_POST["seccion"];
                $añoexcel = "";
                
                if($ano == "primer_año") $añoexcel = "PRIMER AÑO";
                if($ano == "segundo_año") $añoexcel = "SEGUNDO AÑO";
                if($ano == "tercer_año") $añoexcel = "TERCER AÑO";
                if($ano == "cuarto_año") $añoexcel = "CUARTO AÑO";
                if($ano == "quinto_año") $añoexcel = "QUINTO AÑO";
                
                $sheet->setCellValue("H2", "AÑO: ". $añoexcel);
                
                
                $sql = "SELECT * FROM alumnos  WHERE ano='$ano' AND seccion='$seccion' AND estado='cursando' OR ano='$ano' AND seccion='$seccion' AND estado='Repitiente' ORDER BY cedula ASC LIMIT 35";
                $resultado = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);
                
                $sheet->setCellValue("H3", "SECCIÓN: ".$resultado[0]["seccion"]);
                $sheet->setCellValue("J3", "AÑO ESCOLAR: ".$resultado[0]["periodo"]);
                
                $alumnosTotales = count($resultado);
                
                $aux3 = 7;
                $aux2 = 5;
                $aux1 = 4;
                $aux4 = 9;
                $aux = 0;
                $sheet->setTitle("Datos grupal");
                
                $columna= "E";
                foreach ($resultado as $key => $value) {
                
                    $idN = $value['Representate'];
                    $sql = "SELECT * FROM representante WHERE id = '$idN'";
                    $resultado = $conn->query($sql);
                    $representante = $resultado->fetch_assoc();
                    $notas = 0;
                    $sheet->setCellValue("C$aux2", $value["cedula"] );
                    $sheet->setCellValue("D$aux2", $value["nombre"] . " " . $value["apellido"]);
                    $sheet->setCellValue("E$aux2", $value["sexo"] );
                    $sheet->setCellValue("F$aux2", $value["fecha_de_nacimiento"] );
                    $sheet->setCellValue("G$aux2", $value["direccion"] );
                    $sheet->setCellValue("H$aux2", $value["telefono"] );
                    $sheet->setCellValue("I$aux2", $value["correo"] );
                    $sheet->setCellValue("J$aux2", $value["lugar_de_nacimiento"] );
                    $sheet->setCellValue("K$aux2", $value["edad"] );
                    // representante
                    $sheet->setCellValue("C".$aux3, $representante["cedula"]);
                    $sheet->setCellValue("D".$aux3, $representante["nombre"] . " " . $representante["apellido"] );
                    $sheet->setCellValue("E".$aux3, $representante["sexo"]);
                    $sheet->setCellValue("F".$aux3, $representante["filiacion"]);
                    $sheet->setCellValue("G".$aux3, $representante["direccion"]);
                    $sheet->setCellValue("H".$aux3, $representante["telefono"]);
                    $sheet->setCellValue("I".$aux3, $representante["correo"]);
                
                    $sheet->getStyle("B$aux1:B".$aux1+2)->getFill()
                    ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                    ->getStartColor()->setRGB('8ea9db');
                    $sheet->getStyle("B$aux4:B".$aux4+2)->getFill()
                    ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                    ->getStartColor()->setRGB('d9d9d9');
                
                $sheet->setCellValue("A".$aux2, $aux+1);
                
                $aux3 = $aux3 + 5;
                $aux2 = $aux2 + 5;
                $aux1 = $aux1 + 10;
                $aux4 = $aux4 + 10;
                
                $aux++;
                
                if($alumnosTotales == $aux){
                
                    $writer = new Xlsx($spreadsheet);
                    $archivo = "REPORTE DE DATOS $añoexcel - $seccion.xlsx";
                    $writer->save($archivo);
                    echo $archivo;
                }
                
                }
                
            break;
            case "Grupo Estable":
                
                $cedula = $_POST["cedula"];
                
                $sql = "SELECT * FROM alumnos WHERE cedula='$cedula'";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_object();
                else
                $resultado = $conn->query($sql)->fetch_object();
                echo json_encode($resultado);

/*             break;
            case "Limpiar": */
                

                
                $sql = "DELETE FROM alumnos WHERE estado='retirado' OR estado='graduado' ";
                $resultado = $conn->query($sql)->fetch_object();

                echo "True";
 

            break;
            case "restaurar":
                $baseDeDatos = BD;


                if(isset($_POST["baseDeDatos"])){
                    $baseDeDatos = BDR;
                    $restorePoint=SGBD::limpiarCadena($_POST['restorePoint2']);

                }else{
                    $restorePoint=SGBD::limpiarCadena($_POST['restorePoint']);

                }
              
                $sql=explode(";",file_get_contents($restorePoint));
                $totalErrors=0;
                $con=mysqli_connect(SERVER, USER, PASS, $baseDeDatos);
                $con->query("SET FOREIGN_KEY_CHECKS=0;");
                $con->query('CREATE DATABASE IF NOT EXISTS '.$baseDeDatos.";\n\n");
                $con->query('USE '.$baseDeDatos.";\n\n");
                for($i = 0; $i < (count($sql)-1); $i++){
                    if($con->query($sql[$i].";")){  }else{ $totalErrors++; }
                }
                $con->query("SET FOREIGN_KEY_CHECKS=1");
                $con->close();
                if($totalErrors<=0){
                    echo "Restauración completada con éxito";
                }else{
                    echo "Ocurrió un error inesperado, no se pudo hacer la restauración";
                }
                

            break;
            case "ReporteNotas":
                $spreadsheet =  \PhpOffice\PhpSpreadsheet\IOFactory::load('notes.xlsx');
                $sheet = $spreadsheet->getActiveSheet();
                $data = new stdClass();
                $ano = $_POST["año"];
                $seccion = $_POST["seccion"];
 
                $añoexcel = "";
                
                if($ano == "primer_año") $añoexcel = "PRIMER AÑO";
                if($ano == "segundo_año") $añoexcel = "SEGUNDO AÑO";
                if($ano == "tercer_año") $añoexcel = "TERCER AÑO";
                if($ano == "cuarto_año") $añoexcel = "CUARTO AÑO";
                if($ano == "quinto_año") $añoexcel = "QUINTO AÑO";
                
                $sheet->setCellValue("K2", "AÑO: ". $añoexcel);
                
                
                $sql = "SELECT * FROM alumnos  WHERE ano='$ano' AND seccion='$seccion' AND estado='cursando' OR ano='$ano' AND seccion='$seccion' AND estado='Repitiente' ORDER BY cedula ASC LIMIT 35";
                $resultado = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);
           
                
                $sheet->setCellValue("K3", "SECCIÓN: ".$resultado[0]["seccion"]);
                $sheet->setCellValue("N2", "AÑO ESCOLAR: ".$resultado[0]["periodo"]);
                
                
                $alumnosTotales = count($resultado);
                $aux2 = 5;
                $aux3 = 0;
                $aux = 0;
                
                $columna= "E";
                foreach ($resultado as $key => $value) {
                    # code...
                    $idN = $value['notas'];
                    $sql = "SELECT * FROM notas WHERE id = '$idN'";
                    $resultado = $conn->query($sql);
                    $fields = $resultado->fetch_fields();
                    $idNotas = $resultado->fetch_assoc();
                    $notas = 0;
                
                    
                if ($fields[1]->name == $ano) $notas = $idNotas["primer_año"];
                if ($fields[2]->name == $ano) $notas = $idNotas["segundo_año"];
                if ($fields[3]->name == $ano) $notas = $idNotas["tercer_año"];
                if ($fields[4]->name == $ano) $notas = $idNotas["cuarto_año"];
                if ($fields[5]->name == $ano) $notas = $idNotas["quinto_año"];
                
                $sql = "SELECT * FROM $ano WHERE id = '$notas' ";
                $resultado = $conn->query($sql);
                $notas = $resultado->fetch_assoc();
                $fields = $resultado->fetch_fields();
                
                $sheet->setCellValue("C$aux2", $value["nombre"] . " " . $value["apellido"]);
                $sheet->setCellValue("B$aux2", $value["cedula"] );
                $sheet->setCellValue("A".$aux2, $aux+1);
                
                
                foreach ($notas as $key2 => $value2) {
                    if($aux3 == 1 ) $columna= "E";
                    if($aux3 == 2 ) $columna= "F";
                    if($aux3 == 3 ) $columna= "G";
                    if($aux3 == 4 ) $columna= "H";
                    if($aux3 == 5 ) $columna= "I";
                    if($aux3 == 6 ) $columna= "J";
                    if($aux3 == 7 ) $columna= "K";
                    if($aux3 == 8 ) $columna= "L";
                    if($aux3 == 9 ) $columna= "M";
                    if($aux3 == 10 ) $columna= "N";
                
                
                    if(count($notas) >= 10){
                    if($aux3 == 8 ) $columna= "O";
                    if($aux3 == 9 ) $columna= "P";
                    }
                    $sheet->setTitle("Notas grupal");
                    $sheet->setCellValue($columna.$aux2, intval(json_decode($value2)->primer_lapso));
                    $sheet->setCellValue($columna.$aux2+1, intval(json_decode($value2)->segundo_lapso));
                    $sheet->setCellValue($columna.$aux2+2, intval(json_decode($value2)->tercer_lapso));
                    $sheet->setCellValue($columna.$aux2+3, intval(json_decode($value2)->revision));
                    $sheet->setCellValue($columna.$aux2+4, "=ROUND(".(intval(json_decode($value2)->primer_lapso)+intval(json_decode($value2)->segundo_lapso)+intval(json_decode($value2)->tercer_lapso))/3 .",2)");
                    $aux3++;
                    if(count($notas) == $aux3){$aux2 = $aux2 + 5; $aux3 = 0;} 
                }
                $aux++;
                
                if($aux == $alumnosTotales){
                    $writer = new Xlsx($spreadsheet);
                    $archivo = "REPORTE DE NOTAS $añoexcel - $seccion.xlsx";
                    $writer->save($archivo);
                    echo $archivo;
                }
                }
                

            break;

            case "respaldo":
                        
                $year=date("Y");
                $yearPlus=date("Y")+1;
                $hora=date("H");
                $minuto=date("i");
                $seg=date("s");
                $formaH=$hora."h-".$minuto."m-".$seg."s";
                $fechaPeriodo = date("d-m-Y");
                $DataBASE="Periodo $year-$yearPlus ($fechaPeriodo) & ".$formaH.".sql";
                $tables=array();
                $result=SGBD::sql('SHOW TABLES');
                if($result){
                    while($row=mysqli_fetch_row($result)){
                       $tables[] = $row[0];
                    }
                    $sql='SET FOREIGN_KEY_CHECKS=0;'."\n\n";
                    foreach($tables as $table){
                        $result=SGBD::sql('SELECT * FROM '.$table);
                        if($result){
                            $numFields=mysqli_num_fields($result);
                            $sql.='DROP TABLE IF EXISTS '.$table.';';
                            $row2=mysqli_fetch_row(SGBD::sql('SHOW CREATE TABLE '.$table));
                            $sql.="\n\n".$row2[1].";\n\n";
                            for ($i=0; $i < $numFields; $i++){
                                while($row=mysqli_fetch_row($result)){
                                    $sql.='INSERT INTO '.$table.' VALUES(';
                                    for($j=0; $j<$numFields; $j++){
                                        $row[$j]=addslashes($row[$j]);
                                        $row[$j]=str_replace("\n","\\n",$row[$j]);
                                        if (isset($row[$j])){
                                            $sql .= '"'.$row[$j].'"' ;
                                        }
                                        else{
                                            $sql.= '""';
                                        }
                                        if ($j < ($numFields-1)){
                                            $sql .= ',';
                                        }
                                    }
                                    $sql.= ");\n";
                                }
                            }
                            $sql.="\n\n\n";
                        }else{
                            $error=1;
                        }
                    }
                    if($error==1){
                        echo 'Ocurrió un error inesperado al crear la copia de seguridad';
                    }else{
                        chmod(BACKUP_PATH, 0777);
                        $sql.='SET FOREIGN_KEY_CHECKS=1;';
                        $handle=fopen(BACKUP_PATH.$DataBASE,'w+');
                        if(fwrite($handle, $sql)){
                            fclose($handle);
                            echo 'Copia de seguridad realizada con éxito';
                        }else{
                            echo 'Ocurrió un error inesperado al crear la copia de seguridad';
                        }
                    }
                }else{
                    echo 'Ocurrió un error inesperado';
                }
                mysqli_free_result($result);

            break;

            case "EditarGp":
                $userId = $_POST["userId"];
                $sql = "SELECT * FROM usuarios WHERE id='$userId'";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_assoc();
                else
                $resultado = $conn->query($sql)->fetch_assoc();
                $user = $resultado;
                $fecha = $_POST["dateTime"];

                if("admin" == $resultado["role"] || "superadmin" == $resultado["role"]){

                    $cedula = $_POST["cedula"];
                    $GrupoEstable = $_POST["gp"];

                        
                    $sql = "UPDATE alumnos SET grupo_estable='$GrupoEstable' WHERE cedula='$cedula'";
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql);
                    else
                    $resultado = $conn->query($sql);
                        

                    if($resultado) {
                        echo json_encode("True");
                        $correoUser = $user['email'];
                        $cedula = $_POST["cedula"];
                        $data = "El usuario $correoUser Modificó el grupo estable del alumno: $cedula";
                        $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                        if($_POST["BDR"] != null)
                        $resultado = $connR->query($sql);
                        else
                        $resultado = $conn->query($sql);
                    } ;
                    if(!$resultado) echo json_encode("False");
                }

            break;

            case "Bitacora":
                                
                $sql = "SELECT * FROM bitacora ORDER BY id DESC LIMIT 300";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_all();
                else
                $resultado = $conn->query($sql)->fetch_all();
                echo json_encode($resultado);

            break;
            case "admin":
                                
                $sql = "SELECT * FROM usuarios WHERE `role`='admin' OR `role`='user'";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_all();
                else
                $resultado = $conn->query($sql)->fetch_all();
                echo json_encode($resultado);

            break;
            case "admin users":
                $userId = $_POST["userId"];
                $sql = "SELECT * FROM usuarios WHERE id='$userId'";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_assoc();
                else
                $resultado = $conn->query($sql)->fetch_assoc();
                $user = $resultado;

                if("superadmin" == $resultado["role"]){


                $id = $_POST["id"];
                $role = $_POST["role"];
                                
                $sql = "UPDATE usuarios SET `role`='$role' WHERE id='$id'";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql);
                else
                $resultado = $conn->query($sql);
                
                if($resultado) echo "True";
                if(!$resultado) echo "False";

                }
            break;

            case "find repitientes":
                $id = $_POST["cedula"];

                $sql = "SELECT repitiente FROM alumnos WHERE `cedula`=$id";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_object();
                else
                $resultado = $conn->query($sql)->fetch_object();
                echo json_encode($resultado);

            break;
            case "find periodo":
                $sql = "SELECT * FROM periodo ORDER BY ID DESC LIMIT 1";
                $resultado = $conn->query($sql)->fetch_assoc();
                echo $resultado['periodo'];
            break;
            case "find save":
                $periodo = date("Y")+1 ."-".date("Y")+2;
                $sql = "INSERT INTO periodo (`id`,`periodo`) VALUES (NULL,'$periodo')";
                $resultado = $conn->query($sql);
                $sql = "SELECT * FROM periodo ORDER BY ID DESC LIMIT 1";
                $resultado = $conn->query($sql)->fetch_assoc();
                $periodo = $resultado["periodo"];
   
                $sql= "UPDATE alumnos SET periodo='$periodo' WHERE  estado='cursando' OR estado='Repitiente'";
                $resultado = $conn->query($sql);
                echo $periodo;
            break;
            case "modifi repitiente":
                $userId = $_POST["userId"];
                $sql = "SELECT * FROM usuarios WHERE id='$userId'";
                if($_POST["BDR"] != null)
                $resultado = $connR->query($sql)->fetch_assoc();
                else
                $resultado = $conn->query($sql)->fetch_assoc();
                $user = $resultado;
                $fecha = $_POST["dateTime"];

                if("admin" == $resultado["role"] || "superadmin" == $resultado["role"]){

                    

                    $cedula = $_POST["cedula"];
                    $repitiente = $_POST["repitiente"];
                        
                    $sql = "UPDATE alumnos SET `repitiente`='$repitiente' WHERE cedula='$cedula'";
                    if($_POST["BDR"] != null)
                    $resultado = $connR->query($sql);
                    else
                    $resultado = $conn->query($sql);
                        

                    if($resultado) {
                        echo json_encode("True");
                        $correoUser = $user['email'];
                        $cedula = $_POST["cedula"];
                        $data = "El usuario $correoUser Modificó las áreas repitientes del alumno: $cedula";
                        $sql = "INSERT INTO bitacora (`id`,`reportes`,`dataTime`) VALUES (NULL,'$data','$fecha')";
                        $resultado = $conn->query($sql);
                    } ;
                    if(!$resultado) echo json_encode("False");
                }

            break;
        default:
            echo "Por favor, inicie sesión o recargue la página";
            break;
    }
    
}

?>