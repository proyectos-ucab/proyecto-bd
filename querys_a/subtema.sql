-- CRUD NORMAL
--DEEBER SER ES INT PELO TENGO SUEÑO

-- seleccion de datos 
SELECT(numero, nombre)
    FROM subtema
        WHERE subtema.id = 'id_subtema_seleccionado' /*son int*/;

-- seleccion de todos los subtemas de un tema
SELECT(numero, nombre)
    FROM subtema
        WHERE subtema.id_tema = 'id_tema_seleccionado' /*son int*/;

-- seleccion de todos los subtemas de un tema con nombre de tema
SELECT(tema.nombre,subtema.numero,subtema.nombre)
    FROM subtema, tema
        WHERE (subtema.id_tema = 'id_tema_seleccionado') AND /*son int*/
              (tema.id = 'id_tema_seleccionado');
-- crear
INSERT INTO subtema VALUES (id,id_tema,numero,nombre)

/* tanto en actualizar como en eliminar se puede remove la segunda condicion
y que elimine solo con el id de subtema*/
-- actulizar
 UPDATE subtema SET  numero =/*nuevo_int*/, nombre ='Nuevo_Nombre'
    WHERE (subtema.id = 'id_subtema_seleccionado'/*son int*/) AND
          (subtema.id_tema = 'id_tema_seleccionado'/*son int*/);
          
-- eliminar 
DELETE FROM subtema
    WHERE (subtema.id = 'id_subtema_seleccionado'/*son int*/) AND
          (subtema.id_tema = 'id_tema_seleccionado'/*son int*/);

--funciones