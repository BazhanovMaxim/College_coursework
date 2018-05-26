/* 
Created: 23.05.2018 
Modified: 23.05.2018 
Model: ���������������_��������� 
Database: MS SQL Server 2016 
*/ 


-- Create tables section �---------------------------------------------� 

-- Table �����������/E3 

CREATE TABLE [�����������/E3] 
( 
[id_�����������] Int NOT NULL, 
[���] Nchar(20) NOT NULL, 
[�������] Nchar(30) NOT NULL, 
[��������] Nchar(30) NOT NULL, 
[���������] Nchar(40) NOT NULL 
) 
go 

-- Add keys for table �����������/E3 

ALTER TABLE [�����������/E3] ADD CONSTRAINT [Key1] PRIMARY KEY ([id_�����������]) 
go 

-- Table ������/E1 

CREATE TABLE [������/E1] 
( 
[id_�������] Int IDENTITY(1,1) NOT NULL, 
[���] Nchar(20) NOT NULL, 
[�����] Nchar(40) NOT NULL, 
[������] Nchar(30) NOT NULL 
) 
go 

-- Add keys for table ������/E1 

ALTER TABLE [������/E1] ADD CONSTRAINT [Key2] PRIMARY KEY ([id_�������]) 
go 

-- Table �����_�������/E2 

CREATE TABLE [�����_�������/E2] 
( 
[id_�����������] Nchar(30) NOT NULL, 
[��������] Nchar(1000) NOT NULL 
) 
go 

-- Add keys for table �����_�������/E2 

ALTER TABLE [�����_�������/E2] ADD CONSTRAINT [Key3] PRIMARY KEY ([id_�����������]) 
go 

-- Table ���������/E4 

CREATE TABLE [���������/E4] 
( 
[id_���������] Int IDENTITY(1,1) NOT NULL, 
[��������_���������] Nchar(30) NOT NULL, 
[��������] Nchar(100) NULL, 
[����_��������] Date NULL 
) 
go 

-- Add keys for table ���������/E4 

ALTER TABLE [���������/E4] ADD CONSTRAINT [Key4] PRIMARY KEY ([id_���������]) 
go 

-- Table ������/E5 

CREATE TABLE [������/E5] 
( 
[id_������] Int IDENTITY(1,1) NOT NULL, 
[��������_������] Nchar(30) NOT NULL, 
[����] Int NOT NULL, 
[��������_������] Nchar(100) NULL, 
[����] Date NULL, 
[id_�����������] Int NOT NULL 
) 
go 

-- Create indexes for table ������/E5 

CREATE INDEX [IX_Relationship3] ON [������/E5] ([id_�����������]) 
go 

-- Add keys for table ������/E5 

ALTER TABLE [������/E5] ADD CONSTRAINT [Key5] PRIMARY KEY ([id_������]) 
go 

-- Table ����������_������/E6 

CREATE TABLE [����������_������/E6] 
( 
[id_����������] Int IDENTITY(1,1) NOT NULL, 
[id_�����������] Nchar(30) NULL, 
[id_�������] Int NOT NULL, 
[id_������] Int NOT NULL 
) 
go 

-- Create indexes for table ����������_������/E6 

CREATE INDEX [IX_Relationship5] ON [����������_������/E6] ([id_�����������]) 
go 

CREATE INDEX [IX_Relationship6] ON [����������_������/E6] ([id_�������]) 
go 

CREATE INDEX [IX_Relationship7] ON [����������_������/E6] ([id_������]) 
go 

-- Add keys for table ����������_������/E6 

ALTER TABLE [����������_������/E6] ADD CONSTRAINT [Key6] PRIMARY KEY ([id_����������]) 
go 

-- Table ������_������/E7 

CREATE TABLE [������_������/E7] 
( 
[����_������] Date NOT NULL, 
[���_�����] Int NOT NULL, 
[id_�����������] Int NOT NULL 
) 
go 

-- Create indexes for table ������_������/E7 

CREATE INDEX [IX_Relationship4] ON [������_������/E7] ([id_�����������]) 
go 

-- Add keys for table ������_������/E7 

ALTER TABLE [������_������/E7] ADD CONSTRAINT [Key7] PRIMARY KEY ([����_������]) 
go 

-- Table ���������/E8 

CREATE TABLE [���������/E8] 
( 
[id_���������] Int NOT NULL, 
[id_������] Int NOT NULL 
) 
go 

-- Add keys for table ���������/E8 

ALTER TABLE [���������/E8] ADD CONSTRAINT [Key8] PRIMARY KEY ([id_���������],[id_������]) 
go 

-- Create foreign keys (relationships) section �---------------------------------------------� 


ALTER TABLE [���������/E8] ADD CONSTRAINT [������������] FOREIGN KEY ([id_���������]) REFERENCES [���������/E4] ([id_���������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [���������/E8] ADD CONSTRAINT [����������] FOREIGN KEY ([id_������]) REFERENCES [������/E5] ([id_������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [������/E5] ADD CONSTRAINT [�����������] FOREIGN KEY ([id_�����������]) REFERENCES [�����������/E3] ([id_�����������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [������_������/E7] ADD CONSTRAINT [��������] FOREIGN KEY ([id_�����������]) REFERENCES [�����������/E3] ([id_�����������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go 


ALTER TABLE [����������_������/E6] ADD CONSTRAINT [���������] FOREIGN KEY ([id_�����������]) REFERENCES [�����_�������/E2] ([id_�����������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [����������_������/E6] ADD CONSTRAINT [����������] FOREIGN KEY ([id_�������]) REFERENCES [������/E1] ([id_�������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [����������_������/E6] ADD CONSTRAINT [���������] FOREIGN KEY ([id_������]) REFERENCES [������/E5] ([id_������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go