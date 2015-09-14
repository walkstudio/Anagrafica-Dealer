-- =============================================
-- Author:		Diego Fronda
-- Create date: 13/05/2015
-- =============================================

CREATE PROCEDURE [Import].[SP_EccezioniImport_Insert] @Codice nvarchar(50)
AS
	BEGIN
	SET XACT_ABORT ON 
	BEGIN TRANSACTION
	SET NOCOUNT ON;

			BEGIN
				INSERT INTO Import.EccezioniImport (Codice) VALUES
           (@Codice)
                --SELECT IDDealer FROM Dealer.Dealer(nolock) WHERE @Codice = Codice
			END

	COMMIT TRANSACTION


END