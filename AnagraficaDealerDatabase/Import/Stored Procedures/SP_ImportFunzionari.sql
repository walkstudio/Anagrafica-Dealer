CREATE PROCEDURE [Import].[SP_ImportFunzionari]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION

		BEGIN TRY

			-- Insert New Funzionario
			INSERT INTO Utenti.Funzionario ( AGL, Nome )
			SELECT AgL, Nome
			FROM Import.Funzionario
			WHERE UpdateID = 0

			-- Update existing Funzionario
			UPDATE Utenti.Funzionario
			SET Utenti.Funzionario.AGL = F.AgL,
					Utenti.Funzionario.Nome = F.Nome
			FROM Import.Funzionario F
				INNER JOIN Utenti.Funzionario UF ON F.UpdateID = UF.IDFunzionario

			-- Logically Delete Funzionario
			UPDATE Utenti.Funzionario SET Attivo = 0
			FROM Utenti.Funzionario F INNER JOIN Import.FunzionarioToHide FH ON 
				F.IDFunzionario = FH.IDFunzionario

			DELETE FROM Import.Funzionario
			DELETE FROM Import.FunzionarioToHide

		END TRY
		BEGIN CATCH
			SELECT 
				ERROR_NUMBER() AS ErrorNumber
				,ERROR_SEVERITY() AS ErrorSeverity
				,ERROR_STATE() AS ErrorState
				,ERROR_PROCEDURE() AS ErrorProcedure
				,ERROR_LINE() AS ErrorLine
				,ERROR_MESSAGE() AS ErrorMessage;

			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION
		END CATCH

		IF @@TRANCOUNT > 0
			COMMIT TRANSACTION
END