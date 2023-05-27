
use MovieNet_OLTP;
go

Select * from Tb_Comentario	


select * from Tb_Comentario
where Comentario = 'Horrível'

select * from Tb_Comentario
where Comentario = 'Excelente'

select * from Tb_Comentario
where Comentario = 'Ótimo'

select * from Tb_Comentario
where Comentario = 'Bom'

select * from Tb_Comentario
where Comentario = 'Recomendo'

select * from Tb_Comentario
where Comentario = 'Ruim'

select * from Tb_Comentario
where Comentario = 'Não Recomendo'

Update Tb_Comentario
set Comentario = 'Bom'
where IdComentario in (select top 40 idcomentario from Tb_Comentario where Comentario = 'Não Recomendo')


