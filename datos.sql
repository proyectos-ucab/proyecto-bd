-- AGREGACION DE UNA CARRERA 
INSERT INTO carrera VALUES(123456,'Ingenieria en Informatica','escuela de ingenieria en informatica')

-- AGREGACION DE PERIODO

INSERT INTO periodo VALUES(02021, 'periodo 2020-2021','10/26/2020','03/05/2021')

-- AGREGACION DE SEMANA
/*1*/ INSERT INTO semana VALUES(1, 2020,'10/26/2020','10/30/2020')
/*2*/ INSERT INTO semana VALUES(2, 2020,'11/02/2020','11/06/2020')
/*3*/ INSERT INTO semana VALUES(3, 2020,'11/09/2020','11/13/2020')
/*4*/ INSERT INTO semana VALUES(4, 2020,'11/16/2020','11/20/2020')
/*5*/ INSERT INTO semana VALUES(5, 2020,'11/23/2020','11/27/2020')
/*6*/ INSERT INTO semana VALUES(5, 2020,'11/30/2020','12/04/2020')
/*7*/ INSERT INTO semana VALUES(7, 2020,'12/07/2020','12/11/2020')
/*8*/ INSERT INTO semana VALUES(8, 2020,'12/14/2020','12/18/2020')
/*9*/ INSERT INTO semana VALUES(9, 2020,'01/11/2021','01/15/2021')
/*10*/INSERT INTO semana VALUES(10, 2020,'01/18/2021','01/22/2021')
/*11*/INSERT INTO semana VALUES(11, 2020,'01/25/2021','01/29/2021')
/*12*/INSERT INTO semana VALUES(12, 2020,'02/01/2021','02/05/2021')
/*13*/INSERT INTO semana VALUES(13, 2020,'02/08/2021','02/12/2021')
/*14*/INSERT INTO semana VALUES(14, 2020,'02/15/2021','02/19/2021')
/*15*/INSERT INTO semana VALUES(15, 2020,'02/22/2021','02/26/2021')
/*16*/INSERT INTO semana VALUES(16, 2020,'03/01/2021','03/05/2021')

-- AGREGACION DE UNA ASIGNATURA
	-- Septimo semestre
INSERT INTO asignatura VALUES(25836,'programacion lineal','materia de septimo semestre',7,00019,5,2,2,0)

INSERT INTO asignatura VALUES(25832,'contabilidad general', 'materia de septimo semestre',7,00007,4,2,1,0)

INSERT INTO asignatura VALUES(25472,'redes de computadores II','materia de septimo semestre',7,00152,8,4,0,2)

INSERT INTO asignatura VALUES(25503,'sistemas de bases de datos II','materia de septimo semestre',7,00150,5,2,2,0)

INSERT INTO asignatura VALUES(25328,'metodologia del software','materia de septimo semestre',7,00151,6,4,0,0)

INSERT INTO asignatura VALUES(25249,'ingles I','materia de septimo semestre',7,00217,5,2,0,2)

-- AGREGAR DE CARRERA_ASIGNATURA
	-- Relacion carrera_asignatura
	
INSERT INTO carrera_asignatura VALUES(123456,25836) -- programacion lineal

INSERT INTO carrera_asignatura VALUES(123456,25832) -- contabilidad general

INSERT INTO carrera_asignatura VALUES(123456,25472) -- redes de computadores II

INSERT INTO carrera_asignatura VALUES(123456,25503) -- sistemas de bases de datos II

INSERT INTO carrera_asignatura VALUES(123456,25328) -- metodologia del software

INSERT INTO carrera_asignatura VALUES(123456,25249) -- Ingles I


-- AGREGAR DE HORARIO
	--horario de asignatura
	
-- Programacion Lineal
INSERT INTO horario VALUES(25836,'lunes','07:00','09:00')
INSERT INTO horario VALUES(25836,'jueves','07:00','09:00')

-- Contabilidad General
INSERT INTO horario VALUES(25832,'lunes','11:00','14:00')

-- Redes de Computadores II
INSERT INTO horario VALUES(25472,'lunes','11:00','13:00')
INSERT INTO horario VALUES(25472,'miercoles','07:00','09:00')

--lab
INSERT INTO horario VALUES(25472,'viernes','09:00','11:00')

--Sistemas de bases de datos II

INSERT INTO horario VALUES(25503,'lunes','15:00','17:00')
INSERT INTO horario VALUES(25503,'martes','17:00','19:00')

--Metodologia del software

INSERT INTO horario VALUES(25328,'lunes','18:00','20:00')
INSERT INTO horario VALUES(25328,'miercoles','16:00','18:00')

--ingles
INSERT INTO horario VALUES(25249,'jueves','12:00','14:00')
INSERT INTO horario VALUES(25249,'viernes','13:00','15:00')


--AGREACION DE TEMA Y subtema

	--metodologia del software
	

