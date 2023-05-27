
use MovieNet_OLTP;
go


-- Inserindo dados aleatorios na Tb_Item_Venda, tendo apenas o total dos produtos vendidos

DECLARE

		@ID_NOTA_VENDA INT, 
		@ID_PRODUTO INT,
		@QTDE_PRODUTOS INT,
		@VALOR_VENDA NUMERIC(10,2),  
		@TOTAL NUMERIC(10,2)

BEGIN
		
		SET @ID_NOTA_VENDA =
			(SELECT TOP 1 IdNotaVenda FROM Tb_Nota_Venda ORDER BY NEWID())

		SET @ID_PRODUTO =
			(SELECT TOP 1 IdProduto FROM Tb_Produto ORDER BY NEWID())
				
		SET @QTDE_PRODUTOS =
			(SELECT ROUND(RAND() * 3+ 1, 0))

		SET @VALOR_VENDA = 
			(SELECT Preco_Venda FROM Tb_Produto WHERE IdProduto = @ID_PRODUTO)
		
		SET @TOTAL= @VALOR_VENDA * @QTDE_PRODUTOS     -- Irá multiplicar apenas os produtos que são vendidos
		
			
		INSERT INTO Tb_Item_Venda(Id_Nota_Venda,Id_Produto,Qtde_Produtos,Total)
		VALUES(@ID_NOTA_VENDA,@ID_PRODUTO,@QTDE_PRODUTOS,@TOTAL)

END
GO 5596




-- Update para inserir o total dos produtos alugados 

update Tb_Item_Venda
set Total=
Qtde_Produtos * Preco_alugado from Tb_Item_Venda i
Inner Join Tb_Produto p
On IdProduto = Id_Produto
where total is null




-- Conferir determinado produto
select * from tb_produto
where IdProduto = 326 



-- Conferir a tabela toda
select * from Tb_Item_Venda


Select count (IdItemVenda )
from Tb_Item_Venda
 
 select distinct count (iditemvenda)
 from Tb_Item_Venda


-- Select que ajudou a resolver o problema de inserir os totais dos produtos alugados
Select ISNULL(Total , Qtde_Produtos * Preco_Alugado) as Total from Tb_Item_Venda
inner join Tb_Produto 
On Idproduto = Id_Produto






-- Algumas Notas_Vendas não possuem Item_Venda

-- QUERY PARA VERIFICAR QUAIS NOTAS NAO RECEBERAM ITEM

SELECT IdNotaVenda
FROM Tb_Nota_Venda
WHERE IdNotaVenda
		NOT IN(SELECT Id_Nota_Venda
				FROM Tb_Item_Venda)
ORDER BY 1;
GO



--CRIANDO UM CURSOR PARA PREENCHER AS NOTAS SEM ITENS
-- OBS: NOTAS PREENCHIDAS COM APENAS 1 ITEM ALEATORIO

CREATE PROCEDURE Cadastro_Notas_Vendass
 AS
DECLARE
	
		C_NOTAS CURSOR FOR
		SELECT IdNotaVenda
FROM Tb_Nota_Venda
WHERE IdNotaVenda
		NOT IN(SELECT Id_Nota_Venda
				FROM Tb_Item_Venda)
		
DECLARE
		@ID_NOTA_VENDA INT,
		@ID_PRODUTO INT,
		@TOTAL DECIMAL(10,2)

OPEN C_NOTAS

FETCH NEXT FROM C_NOTAS
INTO @ID_NOTA_VENDA

WHILE @@FETCH_STATUS = 0

BEGIN

		SET @ID_PRODUTO =
		(SELECT TOP 1 IdProduto from Tb_Produto ORDER BY NEWID())

		SET @TOTAL =
		(SELECT Preco_Venda FROM Tb_Produto WHERE IdProduto = @ID_PRODUTO)


		INSERT INTO Tb_Item_Venda(Id_Nota_Venda,Id_Produto,Qtde_Produtos,Total)
		VALUES(@ID_NOTA_VENDA,@ID_PRODUTO,1,@TOTAL)

FETCH NEXT FROM C_NOTAS
INTO @ID_NOTA_VENDA

END

CLOSE C_NOTAS
DEALLOCATE C_NOTAS
GO

EXEC Cadastro_Notas_Vendass
GO


