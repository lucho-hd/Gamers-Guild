-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2023 a las 10:47:36
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `caruso_luciano_app_moviles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `precioCuotas` int(11) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `img_alt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id`, `titulo`, `precioCuotas`, `estado`, `precio`, `cantidad`, `img`, `img_alt`) VALUES
(1, 'Marvel Spiderman Miles Morales PS4', 366, 'Disponible', 4390, 1, '../assets/img/spider-man-miles-morales.png', 'Spiderman: Miles Morales'),
(2, 'Marvel Avengers PS4 PS5', 174, 'Stock bajo', 2090, 1, '../assets/img/avengers.png', 'Avengers'),
(3, 'The Last Of Us Parte II PS4', 166, 'Stock bajo', 1990, 1, '../assets/img/the-last-of-us.png', 'The Last Of Us Parte II'),
(4, 'Ghost Of Tsushima PS4 & PS5', 294, 'Disponible', 2990, 1, '../assets/img/ghost-of-tsushima.png', 'GhostOf Tsushima'),
(5, 'Far Cry 6 PS4 & PS5 Edición Deluxe', 249, 'Disponible', 2990, 1, '../assets/img/far-cry-6.png', 'Far Cry 6 Edición Deluxe'),
(6, 'Fifa 21 PS4 & PS5 Edición Premium\"', 158, 'Stock bajo', 1890, 1, '../assets/img/fifa-21.png', 'Fifa 21 Premiun Edition');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
