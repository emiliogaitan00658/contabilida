-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-08-2021 a las 01:53:26
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `contabilidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `indcliente` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion1` varchar(100) DEFAULT NULL,
  `direccion2` varchar(100) DEFAULT NULL,
  `cedula` varchar(50) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `indsucursal` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`indcliente`, `nombre`, `apellido`, `direccion1`, `direccion2`, `cedula`, `telefono`, `indsucursal`, `status`) VALUES
(0, 'generico', NULL, NULL, NULL, NULL, NULL, 7, 1),
(1, 'ROBERTO ', 'GAITAN PAVO', 'Derechos ddd             ', 'Derechosddd', '401-040797-0007J', '2220-687           ', 5, 1),
(2, 'ROBERTO ', 'GAITAN PAVO', 'dr1', 'dr2', '401-040797-0007J', '2220-6871 • 2277-0288', 7, 1),
(3, 'EMILIO ANTONIO', 'FUENTES', 'LEON   ', 'LEON', '4010407970007J', '7864788967   ', 1, 1),
(4, 'MELISSA', 'GAITAN', '11535 SW 187 TERRACE', '', '4010407970007J', '7864788967', 1, 1),
(5, 'MELISSA', 'GAITAN', '11535 ss      ', 'LEss', '4010407970007J', '17864788967   SS      ', 6, 1),
(6, 'RICARDO', 'GAITAN', 'LEON', 'LEON', '4010407970007J', '7864788967', 4, 1),
(7, 'RICARDO', 'GAITAN', 'LEON', 'LEON', '4010407970007J', '7864788967', 1, 1),
(8, 'RICARDO', 'GAITAN', 'LEON', 'LEON', '4010407970007J', '7864788967', 1, 1),
(9, 'RICARDO', 'GAITAN', 'LEON', 'LEON', '4010407970007J', '7864788967', 1, 1),
(10, 'RICARDO', 'GAITAN', 'LEON', 'LEON', '4010407970007J', '7864788967', 1, 1),
(11, 'TANIA', 'REYNOZA', 'MANAGUA', 'F', '401-04071997-0007J', '89101524', 1, 1),
(12, 'EMILIO ANTONIO', 'GAITAN FUENTES', 'LEóN NICARAGUA', '', '401-04071997-0007J', '77231730', 1, 1),
(13, 'ROBERTO ', 'GAITAN', 'SDADASD', 'ASDASDASD', '', '85456222', 1, 1),
(14, 'EMILIO ANTOWWWW', 'FUENTES', 'MANAGUA', 'F', '', '89101524', 1, 1),
(15, 'ORTHO', 'DENTAL', 'CALLE PRINCIPAL DE ALTAMIRA, DE SINSA PROYECTO 1 12 C ABAJO, CASA #396', '', '', '22206871', 1, 1),
(16, 'RESERVA NATURAL JUAN', 'LEóN', 'LA ISLA JUAN VENADO, LOCALIZADA EN FRENTE DEL POBLADO DE LAS PEN', '', '', '86222082', 7, 1),
(17, 'ANTONIO DANIEL', 'FUENTES CARRANZA', 'MANAGUA', 'F', '', '89101524', 7, 1),
(18, 'SALUD SIN FRONTERAS ', 'RUC:J0310000227713', 'ASD', '', '', '323232323234234', 1, 1),
(20, '.', 'GAITAN FUENTES', '55', '55', '445', '45', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control`
--

CREATE TABLE `control` (
  `indcontrol` int(11) NOT NULL,
  `indfactura` int(11) DEFAULT NULL,
  `indsucursal` int(11) DEFAULT NULL,
  `indtemp` varchar(100) DEFAULT NULL,
  `tipocontrol` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `anulado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `control`
--

INSERT INTO `control` (`indcontrol`, `indfactura`, `indsucursal`, `indtemp`, `tipocontrol`, `fecha`, `hora`, `anulado`) VALUES
(3, NULL, 1, '4lyndf6yjr8vmrmubaonzoa3nl9xbis2k42vg3jhsbeus0yp0b8g4lk28go99n49rlvqqahqnmtl79cr6fbvbm2mofydx4xhcu1r', 'PX', '2021-07-12', '09:51:56', 1),
(4, 0, 1, 'yoais7bbvxqk3cr1b3uygez7m7no9ohckwjuoijew6y8yktkzscq8862a5t5fkg1673jmceya38q3xlw1acywkxvsi246m2latpv', 'RX', '2021-07-12', '10:05:35', 0),
(5, NULL, 1, '3l17trcgre75goqcmfdz9rkj29f6hedh4wrag9qq07zcu961pcvvo0utpvwrktixjzh3hkiuqwndlnlmpcpk00ivla5xv8rdhodn', 'RX', '2021-07-12', '10:06:07', 0),
(6, NULL, 1, '60usje7hn3l9dxso2fhcpsbgsbxysr3xg28l0e3tv8hfwkn2bi5w12ttl3ixs1xja3829wddw98phzjcroq0ega3880ea3pi2es8', 'RX', '2021-07-12', '10:08:54', 0),
(7, 904, 1, '2xnalx01d93il65qpul36myy84aknzi6svq8zsjnly415l97gtzhv48cknyt9m3frjimljy9imnxs6todg9g001idjeae6ayrzg8', 'PX', '2021-07-12', '10:09:20', 0),
(8, 906, 1, 'ri5e61bnr2x4ddkryd528fwek03qjmdhymhi1bove3q53kkusyw1g5ccvtq06hj34yp9fig1xgdrjerznie07owqc5mxnf39zjmt', 'PX', '2021-07-18', '08:05:47', 0),
(9, 913, 1, 'gc8x4nb234hj4k8p9369pyeql9seious45hz97eev9bf3gxhr9g6uywk5g4hsnt1bkj11rbd92jz1od9lmoep7ey5nnhnyhtz8j8', 'PX', '2021-07-19', '10:13:28', 0),
(10, 907, 1, 'usf4z3cfcsydsbmymzikod5nrbsyd0iuzyitydhnt4p5xg4ba8vd44khiomw37esszmyl8tzto9q4aa7qztee14kjhuk5y4mb4ui', 'PX', '2021-07-19', '05:57:46', 0),
(11, 908, 1, 'soqb83v4unyjt4prz9zk2wwhaq0835iu7t1fhyfk3gz7xeqju7utbz22ah4l73i3ce2o1sfiiu6y72uvnudg5y966pb8m443trp3', 'RX', '2021-07-19', '07:36:19', 0),
(15, 914, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u', 'RX', '2021-08-06', '07:31:33', 0),
(16, 914, 1, 'vs1za2xj4e3xv4c4tedrac920vllskewvz12rxw68sl7h05dschwdh4whm0njl975ke5i053ifgf76w62m4e33jzgcx6adkdqjgl', 'PX', '2021-08-09', '09:52:32', 1),
(17, 915, 1, 'ixlqbacd8mld6yb191cann3lypbcez6zqef3nwve43xz6qt85gpdgxcfs3t55hbjs3hu2zerg30ll08h8amz8g9eq7gb86lqeho9', 'PX', '2021-08-09', '10:01:21', 0),
(18, 916, 1, 'yk70qfzatlp5hp2vyb0qg29msjkpuav3i8y6rfq3e11hykshplt74z30u06swqv7bpnp3l7fd9nx5jx0g8k59zskp7ps9rzxgrq1', 'PX', '2021-08-09', '10:02:17', 0),
(19, 917, 1, 'v5woisuk60tll7ysfxmef0ae4f75991b0p2jej3oz7kvihnl2467wvlt9wpku6gavgotcl6vyrbal9rrisjnfkniq4a4dr6ak6le', 'PX', '2021-08-09', '12:01:13', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito`
--

CREATE TABLE `credito` (
  `indcredito` int(11) NOT NULL,
  `indsucursal` int(11) NOT NULL,
  `indcliente` int(11) DEFAULT NULL,
  `producto` varchar(300) DEFAULT NULL,
  `totalCredito` float DEFAULT NULL,
  `numeroCuotas` int(11) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL,
  `prima` float NOT NULL,
  `indtemp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `credito`
--

INSERT INTO `credito` (`indcredito`, `indsucursal`, `indcliente`, `producto`, `totalCredito`, `numeroCuotas`, `fechaInicio`, `status`, `prima`, `indtemp`) VALUES
(1, 1, 3, NULL, 40, 15, '2021-07-07', '1', 0, '6nm7mxqsfapeimg66krwh8lttvphh90biwkp67kax4zjihyktbpbog6i2lbvoqnxw0m1y7sijxceaayfignf7fvxiuzakcpeto0k'),
(2, 1, 3, NULL, 40, 2, '2021-07-07', '1', 200, '6nm7mxqsfapeimg66krwh8lttvphh90biwkp67kax4zjihyktbpbog6i2lbvoqnxw0m1y7sijxceaayfignf7fvxiuzakcpeto0k'),
(3, 1, 13, NULL, 19.5, 3, '2021-08-01', '1', 0, 'ncuk1douryeiygchazamfgfchzbzpmu9di928r0dxv057b4uqtoxxlnluxjge76vyydrqtysy1yo1jijtj3mmpua5d1l2m879r4b'),
(4, 1, 3, NULL, 6, 15, '2021-08-06', '1', 200, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(5, 1, 3, NULL, 6, 3, '2021-08-06', '1', 3, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u');

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
  `bandera` int(11) DEFAULT NULL,
  `indsucursal` int(11) NOT NULL,
  `indtemp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `creditos_pago`
--

INSERT INTO `creditos_pago` (`indpago`, `indcredito`, `indfactura`, `pago`, `fechapago`, `status`, `bandera`, `indsucursal`, `indtemp`) VALUES
(76, 1, '895', 20, '2021-08-07', 'true', 0, 1, '6nm7mxqsfapeimg66krwh8lttvphh90biwkp67kax4zjihyktbpbog6i2lbvoqnxw0m1y7sijxceaayfignf7fvxiuzakcpeto0k'),
(77, 1, '45445', 20, '2021-09-07', 'true', 1, 1, '6nm7mxqsfapeimg66krwh8lttvphh90biwkp67kax4zjihyktbpbog6i2lbvoqnxw0m1y7sijxceaayfignf7fvxiuzakcpeto0k'),
(78, 3, NULL, 6.5, '2021-09-01', 'false', 0, 1, 'ncuk1douryeiygchazamfgfchzbzpmu9di928r0dxv057b4uqtoxxlnluxjge76vyydrqtysy1yo1jijtj3mmpua5d1l2m879r4b'),
(79, 3, NULL, 6.5, '2021-10-01', 'false', 0, 1, 'ncuk1douryeiygchazamfgfchzbzpmu9di928r0dxv057b4uqtoxxlnluxjge76vyydrqtysy1yo1jijtj3mmpua5d1l2m879r4b'),
(80, 3, NULL, 6.5, '2021-11-01', 'false', 1, 1, 'ncuk1douryeiygchazamfgfchzbzpmu9di928r0dxv057b4uqtoxxlnluxjge76vyydrqtysy1yo1jijtj3mmpua5d1l2m879r4b'),
(81, 4, NULL, 0.4, '2021-09-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(82, 4, NULL, 0.4, '2021-10-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(83, 4, NULL, 0.4, '2021-11-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(84, 4, NULL, 0.4, '2021-12-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(85, 4, NULL, 0.4, '2022-01-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(86, 4, NULL, 0.4, '2022-02-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(87, 4, NULL, 0.4, '2022-03-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(88, 4, NULL, 0.4, '2022-04-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(89, 4, NULL, 0.4, '2022-05-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(90, 4, NULL, 0.4, '2022-06-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(91, 4, NULL, 0.4, '2022-07-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(92, 4, NULL, 0.4, '2022-08-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(93, 4, NULL, 0.4, '2022-09-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(94, 4, NULL, 0.4, '2022-10-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(95, 4, NULL, 0.4, '2022-11-06', 'false', 1, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(96, 4, NULL, 2, '2021-09-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(97, 4, NULL, 2, '2021-10-06', 'false', 0, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(98, 4, NULL, 2, '2021-11-06', 'false', 1, 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `indempleado` int(11) NOT NULL,
  `nombre_empleado` varchar(50) DEFAULT NULL,
  `apellido_empleado` varchar(50) DEFAULT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `indsucursal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`indempleado`, `nombre_empleado`, `apellido_empleado`, `user`, `pass`, `indsucursal`) VALUES
(1, 'Emilio ', 'Gaitan', 'root', 'root', 1),
(3, 'EMILIO ANTONIO', 'FUENTES', 'root', 'root', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `indfactura` int(11) NOT NULL,
  `indtalonario` int(11) DEFAULT NULL,
  `codigo_producto` varchar(50) NOT NULL,
  `nombre_producto` varchar(50) DEFAULT NULL,
  `unidad` int(11) DEFAULT NULL,
  `precio_unidad` double DEFAULT NULL,
  `precio_total` float NOT NULL,
  `cordoba` double NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `total_descuento` double NOT NULL,
  `bandera` int(11) DEFAULT NULL,
  `indcliente` int(11) DEFAULT NULL,
  `indsucursal` int(11) DEFAULT NULL,
  `anular` int(11) NOT NULL,
  `indtemp` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`indfactura`, `indtalonario`, `codigo_producto`, `nombre_producto`, `unidad`, `precio_unidad`, `precio_total`, `cordoba`, `descuento`, `total_descuento`, `bandera`, `indcliente`, `indsucursal`, `anular`, `indtemp`) VALUES
(5, 89, 'ANELSAM-219', 'ACUTRAX', 1, 1057.5, 1057.5, 35.25, 5, 1004.625, 1, 3, 1, 0, 'ihoxhtcjt3tykc22rmzrwrri1q17dpdn93qyy4v92hl0k56rx5fucaw2xl6tzdvalgmhnvgba7q2jlcuv7jhklpfy6wmk8ix9nl4'),
(6, 89, 'ANELSAM-208', 'CAJA PLANO ROJA DE 1 BANDEJAS', 1, 1057.5, 1057.5, 35.25, 2, 1036.35, 1, 3, 1, 0, 'ihoxhtcjt3tykc22rmzrwrri1q17dpdn93qyy4v92hl0k56rx5fucaw2xl6tzdvalgmhnvgba7q2jlcuv7jhklpfy6wmk8ix9nl4'),
(7, 6, 'ANELSAM-219', 'ACUTRAX', 2, 1057.5, 2115, 35.25, 5, 2009.25, 1, 3, 1, 0, 'd2w1ir24mhnmy4rxm19sj7agydzxjvah34nu885wu9hgruoioeke93wk2wh2og25d031nnismw7mgx86ldrkcklvin97162koj9g'),
(10, 5, 'ANELSAM-219', 'ACUTRAX', 1, 1057.5, 1057.5, 35.25, 5, 1004.625, 1, 3, 1, 0, 'quy8aiptcbw93jndt7vfcxnd19lkl4hz6yzlse503oo933wrxvm1ompwuf9kcw49icll6b7e6dyz3ezotyc6qra92vwdz6g3nohs'),
(11, 5, 'ANELSAM-148', 'ALGODON EN ROLLO   UNIDAD', 1, 35.25, 35.25, 35.25, 6, 33.135, 1, 3, 1, 0, 'quy8aiptcbw93jndt7vfcxnd19lkl4hz6yzlse503oo933wrxvm1ompwuf9kcw49icll6b7e6dyz3ezotyc6qra92vwdz6g3nohs'),
(13, 799, 'ANELSAM-219', 'ACUTRAX', 1, 1057.5, 1057.5, 35.25, 2, 1036.35, 0, 3, 1, 0, '4i8gav1hypsmze0wkodbwr4sepf3em4nro2jdjlxagr84s381t6tetmbndh0by9wfcj7o3jjgz1jyn0ccsx49itfgqnk3qkycirj'),
(14, 799, 'ANELSAM-193', 'AMALGAMADOR  ELECTRICO', 2, 8812.5, 17625, 35.25, 0, 17625, 0, 3, 1, 0, '4i8gav1hypsmze0wkodbwr4sepf3em4nro2jdjlxagr84s381t6tetmbndh0by9wfcj7o3jjgz1jyn0ccsx49itfgqnk3qkycirj'),
(15, 799, 'ANELSAM-131', 'BLANCO ESPAÑA', 1, 105.75, 105.75, 35.25, 3, 102.5775, 0, 3, 1, 0, '4i8gav1hypsmze0wkodbwr4sepf3em4nro2jdjlxagr84s381t6tetmbndh0by9wfcj7o3jjgz1jyn0ccsx49itfgqnk3qkycirj'),
(16, 4569, 'ANELSAM-219', 'ACUTRAX', 1, 1057.5, 1057.5, 35.25, 3, 1025.775, 0, 3, 1, 0, '51af1l3te44pwxo1yb5ui0tyev9zpsnyw2h2756wp1tob6gd2uqss3437vwnfgzvn4ldx8kfepvnmvd4l0e7hizar8q811ukuwx8'),
(17, 4569, 'ANELSAM-193', 'AMALGAMADOR  ELECTRICO', 1, 8812.5, 8812.5, 35.25, 0, 0, 0, 3, 1, 0, '51af1l3te44pwxo1yb5ui0tyev9zpsnyw2h2756wp1tob6gd2uqss3437vwnfgzvn4ldx8kfepvnmvd4l0e7hizar8q811ukuwx8'),
(18, 4569, 'ANELSAM-195', 'BISTTURI  12X CAJAS  X 100', 1, 705, 705, 35.25, 0, 0, 0, 3, 1, 0, '51af1l3te44pwxo1yb5ui0tyev9zpsnyw2h2756wp1tob6gd2uqss3437vwnfgzvn4ldx8kfepvnmvd4l0e7hizar8q811ukuwx8'),
(19, 4568, 'ANELSAM-219', 'ACUTRAX', 2, 1057.5, 2115, 35.25, 0, 2115, 0, 3, 1, 0, '4jzsx6s4bo0oqq66nmwho5q31wka6x9gd2se8wwurje6o2akg5q6n13vzvm2osdyxfwhgv7f0gcsw9exzskk26iu3ace2s0h3amn'),
(20, 4568, 'ANELSAM-193', 'AMALGAMADOR  ELECTRICO', 3, 8812.5, 26437.5, 35.25, 0, 26437.5, 0, 3, 1, 0, '4jzsx6s4bo0oqq66nmwho5q31wka6x9gd2se8wwurje6o2akg5q6n13vzvm2osdyxfwhgv7f0gcsw9exzskk26iu3ace2s0h3amn'),
(21, 4568, 'ANELSAM-131', 'BLANCO ESPAÑA', 1, 105.75, 105.75, 35.25, 0, 0, 0, 3, 1, 0, '4jzsx6s4bo0oqq66nmwho5q31wka6x9gd2se8wwurje6o2akg5q6n13vzvm2osdyxfwhgv7f0gcsw9exzskk26iu3ace2s0h3amn'),
(22, NULL, 'ANELSAM-219', 'ACUTRAX', 1, 1057.5, 1057.5, 35.25, 0, 0, 0, 3, 1, 0, 'n4trtch0pr0poeals0hca0p00rkglhrodc058unegwoe36kyhbcxvgkyr7guxcmbr3t3hv381fz9rkw3wpogn6ip5slabdpudduf'),
(23, 4570, 'ANELSAM-219', 'ACUTRAX', 1, 1057.5, 1057.5, 35.25, 0, 0, 0, 3, 1, 0, 'wjgsla4zaoi6lmnqx5cbdr7ebs2tk576ppj35p53ete60q759omqyavimpyz5wiwu0p4lzja9hjehyt7hvbtfwdpx7qmob5zzcfr'),
(24, 4570, 'ANELSAM-193', 'AMALGAMADOR  ELECTRICO', 1, 8812.5, 8812.5, 35.25, 0, 0, 0, 3, 1, 0, 'wjgsla4zaoi6lmnqx5cbdr7ebs2tk576ppj35p53ete60q759omqyavimpyz5wiwu0p4lzja9hjehyt7hvbtfwdpx7qmob5zzcfr'),
(25, NULL, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, 'q5l0zotx6hvfc6xog45rpt6f6zxdsk75qextps2n384lxnanxvl4qx7ny9rtiqlfe2af2uohdu1dph7jr88kz4amn7gy5cpjel2p'),
(26, NULL, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, 'nxrkeg3ddcxa80lgrsj7ix6313azdbp1i1gvs5pe72h9j9noec7e6imun6ccy9r7d8jxgoxvjm0kv39nyfzspgf7jj6p7d1027k9'),
(27, 910, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 2, 207.27, 0, 3, 1, 0, 'jcomylv6h985db5l8g78yh6sdixl7lxx13vofypvza13rap7mpms13v2x6q3g285ichikj947cmesc850kf1gzmhjoecv9mv2rzk'),
(28, 910, 'VALDI-100', 'ACETATO FLEXIBLE 0 ,60 PAQUETE', 1, 1057.5, 1057.5, 35.25, 2, 1036.35, 0, 3, 1, 0, 'jcomylv6h985db5l8g78yh6sdixl7lxx13vofypvza13rap7mpms13v2x6q3g285ichikj947cmesc850kf1gzmhjoecv9mv2rzk'),
(29, 910, 'MORELLI-107', 'ABREBOCA DE ALAMBRE DE NIÑOS MORELLI', 1, 264.375, 264.375, 35.25, 0, 0, 0, 3, 1, 0, 'jcomylv6h985db5l8g78yh6sdixl7lxx13vofypvza13rap7mpms13v2x6q3g285ichikj947cmesc850kf1gzmhjoecv9mv2rzk'),
(30, 909, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, 'kyf7tafu0dx64uq7kzskievmzmwognzf0nx5lf9ti0vkiceh8gxqjmye5lvkffsaupqu4z15t2ngxiw62gzvxgq91swto0k2zhky'),
(33, 801, 'CAVEX-152', 'ALGINATO  CA 37 RAPIDO', 3, 317.25, 951.75, 35.25, 2, 932.715, 0, 13, 1, 0, 'mpha3y7fdekgkpsk5coseuklhwv58j1pls994r2wt7b893hwoxtrautmxymzcmv68l1xicnfrfc3c0c87ad1127zrwqqpk0lmwbh'),
(34, 801, 'MAQUIRA-194', 'ABREBOCA DE ADULTOS FLEX', 1, 211.5, 211.5, 35.25, 0, 0, 0, 13, 1, 0, 'mpha3y7fdekgkpsk5coseuklhwv58j1pls994r2wt7b893hwoxtrautmxymzcmv68l1xicnfrfc3c0c87ad1127zrwqqpk0lmwbh'),
(35, 800, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 13, 1, 0, 'ncuk1douryeiygchazamfgfchzbzpmu9di928r0dxv057b4uqtoxxlnluxjge76vyydrqtysy1yo1jijtj3mmpua5d1l2m879r4b'),
(36, 800, 'MORELLI-107', 'ABREBOCA DE ALAMBRE DE NIÑOS MORELLI', 1, 264.375, 264.375, 35.25, 0, 0, 0, 13, 1, 0, 'ncuk1douryeiygchazamfgfchzbzpmu9di928r0dxv057b4uqtoxxlnluxjge76vyydrqtysy1yo1jijtj3mmpua5d1l2m879r4b'),
(37, 800, 'MAQUIRA-142', 'ABREBOCA LATERAL EN U O V', 1, 211.5, 211.5, 35.25, 0, 0, 0, 13, 1, 0, 'ncuk1douryeiygchazamfgfchzbzpmu9di928r0dxv057b4uqtoxxlnluxjge76vyydrqtysy1yo1jijtj3mmpua5d1l2m879r4b'),
(38, 802, 'RAX102', 'RADIOGRAFIA LATERAL', 1, 705, 705, 35.25, 0, 0, 0, 3, 1, 0, 'bd0y5h6shfxdocbwpfdfivnas4qtu3xk917auiwfh37vcwznp4sq8xa58eiydwa42fvrwdqp8k9wpsclop24woq9j6lkkwafyymg'),
(39, 803, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, 'bldk04ug2z0s2wfi135ty8f7bqhl0n1l17igjg2d06zy4dzewzby00htqtuypn4v85611oxa9k0cn114hlap10z7gz81ikmjrovo'),
(40, 803, 'MORELLI-106', 'ABREBOCA DE ALAMBRE ADULTO MORELLI', 1, 352.5, 352.5, 35.25, 0, 0, 0, 3, 1, 0, 'bldk04ug2z0s2wfi135ty8f7bqhl0n1l17igjg2d06zy4dzewzby00htqtuypn4v85611oxa9k0cn114hlap10z7gz81ikmjrovo'),
(41, 900, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, 'bq8kqxbm4lcvmh3j3nespor6ce8wodqhg1rg38usv6fsrikef8xts0yyvcobxs0p986n99dju8fkgm9uz8qrtzioic3quoylvjjh'),
(42, 900, 'MORELLI-107', 'ABREBOCA DE ALAMBRE DE NIÑOS MORELLI', 1, 264.375, 264.375, 35.25, 0, 0, 0, 3, 1, 0, 'bq8kqxbm4lcvmh3j3nespor6ce8wodqhg1rg38usv6fsrikef8xts0yyvcobxs0p986n99dju8fkgm9uz8qrtzioic3quoylvjjh'),
(44, 901, 'RAX101', 'RADIOGRAFIA DE ATM', 1, 705, 705, 35.25, 0, 0, 0, 17, 1, 0, '1y6fj38yhlihosi86mkbsfty5hk8xocpyh302qou4mkecabn18i800m1e85nv5zli8m9r81xomjwg9ffer5a797m0b8crv0bbq8t'),
(45, 901, 'RAX117', 'RADIOGRAFIA PANORAMICA', 1, 705, 705, 35.25, 0, 0, 0, 17, 1, 0, '1y6fj38yhlihosi86mkbsfty5hk8xocpyh302qou4mkecabn18i800m1e85nv5zli8m9r81xomjwg9ffer5a797m0b8crv0bbq8t'),
(46, NULL, 'RAX117', 'RADIOGRAFIA PANORAMICA', 1, 705, 705, 35.25, 0, 0, 0, 3, 1, 0, 'i9ys96fclrubrkehbzk8vpav830ns3pqjxazzk07pin5wgt84jke5ocn1bz0tzxb27lp77hl0ustfgg06fy8lir342ar5deokvet'),
(47, 902, 'RAX101', 'RADIOGRAFIA DE ATM', 1, 705, 705, 35.25, 0, 0, 0, 3, 1, 0, '4lyndf6yjr8vmrmubaonzoa3nl9xbis2k42vg3jhsbeus0yp0b8g4lk28go99n49rlvqqahqnmtl79cr6fbvbm2mofydx4xhcu1r'),
(48, 902, 'VALDI-123', 'ACETATO FLEXIBLE 0 ,60 LAMINA UNIDAD', 1, 52.875, 52.875, 35.25, 0, 0, 0, 3, 1, 0, '4lyndf6yjr8vmrmubaonzoa3nl9xbis2k42vg3jhsbeus0yp0b8g4lk28go99n49rlvqqahqnmtl79cr6fbvbm2mofydx4xhcu1r'),
(49, NULL, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, 'yoais7bbvxqk3cr1b3uygez7m7no9ohckwjuoijew6y8yktkzscq8862a5t5fkg1673jmceya38q3xlw1acywkxvsi246m2latpv'),
(50, NULL, 'MAQUIRA-194', 'ABREBOCA DE ADULTOS FLEX', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, '3l17trcgre75goqcmfdz9rkj29f6hedh4wrag9qq07zcu961pcvvo0utpvwrktixjzh3hkiuqwndlnlmpcpk00ivla5xv8rdhodn'),
(51, NULL, 'AWAN-223', 'GANCHO DE RADIOGRAFIA INDIVIDUAL', 1, 52.875, 52.875, 35.25, 0, 0, 0, 3, 1, 0, '60usje7hn3l9dxso2fhcpsbgsbxysr3xg28l0e3tv8hfwkn2bi5w12ttl3ixs1xja3829wddw98phzjcroq0ega3880ea3pi2es8'),
(52, 903, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, '2xnalx01d93il65qpul36myy84aknzi6svq8zsjnly415l97gtzhv48cknyt9m3frjimljy9imnxs6todg9g001idjeae6ayrzg8'),
(53, 904, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 18, 1, 0, 'ri5e61bnr2x4ddkryd528fwek03qjmdhymhi1bove3q53kkusyw1g5ccvtq06hj34yp9fig1xgdrjerznie07owqc5mxnf39zjmt'),
(54, 904, 'MORELLI-106', 'ABREBOCA DE ALAMBRE ADULTO MORELLI', 1, 352.5, 352.5, 35.25, 0, 0, 0, 18, 1, 0, 'ri5e61bnr2x4ddkryd528fwek03qjmdhymhi1bove3q53kkusyw1g5ccvtq06hj34yp9fig1xgdrjerznie07owqc5mxnf39zjmt'),
(55, 904, 'MAQUIRA-142', 'ABREBOCA LATERAL EN U O V', 1, 211.5, 211.5, 35.25, 0, 0, 0, 18, 1, 0, 'ri5e61bnr2x4ddkryd528fwek03qjmdhymhi1bove3q53kkusyw1g5ccvtq06hj34yp9fig1xgdrjerznie07owqc5mxnf39zjmt'),
(56, 904, 'BIOART-114', 'ACETATO RIGIDO 1 ,5 O 0 ,60 MM PAQUETE  X5', 1, 299.625, 299.625, 35.25, 0, 0, 0, 18, 1, 0, 'ri5e61bnr2x4ddkryd528fwek03qjmdhymhi1bove3q53kkusyw1g5ccvtq06hj34yp9fig1xgdrjerznie07owqc5mxnf39zjmt'),
(57, 906, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 5, 200.925, 0, 3, 1, 0, 'gc8x4nb234hj4k8p9369pyeql9seious45hz97eev9bf3gxhr9g6uywk5g4hsnt1bkj11rbd92jz1od9lmoep7ey5nnhnyhtz8j8'),
(58, 906, 'MORELLI-106', 'ABREBOCA DE ALAMBRE ADULTO MORELLI', 1, 352.5, 352.5, 35.25, 0, 0, 0, 3, 1, 0, 'gc8x4nb234hj4k8p9369pyeql9seious45hz97eev9bf3gxhr9g6uywk5g4hsnt1bkj11rbd92jz1od9lmoep7ey5nnhnyhtz8j8'),
(59, 906, 'MORELLI-107', 'ABREBOCA DE ALAMBRE DE NIÑOS MORELLI', 1, 264.375, 264.375, 35.25, 0, 0, 0, 3, 1, 0, 'gc8x4nb234hj4k8p9369pyeql9seious45hz97eev9bf3gxhr9g6uywk5g4hsnt1bkj11rbd92jz1od9lmoep7ey5nnhnyhtz8j8'),
(60, 907, 'MAQUIRA-194', 'ABREBOCA DE ADULTOS FLEX', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, 'usf4z3cfcsydsbmymzikod5nrbsyd0iuzyitydhnt4p5xg4ba8vd44khiomw37esszmyl8tzto9q4aa7qztee14kjhuk5y4mb4ui'),
(61, 907, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, 'usf4z3cfcsydsbmymzikod5nrbsyd0iuzyitydhnt4p5xg4ba8vd44khiomw37esszmyl8tzto9q4aa7qztee14kjhuk5y4mb4ui'),
(62, 908, 'RAX117', 'RADIOGRAFIA PANORAMICA', 1, 705, 705, 35.25, 0, 0, 0, 20, 1, 0, 'soqb83v4unyjt4prz9zk2wwhaq0835iu7t1fhyfk3gz7xeqju7utbz22ah4l73i3ce2o1sfiiu6y72uvnudg5y966pb8m443trp3'),
(73, 913, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u'),
(74, 914, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, 'vs1za2xj4e3xv4c4tedrac920vllskewvz12rxw68sl7h05dschwdh4whm0njl975ke5i053ifgf76w62m4e33jzgcx6adkdqjgl'),
(75, 915, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 1, 211.5, 211.5, 35.25, 0, 0, 0, 3, 1, 0, 'ixlqbacd8mld6yb191cann3lypbcez6zqef3nwve43xz6qt85gpdgxcfs3t55hbjs3hu2zerg30ll08h8amz8g9eq7gb86lqeho9'),
(76, 915, 'MORELLI-107', 'ABREBOCA DE ALAMBRE DE NIÑOS MORELLI', 1, 264.375, 264.375, 35.25, 0, 0, 0, 3, 1, 0, 'ixlqbacd8mld6yb191cann3lypbcez6zqef3nwve43xz6qt85gpdgxcfs3t55hbjs3hu2zerg30ll08h8amz8g9eq7gb86lqeho9'),
(77, 915, 'VALDI-100', 'ACETATO FLEXIBLE 0 ,60 PAQUETE', 1, 1057.5, 1057.5, 35.25, 0, 0, 0, 3, 1, 0, 'ixlqbacd8mld6yb191cann3lypbcez6zqef3nwve43xz6qt85gpdgxcfs3t55hbjs3hu2zerg30ll08h8amz8g9eq7gb86lqeho9'),
(78, 916, 'MORELLI-106', 'ABREBOCA DE ALAMBRE ADULTO MORELLI', 1, 352.5, 352.5, 35.25, 0, 0, 0, 17, 1, 0, 'yk70qfzatlp5hp2vyb0qg29msjkpuav3i8y6rfq3e11hykshplt74z30u06swqv7bpnp3l7fd9nx5jx0g8k59zskp7ps9rzxgrq1'),
(79, 917, 'RAX-489', 'BIMAXILAR CON LECTURA', 1, 4935, 4935, 35.25, 0, 0, 0, 3, 1, 0, 'v5woisuk60tll7ysfxmef0ae4f75991b0p2jej3oz7kvihnl2467wvlt9wpku6gavgotcl6vyrbal9rrisjnfkniq4a4dr6ak6le');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_acceso`
--

CREATE TABLE `historial_acceso` (
  `indacceso` int(11) NOT NULL,
  `descripcion_acceso` varchar(100) DEFAULT NULL,
  `ip_acceso` varchar(25) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `indsucursal` int(11) DEFAULT NULL,
  `indempleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historial_acceso`
--

INSERT INTO `historial_acceso` (`indacceso`, `descripcion_acceso`, `ip_acceso`, `fecha`, `hora`, `indsucursal`, `indempleado`) VALUES
(1, 'acceso', '192.168.2.1', '2021-05-07', '20:16:39', 1, 1),
(2, 'acceso', '127.0.0.1', '2021-05-23', '07:56:21', 1, 1),
(3, 'acceso', '127.0.0.1', '2021-06-11', '01:51:15', 1, 1),
(4, 'acceso', '127.0.0.1', '2021-06-16', '09:36:35', 1, 1),
(5, 'acceso', '127.0.0.1', '2021-06-17', '10:49:20', 1, 1),
(6, 'acceso', '127.0.0.1', '2021-07-07', '05:02:22', 1, 1),
(7, 'acceso', '127.0.0.1', '2021-07-07', '07:41:51', 1, 1),
(8, 'acceso', '127.0.0.1', '2021-07-08', '08:22:25', 1, 1),
(9, 'acceso', '127.0.0.1', '2021-07-09', '09:37:30', 1, 1),
(10, 'acceso', '127.0.0.1', '2021-07-10', '09:05:52', 1, 1),
(11, 'acceso', '127.0.0.1', '2021-07-10', '11:52:17', 1, 1),
(12, 'acceso', '127.0.0.1', '2021-07-10', '11:52:25', 1, 1),
(13, 'acceso', '127.0.0.1', '2021-07-12', '10:31:07', 1, 1),
(14, 'acceso', '127.0.0.1', '2021-07-13', '08:49:24', 1, 1),
(15, 'acceso', '127.0.0.1', '2021-07-13', '02:15:45', 1, 1),
(16, 'acceso', '127.0.0.1', '2021-07-13', '03:59:56', 1, 1),
(17, 'acceso', '127.0.0.1', '2021-07-18', '08:01:29', 1, 1),
(18, 'acceso', '127.0.0.1', '2021-07-19', '09:17:51', 1, 1),
(19, 'acceso', '127.0.0.1', '2021-07-19', '10:13:28', 1, 1),
(20, 'acceso', '127.0.0.1', '2021-07-19', '03:19:42', 1, 1),
(21, 'acceso', '127.0.0.1', '2021-07-19', '05:57:46', 1, 1),
(22, 'acceso', '127.0.0.1', '2021-07-19', '07:36:19', 1, 1),
(23, 'acceso', '127.0.0.1', '2021-07-20', '01:42:14', 1, 1),
(24, 'acceso', '127.0.0.1', '2021-07-20', '05:15:26', 1, 1),
(25, 'acceso', '127.0.0.1', '2021-07-21', '08:33:25', 1, 1),
(26, 'acceso', '127.0.0.1', '2021-07-21', '08:58:15', 1, 1),
(27, 'acceso', '127.0.0.1', '2021-07-21', '02:40:46', 1, 1),
(28, 'acceso', '127.0.0.1', '2021-07-21', '03:53:20', 1, 1),
(29, 'acceso', '127.0.0.1', '2021-07-21', '03:55:33', 1, 1),
(30, 'acceso', '127.0.0.1', '2021-07-21', '08:09:06', 1, 1),
(31, 'acceso', '127.0.0.1', '2021-07-22', '08:00:11', 1, 1),
(32, 'acceso', '127.0.0.1', '2021-07-23', '09:33:41', 1, 1),
(33, 'acceso', '127.0.0.1', '2021-07-24', '08:05:55', 1, 1),
(34, 'acceso', '127.0.0.1', '2021-07-29', '08:19:16', 1, 1),
(35, 'acceso', '127.0.0.1', '2021-07-29', '08:13:02', 1, 1),
(36, 'acceso', '127.0.0.1', '2021-07-30', '08:03:23', 1, 1),
(37, 'acceso', '127.0.0.1', '2021-07-30', '11:09:46', 1, 1),
(38, 'acceso', '127.0.0.1', '2021-07-30', '11:17:45', 1, 1),
(39, 'acceso', '127.0.0.1', '2021-07-31', '09:20:45', 1, 1),
(40, 'acceso', '127.0.0.1', '2021-07-31', '09:22:13', 1, 1),
(41, 'acceso', '127.0.0.1', '2021-08-03', '02:54:23', 1, 1),
(42, 'acceso', '127.0.0.1', '2021-08-03', '03:58:19', 1, 1),
(43, 'acceso', '127.0.0.1', '2021-08-04', '03:40:31', 1, 1),
(44, 'acceso', '127.0.0.1', '2021-08-06', '07:29:42', 1, 1),
(45, 'acceso', '127.0.0.1', '2021-08-06', '07:31:33', 1, 1),
(46, 'acceso', '127.0.0.1', '2021-08-09', '09:52:09', 1, 1),
(47, 'acceso', '127.0.0.1', '2021-08-09', '09:52:32', 1, 1),
(48, 'acceso', '127.0.0.1', '2021-08-09', '10:01:21', 1, 1),
(49, 'acceso', '127.0.0.1', '2021-08-09', '10:02:17', 1, 1),
(50, 'acceso', '127.0.0.1', '2021-08-09', '12:01:13', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `indproducto` int(11) NOT NULL,
  `codigo_producto` varchar(50) NOT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `precio1` double DEFAULT NULL,
  `precio2` double NOT NULL,
  `precio3` double NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `bandera` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`indproducto`, `codigo_producto`, `nombre_producto`, `precio1`, `precio2`, `precio3`, `fecha_vencimiento`, `bandera`) VALUES
(1, 'MAQUIRA-111', 'ABREBOCA CON BAJA LENGUA', 6, 0, 0, '2021-06-16', 1),
(2, 'MAQUIRA-194', 'ABREBOCA DE ADULTOS FLEX', 6, 0, 0, '2021-06-17', 1),
(3, 'MORELLI-106', 'ABREBOCA DE ALAMBRE ADULTO MORELLI', 10, 0, 0, '2021-06-18', 1),
(4, 'MORELLI-107', 'ABREBOCA DE ALAMBRE DE NIÑOS MORELLI', 7.5, 0, 0, '2021-06-19', 1),
(5, 'MAQUIRA-140', 'ABREBOCA DE NIÑOS FLEX', 6, 0, 0, '2021-06-20', 1),
(6, 'MAQUIRA-142', 'ABREBOCA LATERAL EN U O V', 6, 0, 0, '2021-06-21', 1),
(7, 'ULTRA-110', 'ABREBOCA Y PROTECTOR LINGUAL', 7, 0, 0, '2021-06-22', 1),
(8, 'VIPI-107', 'ABRILLANTADOR DE ACRILICO', 5, 0, 0, '2021-06-23', 1),
(9, 'BIOART-112', 'ACETATO  BLANDO  1 ,00 O 0 ,40 MM PAQUETE  X 10', 10, 0, 0, '2021-06-24', 1),
(10, 'BIOART-127', 'ACETATO  BLANDO 2 ,00 O 0 ,80 MM PAQUETE X 10', 15, 0, 0, '2021-06-25', 1),
(11, 'BIOART-113', 'ACETATO  RIGIDO 1 ,00 O 0 ,40 MM PAQUETE  X 5', 8.5, 0, 0, '2021-06-26', 1),
(12, 'BIOART-116', 'ACETATO DE  COLORES  3 ,00 MM', 15, 0, 0, '2021-06-27', 1),
(13, 'VALDI-123', 'ACETATO FLEXIBLE 0 ,60 LAMINA UNIDAD', 1.5, 0, 0, '2021-06-28', 1),
(14, 'VALDI-100', 'ACETATO FLEXIBLE 0 ,60 PAQUETE', 30, 0, 0, '2021-06-29', 1),
(15, 'VALDI100', 'ACETATO FLEXIBLE 0 ,60 PAQUETE', 30, 0, 0, '2021-06-30', 1),
(16, 'BIOART-114', 'ACETATO RIGIDO 1 ,5 O 0 ,60 MM PAQUETE  X5', 8.5, 0, 0, '2021-07-01', 1),
(17, 'BIOART-115', 'ACETATO RIGIDO 2 ,00 O  0 ,80 MM PAQUETE  X5', 8.5, 0, 0, '2021-07-02', 1),
(18, 'MAQUIRA-173', 'ACIDO  GEL  FLUORIHIDRICO  PARA  PORCELANA', 8, 0, 0, '2021-07-03', 1),
(19, 'MAQUIRA-174', 'ACIDO GRABADOR  37%', 6, 0, 0, '2021-07-04', 1),
(20, 'DENSELL-100', 'ACIDO GRABADOR DENSELL', 6, 0, 0, '2021-07-05', 1),
(21, 'VIPI-194', 'ACLILICO  TERMOCURABLE  POLVO MEDIA LIBRA  ROSA', 5.5, 0, 0, '2021-07-06', 1),
(22, 'VIPI-198', 'ACRILICO  DE  PROTESIS  62,65,66,60 ,77 ,81', 6.5, 0, 0, '2021-07-07', 1),
(23, 'VIPI-195', 'ACRILICO AUTOCURABLE ROSA MEDIA  LIBRA', 5.5, 0, 0, '2021-07-08', 1),
(24, 'NICTONE-101', 'ACRILICO AUTOCURADO  LIQUIDO  EN FRASCO DE   125ML', 6, 0, 0, '2021-07-09', 1),
(25, 'VIPI-109', 'ACRILICO DE COLORES   PARA  ORTODONCIA', 6.5, 0, 0, '2021-07-10', 1),
(26, 'VIPI-197', 'ACRILICO INCOLORO  PARA  ORTODONCIA', 6.5, 0, 0, '2021-07-11', 1),
(27, 'VIPI-196', 'ACRILICO TERMOCURABLE  INCOLORO  MEDIA LIBRA', 5.5, 0, 0, '2021-07-12', 1),
(28, 'NICTONE-100', 'ACRILICO TERMOCURADO LIQUIDO  EN FRASCO   DE 125 ML', 5.5, 0, 0, '2021-07-13', 1),
(29, 'ANELSAM-219', 'ACUTRAX', 30, 0, 0, '2021-07-14', 1),
(30, 'MORELLI-182', 'ADAPTADOR  DE BANDAS', 12, 0, 0, '2021-07-15', 1),
(31, 'BJM-105', 'ADHESIVO  BJM', 20, 0, 0, '2021-07-16', 1),
(32, 'CAVEX-104', 'ADHESIVO  CAVEX', 23, 0, 0, '2021-07-17', 1),
(33, 'CAVEX-148', 'ADHESIVO DE CUBETA', 15, 0, 0, '2021-07-18', 1),
(34, 'MAQUIRA-196', 'ADHESIVO MAQUIRA BOND 2.1', 15, 0, 0, '2021-07-19', 1),
(35, 'ULTRA-163', 'ADHESIVO PEAK 4ML', 37, 0, 0, '2021-07-20', 1),
(36, 'ZINZINE-102', 'AGUJAS  DENTAL  CORTAS', 9, 0, 0, '2021-07-21', 1),
(37, 'ZINZINE-103', 'AGUJAS  DENTAL  LARGA', 9, 0, 0, '2021-07-22', 1),
(38, 'ZINZINE-101', 'AGUJAS  EXTRACORTAS', 9, 0, 0, '2021-07-23', 1),
(39, 'MORELLI-101', 'ALAMBRE   EN ROLLO  500 GR 0 ,8 Y 1', 50, 0, 0, '2021-07-24', 1),
(40, 'VALDI-102', 'ALAMBRE  ACERO  COAXIAL TIRA  0 ,175 VALDI', 15, 0, 0, '2021-07-25', 1),
(41, 'GAC-120', 'ALAMBRE  ACERO  TIRA  CUADRADO  16X16 GAC', 22, 0, 0, '2021-07-26', 1),
(42, 'GAC-101', 'ALAMBRE  ACERO  TIRA  RECTANGULAR 17X25 GAC', 22, 0, 0, '2021-07-27', 1),
(43, 'GAC-119', 'ALAMBRE  ACERO  TIRA  REDONDA 0 ,18 GAC', 18, 0, 0, '2021-07-28', 1),
(44, 'GAC-117', 'ALAMBRE  ACERO  TIRA REDONDA  0 ,14 GAC', 18, 0, 0, '2021-07-29', 1),
(45, 'GAC-118', 'ALAMBRE  ACERO  TIRA REDONDA  0 ,16 GAC', 18, 0, 0, '2021-07-30', 1),
(46, 'GAC-100', 'ALAMBRE  AUTRALIANO WILCOX  ROLLO NARANJA  0 ,18 GAC', 27, 0, 0, '2021-07-31', 1),
(47, 'VALDI-103', 'ALAMBRE  DE  LATON 0 ,16 VALDI', 10, 0, 0, '2021-08-01', 1),
(48, 'VALDI-105', 'ALAMBRE  DE  LATON 0 ,20 VALDI', 10, 0, 0, '2021-08-02', 1),
(49, 'VALDI-104', 'ALAMBRE  DE LATON 0 ,18 VALDI', 10, 0, 0, '2021-08-03', 1),
(50, 'MORELLI-169', 'ALAMBRE  EN ROLLO  DE 50 GR  07-08-09', 15, 0, 0, '2021-08-04', 1),
(51, 'VALDI-113', 'ALAMBRE  EN TIRA 0 , 30 VALDI', 5, 0, 0, '2021-08-05', 1),
(52, 'VALDI-101', 'ALAMBRE ACERO  COAXIAL  TIRA 0 ,155 VALDI', 15, 0, 0, '2021-08-06', 1),
(53, 'MORELLI-205', 'ALAMBRE ACERO 0,14', 4, 0, 0, '2021-08-07', 1),
(54, 'MORELLI-204', 'ALAMBRE ACERO 0,16', 4, 0, 0, '2021-08-08', 1),
(55, 'MORELLI-206', 'ALAMBRE ACERO 0,18', 4, 0, 0, '2021-08-09', 1),
(56, 'MORELLI-207', 'ALAMBRE ACERO 16X22 INFERIOR', 5, 0, 0, '2021-08-10', 1),
(57, 'OC-243', 'ALAMBRE ACERO 16X22 SUPERIRO', 5, 0, 0, '2021-08-11', 1),
(58, 'MORELLI-235', 'ALAMBRE ACERO 19X25 INFERIOR', 5, 0, 0, '2021-08-12', 1),
(59, 'OC-251', 'ALAMBRE ACERO 19X25 SUPERIRO', 5, 0, 0, '2021-08-13', 1),
(60, 'BORG-118', 'ALAMBRE DE ACERO 17X25 BORG', 25, 0, 0, '2021-08-14', 1),
(61, 'VALDI-129', 'ALAMBRE EN BARRA 0,30 MM X 10 UNID VALDI', 5, 0, 0, '2021-08-15', 1),
(62, 'MORELLI-114', 'ALAMBRE EN TUBO 0 ,10 MORELLI', 8, 0, 0, '2021-08-16', 1),
(63, 'MORELLI-172', 'ALAMBRE EN TUBO 0 ,7 MORELLI', 8, 0, 0, '2021-08-17', 1),
(64, 'MORELLI-173', 'ALAMBRE EN TUBO 0 ,8 MORELLI', 8, 0, 0, '2021-08-18', 1),
(65, 'MORELLI-174', 'ALAMBRE EN TUBO 0 ,9 MORELLI', 8, 0, 0, '2021-08-19', 1),
(66, 'OC-235', 'ALAMBRE NITI 0,14 INFERIOR', 6, 0, 0, '2021-08-20', 1),
(67, 'OC-242', 'ALAMBRE NITI 0,14 SUPERIOR MORRELLI', 6, 0, 0, '2021-08-21', 1),
(68, 'OC-237', 'ALAMBRE NITI 0,16 INFERIOR', 6, 0, 0, '2021-08-22', 1),
(69, 'OC-241', 'ALAMBRE NITI 0,16 SUPERIOR', 6, 0, 0, '2021-08-23', 1),
(70, 'OC-244', 'ALAMBRE NITI 0,18 INFERIOR', 6, 0, 0, '2021-08-24', 1),
(71, 'OC-240', 'ALAMBRE NITI 0,18 SUPERIOR', 6, 0, 0, '2021-08-25', 1),
(72, 'OC-236', 'ALAMBRE NITI 16X22', 10, 0, 0, '2021-08-26', 1),
(73, 'OC-239', 'ALAMBRE NITI 17X25', 10, 0, 0, '2021-08-27', 1),
(74, 'OC-238', 'ALAMBRE NITI 19X25', 10, 0, 0, '2021-08-28', 1),
(75, 'OC-250', 'ALAMBRE TERMICO 0,14', 6, 0, 0, '2021-08-29', 1),
(76, 'OC-249', 'ALAMBRE TERMICO 0,16', 6, 0, 0, '2021-08-30', 1),
(77, 'OC-248', 'ALAMBRE TERMICO 0,18', 6, 0, 0, '2021-08-31', 1),
(78, 'OC-247', 'ALAMBRE TERMICO 16X22', 10, 0, 0, '2021-09-01', 1),
(79, 'OC-246', 'ALAMBRE TERMICO 19X25', 10, 0, 0, '2021-09-02', 1),
(80, 'OC-245', 'ALAMBRE TRENZADO PARA RETENEDOR FIJO EN ROLLO OC', 15, 0, 0, '2021-09-03', 1),
(81, 'CARMEN-100-0', 'ALCOHOL  1 LITRO', 8.77, 0, 0, '2021-09-04', 1),
(82, 'CARMEN-101-1', 'ALCOHOL  4 ONZAS', 2.92, 0, 0, '2021-09-05', 1),
(83, 'CARMEN-102', 'ALCOHOL  8 ONZAS', 4.75, 0, 0, '2021-09-06', 1),
(84, 'CAVEX-153', 'ALGINATO  CA 37 NORMAL', 9, 0, 0, '2021-09-07', 1),
(85, 'CAVEX-152', 'ALGINATO  CA 37 RAPIDO', 9, 0, 0, '2021-09-08', 1),
(86, 'CAVEX-131', 'ALGINATO  CREAM', 12, 0, 0, '2021-09-09', 1),
(87, 'VIPI-199', 'ALGINATO  DENCRIGEL', 6.5, 0, 0, '2021-09-10', 1),
(88, 'CAVEX-150', 'ALGINATO  ORTHODONCIA', 11, 0, 0, '2021-09-11', 1),
(89, 'CAVEX-165', 'ALGINATO CROMATICO', 12, 0, 0, '2021-09-12', 1),
(90, 'ANELSAM-149', 'ALGODON  ROLLO  BOLSA  X 10 ROLLOS', 6, 0, 0, '2021-09-13', 1),
(91, 'ANELSAM-148', 'ALGODON EN ROLLO   UNIDAD', 1, 0, 0, '2021-09-14', 1),
(92, 'PROSAN-100', 'ALGODON EN ROLLO DE (1 LIBRA)', 6, 0, 0, '2021-09-15', 1),
(93, 'PROSAN-101', 'ALGODON PROSAN (1/2 LIBRA)', 3, 0, 0, '2021-09-16', 1),
(94, 'MORELLI-195', 'ALMOHADILLA CERVICALES', 15, 0, 0, '2021-09-17', 1),
(95, 'CAVEX-154', 'AMALGALMA  EN CAPSULAS  DE UNA PORCION', 1, 0, 0, '2021-09-18', 1),
(96, 'CAVEX-144', 'AMALGALMA  EN CAPSULAS  DE UNA PORCION  FRASCO', 0.8, 0, 0, '2021-09-19', 1),
(97, 'CAVEX-155', 'AMALGAMA   EN CAPSULAS DE DOS  PORCIONES', 1.5, 0, 0, '2021-09-20', 1),
(98, 'CAVEX-145', 'AMALGAMA   EN CAPSULAS DE DOS  PORCIONES FRASCO X 100 UNIDAS', 1.2, 0, 0, '2021-09-21', 1),
(99, 'ANELSAM-193', 'AMALGAMADOR  ELECTRICO', 250, 0, 0, '2021-09-22', 1),
(100, 'ULTRA-171', 'AMELOGEN PLUS X 15', 254, 0, 0, '2021-09-23', 1),
(101, 'ULTRA-176', 'AMELOGEN PLUS X 7', 150, 0, 0, '2021-09-24', 1),
(102, 'RAX120', 'ANALISIS CEFALOMETRICO', 10, 0, 0, '2021-09-25', 1),
(103, 'ALTAM-101', 'ANTIBENZIL EN   GALON  AMARILLO', 12, 0, 0, '2021-09-26', 1),
(104, 'MAQUIRA-101', 'APPLIC RESTAURADOR TEMPORAL', 12, 0, 0, '2021-09-27', 1),
(105, 'GAC-138', 'ARCO   DOBLE LLAVE  P/CIERRE INFERIOR  16X22 ,19X25', 5, 0, 0, '2021-09-28', 1),
(106, 'OC-129', 'ARCO  DE ACERO  SUP   0 ,12  OC', 4, 0, 0, '2021-09-29', 1),
(107, 'OC-135', 'ARCO  DE ACERO  SUP 0 ,18 OC', 4, 0, 0, '2021-09-30', 1),
(108, 'OC-131', 'ARCO  DE ACERO SUP 0 ,14 OC', 4, 0, 0, '2021-10-01', 1),
(109, 'OC-136', 'ARCO  DE ACEROS  INF 0 ,18 OC', 4, 0, 0, '2021-10-02', 1),
(110, 'ANELSAM-194', 'ARCO  DE NEY  CON CEGUETA NACIONAL', 10, 0, 0, '2021-10-03', 1),
(111, 'OC-168', 'ARCO  DE UNA  LLAVE', 2.5, 0, 0, '2021-10-04', 1),
(112, 'BIOART-105', 'ARCO  FACIAL  ELITE', 150, 0, 0, '2021-10-05', 1),
(113, 'OC-121', 'ARCO  SENTALLOY SUP 0 ,14 OC', 20, 0, 0, '2021-10-06', 1),
(114, 'GAC-111', 'ARCO ACERO INFERIOR 21X25 GAC', 12, 0, 0, '2021-10-07', 1),
(115, 'GAC-131', 'ARCO ACERO SUPERIOR 17X22', 12, 0, 0, '2021-10-08', 1),
(116, 'GAC-132', 'ARCO ACERO SUPERIOR 21X25', 12, 0, 0, '2021-10-09', 1),
(117, 'OC-132', 'ARCO DE  ACERO INF 0 ,14 OC', 4, 0, 0, '2021-10-10', 1),
(118, 'OC-134', 'ARCO DE ACERO  INF  0 ,16 OC', 4, 0, 0, '2021-10-11', 1),
(119, 'OC-138', 'ARCO DE ACERO  INF 16X16 OC', 5, 0, 0, '2021-10-12', 1),
(120, 'OC-133', 'ARCO DE ACERO  SUP   0 ,16 OC', 4, 0, 0, '2021-10-13', 1),
(121, 'OC-137', 'ARCO DE ACERO  SUPERIOR  16X16 OC', 5, 0, 0, '2021-10-14', 1),
(122, 'OC-130', 'ARCO DE ACERO INF  0 ,12  OC', 4, 0, 0, '2021-10-15', 1),
(123, 'OC-140', 'ARCO DE ACERO INF  19X25 OC', 5, 0, 0, '2021-10-16', 1),
(124, 'OC-139', 'ARCO DE ACERO SUP 19X25 OC', 5, 0, 0, '2021-10-17', 1),
(125, 'MORELLI-171', 'ARCO DE CURVA REVERSA RECTANGULAR', 10, 0, 0, '2021-10-18', 1),
(126, 'MORELLI-170', 'ARCO DE CURVA REVERSA REDONDOS', 6, 0, 0, '2021-10-19', 1),
(127, 'NITI-101', 'ARCO DE NITI ESTETICO RECTANGULAR MORRELLI', 10, 0, 0, '2021-10-20', 1),
(128, 'AWAN-166', 'ARCO DE YOUNG   METALICO AWAN', 5, 0, 0, '2021-10-21', 1),
(129, 'MAQUIRA-143', 'ARCO DE YOUNG  PLASTICA', 3.5, 0, 0, '2021-10-22', 1),
(130, 'BIOART-104', 'ARCO FACIAL  STANDARD', 75, 0, 0, '2021-10-23', 1),
(131, 'DENFLEX-113', 'ARCO FACIAL DENFLEX', 75, 0, 0, '2021-10-24', 1),
(132, 'MORELLI-140', 'ARCO NITI INF  0 ,16 MORELLI', 6, 0, 0, '2021-10-25', 1),
(133, 'MORELLI-138', 'ARCO NITI INF 0 ,14 MORELLI', 6, 0, 0, '2021-10-26', 1),
(134, 'OC-144', 'ARCO NITI INF 0 ,14 OC', 6, 0, 0, '2021-10-27', 1),
(135, 'OC-146', 'ARCO NITI INF 0 ,16 OC', 6, 0, 0, '2021-10-28', 1),
(136, 'MORELLI-142', 'ARCO NITI INF 0 ,18 MORELLI', 6, 0, 0, '2021-10-29', 1),
(137, 'OC-148', 'ARCO NITI INF 0 ,18 OC', 6, 0, 0, '2021-10-30', 1),
(138, 'MORELLI-144', 'ARCO NITI INF 16X16 MORELLI', 10, 0, 0, '2021-10-31', 1),
(139, 'OC-173', 'ARCO NITI INF 16X16 OC', 10, 0, 0, '2021-11-01', 1),
(140, 'MORELLI-146', 'ARCO NITI INF 16X22 MORELLI', 10, 0, 0, '2021-11-02', 1),
(141, 'OC-150', 'ARCO NITI INF 16X22 OC', 10, 0, 0, '2021-11-03', 1),
(142, 'MORELLI-148', 'ARCO NITI INF 19X25 MORELLI', 10, 0, 0, '2021-11-04', 1),
(143, 'OC-152', 'ARCO NITI INF 19X25 OC', 10, 0, 0, '2021-11-05', 1),
(144, 'MORELLI-139', 'ARCO NITI SUP  0 ,16 MORELLI', 6, 0, 0, '2021-11-06', 1),
(145, 'OC-143', 'ARCO NITI SUP 0 ,14 OC', 6, 0, 0, '2021-11-07', 1),
(146, 'OC-145', 'ARCO NITI SUP 0 ,16 OC', 6, 0, 0, '2021-11-08', 1),
(147, 'MORELLI-141', 'ARCO NITI SUP 0 ,18 MORELLI', 6, 0, 0, '2021-11-09', 1),
(148, 'OC-147', 'ARCO NITI SUP 0 ,18 OC', 6, 0, 0, '2021-11-10', 1),
(149, 'OC-172', 'ARCO NITI SUP 16X16', 10, 0, 0, '2021-11-11', 1),
(150, 'MORELLI-143', 'ARCO NITI SUP 16X16 MORELLI', 10, 0, 0, '2021-11-12', 1),
(151, 'MORELLI-145', 'ARCO NITI SUP 16X22 MORELLI', 10, 0, 0, '2021-11-13', 1),
(152, 'OC-149', 'ARCO NITI SUP 16X22 OC', 10, 0, 0, '2021-11-14', 1),
(153, 'MORELLI-147', 'ARCO NITI SUP 19X25 MORELLI', 10, 0, 0, '2021-11-15', 1),
(154, 'OC-151', 'ARCO NITI SUP19X25 OC', 10, 0, 0, '2021-11-16', 1),
(155, 'OC-141', 'ARCO NITTI  SUP  0 ,12 OC', 6, 0, 0, '2021-11-17', 1),
(156, 'OC-142', 'ARCO NITTI INF  0 ,12 OC', 6, 0, 0, '2021-11-18', 1),
(157, 'MORELLI-150', 'ARCO NITTI INF  17X25 MORELLI', 10, 0, 0, '2021-11-19', 1),
(158, 'MORELLI-149', 'ARCO NITTI SUP 17X25 MORELLI', 10, 0, 0, '2021-11-20', 1),
(159, 'OC-264', 'ARCO PITS BROAD BT RIGIDO  20X20', 18, 0, 0, '2021-11-21', 1),
(160, 'OC-265', 'ARCO PITS BROAD TA  TERMICO 0.14', 18, 0, 0, '2021-11-22', 1),
(161, 'OC-262', 'ARCO PITS BROAD ULTRA SOFT TA 18X18', 18, 0, 0, '2021-11-23', 1),
(162, 'OC-263', 'ARCO PITS BROAD ULTRA SOFT TA 20X20', 18, 0, 0, '2021-11-24', 1),
(163, 'OC-112', 'ARCO SENTALLOY  INF 0 ,14 OC', 20, 0, 0, '2021-11-25', 1),
(164, 'OC-111', 'ARCO SENTALLOY  INF 0 ,16 OC', 20, 0, 0, '2021-11-26', 1),
(165, 'OC-175', 'ARCO THERMO  INF 0 ,12 OC', 6, 0, 0, '2021-11-27', 1),
(166, 'OC-179', 'ARCO THERMO  INF 16X16 OC', 10, 0, 0, '2021-11-28', 1),
(167, 'OC-181', 'ARCO THERMO INF  0 ,14 OC', 6, 0, 0, '2021-11-29', 1),
(168, 'MORELLI-152', 'ARCO THERMO INF 0 ,12 MORELLI', 6, 0, 0, '2021-11-30', 1),
(169, 'MORELLI-154', 'ARCO THERMO INF 0 ,14 MORELLI', 6, 0, 0, '2021-12-01', 1),
(170, 'OC-177', 'ARCO THERMO INF 0 ,14 OC', 6, 0, 0, '2021-12-02', 1),
(171, 'MORELLI-156', 'ARCO THERMO INF 0 ,16 MORELLI', 6, 0, 0, '2021-12-03', 1),
(172, 'OC-114', 'ARCO THERMO INF 0 ,16 OC', 6, 0, 0, '2021-12-04', 1),
(173, 'MORELLI-158', 'ARCO THERMO INF 0 ,18 MORELLI', 6, 0, 0, '2021-12-05', 1),
(174, 'OC-103', 'ARCO THERMO INF 0 ,18 OC', 6, 0, 0, '2021-12-06', 1),
(175, 'MORELLI-160', 'ARCO THERMO INF 16X16 MORELLI', 10, 0, 0, '2021-12-07', 1),
(176, 'MORELLI-162', 'ARCO THERMO INF 16X22 MORELLI', 10, 0, 0, '2021-12-08', 1),
(177, 'OC-116', 'ARCO THERMO INF 16X22 OC', 10, 0, 0, '2021-12-09', 1),
(178, 'MORELLI-112', 'ARCO THERMO INF 19X25 MORELLI', 10, 0, 0, '2021-12-10', 1),
(179, 'OC-118', 'ARCO THERMO INF 19X25 OC', 10, 0, 0, '2021-12-11', 1),
(180, 'MORELLI-151', 'ARCO THERMO SUP 0 ,12 MORELLI', 6, 0, 0, '2021-12-12', 1),
(181, 'OC-174', 'ARCO THERMO SUP 0 ,12 OC', 6, 0, 0, '2021-12-13', 1),
(182, 'OC-176', 'ARCO THERMO SUP 0 ,14', 6, 0, 0, '2021-12-14', 1),
(183, 'MORELLI-153', 'ARCO THERMO SUP 0 ,14 MORELLI', 6, 0, 0, '2021-12-15', 1),
(184, 'OC-180', 'ARCO THERMO SUP 0 ,14 OC', 6, 0, 0, '2021-12-16', 1),
(185, 'MORELLI-155', 'ARCO THERMO SUP 0 ,16 MORELLI', 6, 0, 0, '2021-12-17', 1),
(186, 'OC-113', 'ARCO THERMO SUP 0 ,16 OC', 6, 0, 0, '2021-12-18', 1),
(187, 'MORELLI-157', 'ARCO THERMO SUP 0 ,18 MORELLI', 6, 0, 0, '2021-12-19', 1),
(188, 'OC-102', 'ARCO THERMO SUP 0 ,18 OC', 6, 0, 0, '2021-12-20', 1),
(189, 'MORELLI-159', 'ARCO THERMO SUP 16X16 MORELLI', 10, 0, 0, '2021-12-21', 1),
(190, 'OC-182', 'ARCO THERMO SUP 16X16 OC', 10, 0, 0, '2021-12-22', 1),
(191, 'MORELLI-161', 'ARCO THERMO SUP 16X22 MORELLI', 10, 0, 0, '2021-12-23', 1),
(192, 'OC-115', 'ARCO THERMO SUP 16X22 OC', 10, 0, 0, '2021-12-24', 1),
(193, 'MORELLI-111', 'ARCO THERMO SUP 19X25 MORELLI', 10, 0, 0, '2021-12-25', 1),
(194, 'OC-117', 'ARCO THERMO SUP 19X25 OC', 10, 0, 0, '2021-12-26', 1),
(195, 'GAC-127', 'ARCOS  ACERO  INF  0 ,16 GAC', 6, 0, 0, '2021-12-27', 1),
(196, 'GAC-103', 'ARCOS  ACERO  TRENZADO  MULTIACUFORM INF  GAC', 33, 0, 0, '2021-12-28', 1),
(197, 'GAC-102', 'ARCOS  ACERO  TRENZADO  MULTIACUFORM SUP GAC', 33, 0, 0, '2021-12-29', 1),
(198, 'GAC-134', 'ARCOS  ACERO INF 0 ,14 GAC', 6, 0, 0, '2021-12-30', 1),
(199, 'GAC-128', 'ARCOS  ACERO SUP  0 ,18 GAC', 6, 0, 0, '2021-12-31', 1),
(200, 'GAC-133', 'ARCOS  ACERO SUP 0 ,14 GAC', 6, 0, 0, '2022-01-01', 1),
(201, 'MORELLI-122', 'ARCOS  DE  ACERO INF  0 ,14 MORELLI', 4, 0, 0, '2022-01-02', 1),
(202, 'MORELLI-121', 'ARCOS  DE  ACERO SUP  0 ,14 MORELLI', 4, 0, 0, '2022-01-03', 1),
(203, 'GAC-105', 'ARCOS  DE  ACEROS  TRENZADOS  CUADRADO  INF GAC', 33, 0, 0, '2022-01-04', 1),
(204, 'MORELLI-120', 'ARCOS  DE ACERO  INF  0 ,12  MORELLI', 4, 0, 0, '2022-01-05', 1),
(205, 'MORELLI-119', 'ARCOS  DE ACERO  SUP  0 ,12  MORELLI', 4, 0, 0, '2022-01-06', 1),
(206, 'MORELLI-133', 'ARCOS  DE ACERO  SUP  19X25 MORELLI', 5, 0, 0, '2022-01-07', 1),
(207, 'MORELLI-132', 'ARCOS  DE ACERO INF  17X25 MORELLI', 5, 0, 0, '2022-01-08', 1),
(208, 'MORELLI-125', 'ARCOS  DE ACERO SUP  0 ,18 MORELLI', 4, 0, 0, '2022-01-09', 1),
(209, 'MORELLI-127', 'ARCOS  DE ACERO SUP 16X16 MORELLI', 5, 0, 0, '2022-01-10', 1),
(210, 'MORELLI-129', 'ARCOS  DE ACERO SUP 16X22 MORELLI', 5, 0, 0, '2022-01-11', 1),
(211, 'GAC-142', 'ARCOS  EXTRAORALES  CON OMEGA  90 MM', 15, 0, 0, '2022-01-12', 1),
(212, 'MORELLI-108', 'ARCOS  EXTRAORALES  SIN  OMEGA  115 MM', 9, 0, 0, '2022-01-13', 1),
(213, 'GAC-107', 'ARCOS  NEOSENTALLOY  INF 18X25 GAC', 45, 0, 0, '2022-01-14', 1),
(214, 'GAC-124', 'ARCOS  NEOSENTALLOY  SUP 17X25 GAC', 45, 0, 0, '2022-01-15', 1),
(215, 'GAC-123', 'ARCOS  NEOSENTALLOY INF 21X25 GAC', 45, 0, 0, '2022-01-16', 1),
(216, 'MORELLI-137', 'ARCOS  NITI SUP 0 ,14 MORELLI', 6, 0, 0, '2022-01-17', 1),
(217, 'MORELLI-136', 'ARCOS  NITTI INF  0 ,12 MORELLI', 6, 0, 0, '2022-01-18', 1),
(218, 'MORELLI-135', 'ARCOS  NITTI SUP  0 ,12 MORELLI', 6, 0, 0, '2022-01-19', 1),
(219, 'GAC-108', 'ARCOS  SENTALLOY SUP 0 ,18 GAC', 25, 0, 0, '2022-01-20', 1),
(220, 'GAC-110', 'ARCOS ACERO  INFERIOR  16X22 GAC', 12, 0, 0, '2022-01-21', 1),
(221, 'GAC-129', 'ARCOS ACERO INF  0 ,18 GAC', 6, 0, 0, '2022-01-22', 1),
(222, 'GAC-135', 'ARCOS ACERO SUP  0 ,16 GAC', 6, 0, 0, '2022-01-23', 1),
(223, 'GAC-130', 'ARCOS ACERO SUP 16X22 GAC', 12, 0, 0, '2022-01-24', 1),
(224, 'MORELLI-130', 'ARCOS DE ACERO   INF  16X22 MORELLI', 5, 0, 0, '2022-01-25', 1),
(225, 'MORELLI-126', 'ARCOS DE ACERO  INF  0 ,18  MORELLI', 4, 0, 0, '2022-01-26', 1),
(226, 'MORELLI-134', 'ARCOS DE ACERO  INF 19X25 MORELLI', 5, 0, 0, '2022-01-27', 1),
(227, 'MORELLI-123', 'ARCOS DE ACERO  SUP 0 ,16 MORELLI', 4, 0, 0, '2022-01-28', 1),
(228, 'MORELLI-124', 'ARCOS DE ACERO INF   0 ,16 MORELLI', 4, 0, 0, '2022-01-29', 1),
(229, 'MORELLI-128', 'ARCOS DE ACERO INF  16X16 MORELLI', 5, 0, 0, '2022-01-30', 1),
(230, 'MORELLI-131', 'ARCOS DE ACERO SUP 17X25 MORELLI', 5, 0, 0, '2022-01-31', 1),
(231, 'GAC-125', 'ARCOS NEOSENTALLOY  INF 17X25 GAC', 45, 0, 0, '2022-02-01', 1),
(232, 'GAC-122', 'ARCOS NEOSENTALLOY SUP 18X25 GAC', 45, 0, 0, '2022-02-02', 1),
(233, 'GAC-126', 'ARCOS NEOSENTALLOY SUP 19X25 GAC', 45, 0, 0, '2022-02-03', 1),
(234, 'OC-101', 'ARCOS SENTALLOY  SUP 016 OC', 20, 0, 0, '2022-02-04', 1),
(235, 'GAC-109', 'ARCOS SENTALLOY INF 0 ,18 GAC', 25, 0, 0, '2022-02-05', 1),
(236, 'VIPI-203', 'ARENADOR  SANDSTORM EXPERT MCA', 250, 0, 0, '2022-02-06', 1),
(237, 'BIOART-106', 'ARENADOR PARA BRACKETS', 180, 0, 0, '2022-02-07', 1),
(238, 'VRC-106', 'ARENADOR VRC', 280.03, 0, 0, '2022-02-08', 1),
(239, 'STEEL-104', 'ARENADORA GRANDE', 450, 0, 0, '2022-02-09', 1),
(240, 'BIOART-111', 'ARTICULADOR    A7 PLUS ARCO FACIAL STANDARD', 250, 0, 0, '2022-02-10', 1),
(241, 'BIOART-100', 'ARTICULADOR  A7  PLUS  CON ARCO ELITE', 350, 0, 0, '2022-02-11', 1),
(242, 'AWAN-164', 'ARTICULADOR  CROMADO', 9, 0, 0, '2022-02-12', 1),
(243, 'BIOART-102', 'ARTICULADOR PADRONIZADO PARA ORTODONCIA', 600, 0, 0, '2022-02-13', 1),
(244, 'STEEL-144', 'ARTICULADOR PLASTICO DESCARTABLE', 3, 0, 0, '2022-02-14', 1),
(245, 'WHIPMIX-120', 'ARTICULADOR WIPMIX 2240', 650, 0, 0, '2022-02-15', 1),
(246, 'VRC-105', 'ASPIRADOR VRC', 250, 0, 0, '2022-02-16', 1),
(247, 'ULTRA-181', 'ASTRINGEDENT REFIL 30 ML', 45, 0, 0, '2022-02-17', 1),
(248, 'BIOART-103', 'AUTOCLAVE', 1200, 0, 0, '2022-02-18', 1),
(249, 'ANELSAM-129', 'BABERO DESCARTABLE BLANCO', 5, 0, 0, '2022-02-19', 1),
(250, 'EURONDA-122', 'BABERO EURONDA AMARILLO', 15, 0, 0, '2022-02-20', 1),
(251, 'EURONDA-124', 'BABERO EURONDA AZUL', 15, 0, 0, '2022-02-21', 1),
(252, 'EURONDA-125', 'BABERO EURONDA AZUL LIGTH', 15, 0, 0, '2022-02-22', 1),
(253, 'EURONDA-118', 'BABERO EURONDA BURGUNDY', 15, 0, 0, '2022-02-23', 1),
(254, 'EURONDA-121', 'BABERO EURONDA LILA', 15, 0, 0, '2022-02-24', 1),
(255, 'EURONDA-119', 'BABERO EURONDA LIMA', 15, 0, 0, '2022-02-25', 1),
(256, 'EURONDA-120', 'BABERO EURONDA ROSA', 15, 0, 0, '2022-02-26', 1),
(257, 'EURONDA-117', 'BABERO EURONDA VERDE ESMERALDA', 15, 0, 0, '2022-02-27', 1),
(258, 'EURONDA-123', 'BABERO EURONODA NARANJA', 15, 0, 0, '2022-02-28', 1),
(259, 'VALDI-116', 'BABEROS PARA  ADULTOS', 5, 0, 0, '2022-03-01', 1),
(260, 'VALDI-112', 'BABEROS PARA NIÑOS', 4, 0, 0, '2022-03-02', 1),
(261, 'BEYES-105', 'BALINERA DE REPUESTO MAXSO 200  ECONOMICA', 40, 0, 0, '2022-03-03', 1),
(262, 'BEYES-104', 'BALINERA DE REPUESTO MAXSO 800 CON LUZ', 90, 0, 0, '2022-03-04', 1),
(263, 'MEDID-101', 'BALINERAS  DE TURBINA  MEDIDENTAL', 25, 0, 0, '2022-03-05', 1),
(264, 'MAQUIRA-186', 'BANDA  MATRIZ EN  ROLLO  7X5', 3, 0, 0, '2022-03-06', 1),
(265, 'MAQUIRA-144', 'BANDA DE CELULOIDE', 2, 0, 0, '2022-03-07', 1),
(266, 'ANELSAM-237', 'BANDA MATRIZ 5X5', 5, 0, 0, '2022-03-08', 1),
(267, 'MAQUIRA-187', 'BANDA MATRIZ EN ROLLO  5X5', 3, 0, 0, '2022-03-09', 1),
(268, 'ANELSAM-150', 'BANDA MATRIZ EN TIRA  X 12', 1.5, 0, 0, '2022-03-10', 1),
(269, 'ULTRA-104', 'BANDA MATRIZ ULTRADENT', 32, 0, 0, '2022-03-11', 1),
(270, 'MORELLI-192', 'BANDAS CON TUBO MORELLI', 3.5, 0, 0, '2022-03-12', 1),
(271, 'GAC-141', 'BANDAS GAC CON TUBO', 5, 0, 0, '2022-03-13', 1),
(272, 'GAC-140', 'BANDAS GAC LISAS', 2.2, 0, 0, '2022-03-14', 1),
(273, 'AHKIMP-112', 'BANDAS LISAS  AKP', 2, 0, 0, '2022-03-15', 1),
(274, 'MORELLI-191', 'BANDAS LISAS MORELLI', 2, 0, 0, '2022-03-16', 1),
(275, 'STEEL-139', 'BANDEJA  PLASTICAS  LISA', 5, 0, 0, '2022-03-17', 1),
(276, 'STEEL-137', 'BANDEJA PLASTICA CON CANALETA', 5, 0, 0, '2022-03-18', 1),
(277, 'ANELSAM-133', 'BARNIZ  DENTAL COPAL', 6, 0, 0, '2022-03-19', 1),
(278, 'GAC-139', 'BARRA PALATINA GAC', 3, 0, 0, '2022-03-20', 1),
(279, 'CLEMDE-101', 'BASE  PLASTICA   PARA    INVESTIR  METAL  LITHIUM 100 GRAMOS', 20, 0, 0, '2022-03-21', 1),
(280, 'CLEMDE-102', 'BASE PLASTICA PARA  INVESTIR  LITHIUM  200 GRAMOS', 40, 0, 0, '2022-03-22', 1),
(281, 'ANELSAM-242', 'BATA QUIRURGICAS PAQUETE X 100', 20, 0, 0, '2022-03-23', 1),
(282, 'ANELSAM-151', 'BATAS   QUIRUGICAS UNIDAD', 3, 0, 0, '2022-03-24', 1),
(283, 'ANELSAM-275', 'BATAS  QUIRUGICAS x 10', 25, 0, 0, '2022-03-25', 1),
(284, 'RAX-489', 'BIMAXILAR CON LECTURA', 140, 0, 0, '2022-03-26', 1),
(285, 'RAX-488', 'BIMAXILAR SIN LECTURA', 80, 0, 0, '2022-03-27', 1),
(286, 'BIOART-107', 'BIO CAMARA', 170, 0, 0, '2022-03-28', 1),
(287, 'ANELSAM-195', 'BISTTURI  12X CAJAS  X 100', 20, 0, 0, '2022-03-29', 1),
(288, 'ANELSAM-182', 'BISTURI 15 X UNIDAD', 0.25, 0, 0, '2022-03-30', 1),
(289, 'ANELSAM-131', 'BLANCO ESPAÑA', 3, 0, 0, '2022-03-31', 1),
(290, 'CAVEX-102', 'BLANQUEAMIENTO', 50, 0, 0, '2022-04-01', 1),
(291, 'ULTRA-160', 'BLANQUEAMIENTO 40% BOOST', 52, 0, 0, '2022-04-02', 1),
(292, 'ULTRA-142-1', 'BLOCK OUT RESINA INDIVIDUAL', 5, 0, 0, '2022-04-03', 1),
(293, 'MAQUIRA-145', 'BLOQUE MORDIDA', 5, 0, 0, '2022-04-04', 1),
(294, 'STEEL-131', 'BOCA SALTARINA', 4, 0, 0, '2022-04-05', 1),
(295, 'EURONDA-104', 'BOLSA  ESTERILIZAR EURONDA', 30, 0, 0, '2022-04-06', 1),
(296, 'ANELSAM-132', 'BOLSA  PARA  ESTERILIZAS  2 1/4X4 CM', 6, 0, 0, '2022-04-07', 1),
(297, 'ANELSAM-153', 'BOLSA  PARA ESTERILIZAS  5 1/4X 11CM', 16, 0, 0, '2022-04-08', 1),
(298, 'EURONDA-116', 'BOLSA DE ALGODO EN ROLLO 9 UNID', 9, 0, 0, '2022-04-09', 1),
(299, 'ANELSAM-152', 'BOLSA PARA ESTERILIZAR   3 1/2X 10 CM', 14, 0, 0, '2022-04-10', 1),
(300, 'ULTRA-144', 'BOLSA PARA LAMPARA VALO', 67.9, 0, 0, '2022-04-11', 1),
(301, 'ULTRA-212', 'BOLSA PARA VALO GRAND 100 UNIDADES', 25, 0, 0, '2022-04-12', 1),
(302, 'OC-166', 'BOTONES  CON MALLA  CURVA', 2.5, 0, 0, '2022-04-13', 1),
(303, 'OC-222', 'BRACKET AUTOLIGADO H4  METALICO OC', 100, 0, 0, '2022-04-14', 1),
(304, 'ULTRA-137', 'BRACKET ESTETICO HYPE MORRELLI', 70, 0, 0, '2022-04-15', 1),
(305, 'MORELLI-199', 'BRACKET ROTH  LIGHT  0 ,22 MORELLI', 16, 0, 0, '2022-04-16', 1),
(306, 'MORELLI-197', 'BRACKET ROTH  MAX 0 ,22 MORELLI', 16, 0, 0, '2022-04-17', 1),
(307, 'OC-187', 'BRACKET ROTH 0,18 (10 UNIDADES)', 160, 0, 0, '2022-04-18', 1),
(308, 'OC-267', 'BRACKET ROTH 0,18 (5 UNIDADES)', 80, 0, 0, '2022-04-19', 1),
(309, 'OC-266', 'BRACKET ROTH 0,22 (5 UNIDADES)', 80, 0, 0, '2022-04-20', 1),
(310, 'MORELLI-198', 'BRACKET ROTH MAX  0 ,18 MORELLI', 16, 0, 0, '2022-04-21', 1),
(311, 'OC-188', 'BRACKET ROTH OC 0,18', 20, 0, 0, '2022-04-22', 1),
(312, 'OC-189', 'BRACKET ROTH OC 0,22 (10 UNIDADES)', 160, 0, 0, '2022-04-23', 1),
(313, 'MORELLI-200', 'BRACKET ZAFIRO EYRCLEAR 0,22  MORELLI', 130, 0, 0, '2022-04-24', 1),
(314, 'BORG-119', 'BRACKETS   CLEAR  C/ SLOT METALICOS 0 ,18 BORGATTA', 25, 0, 0, '2022-04-25', 1),
(315, 'MORELLI-181', 'BRACKETS   MBT  MORELLI', 16, 0, 0, '2022-04-26', 1),
(316, 'OC-160', 'BRACKETS   MBT  OC 0 ,18', 16, 0, 0, '2022-04-27', 1),
(317, 'AHKIMP-107', 'BRACKETS  0 ,18 ROTH  LIGHT AKP', 18, 0, 0, '2022-04-28', 1),
(318, 'AHKIMP-108', 'BRACKETS  0 ,22 ROTH  LIGHT AKP', 18, 0, 0, '2022-04-29', 1),
(319, 'OC-104', 'BRACKETS  AUTOLIGADO  H4  TRANSPARENTE', 240, 0, 0, '2022-04-30', 1),
(320, 'BORG-120', 'BRACKETS  CLEAR   C/SLOT  METALICOS 0 ,22BORGATTA', 25, 0, 0, '2022-05-01', 1),
(321, 'OC-155', 'BRACKETS  DE ZAFIRO OC', 130, 0, 0, '2022-05-02', 1),
(322, 'MORELLI-175', 'BRACKETS  ESTANDAR   0 ,18 MORRELLI', 12, 0, 0, '2022-05-03', 1),
(323, 'MORELLI-176', 'BRACKETS  ESTANDAR   0 ,22 MORRELLI', 12, 0, 0, '2022-05-04', 1),
(324, 'AHKIMP-105', 'BRACKETS  FLEX 0 ,18 AKP', 40, 0, 0, '2022-05-05', 1),
(325, 'AHKIMP-106', 'BRACKETS  FLEX 0 ,22 AKP', 40, 0, 0, '2022-05-06', 1),
(326, 'OC-161', 'BRACKETS  MBT  OC  0,22', 16, 0, 0, '2022-05-07', 1),
(327, 'OC-156', 'BRACKETS  POLICARBONATO HYPE OC', 70, 0, 0, '2022-05-08', 1),
(328, 'OC-261', 'BRACKETS AUTOLIGADO PIT 21', 125, 0, 0, '2022-05-09', 1),
(329, 'MORELLI-163', 'BRACKETS COMPUESTOS 0 ,22 MORRELLI', 30, 0, 0, '2022-05-10', 1),
(330, 'GAC-112', 'BRACKETS DE PORCELANA  ALLURE GAC', 130, 0, 0, '2022-05-11', 1),
(331, 'OVATION-100', 'BRACKETS OVATION 0.22', 90, 0, 0, '2022-05-12', 1),
(332, 'OC-153', 'BRACKETS ROTH  0 ,18 OC', 20, 0, 0, '2022-05-13', 1),
(333, 'OC-154', 'BRACKETS ROTH  0 ,22 OC', 20, 0, 0, '2022-05-14', 1),
(334, 'MORELLI-203', 'BRACKETS ROTH  LIGHT  0 ,18 MORELLI', 16, 0, 0, '2022-05-15', 1),
(335, 'OC-119', 'BRACKETS ROTH OC  0 ,18 PAQ X 10', 160, 0, 0, '2022-05-16', 1),
(336, 'OC-120', 'BRACKETS ROTH OC 0 ,22 PAQUETE X 10', 160, 0, 0, '2022-05-17', 1),
(337, 'ULTRA-198', 'BROCA NO , 0', 28.7, 0, 0, '2022-05-18', 1),
(338, 'ULTRA-202', 'BROCA NO , 1', 28.7, 0, 0, '2022-05-19', 1),
(339, 'ULTRA-201', 'BROCA NO , 2', 28.7, 0, 0, '2022-05-20', 1),
(340, 'ULTRA-103', 'BROCA PARA COLOCAR PINES METALICOS', 10, 0, 0, '2022-05-21', 1),
(341, 'AHKIMP-109', 'BROCHE DE MUELAS  DE  SOLAPA', 6, 0, 0, '2022-05-22', 1),
(342, 'AWAN-196', 'BRUÑIDOR  DE HUEVO', 2.8, 0, 0, '2022-05-23', 1),
(343, 'STEEL-132', 'CABALLETE  PORTAPINZAS  DE ACRILICO', 15, 0, 0, '2022-05-24', 1),
(344, 'ANELSAM-267', 'CABALLETE METALICO PORTA PINZAS', 20, 0, 0, '2022-05-25', 1),
(345, 'ANELSAM-196', 'CABEZAS DE COMPRESOR DE 1 HP', 200, 0, 0, '2022-05-26', 1),
(346, 'MORELLI-193', 'CADENA MINIPUENTE', 20, 0, 0, '2022-05-27', 1),
(347, 'MORELLI-185', 'CADENAS  CORTAS MORRELLI', 7, 0, 0, '2022-05-28', 1),
(348, 'OC-163', 'CADENAS CONTINUAS OC', 10, 0, 0, '2022-05-29', 1),
(349, 'OC-164', 'CADENAS CORTAS OC', 10, 0, 0, '2022-05-30', 1),
(350, 'ANELSAM-174', 'CADENAS DE BABEROS PLASTICOS', 1.5, 0, 0, '2022-05-31', 1),
(351, 'MORELLI-186', 'CADENAS LARGAS MORRELLI', 7, 0, 0, '2022-06-01', 1),
(352, 'OC-162', 'CADENAS LARGAS OC', 10, 0, 0, '2022-06-02', 1),
(353, 'MAQUIRA-112', 'CADENAS METALICAS PARA BABEROS', 2.5, 0, 0, '2022-06-03', 1),
(354, 'STARKIT-101', 'CAJA DE MASCARILLA KN95', 52, 0, 0, '2022-06-04', 1),
(355, 'MAQUIRA-175', 'CAJA DE ORTODONCIA EN PAQUETE X 10', 8, 0, 0, '2022-06-05', 1),
(356, 'MAQUIRA-166', 'CAJA DE ORTODONCIA INDIVIDUAL', 1.5, 0, 0, '2022-06-06', 1),
(357, 'ANELSAM-209', 'CAJA PLANO AZUL DE  2 BANDEJAS', 40, 0, 0, '2022-06-07', 1),
(358, 'ANELSAM-208', 'CAJA PLANO ROJA DE 1 BANDEJAS', 30, 0, 0, '2022-06-08', 1),
(359, 'ANELSAM-210', 'CAJA PLANO ROSA  DE 2 BANDEJAS', 40, 0, 0, '2022-06-09', 1),
(360, 'ANELSAM-211', 'CAJA PLANO VERDE   DE 3 BANDEJAS', 45, 0, 0, '2022-06-10', 1),
(361, 'VALDI-106', 'CAJA REVELADORA PLASTICA', 40, 0, 0, '2022-06-11', 1),
(362, 'ABADENT-104', 'CAJA VERASOFT', 44, 0, 0, '2022-06-12', 1),
(363, 'ANELSAM-271', 'CAJAS PLASTICAS PORTAMODELOS', 3, 0, 0, '2022-06-13', 1),
(364, 'AHKIMP-110', 'CALCOMANIA AH KIM PECH', 3, 0, 0, '2022-06-14', 1),
(365, 'ANELSAM-102', 'CALENTADOR DE CERA', 90, 0, 0, '2022-06-15', 1),
(366, 'AWAN-167', 'CALIBRADOR  DE CERA AWAN', 10, 0, 0, '2022-06-16', 1),
(367, 'AWAN-102', 'CALIBRADOR DE BOLEY', 20, 0, 0, '2022-06-17', 1),
(368, 'AWAN-168', 'CALIBRADOR DE METAL AWAN', 10, 0, 0, '2022-06-18', 1),
(369, 'EURONDA-160', 'CAMPO QUIRURGICO CUADRADO', 3, 0, 0, '2022-06-19', 1),
(370, 'EURONDA-161', 'CAMPO QUIRURGICO FENESTRADO', 8, 0, 0, '2022-06-20', 1),
(371, 'EURONDA-136', 'CAMPOS EURONDA AZUL CAPRI', 3, 0, 0, '2022-06-21', 1),
(372, 'EURONDA-128', 'CAMPOS EURONDA AZUL LIGHT', 3, 0, 0, '2022-06-22', 1),
(373, 'EURONDA-132', 'CAMPOS EURONDA COLOR BURGUNDY', 3, 0, 0, '2022-06-23', 1),
(374, 'EURONDA-126', 'CAMPOS EURONDA LILA', 3, 0, 0, '2022-06-24', 1),
(375, 'EURONDA-134', 'CAMPOS EURONDA LIMA', 3, 0, 0, '2022-06-25', 1),
(376, 'EURONDA-135', 'CAMPOS EURONDA NARANJA', 3, 0, 0, '2022-06-26', 1),
(377, 'EURONDA-133', 'CAMPOS EURONDA NEGRO', 3, 0, 0, '2022-06-27', 1),
(378, 'EURONDA-127', 'CAMPOS EURONDA ROSADO', 3, 0, 0, '2022-06-28', 1),
(379, 'EURONDA-130', 'CAMPOS EURONDA VERDE', 3, 0, 0, '2022-06-29', 1),
(380, 'EURONDA-131', 'CAMPOS EURONDA VERDE ESMERALDA', 3, 0, 0, '2022-06-30', 1),
(381, 'STEEL-130', 'CARNET DE CITAS', 7, 0, 0, '2022-07-01', 1),
(382, 'AWAN-224', 'CASO METALICO MEDIANO', 20, 0, 0, '2022-07-02', 1),
(383, 'AWAN-101', 'CASO METALICO PORTA LIMA', 15, 0, 0, '2022-07-03', 1),
(384, 'STEEL-149', 'CASO PLASTICO REDONDO AZUL', 10, 0, 0, '2022-07-04', 1),
(385, 'DENFLEX-115', 'CAVITRON NEUMATICO DENFLEX', 130, 0, 0, '2022-07-05', 1),
(386, 'WOODP-100', 'CAVITRON WOODPECKER', 400, 0, 0, '2022-07-06', 1),
(387, 'DENST-100', 'CEGUETA MAS CIERRA', 45, 0, 0, '2022-07-07', 1),
(388, 'ANELSAM-244', 'CEGUETA NACIONAL', 10, 0, 0, '2022-07-08', 1),
(389, 'BJM-101', 'CEMENTO DE ENDODONCIA BJM', 45, 0, 0, '2022-07-09', 1),
(390, 'SUBITON-111', 'CEMENTO DE POLICARBOXILATO', 10, 0, 0, '2022-07-10', 1),
(391, 'BORG-112', 'CEMENTO IONOMERO PARA BANDAS', 25, 0, 0, '2022-07-11', 1),
(392, 'BORG-113', 'CEMENTO OXIFOSFATO CON FLUOR PARA BANDAS', 25, 0, 0, '2022-07-12', 1),
(393, 'BORG-114', 'CEMENTO PARA ENDODONCIA', 25, 0, 0, '2022-07-13', 1),
(394, 'BJM-109', 'CEMENTO RESINOSO AUTOADHESIVO', 50, 0, 0, '2022-07-14', 1),
(395, 'CAVEX-147', 'CEMENTO TEMPORAL', 18, 0, 0, '2022-07-15', 1),
(396, 'SUBITON-110', 'CEMENTO ZINC FOSFATO', 12, 0, 0, '2022-07-16', 1),
(397, 'ANELSAM-103', 'CENTRIFUGA', 250, 0, 0, '2022-07-17', 1),
(398, 'CLEMDE-103', 'CEPILLO BLANCO PARA PARTIAL FLEX', 10, 0, 0, '2022-07-18', 1),
(399, 'ANELSAM-135', 'CEPILLO BLANO PARA LAVAR INSTRUMENTOS', 3, 0, 0, '2022-07-19', 1),
(400, 'AHKIMP-104', 'CEPILLO DE NIÑO', 2.5, 0, 0, '2022-07-20', 1),
(401, 'CLINIC-101', 'CEPILLO DE ORTODONCIA', 2.35, 0.05, 0, '2022-07-21', 1),
(402, 'ANELSAM-183', 'CEPILLO DE PROFILAXIS', 0.3, 0, 0, '2022-07-22', 1),
(403, 'ANELSAM-104', 'CEPILLO DE PROFILAXIS X 100', 20, 0, 0, '2022-07-23', 1),
(404, 'CLEMDE-104', 'CEPILLO NEGRO PARA PARTIAL FLEX', 6, 0, 0, '2022-07-24', 1),
(405, 'ULTRA-101', 'CEPILLO PROFILAXIS ULTRADENT', 56, 0, 0, '2022-07-25', 1),
(406, 'ANELSAM-134', 'CEPILLO REDONDO 3 HILERAS', 3, 0, 0, '2022-07-26', 1),
(407, 'CLINIC-100', 'CEPILLOS INTERPROXIMALES', 3, 0, 0, '2022-07-27', 1),
(408, 'CRAMEN-112', 'CERA DE MODELAR AZUL', 22, 0, 0, '2022-07-28', 1),
(409, 'ANELSAM-136', 'CERA DE MODELAR DE COLORES EN CUBO X 4', 2, 0, 0, '2022-07-29', 1),
(410, 'CARMEN-113', 'CERA DE MODELAR PRESENTACION BEING', 22, 0, 0, '2022-07-30', 1),
(411, 'ANELSAM-240', 'CERA DE MODELAR TRANSPARENTE EN CUBO', 0.25, 0, 0, '2022-07-31', 1),
(412, 'CARMEN-110', 'CERA DE MODELAR VERDE', 22, 0, 0, '2022-08-01', 1),
(413, 'BORG-115', 'CERA DELAR 1/2 LIB', 25, 0, 0, '2022-08-02', 1),
(414, 'CAMEN-114', 'CERA MARGINAL DE CUELLO', 22, 0, 0, '2022-08-03', 1),
(415, 'MAQUIRA-182', 'CERA ORTODONCIA UNIDAD', 2, 0, 0, '2022-08-04', 1),
(416, 'BIOART-110', 'CERA PARA MODELA  BEIGE 125 GRAMO', 60, 0, 0, '2022-08-05', 1),
(417, 'BIOART-109', 'CERA PARA MODELA AZUL 125 GRAMO', 50, 0, 0, '2022-08-06', 1),
(418, 'BIOART-108', 'CERA PARA MODELA VERDE 125 GRAMO', 50, 0, 0, '2022-08-07', 1),
(419, 'ANELSAM-154', 'CERA PARA MODELAR COLOR AZUL', 5, 0, 0, '2022-08-08', 1),
(420, 'ANELSAM-155', 'CERA PARA MODELAR COLOR VERDE', 5, 0, 0, '2022-08-09', 1),
(421, 'WA008', 'CERA ROSA  CAJA 1 LIBRA', 9, 0, 0, '2022-08-10', 1),
(422, 'CAVEX-120', 'CERA ROSA  CAJA MEDIA LIBRA', 4.5, 0, 0, '2022-08-11', 1),
(423, 'CAVEX-138', 'CERA ROSA EN LAMINAS INDIVIDUAL', 0.4, 0, 0, '2022-08-12', 1),
(424, 'ANELSAM-184', 'CERA UTILITY EN BARRA', 1, 0, 0, '2022-08-13', 1),
(425, 'MAQUIRA-176', 'CERAS ORTODONCIA X 10 UNIDADES', 7.5, 0, 0, '2022-08-14', 1),
(426, 'OTROS-108', 'CHALECO DE PLOMO', 150, 0, 0, '2022-08-15', 1),
(427, 'DENST-101', 'CIERRAS PARA CEGUETA DENSTPLY', 2, 0, 0, '2022-08-16', 1),
(428, 'MA-1305-89-92', 'CLEOIDE', 2.8, 0, 0, '2022-08-17', 1),
(429, 'MAQUIRA-184', 'CLOREXIDINA', 6, 0, 0, '2022-08-18', 1),
(430, 'ANELSAM-124', 'COALLA PARA MOTOR DE ALTA', 5, 0, 0, '2022-08-19', 1),
(431, 'MAQUIRA-117', 'CODIFICADOR DE COLORES PARA INSTRUMENTOS', 6, 0, 0, '2022-08-20', 1),
(432, 'MAQUIRA-208', 'COLTOSOL NORMAL', 10, 0, 0, '2022-08-21', 1),
(433, 'ANELSAM-105', 'COMPRESOR SILENCIOSO 1 HP', 460, 0, 0, '2022-08-22', 1),
(434, 'ANELSAM-106', 'COMPRESOR SILENCIOSO 2 HP', 875, 0, 0, '2022-08-23', 1),
(435, 'ANELSAM-156', 'CONDENSADOR DE AMALGAMA FM', 5, 0, 0, '2022-08-24', 1),
(436, 'ANELSAM-158', 'CONDENSADOR DE AMALGAMA GRANDE', 5, 0, 0, '2022-08-25', 1),
(437, 'ANELSAM-157', 'CONDENSADOR DE AMALGAMA MG', 5, 0, 0, '2022-08-26', 1),
(438, 'AWAN-198', 'CONDENSADOR DE CUATRO EXTREMOS', 3, 0, 0, '2022-08-27', 1),
(439, 'HUFRI-106', 'CONDENSADOR PLUGER 0/1 HUFRIEDY', 30, 0.74, 0, '2022-08-28', 1),
(440, 'HUFRI-142', 'CONDENSADOR PLUGGER 9/11', 30, 0, 0, '2022-08-29', 1),
(441, 'HUFRI-107', 'CONDENSADOR WOODSON /2 HUFRIEDY', 30, 0.74, 0, '2022-08-30', 1),
(442, 'GAPA124', 'CONO DE PAPEL 15', 5, 0, 0, '2022-08-31', 1),
(443, 'GAPA-100', 'CONO DE PAPEL 15/40', 5, 0, 0, '2022-09-01', 1),
(444, 'GAPA-101', 'CONO DE PAPEL 3+1', 15, 0, 0, '2022-09-02', 1),
(445, 'GAPA-102', 'CONO DE PAPEL 45/80', 5, 0, 0, '2022-09-03', 1),
(446, 'GAPA-115', 'CONO DE PAPEL F2', 10, 0, 0, '2022-09-04', 1),
(447, 'ANELSAM-185', 'CONOS DE HULE GRIS INDIVIDUAL', 0.4, 0, 0, '2022-09-05', 1),
(448, 'ANELSAM-107', 'CONOS DE HULE GRIS X CAJA X 100', 20, 0, 0, '2022-09-06', 1),
(449, 'GAPA-114', 'CONOS DE PAPEL F1', 10, 0, 0, '2022-09-07', 1),
(450, 'GAPA-116', 'CONOS DE PAPEL F3', 10, 0, 0, '2022-09-08', 1),
(451, 'GAPA-117', 'CONOS DE PAPEL WAVE ONE', 10, 0, 0, '2022-09-09', 1),
(452, 'ULTRA-159', 'CONSEPSIS', 59.5, 0, 0, '2022-09-10', 1),
(453, 'ULTRA-204', 'CONSEPSIS SCRUB  KIT X4 JERINGAS', 31.5, 0, 0, '2022-09-11', 1),
(454, 'ULTRA-180', 'CONSEPSIS SCRUB JERINGA REFILL 30ML', 70, 0, 0, '2022-09-12', 1),
(455, 'CAVEX-111', 'CONTENEDORES', 30, 0, 0, '2022-09-13', 1),
(456, 'ANELSAM-176', 'CONTRAAUNGULO DESCARTABLE', 0.75, 0, 0, '2022-09-14', 1),
(457, 'MEDID-102', 'CONTRAAUNGULO METALICO', 35, 0, 0, '2022-09-15', 1),
(458, 'DENFLEX-100', 'CONTRANGULO DE ENDODONCIA', 280, 0, 0, '2022-09-16', 1),
(459, 'DENFLEX-101', 'CONTRANGULO DE IMPLANTE', 350, 0, 0, '2022-09-17', 1),
(460, 'DENFLEX-107', 'CONTRANGULO NORMAL PARA PROFILAXI', 130, 0, 0, '2022-09-18', 1),
(461, 'ANELSAM-186', 'COPA DE PROFILAXIS', 0.3, 0, 0, '2022-09-19', 1),
(462, 'ANELSAM-108', 'COPA DE PROFILAXIS X 100', 20, 0, 0, '2022-09-20', 1),
(463, 'ULTRA-113', 'COPA PULIR INDIVIDUAL AMARILLA MEDIUM JIFFY', 3.5, 0, 0, '2022-09-21', 1),
(464, 'ULTRA-112', 'COPA PULIR INDIVIDUAL VERDE GRUESA JIFFY', 3.5, 0, 0, '2022-09-22', 1),
(465, 'ULTRA-138', 'COPA PULIR INDIVIUAL BLANCA FINA JIFFY', 3.5, 0, 0, '2022-09-23', 1),
(466, 'ANELSAM-212', 'CORONA DE CELULOIDE X CAJA', 8, 0, 0, '2022-09-24', 1),
(467, 'ANELSAM-123', 'CORREAS VERDES PARA MOTOR DE ALTA', 6, 0, 0, '2022-09-25', 1),
(468, 'EURONDA-150', 'COVER DE UNIDAD DENTAL AMARILLO', 3, 0, 0, '2022-09-26', 1),
(469, 'EURONDA-146', 'COVER DE UNIDAD DENTAL AZUL', 3, 0, 0, '2022-09-27', 1),
(470, 'EURONDA-148', 'COVER DE UNIDAD DENTAL LILA', 3, 0, 0, '2022-09-28', 1),
(471, 'EURONDA-147', 'COVER DE UNIDAD DENTAL LIMA', 3, 0, 0, '2022-09-29', 1),
(472, 'EURONDA-149', 'COVER DE UNIDAD DENTAL NARANJA', 3, 0, 0, '2022-09-30', 1),
(473, 'ANELSAM-266', 'CRISOL DE CUARZO', 10, 0, 0, '2022-10-01', 1),
(474, 'VRC-107', 'CRISOLE VRC', 6, 0, 0, '2022-10-02', 1),
(475, 'ANELSAM-137', 'CRISOLES DE BARRO', 1.5, 0, 0, '2022-10-03', 1),
(476, 'ANELSAM-159', 'CUBETAS DE ALUMINIO X 6 UNIDS', 12.72, 0, 0, '2022-10-04', 1),
(477, 'AWAN-169', 'CUBETAS METALICAS X6 UNID AWAN', 20, 0, 0, '2022-10-05', 1),
(478, 'ANELSAM-180', 'CUBETAS PARA FLÚOR DE ADULTOS', 0.5, 0, 0, '2022-10-06', 1),
(479, 'ANELSAM-198', 'CUBETAS PARA FLÚOR DE NIÑOS', 0.5, 0, 0, '2022-10-07', 1),
(480, 'ANELSAM-199', 'CUBETAS PARA FLÚOR MEDIANAS', 0.5, 0, 0, '2022-10-08', 1),
(481, 'MAQUIRA-191', 'CUBETAS PLASTICA EN JUEGO X 15 UNIDADES', 15, 0, 0, '2022-10-09', 1),
(482, 'MAQUIRA-167', 'CUBETAS PLASTICA EN JUEGO X 2 UNIDAES', 2.25, 0, 0, '2022-10-10', 1),
(483, 'ANELSAM-160', 'CUBETAS PLASTICA EN JUEGO X 9 UNIDADES', 7.5, 0, 0, '2022-10-11', 1),
(484, 'ANELSAM-274', 'CUBETAS PLASTICAS JUEGO X 6 UNIDADES', 5, 0, 0, '2022-10-12', 1),
(485, 'CLEMDE-105', 'CUBILETE FLEXIBLE PARA LITHIUM 100 GRS', 20, 0, 0, '2022-10-13', 1),
(486, 'CLEMDE-106', 'CUBILETE FLEXIBLE PARA LITHIUM 200 GRS', 40, 0, 0, '2022-10-14', 1),
(487, 'ANELSAM-138', 'CUBILETE METALICO + PEANA', 5, 0, 0, '2022-10-15', 1),
(488, 'WHIPMIX-118', 'CUBILETE SILICONA DESMONTABLE 100 GRS', 90, 0, 0, '2022-10-16', 1),
(489, 'STEEL-124', 'CUBRE JERINGA FORMA ANIMALITO', 15, 0, 0, '2022-10-17', 1),
(490, 'PDT-118', 'CUCHARILLA 31L', 20, 0, 0, '2022-10-18', 1),
(491, 'AWAN-200', 'CUCHARILLA DE DENTINA', 2.8, 0, 0, '2022-10-19', 1),
(492, 'AWAN-201', 'CUCHARILLA DE ENDODONCIA', 2.8, 0, 0, '2022-10-20', 1),
(493, 'AWAN-199', 'CUCHARILLAS PARA HUESO LUCAS BONE', 6, 0, 0, '2022-10-21', 1),
(494, 'MA-2210-2', 'CUCHILLO PARA YESO', 3.5, 0, 0, '2022-10-22', 1),
(495, 'MAQUIRA-100', 'CUÑA DE MADERA SURTIDA', 10, 0, 0, '2022-10-23', 1),
(496, 'MORELLI-115', 'CUÑAS DE ROTACIÓN ELASTICAS', 12, 0, 0, '2022-10-24', 1),
(497, 'PDT-124', 'CURETA MONTANA SACK', 26, 0.68, 0, '2022-10-25', 1),
(498, 'PDT-125', 'CURETA REYNA DE CORAZONES', 26, 0.68, 0, '2022-10-26', 1),
(499, 'HUFRI-114', 'CURETAS  GRACEY  11/12 HUFRIEDY', 30, 0.74, 0, '2022-10-27', 1),
(500, 'AWAN-174', 'CURETAS  GRACEY  13/14 AWAN', 5, 0, 0, '2022-10-28', 1),
(501, 'HUFRI-115', 'CURETAS  GRACEY  13/14 HUFRIEDY', 30, 0.74, 0, '2022-10-29', 1),
(502, 'AWAN-175', 'CURETAS  GRACEY  15/16 AWAN', 5, 0, 0, '2022-10-30', 1),
(503, 'HUFRI-116', 'CURETAS  GRACEY  15/16 HUFRIEDY', 30, 0.74, 0, '2022-10-31', 1),
(504, 'HUFRI-117', 'CURETAS  GRACEY  17/18 HUFRIEDY', 30, 0.74, 0, '2022-11-01', 1),
(505, 'HUFRI-109', 'CURETAS  GRACEY  3 /4 HUFRIEDY', 30, 0.74, 0, '2022-11-02', 1),
(506, 'AWAN-172', 'CURETAS  GRACEY  7/8 AWAN', 5, 0, 0, '2022-11-03', 1),
(507, 'HUFRI-111', 'CURETAS  GRACEY  7/8 HUFRIEDY', 30, 0.74, 0, '2022-11-04', 1),
(508, 'AWAN-173', 'CURETAS  GRACEY  9/10 AWAN', 5, 0, 0, '2022-11-05', 1),
(509, 'HUFRI-113', 'CURETAS  GRACEY  9/10 HUFRIEDY', 30, 0.74, 0, '2022-11-06', 1),
(510, 'AWAN-170', 'CURETAS  GRACEY 1/2 AWAN', 5, 0, 0, '2022-11-07', 1),
(511, 'HUFRI-108', 'CURETAS  GRACEY 1/2 HUFRIEDY', 30, 0.74, 0, '2022-11-08', 1),
(512, 'AWAN-171', 'CURETAS  GRACEY 5/6 AWAN', 5, 0, 0, '2022-11-09', 1),
(513, 'HUFRI-110', 'CURETAS  GRACEY 5/6 HUFRIEDY', 30, 0.74, 0, '2022-11-10', 1),
(514, 'HUFRI-118', 'CURETAS  MCCALL  11/12 HUFRIEDY', 30, 0.74, 0, '2022-11-11', 1),
(515, 'AWAN-176', 'CURETAS  MCCALL 13/14 AWAN', 5, 0, 0, '2022-11-12', 1),
(516, 'HUFRI-119', 'CURETAS  MCCALL 13/14 HUFRIEDY', 30, 0.74, 0, '2022-11-13', 1),
(517, 'AWAN-177', 'CURETAS  MCCALL 17/18 AWAN', 5, 0, 0, '2022-11-14', 1),
(518, 'HUFRI-120', 'CURETAS  MCCALL 17/18 HUFRIEDY', 30, 0.74, 0, '2022-11-15', 1),
(519, 'MAQUIRA-147', 'DAPEN DE HULE', 3, 0, 0, '2022-11-16', 1),
(520, 'ANELSAM-229', 'DAPEN DE VIDRIO', 2, 0, 0, '2022-11-17', 1),
(521, 'AWAN-178', 'DAPEN METALICO AWAN', 6, 0, 0, '2022-11-18', 1),
(522, 'MAQUIRA-148', 'DAPEN PLASTICO RIGIDO', 2, 0, 0, '2022-11-19', 1),
(523, 'STEEL-122', 'DAPPEN DE ACRILICO', 6, 0, 0, '2022-11-20', 1),
(524, 'ULTRA-141', 'DE OX (GLICERINA)', 18, 0, 0, '2022-11-21', 1),
(525, 'WHIPMIX-111', 'DEBUBLIZER', 17, 0, 0, '2022-11-22', 1),
(526, 'ANELSAM-277', 'DESMOLDANTE FLEX', 20, 0, 0, '2022-11-23', 1),
(527, 'BIOART-129', 'DESTILADOR DE AGUA', 180, 0, 0, '2022-11-24', 1),
(528, 'MA-13-084', 'DICALERA', 2.8, 0, 0, '2022-11-25', 1),
(529, 'ADISSA-100', 'DIENTES PARA TIPODONTO DE ACRILICO', 5, 0, 0, '2022-11-26', 1),
(530, 'TOPSMILE-100', 'DIENTES PARA TIPODONTO TIPO COLUMBIA', 36, 0, 0, '2022-11-27', 1),
(531, 'MAQUIRA-181', 'DIQUE DE GOMA', 12, 0, 0, '2022-11-28', 1),
(532, 'ULTRA-177', 'DIQUE DE GOMA DERMADAN MEDIUM X36', 34, 0, 0, '2022-11-29', 1),
(533, 'ULTRA-107', 'DIQUE DE GOMA ULTRADENT X 36', 33.95, 0, 0, '2022-11-30', 1),
(534, 'ANELSAM-110', 'DISCO DE CARBORUNDO X 100', 20, 0, 0, '2022-12-01', 1),
(535, 'ANELSAM-188', 'DISCO DE CARBORUNDO X UNIDAD', 0.25, 0, 0, '2022-12-02', 1),
(536, 'ANELSAM-111', 'DISCO DE CORTAR X 100', 20, 0, 0, '2022-12-03', 1),
(537, 'ANELSAM-189', 'DISCO DE CORTAR X UNIDAD', 0.4, 0, 0, '2022-12-04', 1),
(538, 'ANELSAM-112', 'DISCO DE DESGASTAR X 100', 20, 0, 0, '2022-12-05', 1),
(539, 'ANELSAM-190', 'DISCO DE DESGASTAR X UNIDAD', 0.4, 0, 0, '2022-12-06', 1),
(540, 'SCHMIDT-100', 'DISCO DE DIAMANTE DOS CARAS PARA PORCELANA', 10, 0, 0, '2022-12-07', 1),
(541, 'ANELSAM-177', 'DISCO DE FIELTRO PARA MOTOR DE ALTA', 0.35, 0, 0, '2022-12-08', 1),
(542, 'ANELSAM-187', 'DISCO NEGRO DE HULE X UNIDAD', 0.4, 0, 0, '2022-12-09', 1),
(543, 'SHOFU-100', 'DISCO PARA PULIR RESINA SUPER SNAP', 6, 0, 0, '2022-12-10', 1),
(544, 'ANELSAM-109', 'DISCOS NEGROS DE HULE X 100', 20, 0, 0, '2022-12-11', 1),
(545, 'STEEL-145', 'DISPENSADOR DE ALGODON CON 4 CORAZONES', 5, 0, 0, '2022-12-12', 1),
(546, 'STEEL-127', 'DISPENSADOR DE CADENA', 15, 0, 0, '2022-12-13', 1),
(547, 'CAVEX-164', 'DISPENSADOR DE RESINA CAVEX', 50, 0, 0, '2022-12-14', 1),
(548, 'VIPI-105', 'DUO LAY', 20, 0, 0, '2022-12-15', 1),
(549, 'SUBITON-106', 'DYCAL HIDROCAV', 15, 0, 0, '2022-12-16', 1),
(550, 'MAQUIRA-205', 'EDTA GEL', 12, 0, 0, '2022-12-17', 1),
(551, 'MAQUIRA-206', 'EDTA LIQUIDO', 10, 0, 0, '2022-12-18', 1),
(552, 'OC-122', 'ELASTICO INTERMAXILARES 1/4', 10, 0, 0, '2022-12-19', 1),
(553, 'OC-123', 'ELASTICO INTERMAXILARES 1/8', 10, 0, 0, '2022-12-20', 1),
(554, 'OC-125', 'ELASTICO INTERMAXILARES 3/16', 10, 0, 0, '2022-12-21', 1),
(555, 'OC-124', 'ELASTICO INTERMAXILARES 3/8', 10, 0, 0, '2022-12-22', 1),
(556, 'OC-126', 'ELASTICO INTERMAXILARES 5/16', 10, 0, 0, '2022-12-23', 1),
(557, 'OC-127', 'ELASTICO INTERMAXILARES EN CAJA', 45, 0, 0, '2022-12-24', 1),
(558, 'MORELLI-188', 'ELASTOMERO MORELLI INDIVIDUAL', 0.35, 0, 0, '2022-12-25', 1),
(559, 'MORELLI-189', 'ELASTOMEROS MORELLI', 10, 0, 0, '2022-12-26', 1),
(560, 'OC-170', 'ELASTOMEROS OC BOLSAS', 10, 0, 0, '2022-12-27', 1),
(561, 'OC-169', 'ELASTOMEROS OC CAJA', 11, 0, 0, '2022-12-28', 1),
(562, 'OC-171', 'ELASTOMEROS OC INDIVUAL', 0.45, 0, 0, '2022-12-29', 1),
(563, 'VRC-104', 'ELECTROLITO', 400, 0, 0, '2022-12-30', 1),
(564, 'STEEL-141', 'ELEFANTE CON MUELA', 25, 0, 0, '2022-12-31', 1),
(565, 'AWAN-137', 'ELEVADOR APICAL DERECHO AWAN', 8, 0, 0, '2023-01-01', 1),
(566, 'AWAN-138', 'ELEVADOR APICAL IZQUIERDO AWAN', 8, 0, 0, '2023-01-02', 1),
(567, 'AWAN-135', 'ELEVADOR BANDERA DERECHO AWAN', 8, 0, 0, '2023-01-03', 1),
(568, 'AWAN-136', 'ELEVADOR BANDERA IZQUIERDO AWAN', 8, 0, 0, '2023-01-04', 1),
(569, 'DE-162', 'ELEVADORES FINO', 8, 0, 0, '2023-01-05', 1),
(570, 'DE-164', 'ELEVADORES GRUESO', 8, 0, 0, '2023-01-06', 1),
(571, 'DE-163', 'ELEVADORES MEDIO', 8, 0, 0, '2023-01-07', 1),
(572, 'HUFRI-121', 'EMPACADOR DE HILO HUFRIEDY', 30, 0.74, 0, '2023-01-08', 1),
(573, 'MORELLI-183', 'EMPUJADOR DE BANDAS PUSHER', 14, 0, 0, '2023-01-09', 1),
(574, 'ULTRA-165', 'ENAMELAST INDIVIDUAL', 5, 0, 0, '2023-01-10', 1),
(575, 'S4519', 'ENAMELAST X2 JERINGAS', 10, 0, 0, '2023-01-11', 1),
(576, 'STEEL-107', 'ENDOBLOCK', 5, 0, 0, '2023-01-12', 1),
(577, 'MAQUIRA-188', 'ENDOICE', 15, 0, 0, '2023-01-13', 1),
(578, 'ULTRA-148', 'ENDOREZ KIT OBTURACION', 76.8, 0, 0, '2023-01-14', 1),
(579, 'AWAN-210', 'EQUIPO BÁSICO', 10, 0, 0, '2023-01-15', 1),
(580, 'HUFRI-104', 'EQUIPO BÁSICO HUFRIEDY', 100, 0, 0, '2023-01-16', 1),
(581, 'PDT-122', 'EQUIPO BASICO PDT', 80, 0, 0, '2023-01-17', 1),
(582, 'AWAN-211', 'EQUIPO DE PKT', 12, 0, 0, '2023-01-18', 1),
(583, 'PTRX511', 'EQUIPO DE RAYOS X DE PARED', 1600, 0, 0, '2023-01-19', 1),
(584, 'PTRX111', 'EQUIPO DE RAYOS X DE PEDESTAL', 1700, 0, 0, '2023-01-20', 1),
(585, 'HUFRI-127', 'ESPACIADOR  D11 HUFRI', 30, 0.74, 0, '2023-01-21', 1),
(586, 'HUFRI-128', 'ESPACIADOR  D11T HUFRIEDY', 30, 0.74, 0, '2023-01-22', 1),
(587, 'HUFRI-129', 'ESPACIADOR  MA57 HUFRIEDY', 30, 0.74, 0, '2023-01-23', 1),
(588, 'WHIPMIX-112', 'ESPACIADOR DE DADOS', 22, 0, 0, '2023-01-24', 1),
(589, 'GAPA-111', 'ESPACIADOR DIGITAL', 7, 0, 0, '2023-01-25', 1),
(590, 'MAQUIRA-225', 'ESPATULA  DE ALGINATO PLASTICA', 2.8, 0, 0, '2023-01-26', 1),
(591, 'AWAN-207', 'ESPATULA 7 A', 2.8, 0, 0, '2023-01-27', 1),
(592, 'CAVEX-133', 'ESPATULA DE ALGINATO PLASTICA', 3, 0, 0, '2023-01-28', 1),
(593, 'DE-915', 'ESPATULA DE CEMENTO METALICA', 2.8, 0, 0, '2023-01-29', 1),
(594, 'ANELSAM-168', 'ESPATULA DE CEMENTO PLASTICA', 1, 0, 0, '2023-01-30', 1),
(595, 'PDT-101', 'ESPATULA DE RESINA #2', 26, 0.68, 0, '2023-01-31', 1),
(596, 'HUFRI-143', 'ESPATULA DE RESINA INTERPROXIMAL XTS CARVER', 30, 0, 0, '2023-02-01', 1),
(597, 'AWAN-208', 'ESPATULA DE YESO METALICA', 3.5, 0, 0, '2023-02-02', 1),
(598, 'AWAN-204', 'ESPATULA GRITMAN', 2.8, 0, 0, '2023-02-03', 1),
(599, 'HUFRI-140', 'ESPATULA INTERPROXIMAL', 30, 0.74, 0, '2023-02-04', 1),
(600, 'AWAN-205', 'ESPATULA LECRON', 2.8, 0, 0, '2023-02-05', 1),
(601, 'HUFRI-123', 'ESPATULA PARA RESINA # 1 HUFRIEDY', 30, 0.74, 0, '2023-02-06', 1),
(602, 'HUFRI-124', 'ESPATULA PARA RESINA # 2 HUFRIEDY', 30, 0.74, 0, '2023-02-07', 1),
(603, 'HUFRI-100', 'ESPATULA PARA RESINA # 21B', 30, 0.74, 0, '2023-02-08', 1),
(604, 'HUFRI-125', 'ESPATULA PARA RESINA # 3 HUFRIEDY', 30, 0.74, 0, '2023-02-09', 1),
(605, 'ANELSAM-139', 'ESPATULA PLASTICA PARA RESINAS', 10, 0, 0, '2023-02-10', 1),
(606, 'ANELSAM-268', 'ESPEJO DE FOTOGRAFIA NEGRO', 30, 0, 0, '2023-02-11', 1),
(607, 'VALDI-107', 'ESPEJO DE MUELA', 5, 0, 0, '2023-02-12', 1),
(608, 'PDT-123', 'ESPEJO INDIVIDUAL #5', 8, 0, 0, '2023-02-13', 1),
(609, 'ANELSAM-213', 'ESPEJO INTRAORALES PARA FOTOGRAFIA X 3', 70, 0, 0, '2023-02-14', 1),
(610, 'AWAN-179', 'ESPEJO NO 4 AWAN', 1, 0, 0, '2023-02-15', 1),
(611, 'MA-08-013-1', 'ESPEJO NO 5', 1, 0, 0, '2023-02-16', 1),
(612, 'HUFRI-122', 'ESPEJO NO 5 HU-FRIEDY', 8, 0, 0, '2023-02-17', 1),
(613, 'ANELSAM-270', 'ESPEJO PLASTICO DESCARTABLE', 1, 0, 0, '2023-02-18', 1),
(614, 'PDT-116', 'ESPEJO Y MANGO', 20, 0, 0, '2023-02-19', 1),
(615, 'MAQUIRA-171', 'ESPONJA HEMOSTATICA', 1, 0, 0, '2023-02-20', 1),
(616, 'MAQUIRA-185', 'ESPONJERO METALICO ENDOCLEAN', 9, 0, 0, '2023-02-21', 1),
(617, 'MAQUIRA-221', 'ESPONJERO PLASTICO  ENDOCLEAN', 4, 0, 0, '2023-02-22', 1),
(618, 'PDT-100', 'ESPTAULA DE RESINA #1', 26, 0.68, 0, '2023-02-23', 1),
(619, 'LORMA-100', 'ESTERELIZADOR ELECTRONICO LORMA', 380, 0, 0, '2023-02-24', 1),
(620, 'MORELLI-113', 'ESTRELLA DE ALTURA POSICIONADOR DE BRACKETS', 27.5, 0, 0, '2023-02-25', 1),
(621, 'VALDI-131', 'ESTUCHE ACRILICO GRANDE', 100, 0, 0, '2023-02-26', 1),
(622, 'VALDI-130', 'ESTUCHE ACRILICO PEQUEÑA', 60, 0, 0, '2023-02-27', 1),
(623, 'GAC-113', 'ESTUCHE CLASIFICADOR DE BANDAS GAC', 15, 0, 0, '2023-02-28', 1),
(624, 'MAQUIRA-215', 'EUCALIPTOL', 10, 0, 0, '2023-03-01', 1),
(625, 'MAQUIRA-216', 'EUGENOL 20 ML', 6.5, 0, 0, '2023-03-02', 1),
(626, 'ULTRA-108', 'EVIDENCIADOR DE CARIES SABLE SEEK x 2', 16, 0, 0, '2023-03-03', 1),
(627, 'ULTRA-188', 'EXPER TEMP A2,A3', 136, 0, 0, '2023-03-04', 1),
(628, 'PDT-119', 'EXPLORADOR # 5', 20, 0, 0, '2023-03-05', 1),
(629, 'AWAN-180', 'EXPLORADOR D11 AWAN', 5, 0, 0, '2023-03-06', 1),
(630, 'MA-08-030T', 'EXPLORADOR D11T', 5, 0, 0, '2023-03-07', 1),
(631, 'AWAN-212', 'EXPLORADOR DG16', 6, 0, 0, '2023-03-08', 1),
(632, 'HUFRI-126', 'EXPLORADOR DG16 HUFRIEDY', 30, 0.74, 0, '2023-03-09', 1),
(633, 'MA-08-013', 'EXPLORADOR NO , 5', 2.8, 0, 0, '2023-03-10', 1),
(634, 'AWAN-125', 'EXPLORADOR PC1 PC2', 5, 0, 0, '2023-03-11', 1),
(635, 'EURONDA-111', 'EYECTOR DE SALIVA EURONDA AMARILLO', 4.5, 0, 0, '2023-03-12', 1),
(636, 'EURONDA-113', 'EYECTOR DE SALIVA EURONDA AZUL', 4.5, 0, 0, '2023-03-13', 1),
(637, 'EURONDA-115', 'EYECTOR DE SALIVA EURONDA BLANCO', 4.5, 0, 0, '2023-03-14', 1),
(638, 'EURONDA-106', 'EYECTOR DE SALIVA EURONDA BURGUNDY', 4.5, 0, 0, '2023-03-15', 1),
(639, 'EURONDA-108', 'EYECTOR DE SALIVA EURONDA LILA', 4.5, 0, 0, '2023-03-16', 1),
(640, 'EURONDA-107', 'EYECTOR DE SALIVA EURONDA LIMA', 4.5, 0, 0, '2023-03-17', 1),
(641, 'EURONDA-109', 'EYECTOR DE SALIVA EURONDA NARANJA', 4.5, 0, 0, '2023-03-18', 1),
(642, 'EURONDA-110', 'EYECTOR DE SALIVA EURONDA ROSADO', 4.5, 0, 0, '2023-03-19', 1),
(643, 'EURONDA-114', 'EYECTOR DE SALIVA EURONDA VERDE', 4.5, 0, 0, '2023-03-20', 1),
(644, 'EURONDA-157', 'EYECTORES DE SALIVA EURONDA', 4.5, 0, 0, '2023-03-21', 1),
(645, 'EURONDA-158', 'EYECTORES DE SALIVA EURONDA X 4 BOLSAS', 13.5, 0, 0, '2023-03-22', 1),
(646, 'MAQUIRA-193', 'EYECTORES QUIRURGICOS PLASTICOS', 1, 0, 0, '2023-03-23', 1),
(647, 'ANELSAM-120', 'FIBRA  PARA LAMPARA FOTOCURADO', 80, 0, 0, '2023-03-24', 1),
(648, 'ULTRA-132', 'FILE EZE EDTA MINI KIT GEL X2 JERINGAS 1 ,2 ML', 18.9, 0, 0, '2023-03-25', 1),
(649, 'ULTRA-143', 'FILE EZE EDTA MINI KIT GEL X4 JERINGAS 1 ,2 ML', 35, 0, 0, '2023-03-26', 1),
(650, 'STEEL-119', 'FLAMEADOR', 6, 0, 0, '2023-03-27', 1),
(651, 'MAQUIRA-104', 'FLUOR EN SPRAY', 12, 0, 0, '2023-03-28', 1),
(652, 'MAQUIRA-210', 'FLUOR GEL', 5, 0, 0, '2023-03-29', 1),
(653, 'MORELLI-166', 'FLUX MORELLI', 10, 0, 0, '2023-03-30', 1),
(654, 'AWAN-139', 'FORCEPS  # 18 R AWAN', 10, 0, 0, '2023-03-31', 1),
(655, 'NO:1', 'FORCEPS # 1', 10, 0, 0, '2023-04-01', 1),
(656, 'AWAN-123', 'FORCEPS # 13 AWAN', 10, 0, 0, '2023-04-02', 1),
(657, 'MA023-151', 'FORCEPS # 150', 10, 0, 0, '2023-04-03', 1),
(658, 'AWAN-143', 'FORCEPS # 150S AWAN', 10, 0, 0, '2023-04-04', 1),
(659, 'AWAN-144', 'FORCEPS # 151 AWAN', 10, 0, 0, '2023-04-05', 1),
(660, 'MA023-088R', 'FORCEPS # 151 S', 10, 0, 0, '2023-04-06', 1),
(661, 'MA020-23', 'FORCEPS # 16', 10, 0, 0, '2023-04-07', 1);
INSERT INTO `producto` (`indproducto`, `codigo_producto`, `nombre_producto`, `precio1`, `precio2`, `precio3`, `fecha_vencimiento`, `bandera`) VALUES
(662, 'AWAN-147', 'FORCEPS # 17 AWAN', 10, 0, 0, '2023-04-08', 1),
(663, 'NO:69', 'FORCEPS # 18L', 10, 0, 0, '2023-04-09', 1),
(664, 'AWAN-149', 'FORCEPS # 210S AWAN', 10, 0, 0, '2023-04-10', 1),
(665, 'NO:13', 'FORCEPS # 222', 10, 0, 0, '2023-04-11', 1),
(666, 'AWAN-151', 'FORCEPS # 23 AWAN', 10, 0, 0, '2023-04-12', 1),
(667, 'AWAN-152', 'FORCEPS # 286 AWAN', 10, 0, 0, '2023-04-13', 1),
(668, 'NO:53L', 'FORCEPS # 65', 10, 0, 0, '2023-04-14', 1),
(669, 'AWAN-155', 'FORCEPS # 69 AWAN', 10, 0, 0, '2023-04-15', 1),
(670, 'MA023-150', 'FORCEPS # 88 L', 10, 0, 0, '2023-04-16', 1),
(671, 'MA023-88L', 'FORCEPS # 88 R', 10, 0, 0, '2023-04-17', 1),
(672, 'AWAN-109', 'FORCEPS # 99 C AWAN', 10, 0, 0, '2023-04-18', 1),
(673, 'AWAN-241', 'FORCEPS 53L AWAN', 10, 0, 0, '2023-04-19', 1),
(674, 'AWAN-242', 'FORCEPS 53R AWAN', 10, 0, 0, '2023-04-20', 1),
(675, 'AWAN-153', 'FORCEPS PICO DE LORO AWAN', 10, 0, 0, '2023-04-21', 1),
(676, 'MAQUIRA-214', 'FORMOCRESOL', 8, 0, 0, '2023-04-22', 1),
(677, 'WHIPMIX-116', 'FORMULA-1 INVESTIMENTO 100 GRS', 1.45, 0, 0, '2023-04-23', 1),
(678, 'RAX119', 'FOTOGRAFIA INTRA O EXTRA ORAL', 10, 0, 0, '2023-04-24', 1),
(679, 'MDT-265', 'FRESA  CILINDRICA # 139-012', 1.2, 0, 0, '2023-04-25', 1),
(680, 'MDT-264', 'FRESA  CILINDRICA # 141-014', 1.2, 0, 0, '2023-04-26', 1),
(681, 'MDT-196', 'FRESA BALA # 247-012', 1.2, 0, 0, '2023-04-27', 1),
(682, 'MDT-197', 'FRESA BALA # 249-010', 1.2, 0, 0, '2023-04-28', 1),
(683, 'MDT-198', 'FRESA BALA # 249-012', 1.2, 0, 0, '2023-04-29', 1),
(684, 'MDT-261', 'FRESA BALA 247-010', 1.2, 0, 0, '2023-04-30', 1),
(685, 'MDT-263', 'FRESA BALA 247-010 X F', 1.2, 0, 0, '2023-05-01', 1),
(686, 'MDT-259', 'FRESA BALA 247-014', 1.2, 0, 0, '2023-05-02', 1),
(687, 'MDT-209', 'FRESA BALA 249-014', 1.2, 0, 0, '2023-05-03', 1),
(688, 'MDT-258', 'FRESA BALA 249-014', 1.2, 0, 0, '2023-05-04', 1),
(689, 'MDT-210', 'FRESA BALA 249-016', 1.2, 0, 0, '2023-05-05', 1),
(690, 'MDT-260', 'FRESA BALA 249-016', 1.2, 0, 0, '2023-05-06', 1),
(691, 'MDT-262', 'FRESA BALA 250-012', 1.2, 0, 0, '2023-05-07', 1),
(692, 'MDT-215', 'FRESA BARRIL 039-027', 1.2, 0, 0, '2023-05-08', 1),
(693, 'MDT-216', 'FRESA BARRIL 039-033', 1.2, 0, 0, '2023-05-09', 1),
(694, 'MDT-169', 'FRESA CILINDRICA # 108-009', 1.2, 0, 0, '2023-05-10', 1),
(695, 'MDT-170', 'FRESA CILINDRICA # 108-010', 1.2, 0, 0, '2023-05-11', 1),
(696, 'MDT-171', 'FRESA CILINDRICA # 109-008', 1.2, 0, 0, '2023-05-12', 1),
(697, 'MDT-172', 'FRESA CILINDRICA # 109-010', 1.2, 0, 0, '2023-05-13', 1),
(698, 'MDT-173', 'FRESA CILINDRICA # 109-012', 1.2, 0, 0, '2023-05-14', 1),
(699, 'MDT-174', 'FRESA CILINDRICA # 109-014', 1.2, 0, 0, '2023-05-15', 1),
(700, 'MDT-175', 'FRESA CILINDRICA # 109-016', 1.2, 0, 0, '2023-05-16', 1),
(701, 'MDT-176', 'FRESA CILINDRICA # 110-010', 1.2, 0, 0, '2023-05-17', 1),
(702, 'MDT-177', 'FRESA CILINDRICA # 110-012', 1.2, 0, 0, '2023-05-18', 1),
(703, 'MDT-178', 'FRESA CILINDRICA # 110-014', 1.2, 0, 0, '2023-05-19', 1),
(704, 'MDT-179', 'FRESA CILINDRICA # 110-016', 1.2, 0, 0, '2023-05-20', 1),
(705, 'MDT-180', 'FRESA CILINDRICA # 111-010', 1.2, 0, 0, '2023-05-21', 1),
(706, 'MDT-181', 'FRESA CILINDRICA # 111-012', 1.2, 0, 0, '2023-05-22', 1),
(707, 'MDT-182', 'FRESA CILINDRICA # 111-014', 1.2, 0, 0, '2023-05-23', 1),
(708, 'MDT-183', 'FRESA CILINDRICA # 111-016', 1.2, 0, 0, '2023-05-24', 1),
(709, 'MDT-184', 'FRESA CILINDRICA # 111-018', 1.2, 0, 0, '2023-05-25', 1),
(710, 'MDT-185', 'FRESA CILINDRICA # 138-010', 1.2, 0, 0, '2023-05-26', 1),
(711, 'MDT-186', 'FRESA CILINDRICA # 139-010', 1.2, 0, 0, '2023-05-27', 1),
(712, 'MDT-187', 'FRESA CILINDRICA # 141-012', 1.2, 0, 0, '2023-05-28', 1),
(713, 'MDT-145', 'FRESA CONO INVERTIDO # 010-009', 1.2, 0, 0, '2023-05-29', 1),
(714, 'MDT-146', 'FRESA CONO INVERTIDO # 010-010', 1.2, 0, 0, '2023-05-30', 1),
(715, 'MDT-243', 'FRESA CONO INVERTIDO # 010-012', 1.2, 0, 0, '2023-05-31', 1),
(716, 'MDT-244', 'FRESA CONO INVERTIDO # 010-014', 1.2, 0, 0, '2023-06-01', 1),
(717, 'MDT-245', 'FRESA CONO INVERTIDO # 010-016', 1.2, 0, 0, '2023-06-02', 1),
(718, 'MDT-147', 'FRESA CONO INVERTIDO # 010-019', 1.2, 0, 0, '2023-06-03', 1),
(719, 'MDT-148', 'FRESA CONO INVERTIDO # 019-010', 1.2, 0, 0, '2023-06-04', 1),
(720, 'MDT-149', 'FRESA CONO INVERTIDO # 019-012', 1.2, 0, 0, '2023-06-05', 1),
(721, 'MDT-150', 'FRESA CONO INVERTIDO # 019-014', 1.2, 0, 0, '2023-06-06', 1),
(722, 'MDT-151', 'FRESA CONO INVERTIDO # 019-017', 1.2, 0, 0, '2023-06-07', 1),
(723, 'MDT-1002', 'FRESA DE CARBURO', 1.5, 0, 0, '2023-06-08', 1),
(724, 'MDT-113', 'FRESA DE CARBURO # 1', 1.5, 0, 0, '2023-06-09', 1),
(725, 'MDT-112', 'FRESA DE CARBURO # 1/2', 1.5, 0, 0, '2023-06-10', 1),
(726, 'MDT-227', 'FRESA DE CARBURO # 1/4', 1.5, 0, 0, '2023-06-11', 1),
(727, 'MDT-124', 'FRESA DE CARBURO # 169', 1.5, 0, 0, '2023-06-12', 1),
(728, 'MDT-233', 'FRESA DE CARBURO # 169 L', 1.5, 0, 0, '2023-06-13', 1),
(729, 'MDT-125', 'FRESA DE CARBURO # 170', 1.5, 0, 0, '2023-06-14', 1),
(730, 'MDT-126', 'FRESA DE CARBURO # 170 L', 1.5, 0, 0, '2023-06-15', 1),
(731, 'MDT-127', 'FRESA DE CARBURO # 171', 1.5, 0, 0, '2023-06-16', 1),
(732, 'MDT-228', 'FRESA DE CARBURO # 2', 1.5, 0, 0, '2023-06-17', 1),
(733, 'MDT-128', 'FRESA DE CARBURO # 245', 1.5, 0, 0, '2023-06-18', 1),
(734, 'MDT-114', 'FRESA DE CARBURO # 3', 1.5, 0, 0, '2023-06-19', 1),
(735, 'MDT-129', 'FRESA DE CARBURO # 329', 1.5, 0, 0, '2023-06-20', 1),
(736, 'MDT-232', 'FRESA DE CARBURO # 33 1/2', 1.5, 0, 0, '2023-06-21', 1),
(737, 'MDT-234', 'FRESA DE CARBURO # 330', 1.5, 0, 0, '2023-06-22', 1),
(738, 'MDT-130', 'FRESA DE CARBURO # 330 L', 1.5, 0, 0, '2023-06-23', 1),
(739, 'MDT-131', 'FRESA DE CARBURO # 331', 1.5, 0, 0, '2023-06-24', 1),
(740, 'MDT-132', 'FRESA DE CARBURO # 331 L', 1.5, 0, 0, '2023-06-25', 1),
(741, 'MDT-133', 'FRESA DE CARBURO # 332', 1.5, 0, 0, '2023-06-26', 1),
(742, 'MDT-116', 'FRESA DE CARBURO # 34', 1.5, 0, 0, '2023-06-27', 1),
(743, 'MDT-117', 'FRESA DE CARBURO # 35', 1.5, 0, 0, '2023-06-28', 1),
(744, 'MDT-118', 'FRESA DE CARBURO # 36', 1.5, 0, 0, '2023-06-29', 1),
(745, 'MDT-119', 'FRESA DE CARBURO # 38', 1.5, 0, 0, '2023-06-30', 1),
(746, 'MDT-120', 'FRESA DE CARBURO # 39', 1.5, 0, 0, '2023-07-01', 1),
(747, 'MDT-229', 'FRESA DE CARBURO # 4', 1.5, 0, 0, '2023-07-02', 1),
(748, 'MDT-115', 'FRESA DE CARBURO # 5', 1.5, 0, 0, '2023-07-03', 1),
(749, 'MDT-134', 'FRESA DE CARBURO # 556', 1.5, 0, 0, '2023-07-04', 1),
(750, 'MDT-135', 'FRESA DE CARBURO # 557', 1.5, 0, 0, '2023-07-05', 1),
(751, 'MDT-136', 'FRESA DE CARBURO # 557 L', 1.5, 0, 0, '2023-07-06', 1),
(752, 'MDT-137', 'FRESA DE CARBURO # 558', 1.5, 0, 0, '2023-07-07', 1),
(753, 'MDT-121', 'FRESA DE CARBURO # 56', 1.5, 0, 0, '2023-07-08', 1),
(754, 'MDT-122', 'FRESA DE CARBURO # 57', 1.5, 0, 0, '2023-07-09', 1),
(755, 'MDT-123', 'FRESA DE CARBURO # 58', 1.5, 0, 0, '2023-07-10', 1),
(756, 'MDT-230', 'FRESA DE CARBURO # 6', 1.5, 0, 0, '2023-07-11', 1),
(757, 'MDT-138', 'FRESA DE CARBURO # 700', 1.5, 0, 0, '2023-07-12', 1),
(758, 'MDT-139', 'FRESA DE CARBURO # 701', 1.5, 0, 0, '2023-07-13', 1),
(759, 'MDT-140', 'FRESA DE CARBURO # 702', 1.5, 0, 0, '2023-07-14', 1),
(760, 'MDT-141', 'FRESA DE CARBURO # 703', 1.5, 0, 0, '2023-07-15', 1),
(761, 'MDT-231', 'FRESA DE CARBURO # 8', 1.5, 0, 0, '2023-07-16', 1),
(762, 'MDT-254', 'FRESA DE CARBURO #1712', 1.5, 0, 0, '2023-07-17', 1),
(763, 'MDT-235', 'FRESA DE CARBURO DE BAJA # 2', 2.5, 0, 0, '2023-07-18', 1),
(764, 'MDT-239', 'FRESA DE CARBURO DE BAJA # 34', 2.5, 0, 0, '2023-07-19', 1),
(765, 'MDT-236', 'FRESA DE CARBURO DE BAJA # 4', 2.5, 0, 0, '2023-07-20', 1),
(766, 'MDT-237', 'FRESA DE CARBURO DE BAJA # 6', 2.5, 0, 0, '2023-07-21', 1),
(767, 'MDT-238', 'FRESA DE CARBURO DE BAJA # 8', 2.5, 0, 0, '2023-07-22', 1),
(768, 'MDT-246', 'FRESA DE CARBURO DE BAJA VELOCIDAD #2', 2.5, 0, 0, '2023-07-23', 1),
(769, 'MDT-250', 'FRESA DE CARBURO DE BAJA VELOCIDAD #34', 2.5, 0, 0, '2023-07-24', 1),
(770, 'MDT-247', 'FRESA DE CARBURO DE BAJA VELOCIDAD #4', 2.5, 0, 0, '2023-07-25', 1),
(771, 'MDT-248', 'FRESA DE CARBURO DE BAJA VELOCIDAD #6', 2.5, 0, 0, '2023-07-26', 1),
(772, 'MDT-249', 'FRESA DE CARBURO DE BAJA VELOCIDAD #8', 2.5, 0, 0, '2023-07-27', 1),
(773, 'MDT-267', 'FRESA ENDOACCES', 3, 0, 0, '2023-07-28', 1),
(774, 'ANELSAM-169', 'FRESA ENDOZETA', 9, 0, 0, '2023-07-29', 1),
(775, 'MDT-188', 'FRESA FISURA # 164-012', 1.2, 0, 0, '2023-07-30', 1),
(776, 'MDT-266', 'FRESA FISURA # 165-010', 1.2, 0, 0, '2023-07-31', 1),
(777, 'MDT-189', 'FRESA FISURA # 165-012', 1.2, 0, 0, '2023-08-01', 1),
(778, 'MDT-190', 'FRESA FISURA # 165-014', 1.2, 0, 0, '2023-08-02', 1),
(779, 'MDT-191', 'FRESA FISURA # 165-016', 1.2, 0, 0, '2023-08-03', 1),
(780, 'MDT-192', 'FRESA FISURA # 166-010', 1.2, 0, 0, '2023-08-04', 1),
(781, 'MDT-193', 'FRESA FISURA # 166-014', 1.2, 0, 0, '2023-08-05', 1),
(782, 'MDT-194', 'FRESA FISURA # 166-016', 1.2, 0, 0, '2023-08-06', 1),
(783, 'MDT-195', 'FRESA FISURA # 166-017', 1.2, 0, 0, '2023-08-07', 1),
(784, 'MDT-206', 'FRESA FLAMA 247-014', 1.2, 0, 0, '2023-08-08', 1),
(785, 'MDT-108', 'FRESA HP # 10', 2.25, 0, 0, '2023-08-09', 1),
(786, 'MDT-105', 'FRESA HP # 2', 2.25, 0, 0, '2023-08-10', 1),
(787, 'MDT-268', 'FRESA HP # 39', 2.25, 0, 0, '2023-08-11', 1),
(788, 'MDT-106', 'FRESA HP # 4', 2.25, 0, 0, '2023-08-12', 1),
(789, 'MDT-101', 'FRESA HP # 557', 2.25, 0, 0, '2023-08-13', 1),
(790, 'MDT-102', 'FRESA HP # 559', 2.25, 0, 0, '2023-08-14', 1),
(791, 'MDT-107', 'FRESA HP # 6', 2.25, 0, 0, '2023-08-15', 1),
(792, 'MDT-109', 'FRESA HP # 701', 2.25, 0, 0, '2023-08-16', 1),
(793, 'MDT-110', 'FRESA HP # 702', 2.25, 0, 0, '2023-08-17', 1),
(794, 'MDT-111', 'FRESA HP # 703', 2.25, 0, 0, '2023-08-18', 1),
(795, 'MDT-226', 'FRESA HP # 8', 2.25, 0, 0, '2023-08-19', 1),
(796, 'MDT-270', 'FRESA LINDENMAN', 9, 0, 0, '2023-08-20', 1),
(797, 'MDT-217', 'FRESA MARCADOR DE PROFUNDIDA 834-021', 1.2, 0, 0, '2023-08-21', 1),
(798, 'MDT-199', 'FRESA PERA # 233-010', 1.2, 0, 0, '2023-08-22', 1),
(799, 'MDT-201', 'FRESA PERA # 233-012', 1.2, 0, 0, '2023-08-23', 1),
(800, 'MDT-202', 'FRESA PIMPOLLO 257-016', 1.2, 0, 0, '2023-08-24', 1),
(801, 'MDT-203', 'FRESA PIMPOLLO 257-018', 1.2, 0, 0, '2023-08-25', 1),
(802, 'MDT-204', 'FRESA PIMPOLLO 257-020', 1.2, 0, 0, '2023-08-26', 1),
(803, 'MDT-142', 'FRESA REDONDA # 801-010', 1.2, 0, 0, '2023-08-27', 1),
(804, 'MDT-240', 'FRESA REDONDA # 801-012', 1.2, 0, 0, '2023-08-28', 1),
(805, 'MDT-241', 'FRESA REDONDA # 801-014', 1.2, 0, 0, '2023-08-29', 1),
(806, 'MDT-242', 'FRESA REDONDA # 801-016', 1.2, 0, 0, '2023-08-30', 1),
(807, 'MDT-143', 'FRESA REDONDA # 801-018', 1.2, 0, 0, '2023-08-31', 1),
(808, 'MDT-144', 'FRESA REDONDA # 801-020', 1.2, 0, 0, '2023-09-01', 1),
(809, 'MDT-212', 'FRESA RUEDA 067-036', 1.2, 0, 0, '2023-09-02', 1),
(810, 'MDT-213', 'FRESA RUEDA 067-040', 1.2, 0, 0, '2023-09-03', 1),
(811, 'MDT-214', 'FRESA RUEDA 067-042', 1.2, 0, 0, '2023-09-04', 1),
(812, 'MDT-251', 'FRESA TALLO LARGO 2', 3, 0, 0, '2023-09-05', 1),
(813, 'MDT-252', 'FRESA TALLO LARGO 4', 3, 0, 0, '2023-09-06', 1),
(814, 'MDT-219', 'FRESA TALLO LARGO 6', 3, 0, 0, '2023-09-07', 1),
(815, 'MDT-220', 'FRESA TALLO LARGO 8', 3, 0, 0, '2023-09-08', 1),
(816, 'MDT-211', 'FRESA TORPEDO 290-014', 1.2, 0, 0, '2023-09-09', 1),
(817, 'MDT-152', 'FRESA TRONCO CONICA # 169-010', 1.2, 0, 0, '2023-09-10', 1),
(818, 'MDT-255', 'FRESA TRONCO CONICA # 170-012', 1.2, 0, 0, '2023-09-11', 1),
(819, 'MDT-256', 'FRESA TRONCO CONICA # 170-013', 1.2, 0, 0, '2023-09-12', 1),
(820, 'MDT-153', 'FRESA TRONCO CONICA # 170-014', 1.2, 0, 0, '2023-09-13', 1),
(821, 'MDT-154', 'FRESA TRONCO CONICA # 171-014', 1.2, 0, 0, '2023-09-14', 1),
(822, 'MDT-155', 'FRESA TRONCO CONICA # 171-018', 1.2, 0, 0, '2023-09-15', 1),
(823, 'MDT-156', 'FRESA TRONCO CONICA # 172-010', 1.2, 0, 0, '2023-09-16', 1),
(824, 'MDT-157', 'FRESA TRONCO CONICA # 172-012', 1.2, 0, 0, '2023-09-17', 1),
(825, 'MDT-158', 'FRESA TRONCO CONICA # 172-014', 1.2, 0, 0, '2023-09-18', 1),
(826, 'MDT-159', 'FRESA TRONCO CONICA # 172-016', 1.2, 0, 0, '2023-09-19', 1),
(827, 'MDT-160', 'FRESA TRONCO CONICA # 173-014', 1.2, 0, 0, '2023-09-20', 1),
(828, 'MDT-161', 'FRESA TRONCO CONICA # 173-016', 1.2, 0, 0, '2023-09-21', 1),
(829, 'MDT-162', 'FRESA TRONCO CONICA # 173-018', 1.2, 0, 0, '2023-09-22', 1),
(830, 'MDT-163', 'FRESA TRONCO CONICA # 197-016', 1.2, 0, 0, '2023-09-23', 1),
(831, 'MDT-164', 'FRESA TRONCO CONICA # 198-010', 1.2, 0, 0, '2023-09-24', 1),
(832, 'MDT-165', 'FRESA TRONCO CONICA # 199-010', 1.2, 0, 0, '2023-09-25', 1),
(833, 'MDT-166', 'FRESA TRONCO CONICA # 199-012', 1.2, 0, 0, '2023-09-26', 1),
(834, 'MDT-167', 'FRESA TRONCO CONICA # 199-014', 1.2, 0, 0, '2023-09-27', 1),
(835, 'MDT-168', 'FRESA TRONCO CONICA # 199-016', 1.2, 0, 0, '2023-09-28', 1),
(836, 'MDT-257', 'FRESA TRONCO CONICA # 199-018', 1.2, 0, 0, '2023-09-29', 1),
(837, 'MDT-225', 'FRESA ZEKRYA', 8, 0, 0, '2023-09-30', 1),
(838, 'BIOART-117', 'FRESADORA MANUAL', 1000, 0, 0, '2023-10-01', 1),
(839, 'MDT-253', 'FRESAS DE 12 ASPAS', 6, 0, 0, '2023-10-02', 1),
(840, 'VIPI-4589', 'FRESAS HP', 2.25, 0, 0, '2023-10-03', 1),
(841, 'STEEL-120', 'FRESERO METALICO', 10, 0, 0, '2023-10-04', 1),
(842, 'VALDI-117', 'FRESERO PLÁSTICO', 4, 0, 0, '2023-10-05', 1),
(843, 'STELL-138', 'FRESERO PLASTICO EN FORMA DE MUELA', 10, 0, 0, '2023-10-06', 1),
(844, 'JOTA-218', 'FRESON BOLA', 6, 0, 0, '2023-10-07', 1),
(845, 'MDT-271', 'FRESON DE CORTE', 9, 0, 0, '2023-10-08', 1),
(846, 'JOTA-100-1', 'FRESON LLAMA', 6, 0, 0, '2023-10-09', 1),
(847, 'JOTA-101-2', 'FRESON PERA', 6, 0, 0, '2023-10-10', 1),
(848, 'GOLDLABEL-100', 'FUJI I CHICO', 45, 0, 0, '2023-10-11', 1),
(849, 'GOLDLABEL-101', 'FUJI II CHICO', 45, 0, 0, '2023-10-12', 1),
(850, 'ALTAM-100', 'GAFIDEX GALON GLUTAALDEHIDO', 20, 0, 0, '2023-10-13', 1),
(851, 'OC-165', 'GANCHO CRIMPABLE OC X 20 UNIDS', 25, 0, 0, '2023-10-14', 1),
(852, 'AWAN-195', 'GANCHO DE BOLA 28-30-32', 10, 0, 0, '2023-10-15', 1),
(853, 'AWAN-223', 'GANCHO DE RADIOGRAFIA INDIVIDUAL', 1.5, 0, 0, '2023-10-16', 1),
(854, 'AWAN-183', 'GANCHO DE RADIOGRAFIA X 10 AWAN', 13, 0, 0, '2023-10-17', 1),
(855, 'ANELSAM-162', 'GANCHO DE RADIOGRAFIA X 14', 15, 0, 0, '2023-10-18', 1),
(856, 'AWAN-182', 'GANCHO DE RADIOGRAFIA X6 AWAN', 8, 0, 0, '2023-10-19', 1),
(857, 'VALDI-126', 'GANCHOS DE BOLA 0,7 (25 unidades)', 10, 0, 0, '2023-10-20', 1),
(858, 'VALDI-127', 'GANCHOS DE BOLA 0,8 (25 unidades)', 10, 0, 0, '2023-10-21', 1),
(859, 'VALDI-128', 'GANCHOS DE BOLA 0,9(25 unidades) VALDI', 10, 0, 0, '2023-10-22', 1),
(860, 'ANELSAM-113', 'GASA EN CAJON', 36, 0, 0, '2023-10-23', 1),
(861, 'ANELSAM-175', 'GASA EN PAQUETE X 200', 1.6, 0, 0, '2023-10-24', 1),
(862, 'VIPI-103', 'GELATINA DUPLICADORA DE MODELOS', 12, 0, 0, '2023-10-25', 1),
(863, 'PDT-120', 'GLICK #1', 26, 0.68, 0, '2023-10-26', 1),
(864, 'AWAN-240', 'GLICK NO 1 AWAN', 2.8, 0, 0, '2023-10-27', 1),
(865, 'HUFRI-130', 'GLICK NO 1 HUFRIEDY', 30, 0.74, 0, '2023-10-28', 1),
(866, 'EURONDA-154', 'GORRO AZUL EURONDA', 20, 0, 0, '2023-10-29', 1),
(867, 'EURONDA-155', 'GORRO AZUL LIGHT EURONDA', 20, 0, 0, '2023-10-30', 1),
(868, 'STEEL-143', 'GORRO DE TELA STEEL', 6, 0, 0, '2023-10-31', 1),
(869, 'EURONDA-152', 'GORRO LILA EURONDA', 20, 0, 0, '2023-11-01', 1),
(870, 'EURONDA-151', 'GORRO NEGRO  EURONDA', 20, 0, 0, '2023-11-02', 1),
(871, 'EURONDA-153', 'GORRO ROSADO EURONDA', 20, 0, 0, '2023-11-03', 1),
(872, 'EURONDA-156', 'GORRO VERDE EURONDA', 20, 0, 0, '2023-11-04', 1),
(873, 'ANELSAM-204', 'GORROS QUIRÚRGICOS PAQUETE X 100', 40, 0, 0, '2023-11-05', 1),
(874, 'ANELSAM-163', 'GORROS QUIRÚRGICOS UNIDAD', 1, 0, 0, '2023-11-06', 1),
(875, 'AWAN-184', 'GOTEROS AWAN', 1.5, 0, 0, '2023-11-07', 1),
(876, 'PDT-102', 'GRACEY 1/2', 26, 0.68, 0, '2023-11-08', 1),
(877, 'PDT-105', 'GRACEY 11/12', 26, 0.68, 0, '2023-11-09', 1),
(878, 'PDT-106', 'GRACEY 13/14', 26, 0.68, 0, '2023-11-10', 1),
(879, 'PDT-103', 'GRACEY 3/4', 26, 0.68, 0, '2023-11-11', 1),
(880, 'PDT-104', 'GRACEY 5/6', 26, 0.68, 0, '2023-11-12', 1),
(881, 'PDT-107', 'GRACEY MINI 1/2', 26, 0.68, 0, '2023-11-13', 1),
(882, 'PDT-109', 'GRACEY MINI 11/12', 26, 0, 0, '2023-11-14', 1),
(883, 'PDT-110', 'GRACEY MINI 13/14', 26, 0.68, 0, '2023-11-15', 1),
(884, 'PDT-108', 'GRACEY MINI 5/6', 26, 0.68, 0, '2023-11-16', 1),
(885, 'AWAN-133', 'GRAPAS 0 AWAN', 3, 0, 0, '2023-11-17', 1),
(886, 'AWAN-110', 'GRAPAS 00 AWAN', 3, 0, 0, '2023-11-18', 1),
(887, 'AWAN-111', 'GRAPAS 1 AWAN', 3, 0, 0, '2023-11-19', 1),
(888, 'AWAN-118', 'GRAPAS 14 AWAN', 3, 0, 0, '2023-11-20', 1),
(889, 'AWAN-130', 'GRAPAS 14A AWAN', 3, 0, 0, '2023-11-21', 1),
(890, 'AWAN-112', 'GRAPAS 2 AWAN', 3, 0, 0, '2023-11-22', 1),
(891, 'AWAN-100', 'GRAPAS 200  AWAN', 3, 0, 0, '2023-11-23', 1),
(892, 'AWAN-245', 'GRAPAS 200 AWAN', 3, 0, 0, '2023-11-24', 1),
(893, 'AWAN-120', 'GRAPAS 201  AWAN', 3, 0, 0, '2023-11-25', 1),
(894, 'AWAN-121', 'GRAPAS 205 AWAN', 3, 0, 0, '2023-11-26', 1),
(895, 'AWAN-243', 'GRAPAS 206 AWAN', 3, 0, 0, '2023-11-27', 1),
(896, 'AWAN-131', 'GRAPAS 210 AWAN', 3, 0, 0, '2023-11-28', 1),
(897, 'AWAN-228', 'GRAPAS 212', 3, 0, 0, '2023-11-29', 1),
(898, 'AWAN-113', 'GRAPAS 2A AWAN', 3, 0, 0, '2023-11-30', 1),
(899, 'AWAN-119', 'GRAPAS 56  AWAN', 3, 0, 0, '2023-12-01', 1),
(900, 'AWAN-114', 'GRAPAS 7 AWAN', 3, 0, 0, '2023-12-02', 1),
(901, 'AWAN-115', 'GRAPAS 7A AWAN', 3, 0, 0, '2023-12-03', 1),
(902, 'AWAN-116', 'GRAPAS 8 AWAN', 3, 0, 0, '2023-12-04', 1),
(903, 'AWAN-117', 'GRAPAS 8A AWAN', 3, 0, 0, '2023-12-05', 1),
(904, 'AWAN-159', 'GRAPAS 9 AWAN', 3, 0, 0, '2023-12-06', 1),
(905, 'HUFRI-139', 'GRAPAS DE ENDODONCIA INDIVIDUAL', 12, 0, 0, '2023-12-07', 1),
(906, 'CARNB-125', 'GUANTES  CARBON CAJON', 290, 0, 0, '2023-12-08', 1),
(907, 'CARNB-126', 'GUANTES  CARBON UNIDAD', 30, 0, 0, '2023-12-09', 1),
(908, 'CRANB-108', 'GUANTES  EVOLVE UNIDAD', 19, 0, 0, '2023-12-10', 1),
(909, 'CRANB-107', 'GUANTES  SIGMA UNIDAD', 9, 0, 0, '2023-12-11', 1),
(910, 'CRANB-140', 'GUANTES CARBON X 5 UNIDADES', 145, 0, 0, '2023-12-12', 1),
(911, 'CRANB-128', 'GUANTES CYNTEX CAJON', 90, 0, 0, '2023-12-13', 1),
(912, 'CRANB-106', 'GUANTES CYNTEX UNIDAD', 10, 0, 0, '2023-12-14', 1),
(913, 'CRANB-103', 'GUANTES EVOLVE CAJON', 180, 0, 0, '2023-12-15', 1),
(914, 'GRANB-115', 'GUANTES EVOLVES X 5 UNIDADES', 90, 0, 0, '2023-12-16', 1),
(915, 'CRANB-105', 'GUANTES ORIGINAL CAJON', 110, 0, 0, '2023-12-17', 1),
(916, 'CRANB-113', 'GUANTES ORIGINAL UNIDAD', 12, 0, 0, '2023-12-18', 1),
(917, 'CRANB-102', 'GUANTES SIGMA CAJON', 85, 0, 0, '2023-12-19', 1),
(918, 'CRANB-104', 'GUANTES XLIM CAJON', 90, 0, 0, '2023-12-20', 1),
(919, 'CRANB-109', 'GUANTES XLIM UNIDAD', 10, 0, 0, '2023-12-21', 1),
(920, 'IVOCLAR-100', 'GUÍAS DE PORCELANA', 65, 0, 0, '2023-12-22', 1),
(921, 'WOODPECKER-109', 'GUTAPERCHA PARA SISTEMA DE OBTURACION', 25, 0, 0, '2023-12-23', 1),
(922, 'MAQUIRA-199', 'HEMOPARE', 10, 0, 0, '2023-12-24', 1),
(923, 'WHIPMIX-114', 'HI TEM 90GR', 1.32, 0, 0, '2023-12-25', 1),
(924, 'MAQUIRA-203', 'HIDROXIDO DE CALCIO EN POLVO MAQUIRA', 7.5, 0, 0, '2023-12-26', 1),
(925, 'MAQUIRA-172', 'HIDROXIDO DE CALCIO FOTOCURADO', 12, 0, 0, '2023-12-27', 1),
(926, 'BORG-122', 'HIGH PULL', 20, 0, 0, '2023-12-28', 1),
(927, 'BORG-100', 'HIGH PULL  CERVICAL', 25, 0, 0, '2023-12-29', 1),
(928, 'ANELSAM-170', 'HILO DE SUTURA SEDA 3 ,0  4 ,0', 2.5, 0, 0, '2023-12-30', 1),
(929, 'ANELSAM-171', 'HILO DE VYCRIL 3-0 Y 4-0', 3.5, 0, 0, '2023-12-31', 1),
(930, 'MAQUIRA-151', 'HILO RETRACTOR 0-00-1-2', 12, 0, 0, '2024-01-01', 1),
(931, 'AWAN-233', 'HOLLEMBACK AWAN', 2.8, 0, 0, '2024-01-02', 1),
(932, 'VRC-102', 'HORNO AUTOMATICO LEXUS', 1250, 0, 0, '2024-01-03', 1),
(933, 'VIPI-205', 'HORNO DE DESENCERADO', 850, 0, 0, '2024-01-04', 1),
(934, 'EDG-101', 'HORNO DE FOTOPOLIMERIZADO', 800, 0, 0, '2024-01-05', 1),
(935, 'EDG-100', 'HORNO DE PORCELANA SEVEN', 5000, 0, 0, '2024-01-06', 1),
(936, 'VRC-101', 'HORNO ELECTRICO MILLENIUM', 800, 0, 0, '2024-01-07', 1),
(937, '60-63', 'INSTRUMENTO  PARA COLOCAR ELASTICO INTRAORALES X 100 UNID', 25, 0, 0, '2024-01-08', 1),
(938, 'MORELLI-164', 'INSTRUMENTO INDIV PARA COLOCAR  IMPLANTE', 200, 0, 0, '2024-01-09', 1),
(939, 'ULTRA-118', 'INSTRUMENTOS DE FISCHER 45 GRADO PEQUEÑO', 41.7, 0, 0, '2024-01-10', 1),
(940, 'ULTRA-117', 'INSTRUMENTOS DE FISCHER 45 GRADO REGULAR', 41.7, 0, 0, '2024-01-11', 1),
(941, 'ULTRA-116', 'INSTRUMENTOS DE FISCHER 90 GRADO REGULAR', 41.7, 0, 0, '2024-01-12', 1),
(942, 'BORG-101', 'INSTRUMENTOS DE STRIPPING', 25, 0, 0, '2024-01-13', 1),
(943, 'WHIPMIX-115', 'INVESTIMENTO  X 20', 3, 0, 0, '2024-01-14', 1),
(944, 'WHIPMIX-103', 'INVESTIMENTO EN LIQUIDO X  1 LITRO WHIP MIX', 30, 0, 0, '2024-01-15', 1),
(945, 'WHIPMIX-104', 'INVESTIMENTO KG , X20', 5, 0, 0, '2024-01-16', 1),
(946, 'WHIPMIX-102', 'INVESTIMENTO POWER CAST 2 KG', 35, 0, 0, '2024-01-17', 1),
(947, 'SUBITON-103', 'IONOMERO AMARILLO', 20, 0, 0, '2024-01-18', 1),
(948, 'SUBITON-101', 'IONOMERO AZUL', 20, 0, 0, '2024-01-19', 1),
(949, 'SUBITON-101-1', 'IONOMERO AZUL 1+1', 10, 0, 0, '2024-01-20', 1),
(950, 'CAVEX-146', 'IONOMERO DE VIDRIO', 35, 0, 0, '2024-01-21', 1),
(951, 'SUBITON-102', 'IONOMERO VERDE', 20, 0, 0, '2024-01-22', 1),
(952, 'AWAN-234', 'JERINGA DE ANESTESIA AWAN', 12, 0, 0, '2024-01-23', 1),
(953, 'ANELSAM-276', 'JERINGA TRIPLE METALICA ANELSAM', 40, 0, 0, '2024-01-24', 1),
(954, 'ULTRA-207', 'JIFFY CEPILLO EN PUNTA INDIVIDUAL', 11, 0, 0, '2024-01-25', 1),
(955, 'ULTRA-115', 'JIFFY CEPILLO PELO DE CABRA RUEDA INDIVIDUAL', 10, 0, 0, '2024-01-26', 1),
(956, 'ULTRA-216', 'JIFFY CEPILLO REDONDO NORMAL PARA PULIDO DE RESINA', 11, 0, 0, '2024-01-27', 1),
(957, 'ULTRA-129', 'JIFFY CIERRA INTERPROXIMALES', 54, 0, 0, '2024-01-28', 1),
(958, 'ULTRA-164', 'JIFFY KIT DE ACABADO', 108.5, 0, 0, '2024-01-29', 1),
(959, 'ULTRA-111', 'JIFFY KIT DE ACABADO EN CAJA PLASTICA (KIT ESTUDIANTE)', 30, 0, 0, '2024-01-30', 1),
(960, 'ULTRA-215', 'JIFFY KIT DE FRESA  PARA ACABADO DE RESINAS', 95, 0, 0, '2024-01-31', 1),
(961, 'ULTRA-209', 'JIFFY POLISHER VARRIETY  PACK', 64.9, 0, 0, '2024-02-01', 1),
(962, 'MORELLI-103', 'KIT  PARA MINI IMPLANTE MORRELLI', 40, 0, 0, '2024-02-02', 1),
(963, 'BEYES-101', 'KIT ALTA Y BAJA  PIEZA DE MANO NORMAL', 350, 0, 0, '2024-02-03', 1),
(964, 'BEYES-102', 'KIT ALTA Y BAJA PIEZA DE MANO CON LUZ', 400, 0, 0, '2024-02-04', 1),
(965, 'DENFLEX-103', 'KIT DE ALTA Y BAJA COLOR AZUL  DENFLEX', 350, 0, 0, '2024-02-05', 1),
(966, 'DENFLEX-102', 'KIT DE ALTA Y BAJA COLOR ROSA DENFLEX', 350, 0, 0, '2024-02-06', 1),
(967, 'AHKIMP-102', 'KIT DE CEPILLADO DE ADULTO', 8, 0, 0, '2024-02-07', 1),
(968, 'AHKIMP-103', 'KIT DE CEPILLADO DE NIÑOS', 8, 0, 0, '2024-02-08', 1),
(969, 'AHKIMP-101', 'KIT DE CEPILLO MAS RELOJ DE ARENA', 2.5, 0, 0, '2024-02-09', 1),
(970, 'AWAN-229', 'KIT DE CIRUGIA MENOR', 25, 0, 0, '2024-02-10', 1),
(971, 'PDT-126', 'KIT DE ESPATULA  PARA RESINA PDT', 100, 0, 0, '2024-02-11', 1),
(972, 'HUFRI-141', 'KIT DE ESPATULAS PARA RESINA X 5 UNIDADES', 130, 0, 0, '2024-02-12', 1),
(973, 'STEEL-150', 'KIT DE ESPEJOS PARA FOTOGRAFIA X 3', 45, 0, 0, '2024-02-13', 1),
(974, 'MDT-272', 'KIT DE FRESAS ENDODONCIA', 37, 0, 0, '2024-02-14', 1),
(975, 'ANELSAM-269', 'KIT DE FRESAS LABORATORIO', 15, 0, 0, '2024-02-15', 1),
(976, 'HUFRI-102', 'KIT DE GRAPAS  X 7 HUFRIEDY', 75, 0, 0, '2024-02-16', 1),
(977, 'MDT-222', 'KIT DE OPERATORIA', 22, 0, 0, '2024-02-17', 1),
(978, 'MDT-221', 'KIT DE PROTESIS', 22, 0, 0, '2024-02-18', 1),
(979, 'MDT-103', 'KIT DE PULIDO COMPOSITE', 22, 0, 0, '2024-02-19', 1),
(980, 'MDT-224', 'KIT DE PULIDO DE AMALGAMAS', 16, 0, 0, '2024-02-20', 1),
(981, 'CLEMDE-118', 'KIT DE PULIDO DE PARTIAL FLEX', 40, 0, 0, '2024-02-21', 1),
(982, 'STEEL-146', 'KIT DE PULIDO DE RESINA', 12, 0, 0, '2024-02-22', 1),
(983, 'MDT-223', 'KIT DE PULIDO DE RESINAS', 16, 0, 0, '2024-02-23', 1),
(984, 'MDT-104', 'KIT DE PULIDO PEDIATRICO', 22, 0, 0, '2024-02-24', 1),
(985, 'WOODPECKER-108', 'KIT DE PUNTAS DE CAVITRON', 50, 0, 0, '2024-02-25', 1),
(986, 'MAQUIRA-125', 'KIT DE PUNTAS INTRAORALES', 5, 0, 0, '2024-02-26', 1),
(987, 'FU02', 'KIT DE RESINAS QUADRANT 5 JERINGAS  CAVEX', 110, 0, 0, '2024-02-27', 1),
(988, 'DORIT-101', 'KIT DE TURBINA DORIT', 300, 0, 0, '2024-02-28', 1),
(989, 'MAQUIRA-180', 'KIT MATRIZ UNIVERSAL', 40, 0, 0, '2024-02-29', 1),
(990, 'MAQUIRA-179', 'KIT MATRIZ UNVIERSAL MINI', 30, 0, 0, '2024-03-01', 1),
(991, 'BJM-103', 'KIT PARA IRRIGAR ENDODONCIA', 15, 0, 0, '2024-03-02', 1),
(992, 'WOODPECKER-101', 'LAMARA FOTOCURADO LED-H', 110, 0, 0, '2024-03-03', 1),
(993, 'ANELSAM-251', 'LAMPARA DE FOTOCURADO', 150, 0, 0, '2024-03-04', 1),
(994, 'ULTRA-105', 'LAMPARA FOTOCURADO ALAMBRICA', 1300, 0, 0, '2024-03-05', 1),
(995, 'BIOART-118', 'LAMPARA FOTOCURADO BIO ART', 230, 0, 0, '2024-03-06', 1),
(996, 'ANELSAM-205', 'LAMPARA FOTOCURADO D 2000', 350, 0, 0, '2024-03-07', 1),
(997, 'ULTRA-145', 'LAMPARA FOTOCURADO INALAMBRICA', 1600, 0, 0, '2024-03-08', 1),
(998, 'WOODPECKER-102', 'LAMPARA FOTOCURADO O-LIGHT', 150, 0, 0, '2024-03-09', 1),
(999, 'ULTRA-214', 'LAMPARA GRAND VALO', 1800, 0, 0, '2024-03-10', 1),
(1000, 'ANELSAM-147', 'LAPICEROS DE MUELA RIGIDOS', 3, 0, 0, '2024-03-11', 1),
(1001, 'BORG-102', 'LAPIZ LIGADOR', 85, 0, 0, '2024-03-12', 1),
(1002, 'VALDI-119', 'LENTES FOTOCURADO', 8, 0, 0, '2024-03-13', 1),
(1003, 'VALDI-118', 'LENTES PROTECTOR', 4, 0, 0, '2024-03-14', 1),
(1004, 'ULTRA-213', 'LENTES VALO', 50, 0, 0, '2024-03-15', 1),
(1005, '60-63-5', 'LIGADURA EN CAJA MULTICOLOR', 12, 0, 0, '2024-03-16', 1),
(1006, 'VALDI-108', 'LIGADURA EN ROLLO 0 ,10', 10, 0, 0, '2024-03-17', 1),
(1007, 'GAC-114', 'LIGADURA EN ROLLO 0 ,10 GAC', 35, 0, 0, '2024-03-18', 1),
(1008, 'VALDI-109', 'LIGADURA EN ROLLO 0 ,12', 10, 0, 0, '2024-03-19', 1),
(1009, 'GAC-115', 'LIGADURA EN ROLLO 0 ,12 GAC', 35, 0, 0, '2024-03-20', 1),
(1010, 'BORG-116', 'LIGADURA METALICA PREFORMADA', 25, 0, 0, '2024-03-21', 1),
(1011, 'OC-268', 'LIJA STRIPPING 1 LUZ DESECHABLE', 9, 0, 0, '2024-03-22', 1),
(1012, 'OC-269', 'LIJA STRIPPING 2 LUZ DESECHABLE', 10, 0, 0, '2024-03-23', 1),
(1013, 'BORG-117', 'LIJAS DE STRIPPING 1 LUZ', 6, 0, 0, '2024-03-24', 1),
(1014, 'BORG-107', 'LIJAS DE STRIPPING 2  LUCES', 6.5, 0, 0, '2024-03-25', 1),
(1015, 'AWAN-214', 'LIMA DE HUESO', 6, 0, 0, '2024-03-26', 1),
(1016, 'ANELSAM-214', 'LIMA SYBROND 25MM 45/80', 7, 0, 0, '2024-03-27', 1),
(1017, 'DENST-103', 'LIMAS  21 MM  45/80 DENSTPLY', 15, 0, 0, '2024-03-28', 1),
(1018, 'THOMAS-100', 'LIMAS  21 MM  45/80 THOMAS', 6.75, 0, 0, '2024-03-29', 1),
(1019, 'DENST-102', 'LIMAS  21 MM 15/40  DENSTPLY', 15, 0, 0, '2024-03-30', 1),
(1020, 'THOMAS-108', 'LIMAS  21 MM 15/40  THOMAS', 6.75, 0, 0, '2024-03-31', 1),
(1021, 'THOMAS-109', 'LIMAS  25 MM  45/80 THOMAS', 6.75, 0, 0, '2024-04-01', 1),
(1022, 'THOMAS-102', 'LIMAS  25 MM 15/40  THOMAS', 6.75, 0, 0, '2024-04-02', 1),
(1023, 'DENST-104', 'LIMAS  25 MM 15/40 DENSTPLY', 15, 0, 0, '2024-04-03', 1),
(1024, 'DENST-105', 'LIMAS  25 MM 45/80 DENSTPLY', 15, 0, 0, '2024-04-04', 1),
(1025, 'DENST-106', 'LIMAS  25 MM 90/140 DENSTPLY', 15, 0, 0, '2024-04-05', 1),
(1026, 'DENST-107', 'LIMAS  31  MM 15/40  DENSTPLY', 15, 0, 0, '2024-04-06', 1),
(1027, 'DENST-108', 'LIMAS  31  MM 45/80  DENSTPLY', 15, 0, 0, '2024-04-07', 1),
(1028, 'THOMAS-104', 'LIMAS  31 MM  45/80 THOMAS', 6.75, 0, 0, '2024-04-08', 1),
(1029, 'THOMAS-103', 'LIMAS  31 MM 15/40  THOMAS', 6.75, 0, 0, '2024-04-09', 1),
(1030, 'THOMAS-107', 'LIMAS  PRESERIE THOMAS # 10', 6.75, 0, 0, '2024-04-10', 1),
(1031, 'THOMAS-105', 'LIMAS  PRESERIE THOMAS # 6', 6.75, 0, 0, '2024-04-11', 1),
(1032, 'THOMAS-106', 'LIMAS  PRESERIE THOMAS # 8', 6.75, 0, 0, '2024-04-12', 1),
(1033, 'DENST-112', 'LIMAS GATES DENSTPLY', 22, 0, 0, '2024-04-13', 1),
(1034, 'JOTA100', 'LIMAS GATES JOTA', 17, 0, 0, '2024-04-14', 1),
(1035, 'GAPA-105', 'LIMAS K 15-40', 6.75, 0, 0, '2024-04-15', 1),
(1036, 'GAPA-106', 'LIMAS K 45-80', 6.75, 0, 0, '2024-04-16', 1),
(1037, 'THOMAS-110', 'LIMAS NITI FLEXIBLES 25 MM 15/40 THOMAS', 8, 0, 0, '2024-04-17', 1),
(1038, 'THOMAS-111', 'LIMAS NITI FLEXIBLES 25 MM 45/80 THOMAS', 8, 0, 0, '2024-04-18', 1),
(1039, 'GAPA-107', 'LIMAS NITTI FLEXIBLES 15-40', 8, 0, 0, '2024-04-19', 1),
(1040, 'GAPA-108', 'LIMAS NITTI FLEXIBLES 45-80', 8, 0, 0, '2024-04-20', 1),
(1041, 'DENST-113', 'LIMAS PEESO DENSTPLY', 22, 0, 0, '2024-04-21', 1),
(1042, 'JOTA-101', 'LIMAS PEESO JOTA', 17, 0, 0, '2024-04-22', 1),
(1043, 'GAPA-112', 'LIMAS PRESERIE 6-8-10', 6.75, 0, 0, '2024-04-23', 1),
(1044, 'DENST-111', 'LIMAS PRESERIE DENSTPLY # 10', 15, 0, 0, '2024-04-24', 1),
(1045, 'DENST-109', 'LIMAS PRESERIE DENSTPLY # 6', 15, 0, 0, '2024-04-25', 1),
(1046, 'DENST-110', 'LIMAS PRESERIE DENSTPLY # 8', 15, 0, 0, '2024-04-26', 1),
(1047, 'GAPA-109', 'LIMAS PROTAPER', 60, 0, 0, '2024-04-27', 1),
(1048, 'GAPA-110', 'LIMAS WAVE ONE', 50, 0, 0, '2024-04-28', 1),
(1049, 'STEEL-102', 'LIMPIADOR ULTRASONICO PARA LABORATORIO', 90, 0, 0, '2024-04-29', 1),
(1050, 'OC-198', 'LIP BUMPER AZUL', 5, 0, 0, '2024-04-30', 1),
(1051, 'MORELLI-165', 'LIP BUMPER MORELLI', 5, 0, 0, '2024-05-01', 1),
(1052, 'OC-158', 'LIP BUMPER OC', 10, 0, 0, '2024-05-02', 1),
(1053, 'MORELLI-226', 'LIP BUMPER ROSA MORELLI', 5, 0, 0, '2024-05-03', 1),
(1054, 'KODAK-102', 'LIQUIDO REVELADOR Y FIJADOR KODAK 1/2 LIT', 13, 0, 0, '2024-05-04', 1),
(1055, 'OTROS-120', 'LLAVERO BRASILEÑOS', 2, 0, 0, '2024-05-05', 1),
(1056, 'STEEL-133', 'LLAVERO DE FORCEP', 3, 0, 0, '2024-05-06', 1),
(1057, 'STEEL-140', 'LLAVERO DE MUELA DE TENIS', 5, 0, 0, '2024-05-07', 1),
(1058, 'STEEL-134', 'LLAVERO DE PIEZA DE MANO', 3, 0, 0, '2024-05-08', 1),
(1059, 'STEEL-128', 'LLAVERO EN FORMA DE MUELA', 3, 0, 0, '2024-05-09', 1),
(1060, 'STEEL-112', 'LLAVERO METALICOS DE PAREJA', 10, 0, 0, '2024-05-10', 1),
(1061, 'WOODPECKER-103', 'LOCALIZADOR DE APICE WOODPECK III PLUS', 200, 0, 0, '2024-05-11', 1),
(1062, 'STEEL-126', 'LOZETA DE PAPEL', 1.5, 0, 0, '2024-05-12', 1),
(1063, 'ANELSAM-224', 'LOZETA DE VIDRIO DELGADA', 3, 0, 0, '2024-05-13', 1),
(1064, 'ANELSAM-225', 'LOZETA DE VIDRIO GRUESA', 6, 0, 0, '2024-05-14', 1),
(1065, 'WHIPMIX-113', 'LUBRICANTE AISLANTE DE DADOS', 10, 0, 0, '2024-05-15', 1),
(1066, 'MAQUIRA-152', 'LUBRICANTE PARA TURBINA', 19, 0, 0, '2024-05-16', 1),
(1067, 'BIOART-119', 'LUPA', 40, 0, 0, '2024-05-17', 1),
(1068, 'BIOART-128', 'MALETA ODONTOLOGICA', 200, 0, 0, '2024-05-18', 1),
(1069, 'AWAN-239', 'MANDRILES AWAN', 0.5, 0, 0, '2024-05-19', 1),
(1070, 'AWAN-215', 'MANGO DE BISTURÍ NO , 3', 3.5, 0, 0, '2024-05-20', 1),
(1071, 'AWAN-221', 'MANGO DE ESPEJO', 1.8, 0, 0, '2024-05-21', 1),
(1072, 'HUFRI-131', 'MANGO DE ESPEJO HU FRIEDY', 15, 0, 0, '2024-05-22', 1),
(1073, 'CLEMDE-107', 'MANTA  PARTIAL FLEX', 6, 0, 0, '2024-05-23', 1),
(1074, 'ANELSAM-200', 'MANTA GRANDE REDONDA PARA LABORATORIO', 3, 0, 0, '2024-05-24', 1),
(1075, 'CLEMDE-108', 'MANTA PARA ABRILLANTAR  PARTIAL FLEX', 10, 0, 0, '2024-05-25', 1),
(1076, 'VRC-103', 'MAQUINA ESPATULADORA DE VACIO', 800, 0, 0, '2024-05-26', 1),
(1077, 'MAQUIRA-223', 'MASCARA FACIAL', 25, 0, 0, '2024-05-27', 1),
(1078, 'VILLACO-89', 'MASCARA FACIAL', 60, 0, 0, '2024-05-28', 1),
(1079, 'MORELLI-100', 'MASCARA FACIAL MORELLI', 59.9, 0, 0, '2024-05-29', 1),
(1080, 'STARKIT-100', 'MASCARILLA N95', 5, 0, 0, '2024-05-30', 1),
(1081, 'CRANB-110', 'MASCARILLAS AZUL', 12, 0, 0, '2024-05-31', 1),
(1082, 'CRANB-112', 'MASCARILLAS MORADA', 6, 0, 0, '2024-06-01', 1),
(1083, 'CRANB-111', 'MASCARILLAS ROSADA', 6, 0, 0, '2024-06-02', 1),
(1084, 'MAQUIRA-126', 'MAX DAM PROTECTOR DE ENCIA FOTOCURADO', 12, 0, 0, '2024-06-03', 1),
(1085, 'PDT-114', 'McCALLS 13/14', 26, 0.68, 0, '2024-06-04', 1),
(1086, 'PDT-115', 'McCALLS 17/18', 26, 0.68, 0, '2024-06-05', 1),
(1087, 'AWAN-231', 'MECHAS PARA MECHERO AWAN', 1, 0, 0, '2024-06-06', 1),
(1088, 'STEEL-125', 'MECHERO DE VIDRIO', 12, 0, 0, '2024-06-07', 1),
(1089, 'AWAN-230', 'MECHEROS AWAN', 10, 0, 0, '2024-06-08', 1),
(1090, 'CAVEX-136', 'MEDIDA DE POLVO Y AGUA', 1.5, 0, 0, '2024-06-09', 1),
(1091, 'CAVEX-122', 'MEDIDA DE POLVO Y AGUA EN BOTELLA', 9, 0, 0, '2024-06-10', 1),
(1092, 'CAVEX-107', 'MEDIDOR DE ENDODONCIA', 1.5, 0, 0, '2024-06-11', 1),
(1093, 'MORELLI-105', 'MENTONERA MORELLI', 20, 0, 0, '2024-06-12', 1),
(1094, 'BIOART-130', 'MESA DE CAMPER BIOART', 20, 0, 0, '2024-06-13', 1),
(1095, 'STEEL-148', 'MESA DE CUARZO PARA HORNO DE PORCELANA', 15, 0, 0, '2024-06-14', 1),
(1096, 'ANELSAM-231', 'METAL LIGA DORADA', 1.6, 0.04, 0, '2024-06-15', 1),
(1097, 'ANELSAM-230', 'METAL LPG', 1.1, 0, 0, '2024-06-16', 1),
(1098, 'ABADENT-106', 'METAL VERABOND 40 UNIDAD', 44, 0, 0, '2024-06-17', 1),
(1099, 'ABADENT-100', 'METAL VERABOND CAJA I KG', 220, 0, 0, '2024-06-18', 1),
(1100, 'ABADENT-101', 'METAL VERABOND X UNIDAD', 1.25, 0.03, 0, '2024-06-19', 1),
(1101, 'ANELSAM-241', 'METAL VERAPDS X 1KG', 90, 0, 0, '2024-06-20', 1),
(1102, 'ANELSAM-220', 'METAL VERAPDS X ONZA', 3.85, 0, 0, '2024-06-21', 1),
(1103, 'ABADENT-105', 'METAL VERASOT CAJA 1 KG', 190, 0, 0, '2024-06-22', 1),
(1104, 'ABADENT-102', 'METAL VERASOT X UNIDAD', 1.25, 0, 0, '2024-06-23', 1),
(1105, 'VIPI-202', 'MEZCLADORA', 800, 0, 0, '2024-06-24', 1),
(1106, 'ULTRA-120', 'MICRO TIPS X 10 UNID', 6, 0, 0, '2024-06-25', 1),
(1107, 'STEEL-111', 'MICROAPLICADOR', 3.5, 0, 0, '2024-06-26', 1),
(1108, 'CAVEX-158', 'MICROAPLICADOR', 7, 0, 0, '2024-06-27', 1),
(1109, 'ULTRA-119', 'MICROAPLICADORES X 400', 45, 0, 0, '2024-06-28', 1),
(1110, 'ULTRA-109', 'MICROTIPS X 100', 44.93, 0, 0, '2024-06-29', 1),
(1111, 'ANELSAM-221', 'MICROTORCH', 44, 0, 0, '2024-06-30', 1),
(1112, 'DENFLEX-108', 'MIRCROMOTOR DE BAJA  DENFLEX', 140, 0, 0, '2024-07-01', 1),
(1113, 'SUBITON-107', 'MODELINA EN BARRA DE BAJA FUSION', 1.5, 0, 0, '2024-07-02', 1),
(1114, 'DENFLEX-112', 'MODULO PARA LABORATORIO NEUMATICO', 400, 0, 0, '2024-07-03', 1),
(1115, 'DENFLEX-114', 'MODULO PORTATIL', 450, 0, 0, '2024-07-04', 1),
(1116, 'ANELSAM-227', 'MORTERO Y PISTILO', 5, 0, 0, '2024-07-05', 1),
(1117, 'AWAN-235', 'MORTONSON AWAN', 2.8, 0, 0, '2024-07-06', 1),
(1118, 'ANELSAM-114', 'MOTOR DE ALTA Y BAJA CON ACCESORIOS', 350, 0, 0, '2024-07-07', 1),
(1119, 'CLEMDE-119', 'MOTOR DE ALTA Y BAJA CON SUCCION', 400, 0, 0, '2024-07-08', 1),
(1120, 'DENFLEX-106', 'MOTOR DE ENDODONCIA DENFLEX', 800, 0, 0, '2024-07-09', 1),
(1121, 'WOODPECKER-104', 'MOTOR DE ENDODONCIA ENDORADAR PLUS', 700, 0, 0, '2024-07-10', 1),
(1122, 'WOODPECKER-105', 'MOTOR DE ENDODONCIA MOTOPEX', 800, 0, 0, '2024-07-11', 1),
(1123, 'WOODPECKER-107', 'MOTOR DE IMPLANTES', 1300, 0, 0, '2024-07-12', 1),
(1124, 'ANELSAM-201', 'MOTOR DE LABORATORIO DE BAJA', 250, 0, 0, '2024-07-13', 1),
(1125, 'DENFLEX-104', 'MOTOR DE LABORATORIO MARATHON', 280, 0, 0, '2024-07-14', 1),
(1126, 'DENFLEX-105', 'MOTOR DE LIMPLANTES DENTLEX', 1250, 0, 0, '2024-07-15', 1),
(1127, 'ULTRA-169', 'MTA FLOW KIT', 160.09, 0, 0, '2024-07-16', 1),
(1128, 'STEEL-108', 'MUELA PORTA PAPEL', 6, 0, 0, '2024-07-17', 1),
(1129, 'STEEL-109', 'MUELA TARJETERO', 7, 0, 0, '2024-07-18', 1),
(1130, 'ANELSAM-141', 'MUFLA CAJA DE MUERTO', 12, 0, 0, '2024-07-19', 1),
(1131, 'ANELSAM-125', 'MUFLA GRANDE DE  BRONCE 28 Y 29', 40, 0, 0, '2024-07-20', 1),
(1132, 'ANELSAM-164', 'MUFLA GRANDE DE ALUMINIO 28 Y 29', 15, 0, 0, '2024-07-21', 1),
(1133, 'VIPI-100', 'MUFLA PARA MICROONDA VIPI', 85, 0, 0, '2024-07-22', 1),
(1134, 'CLEMDE-120', 'MUFLA PARA PARTIAL FLEX', 85, 0, 0, '2024-07-23', 1),
(1135, 'ANELSAM-140', 'MUFLA RIÑONERA', 12, 0, 0, '2024-07-24', 1),
(1136, 'ULTRA-128', 'NAVITIPS SURTIDA 30G  25MM X 20', 47.3, 0, 0, '2024-07-25', 1),
(1137, 'ULTRA-172', 'NAVITIPS SURTIDA 30G X 50 MM', 101.8, 0, 0, '2024-07-26', 1),
(1138, 'VALDI-125', 'NEGATOSCOPIO VALDI', 40, 0, 0, '2024-07-27', 1),
(1139, 'BORG-108', 'NITTI EN ROLLO 12-14-16', 35, 0, 0, '2024-07-28', 1),
(1140, 'ANELSAM-243', 'OCLUDE VERDE ARTI-SPRAY GRANDE', 25, 0, 0, '2024-07-29', 1),
(1141, 'ANELSAM-216', 'OCLUDE VERDE SPRAY PEQUEÑO', 17, 0, 0, '2024-07-30', 1),
(1142, 'MAQUIRA-209', 'OLEO DE NARANJA', 10, 0, 0, '2024-07-31', 1),
(1143, 'ULTRA-150', 'OPALCUPS X 20', 65, 0, 0, '2024-08-01', 1),
(1144, 'ULTRA-149', 'OPALCUPS X UNIDAD', 3.5, 0, 0, '2024-08-02', 1),
(1145, 'ULTRA-175', 'OPALDAM BARRERA GINGIVAL JERINGA INDIVIDUAL', 12, 0, 0, '2024-08-03', 1),
(1146, 'ULTRA-155', 'OPALESCENCE 20% PF', 53, 0, 0, '2024-08-04', 1),
(1147, 'ULTRA-127', 'OPALESCENCE ENDO KIT 2 JERINGAS', 56, 0, 0, '2024-08-05', 1),
(1148, 'ULTRA-162', 'OPALESCENCE GO MELON', 65, 0, 0, '2024-08-06', 1),
(1149, 'ULTRA-161', 'OPALESCENCE GO MENTA', 65, 0, 0, '2024-08-07', 1),
(1150, 'ULTRA-151', 'OPALUSTRE KIT X 4', 65, 0, 0, '2024-08-08', 1),
(1151, 'ULTRA-211', 'OPALUSTRE X 2', 54, 0, 0, '2024-08-09', 1),
(1152, 'ULTRA-174', 'ORAL SEAL KIT', 41.7, 0, 0, '2024-08-10', 1),
(1153, 'BIOART-123', 'ORGANIZADOR DE RESINA', 50, 0, 0, '2024-08-11', 1),
(1154, 'SUBITON-100', 'OXIDO DE ALUMINIO 50 MICRA', 13, 0, 0, '2024-08-12', 1),
(1155, 'MAQUIRA-211', 'OXIDO DE ZINC', 3.5, 0, 0, '2024-08-13', 1),
(1156, 'MAQUIRA-212', 'OXIDO DE ZINC DE 250 GRAMOS', 10, 0, 0, '2024-08-14', 1),
(1157, 'CLEMDE-121', 'PALADAR DE CERA CON BARRAS GINGIVALES', 4, 0, 0, '2024-08-15', 1),
(1158, 'ANELSAM-228', 'PAÑO EXPRIMIDOR EN BOLSA', 2, 0, 0, '2024-08-16', 1),
(1159, 'ANELSAM-222', 'PAÑO EXPRIMIDOR EN CAJA', 5, 0, 0, '2024-08-17', 1),
(1160, 'ARTIFOL-100', 'PAPEL DE ARTICULAR ARTIFOL', 35, 0, 0, '2024-08-18', 1),
(1161, 'MAQUIRA-165', 'PAPEL DE ARTICULAR MAQUIRA', 1.5, 0, 0, '2024-08-19', 1),
(1162, 'WHIPMIX-108', 'PAPEL DE ARTICULAR WHIPMIX', 1.5, 0, 0, '2024-08-20', 1),
(1163, 'ANELSAM-217', 'PAPEL DE TRAZADO CEFALOMETRICO', 37, 0, 0, '2024-08-21', 1),
(1164, 'RAX103', 'PAQUETE #1', 40, 0, 0, '2024-08-22', 1),
(1165, 'RAX104', 'PAQUETE #2', 50, 0, 0, '2024-08-23', 1),
(1166, 'RAX105', 'PAQUETE #3', 30, 0, 0, '2024-08-24', 1),
(1167, 'RAX106', 'PAQUETE #4', 60, 0, 0, '2024-08-25', 1),
(1168, 'RAX107', 'PAQUETE #5', 70, 0, 0, '2024-08-26', 1),
(1169, 'BIOART-126', 'PARALELOMETRO', 350, 0, 0, '2024-08-27', 1),
(1170, 'MAQUIRA-202', 'PARAMONOCLOROFENOL', 6, 0, 0, '2024-08-28', 1),
(1171, 'CLEMDE-123', 'PARTIAL FLEX EQUIPO COMPLETO', 1700, 0, 0, '2024-08-29', 1),
(1172, 'CLEMDE-122', 'PARTIAL FLEX X 5 UNIDADES', 50, 0, 0, '2024-08-30', 1),
(1173, 'CLEMDE-117', 'PARTIAL FLEX X UNIDAD', 13, 0, 0, '2024-08-31', 1),
(1174, 'MAQUIRA-204', 'PASTA DIAMANTADA', 9, 0, 0, '2024-09-01', 1),
(1175, 'ULTRA-152', 'PASTA DIAMANTADA ULTRADENT  X 2 JERINGAS', 28, 0, 0, '2024-09-02', 1),
(1176, 'MAQUIRA-154', 'PASTA PROFILACTICA MAQ', 6, 0, 0, '2024-09-03', 1),
(1177, 'ULTRA-210', 'PASTA PROFILACTICA ULTRAPRO UNIDAD', 0.5, 0, 0, '2024-09-04', 1),
(1178, 'ULTRA-206', 'PASTA PROFILACTICA ULTRAPRO X CAJA', 53, 0, 0, '2024-09-05', 1),
(1179, 'ULTRA-106', 'PASTA PROFILAXIS ULTRAPROTX CAJA', 48, 0, 0, '2024-09-06', 1),
(1180, 'CAVEX-156', 'PASTA ZINQUENOLICA', 20, 0, 0, '2024-09-07', 1),
(1181, 'MAQUIRA-128', 'PASTA ZINQUENOLICA', 13, 0, 0, '2024-09-08', 1),
(1182, 'WHIPMIX-117', 'PASTILLA AMBER LT A2', 20, 0, 0, '2024-09-09', 1),
(1183, 'CLEMDE-111', 'PASTILLA LITHYUM   A1', 20, 0, 0, '2024-09-10', 1),
(1184, 'CLEMDE-113', 'PASTILLA LITHYUM   A2', 20, 0, 0, '2024-09-11', 1),
(1185, 'CLEMDE-114', 'PASTILLA LITHYUM   A3', 20, 0, 0, '2024-09-12', 1),
(1186, 'CLEMDE-115', 'PASTILLAS PARA INYECTAR COFIAS MO', 20, 0, 0, '2024-09-13', 1),
(1187, 'ANELSAM-202', 'PEDAL NEUMATICO', 40, 0, 0, '2024-09-14', 1),
(1188, 'AWAN-185', 'PERFORADORA DE DIQUE DE GOMA', 15, 0, 0, '2024-09-15', 1),
(1189, 'MA-888-3', 'PERIOSTOTOMO', 6, 0, 0, '2024-09-16', 1),
(1190, 'ULTRA-147', 'PERMAFLO A 3 ,5  CEMENTO RESINASO DUAL', 83, 0, 0, '2024-09-17', 1),
(1191, 'ULTRA-192', 'PERMAFLO PINCK KIT', 48.9, 0, 0, '2024-09-18', 1),
(1192, 'ULTRA-195', 'PERMAFLO RESINA FLUIDA A 2 REFILL', 48.9, 0, 0, '2024-09-19', 1),
(1193, 'ULTRA-193', 'PERMAFLO RESINA FLUIDA A 3 ,5 REFILL', 48.9, 0, 0, '2024-09-20', 1),
(1194, 'ULTRA-194', 'PERMAFLO RESINA FLUIDA A 3 REFILL', 48.9, 0, 0, '2024-09-21', 1),
(1195, 'ULTRA-189', 'PERMASEAL', 25, 0, 0, '2024-09-22', 1),
(1196, 'S3517', 'Permashade cemento para carillas translucido', 78.59, 0, 0, '2024-09-23', 1),
(1197, 'ULTRA-157', 'PERMASHADE CEMENTO PARA CARILLAS TRANSLUCIDO', 78.7, 0, 0, '2024-09-24', 1),
(1198, 'ANELSAM-191', 'PIEDERA MONTADA ROSADA', 0.25, 0, 0, '2024-09-25', 1),
(1199, 'ANELSAM-181', 'PIEDRA ARKANSA', 1.5, 0, 0, '2024-09-26', 1),
(1200, 'PDT-113', 'PIEDRA DE ARKANSA PARA AFILAR INSTRUMENTOS', 45, 0, 0, '2024-09-27', 1),
(1201, 'ANELSAM-178', 'PIEDRA MONTADA BLANCA Y VERDE', 0.5, 0, 0, '2024-09-28', 1),
(1202, 'HUFRI-103', 'PIEDRA PARA AFILAR CURETAS HUFRI', 45, 0, 0, '2024-09-29', 1),
(1203, 'MAQUIRA-213', 'PIEDRA POMEZ', 5, 0, 0, '2024-09-30', 1),
(1204, 'DORIT-100', 'PIEZA DE ALTA VELOCIDAD PUSH', 50, 0, 0, '2024-10-01', 1),
(1205, 'ANELSAM-272', 'PIEZA DE MANO BAJA VELOCIDAD CON CONTRAAUNGULO', 180, 0, 0, '2024-10-02', 1),
(1206, 'MEDID-103', 'PIEZA DE MANO DE BAJA VELOCIDAD', 105, 0, 0, '2024-10-03', 1),
(1207, 'BEYES-103', 'PIEZA DE MANO MAXSO 200 ECONOMICA', 80, 0, 0, '2024-10-04', 1),
(1208, 'BEYES-100', 'PIEZA DE MANO MAXSO 800 CON LUZ', 200, 0, 0, '2024-10-05', 1),
(1209, 'DENFLEX-109', 'PIEZA DE MANO RECTA', 110, 0, 0, '2024-10-06', 1),
(1210, 'ULTRA-187', 'PILSTOLA PARA EXPERTEN', 136.2, 0, 0, '2024-10-07', 1),
(1211, 'BIOART-131', 'PIN INCISAL BIOART', 7, 0, 0, '2024-10-08', 1),
(1212, 'CAVEX-134', 'PINCEL PELO DE MARTHA', 6, 0, 0, '2024-10-09', 1),
(1213, 'ANELSAM-248', 'PINES DOBLES PAQUETE DE 10 UNIDS', 2.5, 0, 0, '2024-10-10', 1),
(1214, 'ANELSAM-236', 'PINES INTRARADICULARES METALICO DORADO', 0.6, 0, 0, '2024-10-11', 1),
(1215, 'ANELSAM-234', 'PINES PARA TROQUELES SENCILLO INDIVIDUAL', 0.1, 0, 0, '2024-10-12', 1),
(1216, 'OC-105', 'PINZA  CORTE DISTAL OC', 75, 0, 0, '2024-10-13', 1),
(1217, 'AWAN-187', 'PINZA  GUBIA AWAN', 12, 0, 0, '2024-10-14', 1),
(1218, 'AWAN-126', 'PINZA 3 PICOS AWAN', 10, 0, 0, '2024-10-15', 1),
(1219, 'ORTH-104', 'PINZA 3 PICOS ORTHOMET', 75, 0, 0, '2024-10-16', 1),
(1220, 'ORTH-106', 'PINZA 349 RT ORTHOMET', 75, 0, 0, '2024-10-17', 1),
(1221, 'AWAN-236', 'PINZA ADSON AWAN', 3, 0, 0, '2024-10-18', 1),
(1222, 'ORTH-101', 'PINZA ARCOS LINGUALES 410 ORTHOMET', 75, 0, 0, '2024-10-19', 1),
(1223, 'AWAN-106', 'PINZA CORTE DISTAL AWAN', 40, 0, 0, '2024-10-20', 1),
(1224, 'AWAN-103', 'PINZA CORTE FRONTAL AWAN', 40, 0, 0, '2024-10-21', 1),
(1225, 'ORTH-105', 'PINZA CORTE FRONTAL ORTHOMET', 75, 0, 0, '2024-10-22', 1),
(1226, 'AHKIMP-100', 'PINZA CORTE PESADO AHKIMP', 140, 0, 0, '2024-10-23', 1),
(1227, 'PDT-117', 'PINZA DE ALGODON', 20, 0, 0, '2024-10-24', 1),
(1228, 'AWAN-217', 'PINZA DE ALGODON AWAN', 2.8, 0, 0, '2024-10-25', 1),
(1229, 'AWAN-218', 'PINZA DE ALGODON CON CIERRE', 5, 0, 0, '2024-10-26', 1),
(1230, 'VALDI-132', 'PINZA DE CORTE AMARILLA', 18, 0, 0, '2024-10-27', 1),
(1231, 'OC-106', 'PINZA DE DIRECTOR DE LIGADURA OC', 75, 0, 0, '2024-10-28', 1),
(1232, 'AWAN-107', 'PINZA DE LA ROSA AWAN', 10, 0, 0, '2024-10-29', 1),
(1233, 'AWAN-105', 'PINZA DE NANCE AWAN', 10, 0, 0, '2024-10-30', 1),
(1234, 'AWAN-104', 'PINZA DE PICO DE ALCON AWAN', 10, 0, 0, '2024-10-31', 1),
(1235, 'AWAN-108', 'PINZA DE YOUNG AWAN', 10, 0, 0, '2024-11-01', 1),
(1236, 'AWAN-247', 'PINZA DOS PICOS', 10, 0, 0, '2024-11-02', 1),
(1237, 'AWAN-132', 'PINZA HOW CURVA/RECTA AWAN', 10, 0, 0, '2024-11-03', 1),
(1238, 'HUFRI-101', 'PINZA HU FRIEDY', 90, 0, 0, '2024-11-04', 1),
(1239, 'ORTH-102', 'PINZA JARABACK 355 ORTHOMET', 75, 0, 0, '2024-11-05', 1),
(1240, 'AWAN-160', 'PINZA KELLY CURVA AWAN', 5, 0, 0, '2024-11-06', 1),
(1241, 'AWAN-161', 'PINZA KELLY RECTA AWAN', 5, 0, 0, '2024-11-07', 1),
(1242, 'AWAN-127', 'PINZA MATHEW AWAN', 10, 0, 0, '2024-11-08', 1),
(1243, 'ORTH-103', 'PINZA MATHEW ORTHOMET', 75, 0, 0, '2024-11-09', 1),
(1244, 'AWAN-186', 'PINZA MILLER AWAN', 3, 0, 0, '2024-11-10', 1),
(1245, 'AWAN-163', 'PINZA MOSQUITO CURVA AWAN', 5, 0, 0, '2024-11-11', 1),
(1246, 'AWAN-162', 'PINZA MOSQUITO RECTA AWAN', 5, 0, 0, '2024-11-12', 1),
(1247, 'INVECTA-105', 'PINZA ODG  346 RT INVECTA', 140, 0, 0, '2024-11-13', 1),
(1248, 'INVECTA-110', 'PINZA ODG  347 INVECTA', 140, 0, 0, '2024-11-14', 1),
(1249, 'INVECTA-112', 'PINZA ODG 1000 CORTE FRONTAL INVECTA', 140, 0, 0, '2024-11-15', 1),
(1250, 'INVECTA-109', 'PINZA ODG 1016 CORTE DISTAL INVECTA', 140, 0, 0, '2024-11-16', 1),
(1251, 'INVECTA-100', 'PINZA ODG 139 PICO DE PAJARO CORTA INVECTA', 140, 0, 0, '2024-11-17', 1),
(1252, 'INVECTA-101', 'PINZA ODG 140 PICO DE PAJARO LARGA INVECTA', 140, 0, 0, '2024-11-18', 1),
(1253, 'INVECTA-102', 'PINZA ODG 158 WEINGART  INVECTA', 140, 0, 0, '2024-11-19', 1),
(1254, 'INVECTA-103', 'PINZA ODG 203 B INVECTA', 140, 0, 0, '2024-11-20', 1),
(1255, 'INVECTA-104', 'PINZA ODG 207 OPTICA INVECTA', 140, 0, 0, '2024-11-21', 1),
(1256, 'INVECTA-106', 'PINZA ODG 349 RT QUITA BRACKET INVECTA', 140, 0, 0, '2024-11-22', 1),
(1257, 'INVECTA-113', 'PINZA ODG 352 TWEED OMEGA  INVECTA', 140, 0, 0, '2024-11-23', 1),
(1258, 'INVECTA-107', 'PINZA ODG 400 B INVECTA', 140, 0, 0, '2024-11-24', 1),
(1259, 'INVECTA-111', 'PINZA ODG 505 MATHEW INVECTA', 100, 0, 0, '2024-11-25', 1),
(1260, 'INVECTA-108', 'PINZA ODG 805 INVECTA', 140, 0, 0, '2024-11-26', 1),
(1261, 'ORTH-100', 'PINZA OPTICAL 207 ORTHOMET', 75, 0, 0, '2024-11-27', 1),
(1262, 'OC-107', 'PINZA PARA COLOCAR AUTOLIGADO OC', 35, 0, 0, '2024-11-28', 1),
(1263, 'MORELLI-116', 'PINZA PORTA BRACKETS MORRELLI', 25, 0, 0, '2024-11-29', 1),
(1264, 'MORELLI-194', 'PINZA PORTA TUBOS MORELLI', 25, 0, 0, '2024-11-30', 1),
(1265, 'AWAN-128', 'PINZA QUITA BANDAS AWAN', 15, 0, 0, '2024-12-01', 1),
(1266, 'AWAN-226', 'PINZA QUITA BRACKETS 349 AWAN', 15, 0, 0, '2024-12-02', 1),
(1267, 'MAQUIRA-107', 'PISTOLA DE   PRESICIÓN', 45, 0, 0, '2024-12-03', 1),
(1268, 'CAVEX-157', 'PISTOLA DISPENSADORA DE SILICON', 45, 0, 0, '2024-12-04', 1),
(1269, 'WHIPMIX-119', 'PISTON DE INYECCION LITHYUM', 1.5, 0, 0, '2024-12-05', 1),
(1270, 'CLEMDE-116', 'PISTON PARA LITHIUM', 1, 0, 0, '2024-12-06', 1),
(1271, 'AWAN-246', 'PKT AWAN', 12, 0, 0, '2024-12-07', 1),
(1272, 'HUFRI-105', 'PKT EN KIT DE 5 PIEZAS HUFRI', 100, 0, 0, '2024-12-08', 1),
(1273, 'BP004-1', 'PLACA BASE INFERIOR', 0.5, 0, 0, '2024-12-09', 1),
(1274, 'BP054', 'PLACA BASE INFERIOR EN CAJA', 45, 0, 0, '2024-12-10', 1),
(1275, 'BP054-1', 'PLACA BASE SUPERIOR', 0.5, 0, 0, '2024-12-11', 1),
(1276, 'BP004', 'PLACA BASE SUPERIOR EN CAJA', 45, 0, 0, '2024-12-12', 1),
(1277, 'STEEL-100', 'PLASTICO PROTECTOR AZUL EN ROLLO', 10, 0, 0, '2024-12-13', 1),
(1278, 'STEEL-101', 'PLASTICO PROTECTOR CLEAR EN ROLLO', 10, 0, 0, '2024-12-14', 1),
(1279, 'WHIPMIX-105', 'PLATINA PARA ARTICULADOR   BLANCA', 5, 0, 0, '2024-12-15', 1),
(1280, 'BIOART-125', 'PLATINA PARA ARTICULADOR  BIOART', 8, 0, 0, '2024-12-16', 1),
(1281, 'MCD-101', 'POLYCRIL', 3, 0, 0, '2024-12-17', 1),
(1282, 'ULTRA-135', 'PORCELAINE ETCH + SILANO DOS JERINGAS', 15, 0, 0, '2024-12-18', 1),
(1283, 'MA-3014-00', 'PORTA AGUJA', 6, 0, 0, '2024-12-19', 1),
(1284, 'STEEL-110', 'PORTA ALGODON ACRILICO', 12, 0, 0, '2024-12-20', 1),
(1285, 'AWAN-225', 'PORTA ALGODON METALICO', 12, 0, 0, '2024-12-21', 1),
(1286, 'AWAN-188', 'PORTA AMALGAMA METALICO', 12, 0, 0, '2024-12-22', 1),
(1287, 'MAQUIRA-129', 'PORTA AMALGAMA PLASTICO FUSIL', 6, 0, 0, '2024-12-23', 1),
(1288, 'AWAN-189', 'PORTA BANDA MATRIZ', 3.5, 0, 0, '2024-12-24', 1),
(1289, 'STEEL-105', 'PORTA CARILLA PARA CEMENTAR X 16 UNIDADES', 16.5, 0, 0, '2024-12-25', 1),
(1290, 'STEEL-135', 'PORTA CHAROLA', 15, 0, 0, '2024-12-26', 1),
(1291, 'ANELSAM-126', 'PORTA COALLA', 5, 0, 0, '2024-12-27', 1),
(1292, 'AWAN-190', 'PORTA GRAPA', 10, 0, 0, '2024-12-28', 1),
(1293, 'VALDI-111', 'PORTA GUANTE  ACRILICO', 20, 0, 0, '2024-12-29', 1),
(1294, 'ANELSAM-165', 'PORTA RADIOGRAFIA OCLUSALES PLASTICA', 1, 0, 0, '2024-12-30', 1),
(1295, 'ANELSAM-179', 'PORTA RADIOGRAFIA PERIAPICALES PLASTICO', 1, 0, 0, '2024-12-31', 1),
(1296, 'MAQUIRA-170', 'PORTA RADIOGRAFIA PERIAPICALES PLASTICO', 1.5, 0, 0, '2025-01-01', 1),
(1297, 'VALDI-110', 'PORTA VASO ACRILICO', 20, 0, 0, '2025-01-02', 1),
(1298, 'STEEL-142', 'PORTARADIOGRAFIA DE CARTON', 1, 0, 0, '2025-01-03', 1),
(1299, 'MAQUIRA-157', 'POSCIONADOR DE ALETAS DE MORDIDA', 3, 0, 0, '2025-01-04', 1),
(1300, 'MAQUIRA-131', 'POSCIONADOR DE ELASTICO', 4, 0, 0, '2025-01-05', 1),
(1301, 'OC-128', 'POSCIONADOR DE ELASTICO', 25, 0, 0, '2025-01-06', 1),
(1302, 'MAQUIRA-190', 'POSCIONADOR DE PERIODONCIA', 30, 0, 0, '2025-01-07', 1),
(1303, 'MORELLI-196', 'POSICIONADOR ALEXANDER', 32.5, 0, 0, '2025-01-08', 1),
(1304, 'ULTRA-197', 'POSTE  NO 0', 9.6, 0, 0, '2025-01-09', 1),
(1305, 'ULTRA-200', 'POSTE  NO 1', 9.6, 0, 0, '2025-01-10', 1),
(1306, 'MAQUIRA-178', 'POSTE DE FIBRA DE VIDRIO 0,5', 6, 0, 0, '2025-01-11', 1),
(1307, 'MAQUIRA-130', 'POSTE DE FIBRA DE VIDRIO KIT', 30, 0, 0, '2025-01-12', 1),
(1308, 'ULTRA-199', 'POSTE NO 2', 9.6, 0, 0, '2025-01-13', 1),
(1309, 'STEEL-103', 'PRENSA GRANDE PARA MUFLA', 40, 0, 0, '2025-01-14', 1),
(1310, 'ANELSAM-143', 'PRENSA PORTATIL', 15, 0, 0, '2025-01-15', 1),
(1311, 'CAVEX-162', 'PROMOCION ALGINATO 3+1  CAVEX CREAM', 36, 0, 0, '2025-01-16', 1),
(1312, 'CAVEX-160', 'PROMOCION ALGINATO 3+1 CAVEX CA37', 27, 0, 0, '2025-01-17', 1),
(1313, 'CAVEX-161', 'PROMOCION ALGINATO 3+1 ORTHOTRACE', 33, 0, 0, '2025-01-18', 1),
(1314, 'EURONDA-101', 'PROMOCION CAMPOS  EURONDA CAJON', 22, 0, 0, '2025-01-19', 1),
(1315, 'CRANB-129', 'PROMOCION DE MASCARILLA 6 CAJA', 66, 0, 0, '2025-01-20', 1),
(1316, 'CAVEX-159', 'PROMOCION DE RESINAS CAVEX', 25, 0, 0, '2025-01-21', 1),
(1317, 'EURONDA-102', 'PROMOCION EURONDA 4 PROD', 12, 0, 0, '2025-01-22', 1),
(1318, 'EURONDA-103', 'PROMOCION EURONDA 5 PROD', 22, 0, 0, '2025-01-23', 1),
(1319, 'EURONDA-100', 'PROMOCION VASOS X 10', 25, 0, 0, '2025-01-24', 1),
(1320, 'VIPI-106', 'PULIDOR DE  ACRILICO', 5, 0, 0, '2025-01-25', 1),
(1321, 'HUFRI-132', 'PUNTA DE CAVITRON HU FIREDY', 100, 0, 0, '2025-01-26', 1),
(1322, 'CAVEX-100', 'PUNTA DE SILICONA INTRAORAL', 1, 0, 0, '2025-01-27', 1),
(1323, 'CAVEX-137', 'PUNTA DE SILICONA MEZCLADORA', 1.35, 0, 0, '2025-01-28', 1),
(1324, 'ANELSAM-265', 'PUNTA DE SILICONA NEGRO', 1, 0, 0, '2025-01-29', 1),
(1325, 'GAPA-122', 'PUNTAS DE GUTAPERCHA 15', 6.5, 0, 0, '2025-01-30', 1),
(1326, 'GAPA-103', 'PUNTAS DE GUTAPERCHA 15/40', 6.5, 0, 0, '2025-01-31', 1),
(1327, 'META-108', 'PUNTAS DE GUTAPERCHA 20', 6.5, 0, 0, '2025-02-01', 1),
(1328, 'GAPA-123', 'PUNTAS DE GUTAPERCHA 25', 6.5, 0, 0, '2025-02-02', 1),
(1329, 'GAPA-104', 'PUNTAS DE GUTAPERCHA 3/1', 19.5, 0, 0, '2025-02-03', 1),
(1330, 'GAPA-124', 'PUNTAS DE GUTAPERCHA 45/80', 6.5, 0, 0, '2025-02-04', 1),
(1331, 'META-106', 'PUNTAS DE GUTAPERCHA F', 6.5, 0, 0, '2025-02-05', 1),
(1332, 'GAPA-121', 'PUNTAS DE GUTAPERCHA F', 6.5, 0, 0, '2025-02-06', 1),
(1333, 'GAPA-113', 'PUNTAS DE GUTAPERCHA F1-F2-F3', 12, 0, 0, '2025-02-07', 1),
(1334, 'GAPA-120', 'PUNTAS DE GUTAPERCHA FF', 6.5, 0, 0, '2025-02-08', 1),
(1335, 'GAPA-119', 'PUNTAS DE GUTAPERCHA MF', 6.5, 0, 0, '2025-02-09', 1),
(1336, 'GAPA-118', 'PUNTAS DE GUTAPERCHA WAVE ONE', 12, 0, 0, '2025-02-10', 1),
(1337, 'ANELSAM-115', 'PUNTAS DE JERINGA TRIPLE DESCARTABLES BOLSA 250', 40, 0, 0, '2025-02-11', 1),
(1338, 'META-102', 'PUNTAS DE PAPEL ACCESORIAS', 5, 0, 0, '2025-02-12', 1),
(1339, 'ANELSAM-192', 'PUNTAS DESCARTABLES PARA JERINGAS TRIPLE UNIDAD', 0.25, 0, 0, '2025-02-13', 1),
(1340, 'ULTRA-191', 'PUNTAS UNIVESALES EN BOLSA', 6, 0, 0, '2025-02-14', 1),
(1341, 'OC-159', 'QUADHELIX OC', 3, 0, 0, '2025-02-15', 1),
(1342, 'RAX-805', 'RADIOGRAFIA CARPAL', 20, 0, 0, '2025-02-16', 1),
(1343, 'RAX101', 'RADIOGRAFIA DE ATM', 20, 0, 0, '2025-02-17', 1);
INSERT INTO `producto` (`indproducto`, `codigo_producto`, `nombre_producto`, `precio1`, `precio2`, `precio3`, `fecha_vencimiento`, `bandera`) VALUES
(1344, 'RAX102', 'RADIOGRAFIA LATERAL', 20, 0, 0, '2025-02-18', 1),
(1345, 'RAX117', 'RADIOGRAFIA PANORAMICA', 20, 0, 0, '2025-02-19', 1),
(1346, 'RAX116', 'RADIOGRAFIA POSTEROANTERIOR', 20, 0, 0, '2025-02-20', 1),
(1347, 'RAX-802', 'RADIOGRAFIA POSTEROANTERIOR', 20, 0, 0, '2025-02-21', 1),
(1348, 'KODAK-101', 'RADIOGRAFIAS ADULTO CAJA', 50, 0, 0, '2025-02-22', 1),
(1349, 'KODAK-105', 'RADIOGRAFIAS ADULTO INDIVIDUAL', 0.5, 0, 0, '2025-02-23', 1),
(1350, 'KODAK-100', 'RADIOGRAFIAS DE NIÑO CAJA', 50, 0, 0, '2025-02-24', 1),
(1351, 'KODAK-104', 'RADIOGRAFIAS DE NIÑO INDIVIDUAL', 0.5, 0, 0, '2025-02-25', 1),
(1352, 'KODAK-103', 'RADIOGRAFIAS OCLUSALES INDIVUDUALES', 2.4, 0, 0, '2025-02-26', 1),
(1353, 'WOODPECKER-110', 'RADIOVISIOGRAFO SENSOR-H1', 1100, 0, 0, '2025-02-27', 1),
(1354, 'PDT-111', 'RASPADOR 15/33', 26, 0.68, 0, '2025-02-28', 1),
(1355, 'HUFRI-134', 'RASPADOR 31/32 HUFRIEDY', 30, 0.74, 0, '2025-03-01', 1),
(1356, 'HUFRI-135', 'RASPADOR 34/35 HUFRIEDY', 30, 0.74, 0, '2025-03-02', 1),
(1357, 'HUFRI-133', 'RASPADORES  15/33 HUFRIEDY', 30, 0.74, 0, '2025-03-03', 1),
(1358, 'ANELSAM-233', 'RATONES', 0.25, 0, 0, '2025-03-04', 1),
(1359, 'ANELSAM-218', 'RECIPIENTE PARA AGUJA DESCARTABLE', 8, 0, 0, '2025-03-05', 1),
(1360, 'CAVEX-117', 'RECIPIENTE PARA ALGINATO', 30, 0, 0, '2025-03-06', 1),
(1361, 'ANELSAM-116', 'RECORTADORA DE YESO MEXICANA', 450, 0, 0, '2025-03-07', 1),
(1362, 'WHIPMIX-100', 'RECORTADORA DE YESO WHIP MIX', 900, 0, 0, '2025-03-08', 1),
(1363, 'BIOART-124', 'REGLA DE FOX', 25, 0, 0, '2025-03-09', 1),
(1364, 'VALDI-122', 'REGLA MILIMERICA PARA ENDODONCIA DE ANILLO', 3, 0, 0, '2025-03-10', 1),
(1365, 'MAQUIRA-183', 'REGLA MILIMETRICA PARA ENDODNCIA METALICA', 5, 0, 0, '2025-03-11', 1),
(1366, 'VALDI-120', 'REGLA MILIMETRICA PARA ENDODONCIA METALICA', 2.5, 0, 0, '2025-03-12', 1),
(1367, 'VALDI-121', 'REGLA MILIMETRICA PARA ENDODONCIA PLASTICA', 2, 0, 0, '2025-03-13', 1),
(1368, 'ULTRA-114', 'REGLA MILIMETRICA PARA ENDONCIA PLASTICA', 2, 0, 0, '2025-03-14', 1),
(1369, 'BORG-104', 'REGLA TRAZADO CEFALOMETRICO', 35, 0, 0, '2025-03-15', 1),
(1370, 'STEEL-106', 'RELOJ DE MUELA', 10, 0, 0, '2025-03-16', 1),
(1371, 'STEEL-129', 'RELOJ EN FORMA DE MUELA', 25, 0, 0, '2025-03-17', 1),
(1372, 'CAVEX-112', 'RESINA EN JERINGA A1', 20, 0, 0, '2025-03-18', 1),
(1373, 'CAVEX-113', 'RESINA EN JERINGA A2', 20, 0, 0, '2025-03-19', 1),
(1374, 'CAVEX-114', 'RESINA EN JERINGA A3', 20, 0, 0, '2025-03-20', 1),
(1375, 'CAVEX-115', 'RESINA EN JERINGA A3 ,5', 20, 0, 0, '2025-03-21', 1),
(1376, 'CAVEX-116', 'RESINA EN JERINGA A4', 20, 0, 0, '2025-03-22', 1),
(1377, 'MAQUIRA-197', 'RESINA FLUIDA A1', 15, 0, 0, '2025-03-23', 1),
(1378, 'MAQUIRA-224', 'RESINA FLUIDA A2', 15, 0, 0, '2025-03-24', 1),
(1379, 'MAQUIRA-127', 'RESINA FLUIDA A3', 15, 0, 0, '2025-03-25', 1),
(1380, 'MAQUIRA-195', 'RESINA FLUIDA A3', 12, 0, 0, '2025-03-26', 1),
(1381, 'CAVEX-163', 'RESINA FLUIDA CAVEX', 20, 0, 0, '2025-03-27', 1),
(1382, 'ULTRA-217', 'RESINA FORMA', 20, 0, 0, '2025-03-28', 1),
(1383, 'BJM-102', 'RESINA PARA ORTODONCIA HIGHT BOND BANDA', 18, 0, 0, '2025-03-29', 1),
(1384, 'BJM-104', 'RESINA PARA ORTODONCIA HIGHT BOND BRACKET', 25, 0, 0, '2025-03-30', 1),
(1385, 'IVOCLAR-101', 'RESINA PARA ORTODONCIA INDIVIDUAL HELIOSIT', 30, 0.74, 0, '2025-03-31', 1),
(1386, 'BJM-107', 'RESINA PARA ORTODONCIA X 2 JERINGAS KIT', 55, 0, 0, '2025-04-01', 1),
(1387, 'OC-200', 'RESORTE ABIERTO EN ROLLO LIGHT', 25, 0, 0, '2025-04-02', 1),
(1388, 'OC-199', 'RESORTE ABIERTO EN ROLLO MEDIUM', 25, 0, 0, '2025-04-03', 1),
(1389, 'MORELLI-118', 'RESORTE DE NITTI EN ROLLO 0 ,10-0 ,12', 40, 0, 0, '2025-04-04', 1),
(1390, 'BORG-123', 'RESORTE NITI ABIERTO', 39.77, 0, 0, '2025-04-05', 1),
(1391, 'GAC-144', 'RETENEDOR CON MALLA', 9, 0, 0, '2025-04-06', 1),
(1392, 'STEEL-151', 'RETRACTOR DE FOTOGRAFIA NEGRO', 25, 0, 0, '2025-04-07', 1),
(1393, 'AWAN-237', 'RETRACTOR DE MINESOTA AWAN', 10, 0, 0, '2025-04-08', 1),
(1394, 'STEEL-147', 'RETRACTORT FOTO TRASPARENTE X 2 UNID', 12, 0, 0, '2025-04-09', 1),
(1395, 'ANELSAM-144', 'ROJO INGLES', 3, 0, 0, '2025-04-10', 1),
(1396, 'EURONDA-129', 'ROLLOS BOLSAS ESTERELIZAR  , ANCHO: 10 CMX 200 M', 15, 0, 0, '2025-04-11', 1),
(1397, 'EURONDA-145', 'ROLLOS BOLSAS ESTERELIZAR , ANCHO: 190 CM X 330  M', 30, 0, 0, '2025-04-12', 1),
(1398, 'CLEMDE-110', 'RUEDA DE FELPA PARA PARTIAL FLEX', 10, 0, 0, '2025-04-13', 1),
(1399, 'CLEMDE-109', 'RUEDA DE FIELTRO PARA PARTIAL FLEX', 10, 0, 0, '2025-04-14', 1),
(1400, 'WOODPECKER-100', 'SCALER UDS', 400, 0, 0, '2025-04-15', 1),
(1401, 'CLEMDE-124', 'SELLADOR PARA PARTIAL FLEX', 20, 0, 0, '2025-04-16', 1),
(1402, 'BIOART-120', 'SELLADORA DE BOLSA DE ESTERELIZAR', 275, 0, 0, '2025-04-17', 1),
(1403, 'BJM-108', 'SELLANTE DE FOSAS Y FISURAS UN SOLO PASO', 15, 0, 0, '2025-04-18', 1),
(1404, 'GAC-150', 'SEPARADOR DE MOLARES EN BOLSITA', 9, 0, 0, '2025-04-19', 1),
(1405, 'GAC-151', 'SEPARADOR DE MOLARES INDIVIDUAL', 1, 0, 0, '2025-04-20', 1),
(1406, 'ANELSAM-145', 'SEPARADOR DE YESO 1 LITRO', 8, 0, 0, '2025-04-21', 1),
(1407, 'MCD-100', 'SEPARADOR DE YESO 100 ML', 2, 0, 0, '2025-04-22', 1),
(1408, 'BORG-109', 'SEPARADORES DE ORTODONCIA BOLSA X 10', 25, 0, 0, '2025-04-23', 1),
(1409, 'BORG-110', 'SEPARADORES DE ORTODONCIA INDIVIDUAL', 0.7, 0, 0, '2025-04-24', 1),
(1410, 'ANELSAM-239', 'SHUCK DE ALTA', 50, 0, 0, '2025-04-25', 1),
(1411, 'ANELSAM-207', 'SHUCK DE BAJA', 40, 0, 0, '2025-04-26', 1),
(1412, 'ULTRA-167', 'SILANE ULTRADENT', 22.4, 0, 0, '2025-04-27', 1),
(1413, 'MAQUIRA-198', 'SILANO', 12, 0, 0, '2025-04-28', 1),
(1414, 'CAVEX-127', 'SILICONA LIVIANA  INYECTADA CON 6 PUNTAS', 22, 0, 0, '2025-04-29', 1),
(1415, 'CAVEX-118', 'SILICONA PARA REGISTRO DE MORDIDA', 28, 0, 0, '2025-04-30', 1),
(1416, 'CAVEX-126', 'SILICONA PESADA INYECTADA CON 6 PUNTAS', 22, 0, 0, '2025-05-01', 1),
(1417, 'CAVEX-101', 'SILICONA PUTTY', 55, 0, 0, '2025-05-02', 1),
(1418, 'SHERMAX-100', 'SILICONA ZETA  PLUS', 40, 0, 0, '2025-05-03', 1),
(1419, 'OLSEN-108', 'SILLA DE OPERADOR', 150, 0, 0, '2025-05-04', 1),
(1420, 'ANELSAM-206', 'SINFÍN PARA LABORATORIO DERECHO /IZQUIERDO', 7, 0, 0, '2025-05-05', 1),
(1421, 'WOODPECKER-106', 'SISTEMA DE OBTURACION FI G/P', 600, 0, 0, '2025-05-06', 1),
(1422, 'MORELLI-168', 'SOLDADURA DE PLATA EN ROLLO', 30, 0, 0, '2025-05-07', 1),
(1423, 'AWAN-124', 'SONDA DE NABERS', 30, 0, 0, '2025-05-08', 1),
(1424, 'AWAN-219', 'SONDA PERIODONTAL AWAM', 5, 0, 0, '2025-05-09', 1),
(1425, 'PDT-121', 'SONDA PERIODONTAL CAROLINA', 26, 0.68, 0, '2025-05-10', 1),
(1426, 'HUFRI-137', 'SONDA PERIODONTAL CAROLINA DEL NORTE', 30, 0.74, 0, '2025-05-11', 1),
(1427, 'HUFRI-136', 'SONDA PERIODONTAL HUFRIEDY', 30, 0.74, 0, '2025-05-12', 1),
(1428, 'PDT-112', 'SONDA PERIODONTAL WILLIANS', 26, 0.68, 0, '2025-05-13', 1),
(1429, 'CLEMDE-125', 'SOPLETE PARA PARTIAL FLEX', 140, 0, 0, '2025-05-14', 1),
(1430, 'BIOART-132', 'SOPORTE DE TENEDOR', 20, 0, 0, '2025-05-15', 1),
(1431, 'AWAN-244', 'SUCCIÓN DE ENDODONCIA AWAM 3 PUNTASL', 20, 0, 0, '2025-05-16', 1),
(1432, 'MORELLI-167', 'SUCCION ENDODONCIA MORELLI', 10, 0, 0, '2025-05-17', 1),
(1433, 'SIRI-103', 'SUCCIONES TRES MAS UNO', 13.5, 0, 0, '2025-05-18', 1),
(1434, 'VIPI-8975', 'TABLETA DE DIENTE TRES CAPA', 3.5, 0, 0, '2025-05-19', 1),
(1435, 'VIPI-104', 'TABLETA DE DIENTES', 1.2, 0, 0, '2025-05-20', 1),
(1436, 'VIPI-116', 'TABLETA DE MUELA', 1.2, 0, 0, '2025-05-21', 1),
(1437, 'VIPI-101', 'TABLETAS DE DIENTES VIPIDENT X CAJA', 15.4, 0, 0, '2025-05-22', 1),
(1438, 'VIPI-102', 'TABLETAS DE MUELA  VIPIDENT X CAJA', 11, 0, 0, '2025-05-23', 1),
(1439, 'VIARDENT-100', 'TABLETAS REVELADORAS', 1, 0, 0, '2025-05-24', 1),
(1440, 'AWAN-191', 'TALLADOR DE FRANK', 5, 0, 0, '2025-05-25', 1),
(1441, 'HUFRI-138', 'TALLADOR DE FRANK', 30, 0.74, 0, '2025-05-26', 1),
(1442, 'CAVEX-135', 'TAZA DE HULE CAVEX', 5, 0, 0, '2025-05-27', 1),
(1443, 'MAQUIRA-160', 'TAZA DE HULE GRANDE', 4, 0, 0, '2025-05-28', 1),
(1444, 'MAQUIRA-192', 'TAZA DE HULE MEDIANA', 3, 0, 0, '2025-05-29', 1),
(1445, 'MAQUIRA-177', 'TAZA DE HULE PEQUEÑA', 2, 0, 0, '2025-05-30', 1),
(1446, 'MAQUIRA-218', 'TAZA DE HULE PEQUEÑA', 2, 0, 0, '2025-05-31', 1),
(1447, 'AWAN-194', 'TIJERA CURVA AWAN', 4, 0, 0, '2025-06-01', 1),
(1448, 'ULTRA-190', 'TIJERA DE TEJIDOS  (ULTRA-TRIM)', 44.7, 0, 0, '2025-06-02', 1),
(1449, 'AWAN-129', 'TIJERA DE TEJIDOS BLANDOS AWAN', 5, 0, 0, '2025-06-03', 1),
(1450, 'BORG-121', 'TIJERA PARA CORTAR METAL', 10, 0, 0, '2025-06-04', 1),
(1451, 'AWAN-193', 'TIJERA RECTA AWAN', 4, 0, 0, '2025-06-05', 1),
(1452, 'ULTRA-121', 'TIP MICRO X 10 PUNTA DISPENSADORA PARA ADHESIVO', 6, 0, 0, '2025-06-06', 1),
(1453, 'ULTRA-122', 'TIP MICRO X 100 PUNTA DISPENSADORA PARA ADHESIVO', 50.04, 0, 0, '2025-06-07', 1),
(1454, 'OC-108', 'TIPODONTO CON BRACKET EVECLEAR OC', 220, 0, 0, '2025-06-08', 1),
(1455, 'OC-110', 'TIPODONTO CON BRACKET HYPE OC', 140, 0, 0, '2025-06-09', 1),
(1456, 'OC-109', 'TIPODONTO CON BRACKET ROTH  OC', 140, 0, 0, '2025-06-10', 1),
(1457, 'ANELSAM-173', 'TIPODONTO DE ADULTOS', 10, 0, 0, '2025-06-11', 1),
(1458, 'TOPSMILE-101', 'TIPODONTO DE ENCIA BLANDA', 75, 0, 0, '2025-06-12', 1),
(1459, 'ANELSAM-172', 'TIPODONTO DE NIÑOS', 10, 0, 0, '2025-06-13', 1),
(1460, 'ANELSAM-121', 'TIPODONTO EDUCATIVO GRANDE', 50, 0, 0, '2025-06-14', 1),
(1461, 'MAQUIRA-161', 'TIRA ABRASIVA  ACERO', 8, 0, 0, '2025-06-15', 1),
(1462, 'MAQUIRA-162', 'TIRA POLIESTER', 8, 0, 0, '2025-06-16', 1),
(1463, 'MA-32-020-01', 'TIRAPUENTE', 12, 0, 0, '2025-06-17', 1),
(1464, 'NACIONAL-100', 'TOALLAS DE MANO BORDADAS', 5, 0, 0, '2025-06-18', 1),
(1465, 'ANELSAM-117', 'TOLVA', 40, 0, 0, '2025-06-19', 1),
(1466, 'RAX110', 'TOMOGRAFIA ATM CON LECTURA', 140, 0, 0, '2025-06-20', 1),
(1467, 'RAX111', 'TOMOGRAFIA ATM SIN LECTURA', 80, 0, 0, '2025-06-21', 1),
(1468, 'RAX115', 'TOMOGRAFIA MAXILAR INFERIOR CON LECTURA', 100, 0, 0, '2025-06-22', 1),
(1469, 'RAX114', 'TOMOGRAFIA MAXILAR INFERIOR SIN LECTURA', 60, 0, 0, '2025-06-23', 1),
(1470, 'RAX', 'TOMOGRAFIA MAXILAR SUPERIOR', 100, 0, 0, '2025-06-24', 1),
(1471, 'RAX113', 'TOMOGRAFIA MAXILAR SUPERIOR CON LECTURA', 100, 0, 0, '2025-06-25', 1),
(1472, 'RAX112', 'TOMOGRAFIA MAXILAR SUPERIOR SIN LECTURA', 60, 0, 0, '2025-06-26', 1),
(1473, 'RAX109', 'TOMOGRAFIA SENO MAXILAR CON LECTURA', 100, 0, 0, '2025-06-27', 1),
(1474, 'RAX108', 'TOMOGRAFIA SENO MAXILAR SIN LECTURA', 60, 0, 0, '2025-06-28', 1),
(1475, 'STEEL-121', 'TOPE DE ENDODONCIA', 6, 0, 0, '2025-06-29', 1),
(1476, 'BORG-106', 'TORNILLO DE ABANICO', 25, 0, 0, '2025-06-30', 1),
(1477, 'GAC-145', 'TORNILLO DE ABANICO', 25, 0, 0, '2025-07-01', 1),
(1478, 'GAC-136', 'TORNILLO HYRAX  9/13 MM GAC', 25, 0, 0, '2025-07-02', 1),
(1479, 'MORELLI-184', 'TORNILLO HYRAX 7-9-11-13 MM', 25, 0, 0, '2025-07-03', 1),
(1480, 'BORG-105', 'TORNILLO HYRAX LEONE', 25, 0, 0, '2025-07-04', 1),
(1481, 'GAC-137', 'TORNILLOS ACODADO ORTODONCIA GAC', 30, 0, 0, '2025-07-05', 1),
(1482, 'MORELLI-187', 'TORNILLOS DE EXPANSION ROSADO', 4, 0, 0, '2025-07-06', 1),
(1483, 'MORELLI-236', 'TORRE AZUL MORELLI', 40, 0, 0, '2025-07-07', 1),
(1484, 'OC-185', 'TUBO DE CEMENTADO DIRECTO LL(5 UNID) OC', 8, 0, 0, '2025-07-08', 1),
(1485, 'OC-186', 'TUBO DE CEMENTADO DIRECTO LR(5 UNID) OC', 8, 0, 0, '2025-07-09', 1),
(1486, 'AHKIMP-111', 'TUBO DE CEMENTADO DIRECTO POR 4 UNIDS AKP', 12, 0, 0, '2025-07-10', 1),
(1487, 'OC-183', 'TUBO DE CEMENTADO DIRECTO UL(5 UNID) OC', 8, 0, 0, '2025-07-11', 1),
(1488, 'BORG-111', 'TUBO DE CEMENTADO DIRECTO UNID BORGATTA', 4, 0, 0, '2025-07-12', 1),
(1489, 'MORELLI-190', 'TUBO DE CEMENTADO DIRECTO UNID MORRELLI', 2, 0, 0, '2025-07-13', 1),
(1490, 'OC-184', 'TUBO DE CEMENTADO DIRECTO UR(5 UNID) OC', 8, 0, 0, '2025-07-14', 1),
(1491, 'MORELLI-117', 'TUBO DE PROTECCIÓN PLASTICA', 10, 0, 0, '2025-07-15', 1),
(1492, 'ANELSAM-273', 'TUBOS DE ALUMINIO PARA PARTIAL FLEX', 1.5, 0, 0, '2025-07-16', 1),
(1493, 'DENFLEX-110', 'TURBINA CON SACA FRESA', 160, 0, 0, '2025-07-17', 1),
(1494, 'MEDID-104', 'TURBINA MEDIDENTAL', 50, 0, 0, '2025-07-18', 1),
(1495, 'ULTRA-182', 'ULTRA ETCH ACIDO GRABADOR 30 ML REFILL', 43, 0, 0, '2025-07-19', 1),
(1496, 'ULTRA-136', 'ULTRABLEND MINI KIT FORRO CAVITARIO LINER X 2', 36, 0, 0, '2025-07-20', 1),
(1497, 'ULTRA-131', 'ULTRACAL XS MINI KIT X 2', 24.9, 0, 0, '2025-07-21', 1),
(1498, 'ULTRA-140', 'ULTRACEM BOTTLES KIT  IONÓMERO', 122.5, 0, 0, '2025-07-22', 1),
(1499, 'ULTRA-218', 'ULTRAETCH X JERINGAS DE 1.2 ML C/U', 6, 0, 0, '2025-07-23', 1),
(1500, 'ULTRA-126', 'ULTRAPACK 0', 15.5, 0, 0, '2025-07-24', 1),
(1501, 'ULTRA-124', 'ULTRAPACK 00', 15.5, 0, 0, '2025-07-25', 1),
(1502, 'ULTRA-123', 'ULTRAPACK 000', 15.5, 0, 0, '2025-07-26', 1),
(1503, 'ULTRA-125', 'ULTRAPACK 1', 15.5, 0, 0, '2025-07-27', 1),
(1504, 'ULTRA-139', 'ULTRAPACK IMPREGNADO 0', 17.04, 0, 0, '2025-07-28', 1),
(1505, 'ULTRA-134', 'ULTRAPACK IMPREGNADO 00', 17.04, 0, 0, '2025-07-29', 1),
(1506, 'ULTRA-205', 'ULTRASEAL KIT PLUS', 81.58, 0, 0, '2025-07-30', 1),
(1507, 'ULTRA-170', 'ULTRASEAL XT HIDRO INDIVIDUAL (SELLANTE DE FOSA Y FISURA)', 25, 0, 0, '2025-07-31', 1),
(1508, 'ULTRA-146', 'ULTRATEM CEMENTO TEMPORAL', 60.02, 0, 0, '2025-08-01', 1),
(1509, 'OLSEN-103', 'UNIDAD DENTAL QUALITY', 3200, 0, 0, '2025-08-02', 1),
(1510, 'OLSEN-104', 'UNIDAD DENTAL QUALITY FLEX', 3700, 0, 0, '2025-08-03', 1),
(1511, 'OLSEN-106', 'UNIDAD DENTAL SPRINT', 3000, 0, 0, '2025-08-04', 1),
(1512, 'OLSEN-101', 'UNIDAD PARA OTORRINO Y RADIOLOGIA', 1000, 0, 0, '2025-08-05', 1),
(1513, 'ULTRA-208', 'UVEENER', 897.58, 0, 0, '2025-08-06', 1),
(1514, 'BIOART-121', 'VACUUM BIO ART', 400, 0, 0, '2025-08-07', 1),
(1515, 'ANELSAM-127', 'VALVULA DE AGUA', 15, 0, 0, '2025-08-08', 1),
(1516, 'ANELSAM-122', 'VALVULA DE DOS VIAS', 15, 0, 0, '2025-08-09', 1),
(1517, 'ANELSAM-128', 'VALVULA DE SUCCIÓN', 17, 0, 0, '2025-08-10', 1),
(1518, 'CARMEN-103', 'VASELINA', 1.3, 0, 0, '2025-08-11', 1),
(1519, 'ANELSAM-245', 'VASO PARA ESTERILIZAR LIMA', 3, 0, 0, '2025-08-12', 1),
(1520, 'ANELSAM-246', 'VASOS DESCARTABLES X 100', 3.5, 0, 0, '2025-08-13', 1),
(1521, 'EURONDA-139', 'VASOS EURONDA ANARANJADO', 3.5, 0, 0, '2025-08-14', 1),
(1522, 'EURONDA-142', 'VASOS EURONDA AZUL', 3.5, 0, 0, '2025-08-15', 1),
(1523, 'EURONDA-137', 'VASOS EURONDA MORADOS', 3.5, 0, 0, '2025-08-16', 1),
(1524, 'EURONDA-138', 'VASOS EURONDA NEGROS', 3.5, 0, 0, '2025-08-17', 1),
(1525, 'EURONDA-140', 'VASOS EURONDA ROJO', 3.5, 0, 0, '2025-08-18', 1),
(1526, 'EURONDA-141', 'VASOS EURONDA ROSA', 3.5, 0, 0, '2025-08-19', 1),
(1527, 'EURONDA-144', 'VASOS EURONDA VERDE', 3.5, 0, 0, '2025-08-20', 1),
(1528, 'ANELSAM-118', 'VIBRADOR DE YESO', 70, 0, 0, '2025-08-21', 1),
(1529, 'ULTRA-130', 'VICOSTAT  FERRO MINI KIT', 11.5, 0, 0, '2025-08-22', 1),
(1530, 'ULTRA-186', 'VICOSTAT  REFILL', 41.7, 0, 0, '2025-08-23', 1),
(1531, 'ULTRA-185', 'VICOSTAT CLEAR  DENTO INFUSOR KIT X JERINGAS', 34.8, 0, 0, '2025-08-24', 1),
(1532, 'ULTRA-184', 'VICOSTAT CLEAR MINI KIT', 10, 0, 0, '2025-08-25', 1),
(1533, 'MAQUIRA-207', 'VISUCAIRE LIQUIDO', 5, 0, 0, '2025-08-26', 1),
(1534, 'MAQUIRA-217', 'VISUPLAC LIQUIDO', 5, 0, 0, '2025-08-27', 1),
(1535, 'RAX118', 'VTO', 10, 0, 0, '2025-08-28', 1),
(1536, 'AWAN-238', 'WESCOTT AWAN', 2.8, 0, 0, '2025-08-29', 1),
(1537, 'ULTRA-173', 'WETTING HUMECTANTE DE RESINA CAJA X 2', 46, 0, 0, '2025-08-30', 1),
(1538, 'ULTRA-178', 'WETTING HUMECTANTE DE RESINA UNIDAD', 42, 0, 0, '2025-08-31', 1),
(1539, 'WHIPMIX-110', 'YESO DE ORTODONCIA', 3, 0, 0, '2025-09-01', 1),
(1540, 'VALDI-200', 'YESO PARIS  1 KG VALDI', 1.5, 0, 0, '2025-09-02', 1),
(1541, 'VALDI-201', 'YESO PARIS 5 KG VALDI', 6, 0, 0, '2025-09-03', 1),
(1542, 'WHIPMIX-106', 'YESO PIEDRA TIPO III  WHIP MIX', 2.7, 0, 0, '2025-09-04', 1),
(1543, 'WHIPMIX-109', 'YESO TIPO IV EXTRADURO', 3.2, 0, 0, '2025-09-05', 1),
(1544, 'STEEL-118', 'ZOCALOS FLEXIBLES DE COLORES', 6, 0, 0, '2025-09-06', 1),
(1545, 'ANELSAM-167', 'ZOCALOS FLEXIBLES NEGROS', 5, 0, 0, '2025-09-07', 1),
(1546, 'ANELSAM-223', 'ZOCALOS RIGIDOS', 5, 0, 0, '2025-09-08', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `radiografia_conteo`
--

CREATE TABLE `radiografia_conteo` (
  `indconteo` int(11) NOT NULL,
  `indcliente` int(11) DEFAULT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `indsucursal` int(11) DEFAULT NULL,
  `indtemp` varchar(100) DEFAULT NULL,
  `factura` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `radiografia_conteo`
--

INSERT INTO `radiografia_conteo` (`indconteo`, `indcliente`, `nombre_completo`, `indsucursal`, `indtemp`, `factura`, `fecha`, `hora`) VALUES
(1, 12, 'aSFddassadas\r\nasdasdasdas', 7, 'temp', 2115525225, '2021-07-19', '34:30:14'),
(2, 3, '. GAITAN FUENTES', 1, 'soqb83v4unyjt4prz9zk2wwhaq0835iu7t1fhyfk3gz7xeqju7utbz22ah4l73i3ce2o1sfiiu6y72uvnudg5y966pb8m443trp3', 0, '2021-07-19', '07:36:19'),
(3, 0, 'EMILIO ANTONIO FUENTES', 1, 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u', 0, '2021-08-06', '07:31:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `indsucursal` int(11) NOT NULL,
  `nombre_sucursal` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `celular` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`indsucursal`, `nombre_sucursal`, `direccion`, `telefono`, `celular`) VALUES
(1, 'Managua', 'Calle principal Altamira Sinsa Cerámica 1c. al Sur', '2220-6871 • 2277-0288', '8465-5339'),
(2, 'Masaya', 'Costado Sur Parque San Jeronimo', '2522-0392', '2522-0392'),
(3, 'Juigalpa', 'Claro 1 1/2 al sur, Plaza Tifernandez', '25122151', '86601837'),
(4, 'Chinandega', 'Gasolinera Puma El Calvario 1 1/2c', '2340-1844', '2340-1844'),
(5, 'Leon', 'Iglesia Recolección 1c. Norte 1/2c. Oeste, Plaza S', ' 2310-0984', ' 2310-0984'),
(6, 'Esteli', 'Esquina Sur Oeste Parque Central 1/2c. al Oeste. P', '2713-3163', '2713-3163'),
(7, 'Bolonia', 'Òptica Nicaraguense 1 1/2 arriba Plaza Comercial e', '2254-4821', '2254-4821'),
(8, 'Villa Fontana', 'Plaza Porta\'s Segunda planta Modulo #18', '2278-2217', '57158252'),
(9, 'Matagalpa', 'Centro Comercial Catalina,Modulo 8,Calle de los ba', '2772-3866', '2772-3866');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talonario`
--

CREATE TABLE `talonario` (
  `indtalonario` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `indsucursal` int(11) DEFAULT NULL,
  `indtemp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `talonario`
--

INSERT INTO `talonario` (`indtalonario`, `numero`, `indsucursal`, `indtemp`) VALUES
(1, 918, 1, ''),
(234, 23, 6, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasa`
--

CREATE TABLE `tasa` (
  `indcambio` int(11) NOT NULL,
  `dolar` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tasa`
--

INSERT INTO `tasa` (`indcambio`, `dolar`) VALUES
(1, 35.25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `total_factura`
--

CREATE TABLE `total_factura` (
  `indtotalfactura` int(11) NOT NULL,
  `indcliente` int(11) DEFAULT NULL,
  `indsucursal` int(11) NOT NULL,
  `indtalonario` int(11) DEFAULT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `cordoba_pago` double DEFAULT NULL,
  `dolare_pago` double DEFAULT NULL,
  `cordoba` int(11) NOT NULL,
  `dolar` int(11) NOT NULL,
  `efectivo` int(11) DEFAULT NULL,
  `credito` int(11) DEFAULT NULL,
  `trasferencia` int(11) DEFAULT NULL,
  `targeta` int(11) DEFAULT NULL,
  `bac` int(11) DEFAULT NULL,
  `lafise` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `indtemp` varchar(150) NOT NULL,
  `bandera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `total_factura`
--

INSERT INTO `total_factura` (`indtotalfactura`, `indcliente`, `indsucursal`, `indtalonario`, `subtotal`, `total`, `cordoba_pago`, `dolare_pago`, `cordoba`, `dolar`, `efectivo`, `credito`, `trasferencia`, `targeta`, `bac`, `lafise`, `fecha`, `hora`, `indtemp`, `bandera`) VALUES
(3, 3, 1, 89, 2115, 2040.98, 2, 2, 0, 0, 1, 0, 0, 0, 0, 0, '2021-05-20', '08:27:22', 'ihoxhtcjt3tykc22rmzrwrri1q17dpdn93qyy4v92hl0k56rx5fucaw2xl6tzdvalgmhnvgba7q2jlcuv7jhklpfy6wmk8ix9nl4', 0),
(4, 3, 1, 6, 2115, 2009.25, 45645, 50, 1, 1, 1, 0, 1, 0, 0, 0, '2021-05-20', '03:38:39', 'd2w1ir24mhnmy4rxm19sj7agydzxjvah34nu885wu9hgruoioeke93wk2wh2og25d031nnismw7mgx86ldrkcklvin97162koj9g', 0),
(5, 3, 1, 5, 1092.75, 1037.76, 456, 45645, 1, 1, 1, 0, 0, 1, 0, 0, '2021-05-20', '03:41:05', 'quy8aiptcbw93jndt7vfcxnd19lkl4hz6yzlse503oo933wrxvm1ompwuf9kcw49icll6b7e6dyz3ezotyc6qra92vwdz6g3nohs', 0),
(6, 3, 1, 799, 18788.25, 18763.93, 55, 66, 1, 1, 1, 0, 0, 1, 0, 0, '2021-05-20', '09:56:49', '4i8gav1hypsmze0wkodbwr4sepf3em4nro2jdjlxagr84s381t6tetmbndh0by9wfcj7o3jjgz1jyn0ccsx49itfgqnk3qkycirj', 0),
(7, 3, 1, 4569, 10575, 10543.28, 3493.23, 200, 1, 1, 1, 0, 0, 0, 0, 0, '2021-05-23', '12:36:51', '51af1l3te44pwxo1yb5ui0tyev9zpsnyw2h2756wp1tob6gd2uqss3437vwnfgzvn4ldx8kfepvnmvd4l0e7hizar8q811ukuwx8', 0),
(8, 3, 1, 4568, 28658.25, 28658.25, 33, 525, 1, 1, 1, 0, 0, 0, 0, 0, '2021-05-23', '07:59:47', '4jzsx6s4bo0oqq66nmwho5q31wka6x9gd2se8wwurje6o2akg5q6n13vzvm2osdyxfwhgv7f0gcsw9exzskk26iu3ace2s0h3amn', 0),
(9, 3, 1, 4570, 9870, 9870, 0, 33, 1, 1, 1, 0, 1, 1, 1, 1, '2021-06-16', '09:46:46', 'wjgsla4zaoi6lmnqx5cbdr7ebs2tk576ppj35p53ete60q759omqyavimpyz5wiwu0p4lzja9hjehyt7hvbtfwdpx7qmob5zzcfr', 1),
(10, 3, 1, NULL, 211.5, 211.5, 0, 33, 0, 0, 1, 1, 0, 0, 0, 0, '2021-06-16', '11:33:05', 'q5l0zotx6hvfc6xog45rpt6f6zxdsk75qextps2n384lxnanxvl4qx7ny9rtiqlfe2af2uohdu1dph7jr88kz4amn7gy5cpjel2p', 1),
(11, 3, 1, 910, 1533.38, 1508, 33, 55, 0, 0, 1, 1, 0, 0, 0, 0, '2021-07-07', '08:36:35', 'jcomylv6h985db5l8g78yh6sdixl7lxx13vofypvza13rap7mpms13v2x6q3g285ichikj947cmesc850kf1gzmhjoecv9mv2rzk', 1),
(12, 3, 1, 909, 211.5, 211.5, 33, 33, 0, 0, 1, 0, 0, 0, 0, 0, '2021-07-07', '09:01:33', 'kyf7tafu0dx64uq7kzskievmzmwognzf0nx5lf9ti0vkiceh8gxqjmye5lvkffsaupqu4z15t2ngxiw62gzvxgq91swto0k2zhky', 0),
(13, 3, 1, 905, 1410, 1410, 21, 12, 0, 0, 1, 1, 0, 0, 0, 0, '2021-07-07', '09:02:17', '6nm7mxqsfapeimg66krwh8lttvphh90biwkp67kax4zjihyktbpbog6i2lbvoqnxw0m1y7sijxceaayfignf7fvxiuzakcpeto0k', 1),
(14, 13, 1, 801, 1163.25, 1144.22, 12, 10, 0, 0, 1, 0, 0, 0, 0, 0, '2021-07-10', '11:55:02', 'mpha3y7fdekgkpsk5coseuklhwv58j1pls994r2wt7b893hwoxtrautmxymzcmv68l1xicnfrfc3c0c87ad1127zrwqqpk0lmwbh', 0),
(15, 13, 1, 800, 687.38, 687.38, 0, 2, 0, 0, 1, 1, 0, 0, 0, 0, '2021-07-10', '11:56:54', 'ncuk1douryeiygchazamfgfchzbzpmu9di928r0dxv057b4uqtoxxlnluxjge76vyydrqtysy1yo1jijtj3mmpua5d1l2m879r4b', 0),
(16, 3, 1, 802, 705, 705, 0, 44, 0, 0, 1, 0, 0, 0, 0, 0, '2021-07-10', '12:04:28', 'bd0y5h6shfxdocbwpfdfivnas4qtu3xk917auiwfh37vcwznp4sq8xa58eiydwa42fvrwdqp8k9wpsclop24woq9j6lkkwafyymg', 0),
(17, 3, 1, 803, 564, 564, 0, 22, 0, 0, 1, 0, 0, 0, 0, 0, '2021-07-12', '10:31:24', 'bldk04ug2z0s2wfi135ty8f7bqhl0n1l17igjg2d06zy4dzewzby00htqtuypn4v85611oxa9k0cn114hlap10z7gz81ikmjrovo', 1),
(18, 3, 1, 900, 475.88, 475.88, 0, 10, 0, 0, 1, 0, 0, 0, 0, 0, '2021-07-12', '11:17:28', 'bq8kqxbm4lcvmh3j3nespor6ce8wodqhg1rg38usv6fsrikef8xts0yyvcobxs0p986n99dju8fkgm9uz8qrtzioic3quoylvjjh', 1),
(19, 17, 1, 901, 1410, 1410, 0, 40, 0, 1, 1, 0, 0, 0, 0, 0, '2021-07-12', '09:46:05', '1y6fj38yhlihosi86mkbsfty5hk8xocpyh302qou4mkecabn18i800m1e85nv5zli8m9r81xomjwg9ffer5a797m0b8crv0bbq8t', 1),
(20, 3, 1, NULL, 705, 705, 0, 20, 0, 1, 1, 0, 0, 0, 0, 0, '2021-07-12', '09:49:16', 'i9ys96fclrubrkehbzk8vpav830ns3pqjxazzk07pin5wgt84jke5ocn1bz0tzxb27lp77hl0ustfgg06fy8lir342ar5deokvet', 1),
(21, 3, 1, 902, 757.88, 757.88, 0, 21.5, 0, 1, 1, 0, 0, 0, 0, 0, '2021-07-12', '09:51:56', '4lyndf6yjr8vmrmubaonzoa3nl9xbis2k42vg3jhsbeus0yp0b8g4lk28go99n49rlvqqahqnmtl79cr6fbvbm2mofydx4xhcu1r', 1),
(22, 3, 1, NULL, 211.5, 211.5, 0, 6, 0, 1, 1, 0, 0, 0, 0, 0, '2021-07-12', '10:05:35', 'yoais7bbvxqk3cr1b3uygez7m7no9ohckwjuoijew6y8yktkzscq8862a5t5fkg1673jmceya38q3xlw1acywkxvsi246m2latpv', 1),
(23, 3, 1, NULL, 211.5, 211.5, 0, 6, 1, 1, 1, 0, 0, 0, 0, 0, '2021-07-12', '10:06:07', '3l17trcgre75goqcmfdz9rkj29f6hedh4wrag9qq07zcu961pcvvo0utpvwrktixjzh3hkiuqwndlnlmpcpk00ivla5xv8rdhodn', 1),
(24, 3, 1, NULL, 52.88, 52.88, 0, 1.5, 1, 1, 1, 0, 0, 0, 0, 0, '2021-07-12', '10:08:54', '60usje7hn3l9dxso2fhcpsbgsbxysr3xg28l0e3tv8hfwkn2bi5w12ttl3ixs1xja3829wddw98phzjcroq0ega3880ea3pi2es8', 1),
(25, 3, 1, 903, 211.5, 211.5, 0, 6, 1, 1, 1, 0, 0, 0, 0, 0, '2021-07-12', '10:09:20', '2xnalx01d93il65qpul36myy84aknzi6svq8zsjnly415l97gtzhv48cknyt9m3frjimljy9imnxs6todg9g001idjeae6ayrzg8', 1),
(26, 18, 1, 904, 1075.13, 1075.13, 0, 33, 0, 0, 1, 0, 0, 0, 0, 0, '2021-07-18', '08:05:47', 'ri5e61bnr2x4ddkryd528fwek03qjmdhymhi1bove3q53kkusyw1g5ccvtq06hj34yp9fig1xgdrjerznie07owqc5mxnf39zjmt', 1),
(27, 3, 1, 906, 828.38, 817.8, 0, 33, 0, 0, 1, 0, 0, 0, 0, 0, '2021-07-19', '10:13:28', 'gc8x4nb234hj4k8p9369pyeql9seious45hz97eev9bf3gxhr9g6uywk5g4hsnt1bkj11rbd92jz1od9lmoep7ey5nnhnyhtz8j8', 0),
(28, 3, 1, 907, 423, 423, 0, 33, 0, 0, 1, 0, 0, 0, 0, 0, '2021-07-19', '05:57:46', 'usf4z3cfcsydsbmymzikod5nrbsyd0iuzyitydhnt4p5xg4ba8vd44khiomw37esszmyl8tzto9q4aa7qztee14kjhuk5y4mb4ui', 1),
(29, 20, 1, 908, 705, 705, 0, 33, 0, 0, 1, 0, 0, 0, 0, 0, '2021-07-19', '07:36:19', 'soqb83v4unyjt4prz9zk2wwhaq0835iu7t1fhyfk3gz7xeqju7utbz22ah4l73i3ce2o1sfiiu6y72uvnudg5y966pb8m443trp3', 1),
(33, 3, 1, 913, 211.5, 211.5, 33, 33, 1, 1, 1, 1, 1, 1, 1, 1, '2021-08-06', '07:31:33', 'rj2x3lzh6col648ynzwb46pplwpip7uix1jbx1zj19ofix4img6zws0i6g3ha0wi11tiav4a25imx9lrno95xg3rj02de3xftc5u', 1),
(34, 3, 1, 914, 211.5, 211.5, 22, 0, 0, 0, 1, 0, 0, 0, 0, 0, '2021-08-09', '09:52:32', 'vs1za2xj4e3xv4c4tedrac920vllskewvz12rxw68sl7h05dschwdh4whm0njl975ke5i053ifgf76w62m4e33jzgcx6adkdqjgl', 0),
(35, 3, 1, 915, 1533.38, 1533.38, 0, 2332, 0, 0, 1, 0, 0, 0, 0, 0, '2021-08-09', '10:01:21', 'ixlqbacd8mld6yb191cann3lypbcez6zqef3nwve43xz6qt85gpdgxcfs3t55hbjs3hu2zerg30ll08h8amz8g9eq7gb86lqeho9', 1),
(36, 17, 1, 916, 352.5, 352.5, 0, 22, 0, 0, 1, 0, 0, 0, 0, 0, '2021-08-09', '10:02:17', 'yk70qfzatlp5hp2vyb0qg29msjkpuav3i8y6rfq3e11hykshplt74z30u06swqv7bpnp3l7fd9nx5jx0g8k59zskp7ps9rzxgrq1', 1),
(37, 3, 1, 917, 4935, 4935, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, '2021-08-09', '12:01:13', 'v5woisuk60tll7ysfxmef0ae4f75991b0p2jej3oz7kvihnl2467wvlt9wpku6gavgotcl6vyrbal9rrisjnfkniq4a4dr6ak6le', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`indcliente`),
  ADD KEY `indsucursal` (`indsucursal`);

--
-- Indices de la tabla `control`
--
ALTER TABLE `control`
  ADD PRIMARY KEY (`indcontrol`),
  ADD KEY `sucursal` (`indsucursal`);

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
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`indempleado`),
  ADD KEY `indsucursal` (`indsucursal`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`indfactura`),
  ADD KEY `indcliente` (`indcliente`),
  ADD KEY `indsucursal` (`indsucursal`);

--
-- Indices de la tabla `historial_acceso`
--
ALTER TABLE `historial_acceso`
  ADD PRIMARY KEY (`indacceso`),
  ADD KEY `indsucursal` (`indsucursal`),
  ADD KEY `indempleado` (`indempleado`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`indproducto`);

--
-- Indices de la tabla `radiografia_conteo`
--
ALTER TABLE `radiografia_conteo`
  ADD PRIMARY KEY (`indconteo`),
  ADD KEY `indcliente` (`indcliente`),
  ADD KEY `indsucursal` (`indsucursal`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`indsucursal`);

--
-- Indices de la tabla `talonario`
--
ALTER TABLE `talonario`
  ADD PRIMARY KEY (`indtalonario`),
  ADD KEY `indsucursal` (`indsucursal`);

--
-- Indices de la tabla `tasa`
--
ALTER TABLE `tasa`
  ADD PRIMARY KEY (`indcambio`);

--
-- Indices de la tabla `total_factura`
--
ALTER TABLE `total_factura`
  ADD PRIMARY KEY (`indtotalfactura`),
  ADD UNIQUE KEY `indtalonario` (`indtalonario`),
  ADD KEY `indcliente` (`indcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `indcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `control`
--
ALTER TABLE `control`
  MODIFY `indcontrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `indcredito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `creditos_pago`
--
ALTER TABLE `creditos_pago`
  MODIFY `indpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `indempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `indfactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `historial_acceso`
--
ALTER TABLE `historial_acceso`
  MODIFY `indacceso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `indproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1552;

--
-- AUTO_INCREMENT de la tabla `radiografia_conteo`
--
ALTER TABLE `radiografia_conteo`
  MODIFY `indconteo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `indsucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `talonario`
--
ALTER TABLE `talonario`
  MODIFY `indtalonario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT de la tabla `tasa`
--
ALTER TABLE `tasa`
  MODIFY `indcambio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `total_factura`
--
ALTER TABLE `total_factura`
  MODIFY `indtotalfactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`indsucursal`) REFERENCES `sucursal` (`indsucursal`);

--
-- Filtros para la tabla `control`
--
ALTER TABLE `control`
  ADD CONSTRAINT `sucursal` FOREIGN KEY (`indsucursal`) REFERENCES `sucursal` (`indsucursal`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`indsucursal`) REFERENCES `sucursal` (`indsucursal`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`indcliente`) REFERENCES `clientes` (`indcliente`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`indsucursal`) REFERENCES `sucursal` (`indsucursal`);

--
-- Filtros para la tabla `historial_acceso`
--
ALTER TABLE `historial_acceso`
  ADD CONSTRAINT `historial_acceso_ibfk_1` FOREIGN KEY (`indsucursal`) REFERENCES `sucursal` (`indsucursal`),
  ADD CONSTRAINT `historial_acceso_ibfk_2` FOREIGN KEY (`indempleado`) REFERENCES `empleado` (`indempleado`);

--
-- Filtros para la tabla `radiografia_conteo`
--
ALTER TABLE `radiografia_conteo`
  ADD CONSTRAINT `radiografia_conteo_ibfk_1` FOREIGN KEY (`indcliente`) REFERENCES `clientes` (`indcliente`),
  ADD CONSTRAINT `radiografia_conteo_ibfk_2` FOREIGN KEY (`indsucursal`) REFERENCES `sucursal` (`indsucursal`);

--
-- Filtros para la tabla `talonario`
--
ALTER TABLE `talonario`
  ADD CONSTRAINT `talonario_ibfk_1` FOREIGN KEY (`indsucursal`) REFERENCES `sucursal` (`indsucursal`);

--
-- Filtros para la tabla `total_factura`
--
ALTER TABLE `total_factura`
  ADD CONSTRAINT `total_factura_ibfk_1` FOREIGN KEY (`indcliente`) REFERENCES `clientes` (`indcliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
