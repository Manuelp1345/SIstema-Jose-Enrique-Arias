
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>U.E | Jose Enrique Arias | </title>
    	
    <link rel="icon" href="img/logo.png" type="image/png" />
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
 
  
</head>

<body class=" col-12">
<div class="wrapper bg-primary">
    <!-- Sidebar -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <img class="logo" src="img/logo.png" alt="">
            <h3 class="text-center">| U.E | <br> Jose Enrique Arias</h3>
        </div>

        <ul class="list-unstyled components">
            <li >
                <a href="http://localhost/sistema/" >Inicio</a>
            </li>
            <li>
                <a href="#primer-año" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Primer Año</a>
                <ul class="collapse list-unstyled" id="primer-año">
                    <li>
                        <a onclick="seccionNav(1,'A')" >Seccion "A"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(1,'B')" >Seccion "B"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(1,'C')" >Seccion "C"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(1,'D')" >Seccion "D"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(1,'E')" >Seccion "E"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(1,'F')" >Seccion "F"</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#segundo-año" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Segundo Año</a>
                <ul class="collapse list-unstyled" id="segundo-año">
                    <li>
                        <a onclick="seccionNav(2,'A')" >Seccion "A"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(2,'B')" >Seccion "B"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(2,'C')" >Seccion "C"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(2,'D')" >Seccion "D"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(2,'E')" >Seccion "E"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(2,'F')" >Seccion "F"</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#tercer-año" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Tercer Año</a>
                <ul class="collapse list-unstyled" id="tercer-año">
                    <li>
                        <a onclick="seccionNav(3,'A')" >Seccion "A"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(3,'B')" >Seccion "B"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(3,'C')" >Seccion "C"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(3,'D')" >Seccion "D"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(3,'E')" >Seccion "E"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(3,'F')" >Seccion "F"</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#Cuarto-año" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Cuarto Año</a>
                <ul class="collapse list-unstyled" id="Cuarto-año">
                    <li>
                        <a onclick="seccionNav(4,'A')" >Seccion "A"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(4,'B')" >Seccion "B"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(4,'C')" >Seccion "C"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(4,'D')" >Seccion "D"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(4,'E')" >Seccion "E"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(4,'F')" >Seccion "F"</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#Quinto-año" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Quinto Año</a>
                <ul class="collapse list-unstyled" id="Quinto-año">
                    <li>
                        <a onclick="seccionNav(5,'A')" >Seccion "A"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(5,'B')" >Seccion "B"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(5,'C')" >Seccion "C"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(5,'D')" >Seccion "D"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(5,'E')" >Seccion "E"</a>
                    </li>
                    <li>
                        <a onclick="seccionNav(5,'F')" >Seccion "F"</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">Perfil</a>
            </li>
            <li>
                <a onclick="cerrar()" class="sesion" href="/login">Cerrar Sesion</a>
            </li>
        </ul>
    </nav>


</div>


