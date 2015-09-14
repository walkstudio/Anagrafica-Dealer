CREATE PROCEDURE [Import].[SP_ImportAgenti] 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ChangeDate DATE
	DECLARE @SystemUserID INT
	DECLARE @IDTipoDealer INT

	DECLARE @DealerIDData TABLE ( IDDealer INT, Codice NVARCHAR(50) )

	SET @ChangeDate = GETDATE()
	SET @SystemUserID = 0
	SET @IDTipoDealer = 4

	BEGIN TRANSACTION

		BEGIN TRY
			-- Insert new Agenti
			INSERT INTO Dealer.Dealer ( Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz )
			OUTPUT INSERTED.IDDealer, INSERTED.Codice INTO @DealerIDData
			SELECT AC.Indirizzo, AC.PIVA, AC.Telefono, AC.Fax, @ChangeDate, @SystemUserID, @IDTipoDealer, AC.IDStato, AC.Codice, AC.Funzione
			FROM Import.AgenteCommittente AC
				LEFT JOIN Dealer.Dealer D ON AC.IDDealer = D.IDDealer
			WHERE D.IDDealer IS NULL

			INSERT INTO Dealer.CanaliDealer( IDDealer, IDCanale, IDCondizioniPagamento )
			SELECT DD.IDDealer, AC.IDCanale, AC.IDCondizioniPagamento
			FROM Import.AgenteCommittente AC
				INNER JOIN @DealerIDData DD ON AC.Codice = DD.Codice

			INSERT INTO InfoGenerali.InfoGenerali( IDDealer )
			SELECT DD.IDDealer
			FROM Import.AgenteCommittente AC
				INNER JOIN @DealerIDData DD ON AC.Codice = DD.Codice

			INSERT INTO InfoGenerali.InfoAgentiCommittenti ( IDDealer, BOL, DataAperturaCodice, DataChiusuraCodice )
			SELECT DD.IDDealer, AC.BOL, AC.DataAttivazione, AC.DataDisattivazione
			FROM Import.AgenteCommittente AC
				INNER JOIN @DealerIDData DD ON AC.Codice = DD.Codice

			INSERT INTO Vendite.Vendite ( IDDealer, IDArea, CAP, Localita, Nome1, IDProvincia )
			SELECT DD.IDDealer, AC.IDArea, AC.CAP, AC.Localita, AC.Nome1, AC.IDProvincia
			FROM Import.AgenteCommittente AC
				INNER JOIN @DealerIDData DD ON AC.Codice = DD.Codice
		
			INSERT INTO Vendite.VenditeCanali ( IDDealer, IDArea, IDAreaManager, Cliente, FlagCancellazione, IDFunzionario, Funzione, GruppoPrezzi, Magazzino, Nome2, IDRegione )
			SELECT DD.IDDealer, AC.IDArea, AC.IDAreaManager, AC.Cliente, AC.FlagCancellazione, AC.IDFunzionario, AC.Funzione, AC.GruppiPrezzi, AC.MagazzinoDealer, AC.Nome2, AC.IDRegione
			FROM Import.AgenteCommittente AC
				INNER JOIN @DealerIDData DD ON AC.Codice = DD.Codice
		
			-- Update Existing Agenti
			UPDATE Dealer.Dealer
			SET Dealer.Dealer.Indirizzo = AC.Indirizzo,
					Dealer.Dealer.PIVA = AC.PIVA,
					Dealer.Dealer.Telefono = AC.Telefono,
					Dealer.Dealer.Fax = AC.Fax,
					Dealer.Dealer.DataModifica = @ChangeDate,
					Dealer.Dealer.IDUtente = @SystemUserID,
					Dealer.Dealer.IDStato = AC.IDStato,
					Dealer.Dealer.Codice = AC.Codice,
					Dealer.Dealer.Funz = AC.Funzione
			FROM Import.AgenteCommittente AC
				INNER JOIN Dealer.Dealer D ON AC.IDDealer = D.IDDealer

			UPDATE Dealer.CanaliDealer
			SET Dealer.CanaliDealer.IDCanale = AC.IDCanale,
					Dealer.CanaliDealer.IDCondizioniPagamento = AC.IDCondizioniPagamento
			FROM Import.AgenteCommittente AC
				INNER JOIN Dealer.CanaliDealer CD ON AC.IDDealer = CD.IDDealer

			UPDATE InfoGenerali.InfoAgentiCommittenti
			SET InfoGenerali.InfoAgentiCommittenti.BOL = AC.BOL,
					InfoGenerali.InfoAgentiCommittenti.DataAperturaCodice = AC.DataAttivazione,
					InfoGenerali.InfoAgentiCommittenti.DataChiusuraCodice = AC.DataDisattivazione
			FROM Import.AgenteCommittente AC
				INNER JOIN InfoGenerali.InfoAgentiCommittenti IAC ON AC.IDDealer = IAC.IDDealer

			UPDATE Vendite.Vendite
			SET Vendite.Vendite.IDArea = AC.IDArea,
					Vendite.Vendite.CAP = AC.CAP,
					Vendite.Vendite.Localita = AC.Localita,
					Vendite.Vendite.Nome1 = AC.Nome1,
					Vendite.Vendite.IDProvincia = AC.IDProvincia
			FROM Import.AgenteCommittente AC
				INNER JOIN Vendite.Vendite V ON AC.IDDealer = V.IDDealer

			UPDATE Vendite.VenditeCanali
			SET Vendite.VenditeCanali.IDArea = AC.IDArea,
					Vendite.VenditeCanali.IDAreaManager = AC.IDAreaManager,
					Vendite.VenditeCanali.Cliente = AC.Cliente,
					Vendite.VenditeCanali.FlagCancellazione = AC.FlagCancellazione,
					Vendite.VenditeCanali.IDFunzionario = AC.IDFunzionario,
					Vendite.VenditeCanali.Funzione = AC.Funzione,
					Vendite.VenditeCanali.GruppoPrezzi = AC.GruppiPrezzi,
					Vendite.VenditeCanali.Magazzino = AC.MagazzinoDealer,
					Vendite.VenditeCanali.Nome2 = AC.Nome2,
					Vendite.VenditeCanali.IDRegione = AC.IDRegione
			FROM Import.AgenteCommittente AC
				INNER JOIN Vendite.VenditeCanali VC ON AC.IDDealer = VC.IDDealer

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
			-- Logically Delete Agente Committente
			UPDATE Dealer.Dealer SET Attivo = 0
			FROM Dealer.Dealer D INNER JOIN Import.AgentiCommittentiToHide AC ON
				D.IDDealer = AC.IDDealer

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
			DELETE FROM Dealer.CanaliTipoDealer
			WHERE IDTipoDealer = @IDTipoDealer

			-- Update CanaliTipoDealer
			INSERT INTO Dealer.CanaliTipoDealer (IDCanale, IDTipoDealer )
			SELECT A.IDCanale, @IDTipoDealer
			FROM Import.AgenteCommittente A
			GROUP BY A.IDCanale

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