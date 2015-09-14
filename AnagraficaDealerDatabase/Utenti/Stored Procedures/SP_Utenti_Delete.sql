-- =============================================
-- Author:		Diego Fronda
-- Create date: 11/05/2015
-- =============================================
CREATE PROCEDURE [Utenti].[SP_Utenti_Delete] @IDUtente int
AS
BEGIN
	
	SET NOCOUNT ON;

    SET XACT_ABORT ON
	BEGIN TRANSACTION
	

	BEGIN
	IF EXISTS (SELECT * FROM Utenti.Utente WHERE Attivo=1 and IDUtente = @IDUtente)
    UPDATE Utenti.Utente SET Attivo = 0	 WHERE IDUtente = @IDUtente
    ELSE
    
	    UPDATE Utenti.Utente
		SET	Attivo = 1	
	    WHERE IDUtente = @IDUtente
	END

			
	COMMIT TRANSACTION

END