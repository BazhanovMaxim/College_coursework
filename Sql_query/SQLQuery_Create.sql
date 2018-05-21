/* 
Created: 21.05.2018 
Modified: 21.05.2018 
Model: Полноатрибутная_диаграмма 
Database: MS SQL Server 2016 
*/ 


-- Create tables section —---------------------------------------------— 

-- Table Клиент/E1 

CREATE TABLE [Клиент/E1] 
( 
[id_Клиента] Int IDENTITY(1,1) NOT NULL, 
[Имя] Nchar(20) NOT NULL, 
[Почта] Nchar(30) NOT NULL, 
[Пароль] Nchar(30) NOT NULL 
) 
go 

-- Add keys for table Клиент/E1 

ALTER TABLE [Клиент/E1] ADD CONSTRAINT [Key1] PRIMARY KEY ([id_Клиента]) 
go 

-- Table Отзывы_клиентов/E2 

CREATE TABLE [Отзывы_клиентов/E2] 
( 
[Описание] Nchar(100) NULL, 
[id_Заказа] Int NOT NULL, 
[Код_нагрузки] Int NOT NULL, 
[id_Клиента] Int NOT NULL 
) 
go 

-- Add keys for table Отзывы_клиентов/E2 

ALTER TABLE [Отзывы_клиентов/E2] ADD CONSTRAINT [Key2] PRIMARY KEY ([id_Заказа],[Код_нагрузки],[id_Клиента]) 
go 

-- Table Специалисты/E3 

CREATE TABLE [Специалисты/E3] 
( 
[id_Специалиста] Int IDENTITY(1,1) NOT NULL, 
[Имя] Nchar(30) NOT NULL, 
[Фамилия] Nchar(30) NOT NULL, 
[Отчество] Nchar(30) NOT NULL, 
[Специальность] Nchar(30) NOT NULL 
) 
go 

-- Add keys for table Специалисты/E3 

ALTER TABLE [Специалисты/E3] ADD CONSTRAINT [Key3] PRIMARY KEY ([id_Специалиста]) 
go 

-- Table Услуга/E5 

CREATE TABLE [Услуга/E5] 
( 
[Название_услуги] Nchar(30) NOT NULL, 
[Цена] Int NOT NULL, 
[Описание] Nchar(50) NULL 
) 
go 

-- Add keys for table Услуга/E5 

ALTER TABLE [Услуга/E5] ADD CONSTRAINT [Key4] PRIMARY KEY ([Название_услуги]) 
go 

-- Table Лекарства/E4 

CREATE TABLE [Лекарства/E4] 
( 
[Название_лекарства] Nchar(30) NOT NULL, 
[Описание] Nchar(50) NULL, 
[Срок_годности] Date NULL, 
[id_Специалиста] Int NOT NULL 
) 
go 

-- Add keys for table Лекарства/E4 

ALTER TABLE [Лекарства/E4] ADD CONSTRAINT [Key5] PRIMARY KEY ([Название_лекарства],[id_Специалиста]) 
go 

-- Table Заказ/E6 

CREATE TABLE [Заказ/E6] 
( 
[id_Заказа] Int IDENTITY(1,1) NOT NULL, 
[Время] Date NULL, 
[Код_нагрузки] Int NOT NULL, 
[id_Клиента] Int NOT NULL 
) 
go 

-- Add keys for table Заказ/E6 

ALTER TABLE [Заказ/E6] ADD CONSTRAINT [Key6] PRIMARY KEY ([id_Заказа],[Код_нагрузки],[id_Клиента]) 
go 

-- Table Нагрузка/E7 

CREATE TABLE [Нагрузка/E7] 
( 
[Код_нагрузки] Int IDENTITY(1,1) NOT NULL, 
[Название_услуги] Nchar(30) NOT NULL, 
[Название_лекарства] Nchar(30) NOT NULL, 
[id_Специалиста] Int NOT NULL 
) 
go 

-- Create indexes for table Нагрузка/E7 

CREATE INDEX [IX_Relationship5] ON [Нагрузка/E7] ([Название_услуги]) 
go 

CREATE INDEX [IX_Relationship6] ON [Нагрузка/E7] ([Название_лекарства],[id_Специалиста]) 
go 

CREATE INDEX [IX_Relationship8] ON [Нагрузка/E7] ([id_Специалиста]) 
go 

-- Add keys for table Нагрузка/E7 

ALTER TABLE [Нагрузка/E7] ADD CONSTRAINT [Key7] PRIMARY KEY ([Код_нагрузки]) 
go 

-- Table График_работы 

CREATE TABLE [График_работы] 
( 
[День_недели] Date NOT NULL, 
[Кол_часов] Int NOT NULL, 
[id_Специалиста] Int NOT NULL 
) 
go 

-- Add keys for table График_работы 

ALTER TABLE [График_работы] ADD CONSTRAINT [Key8] PRIMARY KEY ([День_недели],[Кол_часов],[id_Специалиста]) 
go 

-- Create foreign keys (relationships) section —---------------------------------------------— 


ALTER TABLE [Лекарства/E4] ADD CONSTRAINT [Выписывает] FOREIGN KEY ([id_Специалиста]) REFERENCES [Специалисты/E3] ([id_Специалиста]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [График_работы] ADD CONSTRAINT [Работает] FOREIGN KEY ([id_Специалиста]) REFERENCES [Специалисты/E3] ([id_Специалиста]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [Нагрузка/E7] ADD CONSTRAINT [Участвует] FOREIGN KEY ([Название_услуги]) REFERENCES [Услуга/E5] ([Название_услуги]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [Нагрузка/E7] ADD CONSTRAINT [Включается] FOREIGN KEY ([Название_лекарства], [id_Специалиста]) REFERENCES [Лекарства/E4] ([Название_лекарства], [id_Специалиста]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [Нагрузка/E7] ADD CONSTRAINT [Входит] FOREIGN KEY ([id_Специалиста]) REFERENCES [Специалисты/E3]
([id_Специалиста]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [Заказ/E6] ADD CONSTRAINT [Назначается] FOREIGN KEY ([Код_нагрузки]) REFERENCES [Нагрузка/E7] ([Код_нагрузки]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [Заказ/E6] ADD CONSTRAINT [Рекомендуется] FOREIGN KEY ([id_Клиента]) REFERENCES [Клиент/E1] ([id_Клиента]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go 


ALTER TABLE [Отзывы_клиентов/E2] ADD CONSTRAINT [Описывает] FOREIGN KEY ([id_Заказа], [Код_нагрузки], [id_Клиента]) REFERENCES [Заказ/E6] ([id_Заказа], [Код_нагрузки], [id_Клиента]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go
