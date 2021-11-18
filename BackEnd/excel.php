<?php 
require '../vendor/autoload.php';
require_once "connect.php";

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
$spreadsheet =  \PhpOffice\PhpSpreadsheet\IOFactory::load('datos.xlsx');
$sheet = $spreadsheet->getActiveSheet();
$data = new stdClass();
$ano = $_POST["año"];
$seccion = "A";
$ano ="primer_año";
$cedula ="27919047";
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
    echo $representante["id"];
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
    $writer->save("Reporte de datos $añoexcel - $seccion.xlsx");
}

}






            

?>