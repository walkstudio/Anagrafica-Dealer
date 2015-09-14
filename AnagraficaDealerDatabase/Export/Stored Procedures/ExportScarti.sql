
-- =============================================
-- Author:		Gabriele Oberti
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Export].[ExportScarti] @IDImportazione int
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	
	SELECT CodiceDealer AS [Codice],
			TD.NomeTipoDealer AS [Tipo dealer],
			Errori AS Errori,
			I.DataImportazione
			FROM Import.Scarti S (nolock) INNER JOIN Dealer.TipoDealer TD (nolock) 
						ON S.IDTipoDealer = TD.IDTipoDealer
						INNER JOIN Import.Importazioni I ON S.IDImportazione = I.IDImportazione
	WHERE I.IDImportazione = @IDImportazione
	Order by Codice desc
	

	
END