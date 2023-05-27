

-- Criando o ambiente stage
go


-- As tabelas dimensoes

--Tb_Cliente
--Tb_Produto
--Tb_Modo_Pagamento
--Tb_Bandeira_Cartão
--Tb_Modo_Compra
--Modo_Disponivel
--Tb_Email_Promocional
--Tb_Genero_Filme
--Tb_Comentario

go
--Tabela fato

--IdNotaVenda
--Data_Pedido
--IdCliente
--IdProduto
--Qtde_Produtos
--Subtotal
--Desconto
--Total
--IdModoCompra
--IdModoPagamento
--IdBandeira
--IdComentario 

go

Create database MovieNet_STAGE;
go

Use MovieNet_STAGE;
go


Create table ST_Tb_Cliente(
	IdCliente int default null,
	Nome_Completo varchar(200) default null,
	Sexo varchar(15) default null,
	Estado_Civil varchar(15) default null,
	Data_Nascimento int default null,
	Email varchar(250) default null,
	Cidade varchar(100) default null,
	Pais varchar(100) default null,
	Telefone varchar(15) default null,
	IdEmailPromocional int default null
);
go


Create table ST_Tb_Modo_Disponivel(
	IdModoDisponivel int default null,
	Nome_Modo_Disponivel varchar(20) default null
);
go


Create table ST_Tb_Comentario(
	IdComentario int default null,
	Comentario varchar(30) default null,
	Id_Nota_Venda int default null
);
go


Create table ST_Tb_Produto(
	IdProduto int default null,
	Nome_Completo varchar (200) default null,
	IdGenero int default null,
	Preco_Venda numeric(10,2) default null,
	Preco_Alugado numeric(10,2) default null
);
go


Create table ST_Tb_Modo_Pagamento(
	IdModoPagamento int default null,
	Nome_Pagamento varchar(20) default null
);
go


Create table ST_Tb_Email_Promocional(
	IdEmailPromocional int default null,
	Tipo varchar(20) default null
);
go


Create table ST_Tb_Modo_Compra(
	IdModoCompra int default null,
	Nome_Modo_Compra varchar(15) default null
);
go


Create table ST_Tb_Genero_Filme(
	IdGenero int default null,
	Nome_Genero varchar(50) default null
);
go


Create table ST_Tb_Bandeira_Cartao(
	idBandeira int default null,
	Nome_Bandeira varchar(30) default null
);
go


Create Table ST_Tb_Fato(
	IdNotaVenda int default null,
	Data_Pedido date default null,
	IdCliente int default null,
	IdProduto int default null,
	Qtde_Produtos Int default null,
	Subtotal numeric(10,2) default null,
	Desconto numeric(10,2) default null,
	Total_Item numeric(10,2) default null,
	IdModoCompra int default null,
	IdModoPagamento int default null,
	IdBandeira int default null
);
go








