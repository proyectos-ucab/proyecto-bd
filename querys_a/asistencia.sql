

-- crear
INSERT INTO asistencia VALUES (cedula_usuario,nrc_asignatura,id_periodo,numero_semana,hora,fecha)

-- actualizar toda un lista de una misma asigna
UPDATE asistencia SET asistente =
  WHERE (asistencia.nrc_asignatura = nrc_dado) AND
         (asistencia.id_periodo = id_periodo)
         
         
DELETE asistencia 
  WHERE (asistencia.nrc_asignatura = nrc_dado) AND
         (asistencia.id_periodo = id_periodo)
