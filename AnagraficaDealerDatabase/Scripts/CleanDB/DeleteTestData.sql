PRINT N'Deleteting Storico.StoricoCanale Table'
DELETE FROM Storico.StoricoIndirizzo

PRINT N'Deleteting Storico.StoricoCanale Table'
DELETE FROM Storico.StoricoCodice

PRINT N'Deleteting Storico.StoricoCanale Table'
DELETE FROM Storico.StoricoCanale

PRINT N'Deleteting Negozio.UsaGestoreCondiviso Table'
DELETE FROM Negozio.UsaGestoreCondiviso

PRINT N'Deleteting Negozio.GestoreCondiviso Table'
DELETE FROM Negozio.GestoreCondiviso
DBCC CHECKIDENT ( 'Negozio.GestoreCondiviso', RESEED, 0 ) 

PRINT N'Deleteting DettaglioAgenti.DettaglioAgenti Table'
DELETE FROM DettaglioAgenti.DettaglioAgenti

PRINT N'Deleteting DettaglioAgenti.Dimensionamento Table'
DELETE FROM DettaglioAgenti.Dimensionamento
DBCC CHECKIDENT ( 'DettaglioAgenti.Dimensionamento', RESEED, 0 ) 

PRINT N'Deleteting DettaglioAgenti.MaterialeEspositivo Table'
DELETE FROM DettaglioAgenti.MaterialeEspositivo
DBCC CHECKIDENT ( 'DettaglioAgenti.MaterialeEspositivo', RESEED, 0 ) 

PRINT N'Deleteting Negozio.Usa Table'
DELETE FROM Negozio.UsaModelloVendita

PRINT N'Deleteting InfoGenerali.InfoSubAgenti Table'
DELETE FROM InfoGenerali.InfoSubAgenti

PRINT N'Deleteting Negozio.NegozioAgenti Table'
DELETE FROM Negozio.NegozioAgenti 

PRINT N'Deleteting InfoGenerali.InfoAgentiCommittenti Table'
DELETE FROM InfoGenerali.InfoAgentiCommittenti

PRINT N'Deleteting Negozio.NegozioPoint Table'
DELETE FROM Negozio.NegozioPoint 

PRINT N'Deleteting InfoGenerali.InfoPoint Table'
DELETE FROM InfoGenerali.InfoPoint

PRINT N'Deleteting InfoGenerali.InfoPosEPod  Table'
DELETE FROM InfoGenerali.InfoPosEPod 

PRINT N'Deleteting Catene.CatenePosPod  Table'
DELETE FROM Catene.CatenePosPod

PRINT N'Deleteting Negozio.NegozioPosPod  Table'
DELETE FROM Negozio.NegozioPosPod 

PRINT N'Deleteting Negozio.ModelloVendita  Table'
DELETE FROM Negozio.ModelloVendita 
DBCC CHECKIDENT ( 'Negozio.ModelloVendita', RESEED, 0 )

PRINT N'Deleteting Negozio.DimensioneAreaVendita  Table'
DELETE FROM Negozio.DimensioneAreaVendita 
DBCC CHECKIDENT ( 'Negozio.DimensioneAreaVendita', RESEED, 0 )

PRINT N'Deleteting Negozio.TipologiaArredo  Table'
DELETE FROM Negozio.TipologiaArredo
DBCC CHECKIDENT ( 'Negozio.TipologiaArredo', RESEED, 0 )

PRINT N'Deleteting Utenti.Funzionario  Table'
DELETE FROM Utenti.Funzionario
DBCC CHECKIDENT ( 'Utenti.Funzionario', RESEED, 0 )

PRINT N'Deleteting Utenti.AreaManager  Table'
DELETE FROM Utenti.AreaManager
DBCC CHECKIDENT ( 'Utenti.AreaManager', RESEED, 0 )

PRINT N'Deleteting Disdetta.DettaglioDisdetta Table'
DELETE FROM Disdetta.DettaglioDisdetta

PRINT N'Deleteting Disdetta.Disdetta Table'
DELETE FROM Disdetta.Disdetta

PRINT N'Deleteting Disdetta.Richiedente  Table'
DELETE FROM Disdetta.Richiedente
DBCC CHECKIDENT ( 'Disdetta.Richiedente', RESEED, 0 )

PRINT N'Deleteting Vendite.VenditeCanali Table'
DELETE FROM Vendite.VenditeCanali

DELETE FROM Vendite.VenditePoint

PRINT N'Deleteting Vendite.Vendite Table'
DELETE FROM Vendite.Vendite

PRINT N'Deleteting Catene.Catene Table'
DELETE FROM Catene.Catene

