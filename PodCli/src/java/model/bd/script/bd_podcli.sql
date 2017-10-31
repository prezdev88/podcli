CREATE DATABASE podcli;

USE podcli;

CREATE TABLE perfil(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY(id)
);

INSERT INTO perfil VALUES(NULL, 'Alumno');
INSERT INTO perfil VALUES(NULL, 'Docente');
INSERT INTO perfil VALUES(NULL, 'Jefe Carrera');

CREATE TABLE usuario(
    id INT AUTO_INCREMENT,
    rut VARCHAR(13),
    nombre VARCHAR(100),
    perfil int,
    PRIMARY KEY(id),
    FOREIGN KEY(perfil) REFERENCES perfil(id)
);

CREATE TABLE estadoCivil(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY(id)
);

INSERT INTO estadoCivil VALUES(NULL, 'Soltero/a');
INSERT INTO estadoCivil VALUES(NULL, 'Casado/a');
INSERT INTO estadoCivil VALUES(NULL, 'Comprometido/a');
INSERT INTO estadoCivil VALUES(NULL, 'Divorciado/a');
INSERT INTO estadoCivil VALUES(NULL, 'Viudo/a');

CREATE TABLE respuesta(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    PRIMARY KEY(id)
);

INSERT INTO respuesta VALUES(NULL, 'Si');
INSERT INTO respuesta VALUES(NULL, 'No');
INSERT INTO respuesta VALUES(NULL, 'No sabe');
INSERT INTO respuesta VALUES(NULL, 'En estudio');

CREATE TABLE paciente(
    /*-------------------------------------------------------*/
    /*				  Antecedentes personales			     */
    /*-------------------------------------------------------*/
    id 			INT AUTO_INCREMENT,
    rut 		VARCHAR(13),
    nombre 		VARCHAR(100),
    sexo 		VARCHAR(1),
    domicilio 		VARCHAR(500),
    fechaNacimiento     DATE,
    estadoCivil 	INT,
    actividad 		VARCHAR(200),
    telefonos 		VARCHAR(500), -- mejorar turbio
    /*-------------------------------------------------------*/
    PRIMARY KEY(id),
    FOREIGN KEY(estadoCivil) REFERENCES estadoCivil(id)
);

/*
Muchachos, los pacientes y ficha se crean una sóla vez, por esa razón deje todos
los datos en la tabla ficha. 
*/



CREATE TABLE ficha(
    id 			INT AUTO_INCREMENT,
    fecha 		DATETIME, 		-- Fecha de creación de la ficha (con función now())
    paciente 		INT,
    usuario 		INT, 			-- que usuario creó la ficha.
    /*-------------------------------------------------------*/
    /*		     Antecedentes morbidos                   */
    /*-------------------------------------------------------*/
    hta 		INT, 			-- Hipertensión Arterial
    dm 			INT, 			-- Diabetes Mellitus
    tipoDiabetes 	INT,
    aniosEvolucion 	INT,
    mixto 		BOOLEAN, 		-- PACIENTE MIXTO
    control 		BOOLEAN,
    farmacoterapia 	VARCHAR(3000),
    otros 		VARCHAR(4000),	-- Otras patologías y farmacoterapia
    alteraciones 	VARCHAR(1000), 	-- Alteraciones ortopedicas
    habitos 		VARCHAR(1000),	-- Habitos nocivos
    /*-------------------------------------------------------*/
    
    
    /*-------------------------------------------------------*/
    /*				   Examen físico general				 */
    /*-------------------------------------------------------*/
    talla 		FLOAT, -- en metros
    imc 		FLOAT,
    amputacion 		BOOLEAN,
    ubiAmputacion 	VARCHAR(100),
    nCalzado 		INT,
    varices 		BOOLEAN,
    heridas 		BOOLEAN,
    ubiHeridas 		VARCHAR(300),
    tipoHerida 		VARCHAR(300),
    tratamiento 	BOOLEAN,
    nevos 		BOOLEAN,
    ubiNevos 		VARCHAR(300),
    maculas 		BOOLEAN,
    tipoMaculas 	VARCHAR(300),
    /*-------------------------------------------------------*/
    
    
    PRIMARY KEY(id),
    FOREIGN KEY(hta)        REFERENCES respuesta(id),
    FOREIGN KEY(dm)         REFERENCES respuesta(id),
    FOREIGN KEY(paciente)   REFERENCES paciente(id),
    FOREIGN KEY(usuario)    REFERENCES usuario(id)
);

