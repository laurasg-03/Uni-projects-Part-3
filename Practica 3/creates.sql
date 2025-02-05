--Create tables generado por codigo
--Autores: Laura Sanchez y Felipe Ruiz. (Pareja 11 del grupo 6212)
--Gestion de Datos Biomedicos Practica 2

DROP TABLE IF EXISTS Pertenece;

DROP TABLE IF EXISTS Valor_anual;

DROP TABLE IF EXISTS Indicador;

DROP TABLE IF EXISTS Agrupaci�n_Pa�ses;

DROP TABLE IF EXISTS Pa�s;

DROP TABLE IF EXISTS Categor�a;

DROP TABLE IF EXISTS Tipo_de_Representaci�n;

DROP TABLE IF EXISTS Unidad_de_Medida;

DROP TABLE IF EXISTS Sexo;

DROP TABLE IF EXISTS Nivel_Profesional;

DROP TABLE IF EXISTS Regi�n;



CREATE TABLE Regi�n(
	C�digoR varchar(100),
	PRIMARY KEY (C�digoR));


CREATE TABLE Nivel_Profesional(
	C�digoP varchar(100),
	Descripci�nP varchar(100),
	PRIMARY KEY (C�digoP));


CREATE TABLE Sexo(
	C�digoS varchar(100),
	Descripci�nS varchar(100),
	PRIMARY KEY (C�digoS));


CREATE TABLE Unidad_de_Medida(
	Unidad varchar(100),
	Descripci�nU varchar(100),
	PRIMARY KEY (Unidad));


CREATE TABLE Tipo_de_Representaci�n(
	Tipo varchar(100),
	Descripci�nR varchar(100),
	PRIMARY KEY (Tipo));


CREATE TABLE Categor�a(
	Categ varchar(100),
	Descripci�nC varchar(100),
	PRIMARY KEY (Categ));


CREATE TABLE Pa�s(
	C�digoPa varchar(100),
	C�digoOMS varchar(100),
	Nombre_cortoP varchar(100),
	Nombre_completoP varchar(100),
	PRIMARY KEY (C�digoPa),
	FOREIGN KEY (C�digoPa) REFERENCES Regi�n (C�digoR));


CREATE TABLE Agrupaci�n_Pa�ses(
	C�digoG varchar(100),
	Nombre_cortoG varchar(100),
	Nombre_completoG varchar(100),
	PRIMARY KEY (C�digoG),
	FOREIGN KEY (C�digoG) REFERENCES Regi�n (C�digoR));


CREATE TABLE Indicador(
	C�digoI varchar(100),
	Descripci�nI varchar(100),
	Unidad varchar(100),
	Tipo varchar(100),
	Categ varchar(100),
	PRIMARY KEY (C�digoI),
	FOREIGN KEY (Categ) REFERENCES Categor�a (Categ),
	FOREIGN KEY (Tipo) REFERENCES Tipo_de_Representaci�n (Tipo),
	FOREIGN KEY (Unidad) REFERENCES Unidad_de_Medida (Unidad));


CREATE TABLE Valor_anual(
	Clave_Serial serial,
	Valor float,
	A�o varchar(100),
	C�digoI varchar(100),
	C�digoR varchar(100),
	C�digoS varchar(100),
	C�digoP varchar(100),
	PRIMARY KEY (Clave_Serial),
	FOREIGN KEY (C�digoP) REFERENCES Nivel_Profesional (C�digoP),
	FOREIGN KEY (C�digoS) REFERENCES Sexo (C�digoS),
	FOREIGN KEY (C�digoR) REFERENCES Regi�n (C�digoR),
	FOREIGN KEY (C�digoI) REFERENCES Indicador (C�digoI));


CREATE TABLE Pertenece(
	Clave_Ser serial,
	C�digoPa varchar(100),
	C�digoG varchar(100),
	PRIMARY KEY (Clave_Ser),
	FOREIGN KEY (C�digoG) REFERENCES Regi�n (C�digoR),
	FOREIGN KEY (C�digoPa) REFERENCES Regi�n (C�digoR));
