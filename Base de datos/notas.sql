-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-08-2021 a las 01:59:45
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
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
  `grupo_estable` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `cedula`, `cedula_escolar`, `nombre`, `apellido`, `sexo`, `fecha_de_nacimiento`, `edad`, `lugar_de_nacimiento`, `telefono`, `direccion`, `correo`, `ano`, `seccion`, `notas`, `estado`, `Representate`, `grupo_estable`) VALUES
(9, 27919047, 'V', 'MANUEL', 'PUENTE', 'Masculino', '2000-12-30', 20, 'Venezuela, Edo. Merida, Libertador ', 584247747455, 'merida ejido', 'manu@manu.com', 'segundo_año', 'A', 10, 'cursando', 9, 'Guitarra'),
(10, 27919048, 'V', 'SANTIAGO', 'FAYSAL', 'Masculino', '2000-12-20', 20, 'Venezuela, Edo. Merida,  ', 584247747455, 'merida ejido', 'manu@manu.com', 'quinto_año', 'A', 11, 'cursando', 10, 'pool dance'),
(11, 27113745, 'V', 'Manuel\n', 'Puente', 'Masculino', '2000-12-30', 20, 'Venezuela, Edo. Merida, Libertador ', 584247747455, 'merida ejido', 'manu@manu.com', 'quinto_año', 'A', 12, 'graduado', 11, 'pool dance'),
(12, 27919046, 'V', 'Manuel', 'Puente', 'Masculino', '2000-12-30', 20, 'Venezuela, Edo. Merida, Libertador ', 584247747455, 'merida ejido', 'manu@manu.com', 'primer_año', 'A', 13, 'repitiente', 12, 'pool dance'),
(13, 10719684, 'P', 'Midrey', 'Puente', 'Masculino', '1973-10-18', 47, 'Venezuela, Edo. Merida, Libertador ', 584247747455, 'merida ejido', 'manu@manu.com', 'primer_año', 'A', 14, 'repitiente', 13, 'pool dance');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarto_año`
--

CREATE TABLE `cuarto_año` (
  `id` int(11) NOT NULL,
  `Castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Inglés_y_otras_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Matemáticas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Educación_Física` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Física` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Química` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Biología` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Geografía_Historia_y_Ciudadanía` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Formación_para_la_Soberanía_Nacional` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Orientación_y_Convivencia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Participación_en_Grupos_de_Creacion_Recreación_y_Producción` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuarto_año`
--