select id from ficha where paciente = 1;

CREATE TABLE tratamientoOrtonixia(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY(id)
);

INSERT INTO tratamientoOrtonixia VALUES(NULL, 'No tiene');
INSERT INTO tratamientoOrtonixia VALUES(NULL, 'Colocación bracket');
INSERT INTO tratamientoOrtonixia VALUES(NULL, 'Colocación banda');
INSERT INTO tratamientoOrtonixia VALUES(NULL, 'Cambio bracket');
INSERT INTO tratamientoOrtonixia VALUES(NULL, 'Cambio banda');

/*
Una vez que el paciente viene de nuevo a la consulta, 
se realizarán inserts en esta tabla (atencionPodologica)
*/


CREATE TABLE atencionPodologica(
    id 				INT AUTO_INCREMENT,
    ficha			INT,
    usuario                     INT,            -- Usuario que atendió al paciente
    
    fecha			DATETIME,
    presion 			FLOAT, 		-- Presión Arterial
    pulsoRadial 		INT,
    pulsoPedio_d 		INT, 		-- Derecho
    pulsoPedio_i 		INT, 		-- Izquierdo
    peso 			FLOAT,
    sens_d 			BOOLEAN, 	-- Sensibilidad pie derecho
    sens_i 			BOOLEAN, 	-- Sensibilidad pie izquierdo
    tpodal_d 			FLOAT, 		-- TEMPERATURA PODAL derecho
    tpodal_i 			FLOAT, 		-- TEMPERATURA PODAL izquierdo
    curacion 			BOOLEAN,
    coloqPuente 		BOOLEAN, 	-- Colocación puente
    resecado 			BOOLEAN,
    enucleacion 		BOOLEAN,
    devastado 			BOOLEAN, 	-- Devastado Ungueal
    maso 			BOOLEAN, 	-- Masoterapia o masaje
    espiculoectomia             BOOLEAN,
    analgesia 			BOOLEAN, 	
    colocacionAcrilico          BOOLEAN,	
    bandaMolecular 		BOOLEAN,
    tratamientoOrtonixia        INT,
    poli 			BOOLEAN,        -- Policarbolxilato
    observaciones 		VARCHAR(5000),
	
    PRIMARY KEY(id),
    FOREIGN KEY(ficha)                  REFERENCES ficha(id),
    FOREIGN KEY(tratamientoOrtonixia)   REFERENCES tratamientoOrtonixia(id),
    FOREIGN KEY(usuario)                REFERENCES usuario(id)
);
/*insert into atencionPodologica values(null,ficha,usuario,fecha,presion,pulsoRadial,
 pulsoPedio_d ,pulsoPedio_i ,peso ,sens_d ,sens_i,tpodal_d ,tpodal_i ,curacion ,
coloqPuente,resecado,enucleacion ,devastado ,maso ,espiculoectomia  ,analgesia ,
colocacionAcrilico ,bandaMolecular ,colocacionPuente,tratamientoOrtonixia ,poli ,'observaciones');*/


SELECT * FROM perfil;
SELECT * FROM usuario;
SELECT * FROM estadoCivil;
SELECT * FROM respuesta;
SELECT * FROM paciente;
SELECT * FROM ficha;
SELECT * FROM tratamientoOrtonixia;
SELECT * FROM atencionPodologica;

INSERT INTO usuario VALUE(NULL,"19360036-0","Constanza Abarca Basáez",1);



DROP DATABASE podcli;


select * from ficha;


insert into atencionPodologica values(null,'10','18',NOW(),'20.0','30', '50' ,'60' ,'40.0' ,true ,false,'70.0' ,'80.0' ,true, false,false,true,false ,true,false ,true, false ,true,'1',true ,'gay')

desc atencionPodologica;

insert into atencionPodologica values(null,'1','18',NOW(),'10.0','20','40' ,'50' ,'30.0' ,true ,false,'60.0' ,'70.0' ,true,false,false,true,false ,true,false ,true,false ,true,'1',true ,'gay')

