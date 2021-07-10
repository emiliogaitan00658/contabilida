-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2020 a las 17:03:23
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prestamo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `indcliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `direccion1` varchar(300) DEFAULT NULL,
  `direccion2` varchar(500) NOT NULL,
  `cedula` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `sucursal` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`indcliente`, `nombre`, `apellido`, `direccion1`, `direccion2`, `cedula`, `telefono`, `sucursal`, `status`) VALUES
(1, 'ROBERTO ', 'GAITAN', 'RESIDENCIAL MONTECRISTI 234', '', '401-110689-555S', '22513132', 'MANAGUA', 1),
(2, 'CLAUDIA', 'SEQUEIRA', 'MONTECRISTI 234', '', '401-110689-556D', '22513131', 'MANAGUA', 1),
(3, 'EMILIO ANTONIO', ' FUENTES', 'dñ{das dsadsa', 'DDDDD', '4061602011000Q', '77231730', 'MANAGUA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito`
--

CREATE TABLE `credito` (
  `indcredito` int(11) NOT NULL,
  `indcliente` int(11) DEFAULT NULL,
  `producto` varchar(300) DEFAULT NULL,
  `totalCredito` float DEFAULT NULL,
  `numeroCuotas` int(11) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL,
  `prima` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `credito`
--

INSERT INTO `credito` (`indcredito`, `indcliente`, `producto`, `totalCredito`, `numeroCuotas`, `fechaInicio`, `status`, `prima`) VALUES
(1, 1, 'ALGINATO ', 32, 3, '2020-05-16', 'true', 0),
(2, 2, '45555', 899, 12, '2020-04-17', 'true', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditos_pago`
--

CREATE TABLE `creditos_pago` (
  `indpago` int(11) NOT NULL,
  `indcredito` int(11) DEFAULT NULL,
  `indfactura` varchar(200) DEFAULT NULL,
  `pago` float DEFAULT NULL,
  `fechapago` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `bandera` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `creditos_pago`
--

INSERT INTO `creditos_pago` (`indpago`, `indcredito`, `indfactura`, `pago`, `fechapago`, `status`, `bandera`) VALUES
(1, 1, '5545444', 10.6667, '2020-06-16', 'true', 0),
(2, 1, '5545444', 10.6667, '2020-07-16', 'true', 0),
(3, 1, '899856325', 10.6667, '2020-08-16', 'true', 1),
(4, 2, NULL, 74.9167, '2020-05-17', 'false', 0),
(5, 2, NULL, 74.9167, '2020-06-17', 'false', 0),
(6, 2, NULL, 74.9167, '2020-07-17', 'false', 0),
(7, 2, NULL, 74.9167, '2020-08-17', 'false', 0),
(8, 2, NULL, 74.9167, '2020-09-17', 'false', 0),
(9, 2, NULL, 74.9167, '2020-10-17', 'false', 0),
(10, 2, NULL, 74.9167, '2020-11-17', 'false', 0),
(11, 2, NULL, 74.9167, '2021-01-17', 'false', 0),
(12, 2, NULL, 74.9167, '2021-02-17', 'false', 0),
(13, 2, NULL, 74.9167, '2021-03-17', 'false', 0),
(14, 2, NULL, 74.9167, '2021-04-17', 'false', 0),
(15, 2, NULL, 74.9167, '2021-05-17', 'false', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`indcliente`);

--
-- Indices de la tabla `credito`
--
ALTER TABLE `credito`
  ADD PRIMARY KEY (`indcredito`),
  ADD KEY `integridad` (`indcliente`);

--
-- Indices de la tabla `creditos_pago`
--
ALTER TABLE `creditos_pago`
  ADD PRIMARY KEY (`indpago`),
  ADD KEY `indcredito` (`indcredito`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `indcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `indcredito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `creditos_pago`
--
ALTER TABLE `creditos_pago`
  MODIFY `indpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `credito`
--
ALTER TABLE `credito`
  ADD CONSTRAINT `integridad` FOREIGN KEY (`indcliente`) REFERENCES `clientes` (`indcliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `creditos_pago`
--
ALTER TABLE `creditos_pago`
  ADD CONSTRAINT `creditos_pago_ibfk_1` FOREIGN KEY (`indcredito`) REFERENCES `credito` (`indcredito`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
