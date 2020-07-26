-- BD Grupo Uno

CREATE TABLE `usuario` (
`cedula` int(10) NOT NULL,
`nombre` varchar(30) NOT NULL,
`correo` varchar(25) NOT NULL,
`password` varchar(25) NOT NULL, 
PRIMARY KEY (`cedula`) 
);

CREATE TABLE `periodo` (
`id` int(6) NOT NULL,
`nombre` varchar(25) NOT NULL,
`fecha_inicio` date NOT NULL,
`fecha_fin` date NOT NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `semana` (
`numero` int(2) NOT NULL,
`id_periodo` int(6) NOT NULL,
`fecha_inicio` date NOT NULL,
`fecha_fin` date NOT NULL,
PRIMARY KEY (`numero`, `id_periodo`),

FOREIGN KEY ( `id_periodo` ) REFERENCES `periodo` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `carrera` (
`id` int(6) NOT NULL,
`nombre` varchar(30) NOT NULL,
`descripcion` text NOT NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `asignatura` (
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

CREATE TABLE `carrera_asignatura` (
`id_carrera` integer(6) NOT NULL,
`nrc_asignatura` integer(6) NOT NULL,
PRIMARY KEY (`id_carrera`, `nrc_asignatura`),

FOREIGN KEY ( `id_carrera` ) REFERENCES `carrera` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `nrc_asignatura` ) REFERENCES `asignatura` ( `nrc` ) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE `tema` (
`id` int(6) NOT NULL,
`nrc_asignatura` int(6) NOT NULL,
`nombre` varchar(60) NOT NULL,
`ponderacion` int(3) NOT NULL,
PRIMARY KEY (`id`),

FOREIGN KEY ( `nrc_asignatura` ) REFERENCES `asignatura` ( `nrc` ) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `subtema` (
`id` integer(6) NOT NULL,
`id_tema` integer(6) NOT NULL,
`numero` integer(3) NOT NULL,
`nombre` text NOT NULL,
PRIMARY KEY (`id`, `id_tema`),

FOREIGN KEY ( `id_tema` ) REFERENCES `tema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `subtema_subtema` (
`id_subtema` integer(6) NOT NULL,
`id_subtema_subtema` integer(6) NOT NULL,
PRIMARY KEY (`id_subtema`, `id_subtema_subtema`),

FOREIGN KEY ( `id_subtema` ) REFERENCES `subtema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `id_subtema_subtema` ) REFERENCES `subtema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `actividad` (
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

CREATE TABLE `asignatura_usuario` (
`cedula_usuario` int(10) NOT NULL,
`nrc_asignatura` int(6) NOT NULL,
`id_periodo` int(6) NOT NULL,
`tipo_usuario` varchar(25) NOT NULL,
PRIMARY KEY (`cedula_usuario`, `nrc_asignatura`, `id_periodo`),

FOREIGN KEY ( `cedula_usuario` ) REFERENCES `usuario` ( `cedula` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `nrc_asignatura` ) REFERENCES `asignatura` ( `nrc` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `id_periodo` ) REFERENCES `periodo` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `evaluacion` (
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

CREATE TABLE `tema_semana` (
`id_tema` int(6) NOT NULL,
`numero_semana` int(2) NOT NULL,
`id_periodo` int(6) NOT NULL,
PRIMARY KEY (`id_tema`, `numero_semana`, `id_periodo`),

FOREIGN KEY ( `id_tema` ) REFERENCES `tema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `numero_semana` ) REFERENCES `semana` ( `numero` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `id_periodo` ) REFERENCES `periodo` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `tema_evaluacion` (
`id_evaluacion` int(6) NOT NULL,
`id_tema` int(6) NOT NULL,
PRIMARY KEY (`id_evaluacion`, `id_tema`),

FOREIGN KEY ( `id_evaluacion` ) REFERENCES `evaluacion` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( `id_tema` ) REFERENCES `tema` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE `evaluacion_usuario` (
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

CREATE TABLE `asistencia` (
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

CREATE TABLE `horario` (
`nrc_asignatura` int(6) NOT NULL,
`dia` varchar(15) NOT NULL,
`hora_inicio` time NOT NULL,
`hora_fin` time NOT NULL,
PRIMARY KEY (`nrc_asignatura`, `dia`),

FOREIGN KEY ( `nrc_asignatura` ) REFERENCES `asignatura` ( `nrc` ) ON DELETE CASCADE ON UPDATE CASCADE
);
