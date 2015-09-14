
-- =============================================
-- Author:		Gabriele Oberti
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Export].[ExportAnagrafica_PosPod]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	

			SELECT  Indirizzo AS Indirizzo
					  ,PIVA AS PIVA
					  ,Telefono AS Telefono
					  ,Fax AS Fax
					  ,DataModifica AS [Data modifica]
					  ,Codice AS Codice
					  ,Stato  AS Stato
					  ,NomeTipoDealer AS [Tipo dealer]
					  ,Operativita AS Operativita
					  ,Tipologia AS Tipologia
					  ,CodiceFornitore AS [Codice fornitore]
					  ,CodiceVogi AS [Codice vogi]
					  ,Email  AS [Email negozio]
					  ,Pec AS [Email pec]
					  ,AreaDiCompetenza AS [Area di competenza]
					  ,CondizioniPagamento AS [Condizioni pagamento]
					  ,Canale AS Canale				
					  ,TelefonoNegozio AS [Telefono negozio]
					  ,NomeTitolare AS [Nome titolare]
					  ,CFTitolare AS [CF titolare]
					  ,EmailTitolare AS [Email titolare]
					  ,Supporti AS Supporti
					  ,Cluster AS Cluster
					  ,TipoRemunerazione AS [Tipo remunerazione]
					  ,CAP AS CAP
					  ,Localita AS Localita
					  ,Nome1 AS Nome1
					  ,Provincia AS Provincia
					  ,Regione AS Regione
					  ,VecchioCodice AS [Codice vecchio]
					  ,DataTerminePreavviso AS [Data termine preavviso]
					  ,DataInvioDisdetta AS [Data invio disdetta]
					  ,Richiedente AS Disdetta 
					  ,GiorniPreavviso AS [Giorni preavviso]
					  ,CASE
							WHEN len(Note) > 247 THEN substring(Note,1,247) + '...'
							ELSE Note
						END AS Note
					  ,Area AS Area
					  ,DataDisdetta AS [Data disdetta]
					  ,Cliente AS Cliente 
					  ,GruppoPrezzi AS [Gruppo prezzi]
					  ,Magazzino AS Magazzino
					  ,Nome2 AS Nome2
					  ,CodiceFunzionario AS [Codice funzionario]
					  ,Funzionario AS Funzionario
					  ,CodiceAreaManager AS [Codice area manager]
					  ,AreaManager AS [Area manager]
					  ,FT AS FT
					  ,FTE AS FTE
					  ,PT AS PT
					  ,NumeroVetrine AS [Numero vetrine]
					  ,Insegna AS Insegna
					  ,Latitudine AS Latitudine
					  ,Longitudine AS Longitudine
					  --,GestoriCondivisi AS [Gestori condivisi]
				      ,ShopInStore AS [Shop in store]
					  ,ValoreAffitto AS [Valore affitto]
					  ,TipologiaArredo AS [Tipologia arredo]
					  ,DatiCateneAM AS [Dati catene AM]
					  ,DatiCateneFunzionario AS [Dati catene funzionario]
					  ,CentroCommerciale AS [Centro commerciale]
					  ,MagazzinoCentralizzato AS [Magazzino centralizzato]
					  ,NegozioTop AS [Negozio top]
					  ,SegmentazioneCanale AS [Segmentazione canale]
					  ,BOL AS BOL
					  ,DataAperturaCodice AS [Data attivazione]
					  ,DataChiusuraCodice as [Data disattivazione]
					  , DataAperturaNegozio AS [Data apertura negozio]
					  , DataChiusuraNegozio AS [Data chiusura negozio]
					  ,CentroAssistenzaTecnica AS [Centro assistenza tecnica]
					  ,[RagioneSociale] AS [Ragione sociale]
		  FROM AnagraficaDealer.Dealer.View_PosPod

		  	Order by Codice desc



	
	
END