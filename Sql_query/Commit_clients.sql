-- Table �������_�������/E8 

CREATE TABLE [�������_�������/E8] 
( 
[id_������] Int NOT NULL, 
[���_��������] Int NOT NULL, 
[id_�������] Int NOT NULL 
) 
go 

-- Add keys for table �������_�������/E8 

ALTER TABLE [�������_�������/E8] ADD CONSTRAINT [Key9] PRIMARY KEY ([id_������],[���_��������],[id_�������]) 
go 


-- Create foreign keys (relationships) section

ALTER TABLE [�������_�������/E8] ADD CONSTRAINT [���������] FOREIGN KEY ([id_������], [���_��������], [id_�������]) REFERENCES [�����/E6] ([id_������], [���_��������], [id_�������]) ON UPDATE NO ACTION ON DELETE NO ACTION 
go