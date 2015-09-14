CREATE PROCEDURE [Import].[SP_ImportPoint] 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ChangeDate DATE
	DECLARE @SystemUserID INT
	DECLARE @IDTipoDealer INT

	DECLARE @DealerIDData TABLE ( IDDealer INT, Codice NVARCHAR(50), OmnipointID INT )

	SET @ChangeDate = GETDATE()
	SET @SystemUserID = 0
	SET @IDTipoDealer = 3

	-- Insert new Points
	BEGIN TRANSACTION

		BEGIN TRY 
			INSERT INTO Dealer.Dealer ( Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz, OmnipointID )
			OUTPUT INSERTED.IDDealer, INSERTED.Codice, INSERTED.OmnipointID INTO @DealerIDData
			SELECT P.Indirizzo, P.PartitaIVA, P.Telefono, P.Fax, @ChangeDate, @SystemUserID, @IDTipoDealer, P.IDStato, P.Codice, 'XX', P.OmnipointID
			FROM Import.Point P
				LEFT JOIN Dealer.Dealer D ON P.IDDealer = D.IDDealer AND
					P.OmnipointID = D.OmnipointID
			WHERE D.IDDealer IS NULL

			INSERT INTO Vendite.Vendite ( IDDealer, IDArea, CAP, Localita, Nome1, IDProvincia )
			SELECT DD.IDDealer, P.IDArea, P.CAP, P.Localita, P.Nome1, P.IDProvincia
			FROM Import.Point P
				INNER JOIN @DealerIDData DD ON P.Codice = DD.Codice AND
					P.OmnipointID = DD.OmnipointID
		
			INSERT INTO Vendite.VenditePoint ( IDDealer, Data, IDRegione )
			SELECT DD.IDDealer, P.DataAttivazione, P.IDRegione
			FROM Import.Point P
				INNER JOIN @DealerIDData DD ON P.Codice = DD.Codice AND
					P.OmnipointID = DD.OmnipointID

			INSERT INTO InfoGenerali.InfoGenerali( IDDealer )
			SELECT DD.IDDealer
			FROM Import.Point P
				INNER JOIN @DealerIDData DD ON P.Codice = DD.Codice AND
					P.OmnipointID = DD.OmnipointID

			INSERT INTO InfoGenerali.InfoPoint ( IDDealer, IDMasterDealer )
			SELECT DD.IDDealer, P.IDMasterDealer
			FROM Import.Point P
				INNER JOIN @DealerIDData DD ON P.Codice = DD.Codice AND
					P.OmnipointID = DD.OmnipointID
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

	BEGIN TRANSACTION

		BEGIN TRY
			-- Update Existing Points
			UPDATE Dealer.Dealer
			SET Dealer.Dealer.Indirizzo = P.Indirizzo,
					Dealer.Dealer.PIVA = P.PartitaIVA,
					Dealer.Dealer.Telefono = P.Telefono,
					Dealer.Dealer.Fax = P.Fax,
					Dealer.Dealer.DataModifica = @ChangeDate,
					Dealer.Dealer.IDUtente = @SystemUserID,
					Dealer.Dealer.IDStato = P.IDStato,
					Dealer.Dealer.Codice = P.Codice
			FROM Import.Point P
				INNER JOIN Dealer.Dealer D ON P.IDDealer = D.IDDealer AND
					P.OmnipointID = D.OmnipointID

			UPDATE Vendite.Vendite
			SET Vendite.Vendite.IDArea = P.IDArea,
					Vendite.Vendite.CAP = P.CAP,
					Vendite.Vendite.Localita = P.Localita,
					Vendite.Vendite.Nome1 = P.Nome1,
					Vendite.Vendite.IDProvincia = P.IDProvincia
			FROM Import.Point P
				INNER JOIN Vendite.Vendite V ON P.IDDealer = V.IDDealer
				INNER JOIN Dealer.Dealer D ON P.IDDealer = D.IDDealer AND
					P.OmnipointID = D.OmnipointID

			UPDATE Vendite.VenditePoint
			SET Vendite.VenditePoint.Data = P.DataAttivazione,
					Vendite.VenditePoint.IDRegione = P.IDRegione
			FROM Import.Point P
				INNER JOIN Vendite.Vendite VP ON P.IDDealer = VP.IDDealer
				INNER JOIN Dealer.Dealer D ON P.IDDealer = D.IDDealer AND
					P.OmnipointID = D.OmnipointID

			UPDATE InfoGenerali.InfoPoint
			SET InfoGenerali.InfoPoint.IDMasterDealer = P.IDMasterDealer
			FROM Import.Point P
				INNER JOIN InfoGenerali.InfoPoint IP ON P.IDDealer = IP.IDDealer
				INNER JOIN Dealer.Dealer D ON P.IDDealer = D.IDDealer AND
					P.OmnipointID = D.OmnipointID

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