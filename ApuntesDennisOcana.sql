-----------------------------------------------------------------
-- Apuntes Dennis Ocaña
-- Fecha Modificacion: 11/05/2023 
-----------------------------------------------------------------

-----------------------------------------------------------------
-- Script creación de base de datos SYNTAX
-----------------------------------------------------------------
--USE master;
--GO 
--CREATE DATABASE nombreBaseDatos
--ON 
--( NAME = nombreArchivoDatos, 
--FILENAME = 'C:\Program Files\Microsoft SQL 
--Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\nombreArchivoDatos.mdf', 
--SIZE = XXMB, 
--MAXSIZE = XXMB, 
--FILEGROWTH = X ) 
--LOG ON 
--( NAME = NombreLog, 
--FILENAME = 'C:\Program Files\Microsoft SQL 
--Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\NombreLog.ldf', 
--SIZE = XXMB, 
--MAXSIZE = XXMB, 
--FILEGROWTH = 5MB ); 
--GO
-----------------------------------------------------------------
-- EJEMPLO
-----------------------------------------------------------------
USE master;
GO 
CREATE DATABASE BDDEjemplo
ON 
( NAME = DennisDatos, 
FILENAME = 'C:\Program Files\Microsoft SQL 
Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DennisDatos.mdf', 
SIZE = 64MB, 
MAXSIZE = 128MB, 
FILEGROWTH = 2 ) 
LOG ON 
( NAME = DennisLog, 
FILENAME = 'C:\Program Files\Microsoft SQL 
Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DennisLog.ldf', 
SIZE = 64MB, 
MAXSIZE = 128MB, 
FILEGROWTH = 5MB ); 
GO

-----------------------------------------------------------------
-- Creación de Tipos de datos - SYNTAX
-----------------------------------------------------------------
--CREATE TYPE [ schema_name. ] type_name
--{
--[
--FROM base_type [ ( precision [ , scale ] ) ] [ NULL | NOT NULL ]
--]
--| EXTERNAL NAME assembly_name [ .class_name ]
--| AS TABLE ( {<column_definition> | <computed_column_definition> [ ,... n ] }
--[ <table_constraint> ] [ ,... n ]
--[ <table_index> ] [ ,... n ] } )
--} [ ; ]
-----------------------------------------------------------------
-- EJEMPLO
-----------------------------------------------------------------
CREATE TYPE DennisEjemplo 
FROM varchar(100) NOT NULL
GO

-----------------------------------------------------------------
-- Creación de Tipos de datos - SYNTAX
-----------------------------------------------------------------
--CREATE RULE [ schema_name . ] rule_name
--AS condition_expression

--sp_bindrule [ @rulename = ] 'rule' , 
--[ @objname = ] 'object_name'
--sp_unbindrule [ @objname = ] 'object_name' 
-----------------------------------------------------------------
-- EJEMPLO
-----------------------------------------------------------------
CREATE RULE ReglaEjemploDennis
AS @value LIKE '__-%[0-9]'
GO

sp_bindrule ReglaEjemploDennis, 'DennisEjemplo'
GO

-----------------------------------------------------------------
-- Creación y enlace de valores por defecto -  SYNTAX
-----------------------------------------------------------------
--CREATE DEFAULT [ schema_name . ]
--default_name
--AS constant_expression [ ; ]
-----------------------------------------------------------------
-- EJEMPLO
-----------------------------------------------------------------
CREATE DEFAULT DennisEjemplo
AS 'Ejemplo';
GO

sp_bindefault DennisEjemplo, DennisEjemplo
-----------------------------------------------------------------
-- Creación y enlace de tablas
-----------------------------------------------------------------
--CREATE TABLE
--{schema_name.table_name | table_name }
--( {
--<column_definition> ::=
--column_name <data_type> [ IDENTITY [ ( seed , increment ) ]
--[ [ CONSTRAINT constraint_name ] {NULL | NOT NULL} ]
-----------------------------------------------------------------
-- EJEMPLO
-----------------------------------------------------------------
CREATE TABLE DennisTabla
(
id INT IDENTITY ( 1 , 1 ) NOT NULL

CONSTRAINT PK_Tabla  PRIMARY KEY (id)
)

---------------------------------------------------------------
-- Eliminacion de Objetos - SYNTAX
---------------------------------------------------------------
--IF EXISTS
--(SELECT name FROM sys.objects WHERE name =
--‘NombreObjeto’ AND type =
--‘TipoObjeto’)
--DROP DEFAULT NombreObjeto
--GO
--IF OBJECT_ID (‘NombreTabla','U') IS NOT NULL
--DROP TABLE NombreTabla;
--GO

--DROP TABLE IF EXISTS NombreTabla

---------------------------------------------------------------
-- Eliminacion de Objetos - EJEMPLO
---------------------------------------------------------------
DROP DATABASE IF EXISTS DennisEjemplo
GO

---------------------------------------------------------------
-- Modificacion de tablas - SYNTAX
---------------------------------------------------------------
--ALTER TABLE tabla
--ADD columna VARCHAR(20) NULL
--CONSTRAINT tabla_uniq UNIQUE ;
--GO---------------------------------------------------------------
-- Modificacion de tablas - EJEMPLO
---------------------------------------------------------------ALTER TABLE DennisEjemplo
ADD ejemploColumna VARCHAR(20) NOT NULL
CONSTRAINT tabla_uniq UNIQUE ;
GO