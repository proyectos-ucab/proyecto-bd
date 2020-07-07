CREATE TABLE `asignaturas` (
`nrc` varchar(20) NOT NULL,
`nombre` varchar(40) NOT NULL,
`semestre` int NOT NULL,
`unidad_credito` int NULL,
`descripcion` varchar(120) NULL,
`codigo` varchar(10) NULL,
PRIMARY KEY (`nrc`) 
);
CREATE TABLE `carreras` (
`id` varchar(10) NOT NULL,
`nombre` varchar(40) NOT NULL,
`descripcion` varchar(120) NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `usuarios` (
`id` varchar(10) NOT NULL,
`nombre` varchar(40) NOT NULL,
`correo` varchar(40) NOT NULL,
`tipo` varchar(10) NULL,
`password` varchar(255) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `temas` (
`id` varchar(10) NOT NULL,
`nrc` varchar(20) NOT NULL,
`nombre` varchar(40) NOT NULL,
`descripcion` varchar(120) NULL,
`ponderacion` int NULL,
PRIMARY KEY (`id`, `nrc`) 
);
CREATE TABLE `subtemas` (
`id` varchar(10) NOT NULL,
`id_tema` varchar(10) NOT NULL,
`nrc` varchar(20) NOT NULL,
`nombre` varchar(40) NOT NULL,
`descripcion` varchar(120) NULL,
PRIMARY KEY (`id`, `id_tema`, `nrc`) 
);
CREATE TABLE `componentes` (
`id` varchar(10) NOT NULL,
`nrc` varchar(20) NOT NULL,
`id_tema` varchar(10) NOT NULL,
`semana_inicio` varchar(10) NOT NULL,
`semana_fin` varchar(10) NOT NULL,
`id_periodo` varchar(10) NOT NULL,
PRIMARY KEY (`id`, `nrc`, `id_tema`) 
);
CREATE TABLE `actividades` (
`id_actividad` varchar(10) NOT NULL,
`nrc` varchar(20) NOT NULL,
`id_tema` varchar(10) NULL,
`tipo` varchar(20) NOT NULL,
`descripcion` varchar(255) NULL,
`plataforma` varchar(255) NULL,
`recurso` varchar(255) NULL,
`frecuencia` varchar(255) NULL,
PRIMARY KEY (`id_actividad`) 
);
CREATE TABLE `evaluaciones` (
`id` varchar(10) NOT NULL,
`nrc` varchar(20) NOT NULL,
`id_tema` varchar(10) NOT NULL,
`descripcion` varchar(120) NULL,
`ponderacion` float NULL,
`id_periodo` varchar(10) NULL,
`numero_semana` int NULL,
`fecha` date NULL,
PRIMARY KEY (`id`, `nrc`, `id_tema`) 
);
CREATE TABLE `competencias` (
`id` varchar(10) NOT NULL,
`nombre` varchar(100) NOT NULL,
`codigo` varchar(10) NULL,
`descripcion` varchar(255) NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `criterios` (
`id_criterio` varchar(10) NOT NULL,
`id_competencia` varchar(10) NOT NULL,
`nombre` varchar(100) NOT NULL,
`codigo` varchar(10) NULL,
`descripcion` varchar(255) NULL,
PRIMARY KEY (`id_criterio`, `id_competencia`) 
);
CREATE TABLE `periodos` (
`id` varchar(10) NOT NULL,
`nombre` varchar(40) NULL,
`fecha_inicio` date NOT NULL,
`fecha_fin` date NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `semanas` (
`id_periodo` varchar(10) NOT NULL,
`numero` int NOT NULL,
`fecha_inicio` date NOT NULL,
`fecha_fin` date NOT NULL,
PRIMARY KEY (`id_periodo`, `numero`) 
);
CREATE TABLE `carreras_asignaturas` (
`id_carrera` varchar(10) NOT NULL,
`nrc` varchar(20) NOT NULL,
PRIMARY KEY (`id_carrera`, `nrc`) 
);
CREATE TABLE `temas_semanas` (
`id_tema` varchar(10) NOT NULL,
`nrc` varchar(20) NOT NULL,
`id_periodo` varchar(10) NOT NULL,
`numero_semana` int NOT NULL,
PRIMARY KEY (`id_tema`, `nrc`, `id_periodo`, `numero_semana`) 
);
CREATE TABLE `asignaturas_competencias` (
`nrc` varchar(20) NOT NULL,
`id_competencia` varchar(10) NOT NULL,
PRIMARY KEY (`id_competencia`, `nrc`) 
);
CREATE TABLE `temas_competencias` (
`id_competencia` varchar(10) NOT NULL,
`nrc` varchar(20) NOT NULL,
`id_tema` varchar(10) NOT NULL,
PRIMARY KEY (`nrc`, `id_tema`, `id_competencia`) 
);
CREATE TABLE `usuarios_asignaturas` (
`id_usuario` varchar(10) NOT NULL,
`nrc` varchar(20) NOT NULL,
PRIMARY KEY (`id_usuario`, `nrc`) 
);
CREATE TABLE `asistencias` (
`nrc` varchar(20) NOT NULL,
`id_usuario` varchar(10) NOT NULL,
`id_periodo` varchar(10) NOT NULL,
`numero_semana` int NOT NULL,
`fecha` date NOT NULL,
`asistente` tinyint NULL,
PRIMARY KEY (`nrc`, `id_usuario`, `id_periodo`, `numero_semana`, `fecha`) 
);
CREATE TABLE `evualuaciones_usuarios` (
`id_evaluacion` varchar(10) NOT NULL,
`nrc` varchar(20) NOT NULL,
`id_tema` varchar(10) NOT NULL,
`id_usuario` varchar(10) NOT NULL,
`nota` int NULL,
PRIMARY KEY (`id_evaluacion`, `nrc`, `id_tema`, `id_usuario`) 
);

ALTER TABLE `carreras_asignaturas` ADD CONSTRAINT `cacarreras` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `carreras_asignaturas` ADD CONSTRAINT `caasignaturas` FOREIGN KEY (`nrc`) REFERENCES `asignaturas` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `temas` ADD CONSTRAINT `temasasignatura` FOREIGN KEY (`nrc`) REFERENCES `asignaturas` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `subtemas` ADD CONSTRAINT `subtemastemas` FOREIGN KEY (`id_tema`, `nrc`) REFERENCES `temas` (`id`, `nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `criterios` ADD CONSTRAINT `crieterioscompetencias` FOREIGN KEY (`id_competencia`) REFERENCES `competencias` () ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `semanas` ADD CONSTRAINT `semanasperiodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `componentes` ADD CONSTRAINT `componentefechainicio` FOREIGN KEY (`semana_inicio`, `id_periodo`) REFERENCES `semanas` (`id_periodo`, `numero`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `componentes` ADD CONSTRAINT `componentefechafin` FOREIGN KEY (`semana_fin`, `id_periodo`) REFERENCES `semanas` (`id_periodo`, `numero`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `componentes` ADD CONSTRAINT `componentesasignatura` FOREIGN KEY (`nrc`) REFERENCES `asignaturas` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `componentes` ADD CONSTRAINT `componentestemas` FOREIGN KEY (`nrc`, `id_tema`) REFERENCES `temas` (`id`, `nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `actividades` ADD CONSTRAINT `actividadestema` FOREIGN KEY (`nrc`, `id_tema`) REFERENCES `temas` (`id`, `nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `evaluaciones` ADD CONSTRAINT `evualuaciontema` FOREIGN KEY (`nrc`, `id_tema`) REFERENCES `temas` (`id`, `nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `evaluaciones` ADD CONSTRAINT `evaluacionsemana` FOREIGN KEY (`id_periodo`, `numero_semana`) REFERENCES `semanas` (`id_periodo`, `numero`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `temas_semanas` ADD CONSTRAINT `tstemas` FOREIGN KEY (`id_tema`, `nrc`) REFERENCES `temas` (`id`, `nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `temas_semanas` ADD CONSTRAINT `tssemanas` FOREIGN KEY (`id_periodo`, `numero_semana`) REFERENCES `semanas` (`id_periodo`, `numero`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `asignaturas_competencias` ADD CONSTRAINT `acasignatura` FOREIGN KEY (`nrc`) REFERENCES `asignaturas` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `asignaturas_competencias` ADD CONSTRAINT `accompetenacias` FOREIGN KEY (`id_competencia`) REFERENCES `competencias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `temas_competencias` ADD CONSTRAINT `tccompetencias` FOREIGN KEY (`id_competencia`) REFERENCES `competencias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `temas_competencias` ADD CONSTRAINT `tctemas` FOREIGN KEY (`nrc`, `id_tema`) REFERENCES `temas` (`id`, `nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `usuarios_asignaturas` ADD CONSTRAINT `uaasignatura` FOREIGN KEY (`nrc`) REFERENCES `asignaturas` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `usuarios_asignaturas` ADD CONSTRAINT `uausuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `asistencias` ADD CONSTRAINT `asistenciasusuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `asistencias` ADD CONSTRAINT `asistenciasasignatura` FOREIGN KEY (`nrc`) REFERENCES `asignaturas` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `asistencias` ADD CONSTRAINT `asistenciassemanas` FOREIGN KEY (`id_periodo`, `numero_semana`) REFERENCES `semanas` (`id_periodo`, `numero`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `evualuaciones_usuarios` ADD CONSTRAINT `euusuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `evualuaciones_usuarios` ADD CONSTRAINT `euevaluaciones` FOREIGN KEY (`id_evaluacion`, `nrc`, `id_tema`) REFERENCES `evaluaciones` (`id`, `nrc`, `id_tema`) ON DELETE CASCADE ON UPDATE CASCADE;


INSERT INTO usuarios (id, nombre, correo , tipo, `password` )
VALUES 
('71G20cf0-8', 'Felix Lopez', 'felix@est.ucab.edu.ve', 'estudiante', '1234');
INSERT INTO usuarios (id, nombre, correo , tipo, `password` )
VALUES 
('71G21cf0-8', 'Andrea Torres', 'andrea@est.ucab.edu.ve', 'estudiante', '1234');
INSERT INTO usuarios (id, nombre, correo , tipo, `password` )
VALUES 
('71G10cf0-8', 'Oriana Renaud', 'oriana@ucab.edu.ve', 'profesor', '1234');
INSERT INTO usuarios (id, nombre, correo , tipo, `password` )
VALUES 
('71G104f0-8', 'Jesus Gonzalez', 'jesus@ucab.edu.ve', 'profesor', '1234');



-- INSERTAR EN TEMAS
INSERT INTO temas (id, nrc, nombre, ponderacion)
VALUES ('7fe0cf30-8', '25328', 'Concepción de Sistemas', NULL);
INSERT INTO temas (id, nrc, nombre, ponderacion)
VALUES ('7fe2cf30-8', '25328', 'Sistemas Informáticos', NULL);
INSERT INTO temas (id, nrc, nombre, ponderacion)
VALUES ('7fe4cf30-8', '25328', ' El Proceso de Desarrollo de Software', NULL);
INSERT INTO temas (id, nrc, nombre, ponderacion)
VALUES ('7fe5cf30-8', '25328', 'Metodologías para el Desarrollo de Software', NULL);
INSERT INTO temas (id, nrc, nombre, ponderacion)
VALUES ('7fe7cf30-8', '25328', 'Inicio del Proyecto', NULL);
INSERT INTO temas (id, nrc, nombre, ponderacion)
VALUES ('7fe1cf30-8', '25328', 'Análisis', NULL);
INSERT INTO temas (id, nrc, nombre, ponderacion)
VALUES ('7fe1cf30-8', '25328', 'Diseño Global', NULL);

-- TEMA 1 METODOLOGIA DEL SOFTWARE
INSERT INTO subtemas (id, id_tema, nrc, nombre, descripcion)
VALUES ( 
  '39477e86-6',
  '7fe0cf30-8',
  '25328',
  'Componentes de un sistema', 
  NULL );
INSERT INTO subtemas (id, id_tema, nrc, nombre, descripcion)
VALUES ( 
  '39477e16-6',
  '7fe0cf30-8',
  '25328',
  'Sistemas abiertas y cerrados', 
  NULL );
INSERT INTO subtemas (id, id_tema, nrc, nombre, descripcion)
VALUES ( 
  '39477e36-6',
  '7fe0cf30-8',
  '25328',
  'Control y retroalimentación', 
  NULL );

-- TEMA 2 METODOLOGIA DEL SOFTWARE
INSERT INTO subtemas (id, id_tema, nrc, nombre, descripcion)
VALUES ( 
  '199b34b4-2',
  '7fe2cf30-8',
  '25328',
  'Control y retroalimentación', 
  NULL );
INSERT INTO subtemas (id, id_tema, nrc, nombre, descripcion)
VALUES ( 
  '299b34b4-2',
  '7fe2cf30-8',
  '25328',
  'Control y retroalimentación', 
  NULL );
INSERT INTO subtemas (id, id_tema, nrc, nombre, descripcion)
VALUES ( 
  '399b34b4-2',
  '7fe2cf30-8',
  '25328',
  'Control y retroalimentación', 
  NULL );


