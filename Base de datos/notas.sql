-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-06-2021 a las 17:39:32
-- Versión del servidor: 8.0.13-4
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `4ETEgAryB2`
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
  `Representate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `cedula`, `cedula_escolar`, `nombre`, `apellido`, `sexo`, `fecha_de_nacimiento`, `edad`, `lugar_de_nacimiento`, `telefono`, `direccion`, `correo`, `ano`, `seccion`, `notas`, `estado`, `Representate`) VALUES
(2, 27919047, 'false', 'MANUEL', 'PUENTE', 'Masculino', '2000-12-30', 20, 'Merida, Merida Hula', 4247747455, 'merida ejido', 'correo@correo.com', 'tercer_año', 'A', 1, 'retirado', 1),
(3, 27919048, 'false', 'Manuel alejandro', 'Puente Puente', 'Masculino', '2000-12-30', 20, 'Pues en un hosptial', 4247747455, 'al lado de mi vecino', 'correo@correo.com', 'quinto_año', 'A', 2, 'graduado', 2),
(4, 27113729, 'false', 'SANTIAGO', 'FAYSAL', 'Masculino', '2000-01-21', 21, 'Hospital', 584249023464, 'aqui', 'hola@gmail.com', 'quinto_año', 'A', 3, 'cursando', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarto_año`
--

