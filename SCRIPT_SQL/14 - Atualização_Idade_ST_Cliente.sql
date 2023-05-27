


CREATE PROCEDURE Idade_Cliente
 AS
DECLARE
	
		C_Idade CURSOR FOR
		SELECT idcliente, data_nascimento
FROM ST_Tb_Cliente

DECLARE
		@idcliente int,
		@data_nascimento date
		

OPEN C_Idade

FETCH NEXT FROM C_Idade
INTO @idcliente

WHILE @@FETCH_STATUS = 0

BEGIN


set @data_nascimento =
	(SELECT convert(char(2),(YEAR(getdate()) - YEAR(data_nascimento))-
    case when (month(getdate()) < month(data_nascimento)) then
             '1'
    else
        case when ((month(getdate()) = month(data_nascimento)) and (day(getdate()) < day(data_nascimento))) then
            '1'
        else       
            case when (day(getdate()) = day(data_nascimento)) then
              '0'
            else
              '0'   
            end
        end
    end)
from ST_Tb_Cliente
)



	UPDATE ST_Tb_Cliente
	SET Data_Nascimento = @data_nascimento
	WHERE idcliente = @idcliente

	FETCH NEXT FROM C_Idade
	
	INTO @idcliente

	END 
	CLOSE C_Idade
	DEALLOCATE C_Idade
	GO


	exec Idade_Cliente;
	go