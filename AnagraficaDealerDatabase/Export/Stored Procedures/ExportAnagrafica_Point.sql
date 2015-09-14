
-- =============================================
-- Author:		Gabriele Oberti
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Export].[ExportAnagrafica_Point]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	
	
				SELECT	 Indirizzo AS Indirizzo
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
						  ,TipologiaArredo AS [Tipologia arredo]
						  ,DataAperturaNegozio AS [Data apertura negozio]
						  ,CentroCommerciale AS [Centro commerciale]
						  ,FirmaDigitale AS [Firma digitale]
						  ,ProvRea AS [Provincia Rea]
						  ,Rea AS Rea
						--,GestoriCondivisi AS [Gestori condivisi]
						,IndirizzoSpedizioneMateriale AS [Indirizzo spedizione materiale]
						,NumeroVetrine AS [Numero vetrine]
						,PointSpecial AS [Point special]
						,DimensioneAreaVendita AS [Dimensione area vendita]
						,RagioneSociale AS [Ragione sociale]
			FROM AnagraficaDealer.Dealer.View_Point
				Order by Codice desc

	
	
END