/*
Created: 10.05.2018
Modified: 10.05.2018
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table �������/E1

CREATE TABLE [�������/E1]
(
 [Id_�������] Int IDENTITY(1,1) PRIMARY KEY NOT NULL,
 [���] Nchar(20) NULL,
 [�������] Nchar(20) NULL
)
go

-- add keys

SELECT DISTINCT [Id_�������] FROM [�������/E1]





