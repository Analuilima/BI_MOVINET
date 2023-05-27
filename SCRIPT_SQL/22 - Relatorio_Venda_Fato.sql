

use MovieNet_OLTP;
go


-- Analisando em um grão maior, pelo total de nota.
Create view Relatorio_Vendas_Fato
As
Select n.IdNotaVenda as IdNotaVenda,
	   n.Data_Pedido as Data_Pedido,
	   n.Id_Cliente as IdCliente,
	   i.Id_Produto as IdProduto,
	   i.Qtde_Produtos as Qtde_Produtos,
	   i.Total as Subtotal,
	   n.Desconto as Desconto,
	   n.Total as Total_Nota,
	   p.Id_Modo_Compra as IdModoCompra,
	   n.Id_Modo_Pagamento as IdModoPagamento,
	   n.Id_Bandeira as IdBandeira
From Tb_Nota_Venda n
Inner join Tb_Item_Venda i
On n.IdNotaVenda = i.Id_Nota_Venda
inner join Tb_Produto p
On p.IdProduto = i.Id_Produto
order by 1
go


select count(idnotavenda)
from Tb_Nota_Venda

select count(iditemvenda)
from Tb_IteM_vENDA


-- Trazendo os valores totais de cada nota agrupados
select IdNotaVenda, total 
from Relatorio_Vendas_Fato
group by IdNotaVenda, total
order by 1


--Conferindo se os valores estão certos
select * from Relatorio_Vendas_Fato
order by 1




-- Analisando por um grão menor, pelo total de item
Create view Relatorio_Venda_Fato_Item
As
Select n.IdNotaVenda as IdNotaVenda,
	   n.Data_Pedido as Data_Pedido,
	   n.Id_Cliente as IdCliente,
	   i.Id_Produto as IdProduto,
	   i.Qtde_Produtos as Qtde_Produtos,
	   i.Total as Subtotal,
	   n.Desconto as Desconto,
	  (i.total - n.Desconto) as Total_Item,
	   p.Id_Modo_Compra as IdModoCompra,
	   n.Id_Modo_Pagamento as IdModoPagamento,
	   n.Id_Bandeira as IdBandeira
From Tb_Nota_Venda n
Inner join Tb_Item_Venda i
On n.IdNotaVenda = i.Id_Nota_Venda
inner join Tb_Produto p
On p.IdProduto = i.Id_Produto

go


