-----------------------------------------------------------------------------
-----------------Conferindo os bancos e seus valores-------------------------

select * from [MovieNet_OLTP].[dbo].[Relatorio_Venda_Fato_Item]; -- 35006
go

select * from [MovieNet_STAGE].[dbo].[ST_Tb_Fato]; -- 35006
go

select * from [MovieNet_DW].[dbo].[Fato_Venda];  --35006
go
--------------------------------------------------------------------------------



---------------------------------------------------------------------------------
---------------------Analisando o erro ------------------------------------------

select dn.idsk as IdNotavenda,
	   dc.Idsk as IdCliente,
	   dp.Idsk as IdProduto,
	   sf.Qtde_Produtos as QtdeProdutos,
	   sf.Subtotal as Subtotal,
	   sf.Desconto as Desconto,
	   sf.Total_Item as TotalItem,
	   dmc.Idsk as IdModoCompra,
	   dmp.Idsk as IdModoPagamento,
	   sf.IdBandeira as IdBandeira,
	   dt.Idsk as IdTempo

from [MovieNet_STAGE].[dbo].[ST_Tb_Fato] sf
inner join [MovieNet_DW].[dbo].[Dim_Nota_Venda] dn
on sf.IdNotaVenda = dn.IdNotaVenda

inner join Dim_Cliente dc
on sf.IdCliente = dc.IdCliente
		AND (dc.INICIO <= sf.data_pedido
		AND (dc.FIM >= sf.data_pedido) OR (dc.FIM IS NULL))

Inner join Dim_Produto dp
on sf.IdProduto = dp.IdProduto
		AND (dp.INICIO <= sf.data_pedido
		AND (dp.FIM >= sf.data_pedido) OR (dp.FIM IS NULL))

inner join Dim_Modo_Compra dmc
on sf.IdModoCompra = dmc.IdModoCompra

Inner join Dim_Modo_Pagamento dmp
on sf.IdModoPagamento = dmp.IdModoPagamento

Inner join Dim_Tempo dt
ON (CONVERT (VARCHAR, dt.DATA,102) = CONVERT(VARCHAR,sf.Data_Pedido,102))




---------------------------------------------------------------------



-----------------------------------------------------------------------------------
------------------------Criando uma view para analisar o ero ----------------------
create view teste 2
as
select idnotavenda as IdNotaVenda,
	   data_pedido as Data_Pedido,
	   IdCliente as IdCliente,
	   IdProduto as IdProduto,
	   qtde_produtos as Qtde_Produtos,
	   subtotal as Subtotal,
	   Desconto as Desconto,
	   total_item as Total_Item,
	   idmodocompra as IdModoCompra,
	   idmodopagamento as IdModoPagamento,
	   idbandeira as IdBandeira,
	   dt.idsk as IdTempo

from [MovieNet_STAGE].[dbo].[ST_Tb_Fato] sf
inner join [MovieNet_DW].[dbo].[Dim_Tempo] dt
on (CONVERT (VARCHAR, dt.DATA,102) = CONVERT(VARCHAR,sf.Data_Pedido,102))

WHERE sf.Data_Pedido 
BETWEEN 
(select MIN(DATA)
FROM [MovieNet_DW].[dbo].[Dim_Tempo] dt )
AND 
(select MAX(DATA)
FROM [MovieNet_DW].[dbo].[Dim_Tempo] dt)
