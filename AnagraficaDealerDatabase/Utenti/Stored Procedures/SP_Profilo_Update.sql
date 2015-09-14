

-- =============================================
-- Author:		Luca Filieri
-- Create date: 08/05/2015
-- =============================================
CREATE PROCEDURE [Utenti].[SP_Profilo_Update] @IDProfilo int,
									@NomeProfilo nvarchar(50),
									@ArchivioDataBase bit,
									@ArchivioCruscotto bit,
									@ReportAnomalie bit,
									@ReportScarti bit,
									@Amministrazione bit,
									@Portafoglio bit,
									@RagioniSocialiCorrelate int,
									@Eccezioni bit,
									@TipoDealerXml as XML,
									@AutorizzazioneCampiXml as XML
AS
BEGIN

	SET NOCOUNT ON;
	SET XACT_ABORT ON
	BEGIN TRANSACTION

		UPDATE Utenti.Profilo
			SET NomeProfilo = @NomeProfilo,
				ArchivioDataBase = @ArchivioDataBase,
				ArchivioCruscotto = @ArchivioCruscotto,
				ReportAnomalie = @ReportAnomalie,
				ReportScarti = @ReportScarti,
				Amministrazione = @Amministrazione,
				Portafoglio = @Portafoglio,
				RagioniSocialiCorrelate = @RagioniSocialiCorrelate,
				Eccezioni = @Eccezioni 
			WHERE IDProfilo = @IDProfilo
		
	--Aggiorno i TipoDealer a cui può accedere il Profilo	
	DELETE FROM Utenti.Accede
		WHERE IDProfilo = @IDProfilo

	INSERT INTO Utenti.Accede (IDProfilo, IDTipoDealer)
		SELECT DISTINCT @IDProfilo AS IDProfilo, TipoDealerGrid.value('(IDTipoDealer/text())[1]','int') AS IDTipoDealer
			FROM @TipoDealerXml.nodes('/Dealer/TipoDealer') AS TEMPTABLE(TipoDealerGrid)
	
	--Aggiorno le Autorizzazioni sui Campi

	SELECT #AutorizzazioniTempTable.value('(IDAutorizzazioneCampi/text())[1]','int') AS IDAutorizzazioneCampiNew, #AutorizzazioniTempTable.value('(Autorizzazione/text())[1]','int') AS AutorizzazioneNew
	into #AutorizzazioniTempTable
	FROM @AutorizzazioneCampiXml.nodes('/Autorizzazioni/AutorizzazioneCampi') AS TEMPTABLE(#AutorizzazioniTempTable)		
				   
	UPDATE Utenti.AutorizzazioneCampi 
	SET Autorizzazione = t1.AutorizzazioneNew
	FROM Utenti.AutorizzazioneCampi  t2
	INNER JOIN #AutorizzazioniTempTable t1 on t1.IDAutorizzazioneCampiNew  = t2.IDAutorizzazioneCampi

	DROP TABLE #AutorizzazioniTempTable

	COMMIT TRANSACTION

END