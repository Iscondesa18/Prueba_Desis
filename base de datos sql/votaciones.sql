-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2023 a las 17:00:10
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `votaciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato`
--

CREATE TABLE `candidato` (
  `IdCandidato` int(5) NOT NULL,
  `NombreCandidato` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `candidato`
--

INSERT INTO `candidato` (`IdCandidato`, `NombreCandidato`) VALUES
(1, 'Gabriel Boric'),
(2, 'Jose Antonio Kast'),
(3, 'Yasna Provoste'),
(4, 'Sebastian Sichel'),
(5, 'Eduardo Artes'),
(6, 'Marco Enriquez-Ominami '),
(7, 'Franco Parisi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `IdComuna` int(3) NOT NULL,
  `Comuna` varchar(100) NOT NULL,
  `idRegion` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`IdComuna`, `Comuna`, `idRegion`) VALUES
(1, 'Arica', 1),
(2, 'Camarones', 1),
(3, 'General Lagos', 1),
(4, 'Iquique', 2),
(5, 'Colchane', 2),
(6, 'Huara', 2),
(7, 'Antofagasta', 3),
(8, 'Calama', 3),
(9, 'Tocopilla', 3),
(10, 'Copiapó', 4),
(11, 'Caldera', 4),
(12, 'Vallenar', 4),
(13, 'Andacollo', 5),
(14, 'La Serena', 5),
(15, 'Los Vilos', 5),
(16, 'Valparaíso', 6),
(17, 'Calera', 6),
(18, 'San Felipe', 6),
(19, 'Puente Alto', 7),
(20, 'Providencia', 7),
(21, 'Independencia', 7),
(22, 'Paredones', 8),
(23, 'Graneros', 8),
(24, 'Mostazal', 8),
(25, 'Talca', 9),
(26, 'Curicó', 9),
(27, 'Linares', 9),
(28, 'Concepción', 10),
(29, 'Lota', 10),
(30, 'Lebu', 10),
(31, 'Lautaro', 11),
(32, 'Temuco', 11),
(33, 'Gorbea', 11),
(34, 'Valdivia', 12),
(35, 'Panguipulli', 12),
(36, 'Paillaco', 12),
(37, 'Puerto Montt', 13),
(38, 'Puerto Octay', 13),
(39, 'Osorno', 13),
(40, 'Coihaique', 14),
(41, 'Tortel', 14),
(42, 'Aisén', 14),
(43, 'Porvenir', 15),
(44, 'Torres del Paine', 15),
(45, 'Primavera', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entero`
--

CREATE TABLE `entero` (
  `idEntero` int(11) NOT NULL,
  `rutVotante` int(11) NOT NULL,
  `comoSeEntero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `idRegion` int(2) NOT NULL,
  `Region` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`idRegion`, `Region`) VALUES
(1, 'Arica y Parinacota'),
(2, 'Tarapacá'),
(3, 'Antofagasta'),
(4, 'Atacama'),
(5, 'Coquimbo'),
(6, 'Valparaiso'),
(7, 'Metropolitana de Santiago'),
(8, 'Libertador General Bernardo O\'Higgins'),
(9, 'Maule'),
(10, 'Biobío'),
(11, 'La Araucanía'),
(12, 'Los Ríos'),
(13, 'Los Lagos'),
(14, 'Aisén del General Carlos Ibáñez del Campo'),
(15, 'Magallanes y de la Antártica Chilena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votacion`
--

CREATE TABLE `votacion` (
  `idVotacion` int(5) NOT NULL,
  `NombreApellidoVotante` varchar(80) NOT NULL,
  `Alias` varchar(50) NOT NULL,
  `Rut` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `IdRegion` int(2) NOT NULL,
  `IdComuna` int(3) NOT NULL,
  `IdCandidato` int(3) NOT NULL,
  `ComoSeEntero` set('web','tv','redes','amigo','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`IdCandidato`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`IdComuna`),
  ADD KEY `fkComunaRegion` (`idRegion`);

--
-- Indices de la tabla `entero`
--
ALTER TABLE `entero`
  ADD PRIMARY KEY (`idEntero`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`idRegion`);

--
-- Indices de la tabla `votacion`
--
ALTER TABLE `votacion`
  ADD PRIMARY KEY (`idVotacion`),
  ADD KEY `fkVotacionRegion` (`IdRegion`),
  ADD KEY `fkVotacionComuna` (`IdComuna`),
  ADD KEY `fkVotacionCandidato` (`IdCandidato`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidato`
--
ALTER TABLE `candidato`
  MODIFY `IdCandidato` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `IdComuna` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `entero`
--
ALTER TABLE `entero`
  MODIFY `idEntero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `votacion`
--
ALTER TABLE `votacion`
  MODIFY `idVotacion` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `fkComunaRegion` FOREIGN KEY (`idRegion`) REFERENCES `region` (`idRegion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `votacion`
--
ALTER TABLE `votacion`
  ADD CONSTRAINT `fkVotacionCandidato` FOREIGN KEY (`IdCandidato`) REFERENCES `candidato` (`IdCandidato`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkVotacionComuna` FOREIGN KEY (`IdComuna`) REFERENCES `comuna` (`IdComuna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkVotacionRegion` FOREIGN KEY (`IdRegion`) REFERENCES `region` (`idRegion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
