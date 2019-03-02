-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2019 a las 01:32:33
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
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `id` int(11) NOT NULL,
  `ingrediente_activo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `presentacion` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `owners`
--

CREATE TABLE `owners` (
  `id` int(4) UNSIGNED NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `latitud` varchar(255) NOT NULL,
  `longitud` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `owners`
--

INSERT INTO `owners` (`id`, `first_name`, `last_name`, `address`, `city`, `telephone`, `user_id`, `latitud`, `longitud`) VALUES
(1, 'George', 'Franklin', '110 W. Liberty St.', 'Madison', '6085551023', 1, '', ''),
(2, 'Betty', 'Davis', '638 Cardinal Ave.', 'Sun Prairie', '6085551749', 1, '', ''),
(3, 'Eduardo', 'Rodriquez', '2693 Commerce St.', 'McFarland', '6085558763', 1, '', ''),
(4, 'Harold', 'Davis', '563 Friendly St.', 'Windsor', '6085553198', 1, '', ''),
(5, 'Peter', 'McTavish', '2387 S. Fair Way', 'Madison', '6085552765', 1, '', ''),
(6, 'Jean', 'Coleman', '105 N. Lake St.', 'Monona', '6085552654', 1, '', ''),
(7, 'Jeff', 'Black', '1450 Oak Blvd.', 'Monona', '6085555387', 1, '', ''),
(8, 'Maria', 'Escobito', '345 Maple St.', 'Madison', '6085557683', 1, '', ''),
(9, 'David', 'Schroeder', '2749 Blackhawk Trail', 'Madison', '6085559435', 1, '', ''),
(10, 'Carlos', 'Estaban', '2335 Independence La.', 'Waunakee', '6085555487', 1, '', ''),
(11, 'edgar', 'edgar', 'Calle Viento', '29601', '961234567', 20, '36.50993800001736', '-4.883396364432144'),
(12, 'nose', 'nose', 'Fraccionamiento Las Águilas', '29049', '123124', 21, '16.784262000009875', '-93.0916760932574'),
(13, 'Prueba final', 'Appellido', 'Auditorio Municipal TGZ', '29066', '961234567', 22, '16.751863337402497', '-93.11364724919721');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pets`
--

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
(1, 'Leo', '2000-09-07', 1, 1),
(2, 'Basil', '2002-08-06', 6, 2),
(3, 'Rosy', '2001-04-17', 2, 3),
(4, 'Jewel', '2000-03-07', 2, 3),
(5, 'Iggy', '2000-11-30', 3, 4),
(6, 'George', '2000-01-20', 4, 5),
(7, 'Samantha', '1995-09-04', 1, 6),
(8, 'Max', '1995-09-04', 1, 6),
(9, 'Lucky', '1999-08-06', 5, 7),
(10, 'Mulligan', '1997-02-24', 2, 8),
(11, 'Freddy', '2000-03-09', 5, 9),
(12, 'Lucky', '2000-06-24', 2, 10),
(13, 'Sly', '2002-06-08', 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilege`
--

CREATE TABLE `privilege` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `privilege`
--

INSERT INTO `privilege` (`id`, `name`) VALUES
(24, 'OWNER_PRIVILEGE'),
(25, 'ADMIN_PRIVILEGE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `price` float NOT NULL,
  `existence` int(11) NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `records`
--

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
(1, 'Usuario ingreso al sistema sin problemas', '2019-02-01 21:43:10', 'success', 'lol'),
(2, 'Usuario ingreso al sistema sin problemas', '2019-02-21 07:55:17', 'success', 'katz@katz.com'),
(3, 'Usuario ingreso al sistema sin problemas', '2019-02-23 23:17:51', 'success', 'katz@katz.com'),
(4, 'Usuario ingreso al sistema sin problemas', '2019-02-23 23:35:52', 'success', 'katz@katz.com'),
(5, 'Usuario ingreso al sistema sin problemas', '2019-02-23 23:54:39', 'success', 'katz@katz.com'),
(6, 'Usuario ingreso al sistema sin problemas', '2019-02-23 23:55:09', 'success', 'test@test.com'),
(7, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:00:15', 'success', 'test@test.com'),
(8, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:02:04', 'success', 'katz@katz.com'),
(9, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:02:29', 'success', 'test@test.com'),
(10, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:09:22', 'success', 'katz@katz.com'),
(11, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:09:42', 'success', 'test@test.com'),
(12, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:10:51', 'success', 'test@test.com'),
(13, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:11:35', 'success', 'test@test.com'),
(14, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:17:01', 'success', 'test@test.com'),
(15, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:24:34', 'success', 'test@test.com'),
(16, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:31:53', 'success', 'test@test.com'),
(17, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:32:33', 'success', 'test@test.com'),
(18, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:32:57', 'success', 'test@test.com'),
(19, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:33:26', 'success', 'test@test.com'),
(20, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:42:26', 'success', 'test@test.com'),
(21, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:43:05', 'success', 'test@test.com'),
(22, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:47:41', 'success', 'test@test.com'),
(23, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:54:26', 'success', 'test@test.com'),
(24, 'Usuario ingreso al sistema sin problemas', '2019-02-24 00:55:37', 'success', 'test@test.com'),
(25, 'Usuario ingreso al sistema sin problemas', '2019-02-24 01:04:23', 'success', 'test@test.com'),
(26, 'Usuario ingreso al sistema sin problemas', '2019-02-24 02:22:17', 'success', 'test@test.com'),
(27, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:29:32', 'success', 'test@test.com'),
(28, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:30:55', 'success', 'test@test.com'),
(29, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:32:50', 'success', 'test@test.com'),
(30, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:34:03', 'success', 'test@test.com'),
(31, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:34:42', 'success', 'test@test.com'),
(32, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:36:45', 'success', 'test@test.com'),
(33, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:38:54', 'success', 'test@test.com'),
(34, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:39:57', 'success', 'test@test.com'),
(35, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:42:18', 'success', 'test@test.com'),
(36, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:55:25', 'success', 'lol'),
(37, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:55:41', 'success', 'test'),
(38, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:57:05', 'success', 'test'),
(39, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:57:11', 'success', 'test'),
(40, 'Usuario ingreso al sistema sin problemas', '2019-02-24 03:57:28', 'success', 'lol'),
(41, 'Usuario ingreso al sistema sin problemas', '2019-02-26 11:53:37', 'success', 'lol'),
(42, 'Usuario ingreso al sistema sin problemas', '2019-02-26 11:54:17', 'success', 'katz@katz.com'),
(43, 'Usuario ingreso al sistema sin problemas', '2019-02-26 11:55:50', 'success', 'lol'),
(44, 'Usuario ingreso al sistema sin problemas', '2019-02-26 11:56:07', 'success', 'test'),
(45, 'Usuario ingreso al sistema sin problemas', '2019-02-26 12:02:39', 'success', 'gustavo'),
(46, 'Usuario ingreso al sistema sin problemas', '2019-02-26 12:34:40', 'success', 'edgar'),
(47, 'Usuario ingreso al sistema sin problemas', '2019-02-27 04:40:29', 'success', 'edgar'),
(48, 'Usuario ingreso al sistema sin problemas', '2019-02-27 04:45:28', 'success', 'test'),
(49, 'Usuario ingreso al sistema sin problemas', '2019-02-27 05:55:37', 'success', 'test'),
(50, 'Usuario ingreso al sistema sin problemas', '2019-02-27 06:10:40', 'success', 'nose@nose'),
(51, 'Contraseña o usuario incorrectos', '2019-02-27 06:11:00', 'failure', 'nose@nose'),
(52, 'Contraseña o usuario incorrectos', '2019-02-27 06:11:06', 'failure', 'nose@nose'),
(53, 'Usuario ingreso al sistema sin problemas', '2019-02-27 06:11:15', 'success', 'nose@nose'),
(54, 'Usuario ingreso al sistema sin problemas', '2019-02-27 06:27:59', 'success', 'test'),
(55, 'El usuario esta deshabilitado', '2019-02-27 06:28:10', 'failure', 'nose@nose');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(13, 'ROLE_ADMIN'),
(14, 'ROLE_OWNER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_privileges`
--

CREATE TABLE `roles_privileges` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles_privileges`
--

INSERT INTO `roles_privileges` (`id`, `role_id`, `privilege_id`) VALUES
(6, 13, 25),
(8, 14, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialties`
--

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
(1, 'kevin', 'jhair', '1', 'katz@katz.com', '{bcrypt}$2a$10$gvZpMU8b/8V4nuqFyau72.1l5zqoofbyKPb1PGzruQ3NPRMCm6Gma', '', '29049', ''),
(20, 'OWNER', 'OWNER', '1', 'edgar', '{bcrypt}$2a$10$BJNoyRfjYhE9IdbOCQ6L1ek3Hz3A6iplrdeWNHNKqI9EL9bsRJWW6', '9612570599', '29049', 'Tuxtla Gutierrez'),
(3, 'lol', 'lol', '1', 'lol', '{bcrypt}$2a$10$jS74X.M2pYegYNm7HbnJhu2SwxMZrmGewQKybpsTByCOqOx.fUTr2', '123', '29049', ''),
(18, 'gustavo', 'gustavo', '1', 'gustavo', '{bcrypt}$2a$10$liMPb3CTBl7gC8bR15bbp.U4M.x08q2Q.ntGzy3YvSPhKkoKWVG4.', '1234568', '29049', 'tuxtla'),
(14, 'Test', 'Test', '1', 'test', '{bcrypt}$2a$10$/pj5dd5tMOk3zbZnN9Zlyed14p7LYSBHbcLY.UUGDtKvLdRyaF5c.', '9612570599', '29049', 'Tuxtla Gutierrez'),
(21, 'OWNER', 'OWNER', '1', 'nose', '{bcrypt}$2a$10$mI7OsZ0Wla/kyc4AO1TzUejH8JAZp1uTm7f7LgB6TBaJm7kzlJGEm', '9612570599', '29049', 'Tuxtla Gutierrez'),
(22, 'Prueba final', 'Appellido', '0', 'nose@nose', '{bcrypt}$2a$10$mI7OsZ0Wla/kyc4AO1TzUejH8JAZp1uTm7f7LgB6TBaJm7kzlJGEm', '961234567', '29049', '29066');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_roles`
--

CREATE TABLE `users_roles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users_roles`
--

INSERT INTO `users_roles` (`id`, `user_id`, `role_id`) VALUES
(9, 14, 13),
(12, 3, 14),
(14, 18, 13),
(16, 20, 14),
(17, 21, 14),
(18, 22, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vets`
--

CREATE TABLE `vets` (
  `id` int(4) UNSIGNED NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vets`
--

INSERT INTO `vets` (`id`, `first_name`, `last_name`) VALUES
(1, 'James', 'Carter'),
(2, 'Helen', 'Leary'),
(3, 'Linda', 'Douglas'),
(4, 'Rafael', 'Ortega'),
(5, 'Henry', 'Stevens'),
(6, 'Sharon', 'Jenkins');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vet_specialties`
--

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
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `owners`
--
ALTER TABLE `owners`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `privilege`
--
ALTER TABLE `privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `records`
--
ALTER TABLE `records`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `roles_privileges`
--
ALTER TABLE `roles_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `users_roles`
--
ALTER TABLE `users_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `vets`
--
ALTER TABLE `vets`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

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
