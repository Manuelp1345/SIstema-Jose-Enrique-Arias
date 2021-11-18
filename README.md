<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="img/logo.png" alt="Project logo"></a>
</p>

<h3 align="center">Sistema de notas automatizado para la U.E José Enrique Arias</h3>

---

<p align="center"> Descripción
    <br> 
Sistema de notas automatizado para la unidad educativa José enrique arias, control de notas
</p>

## 🧐 Acerca del sistema

El sistema esta desarrollado con PHP, MYSQL, HTML, BootsTrap 5 y JavaScript. El sistema estándar diseñado
para llevar un control de las notas de los alumnos ayudando al área administrativa con su trabajo del día a día

- [Demo del sistema](https://jose-enrique-arias-pruebas.000webhostapp.com/sistema/)

## 🏁 Para Empezar

Estas instrucciones le proporcionarán una copia del proyecto en funcionamiento en su máquina local con fines de desarrollo y prueba.

### Prerrequisitos

Debes descargar e instalar Xampp, es un paquete de software libre, que consiste principalmente en el sistema de gestión de bases de datos MySQL, el servidor web Apache y los intérpretes para lenguajes de script PHP y Perl.

Xampp nos ayudara a montar un servidor local en nuestro equipo para poder utilizar el sistema

```
https://www.apachefriends.org/es/download.html#
```

### Instalación

Una vez instalado Xampp debemos descargar el proyecto de git

```
https://github.com/Manuelp1345/SIstema-Jose-Enrique-Arias.git
```

Dicho proyecto lo colocaremos en la siguiente dirección. (Esta es creada por Xampp al instalarse)

```
C:\xampp\htdocs
```

Luego ejecutamos Xampp e iniciamos los servicios de APACHE y MySQL y nos dirigimos al siguiente url

```
http://localhost/phpmyadmin/
```

Una vez en la url crearemos una nueva base de datos e importamos el archivo SQL que se encuentra en la carpeta "Base de datos" en el proyecto que descargamos.

Ahora debemos conectar la base de datos, para ellos vamos al archivo connect.php que se encuentra en la carpeta BackEnd del proyecto.

```
C:\xampp\htdocs\sistema\BackEnd
```

dentro del archivo debemos colocar las credenciales de la base de datos. Si tienes la instalación en limpio de Xampp dichas credenciales son:<br><br>
Host: localhost<br><br>
Usuario: root<br><br>
Contraseña: "Dejar vacío"<br><br>
Base de datos: "Nombre de la base de datos creada"

Una vez hecho esto el sistema está listo para utilizarse

## 🎈 cómo usar el sistema.

Para comenzar a utilizar el sistema debemos ejecutar Xampp e iniciar los servicios de apache y MySQL

Ahora debemos Dirigirnos al siguiente url

```
http://localhost/sistema/
```

## 🚀 Desarrollado

El sistema fue desarrollado por estudiantes de la Universidad Politécnica Territorial de Mérida (UPTM)

Daniel Hernández `Tester`<br>
Sergio Castro `Tester `<br>
Santiago Faysal `Jefe de proyecto`<br>
Manuel Puente `Programador`

## ⛏️ Desarrollado

- [Xampp](https://www.apachefriends.org/es/download.html#) - Paquete de Servicios para Host local
- [MySQL](https://www.mysql.com) - Base de datos
- [PHP](https://www.php.net/) - Lenguaje de servidor
- [Bootstrap 5](https://getbootstrap.com/) - Maquetación

## ✍️ Autores

Daniel Hernández `Tester`<br>
Sergio Castro `Tester `<br>
Santiago Faysal `Jefe de proyecto`<br>
Manuel Puente `Programador`
