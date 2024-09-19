-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-05-2024 a las 19:01:04
-- Versión del servidor: 8.0.35
-- Versión de PHP: 8.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+05:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `catastro`
--

DROP DATABASE catastro;
CREATE DATABASE IF NOT EXISTS catastro;
USE catastro;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_tramites`
--

CREATE TABLE IF NOT EXISTS `detalles_tramites` (
  `id` int NOT NULL,
  `id_tramite` int NOT NULL,
  `id_documento` int NOT NULL,
  `ruta_documento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalles_tramites`
--

INSERT INTO `detalles_tramites` (`id`, `id_tramite`, `id_documento`, `ruta_documento`) VALUES
(1, 1, 1, 'ruta/al/documento1.pdf'),
(2, 1, 2, 'ruta/al/documento2.pdf'),
(3, 1, 3, 'ruta/al/documento3.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE IF NOT EXISTS `documentos` (
  `id` int NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '0',
  `tipo_tramites` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `descripcion`, `estado`, `tipo_tramites`) VALUES
(1, 'Escritura registrada', 0, '[1]'),
(2, 'Certificado libertad', 0, '[1]'),
(3, 'Carta venta', 0, '[1]'),
(4, 'Escritura pública', 0, '[2, 3, 5]'),
(5, 'Plano topográfico', 0, '[2, 3]'),
(6, 'Licencia construcción', 0, '[2, 3]'),
(7, 'Archivos relacionados', 0, '[2, 3, 5]'),
(8, 'Plano ubicación', 0, '[4]'),
(9, 'Medio probatorio', 0, '[4]'),
(10, 'Plano localización', 0, '[5]'),
(11, 'Licencia plano urbanico', 0, '[5]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE IF NOT EXISTS `inmuebles` (
  `id` int NOT NULL,
  `matricula` varchar(30) DEFAULT NULL,
  `numero_predial` varchar(30) DEFAULT NULL,
  `direccion_predio` varchar(50) NOT NULL,
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`id`, `matricula`, `numero_predial`, `direccion_predio`, `id_usuario`) VALUES
(1, '123-456-789', '987-654-321', 'Cll 6 Cra 20 B - 12', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas_pqrs`
--