INSERT INTO `cuarto_año` (`id`, `Castellano`, `Inglés_y_otras_lenguas_extranjeras`, `Matemáticas`, `Educación_Física`, `Física`, `Química`, `Biología`, `Geografía_Historia_y_Ciudadanía`, `Formación_para_la_Soberanía_Nacional`, `Orientación_y_Convivencia`, `Participación_en_Grupos_de_Creacion_Recreación_y_Producción`) VALUES
(1, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(2, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(3, '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `primer_año` int(11) DEFAULT NULL,
  `segundo_año` int(11) DEFAULT NULL,
  `tercer_año` int(11) DEFAULT NULL,
  `cuarto_año` int(11) DEFAULT NULL,
  `quinto_año` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `primer_año`, `segundo_año`, `tercer_año`, `cuarto_año`, `quinto_año`) VALUES
(1, 1, NULL, 1, NULL, NULL),
(2, 2, NULL, NULL, NULL, NULL),
(3, 3, NULL, NULL, NULL, 2),
(4, 4, NULL, NULL, NULL, NULL),
(5, 5, NULL, NULL, NULL, NULL),
(6, 6, NULL, NULL, NULL, NULL),
(7, 7, NULL, NULL, NULL, NULL),
(8, 8, NULL, NULL, NULL, NULL),
(9, 9, 1, 2, 1, 1),
(10, 10, 4, 3, 2, 3),
(11, 11, NULL, NULL, NULL, 4),
(12, 12, 3, 4, 3, 5),
(13, 13, NULL, NULL, NULL, NULL),
(14, 14, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `primer_año`
--

CREATE TABLE `primer_año` (
  `id` int(11) NOT NULL,
  `Castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Inglés_y_otras_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Matemáticas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Educación_Física` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Arte_y_Patrimonio` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Ciencias_Naturales` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Geografía_Historia_y_Ciudadanía` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Orientación_y_Convivencia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}',
  `Participación_en_Grupos_de_Creación_Recreación_y_Producción` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `primer_año`
--

INSERT INTO `primer_año` (`id`, `Castellano`, `Inglés_y_otras_lenguas_extranjeras`, `Matemáticas`, `Educación_Física`, `Arte_y_Patrimonio`, `Ciencias_Naturales`, `Geografía_Historia_y_Ciudadanía`, `Orientación_y_Convivencia`, `Participación_en_Grupos_de_Creación_Recreación_y_Producción`) VALUES
(1, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(2, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(3, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(4, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(5, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(6, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(7, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(8, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(9, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(10, '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}'),
(11, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(12, '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}'),
(13, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(14, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quinto_año`
--

CREATE TABLE `quinto_año` (
  `id` int(11) NOT NULL,
  `Castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Inglés_y_otras_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Matemáticas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Educación_Física` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Física` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Química` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Biología` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Ciencias_de_la_Tierra` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Geografía_Historia_y_Ciudadanía` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Formación_para_la_Soberanía_Nacional` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Orientación_y_Convivencia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Participación_en_Grupos_de_Creación_Recreación_y_Producción` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `quinto_año`
--

INSERT INTO `quinto_año` (`id`, `Castellano`, `Inglés_y_otras_lenguas_extranjeras`, `Matemáticas`, `Educación_Física`, `Física`, `Química`, `Biología`, `Ciencias_de_la_Tierra`, `Geografía_Historia_y_Ciudadanía`, `Formación_para_la_Soberanía_Nacional`, `Orientación_y_Convivencia`, `Participación_en_Grupos_de_Creación_Recreación_y_Producción`) VALUES
(1, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(2, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(3, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(4, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(5, '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representante`
--

CREATE TABLE `representante` (
  `id` int(11) NOT NULL,
  `cedula` int(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `filiacion` varchar(100) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `correo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `representante`
--

INSERT INTO `representante` (`id`, `cedula`, `nombre`, `apellido`, `sexo`, `filiacion`, `direccion`, `telefono`, `correo`) VALUES
(1, 27919047, 'Manuel\n', 'Puente', 'Masculino', 'Padre', 'merida ejido', 584247747455, 'manuel@manuel'),
(2, 27919047, 'MANUEL', 'PUENTE', 'Femenino', 'Padre', 'merida ejido', 584247747455, 'manu@manu'),
(3, 27919047, 'Manuel\n', 'Puente', 'Masculino', 'padre', 'merida ejido', 584247747455, 'manu@manu'),
(4, 27919048, 'MANUEL', 'PUENTE', 'Masculino', 'padre', 'merida ejido', 584247747455, 'manuel@manuel'),
(5, 27919047, 'MANUEL', 'PUENTE', 'Femenino', 'padre', 'merida ejido', 584247747455, 'manu@manu.com'),
(6, 279190478, 'Manuel\n', 'Puente', 'Masculino', 'padre', 'merida ejido', 584247747455, 'manu@manu'),
(7, 27919047, 'MANUEL', 'PUENTE', 'Femenino', 'padre', 'merida ejido', 584247747455, 'manu@manu'),
(8, 27919047, 'MANUEL', 'PUENTE', 'Masculino', 'padre', 'merida ejido', 584247747455, 'manu@manu'),
(9, 27919047, 'MANUEL', 'PUENTE', 'Masculino', 'padre', 'merida ejido', 584247747455, 'manu@manu'),
(10, 27919047, 'MANUEL', 'PUENTE', 'Masculino', '', 'merida ejido', 584247747455, 'manu@manu'),
(11, 27919047, 'Manuel\n', 'Puente', 'Masculino', 'padre', 'merida ejido', 584247747455, 'manu@manu'),
(12, 27919047, 'Manuel\n', 'Puente', 'Masculino', 'padre', 'merida ejido', 584247747455, 'manu@manu'),
(13, 27919047, 'Manuel\n', 'Puente', 'Masculino', 'padre', 'merida ejido', 584247747455, 'manu@manu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segundo_año`
--

CREATE TABLE `segundo_año` (
  `id` int(11) NOT NULL,
  `Castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Inglés_y_otras_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Matemáticas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Educación_Física` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Arte_y_Patrimonio` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Ciencias_Naturales` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Geografía_Historia_y_Ciudadanía` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Orientación_y_Convivencia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Participación_en_Grupos_de_Creación_Recreación_y_Producción` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `segundo_año`
--

INSERT INTO `segundo_año` (`id`, `Castellano`, `Inglés_y_otras_lenguas_extranjeras`, `Matemáticas`, `Educación_Física`, `Arte_y_Patrimonio`, `Ciencias_Naturales`, `Geografía_Historia_y_Ciudadanía`, `Orientación_y_Convivencia`, `Participación_en_Grupos_de_Creación_Recreación_y_Producción`) VALUES
(1, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(2, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(3, '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}'),
(4, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tercer_año`
--

CREATE TABLE `tercer_año` (
  `id` int(11) NOT NULL,
  `Castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Inglés_y_otras_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Matemáticas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Educación_Física` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Física` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Química` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Biología` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Geografía_Historia_y_Ciudadanía` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Orientación_y_Convivencia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Participación_en_Grupos_de_Creación_Recreación_y_Producción` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tercer_año`
--

INSERT INTO `tercer_año` (`id`, `Castellano`, `Inglés_y_otras_lenguas_extranjeras`, `Matemáticas`, `Educación_Física`, `Física`, `Química`, `Biología`, `Geografía_Historia_y_Ciudadanía`, `Orientación_y_Convivencia`, `Participación_en_Grupos_de_Creación_Recreación_y_Producción`) VALUES
(1, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(2, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(3, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(4, '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `role`) VALUES
(9, 'manuel\n', 'puente', 'manuelp1345@gmail.com', 'a334c357f06cc38c014f6fad7b9ea563f889a2015720de5b4d0b94bba0c7cd28106f297845453ce5abaea6ed69ec1c251eb6e2ea661fdda78546833b2c8c487b', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notas` (`notas`),
  ADD KEY `Representate` (`Representate`);

--
-- Indices de la tabla `cuarto_año`
--
ALTER TABLE `cuarto_año`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `primer_año` (`primer_año`),
  ADD KEY `segundo_año` (`segundo_año`),
  ADD KEY `tercer_año` (`tercer_año`),
  ADD KEY `cuarto_año` (`cuarto_año`),
  ADD KEY `quinto_año` (`quinto_año`);

--
-- Indices de la tabla `primer_año`
--
ALTER TABLE `primer_año`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `quinto_año`
--
ALTER TABLE `quinto_año`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `representante`
--
ALTER TABLE `representante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `segundo_año`
--
ALTER TABLE `segundo_año`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tercer_año`
--
ALTER TABLE `tercer_año`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cuarto_año`
--
ALTER TABLE `cuarto_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `primer_año`
--
ALTER TABLE `primer_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `quinto_año`
--
ALTER TABLE `quinto_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `representante`
--
ALTER TABLE `representante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `segundo_año`
--
ALTER TABLE `segundo_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tercer_año`
--
ALTER TABLE `tercer_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
