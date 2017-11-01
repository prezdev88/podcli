USE podcli;

select *from atencionPodologica a,ficha f,paciente p
where a.ficha=f.id and f.paciente=p.id and (p.nombre like '%nico%' and p.rut like '%nico%')

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