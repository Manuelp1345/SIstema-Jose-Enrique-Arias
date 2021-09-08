-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-09-2021 a las 15:54:35
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
  `cedula` bigint(15) NOT NULL,
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
  `grupo_estable` varchar(150) NOT NULL,
  `repitiente` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `cedula`, `cedula_escolar`, `nombre`, `apellido`, `sexo`, `fecha_de_nacimiento`, `edad`, `lugar_de_nacimiento`, `telefono`, `direccion`, `correo`, `ano`, `seccion`, `notas`, `estado`, `Representate`, `grupo_estable`, `repitiente`) VALUES
(1, 27919047, '', 'MANUEL', 'PUENTE', 'Masculino', '2000-12-20', 20, 'Venezuela, Edo. Merida, Libertador ', 584247747455, 'MERIDA EJIDO ALFREDO LARA CALLE 1', 'manu@manu.com', 'primer_año', 'A', 24, 'cursando', 23, 'pool dance', '[false,true,false,false,false,false,true,false,false,false,false,false,true,false]'),
(2, 27113028, '', 'santiago', 'faysal', 'Masculino', '2000-01-28', 21, 'Venezuela, Edo. Merida, Libertador ', 584247747455, 'merida ejido', 'manu@manu.com', 'primer_año', 'A', 25, 'repitiente', 24, 'pool dance', '[true,false,false,false,false,false,false,true,false,false,false,false,false,true]'),
(3, 10719684, '', 'Midrey', 'Puente', 'Femenino', '1985-09-18', 35, 'Venezuela, Edo. Merida, Libertador ', 584247747455, 'merida ejido', '', 'segundo_año', 'A', 26, 'repitiente', 25, 'pool dance', '[false,false,false,false,false,false,true,false,false,false,false,false,false,false]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL,
  `reportes` varchar(200) NOT NULL,
  `dataTime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `reportes`, `dataTime`) VALUES
(1, 'El usuario manuelp1345@gmail.com Ingreso al estudiante con la cedula 27919047 en primer_año Seccion A', 'Tue Sep 07 2021 23:34:41 GMT-0400 (hora de Venezuela)'),
(2, 'El usuario manuelp1345@gmail.com Ingreso al estudiante con la cedula 27113028 en primer_año Seccion A', 'Tue Sep 07 2021 23:35:36 GMT-0400 (hora de Venezuela)'),
(3, 'El usuario manuelp1345@gmail.com cambio la condicion del alumno: 27919047', 'Tue Sep 07 2021 23:35:47 GMT-0400 (hora de Venezuela)'),
(4, 'El usuario manuelp1345@gmail.com Ingreso al estudiante con la cedula 10719684 en primer_año Seccion A', 'Tue Sep 07 2021 23:38:18 GMT-0400 (hora de Venezuela)'),
(5, 'El usuario manuelp1345@gmail.com cambio la condicion del alumno: 10719684', 'Tue Sep 07 2021 23:38:29 GMT-0400 (hora de Venezuela)'),
(6, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Tue Sep 07 2021 23:38:36 GMT-0400 (hora de Venezuela)'),
(7, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Tue Sep 07 2021 23:38:38 GMT-0400 (hora de Venezuela)'),
(8, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Tue Sep 07 2021 23:38:44 GMT-0400 (hora de Venezuela)'),
(9, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Tue Sep 07 2021 23:38:45 GMT-0400 (hora de Venezuela)'),
(10, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Tue Sep 07 2021 23:41:07 GMT-0400 (hora de Venezuela)'),
(11, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Tue Sep 07 2021 23:41:07 GMT-0400 (hora de Venezuela)'),
(12, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Tue Sep 07 2021 23:41:09 GMT-0400 (hora de Venezuela)'),
(13, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Tue Sep 07 2021 23:41:09 GMT-0400 (hora de Venezuela)'),
(14, 'El usuario manuelp1345@gmail.com cambio la condicion del alumno: 27919047', 'Tue Sep 07 2021 23:43:47 GMT-0400 (hora de Venezuela)'),
(15, 'El usuario manuelp1345@gmail.com cambio la condicion del alumno: 27919047', 'Tue Sep 07 2021 23:43:52 GMT-0400 (hora de Venezuela)'),
(16, 'El usuario manuelp1345@gmail.com cambio la condicion del alumno: 27919047', 'Tue Sep 07 2021 23:43:56 GMT-0400 (hora de Venezuela)'),
(17, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Tue Sep 07 2021 23:50:18 GMT-0400 (hora de Venezuela)'),
(18, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Tue Sep 07 2021 23:50:19 GMT-0400 (hora de Venezuela)'),
(19, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Tue Sep 07 2021 23:50:19 GMT-0400 (hora de Venezuela)'),
(20, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Tue Sep 07 2021 23:50:24 GMT-0400 (hora de Venezuela)'),
(21, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Tue Sep 07 2021 23:50:28 GMT-0400 (hora de Venezuela)'),
(22, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Tue Sep 07 2021 23:50:35 GMT-0400 (hora de Venezuela)'),
(23, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Tue Sep 07 2021 23:52:29 GMT-0400 (hora de Venezuela)'),
(24, 'El usuario manuelp1345@gmail.com cambio la condicion del alumno: 27919047', 'Wed Sep 08 2021 00:04:19 GMT-0400 (hora de Venezuela)'),
(25, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Wed Sep 08 2021 00:04:20 GMT-0400 (hora de Venezuela)'),
(26, 'El usuario manuelp1345@gmail.com cambio la condicion del alumno: 27919047', 'Wed Sep 08 2021 00:04:22 GMT-0400 (hora de Venezuela)'),
(27, 'El usuario manuelp1345@gmail.com cambio la condicion del alumno: 27919047', 'Wed Sep 08 2021 00:04:25 GMT-0400 (hora de Venezuela)'),
(28, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Wed Sep 08 2021 00:04:28 GMT-0400 (hora de Venezuela)'),
(29, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Wed Sep 08 2021 00:04:28 GMT-0400 (hora de Venezuela)'),
(30, 'El usuario manuelp1345@gmail.com cambio la condicion del alumno: 27919047', 'Wed Sep 08 2021 00:04:29 GMT-0400 (hora de Venezuela)'),
(31, 'El usuario manuelp1345@gmail.com cambio la condicion del alumno: 27919047', 'Wed Sep 08 2021 00:06:16 GMT-0400 (hora de Venezuela)'),
(32, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Wed Sep 08 2021 00:06:22 GMT-0400 (hora de Venezuela)'),
(33, 'El usuario manuelp1345@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Wed Sep 08 2021 00:06:25 GMT-0400 (hora de Venezuela)'),
(34, 'El usuario laultimadesantiago@gmail.com Modifico las areas repitientes del alumno: 27919047', 'Wed Sep 08 2021 00:23:16 GMT-0400 (hora de Venezuela)'),
(35, 'El usuario laultimadesantiago@gmail.com cambio la condicion del alumno: 27919047', 'Wed Sep 08 2021 00:23:21 GMT-0400 (hora de Venezuela)'),
(36, 'El usuario laultimadesantiago@gmail.com cambio la condicion del alumno: 27919047', 'Wed Sep 08 2021 00:23:23 GMT-0400 (hora de Venezuela)'),
(37, 'El usuario laultimadesantiago@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Wed Sep 08 2021 09:09:13 GMT-0400 (hora de Venezuela)'),
(38, 'El usuario laultimadesantiago@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Wed Sep 08 2021 09:09:15 GMT-0400 (hora de Venezuela)'),
(39, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Castellano (Primer lapso: 20, Segundo lapso: 20, Tercer lapso: 20) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:09:25 GMT-0400 (hora de Venezuela)'),
(40, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Inglés_y_otras_lenguas_extranjeras (Primer lapso: 20, Segundo lapso: 15, Tercer lapso: 13) del alumno con el numero de cedula: 107', 'Wed Sep 08 2021 09:09:33 GMT-0400 (hora de Venezuela)'),
(41, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Matemáticas (Primer lapso: 15, Segundo lapso: 14, Tercer lapso: 19) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:09:41 GMT-0400 (hora de Venezuela)'),
(42, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Educación_Física (Primer lapso: 15, Segundo lapso: 19, Tercer lapso: 11) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:09:52 GMT-0400 (hora de Venezuela)'),
(43, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Arte_y_Patrimonio (Primer lapso: 20, Segundo lapso: 05, Tercer lapso: 05) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:10:02 GMT-0400 (hora de Venezuela)'),
(44, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Ciencias_Naturales (Primer lapso: 15, Segundo lapso: 5, Tercer lapso: 5) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:10:12 GMT-0400 (hora de Venezuela)'),
(45, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Ciencias_Naturales (Primer lapso: 15, Segundo lapso: 15, Tercer lapso: 5) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:10:19 GMT-0400 (hora de Venezuela)'),
(46, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Geografía_Historia_y_Ciudadanía (Primer lapso: 15, Segundo lapso: 20, Tercer lapso: 20) del alumno con el numero de cedula: 107196', 'Wed Sep 08 2021 09:10:27 GMT-0400 (hora de Venezuela)'),
(47, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Geografía_Historia_y_Ciudadanía (Primer lapso: 15, Segundo lapso: 20, Tercer lapso: 0) del alumno con el numero de cedula: 1071968', 'Wed Sep 08 2021 09:10:33 GMT-0400 (hora de Venezuela)'),
(48, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Geografía_Historia_y_Ciudadanía (Primer lapso: 15, Segundo lapso: 10, Tercer lapso: 0) del alumno con el numero de cedula: 1071968', 'Wed Sep 08 2021 09:10:40 GMT-0400 (hora de Venezuela)'),
(49, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Geografía_Historia_y_Ciudadanía (Primer lapso: 15, Segundo lapso: 10, Tercer lapso: 10) del alumno con el numero de cedula: 107196', 'Wed Sep 08 2021 09:11:04 GMT-0400 (hora de Venezuela)'),
(50, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Arte_y_Patrimonio (Primer lapso: 20, Segundo lapso: 5, Tercer lapso: 6) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:11:36 GMT-0400 (hora de Venezuela)'),
(51, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Arte_y_Patrimonio (Primer lapso: 20, Segundo lapso: 6, Tercer lapso: 6) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:11:43 GMT-0400 (hora de Venezuela)'),
(52, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Arte_y_Patrimonio (Primer lapso: 20, Segundo lapso: 8, Tercer lapso: 6) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:11:48 GMT-0400 (hora de Venezuela)'),
(53, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Orientación_y_Convivencia (Primer lapso: 20, Segundo lapso: 20, Tercer lapso: 20) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:12:09 GMT-0400 (hora de Venezuela)'),
(54, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Participación_en_Grupos_de_Creación_Recreación_y_Producción (Primer lapso: 20, Segundo lapso: 20, Tercer lapso: 20) del alumno con', 'Wed Sep 08 2021 09:12:25 GMT-0400 (hora de Venezuela)'),
(55, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Participación_en_Grupos_de_Creación_Recreación_y_Producción (Primer lapso: 0, Segundo lapso: 0, Tercer lapso: 0) del alumno con el', 'Wed Sep 08 2021 09:14:46 GMT-0400 (hora de Venezuela)'),
(56, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Orientación_y_Convivencia (Primer lapso: 0, Segundo lapso: 0, Tercer lapso: 0) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:14:50 GMT-0400 (hora de Venezuela)'),
(57, 'El usuario laultimadesantiago@gmail.com Modifico y/o ingreso notas de Arte_y_Patrimonio (Primer lapso: 20, Segundo lapso: 5, Tercer lapso: 5) del alumno con el numero de cedula: 10719684', 'Wed Sep 08 2021 09:14:55 GMT-0400 (hora de Venezuela)'),
(58, 'El usuario laultimadesantiago@gmail.com paso de año a: primer_año seccion A', 'Wed Sep 08 2021 09:15:49 GMT-0400 (hora de Venezuela)'),
(59, 'El usuario laultimadesantiago@gmail.com cambio la condicion del alumno: 10719684', 'Wed Sep 08 2021 09:16:01 GMT-0400 (hora de Venezuela)'),
(60, 'El usuario laultimadesantiago@gmail.com cambio la condicion del alumno: 10719684', 'Wed Sep 08 2021 09:16:04 GMT-0400 (hora de Venezuela)'),
(61, 'El usuario laultimadesantiago@gmail.com cambio la condicion del alumno: 27919047', 'Wed Sep 08 2021 09:40:10 GMT-0400 (hora de Venezuela)'),
(62, 'El usuario laultimadesantiago@gmail.com cambio la condicion del alumno: 10719684', 'Wed Sep 08 2021 09:47:34 GMT-0400 (hora de Venezuela)'),
(63, 'El usuario laultimadesantiago@gmail.com Modifico las areas repitientes del alumno: 10719684', 'Wed Sep 08 2021 09:47:36 GMT-0400 (hora de Venezuela)');

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
(24, 24, NULL, NULL, NULL, NULL),
(25, 25, NULL, NULL, NULL, NULL),
(26, 26, 8, NULL, NULL, NULL);

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
(24, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(25, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(26, '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"13\",\"ap\":1}', '{\"primer_lapso\":\"15\",\"segundo_lapso\":\"14\",\"tercer_lapso\":\"19\",\"ap\":1}', '{\"primer_lapso\":\"15\",\"segundo_lapso\":\"19\",\"tercer_lapso\":\"11\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"5\",\"tercer_lapso\":\"5\",\"ap\":1}', '{\"primer_lapso\":\"15\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"5\",\"ap\":1}', '{\"primer_lapso\":\"15\",\"segundo_lapso\":\"10\",\"tercer_lapso\":\"10\",\"ap\":1}', '{\"primer_lapso\":\"0\",\"segundo_lapso\":\"0\",\"tercer_lapso\":\"0\",\"ap\":0}', '{\"primer_lapso\":\"0\",\"segundo_lapso\":\"0\",\"tercer_lapso\":\"0\",\"ap\":0}');

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
(23, 27113028, 'santiago', 'faysal', 'Masculino', 'padre', 'merida ejido', 584247747455, ''),
(24, 27919047, 'santiago', 'faysal', 'Masculino', 'padre', 'merida ejido', 584247747455, 'manu@manu'),
(25, 27919047, 'Manuel\n', 'Puente', 'Masculino', 'padre', 'merida ejido', 584247747455, 'manu@manu');

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
(8, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	');

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
(1, 'manuel\n', 'puente', 'manuelp1345@gmail.com', 'a334c357f06cc38c014f6fad7b9ea563f889a2015720de5b4d0b94bba0c7cd28106f297845453ce5abaea6ed69ec1c251eb6e2ea661fdda78546833b2c8c487b', 'superadmin'),
(2, 'santiago', 'faysal', 'laultimadesantiago@gmail.com', 'a334c357f06cc38c014f6fad7b9ea563f889a2015720de5b4d0b94bba0c7cd28106f297845453ce5abaea6ed69ec1c251eb6e2ea661fdda78546833b2c8c487b', 'admin');

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
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `cuarto_año`
--
ALTER TABLE `cuarto_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `primer_año`
--
ALTER TABLE `primer_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `quinto_año`
--
ALTER TABLE `quinto_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `representante`
--
ALTER TABLE `representante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `segundo_año`
--
ALTER TABLE `segundo_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tercer_año`
--
ALTER TABLE `tercer_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
