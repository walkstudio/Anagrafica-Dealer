-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Dealer].[SP_Storico_Get]
							@IDDealer int,
							@tipologia varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF(@tipologia = 'Canale')
SELECT IDDealer, 'Cambio Canale' AS Tipologia, Canale AS Variazione, DataFine AS Data  FROM Storico.StoricoCanale WHERE IDDealer = @IDDealer ORDER BY DataFine

IF(@tipologia = 'Codice')
SELECT IDDealer, 'Subentro' AS Tipologia, Codice AS Variazione, DataFine AS Data  FROM Storico.StoricoCodice WHERE IDDealer = @IDDealer ORDER BY DataFine

IF(@tipologia = 'Indirizzo')
SELECT IDDealer, 'Trasloco' AS Tipologia, Indirizzo AS Variazione, DataFine AS Data  FROM Storico.StoricoIndirizzo WHERE IDDealer = @IDDealer ORDER BY DataFine

IF(@tipologia= 'Tutte')
BEGIN
SELECT IDDealer, 'Cambio Canale' AS Tipologia, Canale AS Variazione, DataFine AS Data FROM Storico.StoricoCanale WHERE IDDealer = @IDDealer 
UNION ALL
SELECT IDDealer, 'Subentro' AS Tipologia, Codice AS Variazione, DataFine AS Data FROM Storico.StoricoCodice WHERE IDDealer = @IDDealer 
UNION ALL
SELECT IDDealer, 'Trasloco' AS Tipologia, Indirizzo AS Variazione, DataFine AS Data FROM Storico.StoricoIndirizzo WHERE IDDealer = @IDDealer 
ORDER BY DataFine
END


END