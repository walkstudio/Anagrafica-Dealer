CREATE PROCEDURE [Utility].[SP_ExportDealer_Get] 
		@vXML AS XML,
		@Utente nvarchar(20)
AS
BEGIN

--DECLARE @vXML AS XML
--SET @vXML = N'<XML>
--<FIELD id="OrariApertura" value="" typeDb="schedule" IDTipoDealer="1, 2" > 
-- <FIELDCHILD id="OrariApertura" value="9.00" value2="12.30" typeDb="mattino" />
-- <FIELDCHILD id="OrariApertura" value="14.00" value2="18.30" typeDb="pomeriggio" />
-- <FIELDCHILD id="OrariApertura" value="1" typeDb="Lun" />
-- <FIELDCHILD id="OrariApertura" value="1" typeDb="Mar" />
-- <FIELDCHILD id="OrariApertura" value="1" typeDb="Mer" />
-- <FIELDCHILD id="OrariApertura" value="1" typeDb="Gio" />
-- <FIELDCHILD id="OrariApertura" value="1" typeDb="Ven" />
-- <FIELDCHILD id="OrariApertura" value="1" typeDb="Sab" />
-- <FIELDCHILD id="OrariApertura" value="1" typeDb="Dom" />
--</FIELD>
--<FIELD id="Campo2" value="2,8,9,10,16" typeDb="combo" IDTipoDealer="1, 3" />
--<FIELD id="Campo3" value="Val3" typeDb="text" IDTipoDealer="1, 2, 3" />
--<FIELD id="Campo4" value="Val4" typeDb="check" IDTipoDealer="3" />
--<FIELD id="Campo5" value="1,2,3,4,5,6" typeDb="combo" IDTipoDealer="1, 5" />
--<FIELD id="Campo6" value="Val4" typeDb="text" IDTipoDealer="5" />
--<FIELD id="Campo7" value="47.65100" value2="-122.34900" typeDb="geography" IDTipoDealer="2" />
--<RETURNFIELD value="campo1, campo2, campo3" />
--<EXPORTFIELDS value="campo1exp, campo2exp, campo3exp" />
--</XML>'

;WITH wcte AS (
       SELECT x.header.value('@id','nvarchar(50)') id,
               x.header.value('@value','nvarchar(MAX)') value,
               x.header.value('@value2','nvarchar(MAX)') value2,
               x.header.value('@typeDb','nvarchar(50)') typeDb,
               x.header.value('@IDTipoDealer','nvarchar(MAX)') IDTipoDealer
from @vXML.nodes('/XML/FIELD') as x(header)
) 
SELECT  * 
INTO #WhereTable
FROM wcte

DECLARE @WhereCondictions1 NVARCHAR(MAX)
SET @WhereCondictions1 = ''
DECLARE @WhereCondictions2 NVARCHAR(MAX)
SET @WhereCondictions2 = ''
DECLARE @WhereCondictions3 NVARCHAR(MAX)
SET @WhereCondictions3 = ''
DECLARE @WhereCondictions4 NVARCHAR(MAX)
SET @WhereCondictions4 = ''
DECLARE @WhereCondictions5 NVARCHAR(MAX)
SET @WhereCondictions5 = ''

DECLARE CursorWhereTable CURSOR FOR SELECT id FROM #WhereTable
DECLARE @ID nvarchar(50)

