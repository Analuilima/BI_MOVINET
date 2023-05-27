
USE MovieNet_OLTP;
GO


-- Verificando as bandeiras
select id_modo_pagamento, id_bandeira
from Tb_Nota_Venda
where Id_Modo_Pagamento = 1



-- Atualizando o id_bandeira para  null, quando o id_modo_pagamento for 1, pois é boleto bancario.
update tb_nota_venda
set id_bandeira = null
where Id_Modo_Pagamento = 1





-- INSERINDO DADOS ALEATORIOS NA Tb_Nota_Venda

--2015, 2016, 2017, 2018, 2019, 2020, 2021
DECLARE
        @DATA_PEDIDO DATE, 
		@ID_STATUS INT, 
		@ID_CLIENTE INT,
		@ID_MODO_PAGAMENTO INT, 
		@ID_BANDEIRA INT,
		@Desconto Decimal (10,2)

BEGIN
		SET @ID_STATUS = 
		(SELECT TOP 1 IdStatus FROM Tb_Status ORDER BY NEWID())
		
		SET @ID_CLIENTE =
		(SELECT TOP 1 IdCliente FROM Tb_Cliente ORDER BY NEWID())

		SET @ID_MODO_PAGAMENTO =
		(SELECT TOP 1 IdModoPagamento FROM Tb_Modo_Pagamento ORDER BY NEWID())

		SET @ID_BANDEIRA =
		(SELECT TOP 1 IdBandeira FROM Tb_Bandeira_Cartao ORDER BY NEWID())

		SET @ID_BANDEIRA =
		(SELECT TOP 1 IdBandeira FROM Tb_Bandeira_Cartao ORDER BY NEWID())

		SET @Desconto =
		(SELECT ROUND(RAND()* 5 + 1, 2))

		SET @DATA_PEDIDO = (SELECT
					CONVERT(DATE,CONVERT(VARCHAR(15),'2021-' +
					CONVERT(VARCHAR(5),(CONVERT(INT, RAND()*12))+ 1) + '-' +
					CONVERT(VARCHAR(5),(CONVERT(INT,RAND()*27))+1))))

		INSERT INTO Tb_Nota_Venda(Data_Pedido, Id_Status,Id_Cliente, Id_Modo_Pagamento, Id_Bandeira,desconto)
		VALUES (@DATA_PEDIDO, @ID_STATUS, @ID_CLIENTE, @ID_MODO_PAGAMENTO, @ID_BANDEIRA,@Desconto)
		
END
GO 5000




-- Conferindo as tabelas 

select * from Tb_Nota_Venda
 
select count(IdNotavenda) from Tb_Nota_Venda

select * from Tb_Item_Venda
order by 2


-- Atualizando a Tb_Nota_Venda, no campo subtotal trouxemos os valores da coluna total na tb_item_venda
------Não foi utilizando, logica errada.------------------------------------------------------------

update Tb_Nota_Venda
set Subtotal =(select 
sum(i.total)
from Tb_Item_Venda i
where IdNotaVenda = Id_Nota_Venda
group by id_nota_venda)
where subtotal is null 
go



-- Atualizando a Tb_Nota_Venda, co campo Total subtraimos a coluna subtotal com a desconto

Update Tb_Nota_Venda
Set Total = Subtotal - Desconto
From Tb_Nota_Venda
where Total = 0.00


