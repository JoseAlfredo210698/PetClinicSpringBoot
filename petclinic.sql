-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2019 a las 22:58:59
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `petclinic`
--
CREATE DATABASE IF NOT EXISTS `petclinic` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `petclinic`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

DROP TABLE IF EXISTS `citas`;
CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `mascota` varchar(50) NOT NULL,
  `especialidad` int(11) DEFAULT NULL,
  `confirmacion` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre`) VALUES
(1, 'Cardiologia'),
(2, 'Dermatologia'),
(3, 'Fisioterapia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
CREATE TABLE `medicamento` (
  `id` int(11) NOT NULL,
  `ingrediente_activo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `presentacion` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`id`, `ingrediente_activo`, `nombre`, `presentacion`) VALUES
(1, 'ingrediente aaaaactivo', 'nombreeeeee', 'presentaciooooon'),
(2, 'chairez', 'chairicospus', 'nose'),
(3, 'ingrediente aaaaactivo', 'nombreeeeee', 'presentaciooooon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `owners`
--

DROP TABLE IF EXISTS `owners`;
CREATE TABLE `owners` (
  `id` int(4) UNSIGNED NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `latitud` varchar(255) NOT NULL,
  `longitud` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `owners`
--

INSERT INTO `owners` (`id`, `first_name`, `last_name`, `address`, `city`, `telephone`, `user_id`, `latitud`, `longitud`, `imagen`) VALUES
(2, 'Don owner', 'ownersito', 'Calle Glorioso Lodasal', 'Tuxtlas', '123456', 2, '1', '1', '/resources/images/7GkAAKaaIA'),
(3, 'Joe unitario', 'Franklin', '110 W. Liberty St.', 'Madison', '65551023', 11, '1', '1', '/resources/images/JcYovGwxLj');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pets`
--

DROP TABLE IF EXISTS `pets`;
CREATE TABLE `pets` (
  `id` int(4) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `type_id` int(4) UNSIGNED NOT NULL,
  `owner_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pets`
--

INSERT INTO `pets` (`id`, `name`, `birth_date`, `type_id`, `owner_id`) VALUES
(1, 'Arisquito', '1998-11-22', 4, 2),
(2, 'pruebita', '1998-11-11', 2, 3),
(3, 'Gratus1', '2019-03-05', 1, 2),
(4, 'Gratus2', '2019-02-05', 1, 2),
(5, 'Gratus2', '2019-02-05', 1, 2),
(6, 'Gratus2', '2019-02-05', 1, 2),
(7, 'Gratus2', '2019-02-05', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilege`
--

DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `privilege`
--

INSERT INTO `privilege` (`id`, `name`) VALUES
(1, 'ADMIN_PRIVILEGE'),
(2, 'OWNER_PRIVILEGE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `price` float NOT NULL,
  `existence` int(11) NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `existence`, `photo`) VALUES
(1, 'prueba', 'producto de prueba', 10, 3, 'image');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `records`
--

DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `id` int(4) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `record_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `records`
--

INSERT INTO `records` (`id`, `description`, `record_date`, `type`, `user_email`) VALUES
(1, 'Contraseña o usuario incorrectos', '2019-03-29 01:46:12', 'failure', 'test'),
(2, 'Contraseña o usuario incorrectos', '2019-03-29 01:46:17', 'failure', 'admin'),
(3, 'Contraseña o usuario incorrectos', '2019-03-29 01:46:21', 'failure', 'admin'),
(4, 'Contraseña o usuario incorrectos', '2019-03-29 01:48:02', 'failure', 'admin'),
(5, 'Contraseña o usuario incorrectos', '2019-03-29 01:48:09', 'failure', 'admin'),
(6, 'Usuario ingreso al sistema sin problemas', '2019-03-29 01:48:23', 'success', 'admin@admin.com'),
(7, 'Contraseña o usuario incorrectos', '2019-03-29 01:48:53', 'failure', 'owner@owner.com'),
(8, 'Usuario ingreso al sistema sin problemas', '2019-03-29 01:49:03', 'success', 'owner@owner.com'),
(9, 'El usuario esta deshabilitado', '2019-03-29 02:20:39', 'failure', 'disabled@disabled.com'),
(10, 'Usuario ingreso al sistema sin problemas', '2019-03-29 02:20:40', 'success', 'admin@admin.com'),
(11, 'Contraseña o usuario incorrectos', '2019-03-29 02:20:40', 'failure', 'test'),
(12, 'Contraseña o usuario incorrectos', '2019-03-29 02:20:40', 'failure', 'owner@owner.com'),
(13, 'Usuario ingreso al sistema sin problemas', '2019-03-29 02:46:17', 'success', 'admin@admin.com'),
(14, 'Contraseña o usuario incorrectos', '2019-03-29 03:18:50', 'failure', 'disabled@disabled.com'),
(15, 'Usuario ingreso al sistema sin problemas', '2019-03-29 03:18:51', 'success', 'admin@admin.com'),
(16, 'Contraseña o usuario incorrectos', '2019-03-29 03:18:51', 'failure', 'test'),
(17, 'Usuario ingreso al sistema sin problemas', '2019-03-29 03:18:51', 'success', 'owner@owner.com'),
(18, 'El usuario esta deshabilitado', '2019-03-29 03:21:09', 'failure', 'prueba@prueba2.com'),
(19, 'El usuario esta deshabilitado', '2019-03-29 03:24:16', 'failure', 'prueba@prueba2.com'),
(20, 'Usuario ingreso al sistema sin problemas', '2019-03-29 03:24:17', 'success', 'admin@admin.com'),
(21, 'Contraseña o usuario incorrectos', '2019-03-29 03:24:17', 'failure', 'test'),
(22, 'Usuario ingreso al sistema sin problemas', '2019-03-29 03:24:17', 'success', 'owner@owner.com'),
(23, 'El usuario esta deshabilitado', '2019-03-29 03:32:06', 'failure', 'prueba@prueba2.com'),
(24, 'Usuario ingreso al sistema sin problemas', '2019-03-29 03:32:07', 'success', 'admin@admin.com'),
(25, 'Contraseña o usuario incorrectos', '2019-03-29 03:32:07', 'failure', 'test'),
(26, 'Usuario ingreso al sistema sin problemas', '2019-03-29 03:32:07', 'success', 'owner@owner.com'),
(27, 'Usuario ingreso al sistema sin problemas', '2019-03-29 03:55:27', 'success', 'admin@admin.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_OWNER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_privileges`
--

DROP TABLE IF EXISTS `roles_privileges`;
CREATE TABLE `roles_privileges` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles_privileges`
--

INSERT INTO `roles_privileges` (`id`, `role_id`, `privilege_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialties`
--

DROP TABLE IF EXISTS `specialties`;
CREATE TABLE `specialties` (
  `id` int(4) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `specialties`
--

INSERT INTO `specialties` (`id`, `name`) VALUES
(3, 'dentistry'),
(1, 'radiology'),
(2, 'surgery');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` int(4) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `types`
--

INSERT INTO `types` (`id`, `name`) VALUES
(5, 'bird'),
(1, 'cat'),
(2, 'dog'),
(6, 'hamster'),
(3, 'lizard'),
(4, 'snake');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) NOT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `active`, `email`, `password`, `telephone`, `zipcode`, `city`) VALUES
(1, 'admin', 'admin', '1', 'admin@admin.com', '{bcrypt}$2a$10$iW6qYvcNvLkVvpHHKipjOesInnL1aJ5qJBn2e7RcGNcAUKpZ745Ku', '12345678', '24094', 'Tuxtla Gutierrez'),
(11, 'Joe unitario', 'Franklin', '0', 'prueba@prueba2.com', '{bcrypt}$2a$10$vwzckYsRZFjuRQNj8Xp4HOtzbA7GNoohqGfNB2C5EsBi3WBPcFAG6', '65551023', '29049', 'Madison'),
(3, 'admin4', 'admin4', '0', 'admin@admin4', '{bcrypt}$2a$10$0E7ID.cWaq924ecKbFnbKuUMDHdbbxcf4JdAESpiiiV9dyPQRX5Ty', '123', '29010', 'tuxtla gutierrez'),
(2, 'Don owner', 'ownersito', '1', 'owner@owner.com', '{bcrypt}$2a$10$5UivHTZmvVm3CRFSYq3NH.0M7izKNjTsuwiNJjtQAa5LsrmwC0HrK', '123456', '29049', 'Tuxtlas'),
(5, 'Prueba', 'Prueba', '1', 'prueba@prueba.com', '{bcrypt}$2a$10$AgHrOrJgniIaQ55pwwuqu.Nu.DW7fqJYnDZ/jcn3dPWEtf6lEocx.', '123456', '29049', 'Tuxtla'),
(12, 'admin3', 'admin3', '1', 'admin@admin3', '{bcrypt}$2a$10$2DW3tbf4Gz65nI.26CBw1ewA0a1wT14ddR2A71vAq6TU./chvZ.ma', '123', '29010', 'tuxtla gutierrez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users_roles`
--

INSERT INTO `users_roles` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 9, 1),
(7, 10, 1),
(8, 11, 2),
(9, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vets`
--

DROP TABLE IF EXISTS `vets`;
CREATE TABLE `vets` (
  `id` int(4) UNSIGNED NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `Schedule` varchar(255) NOT NULL,
  `specialty_id` int(11) NOT NULL,
  `telephone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vets`
--

INSERT INTO `vets` (`id`, `first_name`, `last_name`, `Schedule`, `specialty_id`, `telephone`) VALUES
(1, 'vet3', 'vet3', '2:40', 1234, '123'),
(2, 'Helen', 'Leary', '', 0, ''),
(3, 'Linda', 'Douglas', '', 0, ''),
(4, 'Rafael', 'Ortega', '', 0, ''),
(5, 'Henry', 'Stevens', '', 0, ''),
(6, 'Sharon', 'Jenkins', '', 0, ''),
(7, 'vet2', 'vet2', '2:40', 1234, '123'),
(8, 'vet2', 'vet2', '2:40', 1234, '123'),
(9, 'vet2', 'vet2', '2:40', 1234, '123'),
(10, 'vet2', 'vet2', '2:40', 1234, '123'),
(11, 'vet2', 'vet2', '2:40', 1234, '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vet_specialties`
--

DROP TABLE IF EXISTS `vet_specialties`;
CREATE TABLE `vet_specialties` (
  `vet_id` int(4) UNSIGNED NOT NULL,
  `specialty_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vet_specialties`
--

INSERT INTO `vet_specialties` (`vet_id`, `specialty_id`) VALUES
(2, 1),
(3, 2),
(3, 3),
(4, 2),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visits`
--

DROP TABLE IF EXISTS `visits`;
CREATE TABLE `visits` (
  `id` int(11) NOT NULL,
  `visit_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pet_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `especialidad` (`especialidad`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `last_name` (`last_name`);

--
-- Indices de la tabla `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `FK6teg4kcjcnjhduguft56wcfoa` (`owner_id`),
  ADD KEY `FKtmmh1tq8pah5vxf8kuqqplo4p` (`type_id`);

--
-- Indices de la tabla `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles_privileges`
--
ALTER TABLE `roles_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_id` (`role_id`),
  ADD UNIQUE KEY `privilege_id` (`privilege_id`);

--
-- Indices de la tabla `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indices de la tabla `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `vets`
--
ALTER TABLE `vets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `last_name` (`last_name`);

--
-- Indices de la tabla `vet_specialties`
--
ALTER TABLE `vet_specialties`
  ADD UNIQUE KEY `vet_id` (`vet_id`,`specialty_id`),
  ADD KEY `specialty_id` (`specialty_id`);

--
-- Indices de la tabla `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6jcifhlqqlsfseu67utlouauy` (`pet_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `owners`
--
ALTER TABLE `owners`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `privilege`
--
ALTER TABLE `privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `records`
--
ALTER TABLE `records`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `roles_privileges`
--
ALTER TABLE `roles_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `types`
--
ALTER TABLE `types`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users_roles`
--
ALTER TABLE `users_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `vets`
--
ALTER TABLE `vets`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`especialidad`) REFERENCES `especialidades` (`id`);

--
-- Filtros para la tabla `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `FK6teg4kcjcnjhduguft56wcfoa` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`),
  ADD CONSTRAINT `FKtmmh1tq8pah5vxf8kuqqplo4p` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`),
  ADD CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`),
  ADD CONSTRAINT `pets_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);

--
-- Filtros para la tabla `vet_specialties`
--
ALTER TABLE `vet_specialties`
  ADD CONSTRAINT `vet_specialties_ibfk_1` FOREIGN KEY (`vet_id`) REFERENCES `vets` (`id`),
  ADD CONSTRAINT `vet_specialties_ibfk_2` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
