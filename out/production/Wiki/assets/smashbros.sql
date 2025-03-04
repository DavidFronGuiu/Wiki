-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2025 a las 12:59:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `smashbros`
--
CREATE DATABASE IF NOT EXISTS smashbros;
USE smashbros;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_estreno` date NOT NULL,
  `id_saga` int(11) NOT NULL,
  `urlImagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`id`, `nombre`, `fecha_estreno`, `id_saga`, `urlImagen`) VALUES
(1, 'Super Smash Bros.', '1999-01-21', 11, '.\\src\\assets\\Portadas\\Super Smash Bros.png'),
(2, 'Super Mario Bros.', '1985-09-13', 1, '.\\src\\assets\\Portadas\\Super_Mario_Bros.png'),
(3, 'The Legend of Zelda: The Hyrule Fantasy', '1986-02-21', 2, '.\\src\\assets\\Portadas\\The Legend Of Zelda.png'),
(4, 'Donkey Kong', '1981-07-01', 7, '.\\src\\assets\\Portadas\\Donkey Kong.png'),
(5, 'Metroid', '1986-08-06', 9, '.\\src\\assets\\Portadas\\Metroid.png'),
(6, 'F-Zero', '1990-11-21', 10, '.\\src\\assets\\Portadas\\FZero.jpg'),
(7, 'Mother', '1989-07-27', 6, '.\\src\\assets\\Portadas\\Mother.png'),
(8, 'Super Mario World', '1990-11-21', 1, '.\\src\\assets\\Portadas\\Super Mario World.png'),
(9, 'Kirby\'s Dream Land\r\n', '1992-04-27', 3, '.\\src\\assets\\Portadas\\Kirby.png'),
(10, 'Star Fox', '1993-02-21', 5, '.\\src\\assets\\Portadas\\Star Fox.jpg'),
(11, 'Pokémon Azul/Rojo/Verde', '1996-02-27', 8, '.\\src\\assets\\Portadas\\Pokemon Rojo.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje`
--

CREATE TABLE `personaje` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `url_imagen` varchar(255) NOT NULL,
  `id_primera_aparicion` int(11) NOT NULL,
  `id_debut_smash` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personaje`
--

INSERT INTO `personaje` (`id`, `Nombre`, `url_imagen`, `id_primera_aparicion`, `id_debut_smash`) VALUES
(1, 'Mario', '.\\src\\assets\\Personajes\\Mario.png', 2, 1),
(2, 'Link', '.\\src\\assets\\Personajes\\Link.png', 3, 1),
(3, 'Luigi', '.\\src\\assets\\Personajes\\Luigi.png', 2, 1),
(4, 'Donkey Kong', '.\\src\\assets\\Personajes\\DK.png', 4, 1),
(5, 'Samus', '.\\src\\assets\\Personajes\\Samus.png', 5, 1),
(6, 'Captain Falcon', '.\\src\\assets\\Personajes\\Falcon.png', 6, 1),
(7, 'Ness', '.\\src\\assets\\Personajes\\Ness.png', 7, 1),
(8, 'Yoshi', '.\\src\\assets\\Personajes\\Yoshi.png', 8, 1),
(9, 'Kirby', '.\\src\\assets\\Personajes\\Kirby.png', 9, 1),
(10, 'Fox', '.\\src\\assets\\Personajes\\Fox.png', 10, 1),
(11, 'Pikachu', '.\\src\\assets\\Personajes\\Pikachu.png', 11, 1),
(12, 'Jigglypuff', '.\\src\\assets\\Personajes\\Jigglypuff.png', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saga`
--

CREATE TABLE `saga` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `urlImagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `saga`
--

INSERT INTO `saga` (`id`, `nombre`, `urlImagen`) VALUES
(1, 'Super Mario Bros', '.\\src\\assets\\Logos\\Super Mario.jpg'),
(2, 'The Legend of Zelda', '.\\src\\assets\\Logos\\Zelda.png'),
(3, 'Kirby', '.\\src\\assets\\Logos\\Kirby.png'),
(4, 'Fire Emblem', '.\\src\\assets\\Logos\\Fire Emblem.png'),
(5, 'Star Fox', '.\\src\\assets\\Logos\\Star Fox.png'),
(6, 'Mother', '.\\src\\assets\\Logos\\Mother.jpg'),
(7, 'Donkey Kong', '.\\src\\assets\\Logos\\DK.png'),
(8, 'Pokemon', '.\\src\\assets\\Logos\\Pokemon.jpg'),
(9, 'Metroid', '.\\src\\assets\\Logos\\Metroid.png'),
(10, 'F-Zero', '.\\src\\assets\\Logos\\FZero.png'),
(11, 'Super Smash Bros', '.\\src\\assets\\Logos\\Smash.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_saga` (`id_saga`);

--
-- Indices de la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_primera_aparicion` (`id_primera_aparicion`),
  ADD KEY `id_debut_smash` (`id_debut_smash`);

--
-- Indices de la tabla `saga`
--
ALTER TABLE `saga`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `personaje`
--
ALTER TABLE `personaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `saga`
--
ALTER TABLE `saga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `juego`
--
ALTER TABLE `juego`
  ADD CONSTRAINT `juego_ibfk_1` FOREIGN KEY (`id_saga`) REFERENCES `saga` (`id`);

--
-- Filtros para la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD CONSTRAINT `personaje_ibfk_1` FOREIGN KEY (`id_primera_aparicion`) REFERENCES `juego` (`id`),
  ADD CONSTRAINT `personaje_ibfk_2` FOREIGN KEY (`id_debut_smash`) REFERENCES `juego` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
