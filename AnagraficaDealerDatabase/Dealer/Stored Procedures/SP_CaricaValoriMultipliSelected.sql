-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Dealer].[SP_CaricaValoriMultipliSelected] @IDDealer int, @NomeCampo varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF(@NomeCampo = 'ModelloVendita')
	BEGIN
		SELECT [Negozio].[ModelloVendita].[IDModelloVendita] AS ID
		  ,[ModelloVendita] AS Descrizione 
		FROM [AnagraficaDealer].[Negozio].[ModelloVendita] INNER JOIN [Negozio].[UsaModelloVendita] ON [Negozio].[ModelloVendita].[IDModelloVendita] = [Negozio].[UsaModelloVendita].[IDModelloVendita]
		WHERE [Negozio].[UsaModelloVendita].[IDDealer] = @IDDealer
		ORDER BY Descrizione
	END

	ELSE

	IF(@NomeCampo = 'GestoreCondiviso')
	BEGIN
		SELECT [Negozio].[GestoreCondiviso].[IDGestoreCondiviso] AS ID
		  ,[GestoreCondiviso] AS Descrizione 
		FROM [AnagraficaDealer].[Negozio].[GestoreCondiviso] INNER JOIN [Negozio].[UsaGestoreCondiviso] ON [Negozio].[GestoreCondiviso].[IDGestoreCondiviso] = [Negozio].[UsaGestoreCondiviso].[IDGestoreCondiviso]
		WHERE [Negozio].[UsaGestoreCondiviso].[IDDealer] = @IDDealer
		ORDER BY Descrizione
	END

END