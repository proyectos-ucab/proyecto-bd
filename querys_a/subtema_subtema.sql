-- CRUD NORMAL
--DEEBER SER ES INT PELO TENGO SUEÑO

-- seleccion de datos
SELECT(numero, descripcion)
    FROM subtema_subtema
        WHERE subtema_subtema.id = 'id_subtema_subtema_seleccionado' /*son int*/;

-- seleccion de todos los subtemas de un subtema
SELECT(numero, nombre)
    FROM subtema
        WHERE subtema.id_subtema = 'id_subtema_seleccionado' /*son int*/;

-- crear
INSERT INTO subtema_subtema VALUES (id_tema,id_subtema,id,numero,descripcion)

/* tanto en actualizar como en eliminar se puede remove la segunda condicion
y que elimine solo con el id de subtema_subtema*/
-- actulizar
 UPDATE subtema_subtema SET  numero =/*nuevo_int*/, descripcion ='Nueva_descripcion'
    WHERE (subtema_subtema.id_tema= 'id_tema_seleccionado'/*son int*/)AND
          (subtema_subtema.id_subtema = 'id_subtema_selecionado'/*son int*/ );
          
-- eliminar 
DELETE FROM subtema_subtema
    WHERE (subtema_subtema.id_tema= 'id_tema_seleccionado'/*son int*/)AND
          (subtema_subtema.id_subtema = 'id_subtema_selecionado'/*son int*/ );

-- funciones