CREATE TABLE IF NOT EXISTS `respuestas_pqrs` (
  `id` int NOT NULL,
  `id_solicitud` int NOT NULL,
  `respuesta` text,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `respuestas_pqrs`
--

INSERT INTO `respuestas_pqrs` (`id`, `id_solicitud`, `respuesta`, `fecha`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', '2024-05-23 18:10:40'),
(2, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.', '2024-05-23 18:10:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_pqrs`
--

CREATE TABLE IF NOT EXISTS `solicitudes_pqrs` (
  `id` int NOT NULL,
  `tipo_solicitud` varchar(50) NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `solicitudes_pqrs`
--

INSERT INTO `solicitudes_pqrs` (`id`, `tipo_solicitud`, `id_usuario`, `fecha`, `descripcion`) VALUES
(1, 'PETICION', 1, '2024-05-23 05:00:00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.\n'),
(2, 'QUEJA', 1, '2024-05-23 17:45:55', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.'),
(3, 'RECLAMO', 1, '2024-05-23 17:45:55', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.'),
(4, 'SUGERENCIA', 1, '2024-05-23 17:46:34', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

CREATE TABLE IF NOT EXISTS `tipo_documentos` (
  `id` int NOT NULL,
  `prefijo` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo_documentos`
--

INSERT INTO `tipo_documentos` (`id`, `prefijo`, `descripcion`) VALUES
(1, 'CC', 'Cédula de ciudadanía');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_tramites`
--

CREATE TABLE IF NOT EXISTS `tipo_tramites` (
  `id` int NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo_tramites`
--

INSERT INTO `tipo_tramites` (`id`, `descripcion`) VALUES
(1, 'Cambio de Propietario'),
(2, 'Englobe'),
(3, 'Desenglobe'),
(4, 'Incorporación Mejora'),
(5, 'Incorporación RPH');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tramites`
--

CREATE TABLE IF NOT EXISTS `tramites` (
  `id` int NOT NULL,
  `id_tipo_tramite` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tramites`
--

INSERT INTO `tramites` (`id`, `id_tipo_tramite`, `id_usuario`, `fecha`, `estado`) VALUES
(1, 1, 1, '2024-05-23 18:10:40', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL,
  `id_tipo_documento` int NOT NULL,
  `numero_documento` varchar(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `contrasena` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_tipo_documento`, `numero_documento`, `nombre`, `telefono`, `correo`, `contrasena`) VALUES
(1, 1, '123456789', 'Jorge Perez', '3114133235', 'jorge.perez@example.com', 'password');

-- --------------------------------------------------------

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalles_tramites`
--
ALTER TABLE `detalles_tramites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tramite` (`id_tramite`),
  ADD KEY `id_documento` (`id_documento`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `respuestas_pqrs`
--
ALTER TABLE `respuestas_pqrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_solicitud` (`id_solicitud`);

--
-- Indices de la tabla `solicitudes_pqrs`
--
ALTER TABLE `solicitudes_pqrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_tramites`
--
ALTER TABLE `tipo_tramites`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tramites`
--
ALTER TABLE `tramites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_tramite` (`id_tipo_tramite`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_documento` (`id_tipo_documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalles_tramites`
--
ALTER TABLE `detalles_tramites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `respuestas_pqrs`
--
ALTER TABLE `respuestas_pqrs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes_pqrs`
--
ALTER TABLE `solicitudes_pqrs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_tramites`
--
ALTER TABLE `tipo_tramites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tramites`
--
ALTER TABLE `tramites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_tramites`
--
ALTER TABLE `detalles_tramites`
  ADD CONSTRAINT `detalles_tramites_ibfk_1` FOREIGN KEY (`id_tramite`) REFERENCES `tramites` (`id`),
  ADD CONSTRAINT `detalles_tramites_ibfk_2` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`);

--
-- Filtros para la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD CONSTRAINT `inmuebles_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `respuestas_pqrs`
--
ALTER TABLE `respuestas_pqrs`
  ADD CONSTRAINT `respuestas_pqrs_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes_pqrs` (`id`);

--
-- Filtros para la tabla `solicitudes_pqrs`
--
ALTER TABLE `solicitudes_pqrs`
  ADD CONSTRAINT `solicitudes_pqrs_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `tramites`
--
ALTER TABLE `tramites`
  ADD CONSTRAINT `tramites_ibfk_1` FOREIGN KEY (`id_tipo_tramite`) REFERENCES `tipo_tramites` (`id`),
  ADD CONSTRAINT `tramites_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documentos` (`id`);
COMMIT;

--
-- CONSULTAS
--

--
-- Datos de los usuarios
--
CREATE VIEW datos_usuarios AS
SELECT td.prefijo, u.numero_documento, u.nombre, u.correo
FROM usuarios AS u
JOIN tipo_documentos AS td
ON u.id_tipo_documento = td.id;

--
-- Datos de los inmuebles de un usuario
--
CREATE VIEW datos_inmueble AS
SELECT i.id, i.direccion_predio, u.nombre
FROM inmuebles AS i
JOIN usuarios AS u
ON i.id_usuario = u.id
WHERE u.id = 1;

--
-- Datos de las solicitudes del usuario
--
CREATE VIEW solicitudes_usuario AS
SELECT id, tipo_solicitud, descripcion, fecha
FROM solicitudes_pqrs
WHERE id_usuario = 1;

--
-- Datos de las respuestas del usuario a las solicitudes
--
CREATE VIEW respuestas_usuario AS
SELECT s.id, s.tipo_solicitud, r.respuesta
FROM solicitudes_pqrs AS s
JOIN respuestas_pqrs AS r
ON s.id = r.id_solicitud
WHERE s.id_usuario = 1;

--
-- Datos del documentos de trámites de un usuario
--
CREATE VIEW documentos_tramite_usuario AS
SELECT dt.ruta_documento, d.descripcion
FROM detalles_tramites AS dt
JOIN documentos AS d ON dt.id_documento = d.id
JOIN tramites AS t ON dt.id_tramite = t.id
JOIN usuarios AS u ON t.id_usuario = u.id
WHERE t.id_usuario = 1;

--
-- Datos de los detalles del trámite de un usuario
--
CREATE VIEW detalles_tramites_usuario AS
SELECT t.id, tt.descripcion, t.fecha, t.estado
FROM tramites AS t
JOIN tipo_tramites AS tt ON t.id_tipo_tramite = tt.id
JOIN usuarios AS u ON t.id_usuario = u.id
WHERE t.id_usuario = 1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