PRINT N'Deleteting Catene.TipoRemunerazione Table'
DELETE FROM Catene.TipoRemunerazione
DBCC CHECKIDENT ( 'Catene.TipoRemunerazione', RESEED, 0 )

PRINT N'Deleteting Negozio.NegozioCommittenti Table'
DELETE FROM Negozio.NegozioCommittenti

PRINT N'Deleteting Negozio.Apre Table'
DELETE FROM Negozio.Apre

PRINT N'Deleteting Negozio.Negozio Table'
DELETE FROM Negozio.Negozio

PRINT N'Deleteting Negozio.Cluster Table'
DELETE FROM Negozio.Cluster
DBCC CHECKIDENT ( 'Negozio.Cluster', RESEED, 0 )

PRINT N'Deleteting Negozio.OrarioDiApertura Table'
DELETE FROM Negozio.OrarioDiApertura
DBCC CHECKIDENT ( 'Negozio.OrarioDiApertura', RESEED, 0 )

PRINT N'Deleteting Dealer.CanaliDealer Table'
DELETE FROM Dealer.CanaliDealer 

PRINT N'Deleteting Area.AreaSubAgenti Table'
DELETE FROM Area.AreaSubAgenti

PRINT N'Deleteting Area.AreaAgentiCommittenti Table'
DELETE FROM Area.AreaAgentiCommittenti

PRINT N'Deleteting Area.AreaPosPod  Table'
DELETE FROM Area.AreaPosPod

PRINT N'Deleteting Area.AreaPoint Table'
DELETE FROM Area.AreaPoint

PRINT N'Deleteting Area.AreaCommittenti Table'
DELETE FROM Area.AreaCommittenti 

PRINT N'Deleteting Area.SegmentazioneCanale Table'
DELETE FROM Area.SegmentazioneCanale 
DBCC CHECKIDENT ( 'Area.SegmentazioneCanale', RESEED, 0 )

PRINT N'Deleteting Area.AreaDiCompetenza Table'
DELETE FROM Area.AreaDiCompetenza 
DBCC CHECKIDENT ( 'Area.AreaDiCompetenza', RESEED, 0 )

PRINT N'Deleteting Area.Area Table'
DELETE FROM Area.Area

PRINT N'Deleteting Area.Tipologia Table'
DELETE FROM Area.Tipologia 
DBCC CHECKIDENT ( 'Area.Tipologia', RESEED, 0 )

PRINT N'Deleteting Area.Operativita Table'
DELETE FROM Area.Operativita 
DBCC CHECKIDENT ( 'Area.Operativita', RESEED, 0 )

PRINT N'Deleteting Dealer.Usa Table'
DELETE FROM Dealer.Usa

PRINT N'Deleteting Utenti.Usa Table'
DELETE FROM Utenti.Usa

PRINT N'Deleteting Utenti.AutorizzazioneCampi Table'
DELETE FROM Utenti.AutorizzazioneCampi
DBCC CHECKIDENT ( 'Utenti.AutorizzazioneCampi', RESEED, 0 )

PRINT N'Deleteting Utenti.CampoDati Table'
DELETE FROM Utenti.CampoDati
DBCC CHECKIDENT ( 'Utenti.CampoDati', RESEED, 0 )

PRINT N'Deleteting InfoGenerali.InfoAgentiCommittenti Table'
DELETE FROM InfoGenerali.InfoAgentiCommittenti

PRINT N'Deleteting InfoGenerali.InfoCommittenti Table'
DELETE FROM InfoGenerali.InfoCommittenti

PRINT N'Deleteting InfoGenerali.InfoPoint Table'
DELETE FROM InfoGenerali.InfoPoint

PRINT N'Deleteting InfoGenerali.InfoPosEPod Table'
DELETE FROM InfoGenerali.InfoPosEPod

PRINT N'Deleteting InfoGenerali.InfoSubAgenti Table'
DELETE FROM InfoGenerali.InfoSubAgenti

PRINT N'Deleteting InfoGenerali.InfoGenerali Table'
DELETE FROM InfoGenerali.InfoGenerali

PRINT N'Deleteting Vendite.VenditePoint Table'
DELETE FROM Vendite.VenditePoint

PRINT N'Deleteting Vendite.VenditeCanali Table'
DELETE FROM Vendite.VenditeCanali

PRINT N'Deleteting Vendite.Vendite Table'
DELETE FROM Vendite.Vendite

PRINT N'Deleteting Utility.Comune Table'
DELETE FROM Utility.Comune
DBCC CHECKIDENT ( 'Utility.Comune', RESEED, 0 )

