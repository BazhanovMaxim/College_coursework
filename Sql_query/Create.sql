/* 
Created: 23.05.2018 
Modified: 23.05.2018 
Model: Полноатрибутная_диаграмма 
Database: MS SQL Server 2016 
*/ 


-- Create tables section —---------------------------------------------— 

-- Table Специалисты/E3 

CREATE TABLE [Специалисты/E3] 
( 
[id_Специалиста] Int NOT NULL, 
[Имя] Nchar(20) NOT NULL, 
[Фамилия] Nchar(30) NOT NULL, 
[Отчество] Nchar(30) NOT NULL, 
[Должность] Nchar(40) NOT NULL 
) 
go 

-- Add keys for table Специалисты/E3 

ALTER TABLE [Специалисты/E3] ADD CONSTRAINT [Key1] PRIMARY KEY ([id_Специалиста]) 
go 

-- Table Клиент/E1 

CREATE TABLE [Клиент/E1] 
( 
[id_Клиента] Int IDENTITY(1,1) NOT NULL, 
[Имя] Nchar(20) NOT NULL, 
[Почта] Nchar(40) NOT NULL, 
[Пароль] Nchar(30) NOT NULL 
) 
go 

-- Add keys for table Клиент/E1 

ALTER TABLE [Клиент/E1] ADD CONSTRAINT [Key2] PRIMARY KEY ([id_Клиента]) 
go 

-- Table Отзыв_клиента/E2 

CREATE TABLE [Отзыв_клиента/E2] 
( 
[id_Комментария] Nchar(30) NOT NULL, 
[Описание] Nchar(1000) NOT NULL 
) 
go 

-- Add keys for table Отзыв_клиента/E2 

ALTER TABLE [Отзыв_клиента/E2] ADD CONSTRAINT [Key3] PRIMARY KEY ([id_Комментария]) 
go 

-- Table Лекарства/E4 

CREATE TABLE [Лекарства/E4] 
( 
[id_Лекарства] Int IDENTITY(1,1) NOT NULL, 
[Название_лекарства] Nchar(30) NOT NULL, 
[Описание] Nchar(100) NULL, 
[Срок_годности] Date NULL 
) 
go 

-- Add keys for table Лекарства/E4 

ALTER TABLE [Лекарства/E4] ADD CONSTRAINT [Key4] PRIMARY KEY ([id_Лекарства]) 
go 

-- Table Услуга/E5 

CREATE TABLE [Услуга/E5] 
( 
[id_Услуги] Int IDENTITY(1,1) NOT NULL, 
[Название_услуги] Nchar(30) NOT NULL, 
[Цена] Int NOT NULL, 
[Описание_услуги] Nchar(100) NULL, 
[Дата] Date NULL, 
[id_Специалиста] Int NOT NULL 
) 
go 

-- Create indexes for table Услуга/E5 

CREATE INDEX [IX_Relationship3] ON [Услуга/E5] ([id_Специалиста]) 
go 

-- Add keys for table Услуга/E5 

ALTER TABLE [Услуга/E5] ADD CONSTRAINT [Key5] PRIMARY KEY ([id_Услуги]) 
go 

-- Table Реализация_услуги/E6 

CREATE TABLE [Реализация_услуги/E6] 
( 
[id_Реализации] Int IDENTITY(1,1) NOT NULL, 
[id_Комментария] Nchar(30) NULL, 
[id_Клиента] Int NOT NULL, 
[id_Услуги] Int NOT NULL 
) 
go 

-- Create indexes for table Реализация_услуги/E6 

CREATE INDEX [IX_Relationship5] ON [Реализация_услуги/E6] ([id_Комментария]) 
go 

CREATE INDEX [IX_Relationship6] ON [Реализация_услуги/E6] ([id_Клиента]) 
go 

CREATE INDEX [IX_Relationship7] ON [Реализация_услуги/E6] ([id_Услуги]) 
go 

-- Add keys for table Реализация_услуги/E6 

ALTER TABLE [Реализация_услуги/E6] ADD CONSTRAINT [Key6] PRIMARY KEY ([id_Реализации]) 
go 

-- Table График_работы/E7 

CREATE TABLE [График_работы/E7] 
( 
[День_недели] Date NOT NULL, 
[Кол_часов] Int NOT NULL, 
[id_Специалиста] Int NOT NULL 
) 
go 

-- Create indexes for table График_работы/E7 

CREATE INDEX [IX_Relationship4] ON [График_работы/E7] ([id_Специалиста]) 
go 

-- Add keys for table График_работы/E7 

ALTER TABLE [График_работы/E7] ADD CONSTRAINT [Key7] PRIMARY KEY ([День_недели]) 
go 

-- Table Связывает/E8 

CREATE TABLE [Связывает/E8] 
( 
[id_Лекарства] Int NOT NULL, 
[id_Услуги] Int NOT NULL 
) 
go 

-- Add keys for table Связывает/E8 

ALTER TABLE [Связывает/E8] ADD CONSTRAINT [Key8] PRIMARY KEY ([id_Лекарства],[id_Услуги]) 
go 

-- Create foreign keys (relationships) section —---------------------------------------------— 


ALTER TABLE [Связывает/E8] ADD CONSTRAINT [Обеспечивает] FOREIGN KEY ([id_Лекарства]) REFERENCES [Лекарства/E4] ([id_Лекарства]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [Связывает/E8] ADD CONSTRAINT [Пользуется] FOREIGN KEY ([id_Услуги]) REFERENCES [Услуга/E5] ([id_Услуги]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [Услуга/E5] ADD CONSTRAINT [Обслуживает] FOREIGN KEY ([id_Специалиста]) REFERENCES [Специалисты/E3] ([id_Специалиста]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [График_работы/E7] ADD CONSTRAINT [Работает] FOREIGN KEY ([id_Специалиста]) REFERENCES [Специалисты/E3] ([id_Специалиста]) ON UPDATE NO ACTION ON DELETE NO ACTION
go 


ALTER TABLE [Реализация_услуги/E6] ADD CONSTRAINT [Описывает] FOREIGN KEY ([id_Комментария]) REFERENCES [Отзыв_клиента/E2] ([id_Комментария]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [Реализация_услуги/E6] ADD CONSTRAINT [Заказывает] FOREIGN KEY ([id_Клиента]) REFERENCES [Клиент/E1] ([id_Клиента]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [Реализация_услуги/E6] ADD CONSTRAINT [Завершает] FOREIGN KEY ([id_Услуги]) REFERENCES [Услуга/E5] ([id_Услуги]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go