CREATE PROCEDURE [Import].[ImportSubAgenti] 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ChangeDate DATE
	DECLARE @SystemUserID INT
	DECLARE @IDTipoDealer INT

	DECLARE @DealerIDData TABLE ( IDDealer INT, Codice NVARCHAR(50) )

	SET @ChangeDate = GETDATE()
	SET @SystemUserID = 0
	SET @IDTipoDealer = 5

	-- Insert new Points
	BEGIN TRANSACTION

		BEGIN TRY 
			INSERT INTO Dealer.Dealer ( Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice )
			OUTPUT INSERTED.IDDealer, INSERTED.Codice INTO @DealerIDData
			SELECT SA.Indirizzo, SA.PIVA, SA.Telefono, SA.Fax, @ChangeDate, @SystemUserID, @IDTipoDealer, SA.IDStato, SA.Codice
			FROM Import.SubAgente SA
				LEFT JOIN Dealer.Dealer D ON SA.IDDealer = D.IDDealer
			WHERE D.IDDealer IS NULL

			INSERT INTO Dealer.CanaliDealer( IDDealer, IDCanale, IDCondizioniPagamento )
			SELECT DD.IDDealer, SA.IDCanale, SA.IDCondizioniPagamento
			FROM Import.SubAgente SA
				INNER JOIN @DealerIDData DD ON SA.Codice = DD.Codice

			INSERT INTO InfoGenerali.InfoGenerali( IDDealer )
			SELECT DD.IDDealer
			FROM Import.SubAgente SA
				INNER JOIN @DealerIDData DD ON SA.Codice = DD.Codice

			INSERT INTO InfoGenerali.InfoSubAgenti ( IDDealer, BOL, DataAttivazione, DataDisattivazione )
			SELECT DD.IDDealer, SA.BOL, SA.DataAttivazione, SA.DataDisattivazione
			FROM Import.SubAgente SA
				INNER JOIN @DealerIDData DD ON SA.Codice = DD.Codice

			INSERT INTO Vendite.Vendite ( IDDealer, IDArea, CAP, Localita, Nome1, IDProvincia )
			SELECT DD.IDDealer, SA.IDArea, SA.CAP, SA.Localita, SA.Nome1, SA.IDProvincia
			FROM Import.SubAgente SA
				INNER JOIN @DealerIDData DD ON SA.Codice = DD.Codice
		
			INSERT INTO Vendite.VenditeCanali ( IDDealer, IDArea, IDAreaManager, Cliente, FlagCancellazione, IDFunzionario, Funzione, GruppoPrezzi, Magazzino, Nome2 )
			SELECT DD.IDDealer, SA.IDArea, SA.IDAreaManager, SA.Cliente, SA.FlagCancellazione, SA.IDFunzionario, SA.Funzione, SA.GruppiPrezzi, SA.MagazzinoDealer, SA.Nome2
			FROM Import.SubAgente SA
				INNER JOIN @DealerIDData DD ON SA.Codice = DD.Codice
		
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
			UPDATE Dealer.Dealer
			SET Dealer.Dealer.Indirizzo = SA.Indirizzo,
					Dealer.Dealer.PIVA = SA.PIVA,
					Dealer.Dealer.Telefono = SA.Telefono,
					Dealer.Dealer.Fax = SA.Fax,
					Dealer.Dealer.DataModifica = @ChangeDate,
					Dealer.Dealer.IDUtente = @SystemUserID,
					Dealer.Dealer.IDStato = SA.IDStato,
					Dealer.Dealer.Codice = SA.Codice
			FROM Import.SubAgente SA
				INNER JOIN Dealer.Dealer D ON SA.IDDealer = D.IDDealer

			UPDATE Dealer.CanaliDealer
			SET Dealer.CanaliDealer.IDCanale = SA.IDCanale,
					Dealer.CanaliDealer.IDCondizioniPagamento = SA.IDCondizioniPagamento
			FROM Import.SubAgente SA
				INNER JOIN Dealer.CanaliDealer CD ON SA.IDDealer = CD.IDDealer

			UPDATE InfoGenerali.InfoSubAgenti
			SET InfoGenerali.InfoSubAgenti.BOL = SA.BOL,
					InfoGenerali.InfoSubAgenti.DataAttivazione = SA.DataAttivazione,
					InfoGenerali.InfoSubAgenti.DataDisattivazione = SA.DataDisattivazione
			FROM Import.SubAgente SA
				INNER JOIN InfoGenerali.InfoSubAgenti IAC ON SA.IDDealer = IAC.IDDealer

			UPDATE Vendite.Vendite
			SET Vendite.Vendite.IDArea = SA.IDArea,
					Vendite.Vendite.CAP = SA.CAP,
					Vendite.Vendite.Localita = SA.Localita,
					Vendite.Vendite.Nome1 = SA.Nome1,
					Vendite.Vendite.IDProvincia = SA.IDProvincia
			FROM Import.SubAgente SA
				INNER JOIN Vendite.Vendite V ON SA.IDDealer = V.IDDealer

			UPDATE Vendite.VenditeCanali
			SET Vendite.VenditeCanali.IDArea = SA.IDArea,
					Vendite.VenditeCanali.IDAreaManager = SA.IDAreaManager,
					Vendite.VenditeCanali.Cliente = SA.Cliente,
					Vendite.VenditeCanali.FlagCancellazione = SA.FlagCancellazione,
					Vendite.VenditeCanali.IDFunzionario = SA.IDFunzionario,
					Vendite.VenditeCanali.Funzione = SA.Funzione,
					Vendite.VenditeCanali.GruppoPrezzi = SA.GruppiPrezzi,
					Vendite.VenditeCanali.Magazzino = SA.MagazzinoDealer,
					Vendite.VenditeCanali.Nome2 = SA.Nome2
			FROM Import.SubAgente SA
				INNER JOIN Vendite.VenditeCanali VC ON SA.IDDealer = VC.IDDealer

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