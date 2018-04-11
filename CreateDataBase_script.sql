/*
Created: 11.04.2018
Modified: 11.04.2018
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table �����/E1

CREATE TABLE [�����/E1]
(
 [id_������] Int IDENTITY(1,1) NOT NULL,
 [id_�������] Int NULL
)
go

-- Create indexes for table �����/E1

CREATE INDEX [IX_Relationship1] ON [�����/E1] ([id_�������])
go

-- Add keys for table �����/E1

ALTER TABLE [�����/E1] ADD CONSTRAINT [Key1_clients] PRIMARY KEY ([id_������])
go

ALTER TABLE [�����/E1] ADD CONSTRAINT [id_������] UNIQUE ([id_������])
go

-- Table ������/E2

CREATE TABLE [������/E2]
(
 [id_�������] Int IDENTITY(1,1) NOT NULL,
 [�������] Nchar(20) NULL,
 [���] Nchar(20) NULL,
 [��������] Nchar(1) NULL
)
go

-- Add keys for table ������/E2

ALTER TABLE [������/E2] ADD CONSTRAINT [Key2] PRIMARY KEY ([id_�������])
go

ALTER TABLE [������/E2] ADD CONSTRAINT [id_�������] UNIQUE ([id_�������])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [�����/E1] ADD CONSTRAINT [����������] FOREIGN KEY ([id_�������]) REFERENCES [������/E2] ([id_�������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go