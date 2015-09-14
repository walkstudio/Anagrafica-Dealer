-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Dealer].[SP_CaricaValoriMultipli]
							@NomeCampo varchar(50)
							
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF(@NomeCampo = 'AreaDiCompetenza')
	BEGIN
		SELECT [IDAreaDiCompetenza] AS ID
		  ,[NomeArea] AS Descrizione
		FROM [AnagraficaDealer].[Area].[AreaDiCompetenza] WHERE [Attivo] = 1
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

	IF(@NomeCampo = 'Cluster')
	BEGIN
		SELECT [IDCluster] AS ID
		  ,[Cluster] AS Descrizione
		FROM [AnagraficaDealer].[Negozio].[Cluster] WHERE [Attivo] = 1
		ORDER BY Descrizione
	END
				
	ELSE

	IF(@NomeCampo = 'Dimensionamento')
	BEGIN
		SELECT [IDDimensionamento] AS ID
		  ,Dimensionamento AS Descrizione
		FROM [AnagraficaDealer].[DettaglioAgenti].[Dimensionamento] WHERE [Attivo] = 1
		ORDER BY Descrizione 
	END

	ELSE

	IF(@NomeCampo = 'DimensioneAreaVendita')
	BEGIN
		SELECT [IDDimensioneAreaVendita] AS ID
		  ,DimensioneAreaVendita AS Descrizione
		FROM [AnagraficaDealer].[Negozio].[DimensioneAreaVendita] WHERE [Attivo] = 1
		ORDER BY Descrizione 
	END

	ELSE

	IF(@NomeCampo = 'Richiedente')
	BEGIN
		SELECT [IDRichiedente] AS ID
		  ,Richiedente AS Descrizione
		FROM [AnagraficaDealer].[Disdetta].[Richiedente] WHERE [Attivo] = 1
		ORDER BY Descrizione 
	END

	ELSE

	IF(@NomeCampo = 'GestoreCondiviso')
	BEGIN
		SELECT [IDGestoreCondiviso] AS ID
		  ,GestoreCondiviso AS Descrizione
		FROM [AnagraficaDealer].[Negozio].[GestoreCondiviso] WHERE [Attivo] = 1
		ORDER BY Descrizione
	END

	ELSE

	IF(@NomeCampo = 'MaterialeEspositivo')
	BEGIN
		SELECT [IDMaterialeEspositivo] AS ID
		  ,MaterialeEspositivo AS Descrizione
		FROM [AnagraficaDealer].[DettaglioAgenti].[MaterialeEspositivo] WHERE [Attivo] = 1
		ORDER BY Descrizione 
	END

	ELSE
		
	IF(@NomeCampo = 'ModelloVendita')
	BEGIN
		SELECT [IDModelloVendita] AS ID
		  ,[ModelloVendita] AS Descrizione 
		FROM [AnagraficaDealer].[Negozio].[ModelloVendita] WHERE [Attivo] = 1
		ORDER BY Descrizione 
	END

	ELSE

	IF(@NomeCampo = 'Operativita')
	BEGIN
		SELECT [IDOperativita] AS ID
		  ,[Operativita] AS Descrizione
		FROM [AnagraficaDealer].[Area].[Operativita] WHERE [Attivo] = 1
		ORDER BY Descrizione
	END

	ELSE
	
	IF(@NomeCampo = 'ProvRea')
	BEGIN
		SELECT [IDProvincia] AS ID
		  ,Nome AS Descrizione
		FROM [AnagraficaDealer].[Utility].[Provincia] 
		ORDER BY Descrizione 
	END

	ELSE
		
	IF(@NomeCampo = 'SegmentazioneCanale')
	BEGIN
		SELECT [IDSegmentazioneCanale] AS ID
		  ,SegmentazioneCanale AS Descrizione
		FROM [AnagraficaDealer].[Area].[SegmentazioneCanale] WHERE [Attivo] = 1
		ORDER BY Descrizione 
	END

	ELSE

	IF(@NomeCampo = 'Tipologia')
	BEGIN
		SELECT [IDTipologia] AS ID
		  ,[Tipologia] AS Descrizione
		FROM [AnagraficaDealer].[Area].[Tipologia] WHERE [Attivo] = 1
		ORDER BY Descrizione
	END

	ELSE
		
	IF(@NomeCampo = 'TipologiaArredo')
	BEGIN
		SELECT [IDTipologiaArredo] AS ID
		  ,TipologiaArredo AS Descrizione
		FROM [AnagraficaDealer].[Negozio].[TipologiaArredo] WHERE [Attivo] = 1
		ORDER BY Descrizione
	END

	ELSE

	IF(@NomeCampo = 'TipoRemunerazione')
	BEGIN
		SELECT [IDTipoRemunerazione] AS ID
		  ,TipoRemunerazione AS Descrizione
		FROM [AnagraficaDealer].[Catene].[TipoRemunerazione] WHERE [Attivo] = 1
		ORDER BY Descrizione
	END
END