-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2026 a las 22:25:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fincore`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id_auditoria` varchar(50) NOT NULL,
  `id_empresa` int(10) UNSIGNED DEFAULT NULL,
  `id_usuario` int(10) UNSIGNED DEFAULT NULL,
  `tabla_afectada` varchar(100) NOT NULL,
  `id_registro` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `fecha_evento` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`id_auditoria`, `id_empresa`, `id_usuario`, `tabla_afectada`, `id_registro`, `descripcion`, `fecha_evento`) VALUES
('1', 1, 1, 'empresas', '1', 'Creación de empresa en FINCORE.', '2026-09-13 22:30:17'),
('2', 1, 1, 'cuentas_financieras', '1', 'Creación de Caja Principal.', '2026-09-13 22:30:17'),
('3', 1, 2, 'movimientos_financieros', '1', 'Registro de ingreso por venta de pan.', '2026-09-13 22:30:17'),
('4', 1, 2, 'cuentas_por_cobrar', '1', 'Registro de cuenta por cobrar a Restaurante El Sabor.', '2026-09-13 22:30:17'),
('5', 1, 2, 'pagos_cuentas_cobrar', '1', 'Registro de abono recibido de cliente.', '2026-09-13 22:30:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_financieras`
--

CREATE TABLE `categorias_financieras` (
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias_financieras`
--

INSERT INTO `categorias_financieras` (`id_categoria`, `id_empresa`, `nombre`, `tipo`, `descripcion`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 1, 'Ventas', 'INGRESO', 'Ingresos provenientes de ventas.', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(2, 1, 'Compra de insumos', 'GASTO', 'Compra de harina, ingredientes y materias primas.', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(3, 1, 'Servicios', 'GASTO', 'Servicios y gastos operativos.', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(4, 2, 'Servicios prestados', 'INGRESO', 'Ingresos por servicios automotrices.', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(5, 2, 'Repuestos', 'GASTO', 'Compra de repuestos y componentes.', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(6, 2, 'Nómina', 'GASTO', 'Pagos relacionados con empleados.', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(7, 3, 'Ventas', 'INGRESO', 'Ingresos por ventas de café y alimentos.', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(8, 3, 'Compra de café', 'GASTO', 'Compra de café y materias primas.', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(9, 3, 'Servicios', 'GASTO', 'Servicios públicos y operativos.', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(10, 4, 'Ventas', 'INGRESO', 'Ingresos por venta de materiales.', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(11, 4, 'Compra de mercancía', 'GASTO', 'Compra de productos para comercialización.', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(12, 4, 'Transporte', 'GASTO', 'Gastos de transporte y logística.', '2026-09-13 22:30:17', '2026-09-13 22:30:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `identificacion` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `estado` varchar(80) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `id_empresa`, `nombre`, `identificacion`, `telefono`, `correo`, `direccion`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 1, 'Restaurante El Sabor', '901111111-1', '3101111111', 'compras@elsabor.com', NULL, 'ACTIVO', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(2, 1, 'Tienda Los Amigos', '1022222222', '3112222222', 'contacto@losamigos.com', NULL, 'ACTIVO', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(3, 2, 'Transportes del Norte', '901333333-3', '3123333333', 'pagos@transportesnorte.com', NULL, 'ACTIVO', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(4, 3, 'Oficinas Central', '901444444-4', '3134444444', 'administracion@oficinascentral.com', NULL, 'ACTIVO', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(5, 4, 'Constructora Bogotá', '901555555-5', '3145555555', 'compras@constructorabogota.com', NULL, 'ACTIVO', '2026-09-13 22:30:17', '2026-09-13 22:30:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_financieras`
--

CREATE TABLE `cuentas_financieras` (
  `id_cuenta` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_cuenta` varchar(80) NOT NULL,
  `moneda` char(3) NOT NULL DEFAULT 'COP',
  `saldo_inicial` decimal(15,2) NOT NULL DEFAULT 0.00,
  `saldo` decimal(15,2) NOT NULL DEFAULT 0.00,
  `estado` varchar(50) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cuentas_financieras`
--

INSERT INTO `cuentas_financieras` (`id_cuenta`, `id_empresa`, `nombre`, `tipo_cuenta`, `moneda`, `saldo_inicial`, `saldo`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 1, 'Caja Principal', 'EFECTIVO', 'COP', 500000.00, 600000.00, 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(2, 1, 'Cuenta Bancaria Principal', 'BANCARIA', 'COP', 3000000.00, 3780000.00, 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(3, 1, 'Nequi Negocio', 'BILLETERA_DIGITAL', 'COP', 200000.00, 170000.00, 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(4, 2, 'Caja Taller', 'EFECTIVO', 'COP', 1000000.00, 1450000.00, 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(5, 2, 'Cuenta Bancaria Taller', 'BANCARIA', 'COP', 5000000.00, 6200000.00, 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(6, 3, 'Caja Café', 'EFECTIVO', 'COP', 500000.00, 580000.00, 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(7, 3, 'Billetera Digital Café', 'BILLETERA_DIGITAL', 'COP', 1000000.00, 1170000.00, 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(8, 4, 'Cuenta Bancaria Ferretería', 'BANCARIA', 'COP', 6000000.00, 6400000.00, 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_por_cobrar`
--

CREATE TABLE `cuentas_por_cobrar` (
  `id_cuenta_cobrar` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `numero_documento` varchar(50) DEFAULT NULL,
  `concepto` varchar(255) NOT NULL,
  `monto_original` decimal(15,2) NOT NULL,
  `saldo_pendiente` decimal(15,2) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `estado` varchar(80) NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cuentas_por_cobrar`
--

INSERT INTO `cuentas_por_cobrar` (`id_cuenta_cobrar`, `id_empresa`, `id_cliente`, `numero_documento`, `concepto`, `monto_original`, `saldo_pendiente`, `fecha_emision`, `fecha_vencimiento`, `estado`, `observaciones`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 1, 1, 'CXC-001', 'Venta de productos de panadería', 1000000.00, 700000.00, '2026-09-01', '2026-09-15', 'PENDIENTE', NULL, '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(2, 1, 2, 'CXC-002', 'Venta de productos', 500000.00, 500000.00, '2026-09-04', '2026-09-18', 'PENDIENTE', NULL, '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(3, 2, 3, 'CXC-003', 'Servicio de mantenimiento vehicular', 1200000.00, 500000.00, '2026-09-02', '2026-09-16', 'PENDIENTE', NULL, '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(4, 3, 4, 'CXC-004', 'Servicio de cafetería empresarial', 350000.00, 350000.00, '2026-09-05', '2026-09-20', 'PENDIENTE', NULL, '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(5, 4, 5, 'CXC-005', 'Venta de materiales de construcción', 250000.00, 0.00, '2026-09-06', '2026-09-20', 'PAGADA', NULL, '2026-09-13 22:30:17', '2026-09-13 22:30:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_por_pagar`
--

CREATE TABLE `cuentas_por_pagar` (
  `id_cuenta_pagar` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `id_proveedor` int(10) UNSIGNED NOT NULL,
  `numero_documento` varchar(50) DEFAULT NULL,
  `concepto` varchar(255) NOT NULL,
  `monto_original` decimal(15,2) NOT NULL,
  `saldo_pendiente` decimal(15,2) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `estado` varchar(50) NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cuentas_por_pagar`
--

INSERT INTO `cuentas_por_pagar` (`id_cuenta_pagar`, `id_empresa`, `id_proveedor`, `numero_documento`, `concepto`, `monto_original`, `saldo_pendiente`, `fecha_emision`, `fecha_vencimiento`, `estado`, `observaciones`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 1, 1, 'CXP-001', 'Compra de harina', 500000.00, 250000.00, '2026-09-02', '2026-09-14', 'PENDIENTE', NULL, '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(2, 1, 2, 'CXP-002', 'Compra de materias primas', 350000.00, 350000.00, '2026-09-05', '2026-09-19', 'PENDIENTE', NULL, '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(3, 2, 3, 'CXP-003', 'Compra de repuestos', 700000.00, 700000.00, '2026-09-02', '2026-09-17', 'PENDIENTE', NULL, '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(4, 3, 4, 'CXP-004', 'Compra de café', 350000.00, 150000.00, '2026-09-04', '2026-09-18', 'PENDIENTE', NULL, '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(5, 4, 5, 'CXP-005', 'Compra de materiales', 400000.00, 0.00, '2026-09-06', '2026-09-20', 'PAGADA', NULL, '2026-09-13 22:30:17', '2026-09-13 22:30:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `nit` varchar(30) DEFAULT NULL,
  `sector` varchar(100) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `estado` varchar(100) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `nombre`, `nit`, `sector`, `telefono`, `correo`, `direccion`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Panadería La 80', '900100100-1', 'Alimentos', '3001112233', 'contacto@panaderiala80.com', 'Calle 80 # 30-20', 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(2, 'Taller Motor Norte', '900200200-2', 'Automotriz', '3012223344', 'info@motornorte.com', 'Carrera 45 # 100-15', 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(3, 'Café Central Bogotá', '900300300-3', 'Alimentos y bebidas', '3023334455', 'contacto@cafecentral.com', 'Calle 72 # 10-25', 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(4, 'Ferretería El Progreso', '900400400-4', 'Comercio', '3034445566', 'ventas@ferreteriaelprogreso.com', 'Carrera 68 # 45-10', 'ACTIVA', '2026-09-13 22:30:17', '2026-09-13 22:30:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_financieros`
--

CREATE TABLE `movimientos_financieros` (
  `id_movimiento` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `id_cuenta` int(10) UNSIGNED NOT NULL,
  `id_categoria` int(10) UNSIGNED DEFAULT NULL,
  `tipo_movimiento` varchar(150) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `fecha_movimiento` datetime NOT NULL DEFAULT current_timestamp(),
  `referencia` varchar(100) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientos_financieros`
--

INSERT INTO `movimientos_financieros` (`id_movimiento`, `id_empresa`, `id_cuenta`, `id_categoria`, `tipo_movimiento`, `concepto`, `monto`, `fecha_movimiento`, `referencia`, `observaciones`) VALUES
(1, 1, 1, 1, 'INGRESO', 'Venta de pan del día', 350000.00, '2026-09-01 09:30:00', 'FAC-001', NULL),
(2, 1, 2, 2, 'GASTO', 'Compra de harina', 120000.00, '2026-09-02 14:00:00', 'COMP-001', NULL),
(3, 1, 2, 1, 'INGRESO', 'Venta por transferencia', 600000.00, '2026-09-03 16:30:00', 'FAC-002', NULL),
(4, 1, 3, 3, 'GASTO', 'Pago de servicio a domicilio', 30000.00, '2026-09-04 18:00:00', 'SER-001', NULL),
(5, 2, 4, 4, 'INGRESO', 'Servicio de mantenimiento', 450000.00, '2026-09-01 11:00:00', 'SER-101', NULL),
(6, 2, 5, 5, 'GASTO', 'Compra de repuestos', 700000.00, '2026-09-02 10:00:00', 'REP-101', NULL),
(7, 2, 5, 4, 'INGRESO', 'Pago de cliente corporativo', 1200000.00, '2026-09-05 15:00:00', 'SER-102', NULL),
(8, 3, 6, 7, 'INGRESO', 'Ventas cafetería', 280000.00, '2026-09-03 17:00:00', 'VEN-201', NULL),
(9, 3, 7, 8, 'GASTO', 'Compra de café', 150000.00, '2026-09-04 08:00:00', 'COMP-201', NULL),
(10, 3, 7, 7, 'INGRESO', 'Ventas por billetera digital', 320000.00, '2026-09-05 19:00:00', 'VEN-202', NULL),
(11, 4, 8, 10, 'INGRESO', 'Venta de materiales', 900000.00, '2026-09-01 13:00:00', 'FAC-301', NULL),
(12, 4, 8, 11, 'GASTO', 'Compra a proveedor', 350000.00, '2026-09-02 09:00:00', 'COMP-301', NULL),
(13, 1, 2, 1, 'INGRESO', 'Abono de cliente Restaurante El Sabor', 300000.00, '2026-09-06 10:00:00', 'ABN-CXC-001', NULL),
(14, 2, 5, 4, 'INGRESO', 'Abono de cliente Transportes del Norte', 700000.00, '2026-09-06 11:30:00', 'ABN-CXC-002', NULL),
(15, 1, 1, 2, 'GASTO', 'Pago parcial a proveedor Harinas Bogotá', 250000.00, '2026-09-07 12:00:00', 'ABN-CXP-001', NULL),
(16, 3, 6, 8, 'GASTO', 'Pago a proveedor Café de Colombia', 200000.00, '2026-09-07 14:00:00', 'ABN-CXP-002', NULL),
(17, 4, 8, 10, 'INGRESO', 'Abono de Constructora Bogotá', 250000.00, '2026-09-08 09:00:00', 'ABN-CXC-003', NULL),
(18, 4, 8, 11, 'GASTO', 'Pago a Materiales El Constructor', 400000.00, '2026-09-08 16:00:00', 'ABN-CXP-003', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_cuentas_cobrar`
--

CREATE TABLE `pagos_cuentas_cobrar` (
  `id_pago` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `id_cuenta_cobrar` int(10) UNSIGNED NOT NULL,
  `id_cuenta` int(10) UNSIGNED NOT NULL,
  `id_movimiento` int(10) UNSIGNED NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT current_timestamp(),
  `medio_pago` varchar(90) NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagos_cuentas_cobrar`
--

INSERT INTO `pagos_cuentas_cobrar` (`id_pago`, `id_empresa`, `id_cuenta_cobrar`, `id_cuenta`, `id_movimiento`, `monto`, `fecha_pago`, `medio_pago`, `observaciones`) VALUES
(1, 1, 1, 2, 13, 300000.00, '2026-09-06 10:00:00', 'TRANSFERENCIA', NULL),
(2, 2, 3, 5, 14, 700000.00, '2026-09-06 11:30:00', 'TRANSFERENCIA', NULL),
(3, 4, 5, 8, 17, 250000.00, '2026-09-08 09:00:00', 'TRANSFERENCIA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_cuentas_pagar`
--

CREATE TABLE `pagos_cuentas_pagar` (
  `id_pago` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `id_cuenta_pagar` int(10) UNSIGNED NOT NULL,
  `id_cuenta` int(10) UNSIGNED NOT NULL,
  `id_movimiento` int(10) UNSIGNED NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT current_timestamp(),
  `medio_pago` varchar(150) NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagos_cuentas_pagar`
--

INSERT INTO `pagos_cuentas_pagar` (`id_pago`, `id_empresa`, `id_cuenta_pagar`, `id_cuenta`, `id_movimiento`, `monto`, `fecha_pago`, `medio_pago`, `observaciones`) VALUES
(1, 1, 1, 1, 15, 250000.00, '2026-09-07 12:00:00', 'EFECTIVO', NULL),
(2, 3, 4, 6, 16, 200000.00, '2026-09-07 14:00:00', 'EFECTIVO', NULL),
(3, 4, 5, 8, 18, 400000.00, '2026-09-08 16:00:00', 'TRANSFERENCIA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `identificacion` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `estado` varchar(12) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `id_empresa`, `nombre`, `identificacion`, `telefono`, `correo`, `direccion`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 1, 'Harinas Bogotá', '900611111-1', '3151111111', 'ventas@harinasbogota.com', NULL, 'ACTIVO', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(2, 1, 'Distribuciones El Campo', '900622222-2', '3152222222', 'contacto@elcampo.com', NULL, 'ACTIVO', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(3, 2, 'Repuestos Automotrices S.A.S.', '900633333-3', '3153333333', 'ventas@repuestosauto.com', NULL, 'ACTIVO', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(4, 3, 'Café de Colombia S.A.S.', '900644444-4', '3154444444', 'ventas@cafecolombia.com', NULL, 'ACTIVO', '2026-09-13 22:30:17', '2026-09-13 22:30:17'),
(5, 4, 'Materiales El Constructor', '900655555-5', '3155555555', 'ventas@materialesconstructor.com', NULL, 'ACTIVO', '2026-09-13 22:30:17', '2026-09-13 22:30:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`, `descripcion`, `fecha_creacion`) VALUES
(1, 'ADMINISTRADOR', 'Acceso completo a la empresa y sus operaciones.', '2026-09-13 22:30:17'),
(2, 'CONTADOR', 'Consulta y gestión de información contable y financiera.', '2026-09-13 22:30:17'),
(3, 'TESORERO', 'Gestión de cuentas, movimientos y pagos.', '2026-09-13 22:30:17'),
(4, 'CONSULTA', 'Acceso únicamente a información de consulta.', '2026-09-13 22:30:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `estado` varchar(180) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `ultimo_acceso` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `correo`, `contrasena`, `estado`, `fecha_registro`, `ultimo_acceso`, `fecha_actualizacion`) VALUES
(1, 'Administrador FINCORE', 'admin@fincore.local', '$2y$12$sXHa70.0dMBTE1zkTUEg/e.tWzoG5yfBuz4sre25cqb7Up.AdTq5W', 'ACTIVO', '2026-09-13 22:30:17', NULL, '2026-09-13 22:30:17'),
(2, 'María González', 'maria@fincore.local', '$2y$12$sXHa70.0dMBTE1zkTUEg/e.tWzoG5yfBuz4sre25cqb7Up.AdTq5W', 'ACTIVO', '2026-09-13 22:30:17', NULL, '2026-09-13 22:30:17'),
(3, 'Juan Rodríguez', 'juan@fincore.local', '$2y$12$sXHa70.0dMBTE1zkTUEg/e.tWzoG5yfBuz4sre25cqb7Up.AdTq5W', 'ACTIVO', '2026-09-13 22:30:17', NULL, '2026-09-13 22:30:17'),
(4, 'Laura Martínez', 'laura@fincore.local', '$2y$12$sXHa70.0dMBTE1zkTUEg/e.tWzoG5yfBuz4sre25cqb7Up.AdTq5W', 'ACTIVO', '2026-09-13 22:30:17', NULL, '2026-09-13 22:30:17'),
(5, 'Carlos Pérez', 'carlos@fincore.local', '$2y$12$sXHa70.0dMBTE1zkTUEg/e.tWzoG5yfBuz4sre25cqb7Up.AdTq5W', 'ACTIVO', '2026-09-13 22:30:17', NULL, '2026-09-13 22:30:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_empresas`
--

CREATE TABLE `usuarios_empresas` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `id_rol` int(10) UNSIGNED NOT NULL,
  `estado` varchar(90) NOT NULL,
  `fecha_asignacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios_empresas`
--

INSERT INTO `usuarios_empresas` (`id_usuario`, `id_empresa`, `id_rol`, `estado`, `fecha_asignacion`) VALUES
(1, 1, 1, 'ACTIVO', '2026-09-13 22:30:17'),
(1, 2, 1, 'ACTIVO', '2026-09-13 22:30:17'),
(1, 3, 1, 'ACTIVO', '2026-09-13 22:30:17'),
(1, 4, 1, 'ACTIVO', '2026-09-13 22:30:17'),
(2, 1, 2, 'ACTIVO', '2026-09-13 22:30:17'),
(3, 2, 3, 'ACTIVO', '2026-09-13 22:30:17'),
(4, 3, 2, 'ACTIVO', '2026-09-13 22:30:17'),
(5, 4, 3, 'ACTIVO', '2026-09-13 22:30:17');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id_auditoria`),
  ADD KEY `idx_auditoria_empresa_fecha` (`id_empresa`,`fecha_evento`),
  ADD KEY `idx_auditoria_usuario_fecha` (`id_usuario`,`fecha_evento`),
  ADD KEY `idx_auditoria_tabla` (`tabla_afectada`,`id_registro`);

--
-- Indices de la tabla `categorias_financieras`
--
ALTER TABLE `categorias_financieras`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `uq_categoria_empresa_nombre_tipo` (`id_empresa`,`nombre`,`tipo`),
  ADD UNIQUE KEY `uq_categoria_empresa_id` (`id_empresa`,`id_categoria`),
  ADD KEY `idx_categoria_empresa` (`id_empresa`),
  ADD KEY `idx_categoria_tipo` (`tipo`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `uq_cliente_empresa_id` (`id_empresa`,`id_cliente`),
  ADD UNIQUE KEY `uq_cliente_empresa_identificacion` (`id_empresa`,`identificacion`),
  ADD KEY `idx_clientes_empresa` (`id_empresa`),
  ADD KEY `idx_clientes_estado` (`estado`);

--
-- Indices de la tabla `cuentas_financieras`
--
ALTER TABLE `cuentas_financieras`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD UNIQUE KEY `uq_cuenta_empresa_nombre` (`id_empresa`,`nombre`),
  ADD UNIQUE KEY `uq_cuenta_empresa_id` (`id_empresa`,`id_cuenta`),
  ADD KEY `idx_cuentas_empresa` (`id_empresa`),
  ADD KEY `idx_cuentas_estado` (`estado`);

--
-- Indices de la tabla `cuentas_por_cobrar`
--
ALTER TABLE `cuentas_por_cobrar`
  ADD PRIMARY KEY (`id_cuenta_cobrar`),
  ADD UNIQUE KEY `uq_cxc_empresa_id` (`id_empresa`,`id_cuenta_cobrar`),
  ADD UNIQUE KEY `uq_cxc_documento` (`id_empresa`,`numero_documento`),
  ADD KEY `fk_cxc_cliente` (`id_empresa`,`id_cliente`),
  ADD KEY `idx_cxc_cliente` (`id_cliente`),
  ADD KEY `idx_cxc_estado_vencimiento` (`id_empresa`,`estado`,`fecha_vencimiento`);

--
-- Indices de la tabla `cuentas_por_pagar`
--
ALTER TABLE `cuentas_por_pagar`
  ADD PRIMARY KEY (`id_cuenta_pagar`),
  ADD UNIQUE KEY `uq_cxp_empresa_id` (`id_empresa`,`id_cuenta_pagar`),
  ADD UNIQUE KEY `uq_cxp_documento` (`id_empresa`,`numero_documento`),
  ADD KEY `fk_cxp_proveedor` (`id_empresa`,`id_proveedor`),
  ADD KEY `idx_cxp_proveedor` (`id_proveedor`),
  ADD KEY `idx_cxp_estado_vencimiento` (`id_empresa`,`estado`,`fecha_vencimiento`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`),
  ADD UNIQUE KEY `uq_empresas_nit` (`nit`),
  ADD UNIQUE KEY `uq_empresas_correo` (`correo`);

--
-- Indices de la tabla `movimientos_financieros`
--
ALTER TABLE `movimientos_financieros`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `fk_movimiento_cuenta` (`id_empresa`,`id_cuenta`),
  ADD KEY `fk_movimiento_categoria` (`id_empresa`,`id_categoria`),
  ADD KEY `idx_mov_empresa_fecha` (`id_empresa`,`fecha_movimiento`),
  ADD KEY `idx_mov_cuenta_fecha` (`id_cuenta`,`fecha_movimiento`),
  ADD KEY `idx_mov_categoria_fecha` (`id_categoria`,`fecha_movimiento`),
  ADD KEY `idx_mov_tipo_fecha` (`tipo_movimiento`,`fecha_movimiento`);

--
-- Indices de la tabla `pagos_cuentas_cobrar`
--
ALTER TABLE `pagos_cuentas_cobrar`
  ADD PRIMARY KEY (`id_pago`),
  ADD UNIQUE KEY `uq_pago_cxc_movimiento` (`id_movimiento`),
  ADD KEY `fk_pago_cxc_cuenta_cobrar` (`id_empresa`,`id_cuenta_cobrar`),
  ADD KEY `fk_pago_cxc_cuenta_financiera` (`id_empresa`,`id_cuenta`),
  ADD KEY `idx_pago_cxc_documento` (`id_cuenta_cobrar`),
  ADD KEY `idx_pago_cxc_fecha` (`id_empresa`,`fecha_pago`);

--
-- Indices de la tabla `pagos_cuentas_pagar`
--
ALTER TABLE `pagos_cuentas_pagar`
  ADD PRIMARY KEY (`id_pago`),
  ADD UNIQUE KEY `uq_pago_cxp_movimiento` (`id_movimiento`),
  ADD KEY `fk_pago_cxp_cuenta_pagar` (`id_empresa`,`id_cuenta_pagar`),
  ADD KEY `fk_pago_cxp_cuenta_financiera` (`id_empresa`,`id_cuenta`),
  ADD KEY `idx_pago_cxp_documento` (`id_cuenta_pagar`),
  ADD KEY `idx_pago_cxp_fecha` (`id_empresa`,`fecha_pago`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `uq_proveedor_empresa_id` (`id_empresa`,`id_proveedor`),
  ADD UNIQUE KEY `uq_proveedor_empresa_identificacion` (`id_empresa`,`identificacion`),
  ADD KEY `idx_proveedores_empresa` (`id_empresa`),
  ADD KEY `idx_proveedores_estado` (`estado`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `uq_roles_nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `uq_usuarios_correo` (`correo`);

--
-- Indices de la tabla `usuarios_empresas`
--
ALTER TABLE `usuarios_empresas`
  ADD PRIMARY KEY (`id_usuario`,`id_empresa`),
  ADD KEY `idx_ue_empresa` (`id_empresa`),
  ADD KEY `idx_ue_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias_financieras`
--
ALTER TABLE `categorias_financieras`
  MODIFY `id_categoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cuentas_financieras`
--
ALTER TABLE `cuentas_financieras`
  MODIFY `id_cuenta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cuentas_por_cobrar`
--
ALTER TABLE `cuentas_por_cobrar`
  MODIFY `id_cuenta_cobrar` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cuentas_por_pagar`
--
ALTER TABLE `cuentas_por_pagar`
  MODIFY `id_cuenta_pagar` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimientos_financieros`
--
ALTER TABLE `movimientos_financieros`
  MODIFY `id_movimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pagos_cuentas_cobrar`
--
ALTER TABLE `pagos_cuentas_cobrar`
  MODIFY `id_pago` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pagos_cuentas_pagar`
--
ALTER TABLE `pagos_cuentas_pagar`
  MODIFY `id_pago` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `fk_auditoria_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_auditoria_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorias_financieras`
--
ALTER TABLE `categorias_financieras`
  ADD CONSTRAINT `fk_categoria_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_cliente_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuentas_financieras`
--
ALTER TABLE `cuentas_financieras`
  ADD CONSTRAINT `fk_cuenta_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuentas_por_cobrar`
--
ALTER TABLE `cuentas_por_cobrar`
  ADD CONSTRAINT `fk_cxc_cliente` FOREIGN KEY (`id_empresa`,`id_cliente`) REFERENCES `clientes` (`id_empresa`, `id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cxc_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuentas_por_pagar`
--
ALTER TABLE `cuentas_por_pagar`
  ADD CONSTRAINT `fk_cxp_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cxp_proveedor` FOREIGN KEY (`id_empresa`,`id_proveedor`) REFERENCES `proveedores` (`id_empresa`, `id_proveedor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimientos_financieros`
--
ALTER TABLE `movimientos_financieros`
  ADD CONSTRAINT `fk_movimiento_categoria` FOREIGN KEY (`id_empresa`,`id_categoria`) REFERENCES `categorias_financieras` (`id_empresa`, `id_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movimiento_cuenta` FOREIGN KEY (`id_empresa`,`id_cuenta`) REFERENCES `cuentas_financieras` (`id_empresa`, `id_cuenta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movimiento_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos_cuentas_cobrar`
--
ALTER TABLE `pagos_cuentas_cobrar`
  ADD CONSTRAINT `fk_pago_cxc_cuenta_cobrar` FOREIGN KEY (`id_empresa`,`id_cuenta_cobrar`) REFERENCES `cuentas_por_cobrar` (`id_empresa`, `id_cuenta_cobrar`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pago_cxc_cuenta_financiera` FOREIGN KEY (`id_empresa`,`id_cuenta`) REFERENCES `cuentas_financieras` (`id_empresa`, `id_cuenta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pago_cxc_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pago_cxc_movimiento` FOREIGN KEY (`id_movimiento`) REFERENCES `movimientos_financieros` (`id_movimiento`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos_cuentas_pagar`
--
ALTER TABLE `pagos_cuentas_pagar`
  ADD CONSTRAINT `fk_pago_cxp_cuenta_financiera` FOREIGN KEY (`id_empresa`,`id_cuenta`) REFERENCES `cuentas_financieras` (`id_empresa`, `id_cuenta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pago_cxp_cuenta_pagar` FOREIGN KEY (`id_empresa`,`id_cuenta_pagar`) REFERENCES `cuentas_por_pagar` (`id_empresa`, `id_cuenta_pagar`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pago_cxp_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pago_cxp_movimiento` FOREIGN KEY (`id_movimiento`) REFERENCES `movimientos_financieros` (`id_movimiento`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `fk_proveedor_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios_empresas`
--
ALTER TABLE `usuarios_empresas`
  ADD CONSTRAINT `fk_ue_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ue_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ue_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
