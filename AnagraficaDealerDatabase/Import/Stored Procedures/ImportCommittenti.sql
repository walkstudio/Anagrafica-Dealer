CREATE PROCEDURE [Import].[ImportCommittenti] 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ChangeDate DATE
	DECLARE @SystemUserID INT
	DECLARE @IDTipoDealer INT

	DECLARE @DealerIDData TABLE ( IDDealer INT, Codice NVARCHAR(50) )

	SET @ChangeDate = GETDATE()
	SET @SystemUserID = 0
	SET @IDTipoDealer = 1

	-- Insert new Points
	BEGIN TRANSACTION

		BEGIN TRY 
			INSERT INTO Dealer.Dealer ( Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice )
			OUTPUT INSERTED.IDDealer, INSERTED.Codice INTO @DealerIDData
			SELECT C.Indirizzo, C.PIVA, C.Telefono, C.Fax, @ChangeDate, @SystemUserID, @IDTipoDealer, C.IDStato, C.Codice
			FROM Import.Committente C
				LEFT JOIN Dealer.Dealer D ON C.IDDealer = D.IDDealer
			WHERE D.IDDealer IS NULL

			INSERT INTO Dealer.CanaliDealer( IDDealer, IDCanale, IDCondizioniPagamento )
			SELECT DD.IDDealer, C.IDCanale, C.IDCondizioniPagamento
			FROM Import.Committente C
				INNER JOIN @DealerIDData DD ON C.Codice = DD.Codice

			INSERT INTO InfoGenerali.InfoGenerali( IDDealer )
			SELECT DD.IDDealer
			FROM Import.Committente C
				INNER JOIN @DealerIDData DD ON C.Codice = DD.Codice

			INSERT INTO InfoGenerali.InfoCommittenti ( IDDealer, BOL, DataAttivazione, DataDisattivazione )
			SELECT DD.IDDealer, C.BOL, C.DataAttivazione, C.DataDisattivazione
			FROM Import.Committente C
				INNER JOIN @DealerIDData DD ON C.Codice = DD.Codice

			INSERT INTO Vendite.Vendite ( IDDealer, IDArea, CAP, Localita, Nome1, IDProvincia )
			SELECT DD.IDDealer, C.IDArea, C.CAP, C.Localita, C.Nome1, C.IDProvincia
			FROM Import.Committente C
				INNER JOIN @DealerIDData DD ON C.Codice = DD.Codice
		
			INSERT INTO Vendite.VenditeCanali ( IDDealer, IDArea, IDAreaManager, Cliente, FlagCancellazione, IDFunzionario, Funzione, GruppoPrezzi, Magazzino, Nome2, IDRegione )
			SELECT DD.IDDealer, C.IDArea, C.IDAreaManager, C.Cliente, C.FlagCancellazione, C.IDFunzionario, C.Funzione, C.GruppiPrezzi, C.MagazzinoDealer, C.Nome2, c.IDRegione
			FROM Import.Committente C
				INNER JOIN @DealerIDData DD ON C.Codice = DD.Codice
		
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
			SET Dealer.Dealer.Indirizzo = C.Indirizzo,
					Dealer.Dealer.PIVA = C.PIVA,
					Dealer.Dealer.Telefono = C.Telefono,
					Dealer.Dealer.Fax = C.Fax,
					Dealer.Dealer.DataModifica = @ChangeDate,
					Dealer.Dealer.IDUtente = @SystemUserID,
					Dealer.Dealer.IDStato = C.IDStato,
					Dealer.Dealer.Codice = C.Codice
			FROM Import.Committente C
				INNER JOIN Dealer.Dealer D ON C.IDDealer = D.IDDealer

			UPDATE Dealer.CanaliDealer
			SET Dealer.CanaliDealer.IDCanale = C.IDCanale,
					Dealer.CanaliDealer.IDCondizioniPagamento = C.IDCondizioniPagamento
			FROM Import.Committente C
				INNER JOIN Dealer.CanaliDealer CD ON C.IDDealer = CD.IDDealer

			UPDATE InfoGenerali.InfoCommittenti
			SET InfoGenerali.InfoCommittenti.BOL = C.BOL,
					InfoGenerali.InfoCommittenti.DataAttivazione = C.DataAttivazione,
					InfoGenerali.InfoCommittenti.DataDisattivazione = C.DataDisattivazione
			FROM Import.Committente C
				INNER JOIN InfoGenerali.InfoCommittenti IAC ON C.IDDealer = IAC.IDDealer

			UPDATE Vendite.Vendite
			SET Vendite.Vendite.IDArea = C.IDArea,
					Vendite.Vendite.CAP = C.CAP,
					Vendite.Vendite.Localita = C.Localita,
					Vendite.Vendite.Nome1 = C.Nome1,
					Vendite.Vendite.IDProvincia = C.IDProvincia
			FROM Import.Committente C
				INNER JOIN Vendite.Vendite V ON C.IDDealer = V.IDDealer

			UPDATE Vendite.VenditeCanali
			SET Vendite.VenditeCanali.IDArea = C.IDArea,
					Vendite.VenditeCanali.IDAreaManager = C.IDAreaManager,
					Vendite.VenditeCanali.Cliente = C.Cliente,
					Vendite.VenditeCanali.FlagCancellazione = C.FlagCancellazione,
					Vendite.VenditeCanali.IDFunzionario = C.IDFunzionario,
					Vendite.VenditeCanali.Funzione = C.Funzione,
					Vendite.VenditeCanali.GruppoPrezzi = C.GruppiPrezzi,
					Vendite.VenditeCanali.Magazzino = C.MagazzinoDealer,
					Vendite.VenditeCanali.Nome2 = C.Nome2
			FROM Import.Committente C
				INNER JOIN Vendite.VenditeCanali VC ON C.IDDealer = VC.IDDealer

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