
-- Construindo as Constraints

Use MovieNet_OLTP;
go

-- Tabela Comentario
Alter Table Tb_Comentario add constraint Fk_Comentario_Nota_Venda
Foreign Key (Id_Nota_Venda) references Tb_Nota_Venda (IdNotaVenda);
go


--Tabela Produto
Alter Table Tb_Produto add constraint Fk_Produto_Genero
Foreign Key (Id_Genero) references Tb_Genero_Filme(IdGenero);
go

Alter Table Tb_Produto add constraint Fk_Produto_Modo_Disponivel
Foreign Key (Id_Modo_Disponivel) references Tb_Modo_Disponivel(IdModoDisponivel);
go

Alter Table Tb_Produto add constraint Fk_Produto_Modo_Compra
Foreign Key (Id_Modo_Compra) references Tb_Modo_Compra(IdModoCompra);
go


-- Tabela Item Venda
Alter table Tb_Item_Venda add constraint Fk_Item_Venda_Nota_Venda
Foreign Key (Id_Nota_Venda) references Tb_Nota_Venda(IdNotaVenda);
go

Alter Table Tb_Item_Venda add constraint Fk_Item_Venda_Produto
Foreign Key (Id_Produto) references Tb_Produto(IdProduto); 
go



-- Tabela Nota Venda
Alter Table Tb_Nota_Venda add constraint Fk_Nota_Venda_Status 
Foreign Key (Id_Status) references Tb_Status(IdStatus);
go

Alter Table Tb_Nota_Venda add constraint Fk_Nota_Venda_Cliente
Foreign Key (Id_Cliente) references Tb_Cliente(IdCliente);
Go

Alter Table Tb_Nota_Venda add constraint Fk_Nota_Venda_Modo_Pagamento
Foreign Key (Id_Modo_Pagamento) references Tb_Modo_Pagamento(IdModoPagamento);
go

Alter Table Tb_Nota_Venda add constraint Fk_Nota_Venda_Bandeira
Foreign Key (Id_Bandeira) references Tb_Bandeira_Cartao(IdBandeira);
go


-- Tabela Telefone
Alter Table Tb_telefone add constraint Fk_Telefone_Cliente
Foreign Key (Id_Cliente) references Tb_Cliente(IdCliente);
go


-- Tabela Endereco
Alter Table Tb_Endereco add constraint Fk_Endereco_Cliente
Foreign Key (Id_Cliente) references Tb_Cliente(IdCliente);
go


-- Tabela Cliente
Alter Table Tb_Cliente add constraint Fk_Cliente_Email_Promocional
Foreign Key (Id_Email_Promocional) references Tb_Email_Promocional(IdEmailPromocional);
go
