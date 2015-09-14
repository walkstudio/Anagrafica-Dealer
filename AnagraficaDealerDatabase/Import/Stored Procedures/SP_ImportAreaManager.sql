CREATE PROCEDURE [Import].[SP_ImportAreaManager]
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRANSACTION

		BEGIN TRY

			-- Inseert new AreaManager
			INSERT INTO Utenti.AreaManager ( VKBUR, Nome )
			SELECT VKBUR, BEZEI
			FROM Import.AreaManager
			WHERE UpdateId = 0

			-- Update existing AreaManager
			UPDATE Utenti.AreaManager
			SET Utenti.AreaManager.VKBUR = IAM.VKBUR,
					Utenti.AreaManager.Nome = IAM.BEZEI
			FROM Import.AreaManager IAM
				INNER JOIN Utenti.AreaManager UAM ON IAM.UpdateId = UAM.IDAreaManager

			-- Logically Delete Area Managers
			UPDATE Utenti.AreaManager SET Attivo = 0
			FROM Utenti.AreaManager AM INNER JOIN Import.AreaManagerToHide AMH ON
				AM.IDAreaManager = AMH.IDAreaManager

			DELETE FROM Import.AreaManager
			DELETE FROM Import.AreaManagerToHide

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