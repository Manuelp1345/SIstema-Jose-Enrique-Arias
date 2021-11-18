-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2021 a las 09:31:46
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

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
  `repitiente` varchar(250) DEFAULT NULL,
  `periodo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL,
  `reportes` varchar(200) NOT NULL,
  `dataTime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarto_año`
--

CREATE TABLE `cuarto_año` (
  `id` int(11) NOT NULL,
  `CASTELLANO` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `INGLÉS_Y_OTRAS_LENGUAS_EXTRANJERAS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `MATEMÁTICAS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `EDUCACIÓN_FÍSICA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `FÍSICA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `QUÍMICA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `BIOLOGÍA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `GEOGRAFÍA_HISTORIA_Y_CIUDADANÍA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `FORMACIÓN_PARA_LA_SOBERANÍA_NACIONAL` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `ORIENTACIÓN_Y_CONVIVENCIA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `PARTICIPACIÓN_EN_GRUPOS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}'
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `id` int(11) NOT NULL,
  `periodo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`id`, `periodo`) VALUES
(1, '2021-2022');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `primer_año`
--

CREATE TABLE `primer_año` (
  `id` int(11) NOT NULL,
  `CASTELLANO` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `INGLÉS_Y_OTRAS_LENGUAS_EXTRANJERAS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `MATEMÁTICAS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `EDUCACIÓN_FÍSICA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `ARTE_Y_PATRIMONIO` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `CIENCIAS_NATURALES` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `GEOGRAFÍA_HISTORIA_Y_CIUDADANÍA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `ORIENTACIÓN_Y_CONVIVENCIA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `PARTICIPACIÓN_EN_GRUPOS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quinto_año`
--

CREATE TABLE `quinto_año` (
  `id` int(11) NOT NULL,
  `CASTELLANO` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `INGLÉS_Y_OTRAS_LENGUAS_EXTRANJERAS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `MATEMÁTICAS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `EDUCACIÓN_FÍSICA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `FÍSICA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `QUÍMICA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `BIOLOGÍA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `CIENCIAS_DE_LA_TIERRA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `GEOGRAFÍA_HISTORIA_Y_CIUDADANÍA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `FORMACIÓN_PARA_LA_SOBERANÍA_NACIONAL` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `ORIENTACIÓN_Y_CONVIVENCIA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `PARTICIPACIÓN_EN_GRUPOS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}'
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segundo_año`
--

CREATE TABLE `segundo_año` (
  `id` int(11) NOT NULL,
  `CASTELLANO` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `INGLÉS_Y_OTRAS_LENGUAS_EXTRANJERAS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `MATEMÁTICAS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `EDUCACIÓN_FÍSICA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `ARTE_Y_PATRIMONIO` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `CIENCIAS_NATURALES` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `GEOGRAFÍA_HISTORIA_Y_CIUDADANÍA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `ORIENTACIÓN_Y_CONVIVENCIA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `PARTICIPACIÓN_EN_GRUPOS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tercer_año`
--

CREATE TABLE `tercer_año` (
  `id` int(11) NOT NULL,
  `CASTELLANO` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `INGLÉS_Y_OTRAS_LENGUAS_EXTRANJERAS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `MATEMÁTICAS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `EDUCACIÓN_FÍSICA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `FÍSICA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `QUÍMICA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `BIOLOGÍA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `GEOGRAFÍA_HISTORIA_Y_CIUDADANÍA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `ORIENTACIÓN_Y_CONVIVENCIA` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}',
  `PARTICIPACIÓN_EN_GRUPOS` varchar(200) DEFAULT '{"primer_lapso":0,"segundo_lapso":0,"tercer_lapso":0,"revision":0,"ap":0}'
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
(1, 'manuel\n', 'puente', 'manuelp1345@gmail.com', 'a334c357f06cc38c014f6fad7b9ea563f889a2015720de5b4d0b94bba0c7cd28106f297845453ce5abaea6ed69ec1c251eb6e2ea661fdda78546833b2c8c487b', 'admin'),
(2, 'santiago', 'faysal', 'laultimadesantiago@gmail.com', 'a334c357f06cc38c014f6fad7b9ea563f889a2015720de5b4d0b94bba0c7cd28106f297845453ce5abaea6ed69ec1c251eb6e2ea661fdda78546833b2c8c487b', 'admin'),
(3, 'administrador', 'admin', 'admin@correo.com', 'a334c357f06cc38c014f6fad7b9ea563f889a2015720de5b4d0b94bba0c7cd28106f297845453ce5abaea6ed69ec1c251eb6e2ea661fdda78546833b2c8c487b', 'superadmin');

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
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuarto_año`
--
ALTER TABLE `cuarto_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `primer_año`
--
ALTER TABLE `primer_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `quinto_año`
--
ALTER TABLE `quinto_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `representante`
--
ALTER TABLE `representante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `segundo_año`
--
ALTER TABLE `segundo_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tercer_año`
--
ALTER TABLE `tercer_año`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
