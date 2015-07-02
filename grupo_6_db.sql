-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2015 a las 00:39:20
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `grupo_6_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avion`
--

create database grupo_6_db;
use grupo_6_db;

CREATE TABLE IF NOT EXISTS `avion` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `CAPACIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `avion`
--

INSERT INTO `avion` (`ID`, `NOMBRE`, `CAPACIDAD`) VALUES
(1, 'TANGO01', 50),
(2, 'TANGO02', 50),
(3, 'TANGO03', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `ID` int(11) NOT NULL,
  `DIRECCION` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `TELEFONO` varchar(30) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `NOMBRE` varchar(40) NOT NULL,
  `APELLIDO` varchar(40) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID`, `DIRECCION`, `EMAIL`, `TELEFONO`, `DNI`, `NOMBRE`, `APELLIDO`, `FECHA_NACIMIENTO`) VALUES
(1, 'Calle falsa 123', 'admin@admin.com.ar', '11111111111', '11111111', 'Guillermo', 'Telijo', '1994-04-11'),
(2, 'Av Siempre Viva', 'root@admin.com.ar', '2222222222', '22222222', 'Esteban', 'Quito', '1994-10-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE IF NOT EXISTS `paquete` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `PRECIO` decimal(8,2) NOT NULL,
  `CANT_PERSONAS` int(11) NOT NULL,
  `ID_VUELO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`ID`, `NOMBRE`, `PRECIO`, `CANT_PERSONAS`, `ID_VUELO`) VALUES
(0, 'Buenos Aires Aruba', '2500.00', 20, 1),
(1, 'Aruba Buenos Aires', '2500.00', 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE IF NOT EXISTS `reserva` (
  `ID` int(11) NOT NULL,
  `ID_PAQUETE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`ID`, `ID_PAQUETE`) VALUES
(0, 0),
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 1),
(7, 0),
(8, 1),
(9, 1),
(10, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_cliente`
--

CREATE TABLE IF NOT EXISTS `reserva_cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `ID_RESERVA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reserva_cliente`
--

INSERT INTO `reserva_cliente` (`ID_CLIENTE`, `ID_RESERVA`) VALUES
(1, 8),
(1, 9),
(1, 10),
(2, 8),
(2, 9),
(2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

CREATE TABLE IF NOT EXISTS `vuelo` (
  `ID` int(11) NOT NULL,
  `ID_AVION` int(11) DEFAULT NULL,
  `DESDE` varchar(30) NOT NULL,
  `HACIA` varchar(30) NOT NULL,
  `HORARIO_PARTIDA` datetime DEFAULT NULL,
  `HORARIO_LLEGADA` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vuelo`
--

INSERT INTO `vuelo` (`ID`, `ID_AVION`, `DESDE`, `HACIA`, `HORARIO_PARTIDA`, `HORARIO_LLEGADA`) VALUES
(0, 1, 'Buenos Aires Ezeiza', 'Puerto Rico', '2015-06-30 13:00:00', '2015-07-06 20:00:00'),
(1, 1, 'Buenos Aires Ezeiza', 'Puerto Rico', '2015-06-30 13:00:00', '2015-07-06 20:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `reserva_cliente`
--
ALTER TABLE `reserva_cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`,`ID_RESERVA`);

--
-- Indices de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
