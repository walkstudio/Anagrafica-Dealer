CREATE PROCEDURE [Import].[SP_ImportPosPod] 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ChangeDate DATE
	DECLARE @SystemUserID INT
	DECLARE @IDTipoDealer INT

	DECLARE @DealerIDData TABLE ( IDDealer INT, Codice NVARCHAR(50) )

	SET @ChangeDate = GETDATE()
	SET @SystemUserID = 0
	SET @IDTipoDealer = 2

	-- Insert new Points
	BEGIN TRANSACTION

		BEGIN TRY 
			INSERT INTO Dealer.Dealer ( Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz )
			OUTPUT INSERTED.IDDealer, INSERTED.Codice INTO @DealerIDData
			SELECT PP.Indirizzo, PP.PIVA, PP.Telefono, PP.Fax, @ChangeDate, @SystemUserID, @IDTipoDealer, PP.IDStato, PP.Codice, PP.Funzione
			FROM Import.PosPod PP
				LEFT JOIN Dealer.Dealer D ON PP.IDDealer = D.IDDealer
			WHERE D.IDDealer IS NULL

			INSERT INTO Dealer.CanaliDealer( IDDealer, IDCanale, IDCondizioniPagamento )
			SELECT DD.IDDealer, PP.IDCanale, PP.IDCondizioniPagamento
			FROM Import.PosPod PP
				INNER JOIN @DealerIDData DD ON PP.Codice = DD.Codice

			INSERT INTO InfoGenerali.InfoGenerali( IDDealer )
			SELECT DD.IDDealer
			FROM Import.PosPod PP
				INNER JOIN @DealerIDData DD ON PP.Codice = DD.Codice

			INSERT INTO InfoGenerali.InfoPosEPod( IDDealer, BOL, DataAperturaCodice, DataChiusuraCodice )
			SELECT DD.IDDealer, PP.BOL, PP.DataAttivazione, PP.DataDisattivazione
			FROM Import.PosPod PP
				INNER JOIN @DealerIDData DD ON PP.Codice = DD.Codice

			INSERT INTO Vendite.Vendite ( IDDealer, IDArea, CAP, Localita, Nome1, IDProvincia )
			SELECT DD.IDDealer, PP.IDArea, PP.CAP, PP.Localita, PP.Nome1, PP.IDProvincia
			FROM Import.PosPod PP
				INNER JOIN @DealerIDData DD ON PP.Codice = DD.Codice
		
			INSERT INTO Vendite.VenditeCanali ( IDDealer, IDArea, IDAreaManager, Cliente, FlagCancellazione, IDFunzionario, Funzione, GruppoPrezzi, Magazzino, Nome2, IDRegione )
			SELECT DD.IDDealer, PP.IDArea, PP.IDAreaManager, PP.Cliente, PP.FlagCancellazione, PP.IDFunzionario, PP.Funzione, PP.GruppiPrezzi, PP.MagazzinoDealer, PP.Nome2, PP.IDRegione
			FROM Import.PosPod PP
				INNER JOIN @DealerIDData DD ON PP.Codice = DD.Codice
		
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
			SET Dealer.Dealer.Indirizzo = PP.Indirizzo,
					Dealer.Dealer.PIVA = PP.PIVA,
					Dealer.Dealer.Telefono = PP.Telefono,
					Dealer.Dealer.Fax = PP.Fax,
					Dealer.Dealer.DataModifica = @ChangeDate,
					Dealer.Dealer.IDUtente = @SystemUserID,
					Dealer.Dealer.IDStato = PP.IDStato,
					Dealer.Dealer.Codice = PP.Codice,
					Dealer.Dealer.Funz = PP.Funzione
			FROM Import.PosPod PP
				INNER JOIN Dealer.Dealer D ON PP.IDDealer = D.IDDealer

			UPDATE Dealer.CanaliDealer
			SET Dealer.CanaliDealer.IDCanale = PP.IDCanale,
					Dealer.CanaliDealer.IDCondizioniPagamento = PP.IDCondizioniPagamento
			FROM Import.PosPod PP
				INNER JOIN Dealer.CanaliDealer CD ON PP.IDDealer = CD.IDDealer

			UPDATE InfoGenerali.InfoPosEPod
			SET InfoGenerali.InfoPosEPod.BOL = PP.BOL,
					InfoGenerali.InfoPosEPod.DataAperturaCodice = PP.DataAttivazione,
					InfoGenerali.InfoPosEPod.DataChiusuraCodice = PP.DataDisattivazione
			FROM Import.PosPod PP
				INNER JOIN InfoGenerali.InfoCommittenti IAC ON PP.IDDealer = IAC.IDDealer

			UPDATE Vendite.Vendite
			SET Vendite.Vendite.IDArea = PP.IDArea,
					Vendite.Vendite.CAP = PP.CAP,
					Vendite.Vendite.Localita = PP.Localita,
					Vendite.Vendite.Nome1 = PP.Nome1,
					Vendite.Vendite.IDProvincia = PP.IDProvincia
			FROM Import.PosPod PP
				INNER JOIN Vendite.Vendite V ON PP.IDDealer = V.IDDealer

			UPDATE Vendite.VenditeCanali
			SET Vendite.VenditeCanali.IDArea = PP.IDArea,
					Vendite.VenditeCanali.IDAreaManager = PP.IDAreaManager,
					Vendite.VenditeCanali.Cliente = PP.Cliente,
					Vendite.VenditeCanali.FlagCancellazione = PP.FlagCancellazione,
					Vendite.VenditeCanali.IDFunzionario = PP.IDFunzionario,
					Vendite.VenditeCanali.Funzione = PP.Funzione,
					Vendite.VenditeCanali.GruppoPrezzi = PP.GruppiPrezzi,
					Vendite.VenditeCanali.Magazzino = PP.MagazzinoDealer,
					Vendite.VenditeCanali.Nome2 = PP.Nome2
			FROM Import.PosPod PP
				INNER JOIN Vendite.VenditeCanali VC ON PP.IDDealer = VC.IDDealer

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