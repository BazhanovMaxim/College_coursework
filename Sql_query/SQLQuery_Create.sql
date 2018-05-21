/* 
Created: 21.05.2018 
Modified: 21.05.2018 
Model: ���������������_��������� 
Database: MS SQL Server 2016 
*/ 


-- Create tables section �---------------------------------------------� 

-- Table ������/E1 

CREATE TABLE [������/E1] 
( 
[id_�������] Int IDENTITY(1,1) NOT NULL, 
[���] Nchar(20) NOT NULL, 
[�����] Nchar(30) NOT NULL, 
[������] Nchar(30) NOT NULL 
) 
go 

-- Add keys for table ������/E1 

ALTER TABLE [������/E1] ADD CONSTRAINT [Key1] PRIMARY KEY ([id_�������]) 
go 

-- Table ������_��������/E2 

CREATE TABLE [������_��������/E2] 
( 
[��������] Nchar(100) NULL, 
[id_������] Int NOT NULL, 
[���_��������] Int NOT NULL, 
[id_�������] Int NOT NULL 
) 
go 

-- Add keys for table ������_��������/E2 

ALTER TABLE [������_��������/E2] ADD CONSTRAINT [Key2] PRIMARY KEY ([id_������],[���_��������],[id_�������]) 
go 

-- Table �����������/E3 

CREATE TABLE [�����������/E3] 
( 
[id_�����������] Int IDENTITY(1,1) NOT NULL, 
[���] Nchar(30) NOT NULL, 
[�������] Nchar(30) NOT NULL, 
[��������] Nchar(30) NOT NULL, 
[�������������] Nchar(30) NOT NULL 
) 
go 

-- Add keys for table �����������/E3 

ALTER TABLE [�����������/E3] ADD CONSTRAINT [Key3] PRIMARY KEY ([id_�����������]) 
go 

-- Table ������/E5 

CREATE TABLE [������/E5] 
( 
[��������_������] Nchar(30) NOT NULL, 
[����] Int NOT NULL, 
[��������] Nchar(50) NULL 
) 
go 

-- Add keys for table ������/E5 

ALTER TABLE [������/E5] ADD CONSTRAINT [Key4] PRIMARY KEY ([��������_������]) 
go 

-- Table ���������/E4 

CREATE TABLE [���������/E4] 
( 
[��������_���������] Nchar(30) NOT NULL, 
[��������] Nchar(50) NULL, 
[����_��������] Date NULL, 
[id_�����������] Int NOT NULL 
) 
go 

-- Add keys for table ���������/E4 

ALTER TABLE [���������/E4] ADD CONSTRAINT [Key5] PRIMARY KEY ([��������_���������],[id_�����������]) 
go 

-- Table �����/E6 

CREATE TABLE [�����/E6] 
( 
[id_������] Int IDENTITY(1,1) NOT NULL, 
[�����] Date NULL, 
[���_��������] Int NOT NULL, 
[id_�������] Int NOT NULL 
) 
go 

-- Add keys for table �����/E6 

ALTER TABLE [�����/E6] ADD CONSTRAINT [Key6] PRIMARY KEY ([id_������],[���_��������],[id_�������]) 
go 

-- Table ��������/E7 

CREATE TABLE [��������/E7] 
( 
[���_��������] Int IDENTITY(1,1) NOT NULL, 
[��������_������] Nchar(30) NOT NULL, 
[��������_���������] Nchar(30) NOT NULL, 
[id_�����������] Int NOT NULL 
) 
go 

-- Create indexes for table ��������/E7 

CREATE INDEX [IX_Relationship5] ON [��������/E7] ([��������_������]) 
go 

CREATE INDEX [IX_Relationship6] ON [��������/E7] ([��������_���������],[id_�����������]) 
go 

CREATE INDEX [IX_Relationship8] ON [��������/E7] ([id_�����������]) 
go 

-- Add keys for table ��������/E7 

ALTER TABLE [��������/E7] ADD CONSTRAINT [Key7] PRIMARY KEY ([���_��������]) 
go 

-- Table ������_������ 

CREATE TABLE [������_������] 
( 
[����_������] Date NOT NULL, 
[���_�����] Int NOT NULL, 
[id_�����������] Int NOT NULL 
) 
go 

-- Add keys for table ������_������ 

ALTER TABLE [������_������] ADD CONSTRAINT [Key8] PRIMARY KEY ([����_������],[���_�����],[id_�����������]) 
go 

-- Create foreign keys (relationships) section �---------------------------------------------� 


ALTER TABLE [���������/E4] ADD CONSTRAINT [����������] FOREIGN KEY ([id_�����������]) REFERENCES [�����������/E3] ([id_�����������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [������_������] ADD CONSTRAINT [��������] FOREIGN KEY ([id_�����������]) REFERENCES [�����������/E3] ([id_�����������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [��������/E7] ADD CONSTRAINT [���������] FOREIGN KEY ([��������_������]) REFERENCES [������/E5] ([��������_������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [��������/E7] ADD CONSTRAINT [����������] FOREIGN KEY ([��������_���������], [id_�����������]) REFERENCES [���������/E4] ([��������_���������], [id_�����������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [��������/E7] ADD CONSTRAINT [������] FOREIGN KEY ([id_�����������]) REFERENCES [�����������/E3]
([id_�����������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [�����/E6] ADD CONSTRAINT [�����������] FOREIGN KEY ([���_��������]) REFERENCES [��������/E7] ([���_��������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [�����/E6] ADD CONSTRAINT [�������������] FOREIGN KEY ([id_�������]) REFERENCES [������/E1] ([id_�������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [������_��������/E2] ADD CONSTRAINT [���������] FOREIGN KEY ([id_������], [���_��������], [id_�������]) REFERENCES [�����/E6] ([id_������], [���_��������], [id_�������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go
