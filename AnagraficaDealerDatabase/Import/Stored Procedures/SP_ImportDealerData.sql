CREATE PROCEDURE [Import].[SP_ImportDealerData]
	@IDImportazione INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRANSACTION

		BEGIN TRY 

			EXEC Import.SP_ImportPoint
			EXEC Import.SP_ImportPosPod
			EXEC Import.SP_ImportSubAgenti

			-- Compute Importazioni Stato
			DECLARE @ScartiCount INT = 0
			DECLARE @AnomalieCount INT = 0
			DECLARE @StatoImport INT = 0

			SET @ScartiCount = ( SELECT COUNT(*) FROM Import.Scarti WHERE IDImportazione = @IDImportazione )
			SET @AnomalieCount = ( SELECT COUNT(*) FROM Import.Anomalie WHERE IDImportazione = @IDImportazione )

			IF @ScartiCount = 0 AND @AnomalieCount = 0
				SET @StatoImport = 2

			IF @ScartiCount != 0 AND @AnomalieCount != 0
				SET @StatoImport = 5

			IF @ScartiCount != 0 AND @AnomalieCount = 0
				SET @StatoImport = 3

			IF @ScartiCount = 0 AND @AnomalieCount != 0
				SET @StatoImport = 4

			UPDATE Import.Importazioni
				SET Stato = @StatoImport,
					AnagraficheAggiornate = ( ( SELECT COUNT(*) FROM Import.AgenteCommittente  ) +
											  ( SELECT COUNT(*) FROM Import.Committente ) +
											  ( SELECT COUNT(*) FROM Import.Point ) +
											  ( SELECT COUNT(*) FROM Import.PosPod ) +
											  ( SELECT COUNT(*) FROM Import.SubAgente ) ),
					AnagraficheScartate = @ScartiCount
			WHERE IDImportazione = @IDImportazione

			EXEC Import.SP_ImportPEC
			EXEC Import.SP_ImportDipendenti

			DELETE FROM Import.AgenteCommittente
			DELETE FROM Import.AgentiCommittentiToHide
			DELETE FROM Import.Committente
			DELETE FROM Import.CommittenteToHide
			DELETE FROM Import.Point
			DELETE FROM Import.PointToHide
			DELETE FROM Import.PosPod
			DELETE FROM Import.PosPodToHide
			DELETE FROM Import.SubAgente
			DELETE FROM Import.SubAgenteToHide

			DELETE FROM Import.PEC
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