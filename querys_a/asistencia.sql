cedula_usuario INT NOT NULL,
nrc_asignatura INT NOT NULL,
id_periodo INT NOT NULL,
numero_semana INT NOT NULL,
hora time NOT NULL,
fecha date NOT NULL,
asistente INT NOT NULL,

-- crear
INSERT INTO asistencia VALUES (cedula_usuario,nrc_asignatura,id_periodo,numero_semana,hora,fecha,asistente)

-- actualizar toda un lista de una misma asigna
UPDATE asistencia SET sistente =
  WHERE (asistencia.nrc_asignatura = nrc_dado) AND
         (asistencia.id_periodo = id_periodo)
         
         
DELETE asistencia 
  WHERE (asistencia.nrc_asignatura = nrc_dado) AND
         (asistencia.id_periodo = id_periodo)
