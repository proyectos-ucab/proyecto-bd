-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2020 at 06:39 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyecto`
--

-- --------------------------------------------------------

--
-- Table structure for table `actividades`
--

CREATE TABLE `actividades` (
  `id_actividad` varchar(10) NOT NULL,
  `nrc` varchar(20) NOT NULL,
  `id_tema` varchar(10) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `plataforma` varchar(255) DEFAULT NULL,
  `recurso` varchar(255) DEFAULT NULL,
  `frecuencia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actividades`
--

INSERT INTO `actividades` (`id_actividad`, `nrc`, `id_tema`, `tipo`, `descripcion`, `plataforma`, `recurso`, `frecuencia`) VALUES
('8047e773-a', '7fe0cf30-1', '25328', '', '- Primer día de Clase:\r\npresentación de cada\r\nestudiante, conocimientos\r\nprevios, expectativas,\r\nhobbies, etc, para elaborar\r\nperfil del grupo.', 'Google Drive', 'Diapositiovas + Audios', 'Cada Clase');

-- --------------------------------------------------------

--
-- Table structure for table `asignaturas`
--

CREATE TABLE `asignaturas` (
  `nrc` varchar(20) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `semestre` int(11) NOT NULL,
  `unidad_credito` int(11) DEFAULT NULL,
  `descripcion` varchar(120) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `asignaturas`
--

INSERT INTO `asignaturas` (`nrc`, `nombre`, `semestre`, `unidad_credito`, `descripcion`, `codigo`) VALUES
('25328', 'Metodología del\r\nSoftware ', 7, NULL, NULL, NULL),
('25503', 'Sistema de Base de\r\nDatos II ', 7, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asignaturas_competencias`
--

