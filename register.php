<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/main.css">
</head>


<div class="container login-c">
    <div class="row align-items-center justify-content-center">
        <div class="col col-lg-6">
            
            <h1>Sistema De Notas</h1>

            <h2>U.E | Jose Enrique Arias</h2>

            <form action="/" class="login">
                    <h3>Registrarse</h3>
                <div class="form-row">
                    <div class="col">
                    <input id="nombre" type="text" class="form-control" placeholder="Nombre">
                    </div>
                    <div class="col">
                    <input id="apelldio" type="text" class="form-control" placeholder="Apellido">
                    </div>
                </div>
                <div class="form-group">
                    <input  placeholder="Correo@correo.com" type="email" class="form-control" data-toggle="tooltip" data-placement="right" title="Ingrese un correo electronico" id="email" aria-describedby="emailHelp">
                </div>
                <div class="form-group">
                    <input  placeholder="Contraseña" type="password" class="form-control" id="password">
                </div>
                <div class="alert alert-danger" role="alert"></div>
                <div class="alert alert-success" role="alert"></div>
                <div class="form-btn">
                    <button  onclick="register()" class="btn btn-primary btn-login">Registrarse</button>
                    <button type="submit" onclick="window.location = '/login'" class="btn btn-primary btn-login" >Ingresar</button>
                </div>

            </form>
        </div>


        </div>


</div>


{{> footer}}