INSERT INTO tema VALUES(123456,25328,'concepcion de sistema',1)

	INSERT INTO subtema VALUES(123465, 123456,1,'componentes de un sistema')
	INSERT INTO subtema VALUES(123464, 123456,2,'sistemas abiertos y cerrados')
	INSERT INTO subtema VALUES(123463, 123456,3,'control y retroalimentacion')

INSERT INTO tema VALUES(123457,25328,'sistemas informaticos',2)

	INSERT INTO subtema VALUES(123475, 123457,1,'los sistemas informaticos como sistemas')
	INSERT INTO subtema VALUES(123476, 123457,2,'sistemas de informacion vs sistemas informaticos')
	INSERT INTO subtema VALUES(123477, 123457,3,'clasificacion de los sistemas informaticos segun los procesos de negocio que soportan')
	

INSERT INTO tema VALUES(123458,25328,'proceso de desarrollo de software',3)
 
	INSERT INTO subtema VALUES(123485, 123458,1,'Ciclo de Vida del DS - Principios')
	INSERT INTO subtema VALUES(123484, 123458,2,'Técnica de caja de procesos para la representación del Proceso de DS')
	INSERT INTO subtema VALUES(123486, 123458,3,'Modelo de Capacidad y Madurez')
	
	
INSERT INTO tema VALUES(123459,25328,'metodologías para el desarrollo de software',4)

	INSERT INTO subtema VALUES(123495, 123459,1,'Conceptos y elementos')
	INSERT INTO subtema VALUES(123494, 123459,2,'Modelos metodológicos clásicos')
	INSERT INTO subtema VALUES(123493, 123459,3,'Modelos metodológicos ágiles')
	INSERT INTO subtema VALUES(123492, 123459,4,'Planificación del proyecto según el marco metodológico')
	

INSERT INTO tema VALUES(123467,25328,'inicio del proyecto',5)

	INSERT INTO subtema VALUES(123476, 123467,1,'Actividades, técnicas y entregables de la etapa de Inicio del Proceso de Desarrollo de Software')
	INSERT INTO subtema VALUES(123477, 123467,2,'Declaración de oportunidad / Planteamiento del problema')
	
		INSERT INTO subtema_subtema VALUES(123467,123477,123577,1,'Antecedentes,causas, síntomas')
		INSERT INTO subtema_subtema VALUES(123467,123477,133577,2,'Objetivo general y específicos')
		INSERT INTO subtema_subtema VALUES(123467,123477,123777,3,'Alcance y limitaciones')
	
		
	INSERT INTO subtema VALUES(123476, 123467,3,'Factibilidad técnica, operacional y económica de un proyecto informático')
		
	INSERT INTO subtema VALUES(123478, 123467,4,'Técnicas de levantamiento de información')
	
		INSERT INTO subtema_subtema VALUES(123467,123478,123778,1,'Entrevistas y cuestionarios')
		INSERT INTO subtema_subtema VALUES(123467,123478,133778,2,'Revisión documental')	
		INSERT INTO subtema_subtema VALUES(123467,123478,123378,3,'Observación')
		INSERT INTO subtema_subtema VALUES(123467,123478,123788,4,'Prototipos')
		
	INSERT INTO subtema VALUES(123479, 123467,5,'Propuesta del Proyecto - Documento de Visión')


INSERT INTO tema VALUES(123468,25328,'analisis',6)

	INSERT INTO subtema VALUES(124486, 123468,1,'Actividades, técnicas y entregables de la etapa de Análisis del Proceso de Desarrollo de Software')
	
	INSERT INTO subtema VALUES(113486, 123468,2,'Técnicas de análisis de requerimientos ')
	
		INSERT INTO subtema_subtema VALUES(123468,123486,122386,1,'Clasificación de Requerimientos Funcionales y No Funcionales ')
		INSERT INTO subtema_subtema VALUES(123468,123486,113486,2,' Diagrama de procesos')
		INSERT INTO subtema_subtema VALUES(123468,123486,123484,3,'Diagrama de casos')
		INSERT INTO subtema_subtema VALUES(123468,123486,123446,4,'Modelo E-R - Estrella')
	
	INSERT INTO subtema VALUES(123466, 123468,3,' Documento de Especificación de Requerimientos de Software (SRS) ')
	
INSERT INTO tema VALUES(123469,25328,'diseño global',7)

	INSERT INTO subtema VALUES(124469, 123469,1,'Actividades, técnicasy entregables de la etapa de Diseño Global del Proceso de Desarrollo de Software ')
	INSERT INTO subtema VALUES(123499, 123469,2,'Diseño Arquitectónico')
	INSERT INTO subtema VALUES(223469, 123469,3,'Diseño de Datos')
	INSERT INTO subtema VALUES(123369, 123469,4,'Diseño de Interfaces')















