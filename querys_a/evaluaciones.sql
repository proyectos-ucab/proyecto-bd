
-- CRUD normal

-- CREAR 
INSERT INTO evaluacion VALUES(id,id_periodo,numero_semana,descripcion,ponderacion,plataforma,recurso,modalidad,frecuencia,fecha,hora)

--SE DEBE INSERTAR EN TEMA_EVALUACION

INSERT INTO tema_evaluacion VALUES ( id_evaluacion_creada, id_tema_dado ) 


-- seleccion de datos lo que vi en figma que es el numero de tema, semana, descripcion hora y fecha
/* ten en cuenta que en el arreglo se crearan n tuplas dependediendo de la cantidad de temas numero de tema, porque cada numero es una tupla es decir fila*/
SELECT (evaluacion.numero_semana,evaluacion.descripcion,evaluacion.ponderacion,evaluacion.fecha,evaluacion.hora,tema.numero)
  FROM evaluacion,asignatura, tema_evaluacion
    Where(evaluacion.id ="id_evaluacion_dado")AND
         (evaluacion.id = tema_evaluacion.id_evaluacion) AND
         (tema_evaluacion.id_tema ="id_tema_dado")AND
         (tema.nrc_asignatura = "id_asignatura_dado");
         
-- actualizar
UPDATE evaluacion SET numero_semana= , descripcion = "",ponderacion = ,plataforma = "",recurso = "",modalidad = "",frecuencia = "",fecha = "",hora = "")
    Where(evaluacion.id ="id_evaluacion_dado")AND
         (evaluacion.id = tema_evaluacion.id_evaluacion) AND
         (tema_evaluacion.id_tema ="id_tema_dado")AND
         (tema.nrc_asignatura = "id_asignatura_dado");
         
--Eliminar
DELETE FROM evaluacion 
    Where(evaluacion.id ="id_evaluacion_dado")AND
         (evaluacion.id = tema_evaluacion.id_evaluacion) AND
         (tema_evaluacion.id_tema ="id_tema_dado")AND
         (tema.nrc_asignatura = "id_asignatura_dado");
         
-- Seleccion de todos los id_tema de una evaluacion

SELECT (tema.id,tema.nombre)
  FROM evaluacion,asignatura, tema_evaluacion
    Where(evaluacion.id ="id_evaluacion_dado")AND
         (evaluacion.id = tema_evaluacion.id_evaluacion) AND
         (tema_evaluacion.id_tema ="id_tema_dado")AND
         (tema.nrc_asignatura = "id_asignatura_dado");
         
-- Seleccion de datos por fecha
SELECT (numero_semana,descripcion,ponderacion, plataforma,recurso,modalidad,frecuencia,fecha,hora)
  FROM evaluacion,asignatura, tema_evaluacion
    Where(evaluacion.fecha = "fecha_dada")AND  
         (evaluacion.id ="id_evaluacion_dado")AND
         (evaluacion.id = tema_evaluacion.id_evaluacion) AND
         (tema_evaluacion.id_tema ="id_tema_dado")AND
         (tema.nrc_asignatura = "id_asignatura_dado");
