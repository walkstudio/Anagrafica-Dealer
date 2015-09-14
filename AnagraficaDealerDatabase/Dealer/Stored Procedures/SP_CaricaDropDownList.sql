-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Dealer].[SP_CaricaDropDownList]
							@NomeDropDownList varchar(50)
							
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF(@NomeDropDownList = 'AreaDiCompetenza')
	BEGIN
		SELECT [IDAreaDiCompetenza] AS ID
		  ,[NomeArea] AS Descrizione
		FROM [AnagraficaDealer].[Area].[AreaDiCompetenza]
		ORDER BY Descrizione
	END
	
	ELSE

	--IF(@NomeDropDownList = 'ClassificazioneMaster')
	--BEGIN
	--	--SELECT [IDOperativita] AS ID
	--	--  ,[Operativita] AS Descrizione
	--	--FROM [AnagraficaDealer].[Area].[Operativita]
	--	--ORDER BY Descrizione
	--END

	--ELSE

	IF(@NomeDropDownList = 'Cluster')
	BEGIN
		SELECT [IDCluster] AS ID
		  ,[Cluster] AS Descrizione
		FROM [AnagraficaDealer].[Negozio].[Cluster]
		ORDER BY Descrizione
	END
				
	ELSE

	--IF(@NomeDropDownList = 'Dimensionamento')
	--BEGIN
	--	--SELECT [IDDimensioneAreaVendita] AS ID
	--	--  ,DimensioneAreaVendita AS Descrizione
	--	--FROM [AnagraficaDealer].[Negozio].[DimensioneAreaVendita]
	--	--ORDER BY Descrizione 
	--END

	--ELSE

	IF(@NomeDropDownList = 'DimensioneAreaVendita')
	BEGIN
		SELECT [IDDimensioneAreaVendita] AS ID
		  ,DimensioneAreaVendita AS Descrizione
		FROM [AnagraficaDealer].[Negozio].[DimensioneAreaVendita]
		ORDER BY Descrizione 
	END

	ELSE

	--IF(@NomeDropDownList = 'Disdetta')
	--BEGIN
	--	SELECT [IDDimensioneAreaVendita] AS ID
	--	  ,DimensioneAreaVendita AS Descrizione
	--	FROM [AnagraficaDealer].[Negozio].[DimensioneAreaVendita]
	--	ORDER BY Descrizione 
	--END

	--ELSE

	--IF(@NomeDropDownList = 'MaterialeEspositivo')
	--BEGIN
	--	SELECT [IDDimensioneAreaVendita] AS ID
	--	  ,DimensioneAreaVendita AS Descrizione
	--	FROM [AnagraficaDealer].[Negozio].[DimensioneAreaVendita]
	--	ORDER BY Descrizione 
	--END

	--ELSE

	
	IF(@NomeDropDownList = 'ModelloVendita')
	BEGIN
		SELECT [IDModelloVendita] AS ID
		  ,[ModelloVendita] AS Descrizione
		FROM [AnagraficaDealer].[Negozio].[ModelloVendita]
		ORDER BY Descrizione 
	END

	ELSE

	--IF(@NomeDropDownList = 'MonoPluriMandatario')
	--BEGIN
	--	SELECT [IDDimensioneAreaVendita] AS ID
	--	  ,DimensioneAreaVendita AS Descrizione
	--	FROM [AnagraficaDealer].[Negozio].[DimensioneAreaVendita]
	--	ORDER BY Descrizione 
	--END

	--ELSE
	
	IF(@NomeDropDownList = 'Operativita')
	BEGIN
		SELECT [IDOperativita] AS ID
		  ,[Operativita] AS Descrizione
		FROM [AnagraficaDealer].[Area].[Operativita]
		ORDER BY Descrizione
	END

	ELSE
	
	IF(@NomeDropDownList = 'ProvinciaRea')
	BEGIN
		SELECT [IDProvincia] AS ID
		  ,Nome AS Descrizione
		FROM [AnagraficaDealer].[Utility].[Provincia]
		ORDER BY Descrizione 
	END

	ELSE
		
	--IF(@NomeDropDownList = 'SegmentazioneCanale')
	--BEGIN
	--	SELECT [IDProvincia] AS ID
	--	  ,Nome AS Descrizione
	--	FROM [AnagraficaDealer].[Utility].[Provincia]
	--	ORDER BY Descrizione 
	--END

	--ELSE

	IF(@NomeDropDownList = 'Tipologia')
	BEGIN
		SELECT [IDTipologia] AS ID
		  ,[Tipologia] AS Descrizione
		FROM [AnagraficaDealer].[Area].[Tipologia]
		ORDER BY Descrizione
	END

	ELSE
		
	IF(@NomeDropDownList = 'TipologiaArredo')
	BEGIN
		SELECT [IDTipologiaArredo] AS ID
		  ,TipologiaArredo AS Descrizione
		FROM [AnagraficaDealer].[Negozio].[TipologiaArredo]
		ORDER BY Descrizione
	END

	ELSE

	IF(@NomeDropDownList = 'TipoRemunerazione')
	BEGIN
		SELECT [IDTipoRemunerazione] AS ID
		  ,[Tipo Remunerazione] AS Descrizione
		FROM [AnagraficaDealer].[Catene].[TipoRemunerazione]
		ORDER BY Descrizione
	END
	
	--IF(@NomeDropDownList = 'Canale')
	--BEGIN
	--	SELECT [IDCanale] AS ID
	--	  ,[NomeCanale] AS Descrizione
	--	FROM [AnagraficaDealer].[Dealer].[Canale]
	--	ORDER BY Descrizione
	--END

	--ELSE

	--IF(@NomeDropDownList = 'CondizioniPagamento')
	--BEGIN
	--	SELECT [IDCondizioniPagamento] AS ID
	--	  ,[NomeCondizioniPagamento] AS Descrizione
	--	FROM [AnagraficaDealer].[Dealer].[CondizioniPagamento]
	--	ORDER BY Descrizione
	--END

	--ELSE
	
	--IF(@NomeDropDownList = 'OrarioApertura')
	--BEGIN
	--	SELECT [IDOrarioApertura] AS ID
	--	  ,[OrarioApertura] AS Descrizione
	--	FROM [AnagraficaDealer].[Negozio].[OrarioDiApertura]
	--	ORDER BY Descrizione
	--END


END