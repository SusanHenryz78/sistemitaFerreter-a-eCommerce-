-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2024 a las 04:55:41
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ferretería mariano moreno`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `ID_cargos` int(20) NOT NULL COMMENT 'Clave única de los cargos.',
  `Nombre_cargos` text NOT NULL COMMENT 'Nombre de los cargos existentes en la empresa.',
  `Descripcion` varchar(120) NOT NULL COMMENT 'Descripción de los cargos.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Información de los cargos.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Clientes` int(100) NOT NULL COMMENT 'Clave única del cliente',
  `Nombre` text NOT NULL COMMENT 'Nombre del cliente',
  `Apellido` text NOT NULL COMMENT 'Apellido del cliente',
  `Direccion` varchar(30) NOT NULL COMMENT 'Dirección del cliente',
  `Telefono` int(9) NOT NULL COMMENT 'Teléfono del cliente',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Información de los clientes.';

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_Clientes`, `Nombre`, `Apellido`, `Direccion`, `Telefono`, `email`, `password`) VALUES
(1, 'susan', 'enriquez', 'romero 1224', 428486, '', ''),
(2, 'maria', 'vazquez', 'salta 789', 333999, '', ''),
(4, 'juan', 'perez', 'ayacucho 23', 789654, '', ''),
(5, 'jose', 'gonzalez', 'paraguay 15', 568974, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_facturas`
--

