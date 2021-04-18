<?php 

$conn = new mysqli("localhost","root","","notas");

if($conn->connect_error){
    echo $error->$conn->connect_error;
}


?>