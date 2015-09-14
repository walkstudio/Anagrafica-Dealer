

-- =============================================
-- Author:		Luca Filieri
-- Create date: 12/05/2015
-- =============================================
CREATE PROCEDURE [Utenti].[SP_Profilo_Delete] @IDProfilo int
AS
BEGIN
	
	SET NOCOUNT ON;

    SET XACT_ABORT ON
	BEGIN TRANSACTION

	DECLARE @inserted_ids TABLE ([id] INT);

	IF((SELECT COUNT(*) FROM Utenti.Utente WHERE IDProfilo = @IDProfilo) = 0)
		BEGIN

			INSERT INTO @inserted_ids
				SELECT IDAutorizzazioneCampi
					FROM Utenti.Usa WHERE IDProfilo = @IDProfilo;

			DELETE FROM Utenti.Usa WHERE IDProfilo = @IDProfilo;
			DELETE FROM Utenti.AutorizzazioneCampi WHERE IDAutorizzazioneCampi IN (SELECT id FROM @inserted_ids);

			DELETE FROM Utenti.Accede WHERE IDProfilo = @IDProfilo
			DELETE FROM Utenti.Profilo WHERE IDProfilo = @IDProfilo
					
			END
		ELSE
			BEGIN
				raiserror('Non è possibile eliminare il profilo perchè utilizzato da altri utenti.' , 16, 1)
			END
			
	COMMIT TRANSACTION

END