CREATE TABLE `detalle_facturas` (
  `iddetalle_fact` int(11) NOT NULL,
  `rela_productos` int(11) NOT NULL,
  `cantidad_prod` int(11) NOT NULL,
  `precio` decimal(11,0) NOT NULL,
  `rela_fact_ventas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID_empleados` int(20) NOT NULL COMMENT 'Clave única del empleado.',
  `Nombre` text NOT NULL COMMENT 'Nombre de los empleados.',
  `Apellido` text NOT NULL COMMENT 'Apellido de los empleados.',
  `Direccion` int(20) NOT NULL COMMENT 'Dirección de los empleados.',
  `Telefono` int(11) NOT NULL COMMENT 'Numero de contacto de los empleados.',
  `ID_cargos` int(11) NOT NULL COMMENT 'Clave única de los cargos de los empleados.',
  `rela_ferreteria` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Información de los empleados.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_compra_proveed`
--

CREATE TABLE `fact_compra_proveed` (
  `idfactProveedor` int(11) NOT NULL,
  `tipo_fact` varchar(45) NOT NULL,
  `rela_proveedor` int(11) NOT NULL,
  `num_factura` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `subtotal` decimal(11,0) NOT NULL,
  `monto_total` decimal(11,0) NOT NULL,
  `vto_factura` date NOT NULL,
  `rela_ferreteria` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_ventas_cli`
--

CREATE TABLE `fact_ventas_cli` (
  `idfactura` int(11) NOT NULL,
  `tipo_fact` varchar(45) NOT NULL,
  `rela_cliente` int(11) NOT NULL,
  `num_factura` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `subtotal` decimal(11,0) NOT NULL,
  `importe_total` decimal(11,0) NOT NULL,
  `vto_factura` date NOT NULL,
  `rela_mediodepago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ferreteria`
--

CREATE TABLE `ferreteria` (
  `ID_Ferreteria` int(20) NOT NULL COMMENT 'Clave única de la ferretería.',
  `Razon_social` text NOT NULL COMMENT 'Nombre de la ferretería.',
  `Direccion` varchar(30) NOT NULL COMMENT 'Dirección de la ferretería.',
  `Telefono` int(9) NOT NULL COMMENT 'Numero de contacto de la ferretería.',
  `Cuit` int(11) NOT NULL COMMENT 'Es el código de identificación para la AFIP.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Información sobre la ferretería.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_de_precios_prove`
--

CREATE TABLE `lista_de_precios_prove` (
  `idprecios_prod` int(11) NOT NULL,
  `rela_productos` int(11) NOT NULL,
  `costo` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medios_pago`
--

CREATE TABLE `medios_pago` (
  `ID_metodo_pago` int(1) NOT NULL COMMENT 'Clave única de los distintos medios de pago.',
  `Metodo_pago` text NOT NULL COMMENT 'Los distintos medios de pago.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Información de los métodos de pagos.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_producto` int(100) NOT NULL COMMENT 'Clave única del producto.',
  `Nombre_producto` varchar(20) NOT NULL COMMENT 'Nombre del producto.',
  `Descripcion` varchar(140) NOT NULL COMMENT 'Descripción del producto.',
  `Precio_producto` int(255) NOT NULL COMMENT 'Precio de la mercadería.',
  `Cantidad` int(100) NOT NULL COMMENT 'Cantidad en stock del producto.',
  `Estado_producto` text NOT NULL COMMENT 'Estado del producto.',
  `Garantia` varchar(20) NOT NULL COMMENT 'Garantía del producto.',
  `Fecha_ingreso` date NOT NULL COMMENT 'Fecha de ingreso del producto.',
  `ID_proveedores` int(20) NOT NULL COMMENT 'Clave única de proveedor de la mercadería.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Información sobre la mercadería.';

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_producto`, `Nombre_producto`, `Descripcion`, `Precio_producto`, `Cantidad`, `Estado_producto`, `Garantia`, `Fecha_ingreso`, `ID_proveedores`) VALUES
(1, 'GUANTES', '1A05ER23 - G13 Cr5 Bañado En Nitrilo Anticorte', 16355, 300, 'EN STOCK', '1 MES', '2024-03-04', 10),
(2, 'AMOLADORA ANGULAR', 'G1909AR 650W', 48399, 10, 'EN STOCK', '2 AÑOS', '2024-03-04', 3),
(3, 'TALADRO PERCUTOR', 'SDH600-AR 13MM 600W Velocidad Variable Reversible', 82299, 15, 'EN STOCK', '1 AÑO', '2024-03-04', 2),
(4, 'LATEX', 'Anticondensante Para Cielorrasos Tersuave Blanco x 1 Lts', 10116, 20, 'EN STOCK', '6 MESES', '2024-03-04', 4),
(5, 'CARRETILLA', '120 Lts Rueda Neumatica CAT-60PL', 145365, 20, 'EN STOCK', '6 MESES', '2024-03-04', 6),
(6, 'BOTIN', 'Ozono Ombu Negro', 9765, 15, 'EN STOCK', '3 MESES', '2024-03-04', 7),
(7, 'PALA ANCHA', 'Acero Forjado', 62873, 15, 'EN STOCK', '6 MESES', '2024-03-04', 1),
(8, 'LIJADORA ORBITAL', 'DWE6411-AR 1/4 de Hoja 230W Extractor de Polvo', 185887, 5, 'AGOTADO', '1 AÑO', '2024-03-04', 5),
(9, 'ANDAMIO', 'PARA PASILLO', 247064, 2, 'EN STOCK', '1 AÑO', '2024-03-04', 9),
(10, 'CINTA METRICA', '3 METROS', 7580, 300, 'EN STOCK', '1 MES', '2024-03-04', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_proveedores` int(20) NOT NULL COMMENT 'Clave única del proveedor.',
  `Razon_social` text NOT NULL COMMENT 'Nombre del proveedor.',
  `Direccion` varchar(30) NOT NULL COMMENT 'Dirección del proveedor.',
  `Telefono` int(9) NOT NULL COMMENT 'Numero de contacto del proveedor.',
  `provincia` text NOT NULL COMMENT 'Provincia en la cual se encuentra el proveedor.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Información sobre los proveedores.';

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ID_proveedores`, `Razon_social`, `Direccion`, `Telefono`, `provincia`) VALUES
(1, 'GHERARDI', 'CASTELLI 238', 333555, 'FORMOSA'),
(2, 'STANLEY', 'LAPRIDA 526', 666529, 'SANTA CRUZ'),
(3, 'GAMMA', '25 DE MAYO 1525', 888856, 'SANTA FE'),
(4, 'TERSUAVE', 'VIRREY CEBALLOS 899', 444423, 'BUENOS AIRES'),
(5, 'DEWALT', 'FHOTERINGHAM 1312', 555123, 'CHACO'),
(6, 'TRUPER', 'PADRE PATIÑO 281', 789123, 'CORRIENTES'),
(7, 'OMBU', 'PICHINCHA 789', 753159, 'BUENOS AIRES'),
(8, 'PRETUL', 'AYACUCHO 325', 4587456, 'FORMOSA'),
(9, 'DEPER', 'ECHEGARAY 45', 741258, 'SANTA FE'),
(10, 'RANDON', 'BULNES 78', 877632, 'BUENOS AIRES');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`ID_cargos`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Clientes`);

--
-- Indices de la tabla `detalle_facturas`
--
ALTER TABLE `detalle_facturas`
  ADD PRIMARY KEY (`iddetalle_fact`),
  ADD KEY `rela_productos` (`rela_productos`),
  ADD KEY `rela_fact_ventas` (`rela_fact_ventas`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID_empleados`),
  ADD KEY `ID_cargos` (`ID_cargos`),
  ADD KEY `rela_ferreteria` (`rela_ferreteria`);

--
-- Indices de la tabla `fact_compra_proveed`
--
ALTER TABLE `fact_compra_proveed`
  ADD PRIMARY KEY (`idfactProveedor`),
  ADD KEY `rela_proveedor` (`rela_proveedor`),
  ADD KEY `rela_ferreteria` (`rela_ferreteria`);

--
-- Indices de la tabla `fact_ventas_cli`
--
ALTER TABLE `fact_ventas_cli`
  ADD PRIMARY KEY (`idfactura`),
  ADD KEY `rela_mediodepago` (`rela_mediodepago`),
  ADD KEY `rela_cliente` (`rela_cliente`);

--
-- Indices de la tabla `ferreteria`
--
ALTER TABLE `ferreteria`
  ADD PRIMARY KEY (`ID_Ferreteria`);

--
-- Indices de la tabla `lista_de_precios_prove`
--
ALTER TABLE `lista_de_precios_prove`
  ADD PRIMARY KEY (`idprecios_prod`),
  ADD KEY `rela_productos` (`rela_productos`);

--
-- Indices de la tabla `medios_pago`
--
ALTER TABLE `medios_pago`
  ADD PRIMARY KEY (`ID_metodo_pago`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_producto`),
  ADD KEY `ID_proveedores` (`ID_proveedores`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_proveedores`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Clientes` int(100) NOT NULL AUTO_INCREMENT COMMENT 'Clave única del cliente', AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_facturas`
--
ALTER TABLE `detalle_facturas`
  ADD CONSTRAINT `detalle_facturas_ibfk_1` FOREIGN KEY (`rela_productos`) REFERENCES `productos` (`ID_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_facturas_ibfk_2` FOREIGN KEY (`rela_fact_ventas`) REFERENCES `fact_ventas_cli` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`ID_cargos`) REFERENCES `cargos` (`ID_cargos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`rela_ferreteria`) REFERENCES `ferreteria` (`ID_Ferreteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `fact_compra_proveed`
--
ALTER TABLE `fact_compra_proveed`
  ADD CONSTRAINT `fact_compra_proveed_ibfk_1` FOREIGN KEY (`rela_proveedor`) REFERENCES `proveedores` (`ID_proveedores`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fact_compra_proveed_ibfk_2` FOREIGN KEY (`rela_ferreteria`) REFERENCES `ferreteria` (`ID_Ferreteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `fact_ventas_cli`
--
ALTER TABLE `fact_ventas_cli`
  ADD CONSTRAINT `fact_ventas_cli_ibfk_3` FOREIGN KEY (`rela_mediodepago`) REFERENCES `medios_pago` (`ID_metodo_pago`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fact_ventas_cli_ibfk_4` FOREIGN KEY (`rela_cliente`) REFERENCES `clientes` (`ID_Clientes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lista_de_precios_prove`
--
ALTER TABLE `lista_de_precios_prove`
  ADD CONSTRAINT `lista_de_precios_prove_ibfk_1` FOREIGN KEY (`rela_productos`) REFERENCES `productos` (`ID_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_proveedores`) REFERENCES `proveedores` (`ID_proveedores`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
