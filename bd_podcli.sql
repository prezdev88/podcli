CREATE DATABASE podcli;

USE podcli;

CREATE TABLE tipoUsuario(
	id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY(id)
);

INSERT INTO tipoUsuario VALUES(NULL, 'Alumno');
INSERT INTO tipoUsuario VALUES(NULL, 'Docente');
INSERT INTO tipoUsuario VALUES(NULL, 'Jefe Carrera');

CREATE TABLE usuario(
	id INT AUTO_INCREMENT,
	rut VARCHAR(13),
    nombre VARCHAR(100),
    tipoUsuario int,
    PRIMARY KEY(id),
    FOREIGN KEY(tipoUsuario) REFERENCES tipoUsuario(id)
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

CREATE TABLE paciente(
	id INT AUTO_INCREMENT,
    rut VARCHAR(13),
    nombre VARCHAR(100),
    domicilio VARCHAR(500),
    fechaNacimiento DATE,
    estadoCivil INT,
    actividad VARCHAR(200),
    telefonos VARCHAR(500), -- mejorar turbio
    usuario INT, -- quien hizo
    PRIMARY KEY(id),
    FOREIGN KEY(estadoCivil) REFERENCES estadoCivil(id),
    FOREIGN KEY(usuario) REFERENCES usuario(id)
);

CREATE TABLE respuesta(
	id INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    PRIMARY KEY(id)
);

INSERT INTO respuesta VALUES(NULL, 'Si');
INSERT INTO respuesta VALUES(NULL, 'No');
INSERT INTO respuesta VALUES(NULL, 'No sabe');
INSERT INTO respuesta VALUES(NULL, 'En estudio');

CREATE TABLE antecedentesMorbidos(
	id INT AUTO_INCREMENT,
    hta INT, -- Hipertensión Arterial
    dm INT, -- Diabetes Mellitus
    tipoDiabetes VARCHAR(100),
    aniosEvolucion INT,
    mixto BOOLEAN, -- PACIENTE MIXTO
    control BOOLEAN,
    farmacoterapia VARCHAR(3000),
    otros VARCHAR(4000),-- Otras patologías y farmacoterapia
    alteraciones VARCHAR(1000), -- Alteraciones ortopedicas
    habitos VARCHAR(1000),-- Habitos nocivos
    paciente INT,
    usuario INT,
    PRIMARY KEY(id),
    FOREIGN KEY(hta) REFERENCES respuesta(id),
    FOREIGN KEY(dm) REFERENCES respuesta(id),
    FOREIGN KEY(paciente) REFERENCES paciente(id),
    FOREIGN KEY(usuario) REFERENCES usuario(id)
);

CREATE TABLE datosFisicos(
	id INT AUTO_INCREMENT,
    pulsoRadial INT,
    presion INT, -- Presión Arterial
    pulsoPedio_d INT, -- Derecho
    pulsoPedio_i INT, -- Izquierdo
    peso FLOAT,
    sens_d BOOLEAN, -- Sensibilidad pie derecho
    sens_i BOOLEAN, -- Sensibilidad pie izquierdo
    tpodal_d FLOAT, -- TEMPERATURA PODAL derecho
    tpodal_i FLOAT, -- TEMPERATURA PODAL izquierdo
    paciente INT,
    fechaConsulta DATETIME,
    usuario INT,
    PRIMARY KEY(id),
	FOREIGN KEY(paciente) REFERENCES paciente(id),
    FOREIGN KEY(usuario) REFERENCES usuario(id)
);

CREATE TABLE atencion(
	id INT AUTO_INCREMENT,
    datosFisicos int,
    curacion BOOLEAN,
    coloqPuente BOOLEAN, -- Colocación puente
    resecado BOOLEAN,
    enucleacion BOOLEAN,
    devastado BOOLEAN, -- Devastado Ungueal
    maso BOOLEAN, -- Masoterapia o masaje
    espiculoectomia BOOLEAN,
    analgesia BOOLEAN,
    colocacionAcriloco BOOLEAN,
    bandaMolecular BOOLEAN,
    bracket BOOLEAN,
    poli BOOLEAN,
    
    observaciones VARCHAR(5000),
    PRIMARY KEY(id),
    
   
);


