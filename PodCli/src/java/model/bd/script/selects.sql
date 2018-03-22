USE podcli;

select *from atencionPodologica a,ficha f,paciente p
where a.ficha=f.id and f.paciente=p.id and (p.nombre like '%nico%' and p.rut like '%nico%');

select nombre from perfil where id = 1;

/*Consulta de getAtencionesPodologicas(int idFicha)*/
SELECT 
    atencionPodologica.id 				AS ID, 
    atencionPodologica.ficha 				AS 'Nº Ficha',
    u1.nombre 						AS Creador, 
    atencionPodologica.fecha 				AS Fecha, 
    atencionPodologica.presion 				AS Presión, 
    atencionPodologica.pulsoRadial 			AS 'Pulso Radial', 
    atencionPodologica.pulsoPedio_d                     AS 'P. Pedio (d)', 
    atencionPodologica.pulsoPedio_i                     AS 'P. Pedio (i)', 
    atencionPodologica.peso				AS Peso, 
    atencionPodologica.sens_d 				AS 'Sensibilidad (d)', 
    atencionPodologica.sens_i 				AS 'Sensibilidad (i)',
    atencionPodologica.tpodal_d 			AS 'Tº Podal (d)', 
    atencionPodologica.tpodal_i 			AS 'Tº Podal (i)',
    atencionPodologica.curacion 			AS Curación, 
    atencionPodologica.coloqPuente 			AS 'Coloc. Puente', 
    atencionPodologica.resecado 			AS Resecado, 
    atencionPodologica.enucleacion 			AS Enucleación, 
    atencionPodologica.devastado 			AS 'Dev. Ungueal', 
    atencionPodologica.maso 				AS 'Masoterapia o Masaje', 
    atencionPodologica.espiculoectomia                  AS 'Espiculoectomía (Grado)', 
    atencionPodologica.analgesia 			AS 'Analgesia (Tipo)', 
    atencionPodologica.colocacionAcrilico               AS 'Colocación Acilico', 
    atencionPodologica.bandaMolecular                   AS 'Colocac. Banda Molec.', 
    tratamientoOrtonixia.nombre 			AS 'C. Bracket/Cambio Elast.', 
    atencionPodologica.poli 				AS 'C. Policarboxilato', 
    atencionPodologica.observaciones                    AS Observaciones 
FROM 
    atencionPodologica
    INNER JOIN ficha                ON atencionPodologica.ficha = ficha.id
    INNER JOIN usuario u1           ON ficha.usuario = u1.id
    INNER JOIN usuario u2           ON atencionPodologica.usuario = u2.id
    INNER JOIN tratamientoOrtonixia ON atencionPodologica.tratamientoOrtonixia = tratamientoOrtonixia.id
WHERE 
    atencionPodologica.ficha = 1;

select * from paciente;




/*
De atenciones:
	Cantidad de hombres
	Cantidad de mujeres
	Grupo etario (0-30[, [30-50[, [50-70[, >70)
	Por alumno, cuantos atendieron. y quienes.
*/

/*Cantidad de hombres*/
SELECT COUNT(*) FROM paciente WHERE sexo = 'm';

/*Cantidad de mujeres*/
SELECT COUNT(*) FROM paciente WHERE sexo = 'f';

/*Saber la edad!*/
SELECT TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) AS edad
from paciente;

/*Cantidad de pacientes entre 0 y 29 años*/
SELECT COUNT(*)
FROM paciente
WHERE TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) > 0 AND
TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) <= 90;

/*Grupo etario (0-30[, [30-50[, [50-70[, >70)*/
SELECT '0-30', COUNT(*) FROM paciente
WHERE TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) >= 0 AND
TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) < 30
UNION
SELECT '30-50',COUNT(*) FROM paciente
WHERE TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) >= 30 AND
TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) < 50
UNION
SELECT '50-70',COUNT(*) FROM paciente
WHERE TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) >= 50 AND
TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) < 70
UNION
SELECT '>70',COUNT(*) FROM paciente
WHERE TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) >= 70;

/*Por alumno, cuantos atendieron.*/
/*Listado de alumnos y a cuantos atendieron por fecha*/
SELECT 
	u.rut, u.nombre, COUNT(0)
FROM 
	atencionPodologica ap
INNER JOIN 
	usuario u ON ap.usuario = u.id
WHERE 
	ap.usuario = u.id AND
	fecha BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY usuario
ORDER BY COUNT(0) DESC;


/*Por alumno determinado a quienes atendio.*/
SELECT 
	p.rut,
    p.nombre,
    u.nombre AS 'Atendido por',
    ap.fecha AS 'Fecha atención'
FROM
	paciente p
INNER JOIN ficha f ON p.id = f.paciente
INNER JOIN atencionPodologica ap ON ap.ficha = f.id
INNER JOIN usuario u ON u.id = ap.usuario
WHERE 
	ap.usuario = 18;


SELECT * FROM atencionPodologica;




select * from paciente;