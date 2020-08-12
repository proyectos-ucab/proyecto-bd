-- CRUD NORMAL
--DEEBER SER ES INT PELO TENGO SUEÑO

-- seleccion de datos
SELECT (numero,nombre)  
    FROM tema   
        Where (tema.id = 'id_tema_seleccionado');

-- seleccion de todos los datos de una asignatura

SELECT (numero,nombre)  
    FROM tema   
        Where (tema.nrc_asignatura = 'nrc_asigantura_selecionada');

-- crear
INSERT INTO tema VALUES (id,nrc_asignatura,nombre,numero)

-- actulizar
 UPDATE tema SET nombre ='Nuevo_Nombre', numero =/*nuevo_int*/
    WHERE (tema.id = 'id_tema_seleccionado'/*son int*/) AND
          (tema.nrc_asignatura = 'nrc_asignatura_selecionada'/*son int*/);

-- eliminar 
DELETE FROM tema
    WHERE (tema.id = 'id_tema_seleccionado'/*son int*/) AND
          (tema.nrc_asignatura = 'nrc_asignatura_selecionada'/*son int*/);


-- funciones 
