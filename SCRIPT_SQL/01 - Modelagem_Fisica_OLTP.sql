
-- CRIANDO O BANCO

CREATE DATABASE MovieNet_OLTP;
GO

USE MovieNet_OLTP;
GO


-- CRIANDO AS TABELAS

CREATE TABLE Tb_Genero_Filme(
	IdGenero int primary key identity,
	Nome_Genero Varchar(50) not null
);
GO

CREATE TABLE Tb_Modo_Disponivel(
	IdModoDisponivel int primary key identity,
	Nome_Modo_Disponivel varchar(30) not null
);
GO

CREATE TABLE Tb_Modo_Compra(
	IdModoCompra int primary key identity,
	Nome_Modo_Compra varchar(30) not null
);
GO


CREATE TABLE Tb_Comentario(
	IdComentario int primary key identity ,
	Id_Nota_Venda int not null,
	Comentario varchar(200) 
);
GO


CREATE TABLE Tb_Produto(
	IdProduto int primary key identity(10,2),
	Nome_Filme varchar(150) not null,
	Id_Genero int ,
	Id_Modo_Disponivel int,
	Id_Modo_Compra int,
	Preco_Custo numeric(10,2),
	Preco_Venda numeric(10,2),
	Preco_Alugado numeric(10,2) 
);
GO



CREATE TABLE Tb_Status(
	IdStatus int primary key identity,
	Status_Pedido varchar(30) not null
);
GO


CREATE TABLE Tb_Modo_Pagamento(
	IdModoPagamento int primary key identity,
	Nome_Pagamento varchar(20) not null
);
GO


CREATE TABLE Tb_Bandeira_Cartao(
	IdBandeira int primary key identity,
	Nome_Bandeira varchar(50) not null
);
GO


CREATE TABLE Tb_Item_Venda(
	IdItemVenda int primary key identity(400,1),
	Id_Nota_Venda int,
	Id_Produto int,
	Qtde_Produtos int,
	Total numeric(10,2)
);
GO


CREATE TABLE Tb_Nota_Venda(
	IdNotaVenda int primary key identity(500,1),
	Data_Pedido date,
	Id_Status int,
	Id_Cliente int,
	Id_Modo_Pagamento int,
	Id_Bandeira int,
	Subtotal numeric(10,2),
	Desconto numeric(10,2),
	Total numeric(10,2)
);
GO


CREATE TABLE Tb_Email_Promocional(
	IdEmailPromocional int primary key identity,
	Tipos varchar(30) not null
);
GO


CREATE TABLE Tb_Telefone(
	IdTelefone int primary key identity,
	Telefone varchar(15) not null,
	Id_Cliente int unique
);
GO


CREATE TABLE Tb_Endereco(
	IdEndereco int primary key identity,
	Rua varchar(100) not null,
	Cidade varchar(50) not null,
	Pais varchar(100) not null,
	CodPostal int,
	Id_Cliente int unique
);
GO


CREATE TABLE Tb_Cliente(
	IdCliente int primary key identity(100,1),
	Nome varchar(20) not null,
	Sobrenome varchar(50) not null,
	Ultimo_Nome varchar(30) not null,
	Sexo char(1) not null,
	Estado_Civil char(1) not null,
	Data_Nascimento date,
	Email varchar(100) not null unique,
	Id_Email_Promocional int
);
GO


CREATE TABLE Tb_Qualidade (
IdQualidade int primary key,
Nome_Qualidade Varchar(15) not null
);
go



Alter table tb_endereco
alter column CodPostal varchar(30)




