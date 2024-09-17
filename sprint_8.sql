-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 17, 2024 at 05:23 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sprint_8`
--

-- --------------------------------------------------------

--
-- Table structure for table `Amigos`
--

CREATE TABLE `Amigos` (
  `user_id` int(8) UNSIGNED NOT NULL,
  `amigo_id` int(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Events`
--

CREATE TABLE `Events` (
  `id_event` int(11) NOT NULL,
  `viaje_id` int(6) NOT NULL,
  `titulo` varchar(40) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `latitud` decimal(9,6) DEFAULT NULL,
  `longitud` decimal(9,6) DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `costo` decimal(7,2) DEFAULT NULL,
  `categoria` enum('Hospedaje','Transporte','Turismo','Comida') NOT NULL DEFAULT 'Turismo',
  `comentarios` varchar(100) DEFAULT NULL,
  `user_id_create` int(8) UNSIGNED NOT NULL,
  `user_id_paid` int(8) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Events`
--

INSERT INTO `Events` (`id_event`, `viaje_id`, `titulo`, `ubicacion`, `latitud`, `longitud`, `fecha_inicio`, `fecha_fin`, `costo`, `categoria`, `comentarios`, `user_id_create`, `user_id_paid`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tour por la Torre Eiffel', 'Torre Eiffel', NULL, NULL, '2024-09-01 00:00:00', '2024-09-01 00:00:00', NULL, 'Turismo', NULL, 1, NULL, '2024-09-14 18:38:11', '2024-09-14 18:38:11'),
(2, 2, 'Visita a Central Park', 'Central Park', NULL, NULL, '2024-09-02 00:00:00', '2024-09-02 00:00:00', 20.00, 'Turismo', 'nada', 2, NULL, '2024-09-14 18:38:11', '2024-09-14 18:49:00'),
(3, 1, 'Pasaje avión Barcelona-París', 'Barcelona, España', NULL, NULL, '2024-09-01 00:00:00', '2024-09-01 00:00:00', NULL, 'Turismo', NULL, 1, NULL, '2024-09-14 18:38:11', '2024-09-14 18:38:11'),
(4, 2, 'Pasaje avión Barcelona-New York', 'Barcelona, España', NULL, NULL, '2024-09-01 00:00:00', '2024-09-01 00:00:00', 200.00, 'Turismo', NULL, 2, NULL, '2024-09-14 18:38:11', '2024-09-14 18:53:50'),
(5, 1, 'Hotel Paris', 'Paris, Francia', NULL, NULL, '2024-09-01 00:00:00', '2024-09-14 00:00:00', NULL, 'Turismo', NULL, 1, NULL, '2024-09-14 18:38:11', '2024-09-14 18:38:11'),
(6, 2, 'Hotel New York', 'New York, Usa', NULL, NULL, '2024-09-01 00:00:00', '2024-09-14 06:00:00', 100.00, 'Turismo', NULL, 2, NULL, '2024-09-14 18:38:11', '2024-09-14 18:56:42'),
(8, 2, 'prueba', 'new york', NULL, NULL, '2024-09-21 18:49:00', '2024-09-28 18:49:00', 2000.00, 'Turismo', '', 2, NULL, '2024-09-14 18:49:34', '2024-09-14 18:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `RecoveryTokens`
--

CREATE TABLE `RecoveryTokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(8) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id_user` int(8) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) DEFAULT NULL,
  `roles` varchar(30) DEFAULT 'user',
  `photo` varchar(30) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id_user`, `email`, `password`, `name`, `surname`, `roles`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'ismael.academy@gmail.com', '$2b$10$tXrqo7VdSPCLAsIUhrVsYejYeMt9FLo9J4OchgCKwuDvpeDK6Xf1q', 'Ismael', NULL, 'user', NULL, '2024-09-14 18:38:11', '2024-09-14 18:38:11'),
