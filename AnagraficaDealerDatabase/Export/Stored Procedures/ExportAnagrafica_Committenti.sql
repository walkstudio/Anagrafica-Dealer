
-- =============================================
-- Author:		Gabriele Oberti
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Export].[ExportAnagrafica_Committenti]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	
			SELECT Indirizzo AS Indirizzo
				  ,PIVA	AS PIVA
				  ,Telefono AS Telefono
				  ,Fax AS Fax
				  ,DataModifica AS [Data modifica]
				  ,Codice AS Codice
				  ,Stato  AS Stato
				  ,NomeTipoDealer AS [Tipo dealer]
				  ,BOL AS BOL
				  ,DataAperturaCodice AS [Data apertura codice]
				  ,DataChiusuraCodice AS [Data chiusura codice]
				  ,DealerAssociatiAttivi AS [Dealer associati attivi]
				  ,DealerAssociatiDisattivi AS [Dealer associati disattivi]
				  ,FideiussioneAffitto AS [Fideiussione affitto]
				  ,FideiussioneCommerciale AS [Fideiussione commerciale]
				  ,Operativita AS Operativita
				  ,Tipologia AS Tipologia
				  ,CodiceFornitore AS [Codice fornitore]
				  ,CodiceVogi AS [Codice vogi]
				  ,Email	AS [Email negozio]
				  ,Pec AS [Email pec]
				  ,AccordiParticolari AS [Accordi particolari]
				  ,DataContratto AS [Data contratto]
				  ,FirmaDigitale AS [Firma digitale]
				  ,ProvRea AS [Provincia Rea]
				  ,Rea AS Rea
				  ,SegmentazioneCanale AS [Segmentazione canale]
				  ,AreaDiCompetenza AS [Area di competenza]
				  ,CondizioniPagamento AS [Condizioni pagamento]
				  ,Canale AS Canale
				  ,ClassificazioneMaster AS [Classificazione master]
				  ,FT AS FT
				  ,FTE AS FTE
				  ,PT AS PT
				  ,NumeroVetrine AS [Numero vetrine]
				  ,Piu12 AS Piu12
				  ,TelefonoNegozio AS [Telefono negozio]
				  ,NomeTitolare AS [Nome titolare]
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
				  ,RagioneSociale AS [Ragione sociale]
			  FROM AnagraficaDealer.Dealer.View_Committenti 
			  	Order by Codice desc
	


	--SELECT '1' AS Indirizzo
	--			  ,''	AS PIVA
	--			  ,'' AS Telefono
	--			  ,'' AS Fax
	--			  ,'' AS [Data modifica]
	--			  ,'' AS Codice
	--			  ,'yujtyu5'  AS Stato
	--			  ,'' AS [Tipo dealer]
	--			  ,'' AS BOL
	--			  ,'' AS [Data apertura codice]
	--			  ,'' AS [Data chiusura codice]
	--			  ,'' AS [Dealer associati attivi]
	--			  ,'' AS [Dealer associati disattivi]
	--			  ,'' AS [Fideiussione affitto]
	--			  ,'' AS [Fideiussione commerciale]
	--			  ,'' AS Operativita
	--			  ,'' AS Tipologia
	--			  ,'' AS [Codice fornitore]
	--			  ,'' AS [Codice vogi]
	--			  ,'klò7i87'	AS [Email negozio]
	--			  ,'' AS [Email pec]
	--			  ,'' AS [Accordi particolari]
	--			  ,'' AS [Data contratto]
	--			  ,'' AS [Firma digitale]
	--			  ,'' AS [Provincia Rea]
	--			  ,'' AS Rea
	--			  ,'' AS [Segmentazione canale]
	--			  ,'djkjkl' AS [Area di competenza]
	--			  ,'' AS [Condizioni pagamento]
	--			  ,'' AS Canale
	--			  ,'fdvdv' AS [Classificazione master]
	--			  ,'' AS FT
	--			  ,'' AS FTE
	--			  ,'' AS PT
	--			  ,'' AS [Numero vetrine]
	--			  ,'' AS Piu12
	--			  ,'' AS [Orario apertura]
	--			  ,'' AS [Telefono negozio]
	--			  ,'' AS [Nome titolare]
	--			  ,'' AS Supporti
	--			  ,'' AS Cluster
	--			  ,'' AS [Tipo remunerazione]
	--			  ,'' AS CAP
	--			  ,'' AS Localita
	--			  ,'' AS Nome1
	--			  ,'' AS Provincia
	--			  ,'' AS Regione
	--			  ,'' AS [Codice vecchio]
	--			  ,'' AS [Data termine preavviso]
	--			  ,'' AS [Data invio disdetta]
	--			  ,'' AS Disdetta 
	--			  ,'' AS [Giorni preavviso]
	--			  ,'' AS Note
	--			  ,'' AS Area
	--			  ,'' AS [Data disdetta]
	--			  ,'' AS Cliente 
	--			  ,'' AS [Gruppo prezzi]
	--			  ,'' AS Magazzino
	--			  ,'' AS Nome2
	--			  ,'' AS [Codice funzionario]
	--			  ,'' AS Funzionario
	--			  ,'' AS [Codice area manager]
	--			  ,'' AS [Area manager]
	--			  ,'dsfds' AS [Ragione sociale]

	--			  union

	--			  SELECT '3' AS Indirizzo
	--			  ,''	AS PIVA
	--			  ,'' AS Telefono
	--			  ,'' AS Fax
	--			  ,'' AS [Data modifica]
	--			  ,'' AS Codice
	--			  ,'yujtyu5'  AS Stato
	--			  ,'' AS [Tipo dealer]
	--			  ,'' AS BOL
	--			  ,'' AS [Data apertura codice]
	--			  ,'' AS [Data chiusura codice]
	--			  ,'' AS [Dealer associati attivi]
	--			  ,'' AS [Dealer associati disattivi]
	--			  ,'' AS [Fideiussione affitto]
	--			  ,'' AS [Fideiussione commerciale]
	--			  ,'' AS Operativita
	--			  ,'' AS Tipologia
	--			  ,'' AS [Codice fornitore]
	--			  ,'' AS [Codice vogi]
	--			  ,'klò7i87'	AS [Email negozio]
	--			  ,'' AS [Email pec]
	--			  ,'' AS [Accordi particolari]
	--			  ,'' AS [Data contratto]
	--			  ,'' AS [Firma digitale]
	--			  ,'' AS [Provincia Rea]
	--			  ,'' AS Rea
	--			  ,'' AS [Segmentazione canale]
	--			  ,'djkjkl' AS [Area di competenza]
	--			  ,'' AS [Condizioni pagamento]
	--			  ,'' AS Canale
	--			  ,'fdvdv' AS [Classificazione master]
	--			  ,'' AS FT
	--			  ,'' AS FTE
	--			  ,'' AS PT
	--			  ,'' AS [Numero vetrine]
	--			  ,'' AS Piu12
	--			  ,'' AS [Orario apertura]
	--			  ,'' AS [Telefono negozio]
	--			  ,'' AS [Nome titolare]
	--			  ,'' AS Supporti
	--			  ,'' AS Cluster
	--			  ,'' AS [Tipo remunerazione]
	--			  ,'' AS CAP
	--			  ,'' AS Localita
	--			  ,'' AS Nome1
	--			  ,'' AS Provincia
	--			  ,'' AS Regione
	--			  ,'' AS [Codice vecchio]
	--			  ,'' AS [Data termine preavviso]
	--			  ,'' AS [Data invio disdetta]
	--			  ,'' AS Disdetta 
	--			  ,'' AS [Giorni preavviso]
	--			  ,'' AS Note
	--			  ,'' AS Area
	--			  ,'' AS [Data disdetta]
	--			  ,'' AS Cliente 
	--			  ,'' AS [Gruppo prezzi]
	--			  ,'' AS Magazzino
	--			  ,'' AS Nome2
	--			  ,'' AS [Codice funzionario]
	--			  ,'' AS Funzionario
	--			  ,'' AS [Codice area manager]
	--			  ,'' AS [Area manager]
	--			  ,'dsfds' AS [Ragione sociale]

	--			  union

	--			  SELECT '23' AS Indirizzo
	--			  ,''	AS PIVA
	--			  ,'' AS Telefono
	--			  ,'' AS Fax
	--			  ,'' AS [Data modifica]
	--			  ,'' AS Codice
	--			  ,'yujtyu5'  AS Stato
	--			  ,'' AS [Tipo dealer]
	--			  ,'' AS BOL
	--			  ,'' AS [Data apertura codice]
	--			  ,'' AS [Data chiusura codice]
	--			  ,'' AS [Dealer associati attivi]
	--			  ,'' AS [Dealer associati disattivi]
	--			  ,'' AS [Fideiussione affitto]
	--			  ,'' AS [Fideiussione commerciale]
	--			  ,'' AS Operativita
	--			  ,'' AS Tipologia
	--			  ,'' AS [Codice fornitore]
	--			  ,'' AS [Codice vogi]
	--			  ,'klò7i87'	AS [Email negozio]
	--			  ,'' AS [Email pec]
	--			  ,'' AS [Accordi particolari]
	--			  ,'' AS [Data contratto]
	--			  ,'' AS [Firma digitale]
	--			  ,'' AS [Provincia Rea]
	--			  ,'' AS Rea
	--			  ,'' AS [Segmentazione canale]
	--			  ,'djkjkl' AS [Area di competenza]
	--			  ,'' AS [Condizioni pagamento]
	--			  ,'' AS Canale
	--			  ,'fdvdv' AS [Classificazione master]
	--			  ,'' AS FT
	--			  ,'' AS FTE
	--			  ,'' AS PT
	--			  ,'' AS [Numero vetrine]
	--			  ,'' AS Piu12
	--			  ,'' AS [Orario apertura]
	--			  ,'' AS [Telefono negozio]
	--			  ,'' AS [Nome titolare]
	--			  ,'' AS Supporti
	--			  ,'' AS Cluster
	--			  ,'' AS [Tipo remunerazione]
	--			  ,'' AS CAP
	--			  ,'' AS Localita
	--			  ,'' AS Nome1
	--			  ,'' AS Provincia
	--			  ,'' AS Regione
	--			  ,'' AS [Codice vecchio]
	--			  ,'' AS [Data termine preavviso]
	--			  ,'' AS [Data invio disdetta]
	--			  ,'' AS Disdetta 
	--			  ,'' AS [Giorni preavviso]
	--			  ,'' AS Note
	--			  ,'' AS Area
	--			  ,'' AS [Data disdetta]
	--			  ,'' AS Cliente 
	--			  ,'' AS [Gruppo prezzi]
	--			  ,'' AS Magazzino
	--			  ,'' AS Nome2
	--			  ,'' AS [Codice funzionario]
	--			  ,'' AS Funzionario
	--			  ,'' AS [Codice area manager]
	--			  ,'' AS [Area manager]
	--			  ,'dsfds' AS [Ragione sociale]

END