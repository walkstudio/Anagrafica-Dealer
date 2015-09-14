
-- =============================================
-- Author:		Gabriele Oberti
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Export].[ExportAnagrafica_AgentiCommittenti]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	
	
			SELECT   Indirizzo AS Indirizzo
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
					  ,CondizioniPagamento AS [Condizioni pagamento]
					  ,Canale AS Canale
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
					  ,BOL AS BOL
					  ,DataAperturaCodice AS [Data apertura codice]
					  ,DataChiusuraCodice AS [Data chiusura codice]
					  ,DataContratto AS [Data contratto]
					  ,FirmaDigitale AS [Firma digitale]
					  ,ProvRea AS [Provincia Rea]
					  ,Rea AS Rea
					  ,IndirizzoSpedizioneMateriale AS [Indirizzo spedizione materiale]					  
					  ,RagioneSociale AS [Ragione sociale]
					  ,CFTitolare	AS [CF Titolare]
					  ,EmailTitolare AS [Email Titolare]
					  ,Plurimandatario AS [Plurimandatario]
					  ,MaterialeEspositivo AS [Materiale Espositivo]
					  ,ZonaAssegnata AS [Zona Assegnata]
					  ,Dimensionamento AS [Dimensionamento]


			FROM AnagraficaDealer.Dealer.View_AgentiCommittenti 
			Order by Codice desc

	--SELECT 	'1' AS Indirizzo
	--				  ,'' AS PIVA
	--				  ,'' AS Telefono
	--				  ,'' AS Fax
	--				  ,'' AS [Data modifica]
	--				  ,'' AS Codice
	--				  ,''  AS Stato
	--				  ,'' AS [Tipo dealer]
	--				  ,'' AS Operativita
	--				  ,'' AS Tipologia
	--				  ,'' AS [Codice fornitore]
	--				  ,'' AS [Codice vogi]
	--				  ,''  AS [Email negozio]
	--				  ,'' AS [Email pec]
	--				  ,'' AS [Condizioni pagamento]
	--				  ,'' AS Canale
	--				  ,'' AS [Orario apertura]
	--				  ,'zcxzc' AS [Telefono negozio]
	--				  ,'' AS [Nome titolare]
	--				  ,'zxccz' AS Supporti
	--				  ,'' AS Cluster
	--				  ,'' AS [Tipo remunerazione]
	--				  ,'' AS CAP
	--				  ,'' AS Localita
	--				  ,'' AS Nome1
	--				  ,'' AS Provincia
	--				  ,'' AS Regione
	--				  ,'' AS [Codice vecchio]
	--				  ,'' AS [Data termine preavviso]
	--				  ,'' AS [Data invio disdetta]
	--				  ,'' AS Disdetta 
	--				  ,'' AS [Giorni preavviso]
	--				  ,'' AS Note
	--				  ,'' AS Area
	--				  ,'' AS [Data disdetta]
	--				  ,'' AS Cliente 
	--				  ,'' AS [Gruppo prezzi]
	--				  ,'' AS Magazzino
	--				  ,'' AS Nome2
	--				  ,'' AS [Codice funzionario]
	--				  ,'zxczc' AS Funzionario
	--				  ,'' AS [Codice area manager]
	--				  ,'' AS [Area manager]
	--				  ,'xcvxv' AS BOL
	--				  ,'' AS [Data apertura codice]
	--				  ,'' AS [Data chiusura codice]
	--				  ,'' AS [Data contratto]
	--				  ,'' AS [Firma digitale]
	--				  ,'zxczc' AS [Provincia Rea]
	--				  ,'' AS Rea
	--				  ,'' AS [Indirizzo spedizione materiale]
	--				  ,'' AS [Ragione sociale]
	--				  ,''	AS [CF Titolare]
	--				  ,'' AS [Email Titolare]

	--				union
	--				SELECT 	'2' AS Indirizzo
	--				  ,'' AS PIVA
	--				  ,'' AS Telefono
	--				  ,'' AS Fax
	--				  ,'' AS [Data modifica]
	--				  ,'' AS Codice
	--				  ,''  AS Stato
	--				  ,'' AS [Tipo dealer]
	--				  ,'' AS Operativita
	--				  ,'' AS Tipologia
	--				  ,'' AS [Codice fornitore]
	--				  ,'' AS [Codice vogi]
	--				  ,''  AS [Email negozio]
	--				  ,'' AS [Email pec]
	--				  ,'' AS [Condizioni pagamento]
	--				  ,'' AS Canale
	--				  ,'' AS [Orario apertura]
	--				  ,'' AS [Telefono negozio]
	--				  ,'qweqw' AS [Nome titolare]
	--				  ,'' AS Supporti
	--				  ,'' AS Cluster
	--				  ,'' AS [Tipo remunerazione]
	--				  ,'' AS CAP
	--				  ,'' AS Localita
	--				  ,'' AS Nome1
	--				  ,'' AS Provincia
	--				  ,'' AS Regione
	--				  ,'' AS [Codice vecchio]
	--				  ,'' AS [Data termine preavviso]
	--				  ,'' AS [Data invio disdetta]
	--				  ,'' AS Disdetta 
	--				  ,'' AS [Giorni preavviso]
	--				  ,'qweqeq' AS Note
	--				  ,'asda' AS Area
	--				  ,'' AS [Data disdetta]
	--				  ,'' AS Cliente 
	--				  ,'addsad' AS [Gruppo prezzi]
	--				  ,'' AS Magazzino
	--				  ,'' AS Nome2
	--				  ,'' AS [Codice funzionario]
	--				  ,'' AS Funzionario
	--				  ,'' AS [Codice area manager]
	--				  ,'' AS [Area manager]
	--				  ,'' AS BOL
	--				  ,'' AS [Data apertura codice]
	--				  ,'' AS [Data chiusura codice]
	--				  ,'' AS [Data contratto]
	--				  ,'' AS [Firma digitale]
	--				  ,'' AS [Provincia Rea]
	--				  ,'' AS Rea
	--				  ,'' AS [Indirizzo spedizione materiale]
	--				  ,'' AS [Ragione sociale]
	--				  ,''	AS [CF Titolare]
	--				  ,'' AS [Email Titolare]
	--				  union
	--				  SELECT 	'3' AS Indirizzo
	--				  ,'' AS PIVA
	--				  ,'' AS Telefono
	--				  ,'' AS Fax
	--				  ,'' AS [Data modifica]
	--				  ,'' AS Codice
	--				  ,''  AS Stato
	--				  ,'' AS [Tipo dealer]
	--				  ,'' AS Operativita
	--				  ,'' AS Tipologia
	--				  ,'' AS [Codice fornitore]
	--				  ,'' AS [Codice vogi]
	--				  ,''  AS [Email negozio]
	--				  ,'' AS [Email pec]
	--				  ,'' AS [Condizioni pagamento]
	--				  ,'' AS Canale
	--				  ,'' AS [Orario apertura]
	--				  ,'' AS [Telefono negozio]
	--				  ,'' AS [Nome titolare]
	--				  ,'' AS Supporti
	--				  ,'' AS Cluster
	--				  ,'' AS [Tipo remunerazione]
	--				  ,'' AS CAP
	--				  ,'' AS Localita
	--				  ,'' AS Nome1
	--				  ,'asdads' AS Provincia
	--				  ,'' AS Regione
	--				  ,'' AS [Codice vecchio]
	--				  ,'' AS [Data termine preavviso]
	--				  ,'' AS [Data invio disdetta]
	--				  ,'' AS Disdetta 
	--				  ,'' AS [Giorni preavviso]
	--				  ,'' AS Note
	--				  ,'' AS Area
	--				  ,'' AS [Data disdetta]
	--				  ,'' AS Cliente 
	--				  ,'' AS [Gruppo prezzi]
	--				  ,'' AS Magazzino
	--				  ,'' AS Nome2
	--				  ,'' AS [Codice funzionario]
	--				  ,'' AS Funzionario
	--				  ,'' AS [Codice area manager]
	--				  ,'' AS [Area manager]
	--				  ,'' AS BOL
	--				  ,'' AS [Data apertura codice]
	--				  ,'' AS [Data chiusura codice]
	--				  ,'' AS [Data contratto]
	--				  ,'' AS [Firma digitale]
	--				  ,'' AS [Provincia Rea]
	--				  ,'' AS Rea
	--				  ,'sda' AS [Indirizzo spedizione materiale]
	--				  ,'' AS [Ragione sociale]
	--				  ,''	AS [CF Titolare]
	--				  ,'' AS [Email Titolare]
END