CREATE TABLE `cuarto_año` (
  `id` int(11) NOT NULL,
  `Castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Biologia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Quimica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Formación_para_la_Soberanía_Nacional` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Educacion_Fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Geografía_Historia_y_Ciudadanía` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Inglés_y_otras_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Matematicas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Orientación_y_Convivencia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `Participación_en_Grupos_de_Creación_Recreación_y_Producción` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cuarto_año`
--

INSERT INTO `cuarto_año` (`id`, `Castellano`, `Biologia`, `Fisica`, `Quimica`, `Formación_para_la_Soberanía_Nacional`, `Educacion_Fisica`, `Geografía_Historia_y_Ciudadanía`, `Inglés_y_otras_lenguas_extranjeras`, `Matematicas`, `Orientación_y_Convivencia`, `Participación_en_Grupos_de_Creación_Recreación_y_Producción`) VALUES
(1, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":\"0\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"0\",\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":\"0\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"0\",\"ap\":0}'),
(2, '{\"primer_lapso\":\"020\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"18\",\"segundo_lapso\":\"18\",\"tercer_lapso\":\"18\",\"ap\":1}', '{\"primer_lapso\":\"17\",\"segundo_lapso\":\"17\",\"tercer_lapso\":\"17\",\"ap\":1}', '{\"primer_lapso\":\"19\",\"segundo_lapso\":\"19\",\"tercer_lapso\":\"19\",\"ap\":1}', '{\"primer_lapso\":\"11\",\"segundo_lapso\":\"11\",\"tercer_lapso\":\"11\",\"ap\":1}', '{\"primer_lapso\":\"13\",\"segundo_lapso\":\"13\",\"tercer_lapso\":\"13\",\"ap\":1}', '{\"primer_lapso\":\"16\",\"segundo_lapso\":\"16\",\"tercer_lapso\":\"16\",\"ap\":1}', '{\"primer_lapso\":\"12\",\"segundo_lapso\":\"12\",\"tercer_lapso\":\"12\",\"ap\":1}', '{\"primer_lapso\":\"19\",\"segundo_lapso\":\"19\",\"tercer_lapso\":\"19\",\"ap\":1}', '{\"primer_lapso\":\"0\",\"segundo_lapso\":\"10\",\"tercer_lapso\":\"0\",\"ap\":0}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `direccion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `primer_año`, `segundo_año`, `tercer_año`, `cuarto_año`, `quinto_año`) VALUES
(1, 1, 2, 1, NULL, NULL),
(2, 2, 3, 2, 1, 1),
(3, 3, 7, NULL, 2, 3);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `primer_año`
--

INSERT INTO `primer_año` (`id`, `Castellano`, `Inglés_y_otras_lenguas_extranjeras`, `Matemáticas`, `Educación_Física`, `Arte_y_Patrimonio`, `Ciencias_Naturales`, `Geografía_Historia_y_Ciudadanía`, `Orientación_y_Convivencia`, `Participación_en_Grupos_de_Creación_Recreación_y_Producción`) VALUES
(1, '{\"primer_lapso\":\"10\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"10\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"10\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"10\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"10\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"10\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"10\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"10\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"10\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"15\",\"ap\":1}'),
(2, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}'),
(3, '{\"primer_lapso\":\"015\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"15\",\"ap\":1}', '{\"primer_lapso\":\"020\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"15\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"15\",\"ap\":1}', '{\"primer_lapso\":\"18\",\"segundo_lapso\":\"18\",\"tercer_lapso\":\"18\",\"ap\":1}', '{\"primer_lapso\":\"10\",\"segundo_lapso\":\"10\",\"tercer_lapso\":\"10\",\"ap\":1}', '{\"primer_lapso\":\"0\",\"segundo_lapso\":\"0\",\"tercer_lapso\":\"0\",\"ap\":0}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quinto_año`
--

CREATE TABLE `quinto_año` (
  `id` int(11) NOT NULL,
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
  `grupos_creacion_recreacion_produccion` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `quinto_año`
--

INSERT INTO `quinto_año` (`id`, `castellano`, `biologia`, `fisica`, `quimica`, `ciencias_tierra`, `formacion_soberania_nacional`, `educacion_fisica`, `geografia_historia_ciudadania`, `ingles_lenguas_extranjeras`, `matematicas`, `orientacion_convivencias`, `grupos_creacion_recreacion_produccion`) VALUES
(1, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(2, '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"18\",\"segundo_lapso\":\"18\",\"tercer_lapso\":\"18\",\"ap\":1}', '{\"primer_lapso\":\"18\",\"segundo_lapso\":\"18\",\"tercer_lapso\":\"18\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"015\",\"tercer_lapso\":\"15\",\"ap\":1}', '{\"primer_lapso\":\"18\",\"segundo_lapso\":\"18\",\"tercer_lapso\":\"18\",\"ap\":1}', '{\"primer_lapso\":\"15\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"15\",\"ap\":1}', '{\"primer_lapso\":\"17\",\"segundo_lapso\":\"17\",\"tercer_lapso\":\"17\",\"ap\":1}', '{\"primer_lapso\":\"19\",\"segundo_lapso\":\"19\",\"tercer_lapso\":\"19\",\"ap\":1}', '{\"primer_lapso\":\"10\",\"segundo_lapso\":\"10\",\"tercer_lapso\":\"10\",\"ap\":1}', '{\"primer_lapso\":\"14\",\"segundo_lapso\":\"14\",\"tercer_lapso\":\"14\",\"ap\":1}', '{\"primer_lapso\":\"16\",\"segundo_lapso\":\"16\",\"tercer_lapso\":\"16\",\"ap\":1}', '{\"primer_lapso\":\"015\",\"segundo_lapso\":\"15\",\"tercer_lapso\":\"15\",\"ap\":1}'),
(3, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	');

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
(1, 10719684, 'MIDREY', 'PUENTE', 'Femenino', 'Madre', 'merida ejido', 4247747455, 'correo@correo.com'),
(2, 10719684, 'Midrey', 'Puente', 'Masculino', 'Madre', 'frente a mi a otro vecino', 4247747455, 'correo@correo.com'),
(3, 27113729, 'MAMÁ', 'DE SANTIAGO', 'Femenino', 'Hija', 'su casa', 4249023464, 'adios@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segundo_año`
--

CREATE TABLE `segundo_año` (
  `id` int(11) NOT NULL,
  `arte_patrimonio` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `ciencias_naturales` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `educacion_fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `geografia_historia_ciudadania` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `ingles_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `matematicas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `orientacion_convivencias` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `grupos_creacion_recreacion_produccion` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `segundo_año`
--

INSERT INTO `segundo_año` (`id`, `arte_patrimonio`, `castellano`, `ciencias_naturales`, `educacion_fisica`, `geografia_historia_ciudadania`, `ingles_lenguas_extranjeras`, `matematicas`, `orientacion_convivencias`, `grupos_creacion_recreacion_produccion`) VALUES
(1, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(2, '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}'),
(3, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(4, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(5, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(6, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(7, '{\"primer_lapso\":\"20\",\"segundo_lapso\":\"20\",\"tercer_lapso\":\"20\",\"ap\":1}', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tercer_año`
--

CREATE TABLE `tercer_año` (
  `id` int(11) NOT NULL,
  `castellano` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `biologia` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `quimica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `educacion_fisica` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `geografia_historia_ciudadania` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `ingles_lenguas_extranjeras` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `matematicas` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `orientacion_convivencias` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	',
  `grupos_creacion_recreacion_produccion` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"ap":0}	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tercer_año`
--

INSERT INTO `tercer_año` (`id`, `castellano`, `biologia`, `fisica`, `quimica`, `educacion_fisica`, `geografia_historia_ciudadania`, `ingles_lenguas_extranjeras`, `matematicas`, `orientacion_convivencias`, `grupos_creacion_recreacion_produccion`) VALUES
(1, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	'),
(2, '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	', '{\"primer_lapso\":0,\"segundo_lapso\":0,\"tercer_lapso\":0,\"ap\":0}	');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cuarto_año`
--
ALTER TABLE `cuarto_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `primer_año`
--
ALTER TABLE `primer_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `quinto_año`
--
ALTER TABLE `quinto_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `representante`
--
ALTER TABLE `representante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `segundo_año`
--
ALTER TABLE `segundo_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tercer_año`
--
ALTER TABLE `tercer_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `notasAlumnos` FOREIGN KEY (`notas`) REFERENCES `notas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `representante` FOREIGN KEY (`Representate`) REFERENCES `representante` (`id`) ON UPDATE CASCADE;

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
