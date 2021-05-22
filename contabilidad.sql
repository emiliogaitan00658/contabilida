-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2021 a las 16:28:24
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.4.19

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
(12, 'EMILIO ANTONIO', 'GAITAN FUENTES', 'LEóN NICARAGUA', '', '401-04071997-0007J', '77231730', 1, 1);

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
(2, 'asd', 'sad', 'e', 'e', 6);

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
(15, 799, 'ANELSAM-131', 'BLANCO ESPAÑA', 1, 105.75, 105.75, 35.25, 3, 102.5775, 0, 3, 1, 0, '4i8gav1hypsmze0wkodbwr4sepf3em4nro2jdjlxagr84s381t6tetmbndh0by9wfcj7o3jjgz1jyn0ccsx49itfgqnk3qkycirj');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `indproducto` int(11) NOT NULL,
  `codigo_producto` varchar(50) NOT NULL,
  `nombre_producto` varchar(50) DEFAULT NULL,
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
(3, 'ABADENT-100', 'METAL VERABOND CAJA I KG', 220, 0, 0, '2021-04-04', 1),
(4, 'ABADENT-101', 'METAL VERABOND X UNIDAD', 1.25, 1.1, 0, '2021-04-05', 1),
(5, 'ABADENT-102', 'METAL VERASOT X UNIDAD', 1.25, 0, 0, '2021-04-06', 1),
(6, 'ABADENT-104', 'CAJA VERASOFT', 44, 0, 0, '2021-04-07', 1),
(7, 'ADISSA-100', 'DIENTES PARA TIPODONTO DE ACRILICO', 5, 0, 0, '2021-04-08', 1),
(8, 'PTRX511', 'EQUIPO DE RAYOS X DE PARED', 1600, 0, 0, '2021-04-09', 1),
(9, 'PTRX111', 'EQUIPO DE RAYOS X DE PEDESTAL', 1700, 0, 0, '2021-04-10', 1),
(10, 'AHKIMP-100', 'PINZA CORTE PESADO AHKIMP', 140, 0, 0, '2021-04-11', 1),
(11, 'AHKIMP-101', 'KIT DE CEPILLO MAS RELOJ DE ARENA', 2.5, 0, 0, '2021-04-12', 1),
(12, 'AHKIMP-102', 'KIT DE CEPILLADO DE ADULTO', 8, 0, 0, '2021-04-13', 1),
(13, 'AHKIMP-103', 'KIT DE CEPILLADO DE NIÑOS', 8, 0, 0, '2021-04-14', 1),
(14, 'AHKIMP-104', 'CEPILLO DE NIÑO', 2.5, 0, 0, '2021-04-15', 1),
(15, 'AHKIMP-105', 'BRACKETS  FLEX 0 ,18 AKP', 40, 0, 0, '2021-04-16', 1),
(16, 'AHKIMP-106', 'BRACKETS  FLEX 0 ,22 AKP', 40, 0, 0, '2021-04-17', 1),
(17, 'AHKIMP-107', 'BRACKETS  0 ,18 ROTH  LIGHT AKP', 18, 0, 0, '2021-04-18', 1),
(18, 'AHKIMP-108', 'BRACKETS  0 ,22 ROTH  LIGHT AKP', 18, 0, 0, '2021-04-19', 1),
(19, 'AHKIMP-111', 'TUBO DE CEMENTADO DIRECTO POR 4 UNIDS AKP', 12, 0, 0, '2021-04-20', 1),
(20, 'AHKIMP-112', 'BANDAS LISAS  AKP', 2, 0, 0, '2021-04-21', 1),
(21, 'AHKIMP-109', 'BROCHE DE MUELAS  DE  SOLAPA', 6, 0, 0, '2021-04-22', 1),
(22, 'AHKIMP-110', 'CALCOMANIA AH KIM PECH', 3, 0, 0, '2021-04-23', 1),
(23, 'ALTAM-100', 'GAFIDEX GALON GLUTAALDEHIDO', 20, 0, 0, '2021-04-24', 1),
(24, 'ALTAM-101', 'ANTIBENZIL EN   GALON  AMARILLO', 12, 0, 0, '2021-04-25', 1),
(25, 'ANELSAM-102', 'CALENTADOR DE CERA', 90, 0, 0, '2021-04-26', 1),
(26, 'ANELSAM-103', 'CENTRIFUGA', 250, 0, 0, '2021-04-27', 1),
(27, 'ANELSAM-105', 'COMPRESOR SILENCIOSO 1 HP', 460, 0, 0, '2021-04-28', 1),
(28, 'ANELSAM-106', 'COMPRESOR SILENCIOSO 2 HP', 875, 0, 0, '2021-04-29', 1),
(29, 'ANELSAM-108', 'COPA DE PROFILAXIS X 100', 20, 0, 0, '2021-04-30', 1),
(30, 'ANELSAM-109', 'DISCOS NEGROS DE HULE X 100', 20, 0, 0, '2021-05-01', 1),
(31, 'ANELSAM-110', 'DISCO DE CARBORUNDO X 100', 20, 0, 0, '2021-05-02', 1),
(32, 'ANELSAM-111', 'DISCO DE CORTAR X 100', 20, 0, 0, '2021-05-03', 1),
(33, 'ANELSAM-112', 'DISCO DE DESGASTAR X 100', 20, 0, 0, '2021-05-04', 1),
(34, 'ANELSAM-113', 'GASA EN CAJON', 36, 0, 0, '2021-05-05', 1),
(35, 'ANELSAM-114', 'MOTOR DE ALTA Y BAJA CON ACCESORIOS', 350, 0, 0, '2021-05-06', 1),
(36, 'ANELSAM-115', 'PUNTAS DE JERINGA TRIPLE DESCARTABLES BOLSA 250', 40, 0, 0, '2021-05-07', 1),
(37, 'ANELSAM-116', 'RECORTADORA DE YESO MEXICANA', 450, 0, 0, '2021-05-08', 1),
(38, 'ANELSAM-117', 'TOLVA', 40, 0, 0, '2021-05-09', 1),
(39, 'ANELSAM-118', 'VIBRADOR DE YESO', 70, 0, 0, '2021-05-10', 1),
(40, 'ANELSAM-120', 'FIBRA  PARA LAMPARA FOTOCURADO', 80, 0, 0, '2021-05-11', 1),
(41, 'ANELSAM-121', 'TIPODONTO EDUCATIVO GRANDE', 50, 0, 0, '2021-05-12', 1),
(42, 'ANELSAM-122', 'VALVULA DE DOS VIAS', 15, 0, 0, '2021-05-13', 1),
(43, 'ANELSAM-123', 'CORREAS VERDES PARA MOTOR DE ALTA', 6, 0, 0, '2021-05-14', 1),
(44, 'ANELSAM-124', 'COALLA PARA MOTOR DE ALTA', 5, 0, 0, '2021-05-15', 1),
(45, 'ANELSAM-125', 'MUFLA GRANDE DE  BRONCE 28 Y 29', 40, 0, 0, '2021-05-16', 1),
(46, 'ANELSAM-126', 'PORTA COALLA', 5, 0, 0, '2021-05-17', 1),
(47, 'ANELSAM-127', 'VALVULA DE AGUA', 15, 0, 0, '2021-05-18', 1),
(48, 'ANELSAM-128', 'VALVULA DE SUCCIÓN', 17, 0, 0, '2021-05-19', 1),
(49, 'ANELSAM-129', 'BABERO DESCARTABLE BLANCO', 5, 0, 0, '2021-05-20', 1),
(50, 'ANELSAM-131', 'BLANCO ESPAÑA', 3, 0, 0, '2021-05-21', 1),
(51, 'ANELSAM-132', 'BOLSA  PARA  ESTERILIZAS  2 1/4X4 CM', 6, 0, 0, '2021-05-22', 1),
(52, 'ANELSAM-133', 'BARNIZ  DENTAL COPAL', 6, 0, 0, '2021-05-23', 1),
(53, 'ANELSAM-134', 'CEPILLO REDONDO 3 HILERAS', 3, 0, 0, '2021-05-24', 1),
(54, 'ANELSAM-135', 'CEPILLO BLANO PARA LAVAR INSTRUMENTOS', 3, 0, 0, '2021-05-25', 1),
(55, 'ANELSAM-136', 'CERA DE MODELAR DE COLORES EN CUBO X 4', 2, 0, 0, '2021-05-26', 1),
(56, 'ANELSAM-137', 'CRISOLES DE BARRO', 1.5, 0, 0, '2021-05-27', 1),
(57, 'ANELSAM-138', 'CUBILETE METALICO + PEANA', 5, 0, 0, '2021-05-28', 1),
(58, 'ANELSAM-139', 'ESPATULA PLASTICA PARA RESINAS', 10, 0, 0, '2021-05-29', 1),
(59, 'ANELSAM-140', 'MUFLA RIÑONERA', 12, 0, 0, '2021-05-30', 1),
(60, 'ANELSAM-141', 'MUFLA CAJA DE MUERTO', 12, 0, 0, '2021-05-31', 1),
(61, 'ANELSAM-143', 'PRENSA PORTATIL', 15, 0, 0, '2021-06-01', 1),
(62, 'ANELSAM-144', 'ROJO INGLES', 3, 0, 0, '2021-06-02', 1),
(63, 'ANELSAM-145', 'SEPARADOR DE YESO 1 LITRO', 8, 0, 0, '2021-06-03', 1),
(64, 'ANELSAM-147', 'LAPICEROS DE MUELA RIGIDOS', 3, 0, 0, '2021-06-04', 1),
(65, 'ANELSAM-148', 'ALGODON EN ROLLO   UNIDAD', 1, 0, 0, '2021-06-05', 1),
(66, 'ANELSAM-149', 'ALGODON  ROLLO  BOLSA  X 10 ROLLOS', 6, 0, 0, '2021-06-06', 1),
(67, 'ANELSAM-150', 'BANDA MATRIZ EN TIRA  X 12', 1.5, 0, 0, '2021-06-07', 1),
(68, 'ANELSAM-151', 'BATAS   QUIRUGICAS UNIDAD', 3, 0, 0, '2021-06-08', 1),
(69, 'ANELSAM-152', 'BOLSA PARA ESTERILIZAR   3 1/2X 10 CM', 14, 0, 0, '2021-06-09', 1),
(70, 'ANELSAM-153', 'BOLSA  PARA ESTERILIZAS  5 1/4X 11CM', 16, 0, 0, '2021-06-10', 1),
(71, 'ANELSAM-154', 'CERA PARA MODELAR COLOR AZUL', 5, 0, 0, '2021-06-11', 1),
(72, 'ANELSAM-155', 'CERA PARA MODELAR COLOR VERDE', 5, 0, 0, '2021-06-12', 1),
(73, 'ANELSAM-156', 'CONDENSADOR DE AMALGAMA FM', 5, 0, 0, '2021-06-13', 1),
(74, 'ANELSAM-157', 'CONDENSADOR DE AMALGAMA MG', 5, 0, 0, '2021-06-14', 1),
(75, 'ANELSAM-158', 'CONDENSADOR DE AMALGAMA GRANDE', 5, 0, 0, '2021-06-15', 1),
(76, 'ANELSAM-159', 'CUBETAS DE ALUMINIO X 6 UNIDS', 12.722, 0, 0, '2021-06-16', 1),
(77, 'ANELSAM-160', 'CUBETAS PLASTICA EN JUEGO X 9 UNIDADES', 7.5, 0, 0, '2021-06-17', 1),
(78, 'ANELSAM-162', 'GANCHO DE RADIOGRAFIA X 14', 15, 0, 0, '2021-06-18', 1),
(79, 'ANELSAM-163', 'GORROS QUIRÚRGICOS UNIDAD', 1, 0, 0, '2021-06-19', 1),
(80, 'ANELSAM-164', 'MUFLA GRANDE DE ALUMINIO 28 Y 29', 15, 0, 0, '2021-06-20', 1),
(81, 'ANELSAM-165', 'PORTA RADIOGRAFIA OCLUSALES PLASTICA', 1, 0, 0, '2021-06-21', 1),
(82, 'ANELSAM-167', 'ZOCALOS FLEXIBLES NEGROS', 5, 0, 0, '2021-06-22', 1),
(83, 'ANELSAM-168', 'ESPATULA DE CEMENTO PLASTICA', 1, 0, 0, '2021-06-23', 1),
(84, 'ANELSAM-169', 'FRESA ENDOZETA', 9, 0, 0, '2021-06-24', 1),
(85, 'ANELSAM-170', 'HILO DE SUTURA SEDA 3 ,0  4 ,0', 2.5, 0, 0, '2021-06-25', 1),
(86, 'ANELSAM-171', 'HILO DE VYCRIL 3-0 Y 4-0', 3.5, 0, 0, '2021-06-26', 1),
(87, 'ANELSAM-172', 'TIPODONTO DE NIÑOS', 10, 0, 0, '2021-06-27', 1),
(88, 'ANELSAM-173', 'TIPODONTO DE ADULTOS', 10, 0, 0, '2021-06-28', 1),
(89, 'ANELSAM-174', 'CADENAS DE BABEROS PLASTICOS', 1.5, 0, 0, '2021-06-29', 1),
(90, 'ANELSAM-175', 'GASA EN PAQUETE X 200', 1.6, 0, 0, '2021-06-30', 1),
(91, 'ANELSAM-176', 'CONTRAAUNGULO DESCARTABLE', 0.75, 0, 0, '2021-07-01', 1),
(92, 'ANELSAM-177', 'DISCO DE FIELTRO PARA MOTOR DE ALTA', 0.356, 0, 0, '2021-07-02', 1),
(93, 'ANELSAM-178', 'PIEDRA MONTADA BLANCA Y VERDE', 0.5, 0, 0, '2021-07-03', 1),
(94, 'ANELSAM-179', 'PORTA RADIOGRAFIA PERIAPICALES PLASTICO', 1, 0, 0, '2021-07-04', 1),
(95, 'ANELSAM-180', 'CUBETAS PARA FLÚOR DE ADULTOS', 0.5, 0, 0, '2021-07-05', 1),
(96, 'ANELSAM-181', 'PIEDRA ARKANSA', 1.5, 0, 0, '2021-07-06', 1),
(97, 'ANELSAM-182', 'BISTURI 15 X UNIDAD', 0.25, 0, 0, '2021-07-07', 1),
(98, 'ANELSAM-183', 'CEPILLO DE PROFILAXIS', 0.2998581560283688, 0, 0, '2021-07-08', 1),
(99, 'ANELSAM-184', 'CERA UTILITY EN BARRA', 1, 0, 0, '2021-07-09', 1),
(100, 'ANELSAM-185', 'CONOS DE HULE GRIS INDIVIDUAL', 0.39, 0, 0, '2021-07-10', 1),
(101, 'ANELSAM-186', 'COPA DE PROFILAXIS', 0.2998581560283688, 0, 0, '2021-07-11', 1),
(102, 'ANELSAM-187', 'DISCO NEGRO DE HULE X UNIDAD', 0.39, 0, 0, '2021-07-12', 1),
(103, 'ANELSAM-188', 'DISCO DE CARBORUNDO X UNIDAD', 0.25, 0, 0, '2021-07-13', 1),
(104, 'ANELSAM-189', 'DISCO DE CORTAR X UNIDAD', 0.39, 0, 0, '2021-07-14', 1),
(105, 'ANELSAM-190', 'DISCO DE DESGASTAR X UNIDAD', 0.39, 0, 0, '2021-07-15', 1),
(106, 'ANELSAM-191', 'PIEDERA MONTADA ROSADA', 0.25, 0, 0, '2021-07-16', 1),
(107, 'ANELSAM-192', 'PUNTAS DESCARTABLES PARA JERINGAS TRIPLE UNIDAD', 0.25, 0, 0, '2021-07-17', 1),
(108, 'ANELSAM-205', 'LAMPARA FOTOCURADO D 2000', 350, 0, 0, '2021-07-18', 1),
(109, 'ANELSAM-206', 'SINFÍN PARA LABORATORIO DERECHO /IZQUIERDO', 7, 0, 0, '2021-07-19', 1),
(110, 'ANELSAM-207', 'SHUCK DE BAJA', 40, 0, 0, '2021-07-20', 1),
(111, 'ANELSAM-208', 'CAJA PLANO ROJA DE 1 BANDEJAS', 30, 0, 0, '2021-07-21', 1),
(112, 'ANELSAM-209', 'CAJA PLANO AZUL DE  2 BANDEJAS', 40, 0, 0, '2021-07-22', 1),
(113, 'ANELSAM-210', 'CAJA PLANO ROSA  DE 2 BANDEJAS', 40, 0, 0, '2021-07-23', 1),
(114, 'ANELSAM-211', 'CAJA PLANO VERDE   DE 3 BANDEJAS', 45, 0, 0, '2021-07-24', 1),
(115, 'ANELSAM-212', 'CORONA DE CELULOIDE X CAJA', 8, 0, 0, '2021-07-25', 1),
(116, 'ANELSAM-213', 'ESPEJO INTRAORALES PARA FOTOGRAFIA X 3', 70, 0, 0, '2021-07-26', 1),
(117, 'ANELSAM-214', 'LIMA SYBROND 25MM 45/80', 7, 0, 0, '2021-07-27', 1),
(118, 'ANELSAM-216', 'OCLUDE VERDE SPRAY PEQUEÑO', 17, 0, 0, '2021-07-28', 1),
(119, 'ANELSAM-217', 'PAPEL DE TRAZADO CEFALOMETRICO', 37, 0, 0, '2021-07-29', 1),
(120, 'ANELSAM-218', 'RECIPIENTE PARA AGUJA DESCARTABLE', 8, 0, 0, '2021-07-30', 1),
(121, 'ANELSAM-219', 'ACUTRAX', 30, 0, 0, '2021-07-31', 1),
(122, 'ANELSAM-220', 'METAL VERAPDS X ONZA', 3.85, 0, 0, '2021-08-01', 1),
(123, 'ANELSAM-221', 'MICROTORCH', 44, 0, 0, '2021-08-02', 1),
(124, 'ANELSAM-222', 'PAÑO EXPRIMIDOR EN CAJA', 5, 0, 0, '2021-08-03', 1),
(125, 'ANELSAM-223', 'ZOCALOS RIGIDOS', 5, 0, 0, '2021-08-04', 1),
(126, 'ANELSAM-224', 'LOZETA DE VIDRIO DELGADA', 3, 0, 0, '2021-08-05', 1),
(127, 'ANELSAM-225', 'LOZETA DE VIDRIO GRUESA', 6, 0, 0, '2021-08-06', 1),
(128, 'STEEL-111', 'MICROAPLICADOR', 3.5, 0, 0, '2021-08-07', 1),
(129, 'ANELSAM-227', 'MORTERO Y PISTILO', 5, 0, 0, '2021-08-08', 1),
(130, 'ANELSAM-228', 'PAÑO EXPRIMIDOR EN BOLSA', 2, 0, 0, '2021-08-09', 1),
(131, 'ANELSAM-229', 'DAPEN DE VIDRIO', 2, 0, 0, '2021-08-10', 1),
(132, 'ANELSAM-233', 'RATONES', 0.25, 0, 0, '2021-08-11', 1),
(133, 'ANELSAM-234', 'PINES PARA TROQUELES SENCILLO INDIVIDUAL', 0.9, 0, 0, '2021-08-12', 1),
(134, 'ANELSAM-236', 'PINES INTRARADICULARES METALICO DORADO', 0.6, 0, 0, '2021-08-13', 1),
(135, 'ANELSAM-193', 'AMALGAMADOR  ELECTRICO', 250, 0, 0, '2021-08-14', 1),
(136, 'ANELSAM-104', 'CEPILLO DE PROFILAXIS X 100', 20, 0, 0, '2021-08-15', 1),
(137, 'ANELSAM-107', 'CONOS DE HULE GRIS X CAJA X 100', 20, 0, 0, '2021-08-16', 1),
(138, 'ANELSAM-194', 'ARCO  DE NEY  CON CEGUETA NACIONAL', 10, 0, 0, '2021-08-17', 1),
(139, 'ANELSAM-195', 'BISTTURI  12X CAJAS  X 100', 20, 0, 0, '2021-08-18', 1),
(140, 'ANELSAM-196', 'CABEZAS DE COMPRESOR DE 1 HP', 200, 0, 0, '2021-08-19', 1),
(141, 'ANELSAM-198', 'CUBETAS PARA FLÚOR DE NIÑOS', 0.5, 0, 0, '2021-08-20', 1),
(142, 'ANELSAM-199', 'CUBETAS PARA FLÚOR MEDIANAS', 0.5, 0, 0, '2021-08-21', 1),
(143, 'ANELSAM-200', 'MANTA GRANDE REDONDA PARA LABORATORIO', 3, 0, 0, '2021-08-22', 1),
(144, 'ANELSAM-201', 'MOTOR DE LABORATORIO DE BAJA', 250, 0, 0, '2021-08-23', 1),
(145, 'ANELSAM-202', 'PEDAL NEUMATICO', 40, 0, 0, '2021-08-24', 1),
(146, 'ANELSAM-204', 'GORROS QUIRÚRGICOS PAQUETE X 100', 40, 0, 0, '2021-08-25', 1),
(147, 'ANELSAM-230', 'METAL LPG', 1.09, 0, 0, '2021-08-26', 1),
(148, 'ANELSAM-237', 'BANDA MATRIZ 5X5', 5, 0, 0, '2021-08-27', 1),
(149, 'ANELSAM-240', 'CERA DE MODELAR TRANSPARENTE EN CUBO', 0.25, 0, 0, '2021-08-28', 1),
(150, 'ANELSAM-239', 'SHUCK DE ALTA', 50, 0, 0, '2021-08-29', 1),
(151, 'ARTIFOL-100', 'PAPEL DE ARTICULAR ARTIFOL', 35, 0, 0, '2021-08-30', 1),
(152, 'AWAN-244', 'SUCCIÓN DE ENDODONCIA AWAM 3 PUNTASL', 20, 0, 0, '2021-08-31', 1),
(153, 'AWAN-100', 'GRAPAS 200  AWAN', 3, 0, 0, '2021-09-01', 1),
(154, 'AWAN-101', 'CASO METALICO PORTA LIMA', 15, 0, 0, '2021-09-02', 1),
(155, 'AWAN-102', 'CALIBRADOR DE BOLEY', 20, 0, 0, '2021-09-03', 1),
(156, 'AWAN-103', 'PINZA CORTE FRONTAL AWAN', 40, 0, 0, '2021-09-04', 1),
(157, 'AWAN-104', 'PINZA DE PICO DE ALCON AWAN', 10, 0, 0, '2021-09-05', 1),
(158, 'AWAN-105', 'PINZA DE NANCE AWAN', 10, 0, 0, '2021-09-06', 1),
(159, 'AWAN-106', 'PINZA CORTE DISTAL AWAN', 40, 0, 0, '2021-09-07', 1),
(160, 'AWAN-107', 'PINZA DE LA ROSA AWAN', 10, 0, 0, '2021-09-08', 1),
(161, 'AWAN-108', 'PINZA DE YOUNG AWAN', 10, 0, 0, '2021-09-09', 1),
(162, 'AWAN-133', 'GRAPAS 0 AWAN', 3, 0, 0, '2021-09-10', 1),
(163, 'AWAN-110', 'GRAPAS 00 AWAN', 3, 0, 0, '2021-09-11', 1),
(164, 'AWAN-111', 'GRAPAS 1 AWAN', 3, 0, 0, '2021-09-12', 1),
(165, 'AWAN-112', 'GRAPAS 2 AWAN', 3, 0, 0, '2021-09-13', 1),
(166, 'AWAN-113', 'GRAPAS 2A AWAN', 3, 0, 0, '2021-09-14', 1),
(167, 'AWAN-114', 'GRAPAS 7 AWAN', 3, 0, 0, '2021-09-15', 1),
(168, 'AWAN-115', 'GRAPAS 7A AWAN', 3, 0, 0, '2021-09-16', 1),
(169, 'AWAN-116', 'GRAPAS 8 AWAN', 3, 0, 0, '2021-09-17', 1),
(170, 'AWAN-117', 'GRAPAS 8A AWAN', 3, 0, 0, '2021-09-18', 1),
(171, 'AWAN-118', 'GRAPAS 14 AWAN', 3, 0, 0, '2021-09-19', 1),
(172, 'AWAN-119', 'GRAPAS 56  AWAN', 3, 0, 0, '2021-09-20', 1),
(173, 'AWAN-120', 'GRAPAS 201  AWAN', 3, 0, 0, '2021-09-21', 1),
(174, 'AWAN-121', 'GRAPAS 205 AWAN', 3, 0, 0, '2021-09-22', 1),
(175, 'AWAN-132', 'PINZA HOW CURVA/RECTA AWAN', 10, 0, 0, '2021-09-23', 1),
(176, 'AWAN-124', 'SONDA DE NABERS', 30, 0, 0, '2021-09-24', 1),
(177, 'AWAN-125', 'EXPLORADOR PC1 PC2', 5, 0, 0, '2021-09-25', 1),
(178, 'AWAN-126', 'PINZA 3 PICOS AWAN', 10, 0, 0, '2021-09-26', 1),
(179, 'AWAN-127', 'PINZA MATHEW AWAN', 10, 0, 0, '2021-09-27', 1),
(180, 'AWAN-128', 'PINZA QUITA BANDAS AWAN', 15, 0, 0, '2021-09-28', 1),
(181, 'AWAN-129', 'TIJERA DE TEJIDOS BLANDOS AWAN', 5, 0, 0, '2021-09-29', 1),
(182, 'AWAN-130', 'GRAPAS 14A AWAN', 3, 0, 0, '2021-09-30', 1),
(183, 'AWAN-131', 'GRAPAS 210 AWAN', 3, 0, 0, '2021-10-01', 1),
(184, 'DE-162', 'ELEVADORES FINO', 8, 0, 0, '2021-10-02', 1),
(185, 'DE-163', 'ELEVADORES MEDIO', 8, 0, 0, '2021-10-03', 1),
(186, 'DE-164', 'ELEVADORES GRUESO', 8, 0, 0, '2021-10-04', 1),
(187, 'AWAN-135', 'ELEVADOR BANDERA DERECHO AWAN', 8, 0, 0, '2021-10-05', 1),
(188, 'AWAN-136', 'ELEVADOR BANDERA IZQUIERDO AWAN', 8, 0, 0, '2021-10-06', 1),
(189, 'AWAN-137', 'ELEVADOR APICAL DERECHO AWAN', 8, 0, 0, '2021-10-07', 1),
(190, 'AWAN-138', 'ELEVADOR APICAL IZQUIERDO AWAN', 8, 0, 0, '2021-10-08', 1),
(191, 'AWAN-139', 'FORCEPS  # 18 R AWAN', 10, 0, 0, '2021-10-09', 1),
(192, 'NO:1', 'FORCEPS # 1', 10, 0, 0, '2021-10-10', 1),
(193, 'AWAN-123', 'FORCEPS # 13 AWAN', 10, 0, 0, '2021-10-11', 1),
(194, 'MA023-151', 'FORCEPS # 150', 10, 0, 0, '2021-10-12', 1),
(195, 'AWAN-143', 'FORCEPS # 150S AWAN', 10, 0, 0, '2021-10-13', 1),
(196, 'AWAN-144', 'FORCEPS # 151 AWAN', 10, 0, 0, '2021-10-14', 1),
(197, 'MA023-088R', 'FORCEPS # 151 S', 10, 0, 0, '2021-10-15', 1),
(198, 'MA020-23', 'FORCEPS # 16', 10, 0, 0, '2021-10-16', 1),
(199, 'AWAN-147', 'FORCEPS # 17 AWAN', 10, 0, 0, '2021-10-17', 1),
(200, 'NO:69', 'FORCEPS # 18L', 10, 0, 0, '2021-10-18', 1),
(201, 'AWAN-149', 'FORCEPS # 210S AWAN', 10, 0, 0, '2021-10-19', 1),
(202, 'NO:13', 'FORCEPS # 222', 10, 0, 0, '2021-10-20', 1),
(203, 'AWAN-151', 'FORCEPS # 23 AWAN', 10, 0, 0, '2021-10-21', 1),
(204, 'AWAN-152', 'FORCEPS # 286 AWAN', 10, 0, 0, '2021-10-22', 1),
(205, 'AWAN-153', 'FORCEPS PICO DE LORO AWAN', 10, 0, 0, '2021-10-23', 1),
(206, 'NO:53L', 'FORCEPS # 65', 10, 0, 0, '2021-10-24', 1),
(207, 'AWAN-155', 'FORCEPS # 69 AWAN', 10, 0, 0, '2021-10-25', 1),
(208, 'MA023-150', 'FORCEPS # 88 L', 10, 0, 0, '2021-10-26', 1),
(209, 'MA023-88L', 'FORCEPS # 88 R', 10, 0, 0, '2021-10-27', 1),
(210, 'AWAN-109', 'FORCEPS # 99 C AWAN', 10, 0, 0, '2021-10-28', 1),
(211, 'AWAN-159', 'GRAPAS 9 AWAN', 3, 0, 0, '2021-10-29', 1),
(212, 'AWAN-160', 'PINZA KELLY CURVA AWAN', 5, 0, 0, '2021-10-30', 1),
(213, 'AWAN-161', 'PINZA KELLY RECTA AWAN', 5, 0, 0, '2021-10-31', 1),
(214, 'AWAN-162', 'PINZA MOSQUITO RECTA AWAN', 5, 0, 0, '2021-11-01', 1),
(215, 'AWAN-163', 'PINZA MOSQUITO CURVA AWAN', 5, 0, 0, '2021-11-02', 1),
(216, 'AWAN-164', 'ARTICULADOR  CROMADO', 9, 0, 0, '2021-11-03', 1),
(217, 'AWAN-166', 'ARCO DE YOUNG   METALICO AWAN', 5, 0, 0, '2021-11-04', 1),
(218, 'AWAN-167', 'CALIBRADOR  DE CERA AWAN', 10, 0, 0, '2021-11-05', 1),
(219, 'AWAN-168', 'CALIBRADOR DE METAL AWAN', 10, 0, 0, '2021-11-06', 1),
(220, 'AWAN-169', 'CUBETAS METALICAS X6 UNID AWAN', 20, 0, 0, '2021-11-07', 1),
(221, 'AWAN-170', 'CURETAS  GRACEY 1/2 AWAN', 5, 0, 0, '2021-11-08', 1),
(222, 'AWAN-171', 'CURETAS  GRACEY 5/6 AWAN', 5, 0, 0, '2021-11-09', 1),
(223, 'AWAN-172', 'CURETAS  GRACEY  7/8 AWAN', 5, 0, 0, '2021-11-10', 1),
(224, 'AWAN-173', 'CURETAS  GRACEY  9/10 AWAN', 5, 0, 0, '2021-11-11', 1),
(225, 'AWAN-174', 'CURETAS  GRACEY  13/14 AWAN', 5, 0, 0, '2021-11-12', 1),
(226, 'AWAN-175', 'CURETAS  GRACEY  15/16 AWAN', 5, 0, 0, '2021-11-13', 1),
(227, 'AWAN-176', 'CURETAS  MCCALL 13/14 AWAN', 5, 0, 0, '2021-11-14', 1),
(228, 'AWAN-177', 'CURETAS  MCCALL 17/18 AWAN', 5, 0, 0, '2021-11-15', 1),
(229, 'AWAN-178', 'DAPEN METALICO AWAN', 6, 0, 0, '2021-11-16', 1),
(230, 'AWAN-179', 'ESPEJO NO 4 AWAN', 1, 0, 0, '2021-11-17', 1),
(231, 'AWAN-180', 'EXPLORADOR D11 AWAN', 5, 0, 0, '2021-11-18', 1),
(232, 'MA-08-030T', 'EXPLORADOR D11T', 5, 0, 0, '2021-11-19', 1),
(233, 'AWAN-182', 'GANCHO DE RADIOGRAFIA X6 AWAN', 8, 0, 0, '2021-11-20', 1),
(234, 'AWAN-183', 'GANCHO DE RADIOGRAFIA X 10 AWAN', 13, 0, 0, '2021-11-21', 1),
(235, 'AWAN-184', 'GOTEROS AWAN', 1.5, 0, 0, '2021-11-22', 1),
(236, 'AWAN-185', 'PERFORADORA DE DIQUE DE GOMA', 15, 0, 0, '2021-11-23', 1),
(237, 'AWAN-186', 'PINZA MILLER AWAN', 3, 0, 0, '2021-11-24', 1),
(238, 'AWAN-187', 'PINZA  GUBIA AWAN', 12, 0, 0, '2021-11-25', 1),
(239, 'AWAN-188', 'PORTA AMALGAMA METALICO', 12, 0, 0, '2021-11-26', 1),
(240, 'AWAN-189', 'PORTA BANDA MATRIZ', 3.5, 0, 0, '2021-11-27', 1),
(241, 'AWAN-190', 'PORTA GRAPA', 10, 0, 0, '2021-11-28', 1),
(242, 'AWAN-191', 'TALLADOR DE FRANK', 5, 0, 0, '2021-11-29', 1),
(243, 'MA-32-020-01', 'TIRAPUENTE', 12, 0, 0, '2021-11-30', 1),
(244, 'AWAN-193', 'TIJERA RECTA AWAN', 4, 0, 0, '2021-12-01', 1),
(245, 'AWAN-194', 'TIJERA CURVA AWAN', 4, 0, 0, '2021-12-02', 1),
(246, 'AWAN-195', 'GANCHO DE BOLA 28-30-32', 10, 0, 0, '2021-12-03', 1),
(247, 'AWAN-196', 'BRUÑIDOR  DE HUEVO', 2.8, 0, 0, '2021-12-04', 1),
(248, 'MA-1305-89-92', 'CLEOIDE', 2.8, 0, 0, '2021-12-05', 1),
(249, 'AWAN-198', 'CONDENSADOR DE CUATRO EXTREMOS', 3, 0, 0, '2021-12-06', 1),
(250, 'AWAN-199', 'CUCHARILLAS PARA HUESO LUCAS BONE', 6, 0, 0, '2021-12-07', 1),
(251, 'AWAN-200', 'CUCHARILLA DE DENTINA', 2.8, 0, 0, '2021-12-08', 1),
(252, 'AWAN-201', 'CUCHARILLA DE ENDODONCIA', 2.8, 0, 0, '2021-12-09', 1);

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
(1, 800, 1, ''),
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
(6, 3, 1, 799, 18788.25, 18763.93, 55, 66, 1, 1, 1, 0, 0, 1, 0, 0, '2021-05-20', '09:56:49', '4i8gav1hypsmze0wkodbwr4sepf3em4nro2jdjlxagr84s381t6tetmbndh0by9wfcj7o3jjgz1jyn0ccsx49itfgqnk3qkycirj', 0);

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
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`indproducto`);

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
  MODIFY `indcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `indcredito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `creditos_pago`
--
ALTER TABLE `creditos_pago`
  MODIFY `indpago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `indempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `indfactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `indproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

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
  MODIFY `indtotalfactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`indsucursal`) REFERENCES `sucursal` (`indsucursal`);

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
