-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2021 a las 15:17:43
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `notas`
--
CREATE DATABASE IF NOT EXISTS `notas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `notas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(10) NOT NULL,
  `cedula_escolar` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `sexo` varchar(15) NOT NULL,
  `fecha_de_nacimiento` varchar(20) NOT NULL,
  `edad` int(2) NOT NULL,
  `lugar_de_nacimiento` varchar(250) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `ano` varchar(50) NOT NULL,
  `seccion` varchar(50) NOT NULL,
  `notas` int(11) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `Representate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notas` (`notas`),
  KEY `Representate` (`Representate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarto_año`
--

CREATE TABLE IF NOT EXISTS `cuarto_año` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Biologia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Quimica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Formación_para_la_Soberanía_Nacional` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Educacion_Fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Geografía_Historia_y_Ciudadanía` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Inglés_y_otras_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Matematicas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Orientación_y_Convivencia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Participación_en_Grupos_de_Creacion_Recreación_y_Producción` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE IF NOT EXISTS `docentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE IF NOT EXISTS `notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primer_año` int(11) DEFAULT NULL,
  `segundo_año` int(11) DEFAULT NULL,
  `tercer_año` int(11) DEFAULT NULL,
  `cuarto_año` int(11) DEFAULT NULL,
  `quinto_año` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `primer_año` (`primer_año`),
  KEY `segundo_año` (`segundo_año`),
  KEY `tercer_año` (`tercer_año`),
  KEY `cuarto_año` (`cuarto_año`),
  KEY `quinto_año` (`quinto_año`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `primer_año`
--

CREATE TABLE IF NOT EXISTS `primer_año` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Inglés_y_otras_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Matemáticas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Educación_Física` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Arte_y_Patrimonio` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Ciencias_Naturales` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Geografía_Historia_y_Ciudadanía` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Orientación_y_Convivencia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Participación_en_Grupos_de_Creación_Recreación_y_Producción` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quinto_año`
--

CREATE TABLE IF NOT EXISTS `quinto_año` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `biologia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `quimica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `ciencias_tierra` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `formacion_soberania_nacional` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `educacion_fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `geografia_historia_ciudadania` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `ingles_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `matematicas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `orientacion_convivencias` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `grupos_creacion_recreacion_produccion` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representante`
--

CREATE TABLE IF NOT EXISTS `representante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `filiacion` varchar(100) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `correo` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segundo_año`
--

CREATE TABLE IF NOT EXISTS `segundo_año` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arte_patrimonio` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `ciencias_naturales` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `educacion_fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `geografia_historia_ciudadania` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `ingles_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `matematicas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `orientacion_convivencias` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `grupos_creacion_recreacion_produccion` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tercer_año`
--

CREATE TABLE IF NOT EXISTS `tercer_año` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `biologia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `quimica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `educacion_fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `geografia_historia_ciudadania` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `ingles_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `matematicas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `orientacion_convivencias` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `grupos_creacion_recreacion_produccion` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `notasAlumnos` FOREIGN KEY (`notas`) REFERENCES `notas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `representante` FOREIGN KEY (`Representate`) REFERENCES `representante` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`primer_año`) REFERENCES `primer_año` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`segundo_año`) REFERENCES `segundo_año` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_ibfk_3` FOREIGN KEY (`tercer_año`) REFERENCES `tercer_año` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_ibfk_4` FOREIGN KEY (`cuarto_año`) REFERENCES `cuarto_año` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_ibfk_5` FOREIGN KEY (`quinto_año`) REFERENCES `quinto_año` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