PRINT N'Deleteting Utility.Provincia Table'
DELETE FROM Utility.Provincia
DBCC CHECKIDENT ( 'Utility.Provincia', RESEED, 0 )

PRINT N'Deleteting Utility.Regione Table'
DELETE FROM Utility.Regione
DBCC CHECKIDENT ( 'Utility.Regione', RESEED, 0 )

PRINT N'Deleteting Utility.Zona Table'
DELETE FROM Utility.Zona
DBCC CHECKIDENT ( 'Utility.Zona', RESEED, 0 )

PRINT N'Deleteting Utenti.AreaManager Table'
DELETE FROM Utenti.AreaManager
DBCC CHECKIDENT ( 'Utenti.AreaManager', RESEED, 0 )

PRINT N'Deleteting Import.Point Table'
DELETE FROM Import.Point
DBCC CHECKIDENT ( 'Import.Point', RESEED, 0 )

PRINT N'Deleteting Import.AgenteCommittente Table'
DELETE FROM Import.AgenteCommittente
DBCC CHECKIDENT ( 'Import.AgenteCommittente', RESEED, 0 )

DELETE FROM Import.CentroAssistenza
DELETE FROM Import.PEC

PRINT N'Deleteting Import.SubAgente Table'
DELETE FROM Import.SubAgente
DBCC CHECKIDENT ( 'Import.SubAgente', RESEED, 0 )

PRINT N'Deleteting Import.Committente Table'
DELETE FROM Import.Committente
DBCC CHECKIDENT ( 'Import.Committente', RESEED, 0 )

PRINT N'Deleteting Import.AreaManager Table'
DELETE FROM Import.AreaManager
DBCC CHECKIDENT ( 'Import.AreaManager', RESEED, 0 )

PRINT N'Deleteting Import.Funzionario Table'
DELETE FROM Import.Funzionario
DBCC CHECKIDENT ( 'Import.Funzionario', RESEED, 0 )

PRINT N'Deleteting Utenti.Funzionario Table'
DELETE FROM Utenti.Funzionario
DBCC CHECKIDENT ( 'Utenti.Funzionario', RESEED, 0 )

PRINT N'Deleteting Dealer.CanaliDealer Table'
DELETE FROM Dealer.CanaliDealer

DELETE FROM Dealer.Canale
DBCC CHECKIDENT ( 'Dealer.Canale', RESEED, 0 )

PRINT N'Deleteting Dealer.Dealer Table'
DELETE FROM Dealer.Dealer
DBCC CHECKIDENT ( 'Dealer.Dealer', RESEED, 0 )

PRINT N'Deleteting Utenti.Accede Table'
DELETE FROM Utenti.Accede

DELETE FROM Import.TmpScarti
DELETE FROM Import.Scarti

PRINT N'Deleteting Dealer.TipoDealer Table'
DELETE FROM Dealer.TipoDealer
DBCC CHECKIDENT ( 'Dealer.TipoDealer', RESEED, 0 )

PRINT N'Deleteting Dealer.Stato Table'
DELETE FROM Dealer.Stato
DBCC CHECKIDENT ( 'Dealer.Stato', RESEED, 0 )

PRINT N'Deleteting Dealer.Canale Table'
DELETE FROM Dealer.Canale
DBCC CHECKIDENT ( 'Dealer.Canale', RESEED, 0 )

PRINT N'Deleteting Dealer.CondizioniPagamento Table'
DELETE FROM Dealer.CondizioniPagamento
DBCC CHECKIDENT ( 'Dealer.CondizioniPagamento', RESEED, 0 )

PRINT N'Deleteting Utenti.Utente Table'
DELETE FROM Utenti.Utente
DBCC CHECKIDENT ( 'Utenti.Utente', RESEED, -1 )

PRINT N'Deleteting Utenti.Profilo Table'
DELETE FROM Utenti.Profilo
DBCC CHECKIDENT ( 'Utenti.Profilo', RESEED, -1 )

DELETE FROM Import.AreaManagerToHide

DELETE FROM Import.FunzionarioToHide

DELETE FROM Import.PosPodToHide

DELETE FROM Import.PointToHide

DELETE FROM Import.SubAgenteToHide

DELETE FROM Import.PosPod
DBCC CHECKIDENT ( 'Import.PosPod', RESEED, 0 )

DELETE FROM Import.AnomalieMotivazione
--DBCC CHECKIDENT ( 'Import.AnomalieMotivazione', RESEED, 0 )

DELETE FROM Import.AnomalieTipo
--DBCC CHECKIDENT ( 'Import.AnomalieTipo', RESEED, 0 )

DELETE FROM Import.Anomalie
DBCC CHECKIDENT ( 'Import.Anomalie', RESEED, 0 )
