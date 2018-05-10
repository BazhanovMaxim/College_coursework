/*
Created: 10.05.2018
Modified: 10.05.2018
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table Клиенты/E1

CREATE TABLE [Клиенты/E1]
(
 [Id_Клиента] Int IDENTITY(1,1) PRIMARY KEY NOT NULL,
 [Имя] Nchar(20) NULL,
 [Фамилия] Nchar(20) NULL
)
go

-- add keys

SELECT DISTINCT [Id_Клиента] FROM [Клиенты/E1]