CREATE TABLE `asignaturas_competencias` (
  `nrc` varchar(20) NOT NULL,
  `id_competencia` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `asignaturas_competencias`
--

INSERT INTO `asignaturas_competencias` (`nrc`, `id_competencia`) VALUES
('25328', '414a94a6-b'),
('25328', 'a04956f0-8'),
('25328', 'bc6e49d4-9');

-- --------------------------------------------------------

--
-- Table structure for table `asistencias`
--

CREATE TABLE `asistencias` (
  `nrc` varchar(20) NOT NULL,
  `id_usuario` varchar(10) NOT NULL,
  `id_periodo` varchar(10) NOT NULL,
  `numero_semana` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `asistente` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carreras`
--

CREATE TABLE `carreras` (
  `id` varchar(10) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carreras`
--

INSERT INTO `carreras` (`id`, `nombre`, `descripcion`) VALUES
('fd4851d4-8', 'Ingenieria Informatica', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carreras_asignaturas`
--

CREATE TABLE `carreras_asignaturas` (
  `id_carrera` varchar(10) NOT NULL,
  `nrc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carreras_asignaturas`
--

INSERT INTO `carreras_asignaturas` (`id_carrera`, `nrc`) VALUES
('fd4851d4-8', '25328'),
('fd4851d4-8', '25503');

-- --------------------------------------------------------

--
-- Table structure for table `competencias`
--

CREATE TABLE `competencias` (
  `id` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competencias`
--

INSERT INTO `competencias` (`id`, `nombre`, `codigo`, `descripcion`) VALUES
('414a94a6-b', 'Unidad de Competencia 1', 'CG1 – U1', 'Abstrae, analiza y sintetiza información.'),
('a04956f0-8', 'Unidad de Competencia 2', 'CG1 – U2', 'Identifica, plantea y resuelve problemas.'),
('bc6e49d4-9', 'Unidad de Competencia 3', 'CG1 – U3', 'Demuestra conocimiento sobre su área\r\nde estudio y profesión.');

-- --------------------------------------------------------

--
-- Table structure for table `criterios`
--

CREATE TABLE `criterios` (
  `id_criterio` varchar(10) NOT NULL,
  `id_competencia` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `criterios`
--

INSERT INTO `criterios` (`id_criterio`, `id_competencia`, `nombre`, `codigo`, `descripcion`) VALUES
('', 'a04956f0-8', '', NULL, NULL),
('', 'bc6e49d4-9', '', NULL, NULL),
('54ff1cfe-6', 'bc6e49d4-9', '', NULL, 'Aplica con fluidez la terminología del área de estudio y profesión.'),
('68aac891-d', '414a94a6-b', '', NULL, 'Identifica elementos comunes en diferentes\r\nsituaciones o contextos.'),
('69684fb4-2', '414a94a6-b', '', NULL, 'Resume información de forma clara y ordenada.'),
('6c523e33-3', '414a94a6-b', '', NULL, 'Integra los elementos de forma coherente.'),
('8e2d441e-c', 'bc6e49d4-9', '', NULL, 'Aplica los procedimientos de la disciplina para resolver problemas y aportar soluciones.'),
('9f9f12b8-b', 'a04956f0-8', '', NULL, 'Evalúa el resultado de las acciones ejecutadas.');

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `id` varchar(10) NOT NULL,
  `nrc` varchar(20) NOT NULL,
  `id_tema` varchar(10) NOT NULL,
  `descripcion` varchar(120) DEFAULT NULL,
  `ponderacion` float DEFAULT NULL,
  `id_periodo` varchar(10) DEFAULT NULL,
  `numero_semana` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evaluaciones`
--

INSERT INTO `evaluaciones` (`id`, `nrc`, `id_tema`, `descripcion`, `ponderacion`, `id_periodo`, `numero_semana`, `fecha`) VALUES
('822kjl85a-', '7fe0cf30-1', '25328', 'Prueba Escrita', 20, '197656cd-1', 7, NULL),
('884bf785-5', '7fe0cf30-1', '25328', 'Asignacion', 2.5, '197656cd-1', 3, '0000-00-00'),
('884kjl85a-', '7fe0cf30-1', '25328', 'Trabajo Escrito 1', 2.5, '197656cd-1', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `evualuaciones_usuarios`
--

CREATE TABLE `evualuaciones_usuarios` (
  `id_evaluacion` varchar(10) NOT NULL,
  `nrc` varchar(20) NOT NULL,
  `id_tema` varchar(10) NOT NULL,
  `id_usuario` varchar(10) NOT NULL,
  `nota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `periodos`
--

CREATE TABLE `periodos` (
  `id` varchar(10) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `periodos`
--

INSERT INTO `periodos` (`id`, `nombre`, `fecha_inicio`, `fecha_fin`) VALUES
('197656cd-1', 'Mar-Jul-2020', '2020-04-24', '2020-08-15');

-- --------------------------------------------------------

--
-- Table structure for table `semanas`
--

CREATE TABLE `semanas` (
  `id_periodo` varchar(10) NOT NULL,
  `numero` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `semanas`
--

INSERT INTO `semanas` (`id_periodo`, `numero`, `fecha_inicio`, `fecha_fin`) VALUES
('197656cd-1', 1, '2020-04-27', '2020-05-01'),
('197656cd-1', 2, '2020-05-04', '2020-05-08'),
('197656cd-1', 3, '2020-05-11', '2020-05-15'),
('197656cd-1', 4, '2020-05-18', '2020-05-22'),
('197656cd-1', 5, '2020-05-25', '2020-05-29'),
('197656cd-1', 6, '2020-06-01', '2020-06-05'),
('197656cd-1', 7, '2020-06-08', '2020-06-12'),
('197656cd-1', 8, '2020-06-15', '2020-06-19'),
('197656cd-1', 9, '2020-06-22', '2020-06-26'),
('197656cd-1', 10, '2020-06-29', '2020-07-03'),
('197656cd-1', 11, '2020-07-06', '2020-07-10'),
('197656cd-1', 12, '2020-07-13', '2020-07-17'),
('197656cd-1', 13, '2020-07-20', '2020-07-24'),
('197656cd-1', 14, '2020-07-27', '2020-07-31'),
('197656cd-1', 15, '2020-08-03', '2020-08-07'),
('197656cd-1', 16, '2020-08-10', '2020-08-14');

-- --------------------------------------------------------

--
-- Table structure for table `subtemas`
--

CREATE TABLE `subtemas` (
  `id` varchar(10) NOT NULL,
  `id_tema` varchar(10) NOT NULL,
  `nrc` varchar(20) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subtemas`
--

INSERT INTO `subtemas` (`id`, `id_tema`, `nrc`, `nombre`, `descripcion`) VALUES
('199b34b4-2', '7fe2cf30-2', '25328', 'Control y retroalimentación', NULL),
('299b34b4-2', '7fe2cf30-2', '25328', 'Control y retroalimentación', NULL),
('39477e16-6', '7fe0cf30-1', '25328', 'Sistemas abiertas y cerrados', NULL),
('39477e36-6', '7fe0cf30-1', '25328', 'Control y retroalimentación', NULL),
('39477e86-6', '7fe0cf30-1', '25328', 'Componentes de un sistema', NULL),
('399b34b4-2', '7fe2cf30-2', '25328', 'Control y retroalimentación', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `temas`
--

CREATE TABLE `temas` (
  `id` varchar(10) NOT NULL,
  `nrc` varchar(20) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(120) DEFAULT NULL,
  `ponderacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temas`
--

INSERT INTO `temas` (`id`, `nrc`, `nombre`, `descripcion`, `ponderacion`) VALUES
('7fe0cf30-1', '25328', '1. Concepción de Sistemas', NULL, NULL),
('7fe1cf30-7', '25328', '7. Diseño Global', NULL, NULL),
('7fe2cf30-2', '25328', '2. Sistemas Informáticos', NULL, NULL),
('7fe4cf30-3', '25328', '3. El Proceso de Desarrollo de Software', NULL, NULL),
('7fe5cf30-4', '25328', '4. Metodologías para el Desarrollo de So', NULL, NULL),
('7fe7cf30-5', '25328', '5. Inicio del Proyecto', NULL, NULL),
('7fe7cf30-6', '25328', '6. Análisis', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `temas_competencias`
--

CREATE TABLE `temas_competencias` (
  `id_competencia` varchar(10) NOT NULL,
  `nrc` varchar(20) NOT NULL,
  `id_tema` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temas_competencias`
--

INSERT INTO `temas_competencias` (`id_competencia`, `nrc`, `id_tema`) VALUES
('414a94a6-b', '7fe0cf30-1', '25328'),
('a04956f0-8', '7fe0cf30-1', '25328'),
('bc6e49d4-9', '7fe0cf30-1', '25328'),
('414a94a6-b', '7fe2cf30-2', '25328'),
('a04956f0-8', '7fe2cf30-2', '25328'),
('bc6e49d4-9', '7fe2cf30-2', '25328'),
('414a94a6-b', '7fe4cf30-3', '25328'),
('a04956f0-8', '7fe4cf30-3', '25328'),
('bc6e49d4-9', '7fe4cf30-3', '25328');

-- --------------------------------------------------------

--
-- Table structure for table `temas_semanas`
--

CREATE TABLE `temas_semanas` (
  `id_tema` varchar(10) NOT NULL,
  `nrc` varchar(20) NOT NULL,
  `id_periodo` varchar(10) NOT NULL,
  `numero_semana` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temas_semanas`
--

INSERT INTO `temas_semanas` (`id_tema`, `nrc`, `id_periodo`, `numero_semana`) VALUES
('7fe0cf30-1', '25328', '197656cd-1', 1),
('7fe0cf30-1', '25328', '197656cd-1', 6),
('7fe2cf30-2', '25328', '197656cd-1', 4),
('7fe2cf30-2', '25328', '197656cd-1', 6);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` varchar(10) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `tipo`, `password`) VALUES
('71G104f0-8', 'Jesus Gonzalez', 'jesus@ucab.edu.ve', 'profesor', '1234'),
('71G10cf0-8', 'Oriana Renaud', 'oriana@ucab.edu.ve', 'profesor', '1234'),
('71G20cf0-8', 'Felix Lopez', 'felix@est.ucab.edu.ve', 'estudiante', '1234'),
('71G21cf0-8', 'Andrea Torres', 'andrea@est.ucab.edu.ve', 'estudiante', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_asignaturas`
--

CREATE TABLE `usuarios_asignaturas` (
  `id_usuario` varchar(10) NOT NULL,
  `nrc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios_asignaturas`
--

INSERT INTO `usuarios_asignaturas` (`id_usuario`, `nrc`) VALUES
('71G104f0-8', '25503'),
('71G10cf0-8', '25328'),
('71G20cf0-8', '25328'),
('71G21cf0-8', '25328');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id_actividad`,`nrc`,`id_tema`),
  ADD KEY `actividadestema` (`nrc`,`id_tema`);

--
-- Indexes for table `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`nrc`);

--
-- Indexes for table `asignaturas_competencias`
--
ALTER TABLE `asignaturas_competencias`
  ADD PRIMARY KEY (`id_competencia`,`nrc`),
  ADD KEY `acasignatura` (`nrc`);

--
-- Indexes for table `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`nrc`,`id_usuario`,`id_periodo`,`numero_semana`,`fecha`),
  ADD KEY `asistenciasusuarios` (`id_usuario`),
  ADD KEY `asistenciassemanas` (`id_periodo`,`numero_semana`);

--
-- Indexes for table `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carreras_asignaturas`
--
ALTER TABLE `carreras_asignaturas`
  ADD PRIMARY KEY (`id_carrera`,`nrc`),
  ADD KEY `caasignaturas` (`nrc`);

--
-- Indexes for table `competencias`
--
ALTER TABLE `competencias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criterios`
--
ALTER TABLE `criterios`
  ADD PRIMARY KEY (`id_criterio`,`id_competencia`),
  ADD KEY `crieterioscompetencias` (`id_competencia`);

--
-- Indexes for table `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`id`,`nrc`,`id_tema`),
  ADD KEY `evualuaciontema` (`nrc`,`id_tema`),
  ADD KEY `evaluacionsemana` (`id_periodo`,`numero_semana`);

--
-- Indexes for table `evualuaciones_usuarios`
--
ALTER TABLE `evualuaciones_usuarios`
  ADD PRIMARY KEY (`id_evaluacion`,`nrc`,`id_tema`,`id_usuario`),
  ADD KEY `euusuarios` (`id_usuario`);

--
-- Indexes for table `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semanas`
--
ALTER TABLE `semanas`
  ADD PRIMARY KEY (`id_periodo`,`numero`);

--
-- Indexes for table `subtemas`
--
ALTER TABLE `subtemas`
  ADD PRIMARY KEY (`id`,`id_tema`,`nrc`),
  ADD KEY `subtemastemas` (`id_tema`,`nrc`);

--
-- Indexes for table `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`id`,`nrc`),
  ADD KEY `temasasignatura` (`nrc`);

--
-- Indexes for table `temas_competencias`
--
ALTER TABLE `temas_competencias`
  ADD PRIMARY KEY (`nrc`,`id_tema`,`id_competencia`),
  ADD KEY `tccompetencias` (`id_competencia`);

--
-- Indexes for table `temas_semanas`
--
ALTER TABLE `temas_semanas`
  ADD PRIMARY KEY (`id_tema`,`nrc`,`id_periodo`,`numero_semana`),
  ADD KEY `tssemanas` (`id_periodo`,`numero_semana`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios_asignaturas`
--
ALTER TABLE `usuarios_asignaturas`
  ADD PRIMARY KEY (`id_usuario`,`nrc`),
  ADD KEY `uaasignatura` (`nrc`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividadestema` FOREIGN KEY (`nrc`,`id_tema`) REFERENCES `temas` (`id`, `nrc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `asignaturas_competencias`
--
ALTER TABLE `asignaturas_competencias`
  ADD CONSTRAINT `acasignatura` FOREIGN KEY (`nrc`) REFERENCES `asignaturas` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accompetenacias` FOREIGN KEY (`id_competencia`) REFERENCES `competencias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistenciasasignatura` FOREIGN KEY (`nrc`) REFERENCES `asignaturas` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asistenciassemanas` FOREIGN KEY (`id_periodo`,`numero_semana`) REFERENCES `semanas` (`id_periodo`, `numero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asistenciasusuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carreras_asignaturas`
--
ALTER TABLE `carreras_asignaturas`
  ADD CONSTRAINT `caasignaturas` FOREIGN KEY (`nrc`) REFERENCES `asignaturas` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cacarreras` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `criterios`
--
ALTER TABLE `criterios`
  ADD CONSTRAINT `crieterioscompetencias` FOREIGN KEY (`id_competencia`) REFERENCES `competencias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD CONSTRAINT `evaluacionsemana` FOREIGN KEY (`id_periodo`,`numero_semana`) REFERENCES `semanas` (`id_periodo`, `numero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `evualuaciontema` FOREIGN KEY (`nrc`,`id_tema`) REFERENCES `temas` (`id`, `nrc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evualuaciones_usuarios`
--
ALTER TABLE `evualuaciones_usuarios`
  ADD CONSTRAINT `euevaluaciones` FOREIGN KEY (`id_evaluacion`,`nrc`,`id_tema`) REFERENCES `evaluaciones` (`id`, `nrc`, `id_tema`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `euusuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `semanas`
--
ALTER TABLE `semanas`
  ADD CONSTRAINT `semanasperiodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subtemas`
--
ALTER TABLE `subtemas`
  ADD CONSTRAINT `subtemastemas` FOREIGN KEY (`id_tema`,`nrc`) REFERENCES `temas` (`id`, `nrc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temas`
--
ALTER TABLE `temas`
  ADD CONSTRAINT `temasasignatura` FOREIGN KEY (`nrc`) REFERENCES `asignaturas` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temas_competencias`
--
ALTER TABLE `temas_competencias`
  ADD CONSTRAINT `tccompetencias` FOREIGN KEY (`id_competencia`) REFERENCES `competencias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tctemas` FOREIGN KEY (`nrc`,`id_tema`) REFERENCES `temas` (`id`, `nrc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temas_semanas`
--
ALTER TABLE `temas_semanas`
  ADD CONSTRAINT `tssemanas` FOREIGN KEY (`id_periodo`,`numero_semana`) REFERENCES `semanas` (`id_periodo`, `numero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tstemas` FOREIGN KEY (`id_tema`,`nrc`) REFERENCES `temas` (`id`, `nrc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuarios_asignaturas`
--
ALTER TABLE `usuarios_asignaturas`
  ADD CONSTRAINT `uaasignatura` FOREIGN KEY (`nrc`) REFERENCES `asignaturas` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `uausuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
