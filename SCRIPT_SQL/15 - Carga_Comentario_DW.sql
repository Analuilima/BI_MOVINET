
--------------------------------------------------------------------------------------
------------ Verificando os bancos ---------------------------------------------------

select * from [MovieNet_OLTP].[dbo].[Tb_Comentario]

select * from [MovieNet_STAGE].[dbo].[ST_Tb_Comentario]

select * from [MovieNet_DW].[dbo].[Dim_Comentario]


---------------------------------------------------------------------------------------
----------- Realizando o select que vai levar os comentarios --------------------------
select sc.idcomentario as IdComentario,
	   sc.comentario as Comentario,
	   dn.idsk as Id_Nota_Venda
	    
from [MovieNet_STAGE].[dbo].[ST_Tb_Comentario] sc

inner join [MovieNet_DW].[dbo].[Dim_Nota_Venda] dn
on dn.IdNotaVenda = sc.Id_Nota_Venda

where sc.IdComentario not in (select dc.IdComentario from [MovieNet_DW].[dbo].[Dim_Comentario] dc)