OPEN CursorWhereTable
FETCH NEXT FROM CursorWhereTable into @ID
WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @value NVARCHAR(MAX)
	DECLARE @value2 NVARCHAR(MAX)
	DECLARE @IDTipoDealer NVARCHAR(30)
	DECLARE @type NVARCHAR(50) 
	DECLARE @MaxDistance NVARCHAR(10)
	SET @value = (SELECT value FROM #WhereTable where id=@ID)
	SET @type = (SELECT typeDb FROM #WhereTable where id=@ID)
	SET @value2 = (SELECT value2 FROM #WhereTable where id=@ID)
	SET @IDTipoDealer = (SELECT IDTipoDealer FROM #WhereTable where id=@ID)
	SET @MaxDistance = '5000'

	
	IF ((@value IS NOT NULL AND @value <> '') AND (@IDTipoDealer IS NOT NULL AND @IDTipoDealer <> ''))
		OR (@type like 'schedule' AND (@IDTipoDealer IS NOT NULL AND @IDTipoDealer <> ''))
	BEGIN
		IF @WhereCondictions1 = '' AND @IDTipoDealer like '%1%'
		BEGIN
			SET @WhereCondictions1 = ' WHERE '
		END
		ELSE IF @IDTipoDealer like '%1%'
		BEGIN
			SET @WhereCondictions1 = @WhereCondictions1 + ' AND '
		END
		IF @WhereCondictions2 = '' AND @IDTipoDealer like '%2%'
		BEGIN
			SET @WhereCondictions2 = ' WHERE '
		END
		ELSE IF  @IDTipoDealer like '%2%'
		BEGIN
			SET @WhereCondictions2 = @WhereCondictions2 + ' AND '
		END
		IF @WhereCondictions3 = '' AND @IDTipoDealer like '%3%'
		BEGIN
			SET @WhereCondictions3 = ' WHERE '
		END
		ELSE IF @IDTipoDealer like '%3%'
		BEGIN
			SET @WhereCondictions3 = @WhereCondictions3 + ' AND '
		END
		IF @WhereCondictions4 = '' AND @IDTipoDealer like '%4%'
		BEGIN
			SET @WhereCondictions4 = ' WHERE '
		END
		ELSE IF @IDTipoDealer like '%4%'
		BEGIN
			SET @WhereCondictions4 = @WhereCondictions4 + ' AND '
		END
		IF @WhereCondictions5 = '' AND @IDTipoDealer like '%5%'
		BEGIN
			SET @WhereCondictions5 = ' WHERE '
		END
		ELSE IF @IDTipoDealer like '%5%'
		BEGIN
			SET @WhereCondictions5 = @WhereCondictions5 + ' AND '
		END
		
		IF @type like 'text'
		BEGIN
			IF @IDTipoDealer like '%1%'
			BEGIN
				SET @WhereCondictions1 = @WhereCondictions1 + @ID + ' LIKE ''%' + @value + '%'' '
			END
			IF @IDTipoDealer like '%2%'
			BEGIN
				SET @WhereCondictions2 = @WhereCondictions2 + @ID + ' LIKE ''%' + @value + '%'' '
			END
			IF @IDTipoDealer like '%3%'
			BEGIN
				SET @WhereCondictions3 = @WhereCondictions3 + @ID + ' LIKE ''%' + @value + '%'' '
			END
			IF @IDTipoDealer like '%4%'
			BEGIN
				SET @WhereCondictions4 = @WhereCondictions4 + @ID + ' LIKE ''%' + @value + '%'' '
			END
			IF @IDTipoDealer like '%5%'
			BEGIN
				SET @WhereCondictions5 = @WhereCondictions5 + @ID + ' LIKE ''%' + @value + '%'' '
			END
		END
		IF @type like 'combo'
		BEGIN
			IF @IDTipoDealer like '%1%'
			BEGIN
				SET @WhereCondictions1 = @WhereCondictions1 + @ID + ' IN (' + @value + ') '
			END
			IF @IDTipoDealer like '%2%'
			BEGIN
				SET @WhereCondictions2 = @WhereCondictions2 + @ID + ' IN (' + @value + ') '
			END
			IF @IDTipoDealer like '%3%'
			BEGIN
				SET @WhereCondictions3 = @WhereCondictions3 + @ID + ' IN (' + @value + ') '
			END
			IF @IDTipoDealer like '%4%'
			BEGIN
				SET @WhereCondictions4 = @WhereCondictions4 + @ID + ' IN (' + @value + ') '
			END
			IF @IDTipoDealer like '%5%'
			BEGIN
				SET @WhereCondictions5 = @WhereCondictions5 + @ID + ' IN (' + @value + ') '
			END
		END
		IF @type like 'check'
		BEGIN
			IF @IDTipoDealer like '%1%'
			BEGIN
				SET @WhereCondictions1 = @WhereCondictions1 + @ID + ' = ' + @value + ' '
			END
			IF @IDTipoDealer like '%2%'
			BEGIN
				SET @WhereCondictions2 = @WhereCondictions2 + @ID + ' = ' + @value + ' '
			END
			IF @IDTipoDealer like '%3%'
			BEGIN
				SET @WhereCondictions3 = @WhereCondictions3 + @ID + ' = ' + @value + ' '
			END
			IF @IDTipoDealer like '%4%'
			BEGIN
				SET @WhereCondictions4 = @WhereCondictions4 + @ID + ' = ' + @value + ' '
			END
			IF @IDTipoDealer like '%5%'
			BEGIN
				SET @WhereCondictions5 = @WhereCondictions5 + @ID + ' = ' + @value + ' '
			END
		END
		IF @type like 'date'
		BEGIN
			IF @IDTipoDealer like '%1%'
			BEGIN
				SET @WhereCondictions1 = @WhereCondictions1 + ' CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) = CONVERT(date, ''' + @value + ''') '
			END
			IF @IDTipoDealer like '%2%'
			BEGIN
				SET @WhereCondictions2 = @WhereCondictions2 + ' CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) = CONVERT(date, ''' + @value + ''') '
			END
			IF @IDTipoDealer like '%3%'
			BEGIN
				SET @WhereCondictions3 = @WhereCondictions3 + ' CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) = CONVERT(date, ''' + @value + ''') '
			END
			IF @IDTipoDealer like '%4%'
			BEGIN
				SET @WhereCondictions4 = @WhereCondictions4 + ' CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) = CONVERT(date, ''' + @value + ''') '
			END
			IF @IDTipoDealer like '%5%'
			BEGIN
				SET @WhereCondictions5 = @WhereCondictions5 + ' CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) = CONVERT(date, ''' + @value + ''') '
			END
		END
		IF @type like 'dateperiod'
		BEGIN
			IF @value2 IS NOT NULL OR @value2 <> ''
			BEGIN
				IF @IDTipoDealer like '%1%'
				BEGIN
					SET @WhereCondictions1 = @WhereCondictions1 + ' (CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) >= CONVERT(date, ''' + @value + ''') '
					SET @WhereCondictions1 = @WhereCondictions1 + ' AND CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) <= CONVERT(date, ''' + @value2 + ''')) '
				END
				IF @IDTipoDealer like '%2%'
				BEGIN
					SET @WhereCondictions2 = @WhereCondictions2 + ' (CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) >= CONVERT(date, ''' + @value + ''') '
					SET @WhereCondictions2 = @WhereCondictions2 + ' AND CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) <= CONVERT(date, ''' + @value2 + ''')) '
				END
				IF @IDTipoDealer like '%3%'
				BEGIN
					SET @WhereCondictions3 = @WhereCondictions3 + ' (CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) >= CONVERT(date, ''' + @value + ''') '
					SET @WhereCondictions3 = @WhereCondictions3 + ' AND CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) <= CONVERT(date, ''' + @value2 + ''')) '
				END
				IF @IDTipoDealer like '%4%'
				BEGIN
					SET @WhereCondictions4 = @WhereCondictions4 + ' (CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) >= CONVERT(date, ''' + @value + ''') '
					SET @WhereCondictions4 = @WhereCondictions4 + ' AND CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) <= CONVERT(date, ''' + @value2 + ''')) '
				END
				IF @IDTipoDealer like '%5%'
				BEGIN
					SET @WhereCondictions5 = @WhereCondictions5 + ' (CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) >= CONVERT(date, ''' + @value + ''') '
					SET @WhereCondictions5 = @WhereCondictions5 + ' AND CONVERT(date, CONVERT(varchar(10), ' + @ID + ', 102)) <= CONVERT(date, ''' + @value2 + ''')) '
				END
			END
		END
		IF @type like 'schedule'
		BEGIN
			;WITH wcteChild AS (
				   SELECT x.header.value('@id','nvarchar(50)') id,
						   x.header.value('@value','nvarchar(MAX)') value,
						   x.header.value('@value2','nvarchar(MAX)') value2,
						   x.header.value('@typeDb','nvarchar(50)') typeDb
			from @vXML.nodes('/XML/FIELD/FIELDCHILD') as x(header)
			) 
			SELECT  * 
			INTO #WhereTableChild
			FROM wcteChild

			DECLARE CursorWhereTableChild CURSOR FOR SELECT typeDb FROM #WhereTableChild
			DECLARE @typeDbChild nvarchar(50)

			OPEN CursorWhereTableChild
			FETCH NEXT FROM CursorWhereTableChild into @typeDbChild
			WHILE @@FETCH_STATUS = 0
			BEGIN
				
				DECLARE @valueChild NVARCHAR(MAX)
				DECLARE @value2Child NVARCHAR(MAX)
				DECLARE @typeChild NVARCHAR(50) 
				SET @valueChild = (SELECT value FROM #WhereTableChild where typeDb=@typeDbChild)
				SET @value2Child = (SELECT value2 FROM #WhereTableChild where typeDb=@typeDbChild)
				SET @typeChild = (SELECT typeDb FROM #WhereTableChild where typeDb=@typeDbChild)

				IF @WhereCondictions1 <> ' WHERE ' AND @WhereCondictions1 NOT LIKE '% AND ' AND @IDTipoDealer like '%1%'
				BEGIN
					SET @WhereCondictions1 = @WhereCondictions1 + ' AND '
				END
				IF @WhereCondictions2 <> ' WHERE ' AND @WhereCondictions2 NOT LIKE '% AND ' AND @IDTipoDealer like '%2%'
				BEGIN
					SET @WhereCondictions2 = @WhereCondictions2 +  ' AND '
				END
				IF @WhereCondictions3 <> ' WHERE ' AND @WhereCondictions3 NOT LIKE '% AND ' AND @IDTipoDealer like '%3%'
				BEGIN
					SET @WhereCondictions3 = @WhereCondictions3 +  ' AND '
				END
				IF @WhereCondictions4 <> ' WHERE ' AND @WhereCondictions4 NOT LIKE '% AND ' AND @IDTipoDealer like '%4%'
				BEGIN
					SET @WhereCondictions4 = @WhereCondictions4 +  ' AND '
				END
				IF @WhereCondictions5 <> ' WHERE ' AND @WhereCondictions5 NOT LIKE '% AND ' AND @IDTipoDealer like '%5%'
				BEGIN
					SET @WhereCondictions5 = @WhereCondictions5 +  ' AND '
				END
				
				IF @typeChild like 'mattino'
				BEGIN
					IF @value2Child IS NOT NULL OR @value2Child <> ''
					BEGIN
						IF @IDTipoDealer like '%1%'
						BEGIN
							SET @WhereCondictions1 = @WhereCondictions1 + ' CONVERT(time(0), OrarioDiApertura.DalleMattina, 108) <= CONVERT(time(0), ' 
								+ @valueChild + ', 108) AND CONVERT(time(0), OrarioDiApertura.AlleMattina, 108) >= CONVERT(time(0), ' 
								+ @value2Child + ', 108) '
						END
						IF @IDTipoDealer like '%2%'
						BEGIN
							SET @WhereCondictions2 = @WhereCondictions2 + ' CONVERT(time(0), OrarioDiApertura.DalleMattina, 108) <= CONVERT(time(0), ' 
								+ @valueChild + ', 108) AND CONVERT(time(0), OrarioDiApertura.AlleMattina, 108) >= CONVERT(time(0), ' 
								+ @value2Child + ', 108) '
						END
						IF @IDTipoDealer like '%3%'
						BEGIN
							SET @WhereCondictions3 = @WhereCondictions3 + ' CONVERT(time(0), OrarioDiApertura.DalleMattina, 108) <= CONVERT(time(0), ' 
								+ @valueChild + ', 108) AND CONVERT(time(0), OrarioDiApertura.AlleMattina, 108) >= CONVERT(time(0), ' 
								+ @value2Child + ', 108) '
						END
						IF @IDTipoDealer like '%4%'
						BEGIN
							SET @WhereCondictions4 = @WhereCondictions4 + ' CONVERT(time(0), OrarioDiApertura.DalleMattina, 108) <= CONVERT(time(0), ' 
								+ @valueChild + ', 108) AND CONVERT(time(0), OrarioDiApertura.AlleMattina, 108) >= CONVERT(time(0), ' 
								+ @value2Child + ', 108) '
						END
						IF @IDTipoDealer like '%5%'
						BEGIN
							SET @WhereCondictions5 = @WhereCondictions5 + ' CONVERT(time(0), OrarioDiApertura.DalleMattina, 108) <= CONVERT(time(0), ' 
								+ @valueChild + ', 108) AND CONVERT(time(0), OrarioDiApertura.AlleMattina, 108) >= CONVERT(time(0), ' 
								+ @value2Child + ', 108) '
						END
					END
				END
				IF @typeChild like 'pomeriggio'
				BEGIN
					IF @value2Child IS NOT NULL OR @value2Child <> ''
					BEGIN
						IF @IDTipoDealer like '%1%'
						BEGIN
							SET @WhereCondictions1 = @WhereCondictions1 + ' CONVERT(time(0), OrarioDiApertura.DallePomeriggio, 108) <= CONVERT(time(0), ' 
								+ @valueChild + ', 108) AND CONVERT(time(0), OrarioDiApertura.AllePomeriggio, 108) >= CONVERT(time(0), ' 
								+ @value2Child + ', 108) '
						END
						IF @IDTipoDealer like '%2%'
						BEGIN
							SET @WhereCondictions2 = @WhereCondictions2 + ' CONVERT(time(0), OrarioDiApertura.DallePomeriggio, 108) <= CONVERT(time(0), ' 
								+ @valueChild + ', 108) AND CONVERT(time(0), OrarioDiApertura.AllePomeriggio, 108) >= CONVERT(time(0), ' 
								+ @value2Child + ', 108) '
						END
						IF @IDTipoDealer like '%3%'
						BEGIN
							SET @WhereCondictions3 = @WhereCondictions3 + ' CONVERT(time(0), OrarioDiApertura.DallePomeriggio, 108) <= CONVERT(time(0), ' 
								+ @valueChild + ', 108) AND CONVERT(time(0), OrarioDiApertura.AllePomeriggio, 108) >= CONVERT(time(0), ' 
								+ @value2Child + ', 108) '
						END
						IF @IDTipoDealer like '%4%'
						BEGIN
							SET @WhereCondictions4 = @WhereCondictions4 + ' CONVERT(time(0), OrarioDiApertura.DallePomeriggio, 108) <= CONVERT(time(0), ' 
								+ @valueChild + ', 108) AND CONVERT(time(0), OrarioDiApertura.AllePomeriggio, 108) >= CONVERT(time(0), ' 
								+ @value2Child + ', 108) '
						END
						IF @IDTipoDealer like '%5%'
						BEGIN
							SET @WhereCondictions5 = @WhereCondictions5 + ' CONVERT(time(0), OrarioDiApertura.DallePomeriggio, 108) <= CONVERT(time(0), ' 
								+ @valueChild + ', 108) AND CONVERT(time(0), OrarioDiApertura.AllePomeriggio, 108) >= CONVERT(time(0), ' 
								+ @value2Child + ', 108) '
						END
					END
				END
				IF @typeChild like 'Lun' OR @typeChild like 'Mar' OR @type like 'Mer' OR @typeChild like 'Gio' OR @typeChild like 'Ven' OR @typeChild like 'Sab' OR @typeChild like 'Dom'
				BEGIN
					IF @IDTipoDealer like '%1%'
					BEGIN
						SET @WhereCondictions1 = @WhereCondictions1 + ' OrarioApertura.' + @typeChild + ' = ' + @valueChild + ' '
					END
					IF @IDTipoDealer like '%2%'
					BEGIN
						SET @WhereCondictions2 = @WhereCondictions2 + ' OrarioApertura.' + @typeChild + ' = ' + @valueChild + ' '
					END
					IF @IDTipoDealer like '%3%'
					BEGIN
						SET @WhereCondictions3 = @WhereCondictions3 + ' OrarioApertura.' + @typeChild + ' = ' + @valueChild + ' '
					END
					IF @IDTipoDealer like '%4%'
					BEGIN
						SET @WhereCondictions4 = @WhereCondictions4 + ' OrarioApertura.' + @typeChild + ' = ' + @valueChild + ' '
					END
					IF @IDTipoDealer like '%5%'
					BEGIN
						SET @WhereCondictions5 = @WhereCondictions5 + ' OrarioApertura.' + @typeChild + ' = ' + @valueChild + ' '
					END
				END


				FETCH NEXT FROM CursorWhereTableChild into @typeDbChild
			END

			CLOSE CursorWhereTableChild
			DEALLOCATE CursorWhereTableChild

			DROP TABLE #WhereTableChild

		END
		IF @type like 'geography'
		BEGIN
			IF @value2 IS NOT NULL OR @value2 <> ''
			BEGIN
				DECLARE @geo NVARCHAR(MAX)
				SET @geo = 'geography::Point(' + @value2 + ', ' + @value + ', 4326)'

				IF @IDTipoDealer like '%1%'
				BEGIN
					SET @WhereCondictions1 = @WhereCondictions1 + ' (geography::Point(Negozio.NegozioPosPod.Longitudine, Negozio.NegozioPosPod.Latitudine , 4326)).STDistance(' + @geo + ') <= ' + @MaxDistance
				END
				IF @IDTipoDealer like '%2%'
				BEGIN
					SET @WhereCondictions2 = @WhereCondictions2 + ' (geography::Point(Negozio.NegozioPosPod.Longitudine, Negozio.NegozioPosPod.Latitudine , 4326)).STDistance(' + @geo + ') <= ' + @MaxDistance
				END
				IF @IDTipoDealer like '%3%'
				BEGIN
					SET @WhereCondictions3 = @WhereCondictions3 + ' (geography::Point(Negozio.NegozioPosPod.Longitudine, Negozio.NegozioPosPod.Latitudine , 4326)).STDistance(' + @geo + ') <= ' + @MaxDistance
				END
				IF @IDTipoDealer like '%4%'
				BEGIN
					SET @WhereCondictions4 = @WhereCondictions4 + ' (geography::Point(Negozio.NegozioPosPod.Longitudine, Negozio.NegozioPosPod.Latitudine , 4326)).STDistance(' + @geo + ') <= ' + @MaxDistance
				END
				IF @IDTipoDealer like '%5%'
				BEGIN
					SET @WhereCondictions5 = @WhereCondictions5 + ' (geography::Point(Negozio.NegozioPosPod.Longitudine, Negozio.NegozioPosPod.Latitudine , 4326)).STDistance(' + @geo + ') <= ' + @MaxDistance
				END

			END
		END

	END
	
	FETCH NEXT FROM CursorWhereTable into @ID
END

CLOSE CursorWhereTable
DEALLOCATE CursorWhereTable

DROP TABLE #WhereTable


;WITH wcte AS (
       SELECT x.header.value('@value','nvarchar(MAX)') value
from @vXML.nodes('/XML/RETURNFIELD') as x(header)
) 
SELECT  * 
INTO #CampiTable
FROM wcte

DECLARE @Campi NVARCHAR(MAX)
SET @Campi = (SELECT value FROM #CampiTable)
IF @Campi = '' OR @Campi IS NULL
BEGIN
	SET @Campi = 'IDDealer,Codice,Canale,RagioneSociale,Stato,Area'
END

IF @WhereCondictions1 IS NULL OR @WhereCondictions1 = ' WHERE '
BEGIN 
	SET @WhereCondictions1 = ''
END
IF @WhereCondictions2 IS NULL OR @WhereCondictions2 = ' WHERE '
BEGIN 
	SET @WhereCondictions2 = ''
END
IF @WhereCondictions3 IS NULL OR @WhereCondictions3 = ' WHERE '
BEGIN 
	SET @WhereCondictions3 = ''
END
IF @WhereCondictions4 IS NULL OR @WhereCondictions4 = ' WHERE '
BEGIN 
	SET @WhereCondictions4 = ''
END
IF @WhereCondictions5 IS NULL OR @WhereCondictions5 = ' WHERE '
BEGIN 
	SET @WhereCondictions5 = ''
END

DECLARE @Query NVARCHAR(MAX)

IF @WhereCondictions1 IS NOT NULL AND @WhereCondictions1 <> ''
BEGIN
	SET @Query = 'SELECT ' + @Campi + ' FROM Dealer.View_Committenti ' + SUBSTRING(@WhereCondictions1,1,LEN(@WhereCondictions1)-4)
END
IF @WhereCondictions2 IS NOT NULL AND @WhereCondictions2 <> ''
BEGIN
	IF @Query IS NOT NULL AND @Query <> ''
	BEGIN
		SET @Query = @Query + ' UNION SELECT ' + @Campi + ' FROM Dealer.View_PosPod ' + SUBSTRING(@WhereCondictions2,1,LEN(@WhereCondictions2)-4) 
	END
	ELSE
	BEGIN
		SET @Query = 'SELECT ' + @Campi + ' FROM Dealer.View_PosPod ' + SUBSTRING(@WhereCondictions2,1,LEN(@WhereCondictions2)-4) 
	END
END
IF @WhereCondictions3 IS NOT NULL AND @WhereCondictions3 <> ''
BEGIN
	IF @Query IS NOT NULL AND @Query <> ''
	BEGIN
		SET @Query = @Query + ' UNION SELECT ' + @Campi + ' FROM Dealer.View_Point ' + SUBSTRING(@WhereCondictions3,1,LEN(@WhereCondictions3)-4) 
	END
	ELSE
	BEGIN
		SET @Query = 'SELECT ' + @Campi + ' FROM Dealer.View_Point ' + SUBSTRING(@WhereCondictions3,1,LEN(@WhereCondictions3)-4)
	END
END
IF @WhereCondictions4 IS NOT NULL AND @WhereCondictions4 <> ''
BEGIN
	IF @Query IS NOT NULL AND @Query <> ''
	BEGIN
		SET @Query = @Query + ' UNION SELECT ' + @Campi + ' FROM Dealer.View_AgentiCommittenti ' + SUBSTRING(@WhereCondictions4,1,LEN(@WhereCondictions4)-4) 
	END
	ELSE
	BEGIN
		SET @Query = 'SELECT ' + @Campi + ' FROM Dealer.View_AgentiCommittenti ' + SUBSTRING(@WhereCondictions4,1,LEN(@WhereCondictions4)-4) 
	END
END
IF @WhereCondictions5 IS NOT NULL AND @WhereCondictions5 <> ''
BEGIN
	IF @Query IS NOT NULL AND @Query <> ''
	BEGIN
		SET @Query = @Query + ' UNION SELECT ' + @Campi + ' FROM Dealer.View_SubAgenti ' + SUBSTRING(@WhereCondictions5,1,LEN(@WhereCondictions5)-4)
	END
	ELSE
	BEGIN
		SET @Query = 'SELECT ' + @Campi + ' FROM Dealer.View_SubAgenti ' + SUBSTRING(@WhereCondictions5,1,LEN(@WhereCondictions5)-4) 
	END
END

--PRINT(@Query)

;WITH wcte AS (
       SELECT x.header.value('@value','nvarchar(MAX)') value
from @vXML.nodes('/XML/EXPORTFIELDS') as x(header)
) 
SELECT  * 
INTO #CampiExport
FROM wcte

DECLARE @CampiExport NVARCHAR(MAX)
SET @CampiExport = (SELECT value FROM #CampiExport)



EXEC(@Query)

DROP TABLE #CampiTable

 

END