-- CRUD NORMAL
--DEEBER SER ES INT PELO TENGO SUEÑO

-- seleccion de datos
SELECT (descripcion,plataforma,recurso,frecuencia,modalidad)  
    FROM actividad   
        Where (actividad.id = 'id_actividad_seleccionada'/*son int*/);


-- seleccion de todas las actividades de un tema con nombre del tema 
SELECT (tema.nombre, actividad.descripcion,actividad.plataforma,actividad.recurso,actividad.frecuencia,actividad.modalidad)  
    FROM actividad , tema
        Where (actividad.id_tema = 'id_tema_seleccionada'/*son int*/) AND
              (tema.id = 'id_tema_seleccionada'/*son int*/);

-- seleccion de todas las actividades de un tipo_usuario por tema con nombre de tema
SELECT (tema.nombre, actividad.descripcion,actividad.plataforma,actividad.recurso,actividad.frecuencia,actividad.modalidad)  
    FROM actividad , tema  
        Where (actividad.id_tema = 'id_tema_seleccionada'/*son int*/) AND
              (actividad.tipo_usuario = 'tipo_usuario_selecionado')AND
              (tema.id = 'id_tema_seleccionada'/*son int*/);

-- crear
INSERT INTO actividad VALUES (id,id_tema,tipo_usuario,descripcion,plataforma,recurso,frecuencia,modalidad)

/* tanto en actualizar como en eliminar se puede remove la segunda condicion
y que elimine solo con el id de actividad*/

-- actulizar de un una actividad por tema y tipo de usuario
 UPDATE actividad SET descripcion = '',plataforma = '',recurso = '' ,frecuencia = '',modalidad =''
    WHERE (actividad.id _tema= 'id_tema_seleccionado'/*son int*/) AND
          (actividad.tipo_usuario= 'tipo_usuario_selecionado');

-- eliminar de un una actividad por tema y tipo de usuario
DELETE FROM actividad
    WHERE (actividad.id_tema = 'id_tema_seleccionado'/*son int*/) AND
          (actividad.tipo_usuario= 'tipo_usuario_selecionado');


-- funciones 
