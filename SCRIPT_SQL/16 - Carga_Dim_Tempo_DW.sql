

USE MovieNet_DW;
go


-- CARREGANDO A DIM_TEMPO

--EXIBINDO A DATA ATUAL

PRINT CONVERT(VARCHAR, GETDATE(),113)

--ALTERANDO O INCREMENTO PARA INICIO EM 50000
--PARA A POSSIBILIDADE DE DATAS ANTERIORES

DBCC CHECKIDENT (DIM_TEMPO, RESEED, 10000)

--INSERÇÃO DE DADOS NA DIMENSÃO

DECLARE 
		@DATAINICIO DATETIME,
		@DATAFIM DATETIME,
		@DATA DATETIME

PRINT GETDATE()
		
		SELECT @DATAINICIO = '1/1/2015',
			   @DATAFIM = '1/1/2022'

		SELECT @DATA = @DATAINICIO

WHILE @DATA < @DATAFIM

BEGIN
	  INSERT INTO Dim_Tempo
	  (
			Data,
			DIA,
			Dia_Semana,
			MES,
			Nome_Mes,
			QUARTO,
			Nome_Quarto,
			ANO
	  )

	  SELECT @DATA AS DATA, DATEPART(DAY,@DATA) AS DIA,
			
			CASE DATEPART(DW, @DATA)

				WHEN 1 THEN 'Domingo'
				WHEN 2 THEN 'Segunda'
				WHEN 3 THEN 'Terça'
				WHEN 4 THEN 'Quarta'
				WHEN 5 THEN 'Quinta'
				WHEN 6 THEN 'Sexta'
				WHEN 7 THEN 'Sábado'

			END AS DIA_SEMANA,

			DATEPART(MONTH,@DATA) AS MES,

			CASE DATENAME(MONTH,@DATA)

				WHEN 'Janeiro' THEN 'Janeiro'
				WHEN 'Fevereiro' THEN 'Fevereiro'
				WHEN 'Março' THEN 'Março'
				WHEN 'Abril' THEN 'Abril'
				WHEN 'Maio' THEN 'Maio'
				WHEN 'Junho' THEN 'Junho'
				WHEN 'Julho' THEN 'Julho'
				WHEN 'Agosto' THEN 'Agosto'
				WHEN 'Setembro' THEN 'Setembro'
				WHEN 'Outubro' THEN 'Outubro'
				WHEN 'Novembro' THEN 'Novembro'
				WHEN 'Dezembro' THEN 'Dezembro'

			END AS NOME_MES,

			DATEPART(qq,@DATA) QUARTO,

			CASE DATEPART(qq,@DATA)
				
				WHEN 1 THEN 'Primeiro'
				WHEN 2 THEN 'Segundo'
				WHEN 3 THEN 'Terceiro'
				WHEN 4 THEN 'Quarto'

			END AS NOME_QUARTO,

			DATEPART(YEAR,@DATA) ANO

		SELECT @DATA = DATEADD(dd,1,@DATA)
	END

	UPDATE Dim_Tempo
	SET DIA = '0' + DIA
	WHERE LEN(DIA) = 1

	UPDATE Dim_Tempo
	SET MES = '0' + MES
	WHERE LEN(MES) = 1

	UPDATE Dim_Tempo
	SET DATA_COMPLETA = ANO + MES + DIA
	GO

	SELECT * FROM DIM_TEMPO;
	GO


	-- FINS DE SEMANA E ESTAÇÕES 

	DECLARE C_TEMPO CURSOR FOR
		SELECT IDSK, DATA_COMPLETA, DIA_SEMANA, ANO, Dia, Mes FROM DIM_TEMPO
	DECLARE
			@ID INT,
			@DATA VARCHAR(10),
			@DIASEMANA VARCHAR(20),
			@ANO CHAR(4),
			@FIMSEMANA CHAR(3),
			@ESTACAO VARCHAR(15),
			@Dia int, 
		    @Mes int,
			@Feriado varchar(50)


	OPEN C_TEMPO
		FETCH NEXT FROM C_TEMPO
		INTO @ID, @DATA, @DIASEMANA, @ANO, @DIA, @MES
	WHILE @@FETCH_STATUS = 0
	BEGIN

			IF @DIASEMANA IN ('Domingo','Sábado')
				SET @FIMSEMANA = 'Sim'
			ELSE
				SET @FIMSEMANA = 'Não'


-- ATUALIZANDO ESTACOES

			IF @DATA BETWEEN CONVERT (CHAR(4),@ANO) + '0923'
			AND CONVERT(CHAR(4),@ANO) + '1220'
				SET @ESTACAO = 'Primavera'

			ELSE IF @DATA BETWEEN CONVERT(CHAR(4),@ANO) + '0321'
			AND CONVERT(CHAR(4),@ANO) + '0620'
				SET @ESTACAO = 'Outono'

			ELSE IF @DATA BETWEEN CONVERT(CHAR(4),@ANO) + '0621'
			AND CONVERT(CHAR(4),@ANO) + '0922'
				SET @ESTACAO = 'Inverno'

			ELSE --@DATA BETWEEN 21/12 e 20/03
				SET @ESTACAO = 'Verão'




-- Atualizando Feriados

			IF (@Mes = 1 and @Dia =1 ) or (@Mes = 12 and @Dia = 31)
				SET @Feriado = 'Ano Novo'

			ELSE IF (@Mes = 2 and @Dia = 14  )
				SET @Feriado = 'Dia dos Namorados-wrld'

			ELSE IF (@Mes = 4 and @Dia = 21  )
				SET @Feriado = 'Tiradentes'

			ELSE IF (@Mes = 5 and @Dia = 1  )
				SET @Feriado = 'Dia do Trabalhador'

			ELSE IF (@Mes = 6 and @Dia = 12  )
				SET @Feriado = 'Dia dos Namorados-Br'

			ELSE IF (@Mes = 9 and @Dia = 7  )
				SET @Feriado = 'Independência do Brasil'

		    ELSE IF (@Mes = 12 and @Dia = 25  )
				SET @Feriado = 'Natal'

			ELSE --datas que não tem feriado
				SET @Feriado = Null



-- ATUALIZANDO FINS DE SEMANA
	
			UPDATE DIM_TEMPO 
			SET FIM_SEMANA = @FIMSEMANA
			WHERE IDSK = @ID



-- ATUALIZANDO Estacao do ano

			UPDATE DIM_TEMPO
			SET ESTACAO_ANO = @ESTACAO
			WHERE IDSK = @ID



-- Atualizando feriados
			
			UPDATE DIM_TEMPO 
			SET Feriado = @Feriado
			WHERE IDSK = @ID


		FETCH NEXT FROM C_TEMPO
		INTO @ID, @DATA, @DIASEMANA, @ANO, @DIA, @MES

	END 
	CLOSE C_TEMPO
	DEALLOCATE C_TEMPO
	GO


SELECT * FROM DIM_TEMPO;



