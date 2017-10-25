USE podcli;




select *from atencionPodologica a,ficha f,paciente p
where a.ficha=f.id and f.paciente=p.id and (p.nombre like '%nico%' and p.rut like '%nico%')


select nombre from perfil where id = 1;