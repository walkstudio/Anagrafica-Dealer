
-- =============================================
-- Author:		Luca Filieri
-- Create date: 08/05/2015
-- =============================================
CREATE PROCEDURE [Utenti].[SP_Profilo_Insert] 
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

		DECLARE @IDProfilo int;
		DECLARE @inserted_ids TABLE ([insertedIDAutorizzazioneCampi] INT);

		--Creo il profilo
		INSERT INTO Utenti.Profilo (NomeProfilo,ArchivioDataBase,ArchivioCruscotto,ReportAnomalie,ReportScarti,Amministrazione,Portafoglio,RagioniSocialiCorrelate,Eccezioni)
					VALUES (@NomeProfilo,@ArchivioDataBase,@ArchivioCruscotto,@ReportAnomalie,@ReportScarti,@Amministrazione,@Portafoglio,@RagioniSocialiCorrelate,@Eccezioni)

		SET @IDProfilo = (SELECT SCOPE_IDENTITY())
		
		--Inserisco i premessi di accesso al TipoDealer nella Table Utenti.Accede
		INSERT INTO Utenti.Accede (IDProfilo, IDTipoDealer)
				SELECT distinct @IDProfilo AS IDProfilo, 
				 	TipoDealerGrid.value('(IDTipoDealer/text())[1]','int') AS IDTipoDealer
				   FROM @TipoDealerXml.nodes('/Dealer/TipoDealer') AS TEMPTABLE(TipoDealerGrid)

		--Inserisco le Autorizzazioni sui Campi

		SELECT #AutorizzazioniTempTable.value('(IDCampoDati/text())[1]','int') AS IDCampoDatiNew, #AutorizzazioniTempTable.value('(Autorizzazione/text())[1]','int') AS AutorizzazioneNew
			into #AutorizzazioniTempTable
				FROM @AutorizzazioneCampiXml.nodes('/Autorizzazioni/AutorizzazioneCampi') AS TEMPTABLE(#AutorizzazioniTempTable)		
		
		--Replico i permessi di accesso ai campi dalla Table Utenti.CampoDati alla Table Utenti.AutorizzazioneCampi
		INSERT INTO Utenti.AutorizzazioneCampi (IDCampoDati, Autorizzazione)
			OUTPUT inserted.IDAutorizzazioneCampi INTO @inserted_ids
			SELECT IDCampoDatiNew, AutorizzazioneNew 
				FROM #AutorizzazioniTempTable
		
		--Creo le associazioni fra i record inseriti nella Table Utenti.AutorizzazioneCampi e la Table Utenti.Usa
		INSERT INTO Utenti.Usa (IDProfilo, IDAutorizzazioneCampi)
			SELECT @IDProfilo, insertedIDAutorizzazioneCampi from @inserted_ids

		DROP TABLE #AutorizzazioniTempTable

	COMMIT TRANSACTION


END