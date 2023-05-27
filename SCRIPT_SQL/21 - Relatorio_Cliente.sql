

use MovieNet_OLTP;
go

-- Relatorio de clientes
select c.idcliente, 
	   c.Nome + ' ' + sobrenome + ' ' + Ultimo_Nome as Nome_Completo,
	   c.Sexo,
	   c.Estado_Civil,
	   (floor(cast(DATEDIFF(DAY, c.data_nascimento, getdate()) / 365.25 as int))) as idade,
	   c.Email,
	   e.Cidade,
	   e.Pais,
	   t.Telefone,
	   c.Id_Email_Promocional
from Tb_Cliente c
Inner join Tb_Endereco e
on c.IdCliente = e.Id_Cliente
Inner join Tb_Telefone t
On c.IdCliente = t.Id_Cliente
go

select COUNT(idcliente)
from Tb_Cliente


select * from Tb_Cliente