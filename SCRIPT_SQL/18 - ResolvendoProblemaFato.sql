
------------------------------------------------------------
SELECT COUNT (idnotavenda)
from [MovieNet_STAGE].dbo.ST_Tb_fato

SELECT distinct  idnotavenda
from [MovieNet_STAGE].dbo.ST_Tb_fato
------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------
------- O erro se trata que os modos de pagamentos 1 n�o est�o entrando no banco dw tabela fato------------
-------Esse erro ocorria, pois haviam valores nulos no idbandeira, e o idsk da tabela bandeira no banco dw---
-------n�o tinha valor nulo, deste modo, havia conflito nas informa��es. Assim, puxei os idbandeira----------
------- do banco stage, ao inves de puxar do banco dw--------------------------------------------------------

SELECT *
from [MovieNet_STAGE].dbo.ST_Tb_fato
order by 1

SELECT *
from [MovieNet_STAGE].dbo.ST_Tb_fato
where IdModoPagamento = 1
order by 1

select * from [MovieNet_DW].[dbo].[Fato_Venda]
order by 1

select * from [MovieNet_DW].[dbo].[Fato_Venda]
where IdModoPagamento = 1
order by 

-------------------------------------------------------------------------------------------------------------







SELECT idsk
FROM [MovieNet_DW].[dbo].[Dim_Nota_Venda]
WHERE idsk
		NOT IN(SELECT IdNotaVenda
				FROM [MovieNet_DW].[dbo].[Fato_Venda])
				
order by 1

select * from [MovieNet_DW].[dbo].[Fato_Venda]
where IdNotaVenda 
not in (select IdNotaVenda from [MovieNet_DW].[dbo].[Dim_Nota_Venda])




