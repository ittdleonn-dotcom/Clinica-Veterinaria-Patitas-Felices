-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-05-2026 a las 01:37:28
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
-- Base de datos: `patitasfelices`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cirugias`
--

CREATE TABLE `cirugias` (
  `id_cirugia` int(11) NOT NULL,
  `tipo_cirugia` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `id_mascota` int(11) DEFAULT NULL,
  `id_veterinario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cirugias`
--

INSERT INTO `cirugias` (`id_cirugia`, `tipo_cirugia`, `fecha`, `observaciones`, `costo`, `id_mascota`, `id_veterinario`) VALUES
(1, 'Esterilización', '2026-04-22', 'Sin complicaciones', 2500.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `id_mascota` int(11) DEFAULT NULL,
  `id_veterinario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `fecha`, `hora`, `motivo`, `estado`, `id_mascota`, `id_veterinario`) VALUES
(1, '2026-04-20', '10:00:00', 'Vacunación', NULL, NULL, NULL),
(2, '2026-04-20', '11:30:00', 'Consulta general', NULL, NULL, NULL),
(3, '2026-04-21', '09:30:00', 'Desparasitación', NULL, NULL, NULL),
(4, '2026-04-21', '13:00:00', 'Revisión', NULL, NULL, NULL),
(5, '2026-04-22', '15:00:00', 'Cirugía', NULL, NULL, NULL),
(6, '2026-04-27', '10:00:00', 'Vacuna refuerzo', NULL, NULL, NULL),
(7, '2026-04-28', '11:00:00', 'Revisión postoperatoria', NULL, NULL, NULL),
(8, '2026-04-29', '12:30:00', 'Consulta digestiva', NULL, NULL, NULL),
(9, '2026-04-30', '09:00:00', 'Control dermatológico', NULL, NULL, NULL),
(10, '2026-05-01', '14:00:00', 'Vacunación anual', NULL, NULL, NULL),
(11, '2026-03-18', '10:30:00', 'Vacuna', NULL, NULL, NULL),
(12, '2026-03-20', '13:00:00', 'Consulta', NULL, NULL, NULL),
(13, '2026-03-25', '09:30:00', 'Control', NULL, NULL, NULL),
(14, '2026-04-02', '10:00:00', 'Consulta', NULL, NULL, NULL),
(15, '2026-04-05', '11:00:00', 'Vacunación', NULL, NULL, NULL),
(16, '2026-03-18', '10:30:00', 'Vacuna', NULL, NULL, NULL),
(17, '2026-03-20', '13:00:00', 'Consulta', NULL, NULL, NULL),
(18, '2026-03-25', '09:30:00', 'Control', NULL, NULL, NULL),
(19, '2026-05-05', '15:00:00', 'Consulta', NULL, NULL, NULL),
(20, '2026-04-06', '16:00:00', 'Vacunación', NULL, NULL, NULL),
(21, '2026-05-20', NULL, NULL, 'Proxima', 4, NULL),
(22, '2026-05-13', NULL, NULL, 'Proxima', 11, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `telefono`, `correo`, `direccion`) VALUES
(1, 'Sebastian García', '', '8112345678', NULL, 'San Nicolas'),
(2, 'Lucia Martínez', '', '8123456789', NULL, 'Monterrey'),
(3, 'Azael Torres', '', '8187654321', NULL, 'Escobedo'),
(4, 'Mauricio Ruiz', '', '8111122233', NULL, 'San Nicolas'),
(5, 'Gael Díaz', '', '8199988877', NULL, 'Apodaca'),
(6, 'Roberto Gómez León', '', '8188889999', NULL, 'Escobedo'),
(7, 'Fernanda Castillo Vega', '', '8112233445', NULL, 'Escobedo'),
(8, 'Luis Herrera Cruz', '', '8122221111', NULL, 'Cumbres'),
(9, 'Daniela Flores Soto', '', '8115556677', NULL, 'San Nicolás'),
(10, 'Miguel Ángel Reyes', '', '8184443322', NULL, 'San Nicolas'),
(11, 'Roberto Gómez', '', '8188889999', NULL, 'Escobedo'),
(12, 'Fernanda Castillo', '', '8112233445', NULL, 'Escobedo'),
(13, 'Luis Herrera', '', '8122221111', NULL, 'Cumbres'),
(14, 'Daniela Flores', '', '8115556677', NULL, 'San Nicolás'),
(15, 'Miguel Ángel', '', '8184443322', NULL, 'San Nicolas'),
(16, 'Patricia Navarro Ruiz', '', '8113344556', NULL, 'Escobedo'),
(17, 'Jorge Medina Salas', '', '8182233445', NULL, 'San Nicolas'),
(18, 'Alejandra Ponce Lara', '', '8129988776', NULL, 'Escobedo'),
(19, 'Ricardo Valdez Moreno', '', '8187766554', NULL, 'San Nicolas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas_medicas`
--

CREATE TABLE `consultas_medicas` (
  `id_consulta` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `motivo_consulta` varchar(200) DEFAULT NULL,
  `diagnostico` varchar(200) DEFAULT NULL,
  `tratamiento` varchar(200) DEFAULT NULL,
  `id_mascota` int(11) DEFAULT NULL,
  `id_veterinario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `consultas_medicas`
--

INSERT INTO `consultas_medicas` (`id_consulta`, `fecha`, `motivo_consulta`, `diagnostico`, `tratamiento`, `id_mascota`, `id_veterinario`) VALUES
(1, '2026-04-20', 'Tos', 'Infección respiratoria', 'Antibiótico 7 días', 5, NULL),
(2, '2026-04-20', 'Falta de apetito', 'Gastritis', 'Dieta blanda', NULL, NULL),
(3, '2026-04-21', 'Picazón', 'Dermatitis', 'Shampoo medicado', NULL, NULL),
(4, '2026-04-21', 'Control anual', 'Sana', 'Vitaminas', NULL, NULL),
(5, '2026-03-20', 'Vómito', 'Gastritis', 'Dieta blanda', NULL, NULL),
(6, '2026-03-25', 'Control', 'Saludable', 'Vitaminas', NULL, NULL),
(7, '2026-04-02', 'Cojera', 'Inflamación', 'Antiinflamatorio', NULL, NULL),
(8, '2026-04-05', 'Vacuna', 'Preventivo', 'Aplicación vacuna', NULL, NULL),
(9, '2026-03-18', 'Vacuna', 'Preventivo', 'Aplicación vacuna', NULL, NULL),
(10, '2026-03-20', 'Vómito', 'Gastritis', 'Dieta blanda', NULL, NULL),
(11, '2026-03-25', 'Control', 'Saludable', 'Vitaminas', NULL, NULL),
(12, '2026-04-02', 'Cojera', 'Inflamación', 'Antiinflamatorio', NULL, NULL),
(13, '2026-04-05', 'Vacuna', 'Preventivo', 'Aplicación vacuna', NULL, NULL),
(14, '2026-03-18', 'Vacuna', 'Preventivo', 'Aplicación vacuna', NULL, NULL),
(15, '2026-05-13', 'tos', 'infeccion', 'vacuna', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desparasitacion`
--

CREATE TABLE `desparasitacion` (
  `id_desparasitacion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `producto_usado` varchar(100) DEFAULT NULL,
  `dosis` varchar(50) DEFAULT NULL,
  `id_mascota` int(11) DEFAULT NULL,
  `id_veterinario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `desparasitacion`
--

INSERT INTO `desparasitacion` (`id_desparasitacion`, `fecha`, `producto_usado`, `dosis`, `id_mascota`, `id_veterinario`) VALUES
(1, '2026-04-21', 'Drontal Plus', '1 tableta', NULL, NULL),
(2, '2026-04-01', 'Simparica', '1 tableta 20mg', NULL, NULL),
(3, '2026-04-05', 'NexGard', '1 tableta', NULL, NULL),
(4, '2026-04-08', 'Drontal', '1 tableta', NULL, NULL),
(5, '2026-04-12', 'Profender', '1 pipeta', NULL, NULL),
(6, '2026-04-19', 'Simparica', '1 tableta', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id_mascota` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `especie` varchar(30) DEFAULT NULL,
  `raza` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id_mascota`, `nombre`, `especie`, `raza`, `edad`, `id_cliente`) VALUES
(1, 'Lilo', 'Perro', 'Labrador', 5, 1),
(2, 'Michi', 'Gato', 'Siamés', 3, 2),
(3, 'Rorro', 'Perro', 'Chihuahua', 2, 3),
(4, 'Naila', 'Gato', 'Persa', 4, 4),
(5, 'Toby', 'Perro', 'Poodle', 6, 5),
(6, 'Zeus', 'Perro', 'Husky', 3, 6),
(7, 'Mila', 'Gato', 'Bengalí', 1, 7),
(8, 'Bruno', 'Perro', 'Pastor Alemán', 7, 8),
(9, 'Kira', 'Perro', 'Golden Retriever', 4, 9),
(10, 'Simón', 'Gato', 'Europeo', 2, 10),
(11, 'Coco', 'Perro', 'Beagle', 2, 11),
(12, 'Pelusa', 'Gato', 'Angora', 3, 12),
(13, 'Thor', 'Perro', 'Doberman', 4, 13),
(14, 'Mía', 'Gato', 'Carey', 1, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `tipo_producto` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `tipo_producto`, `precio`, `stock`) VALUES
(1, 'Croquetas Premium', 'Alimento', 850.00, 20),
(2, 'NexGard', 'Antipulgas', 320.00, 15),
(3, 'Shampoo Medicado', 'Higiene', 180.00, 10),
(4, 'Antibiótico Vet', 'Medicamento', 250.00, 25),
(5, 'Arena para gato', 'Higiene', 150.00, 30),
(6, 'NexGard', 'Antipulgas', 320.00, 15),
(7, 'Vitaminas Pet', 'Suplemento', 200.00, 18),
(8, 'Antibiótico Vet', 'Medicamento', 250.00, 25),
(9, 'Croquetas Premium', 'Alimento', 850.00, 20),
(10, 'NexGard', 'Antipulgas', 320.00, 15),
(11, 'Vitaminas Pet', 'Suplemento', 200.00, 18),
(12, 'Antibiótico Vet', 'Medicamento', 250.00, 25),
(13, 'Croquetas Premium', 'Alimento', 850.00, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunacion`
--

CREATE TABLE `vacunacion` (
  `id_vacunacion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_mascota` int(11) DEFAULT NULL,
  `id_vacuna` int(11) DEFAULT NULL,
  `id_veterinario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `vacunacion`
--

INSERT INTO `vacunacion` (`id_vacunacion`, `fecha`, `id_mascota`, `id_vacuna`, `id_veterinario`) VALUES
(1, '2026-04-20', NULL, NULL, NULL),
(2, '2026-04-18', NULL, NULL, NULL),
(3, '2026-03-18', NULL, NULL, NULL),
(4, '2026-04-05', NULL, NULL, NULL),
(5, '2026-03-22', NULL, NULL, NULL),
(6, '2026-03-28', NULL, NULL, NULL),
(7, '2026-04-18', NULL, NULL, NULL),
(8, '2026-03-18', NULL, NULL, NULL),
(9, '2026-04-05', NULL, NULL, NULL),
(10, '2026-03-22', NULL, NULL, NULL),
(11, '2026-03-28', NULL, NULL, NULL),
(12, '2026-05-07', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunas`
--

CREATE TABLE `vacunas` (
  `id_vacuna` int(11) NOT NULL,
  `nombre_vacuna` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `vacunas`
--

INSERT INTO `vacunas` (`id_vacuna`, `nombre_vacuna`, `descripcion`, `precio`) VALUES
(1, 'Rabia', 'Prevención contra rabia', 250.00),
(2, 'Múltiple Canina', 'Protección integral perros', 450.00),
(3, 'Triple Felina', 'Vacuna básica felina', 400.00),
(4, 'Bordetella', 'Prevención tos perrera', 300.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `fecha`, `cantidad`, `total`, `id_producto`, `id_cliente`) VALUES
(1, '2026-04-20', 1, 320.00, NULL, NULL),
(2, '2026-04-20', 1, 850.00, NULL, NULL),
(3, '2026-04-21', 1, 180.00, NULL, NULL),
(4, '2026-04-22', 1, 250.00, NULL, NULL),
(5, '2026-04-22', 1, 150.00, NULL, NULL),
(6, '2026-03-18', 1, 150.00, NULL, NULL),
(7, '2026-03-25', 1, 200.00, NULL, NULL),
(8, '2026-04-05', 1, 250.00, NULL, NULL),
(9, '2026-04-08', 1, 120.00, NULL, NULL),
(10, '2026-04-18', 1, 850.00, NULL, NULL),
(11, '2026-03-18', 1, 150.00, NULL, NULL),
(12, '2026-03-25', 1, 200.00, NULL, NULL),
(13, '2026-04-05', 1, 250.00, NULL, NULL),
(14, '2026-04-08', 1, 120.00, NULL, NULL),
(15, '2026-04-18', 1, 850.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinarios`
--

CREATE TABLE `veterinarios` (
  `id_veterinario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `veterinarios`
--

INSERT INTO `veterinarios` (`id_veterinario`, `nombre`, `especialidad`, `telefono`, `correo`) VALUES
(1, 'Dr. Luis Ramírez', 'Medicina General', '8110001111', NULL),
(2, 'Dra. Sofía Morales', 'Cirugía', '8112223333', NULL),
(3, 'Dr. Pedro Castillo', 'Dermatología Veterinaria', '8188887777', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cirugias`
--
ALTER TABLE `cirugias`
  ADD PRIMARY KEY (`id_cirugia`),
  ADD KEY `id_mascota` (`id_mascota`),
  ADD KEY `id_veterinario` (`id_veterinario`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_mascota` (`id_mascota`),
  ADD KEY `id_veterinario` (`id_veterinario`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `consultas_medicas`
--
ALTER TABLE `consultas_medicas`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `id_mascota` (`id_mascota`),
  ADD KEY `id_veterinario` (`id_veterinario`);

--
-- Indices de la tabla `desparasitacion`
--
ALTER TABLE `desparasitacion`
  ADD PRIMARY KEY (`id_desparasitacion`),
  ADD KEY `id_mascota` (`id_mascota`),
  ADD KEY `id_veterinario` (`id_veterinario`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id_mascota`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `vacunacion`
--
ALTER TABLE `vacunacion`
  ADD PRIMARY KEY (`id_vacunacion`),
  ADD KEY `id_mascota` (`id_mascota`),
  ADD KEY `id_vacuna` (`id_vacuna`),
  ADD KEY `id_veterinario` (`id_veterinario`);

--
-- Indices de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD PRIMARY KEY (`id_vacuna`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `veterinarios`
--
ALTER TABLE `veterinarios`
  ADD PRIMARY KEY (`id_veterinario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cirugias`
--
ALTER TABLE `cirugias`
  MODIFY `id_cirugia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `consultas_medicas`
--
ALTER TABLE `consultas_medicas`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `desparasitacion`
--
ALTER TABLE `desparasitacion`
  MODIFY `id_desparasitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id_mascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `vacunacion`
--
ALTER TABLE `vacunacion`
  MODIFY `id_vacunacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  MODIFY `id_vacuna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `veterinarios`
--
ALTER TABLE `veterinarios`
  MODIFY `id_veterinario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cirugias`
--
ALTER TABLE `cirugias`
  ADD CONSTRAINT `cirugias_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`),
  ADD CONSTRAINT `cirugias_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id_veterinario`);

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id_veterinario`);

--
-- Filtros para la tabla `consultas_medicas`
--
ALTER TABLE `consultas_medicas`
  ADD CONSTRAINT `consultas_medicas_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`),
  ADD CONSTRAINT `consultas_medicas_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id_veterinario`);

--
-- Filtros para la tabla `desparasitacion`
--
ALTER TABLE `desparasitacion`
  ADD CONSTRAINT `desparasitacion_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`),
  ADD CONSTRAINT `desparasitacion_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id_veterinario`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `vacunacion`
--
ALTER TABLE `vacunacion`
  ADD CONSTRAINT `vacunacion_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`),
  ADD CONSTRAINT `vacunacion_ibfk_2` FOREIGN KEY (`id_vacuna`) REFERENCES `vacunas` (`id_vacuna`),
  ADD CONSTRAINT `vacunacion_ibfk_3` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id_veterinario`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
