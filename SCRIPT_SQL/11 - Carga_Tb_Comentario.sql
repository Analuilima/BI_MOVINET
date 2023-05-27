

use MovieNet_OLTP;
go


-- Conferindo a Tb_Comentario

select * from Tb_Comentario


use MovieNet_OLTP;
go

-- Inserindo dados aleatorios na Tb_Comentario

DECLARE

		@ID_NOTA_VENDA INT,
		@QUALIDADE varchar (15)
BEGIN
		
		SET @ID_NOTA_VENDA =
			(SELECT TOP 1 IdNotaVenda FROM Tb_Nota_Venda ORDER BY NEWID())
			
		SET @QUALIDADE =
			(SELECT TOP 1 Nome_Qualidade FROM [dbo].[Tb_Qualidade] ORDER BY NEWID())

		
		INSERT INTO Tb_Comentario(Id_Nota_Venda,Comentario)
		VALUES(@ID_NOTA_VENDA, @QUALIDADE)

END
GO 2
