-- BD Grupo Uno

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE IF NOT EXISTS `usuario` (
`cedula` int(10) NOT NULL,
`nombre` varchar(30) NOT NULL,
`correo` varchar(255) NOT NULL CHECK (`correo` LIKE '%est.ucab.edu.ve%' OR `correo` LIKE '%ucab.edu.ve%'),
`password` varchar(255) NOT NULL, 
`role` varchar(255) NULL,
PRIMARY KEY (`cedula`),
UNIQUE (`correo`)
);


DROP TABLE IF EXISTS `periodo`;
CREATE TABLE IF NOT EXISTS `periodo` (
`id` int(6) NOT NULL,
`nombre` varchar(25) NOT NULL,
`fecha_inicio` date NOT NULL,
`fecha_fin` date NOT NULL,
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `semana` ;
CREATE TABLE IF NOT EXISTS `semana` (
`numero` int(2) NOT NULL,
`id_periodo` int(6) NOT NULL,
`fecha_inicio` date NOT NULL,
`fecha_fin` date NOT NULL,
PRIMARY KEY (`numero`, `id_periodo`),

FOREIGN KEY ( `id_periodo` ) REFERENCES `periodo` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `carrera`;
CREATE TABLE IF NOT EXISTS `carrera` (
`id` int(6) NOT NULL,
`nombre` varchar(30) NOT NULL,
`descripcion` text NOT NULL,
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `asignatura` ;
CREATE TABLE IF NOT EXISTS `asignatura` (
`nrc` integer(6) NOT NULL,
`nombre` varchar(150) NOT NULL,
`descripcion` varchar(50) NOT NULL,
`semestre` integer(1) NOT NULL,
`codigo` integer(3) NOT NULL,
`unidad_credito` integer(1) NOT NULL,
`HT` integer(3) NOT NULL,
`HP` integer(3) NOT NULL,
`HL` integer(3) NOT NULL,
PRIMARY KEY (`nrc`) 
);

DROP TABLE IF EXISTS `carrera_asignatura` ;
CREATE TABLE IF NOT EXISTS `carrera_asignatura` (
`id_carrera` integer(6) NOT NULL,
`nrc_asignatura` integer(6) NOT NULL,
PRIMARY KEY (`id_carrera`, `nrc_asignatura`),

FOREIGN KEY ( `id_carrera` ) REFERENCES `carrera` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `nrc_asignatura` ) REFERENCES `asignatura` ( `nrc` ) ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS `tema` ;
CREATE TABLE IF NOT EXISTS `tema` (
`id` int(6) NOT NULL,
`nrc_asignatura` int(6) NOT NULL,
`nombre` varchar(60) NOT NULL,
`ponderacion` int(3) NOT NULL,
PRIMARY KEY (`id`),

FOREIGN KEY ( `nrc_asignatura` ) REFERENCES `asignatura` ( `nrc` ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `subtema`;
CREATE TABLE IF NOT EXISTS `subtema` (
`id` integer(6) NOT NULL,
`id_tema` integer(6) NOT NULL,
`numero` integer(3) NOT NULL,
`nombre` text NOT NULL,
PRIMARY KEY (`id`, `id_tema`),

FOREIGN KEY ( `id_tema` ) REFERENCES `tema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `subtema_subtema`;
CREATE TABLE IF NOT EXISTS `subtema_subtema` (
`id_subtema` integer(6) NOT NULL,
`id_subtema_subtema` integer(6) NOT NULL,
PRIMARY KEY (`id_subtema`, `id_subtema_subtema`),

FOREIGN KEY ( `id_subtema` ) REFERENCES `subtema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `id_subtema_subtema` ) REFERENCES `subtema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `actividad`;
CREATE TABLE IF NOT EXISTS `actividad` (
`id` int(6) NOT NULL,
`id_tema` int(6) NOT NULL,
`tipo_usuario` varchar(20) NOT NULL,
`descripcion` varchar(150) NOT NULL,
`plataforma` varchar(50) NOT NULL,
`recuerso` varchar(50) NOT NULL,
`frecuencia` varchar(50) NOT NULL,
`modalidad` varchar(50) NOT NULL,
PRIMARY KEY (`id`),

FOREIGN KEY ( `id_tema` ) REFERENCES `tema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `asignatura_usuario`;
CREATE TABLE IF NOT EXISTS `asignatura_usuario` (
`cedula_usuario` int(10) NOT NULL,
`nrc_asignatura` int(6) NOT NULL,
`id_periodo` int(6) NOT NULL,
`tipo_usuario` varchar(25) NOT NULL,
PRIMARY KEY (`cedula_usuario`, `nrc_asignatura`, `id_periodo`),

FOREIGN KEY ( `cedula_usuario` ) REFERENCES `usuario` ( `cedula` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `nrc_asignatura` ) REFERENCES `asignatura` ( `nrc` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `id_periodo` ) REFERENCES `periodo` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `evaluacion`;
CREATE TABLE IF NOT EXISTS `evaluacion` (
`id` int(6) NOT NULL,
`id_periodo` int(6) NOT NULL,
`numero_semana` int(2) NOT NULL,
`descripcion` text NOT NULL,
`ponderacion` integer(2) NOT NULL,
`plataforma` varchar(20) NOT NULL,
`recurso` varchar(20) NOT NULL,
`modalidad` varchar(20) NOT NULL,
`frecuencia` varchar(20) NOT NULL,
`hora` time NULL,
PRIMARY KEY (`id`),

FOREIGN KEY ( `id_periodo` ) REFERENCES `periodo` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `numero_semana` ) REFERENCES `semana` ( `numero` ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `tema_semana`;
CREATE TABLE IF NOT EXISTS `tema_semana` (
`id_tema` int(6) NOT NULL,
`numero_semana` int(2) NOT NULL,
`id_periodo` int(6) NOT NULL,
PRIMARY KEY (`id_tema`, `numero_semana`, `id_periodo`),

FOREIGN KEY ( `id_tema` ) REFERENCES `tema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `numero_semana` ) REFERENCES `semana` ( `numero` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `id_periodo` ) REFERENCES `periodo` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `tema_evaluacion`;
CREATE TABLE IF NOT EXISTS `tema_evaluacion` (
`id_evaluacion` int(6) NOT NULL,
`id_tema` int(6) NOT NULL,
PRIMARY KEY (`id_evaluacion`, `id_tema`),

FOREIGN KEY ( `id_evaluacion` ) REFERENCES `evaluacion` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `id_tema` ) REFERENCES `tema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE

);


DROP TABLE IF EXISTS `evaluacion_usuario`;
CREATE TABLE IF NOT EXISTS `evaluacion_usuario` (
`cedula_usuario` int(10) NOT NULL,
`id_tema` int(6) NOT NULL,
`id_evaluacion` int(6) NOT NULL,
`nrc_asignatura` int(6) NOT NULL,
`nota` int(2) NOT NULL,
PRIMARY KEY (`cedula_usuario`, `id_tema`, `id_evaluacion`, `nrc_asignatura`),

FOREIGN KEY ( `cedula_usuario` ) REFERENCES `usuario` ( `cedula` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `id_tema` ) REFERENCES `tema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `id_evaluacion` ) REFERENCES `evaluacion` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `nrc_asignatura` ) REFERENCES `asignatura` ( `nrc` ) ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE IF NOT EXISTS `asistencia` (
`cedula_usuario` int(10) NOT NULL,
`nrc_asignatura` int(6) NOT NULL,
`id_periodo` int(6) NOT NULL,
`numero_semana` int(2) NOT NULL,
`hora` time NOT NULL,
`fecha` date NOT NULL,
`asistente` int(1) NOT NULL,
PRIMARY KEY (`cedula_usuario`, `nrc_asignatura`, `id_periodo`, `numero_semana`),

FOREIGN KEY ( `cedula_usuario` ) REFERENCES `usuario` ( `cedula` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `nrc_asignatura` ) REFERENCES `asignatura` ( `nrc` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `id_periodo` ) REFERENCES `periodo` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `numero_semana` ) REFERENCES `semana` ( `numero` ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `horario`;
CREATE TABLE IF NOT EXISTS `horario` (
`nrc_asignatura` int(6) NOT NULL,
`dia` varchar(15) NOT NULL,
`hora_inicio` time NOT NULL,
`hora_fin` time NOT NULL,
PRIMARY KEY (`nrc_asignatura`, `dia`),

FOREIGN KEY ( `nrc_asignatura` ) REFERENCES `asignatura` ( `nrc` ) ON DELETE CASCADE ON UPDATE CASCADE
);

SET FOREIGN_KEY_CHECKS=1;