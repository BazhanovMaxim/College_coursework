/*
Created: 11.04.2018
Modified: 11.04.2018
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table Заказ/E1

CREATE TABLE [Заказ/E1]
(
 [id_Заказа] Int IDENTITY(1,1) NOT NULL,
 [id_Клиента] Int NULL
)
go

-- Create indexes for table Заказ/E1

CREATE INDEX [IX_Relationship1] ON [Заказ/E1] ([id_Клиента])
go

-- Add keys for table Заказ/E1

ALTER TABLE [Заказ/E1] ADD CONSTRAINT [Key1_clients] PRIMARY KEY ([id_Заказа])
go

ALTER TABLE [Заказ/E1] ADD CONSTRAINT [id_Заказа] UNIQUE ([id_Заказа])
go

-- Table Клиент/E2

CREATE TABLE [Клиент/E2]
(
 [id_Клиента] Int IDENTITY(1,1) NOT NULL,
 [Фамилия] Nchar(20) NULL,
 [Имя] Nchar(20) NULL,
 [Отчество] Nchar(1) NULL
)
go

-- Add keys for table Клиент/E2

ALTER TABLE [Клиент/E2] ADD CONSTRAINT [Key2] PRIMARY KEY ([id_Клиента])
go

ALTER TABLE [Клиент/E2] ADD CONSTRAINT [id_Клиента] UNIQUE ([id_Клиента])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Заказ/E1] ADD CONSTRAINT [Заказывает] FOREIGN KEY ([id_Клиента]) REFERENCES [Клиент/E2] ([id_Клиента]) ON UPDATE NO ACTION ON DELETE NO ACTION
go