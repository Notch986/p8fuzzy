-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2021 a las 00:48:55
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `phpdesdecero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `idboleta` int(11) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `carreras_idcarreras` int(11) NOT NULL,
  `turnos_idturnos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`idboleta`, `nombres`, `apellidos`, `email`, `carreras_idcarreras`, `turnos_idturnos`) VALUES
(112200, 'Edgar', 'Huanaco Calcina', 'edgarhcal@gmail.com', 102, 2),
(112201, 'Edgar', 'Lope Arana', 'eeeee@gmaiil.com', 104, 2),
(112202, 'Daniel', 'lopez sanchez', 'dlopez@gmail.com', 103, 2),
(112203, 'huber', 'churata ramos', 'huber@gmail.com', 110, 1),
(112204, 'Diego', 'Maradona', 'maradona@gmail.com', 105, 1),
(112205, 'layka', 'de las casas', 'layka@kete.com', 108, 2),
(112206, 'sofia', 'hallasi huanaco', 'shuanaco@gmail.com', 106, 1),
(112207, ' edwar', 'caceres condori', 'edwar@gmail.com', 110, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_has_conceptos`
--

CREATE TABLE `alumnos_has_conceptos` (
  `alumnos_idalumnos` int(11) NOT NULL,
  `conceptos_idconceptos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `idcarreras` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`idcarreras`, `nombre`) VALUES
(101, 'Administración de Serv. y Hosteleria'),
(102, 'Contabilidad'),
(103, 'Mecánica Automotriz'),
(104, 'Mecánica de producción'),
(105, 'Metalurgia'),
(106, 'Química Industrial'),
(107, 'Computación e Informática'),
(108, 'Electrónica Industrial'),
(109, 'Electrotécnica Industrial'),
(110, 'Enferemia Técnica'),
(111, 'Mantenimiento de Maq. Pesada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos`
--

CREATE TABLE `conceptos` (
  `idconceptos` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `monto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `conceptos`
--

INSERT INTO `conceptos` (`idconceptos`, `nombre`, `monto`) VALUES
(4, 'Derecho de inscripción proceso Extraordinario', 180),
(6, 'Derecho de inscripción proceso Ad Extra 1er p', 180),
(7, 'Derecho de inscripción proceso admision Ordin', 180),
(10, 'Dercho de inscripción servicio militar', 90),
(13, 'Derecho de enseñanza Pre Instituto', 150),
(14, 'Derecho de cambio de Programa del postulante', 15),
(15, 'Postulate cambio de turno', 21),
(16, 'Constancia de ingresante', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibo`
--

CREATE TABLE `recibo` (
  `recibo_idrecibo` int(11) NOT NULL,
  `conceptos_idconceptos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recibo`
--

INSERT INTO `recibo` (`recibo_idrecibo`, `conceptos_idconceptos`) VALUES
(112200, 13),
(112201, 13),
(112202, 7),
(112203, 16),
(112204, 7),
(112205, 15),
(112206, 7),
(112207, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `idturnos` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`idturnos`, `nombre`) VALUES
(1, 'dia'),
(2, 'noche');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`idboleta`),
  ADD KEY `fk_alumnos_carreras1` (`carreras_idcarreras`),
  ADD KEY `fk_alumnos_turnos1` (`turnos_idturnos`);

--
-- Indices de la tabla `alumnos_has_conceptos`
--
ALTER TABLE `alumnos_has_conceptos`
  ADD PRIMARY KEY (`alumnos_idalumnos`,`conceptos_idconceptos`),
  ADD KEY `fk_alumnos_has_conceptos_conceptos1` (`conceptos_idconceptos`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`idcarreras`);

--
-- Indices de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  ADD PRIMARY KEY (`idconceptos`);

--
-- Indices de la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD PRIMARY KEY (`recibo_idrecibo`,`conceptos_idconceptos`),
  ADD KEY `fk_recibo_has_conceptos_conceptos1` (`conceptos_idconceptos`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`idturnos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `idboleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112208;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `fk_alumnos_carreras1` FOREIGN KEY (`carreras_idcarreras`) REFERENCES `carreras` (`idcarreras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alumnos_turnos1` FOREIGN KEY (`turnos_idturnos`) REFERENCES `turnos` (`idturnos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alumnos_has_conceptos`
--
ALTER TABLE `alumnos_has_conceptos`
  ADD CONSTRAINT `fk_alumnos_has_conceptos_alumnos1` FOREIGN KEY (`alumnos_idalumnos`) REFERENCES `alumnos` (`idboleta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alumnos_has_conceptos_conceptos1` FOREIGN KEY (`conceptos_idconceptos`) REFERENCES `conceptos` (`idconceptos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD CONSTRAINT `fk_recibo_has_conceptos_conceptos1` FOREIGN KEY (`conceptos_idconceptos`) REFERENCES `conceptos` (`idconceptos`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
