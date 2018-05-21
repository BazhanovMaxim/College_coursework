-- Table История_заказов/E8 

CREATE TABLE [История_заказов/E8] 
( 
[id_Заказа] Int NOT NULL, 
[Код_нагрузки] Int NOT NULL, 
[id_Клиента] Int NOT NULL 
) 
go 

-- Add keys for table История_заказов/E8 

ALTER TABLE [История_заказов/E8] ADD CONSTRAINT [Key9] PRIMARY KEY ([id_Заказа],[Код_нагрузки],[id_Клиента]) 
go 


-- Create foreign keys (relationships) section

ALTER TABLE [История_заказов/E8] ADD CONSTRAINT [Связывает] FOREIGN KEY ([id_Заказа], [Код_нагрузки], [id_Клиента]) REFERENCES [Заказ/E6] ([id_Заказа], [Код_нагрузки], [id_Клиента]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go