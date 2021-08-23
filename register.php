<?php 
session_start();

if(isset($_SESSION["usuario"])){
    header("Location: index.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>U.E | Jose Enrique Arias |</title>
    <link rel="icon" href="img/logo.png" type="image/png" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>

<body class="bg-logo">
    
<div class="container login-c">
    <div class="row align-items-center justify-content-center">
        <div class="col col-lg-6">
            
            <h1>Sistema De Notas</h1>

            <h2>U.E | Jose Enrique Arias</h2>

            <form class="login">
                    <h3>Registrarse</h3>
                <div class="form-group my-2">
                    <input id="nombre" type="text" class="form-control" placeholder="Nombre">
                </div>
                <div class="form-group my-2">
                    <input id="apellido" type="text" class="form-control" placeholder="Apellido">
                </div>
                <div class="form-group my-2">
                    <input  placeholder="Correo@correo.com" type="email" class="form-control" data-toggle="tooltip" data-placement="right" title="Ingrese un correo electronico" id="email" aria-describedby="emailHelp">
                </div>
                <div class="form-group my-2">
                    <input  placeholder="Contraseña" type="password" class="form-control" id="password">
                </div>
                    <div class="alert alert-danger" role="alert"></div>
                    <div class="alert alert-success" role="alert"></div>
                <div class="form-btn">
                    <button id="btn-registro"  class="btn btn-primary btn-login">Registrarse</button>
                    <button id="btnL" class="btn btn-primary btn-login" >Ingresar</button>
                </div>

            </form>
        </div>


        </div>


</div>

<script src="js/login-register.js"></script>
<?php require "partials/footer.php" ?>