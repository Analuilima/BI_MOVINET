
use MovieNet_OLTP;
go

-- Carga Tb_Qualidade

Insert into Tb_Qualidade values (1,'Excelente')
Insert into Tb_Qualidade values (2,'Bom')
Insert into Tb_Qualidade values (3,'�timo')
Insert into Tb_Qualidade values (4,'Ruim')
Insert into Tb_Qualidade values (5,'Horr�vel')
Insert into Tb_Qualidade values (6,'Recomendo')
Insert into Tb_Qualidade values (7,'N�o Recomendo')
go

-- Carga Tb_Genero_Filme

Insert into Tb_Genero_Filme values ('A��o')
Insert into Tb_Genero_Filme values ('Aventura')
Insert into Tb_Genero_Filme values ('Com�dia')
Insert into Tb_Genero_Filme values ('Drama')
Insert into Tb_Genero_Filme values ('Document�rio')
Insert into Tb_Genero_Filme values ('Infantil e para toda a familia')
Insert into Tb_Genero_Filme values ('Fantasia')
Insert into Tb_Genero_Filme values ('Terror')
Insert into Tb_Genero_Filme values ('Romance')
Insert into Tb_Genero_Filme values ('Fic��o Cient�fica')
Insert into Tb_Genero_Filme values ('Suspense')
Insert into Tb_Genero_Filme values ('Anime')
Insert into Tb_Genero_Filme values ('Militar/Guerra')
Insert into Tb_Genero_Filme values ('Policial')
go

-- Carga Tb_Modo_Disponivel

Insert into Tb_Modo_Disponivel values ('LEG')
Insert into Tb_Modo_Disponivel values ('DUB')
go


-- Carga Tb_Modo_Compra

Insert into Tb_Modo_Compra values ('ALUG')
Insert into Tb_Modo_Compra values ('COMP')
go


-- Carga Tb_Modo_Pagamento

Insert Into Tb_Modo_Pagamento values ('Boleto Banc�rio')
Insert Into Tb_Modo_Pagamento values ('Cart�o de Cr�dito')
Insert into Tb_Modo_Pagamento values ('Cart�o de D�bito')
go


--  Carga Tb_Bandeira_Cart�o

Insert into Tb_Bandeira_Cartao values('Mastercard')
Insert into Tb_Bandeira_Cartao values('Visa')
Insert into Tb_Bandeira_Cartao values('Elo')
Insert into Tb_Bandeira_Cartao values('American Express')
Insert into Tb_Bandeira_Cartao values('Hipercard')
go


-- Carga Tb_Email_Promocional

Insert into Tb_Email_Promocional values ('Recebe email com parceirias')
Insert into Tb_Email_Promocional values ('N�o recebe emails')
go



-- Carga Tb_Status 

Insert into Tb_Status values ('Nota Fiscal Emitida')
go




-- Ordem de carga das tabelas 

--Tb_Qualidade
--Tb_genero_filmes--------
--Tb_modo_disponivel -----
--Tb_modo_compra----------
--Tb_produto--------------
--Tb_status---------------
--Tb_modo_pagamento-------
--Tb_bandeira_cartao------
--Tb_email_promocional-----
--Tb_Cliente---------------
--Tb_endereco--------------
--Tb_telefone--------------
--Tb_nota_venda
--Tb_comentario
--Tb_Item_venda





Delete 
 tb_telefone 
where id_cliente  IS NULL








