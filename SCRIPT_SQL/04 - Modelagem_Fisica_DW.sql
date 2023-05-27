

Create database MovieNet_DW;
go


Use MovieNet_DW;
go



Create table Dim_Cliente(
	Idsk int primary key identity,
	IdCliente int default null,
	Nome_Completo varchar(200) default null,
	Sexo varchar(15) default null,
	Estado_Civil varchar(15) default null,
	Data_Nascimento int default null,
	Email varchar(250) default null,
	IdEmailPromocional int default null,
	Cidade varchar(100) default null,
	Pais varchar(100) default null,
	Telefone varchar(15) default null,
	Inicio datetime,
	Fim datetime
);
go


Create table Dim_Modo_Disponivel(
	IdModoDisponivel int default null,
	Nome_Modo_Disponivel varchar(20) default null
);
go


Create table Dim_Comentario(
	Idsk int primary key identity,
	IdComentario int default null,
	Comentario varchar(30) default null,
	Id_Nota_Venda int default null
);
go


Create table Dim_Produto(
	Idsk int primary key identity,
	IdProduto int default null,
	Nome_Completo varchar (200) default null,
	IdGenero int default null,
	Preco_Venda numeric(10,2) default null,
	Preco_Alugado numeric(10,2) default null,
	Inicio datetime,
	Fim datetime
);
go


Create table Dim_Modo_Pagamento(
	Idsk int primary key identity,
	IdModoPagamento int default null,
	Nome_Pagamento varchar(20) default null
);
go


Create table Dim_Email_Promocional(
	Idsk int primary key identity,
	IdEmailPromocional int default null,
	Tipo varchar(20) default null
);
go


Create table Dim_Modo_Compra(
	Idsk int primary key identity,
	IdModoCompra int default null,
	Nome_Modo_Compra varchar(15) default null
);
go


Create table Dim_Genero_Filme(
	Idsk int primary key identity,
	IdGenero int default null,
	Nome_Genero varchar(50) default null,
	Inicio datetime,
	Fim datetime
);
go


Create table Dim_Bandeira_Cartao(
	Idsk int primary key identity,
	IdBandeira int default null,
	Nome_Bandeira varchar(30) default null
);
go


Create Table Fato_Venda(
	IdNotaVenda int default null,
	Data_Pedido date,
	IdCliente int default null,
	IdProduto int default null,
	Qtde_Produtos Int default null,
	Subtotal numeric(10,2) default null,
	Desconto numeric(10,2) default null,
	Total_Item numeric(10,2) default null,
	IdModoCompra int default null,
	IdModoPagamento int default null,
	IdBandeira int default null,
	IdskTempo int null
);
go

Create table Dim_Tempo(
	Idsk INT PRIMARY KEY IDENTITY,
	Data DATE,
	Dia CHAR(2),
	Dia_Semana VARCHAR(10),
	Mes CHAR(2),
	Nome_Mes VARCHAR(20),
	Quarto TINYINT,
	Nome_Quarto VARCHAR(20),
	Ano CHAR(4),
	Estacao_Ano VARCHAR(20),
	Fim_Semana CHAR(3),
	Feriado varchar(30),
	Data_Completa VARCHAR(10)
);
go



Create table Dim_Nota_Venda(	
	Idsk int primary key identity,
	IdNotaVenda int default null
);
go

