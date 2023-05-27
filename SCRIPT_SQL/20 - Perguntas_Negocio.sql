
use MovieNet_OLTP;
go

-- Segunda pergunta: Qual genero é mais vendido e qual o mais alugado.

select g.Nome_Genero, sum(n.Total) as total_alugado
from Tb_Genero_Filme g
Inner join Tb_Produto p
on g.IdGenero = p.Id_Genero
Inner join Tb_Item_Venda i
on p.IdProduto = i.Id_Produto
inner join Tb_Nota_Venda n
on IdNotaVenda = Id_Nota_Venda
where i.Id_Modo_Compra = 1
Group by g.Nome_Genero
Order By 2 desc
go

select g.Nome_Genero, sum(n.Total) as total_vendido
from Tb_Genero_Filme g
Inner join Tb_Produto p
on g.IdGenero = p.Id_Genero
Inner join Tb_Item_Venda i
on p.IdProduto = i.Id_Produto
inner join Tb_Nota_Venda n
on IdNotaVenda = Id_Nota_Venda
where i.Id_Modo_Compra = 2
Group by g.Nome_Genero
Order By 2 desc
go





select nome_genero, data_pedido, sum(n.total)
from Tb_Genero_Filme
inner join Tb_Produto
on IdGenero = Id_Genero
inner join Tb_Item_Venda 
on IdProduto = Id_Produto
inner join Tb_Nota_Venda n
on IdNotaVenda = Id_Nota_Venda
where nome_genero between 'Suspense' and 'Terror'
group by Nome_Genero, Data_Pedido



select data_pedido
from Tb_Nota_Venda
order by 1 asc






--suspense, terror -> halloween 31-10
-- comedia, romance, drama e fantasia -> dia dos namorados e natal 14-02    12-06 brasil 25-12






-- primeira pergunta: alugamos mais do que vendemos, entrentando o modo que nos rende mais é o modo de compra

select sum(n.total) as 'Total de Alugados'
from Tb_Nota_Venda n
Inner join Tb_Item_Venda i
ON n.idnotavenda = i.Id_Nota_Venda
where i.id_modo_compra = 1 
go

select count(n.IdNotaVenda) as 'Qtde de Alugados'
from Tb_Nota_Venda n
Inner join Tb_Item_Venda i
ON n.idnotavenda = i.Id_Nota_Venda
where i.id_modo_compra = 1 
go

select sum(n.total) as 'Total de Vendidos'
from Tb_Nota_Venda n
Inner join Tb_Item_Venda i
ON n.idnotavenda = i.Id_Nota_Venda
where i.id_modo_compra = 2
go

select count(n.IdNotaVenda) as 'Qtde de Vendidos'
from Tb_Nota_Venda n
Inner join Tb_Item_Venda i
ON n.idnotavenda = i.Id_Nota_Venda
where i.id_modo_compra = 2
go



-- Nona pergunta

select nome_filme, sum(Qtde_Produtos) as 'Filmes menos alugados'
From Tb_Item_Venda i
Inner join Tb_Produto p
on IdProduto = Id_Produto
where i.Id_Modo_Compra = 1
Group by nome_filme
Order By 2 asc
go

select nome_filme, sum(Qtde_Produtos) as 'Filmes menos vendidos'
From Tb_Item_Venda i
Inner join Tb_Produto p
on IdProduto = Id_Produto
where i.Id_Modo_Compra = 2
Group by nome_filme
Order By 2 asc
go



-- Decima primeira pergunta

select sexo, sum(total) as 'Total de saidas por genero'
from Tb_Item_Venda
Inner join Tb_Cliente
On Id_Cliente = IdCliente
group by sexo
order by 2 desc

select nome_genero, sexo, sum(total) as 'Total de saidas por genero'
from Tb_Item_Venda
Inner join Tb_Cliente
On Id_Cliente = IdCliente
inner join Tb_Produto p
on id_produto = IdProduto
inner join Tb_Genero_Filme
on id_genero = idgenero
group by sexo, nome_genero
order by 3 desc
