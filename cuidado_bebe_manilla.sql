-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2025 a las 00:31:11
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
-- Base de datos: `cuidado_bebe_manilla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerta`
--

CREATE TABLE `alerta` (
  `id_alerta` int(11) NOT NULL,
  `id_bebe` int(11) NOT NULL,
  `id_lectura` int(11) DEFAULT NULL,
  `tipo` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_hora` datetime NOT NULL,
  `leida` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alerta`
--

INSERT INTO `alerta` (`id_alerta`, `id_bebe`, `id_lectura`, `tipo`, `descripcion`, `fecha_hora`, `leida`) VALUES
(1, 1, 1, 'Alto ritmo cardiaco', 'Frecuencia cardiaca elevada.', '2024-05-01 08:16:00', 0),
(2, 2, 3, 'Riesgo', 'Posible taquicardia.', '2024-05-01 09:01:00', 0),
(3, 3, 4, 'Oxigenación baja', 'Disminución de SpO2.', '2024-05-01 10:46:00', 1),
(4, 4, 5, 'Temperatura alta', 'Fiebre detectada.', '2024-05-01 11:11:00', 0),
(5, 5, NULL, 'Batería baja', 'Manilla con carga <20%.', '2024-05-01 12:00:00', 0),
(6, 6, 7, 'Alerta crítica', 'Riesgo respiratorio.', '2024-05-01 12:23:00', 1),
(7, 7, 8, 'Oxigenación baja', 'Bajo nivel de O2.', '2024-05-01 13:01:00', 0),
(8, 8, 9, 'Temperatura estable', 'Todo en orden.', '2024-05-01 14:11:00', 1),
(9, 9, 10, 'Peligro', 'Frecuencia cardiaca muy elevada.', '2024-05-01 15:01:00', 0),
(10, 10, NULL, 'Sin señal', 'Manilla desconectada.', '2024-05-01 15:30:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebe`
--

CREATE TABLE `bebe` (
  `id_bebe` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `peso_kg` decimal(5,2) DEFAULT NULL,
  `altura_cm` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bebe`
--

INSERT INTO `bebe` (`id_bebe`, `id_usuario`, `nombre`, `fecha_nacimiento`, `sexo`, `peso_kg`, `altura_cm`) VALUES
(1, 1, 'Sofía', '2024-01-10', 'F', 3.20, 49.50),
(2, 2, 'Mateo', '2023-12-05', 'M', 3.50, 50.20),
(3, 3, 'Valentina', '2024-02-20', 'F', 3.10, 48.80),
(4, 4, 'Samuel', '2024-03-01', 'M', 3.30, 49.00),
(5, 5, 'Isabella', '2023-11-28', 'F', 3.00, 48.00),
(6, 6, 'Emilio', '2024-02-15', 'M', 3.40, 50.10),
(7, 7, 'Lucía', '2023-12-18', 'F', 3.20, 49.30),
(8, 8, 'Diego', '2024-01-25', 'M', 3.60, 51.00),
(9, 9, 'Renata', '2024-03-10', 'F', 3.10, 48.60),
(10, 10, 'Tomás', '2024-02-05', 'M', 3.40, 50.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `firmware`
--

CREATE TABLE `firmware` (
  `id_firmware` int(11) NOT NULL,
  `version` varchar(20) NOT NULL,
  `fecha_lanzamiento` date DEFAULT NULL,
  `notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `firmware`
--

INSERT INTO `firmware` (`id_firmware`, `version`, `fecha_lanzamiento`, `notas`) VALUES
(1, '1.0.0', '2024-01-01', 'Versión inicial estable.'),
(2, '1.1.0', '2024-02-10', 'Mejoras en lectura de sensores.'),
(3, '1.2.0', '2024-03-05', 'Corrección de bugs.'),
(4, '1.3.0', '2024-03-25', 'Optimización del consumo de batería.'),
(5, '2.0.0', '2024-04-01', 'Actualización mayor con nuevos sensores.'),
(6, '2.1.0', '2024-04-20', 'Compatibilidad ampliada.'),
(7, '2.2.0', '2024-05-05', 'Mejoras de estabilidad.'),
(8, '2.3.0', '2024-05-25', 'Mejoras en seguridad.'),
(9, '2.4.0', '2024-06-10', 'Optimización de sincronización.'),
(10, '3.0.0', '2024-07-01', 'Nueva arquitectura de firmware.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_medico`
--

CREATE TABLE `historial_medico` (
  `id_historial` int(11) NOT NULL,
  `id_bebe` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL,
  `medico` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_medico`
--

INSERT INTO `historial_medico` (`id_historial`, `id_bebe`, `descripcion`, `fecha`, `medico`) VALUES
(1, 1, 'Revisión general, todo normal.', '2024-03-01', 'Dra. Gómez'),
(2, 2, 'Control de crecimiento.', '2024-02-15', 'Dr. Pérez'),
(3, 3, 'Seguimiento respiratorio.', '2024-03-10', 'Dra. Ramírez'),
(4, 4, 'Chequeo cardiaco.', '2024-01-30', 'Dr. Torres'),
(5, 5, 'Vacunación.', '2024-02-01', 'Dra. López'),
(6, 6, 'Posible alergia.', '2024-03-15', 'Dr. Jiménez'),
(7, 7, 'Revisión de oído.', '2024-02-20', 'Dra. Ortiz'),
(8, 8, 'Consulta por tos.', '2024-03-18', 'Dr. Pérez'),
(9, 9, 'Evaluación de sueño.', '2024-04-01', 'Dra. Rojas'),
(10, 10, 'Revisión nutricional.', '2024-03-25', 'Dr. Andrade');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lectura_signos`
--

CREATE TABLE `lectura_signos` (
  `id_lectura` int(11) NOT NULL,
  `id_manilla` int(11) NOT NULL,
  `id_sensor` int(11) NOT NULL,
  `valor` decimal(8,3) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `sincronizado` tinyint(1) NOT NULL DEFAULT 0,
  `indice_critico` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lectura_signos`
--

INSERT INTO `lectura_signos` (`id_lectura`, `id_manilla`, `id_sensor`, `valor`, `fecha_hora`, `sincronizado`, `indice_critico`) VALUES
(1, 1, 1, 132.000, '2024-05-01 08:15:00', 1, 0),
(2, 1, 2, 36.800, '2024-05-01 08:15:05', 1, 0),
(3, 2, 1, 150.000, '2024-05-01 09:00:10', 0, 1),
(4, 3, 3, 97.000, '2024-05-01 10:45:00', 1, 0),
(5, 4, 2, 38.500, '2024-05-01 11:10:33', 1, 1),
(6, 5, 6, 35.000, '2024-05-01 12:20:15', 0, 0),
(7, 6, 1, 145.000, '2024-05-01 12:22:00', 1, 1),
(8, 7, 3, 92.000, '2024-05-01 13:00:00', 1, 0),
(9, 8, 2, 37.200, '2024-05-01 14:10:10', 1, 0),
(10, 9, 1, 170.000, '2024-05-01 15:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manilla`
--

CREATE TABLE `manilla` (
  `id_manilla` int(11) NOT NULL,
  `codigo_serial` varchar(50) NOT NULL,
  `id_bebe` int(11) NOT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `fecha_vinculacion` date DEFAULT NULL,
  `bateria_porcentaje` int(11) DEFAULT NULL,
  `id_firmware` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `manilla`
--

INSERT INTO `manilla` (`id_manilla`, `codigo_serial`, `id_bebe`, `modelo`, `fecha_vinculacion`, `bateria_porcentaje`, `id_firmware`, `activo`) VALUES
(1, 'MNL-0001', 1, 'M1-Pro', '2024-02-01', 85, 1, 1),
(2, 'MNL-0002', 2, 'M1-Pro', '2024-02-08', 90, 2, 1),
(3, 'MNL-0003', 3, 'M2-Lite', '2024-03-01', 77, 3, 1),
(4, 'MNL-0004', 4, 'M2-Lite', '2024-03-10', 60, 4, 1),
(5, 'MNL-0005', 5, 'M3-Ultra', '2024-02-20', 95, 5, 1),
(6, 'MNL-0006', 6, 'M3-Ultra', '2024-03-05', 88, 6, 1),
(7, 'MNL-0007', 7, 'M1-Pro', '2024-04-01', 72, 7, 1),
(8, 'MNL-0008', 8, 'M2-Lite', '2024-04-12', 93, 8, 1),
(9, 'MNL-0009', 9, 'M3-Ultra', '2024-05-01', 66, 9, 1),
(10, 'MNL-0010', 10, 'M1-Pro', '2024-05-10', 58, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_sensor`
--

CREATE TABLE `tipo_sensor` (
  `id_sensor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `unidad` varchar(20) DEFAULT NULL,
  `rango_min` decimal(8,3) DEFAULT NULL,
  `rango_max` decimal(8,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_sensor`
--

INSERT INTO `tipo_sensor` (`id_sensor`, `nombre`, `unidad`, `rango_min`, `rango_max`) VALUES
(1, 'Frecuencia cardiaca', 'bpm', 60.000, 200.000),
(2, 'Temperatura corporal', '°C', 30.000, 45.000),
(3, 'Oxigenación', '%SpO2', 50.000, 100.000),
(4, 'Movimiento', 'g', 0.000, 16.000),
(5, 'Sueño', 'nivel', 0.000, 5.000),
(6, 'Respiración', 'rpm', 10.000, 80.000),
(7, 'Ruido ambiental', 'dB', 0.000, 150.000),
(8, 'Humedad piel', '%', 0.000, 100.000),
(9, 'Presión arterial', 'mmHg', 40.000, 200.000),
(10, 'Temperatura ambiente', '°C', 0.000, 60.000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `telefono`, `correo`, `password_hash`, `Email`) VALUES
(1, 'Laura Gómez', '3001234567', 'laura.gomez@example.com', 'hash1', ''),
(2, 'Carlos Méndez', '3007654321', 'carlos.mendez@example.com', 'hash2', ''),
(3, 'Ana Ramírez', '3165554433', 'ana.ramirez@example.com', 'hash3', ''),
(4, 'Javier Torres', '3149876543', 'javier.torres@example.com', 'hash4', ''),
(5, 'María López', '3012223344', 'maria.lopez@example.com', 'hash5', ''),
(6, 'Pedro Jiménez', '3154445566', 'pedro.jimenez@example.com', 'hash6', ''),
(7, 'Sandra Ortiz', '3208889999', 'sandra.ortiz@example.com', 'hash7', ''),
(8, 'José Pérez', '3131112222', 'jose.perez@example.com', 'hash8', ''),
(9, 'Camila Rojas', '3009090808', 'camila.rojas@example.com', 'hash9', ''),
(10, 'Felipe Andrade', '3021010101', 'felipe.andrade@example.com', 'hash10', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alerta`
--
ALTER TABLE `alerta`
  ADD PRIMARY KEY (`id_alerta`),
  ADD KEY `fk_alerta_bebe` (`id_bebe`),
  ADD KEY `fk_alerta_lectura` (`id_lectura`);

--
-- Indices de la tabla `bebe`
--
ALTER TABLE `bebe`
  ADD PRIMARY KEY (`id_bebe`),
  ADD KEY `idx_bebe_id_usuario` (`id_usuario`);

--
-- Indices de la tabla `firmware`
--
ALTER TABLE `firmware`
  ADD PRIMARY KEY (`id_firmware`);

--
-- Indices de la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `fk_historial_bebe` (`id_bebe`);

--
-- Indices de la tabla `lectura_signos`
--
ALTER TABLE `lectura_signos`
  ADD PRIMARY KEY (`id_lectura`),
  ADD KEY `fk_lectura_manilla` (`id_manilla`),
  ADD KEY `fk_lectura_sensor` (`id_sensor`);

--
-- Indices de la tabla `manilla`
--
ALTER TABLE `manilla`
  ADD PRIMARY KEY (`id_manilla`),
  ADD UNIQUE KEY `codigo_serial` (`codigo_serial`),
  ADD KEY `fk_manilla_bebe` (`id_bebe`),
  ADD KEY `fk_manilla_firmware` (`id_firmware`);

--
-- Indices de la tabla `tipo_sensor`
--
ALTER TABLE `tipo_sensor`
  ADD PRIMARY KEY (`id_sensor`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `idx_usuario_correo` (`correo`),
  ADD KEY `idx_usuario_email` (`Email`),
  ADD KEY `idx_usuario_nombre` (`nombre`),
  ADD KEY `idx_usuario_telefono` (`telefono`),
  ADD KEY `idx_usuario_nombre_correo` (`nombre`,`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alerta`
--
ALTER TABLE `alerta`
  MODIFY `id_alerta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `bebe`
--
ALTER TABLE `bebe`
  MODIFY `id_bebe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `firmware`
--
ALTER TABLE `firmware`
  MODIFY `id_firmware` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `lectura_signos`
--
ALTER TABLE `lectura_signos`
  MODIFY `id_lectura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `manilla`
--
ALTER TABLE `manilla`
  MODIFY `id_manilla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipo_sensor`
--
ALTER TABLE `tipo_sensor`
  MODIFY `id_sensor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alerta`
--
ALTER TABLE `alerta`
  ADD CONSTRAINT `fk_alerta_bebe` FOREIGN KEY (`id_bebe`) REFERENCES `bebe` (`id_bebe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_alerta_lectura` FOREIGN KEY (`id_lectura`) REFERENCES `lectura_signos` (`id_lectura`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `bebe`
--
ALTER TABLE `bebe`
  ADD CONSTRAINT `fk_bebe_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  ADD CONSTRAINT `fk_historial_bebe` FOREIGN KEY (`id_bebe`) REFERENCES `bebe` (`id_bebe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lectura_signos`
--
ALTER TABLE `lectura_signos`
  ADD CONSTRAINT `fk_lectura_manilla` FOREIGN KEY (`id_manilla`) REFERENCES `manilla` (`id_manilla`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lectura_sensor` FOREIGN KEY (`id_sensor`) REFERENCES `tipo_sensor` (`id_sensor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `manilla`
--
ALTER TABLE `manilla`
  ADD CONSTRAINT `fk_manilla_bebe` FOREIGN KEY (`id_bebe`) REFERENCES `bebe` (`id_bebe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_manilla_firmware` FOREIGN KEY (`id_firmware`) REFERENCES `firmware` (`id_firmware`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
