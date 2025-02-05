--Create tables generado por codigo
--Autores: Laura Sanchez y Felipe Ruiz. (Pareja 11 del grupo 6212)
--Gestion de Datos Biomedicos Practica 2

DROP TABLE IF EXISTS Pertenece;

DROP TABLE IF EXISTS Valor_anual;

DROP TABLE IF EXISTS Indicador;

DROP TABLE IF EXISTS Agrupación_Países;

DROP TABLE IF EXISTS País;

DROP TABLE IF EXISTS Categoría;

DROP TABLE IF EXISTS Tipo_de_Representación;

DROP TABLE IF EXISTS Unidad_de_Medida;

DROP TABLE IF EXISTS Sexo;

DROP TABLE IF EXISTS Nivel_Profesional;

DROP TABLE IF EXISTS Región;



CREATE TABLE Región(
	CódigoR varchar(100),
	PRIMARY KEY (CódigoR));


CREATE TABLE Nivel_Profesional(
	CódigoP varchar(100),
	DescripciónP varchar(100),
	PRIMARY KEY (CódigoP));


CREATE TABLE Sexo(
	CódigoS varchar(100),
	DescripciónS varchar(100),
	PRIMARY KEY (CódigoS));


CREATE TABLE Unidad_de_Medida(
	Unidad varchar(100),
	DescripciónU varchar(100),
	PRIMARY KEY (Unidad));


CREATE TABLE Tipo_de_Representación(
	Tipo varchar(100),
	DescripciónR varchar(100),
	PRIMARY KEY (Tipo));


CREATE TABLE Categoría(
	Categ varchar(100),
	DescripciónC varchar(100),
	PRIMARY KEY (Categ));


CREATE TABLE País(
	CódigoPa varchar(100),
	CódigoOMS varchar(100),
	Nombre_cortoP varchar(100),
	Nombre_completoP varchar(100),
	PRIMARY KEY (CódigoPa),
	FOREIGN KEY (CódigoPa) REFERENCES Región (CódigoR));


CREATE TABLE Agrupación_Países(
	CódigoG varchar(100),
	Nombre_cortoG varchar(100),
	Nombre_completoG varchar(100),
	PRIMARY KEY (CódigoG),
	FOREIGN KEY (CódigoG) REFERENCES Región (CódigoR));


CREATE TABLE Indicador(
	CódigoI varchar(100),
	DescripciónI varchar(100),
	Unidad varchar(100),
	Tipo varchar(100),
	Categ varchar(100),
	PRIMARY KEY (CódigoI),
	FOREIGN KEY (Categ) REFERENCES Categoría (Categ),
	FOREIGN KEY (Tipo) REFERENCES Tipo_de_Representación (Tipo),
	FOREIGN KEY (Unidad) REFERENCES Unidad_de_Medida (Unidad));


CREATE TABLE Valor_anual(
	Clave_Serial serial,
	Valor float,
	Año varchar(100),
	CódigoI varchar(100),
	CódigoR varchar(100),
	CódigoS varchar(100),
	CódigoP varchar(100),
	PRIMARY KEY (Clave_Serial),
	FOREIGN KEY (CódigoP) REFERENCES Nivel_Profesional (CódigoP),
	FOREIGN KEY (CódigoS) REFERENCES Sexo (CódigoS),
	FOREIGN KEY (CódigoR) REFERENCES Región (CódigoR),
	FOREIGN KEY (CódigoI) REFERENCES Indicador (CódigoI));


CREATE TABLE Pertenece(
	Clave_Ser serial,
	CódigoPa varchar(100),
	CódigoG varchar(100),
	PRIMARY KEY (Clave_Ser),
	FOREIGN KEY (CódigoG) REFERENCES Región (CódigoR),
	FOREIGN KEY (CódigoPa) REFERENCES Región (CódigoR));
