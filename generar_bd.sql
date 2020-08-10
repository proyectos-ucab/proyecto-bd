-- BD Grupo Uno

DROP TABLE IF EXISTS usuario;

CREATE TABLE IF NOT EXISTS usuario (
cedula INT NOT NULL,
nombre varchar(30) NOT NULL,
correo varchar(255) NOT NULL CHECK (correo LIKE '%est.ucab.edu.ve' OR correo LIKE '%ucab.edu.ve'),
password varchar(255) NOT NULL, 
role varchar(255) NULL,
PRIMARY KEY (cedula),
UNIQUE (correo)
);


DROP TABLE IF EXISTS periodo;
CREATE TABLE IF NOT EXISTS periodo (
id INT NOT NULL,
nombre varchar(25) NOT NULL,
fecha_inicio date NOT NULL,
fecha_fin date NOT NULL,
PRIMARY KEY (id) 
);

DROP TABLE IF EXISTS semana ;
CREATE TABLE IF NOT EXISTS semana (
numero INT NOT NULL,
id_periodo INT NOT NULL,
fecha_inicio date NOT NULL,
fecha_fin date NOT NULL,
PRIMARY KEY (numero, id_periodo),

FOREIGN KEY ( id_periodo ) REFERENCES periodo ( id ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS carrera;
CREATE TABLE IF NOT EXISTS carrera (
id INT NOT NULL,
nombre varchar(30) NOT NULL,
descripcion text NOT NULL,
PRIMARY KEY (id) 
);

DROP TABLE IF EXISTS asignatura ;
CREATE TABLE IF NOT EXISTS asignatura (
nrc INT NOT NULL,
nombre varchar(150) NOT NULL,
descripcion varchar(50) NOT NULL,
semestre INT NOT NULL,
codigo INT NOT NULL,
unidad_credito INT NOT NULL,
HT INT NOT NULL,
HP INT NOT NULL,
HL INT NOT NULL,
PRIMARY KEY (nrc) 
);

DROP TABLE IF EXISTS carrera_asignatura ;
CREATE TABLE IF NOT EXISTS carrera_asignatura (
id_carrera INT NOT NULL,
nrc_asignatura INT NOT NULL,
PRIMARY KEY (id_carrera, nrc_asignatura),

FOREIGN KEY ( id_carrera ) REFERENCES carrera ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( nrc_asignatura ) REFERENCES asignatura ( nrc ) ON DELETE CASCADE ON UPDATE CASCADE

);

DROP TABLE IF EXISTS tema ;
CREATE TABLE IF NOT EXISTS tema (
id INT NOT NULL,
nrc_asignatura INT NOT NULL,
nombre varchar(150) NOT NULL,
numero INT NOT NULL,
PRIMARY KEY ( id ),

FOREIGN KEY ( nrc_asignatura ) REFERENCES asignatura ( nrc ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS subtema;
CREATE TABLE IF NOT EXISTS subtema (
id INT NOT NULL,
id_tema INT NOT NULL,
numero INT NOT NULL,
nombre text NOT NULL,
PRIMARY KEY (id, id_tema),

FOREIGN KEY ( id_tema ) REFERENCES tema ( id ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS subtema_subtema;

CREATE TABLE IF NOT EXISTS subtema_subtema (
id_tema INT NOT NULL,
id_subtema INT NOT NULL,
id INT NOT NULL,
numero INT NOT NULL,
descripcion TEXT NOT NULL,
PRIMARY KEY (id_tema, id_subtema, id),

FOREIGN KEY ( id_subtema ,id_tema ) REFERENCES subtema ( id, id_tema ) ON DELETE CASCADE ON UPDATE CASCADE,
);

DROP TABLE IF EXISTS actividad;
CREATE TABLE IF NOT EXISTS actividad (
id INT NOT NULL,
id_tema INT NOT NULL,
tipo_usuario varchar(20) NOT NULL,
descripcion varchar(150) NOT NULL,
plataforma varchar(50) NOT NULL,
recurso varchar(50) NOT NULL,
frecuencia varchar(50) NOT NULL,
modalidad varchar(50) NOT NULL,
PRIMARY KEY (id),

FOREIGN KEY ( id_tema ) REFERENCES tema ( id ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS asignatura_usuario;
CREATE TABLE IF NOT EXISTS asignatura_usuario (
cedula_usuario INT NOT NULL,
nrc_asignatura INT NOT NULL,
id_periodo INT NOT NULL,
tipo_usuario varchar(25) NOT NULL,
PRIMARY KEY (cedula_usuario, nrc_asignatura, id_periodo),

FOREIGN KEY ( cedula_usuario ) REFERENCES usuario ( cedula ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( nrc_asignatura ) REFERENCES asignatura ( nrc ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( id_periodo ) REFERENCES periodo ( id ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS evaluacion;
CREATE TABLE IF NOT EXISTS evaluacion (
id INT NOT NULL,
id_periodo INT NOT NULL,
numero_semana INT NOT NULL,
descripcion text NOT NULL,
ponderacion INT NOT NULL,
fecha date NOT NULL,
hora time NOT NULL,
PRIMARY KEY (id),

FOREIGN KEY ( id_periodo ) REFERENCES periodo ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( numero_semana, id_periodo ) REFERENCES semana ( numero, id_periodo ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS tema_semana;
CREATE TABLE IF NOT EXISTS tema_semana (
id_tema INT NOT NULL,
numero_semana INT NOT NULL,
id_periodo INT NOT NULL,
PRIMARY KEY (id_tema, numero_semana, id_periodo ),

FOREIGN KEY ( id_tema ) REFERENCES tema ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( numero_semana, id_periodo ) REFERENCES semana ( numero, id_periodo ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS tema_evaluacion;
CREATE TABLE IF NOT EXISTS tema_evaluacion (
id_evaluacion INT NOT NULL,
id_tema INT NOT NULL,
PRIMARY KEY (id_evaluacion, id_tema),

FOREIGN KEY ( id_evaluacion ) REFERENCES evaluacion ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( id_tema ) REFERENCES tema ( id ) ON DELETE CASCADE ON UPDATE CASCADE
);


DROP TABLE IF EXISTS evaluacion_usuario;
CREATE TABLE IF NOT EXISTS evaluacion_usuario (
cedula_usuario INT NOT NULL,
id_tema INT NOT NULL,
id_evaluacion INT NOT NULL,
nrc_asignatura INT NOT NULL,
nota INT NOT NULL,
PRIMARY KEY (cedula_usuario, id_tema, id_evaluacion, nrc_asignatura),

FOREIGN KEY ( cedula_usuario ) REFERENCES usuario ( cedula ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( id_tema ) REFERENCES tema ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( id_evaluacion ) REFERENCES evaluacion ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( nrc_asignatura ) REFERENCES asignatura ( nrc ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS asistencia;
CREATE TABLE IF NOT EXISTS asistencia (
cedula_usuario INT NOT NULL,
nrc_asignatura INT NOT NULL,
id_periodo INT NOT NULL,
numero_semana INT,
hora time NOT NULL,
fecha date NOT NULL,
asistente VARCHAR ( 2 ),
PRIMARY KEY (cedula_usuario, nrc_asignatura, id_periodo, numero_semana),

FOREIGN KEY ( cedula_usuario ) REFERENCES usuario ( cedula ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( nrc_asignatura ) REFERENCES asignatura ( nrc ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( id_periodo ) REFERENCES periodo ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( numero_semana, id_periodo ) REFERENCES semana ( numero, id_periodo ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS horario;
CREATE TABLE IF NOT EXISTS horario (
nrc_asignatura INT NOT NULL,
dia varchar(15) NOT NULL,
hora_inicio time NOT NULL,
hora_fin time NOT NULL,
PRIMARY KEY (nrc_asignatura, dia),

FOREIGN KEY ( nrc_asignatura ) REFERENCES asignatura ( nrc ) ON DELETE CASCADE ON UPDATE CASCADE
);

