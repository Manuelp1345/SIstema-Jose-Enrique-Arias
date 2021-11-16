<?php 
require '../vendor/autoload.php';
require_once "connect.php";

$data = new stdClass();
$ano ="primer_año";
$cedula ="27919047";
$sql = "SELECT * FROM alumnos WHERE cedula='$cedula'";
$resultado = $conn->query($sql)->fetch_object();

$data->alumno=$resultado;

$representante = $resultado->Representate;

$sql2 = "SELECT * FROM representante WHERE id='$representante'";
$resultado2 = $conn->query($sql2)->fetch_object();

$data->representante=$resultado2;

$notasClient = $data->alumno->notas;

$sql = "SELECT * FROM notas WHERE id = '$notasClient'";
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

count($notas) ;

$añoexcel = "";

if($data->alumno->ano == "primer_año") $añoexcel = "PRIMER AÑO";

$añoSeccion =  $añoexcel." ". $data->alumno->seccion;

$nombreApellido= $data->alumno->apellido." ".$data->alumno->nombre;
$lugarNacimiento= $data->alumno->lugar_de_nacimiento;
$fechaNacimiento= $data->alumno->fecha_de_nacimiento;
$periodo = $data->alumno->periodo;

$indexNotas = 14;
$aux = 0;
$momento = 1;
$date = new DateTime();
$date =$date->format('d')-1 ."-".$date->format('m-Y');

if(json_decode($notas["CASTELLANO"])->segundo_lapso > 0){
    $momento = 2;
}
if(json_decode($notas["CASTELLANO"])->tercer_lapso > 0){
    $momento = 3;
}
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

unset($notas["id"]);
$spreadsheet =  \PhpOffice\PhpSpreadsheet\IOFactory::load('template.xlsx');
$sheet = $spreadsheet->getActiveSheet();
$sheet->setTitle("Notas");
$sheet->setCellValue('J1', $date);
$sheet->setCellValue('E9', "MOMENTO ESCOLAR: $momento");
$sheet->setCellValue('I9', "AÑO ESCOLAR: $periodo");
$sheet->setCellValue('A9', "AÑO Y SECCIÓN DE ESTUDIO: $añoSeccion");
$sheet->setCellValue('A10', "CEDULA O IDENTIFICACION: $cedula");
$sheet->setCellValue('E10', "APELLIDOS Y NOMBRES: $nombreApellido");
$sheet->setCellValue('A11', "LUGAR DE NACIMIENTO: $lugarNacimiento");
$sheet->setCellValue('J11', "FECHA DE NACIMIENTO: $fechaNacimiento");
foreach($notas as $key => $value){
    $sheet->setCellValue('A'.$indexNotas,strtoupper( str_replace("_", " ", $key)));
    $sheet->setCellValue('D'.$indexNotas, intval(json_decode($notas[$key])->primer_lapso));
    $sheet->setCellValue('E'.$indexNotas, intval(json_decode($notas[$key])->segundo_lapso));
    $sheet->setCellValue('F'.$indexNotas, intval(json_decode($notas[$key])->tercer_lapso));
    $sheet->setCellValue('G'.$indexNotas, intval(json_decode($notas[$key])->revision));
    if(intval(json_decode($notas[$key])->revision )>0 && $momento == 3){
        $sheet->setCellValue('H'.$indexNotas, "=(D$indexNotas+E$indexNotas+G$indexNotas)/3");
    }else{
        $sheet->setCellValue('H'.$indexNotas, "=(D$indexNotas+E$indexNotas+F$indexNotas)/3");
    }
    $indexNotas++;
    $aux++;
}
$sheet->getStyle('A13:J13')->getFill()
    ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
    ->getStartColor()->setRGB('595959');
$sheet->getStyle('A13:J13')->getFont()->getColor()->setRGB('ffffff');;

$sheet->getStyle('A8:J8')->getFill()
    ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
    ->getStartColor()->setRGB('595959');
$sheet->getStyle('A8:J8')->getFont()->getColor()->setRGB('ffffff');;


$indexNotas--;

$sheet->setCellValue('J14', "=ROUND(SUM(D14:D$indexNotas)/$aux,2)");
if($momento >= 2)
    $sheet->setCellValue('J15', "=ROUND(SUM(E14:E$indexNotas)/$aux,2)");
if($momento == 3){
    $sheet->setCellValue('J16', "=ROUND(SUM(F14:F$indexNotas)/$aux,2)");
    $sheet->setCellValue('J17', "=ROUND(SUM(J14:J16)/3,2)");
}

$writer = new Xlsx($spreadsheet);

$writer->save("Boletin $nombreApellido CI $cedula.xlsx");


?>