(2, 'laura@hotmail.com', '$2b$10$tXrqo7VdSPCLAsIUhrVsYejYeMt9FLo9J4OchgCKwuDvpeDK6Xf1q', 'Laura', NULL, 'user', NULL, '2024-09-14 18:38:11', '2024-09-14 18:38:11'),
(3, 'maria@hotmail.com', '$2b$10$tXrqo7VdSPCLAsIUhrVsYejYeMt9FLo9J4OchgCKwuDvpeDK6Xf1q', 'Maria', 'kale', 'mod,admin', NULL, '2024-09-14 18:38:11', '2024-09-14 18:38:11'),
(4, 'mod@hotmail.com', '$2b$10$tXrqo7VdSPCLAsIUhrVsYejYeMt9FLo9J4OchgCKwuDvpeDK6Xf1q', 'Moderador', 'kale', 'admin', NULL, '2024-09-14 18:38:11', '2024-09-14 18:38:11'),
(5, 'admin@hotmail.com', '$2b$10$tXrqo7VdSPCLAsIUhrVsYejYeMt9FLo9J4OchgCKwuDvpeDK6Xf1q', 'Admin', 'kale', 'admin', NULL, '2024-09-14 18:38:11', '2024-09-14 18:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `UsersViajes`
--

CREATE TABLE `UsersViajes` (
  `user_id` int(8) UNSIGNED NOT NULL,
  `viaje_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `UsersViajes`
--

INSERT INTO `UsersViajes` (`user_id`, `viaje_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Viajes`
--

CREATE TABLE `Viajes` (
  `id_viaje` int(6) NOT NULL,
  `titulo` varchar(40) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Viajes`
--

INSERT INTO `Viajes` (`id_viaje`, `titulo`, `ubicacion`, `fecha_inicio`, `fecha_fin`, `created_at`, `updated_at`) VALUES
(1, 'Viaje a Paris', 'Paris, Francia', '2024-09-01 00:00:00', '2024-09-10 00:00:00', '2024-09-14 18:38:11', '2024-09-14 18:38:11'),
(2, 'Viaje a New York', 'New York, USA', '2024-09-01 00:00:00', '2024-09-10 00:00:00', '2024-09-14 18:38:11', '2024-09-14 18:38:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Amigos`
--
ALTER TABLE `Amigos`
  ADD PRIMARY KEY (`user_id`,`amigo_id`),
  ADD UNIQUE KEY `Amigos_amigo_id_user_id_unique` (`user_id`,`amigo_id`),
  ADD KEY `amigo_id` (`amigo_id`);

--
-- Indexes for table `Events`
--
ALTER TABLE `Events`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `viaje_id` (`viaje_id`),
  ADD KEY `user_id_create` (`user_id_create`),
  ADD KEY `user_id_paid` (`user_id_paid`);

--
-- Indexes for table `RecoveryTokens`
--
ALTER TABLE `RecoveryTokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `token_2` (`token`),
  ADD UNIQUE KEY `token_3` (`token`),
  ADD UNIQUE KEY `token_4` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `users_email` (`email`);

--
-- Indexes for table `UsersViajes`
--
ALTER TABLE `UsersViajes`
  ADD PRIMARY KEY (`user_id`,`viaje_id`),
  ADD UNIQUE KEY `UsersViajes_viaje_id_user_id_unique` (`user_id`,`viaje_id`),
  ADD KEY `viaje_id` (`viaje_id`);

--
-- Indexes for table `Viajes`
--
ALTER TABLE `Viajes`
  ADD PRIMARY KEY (`id_viaje`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Events`
--
ALTER TABLE `Events`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `RecoveryTokens`
--
ALTER TABLE `RecoveryTokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id_user` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Viajes`
--
ALTER TABLE `Viajes`
  MODIFY `id_viaje` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Amigos`
--
ALTER TABLE `Amigos`
  ADD CONSTRAINT `amigos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amigos_ibfk_2` FOREIGN KEY (`amigo_id`) REFERENCES `Users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Events`
--
ALTER TABLE `Events`
  ADD CONSTRAINT `events_ibfk_10` FOREIGN KEY (`viaje_id`) REFERENCES `Viajes` (`id_viaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_11` FOREIGN KEY (`user_id_create`) REFERENCES `Users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_12` FOREIGN KEY (`user_id_paid`) REFERENCES `Users` (`id_user`);

--
-- Constraints for table `RecoveryTokens`
--
ALTER TABLE `RecoveryTokens`
  ADD CONSTRAINT `recoverytokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UsersViajes`
--
ALTER TABLE `UsersViajes`
  ADD CONSTRAINT `usersviajes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usersviajes_ibfk_2` FOREIGN KEY (`viaje_id`) REFERENCES `Viajes` (`id_viaje`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
