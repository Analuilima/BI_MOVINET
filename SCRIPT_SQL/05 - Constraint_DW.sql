

use MovieNet_DW;
go


-- Tabela Dim_Produto
alter table Dim_Produto add constraint FK_Produto_Genero
foreign key (IdGenero) references Dim_Genero_Filme(Idsk);
go


--Tabela Fato_Venda
alter table Fato_Venda add constraint FK_Fato_Cliente
foreign key (IdCliente) references Dim_Cliente(Idsk);
go

alter table Fato_Venda add constraint FK_Fato_Produto
foreign key (IdProduto) references Dim_Produto(Idsk);
go

alter table Fato_Venda add constraint FK_Fato_Modo_Pagamento
foreign key (IdModoPagamento) references Dim_Modo_Pagamento(Idsk);
go

alter table Fato_Venda add constraint FK_Fato_Modo_Compra
foreign key (IdModoCompra) references Dim_Modo_Compra(Idsk);
go

alter table Fato_Venda add constraint FK_Fato_Bandeira
foreign key (IdBandeira) references Dim_Bandeira_Cartao(Idsk);
go

alter table Fato_venda add constraint FK_Fato_Tempo
foreign key (IdskTempo) references Dim_Tempo(Idsk);
go


---Tabela Dim_Comentario
alter table Dim_Comentario add constraint FK_Fato_Nota_Comentario
foreign key (Id_Nota_Venda) references  Dim_Nota_Venda(idsk);
go


-- Tabela Fato_Venda
alter table Fato_venda add constraint FK_Fato_Nota
foreign key (IdNotaVenda)  references Dim_Nota_Venda(Idsk);
go



--Tabela Cliente
alter table Dim_Cliente add constraint FK_Cliente_Email
foreign key (IdEmailPromocional) references Dim_Email_Promocional(Idsk);
go




