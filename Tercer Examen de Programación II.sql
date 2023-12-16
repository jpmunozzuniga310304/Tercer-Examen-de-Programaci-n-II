/*
     //Segundo Proyecto de Programación II
     //Estudiantes: José Pablo Muñoz Zúñiga
     //Carrera: Ingeniería Informática
     //Materia: Programación II 
*/

/*En esta parte se crea la base de datos*/

CREATE DATABASE TercerexamendeprogranaciónII
GO

/*En esta parte tiene la funcion para denominar una base externa como base de datos actual*/

USE TercerexamendeprogranaciónII
GO

/*En esta parte se crea la tabla de partidos politicos*/

CREATE TABLE PartidosPoliticos
(
    NumerodeencuestaID int identity(1,1), 
	Nombredelparticipante varchar(50) NOT NULL,
	Edaddenacimiento int,
	CorreoElectrónico int,
    PartidoPolítico int,
	CONSTRAINT pk_idpartidospoliticos PRIMARY KEY(NumerodeencuestaID)
)
GO

/*En esta parte se crea la tabla de encuestas*/

CREATE TABLE Encuestas
(
    NumerodeencuestaID int identity(1,1),
	Nombredelparticipante varchar(100) NOT NULL,
	Edaddenacimiento int,
	PartidoPolítico int,
	CONSTRAINT pk_idencuestas PRIMARY KEY (NumerodeencuestaID),
	CONSTRAINT fk_idpartidospoliticos FOREIGN KEY (PartidoPolítico) REFERENCES PartidosPoliticos (NumerodeencuestaID)
)
GO

/*En esta parte sirve para agregar nuevos partidos politicos*/

CREATE PROCEDURE Agregarpatidospoliticos
@NOMBREDELPARTICIPANTE VARCHAR(100)
  AS
    BEGIN
	    INSERT INTO PartidosPoliticos(Nombredelparticipante) VALUES (@NOMBREDELPARTICIPANTE)
	END
GO

/*En esta parte sirve para borrar partidos politicos*/

CREATE PROCEDURE Borrarpatidospoliticos
@CODIGO INT
   AS    
     BEGIN
	     DELETE PartidosPoliticos WHERE NumerodeencuestaID =@CODIGO
	 END
GO

/*En esta parte sirve consultar partidos politicos*/

CREATE PROCEDURE Consultapartidospoliticos
  AS
    BEGIN
	  SELECT * FROM PartidosPoliticos
	END
GO

/*En esta parte es la segunda programacion de consultar los partidos politicos para que el programa funcione correctamente*/

CREATE PROCEDURE Consultarpartidospoliticos_filtro
@CODIGO INT
  AS
    BEGIN
	  SELECT * FROM PartidosPoliticos WHERE NumerodeencuestaID = @CODIGO
	END
GO

/*En esta parte sirve para actualizar los partidos politicos*/

CREATE PROCEDURE Actualizarpartidospoliticos
@CODIGO INT,
@NOMBREDELPARTICIPANTE VARCHAR(100)
    AS    
      BEGIN
	    UPDATE PartidosPoliticos SET Nombredelparticipante=@NOMBREDELPARTICIPANTE WHERE NumerodeencuestaID =@CODIGO 
	  END
GO

/*En esta parte sirve consultar partidos politicos*/

CREATE PROCEDURE Consultarencuestas
  AS
    BEGIN
	  SELECT * FROM Encuestas
	END
GO

/*En esta parte es la segunda programacion de consultar los partidos politicos para que el programa funcione correctamente*/

CREATE PROCEDURE Consultarencuestas_filtro
@CODIGO INT
  AS
    BEGIN
	  SELECT * FROM Encuestas WHERE NumerodeencuestaID = @CODIGO
	END
GO

/*En esta parte se agrega un primer partido politico nuevo*/

INSERT INTO PartidosPoliticos (Nombredelparticipante) VALUES ('MARIO AGUILAR')
GO

/*En esta parte se agrega un partido politico nuevo*/

INSERT INTO PartidosPoliticos (Nombredelparticipante) VALUES ('TAMARA SANCHEZ')
GO

/*En esta parte se agrega una encuesta nueva*/

INSERT INTO Encuestas (Nombredelparticipante) VALUES ('ALISA GUTIERREZ')
GO

/*En esta parte se agrega una encuesta nueva*/

INSERT INTO Encuestas (Nombredelparticipante) VALUES ('BRENDA ARAYA')
GO

/*En esta parte se ve toda la informacion de la tabla encuestas partidos politicos*/

SELECT * FROM PartidosPoliticos
GO

/*En esta parte se ve toda la informacion de la tabla encuestas*/

SELECT * FROM Encuestas
GO