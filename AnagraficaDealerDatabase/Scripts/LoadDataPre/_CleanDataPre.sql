PRINT N'Deleteting Dealer.Usa Table'
DELETE FROM Dealer.Usa

PRINT N'Deleteting Utenti.Usa Table'
DELETE FROM Utenti.Usa

PRINT N'Deleteting Utenti.Accede Table'
DELETE FROM Utenti.Accede

PRINT N'Deleteting Utenti.AutorizzazioneCampi Table'
DELETE FROM Utenti.AutorizzazioneCampi
DBCC CHECKIDENT ( 'Utenti.AutorizzazioneCampi', RESEED, 0 )

PRINT N'Deleteting Utenti.CampoDati Table'
DELETE FROM Utenti.CampoDati
DBCC CHECKIDENT ( 'Utenti.CampoDati', RESEED, 0 )

PRINT N'Deleteting Area.Operativita Table'
DELETE FROM Area.Operativita 
DBCC CHECKIDENT ( 'Area.Operativita', RESEED, 0 )

PRINT N'Deleteting Area.Tipologia Table'
DELETE FROM Area.Tipologia 
DBCC CHECKIDENT ( 'Area.Tipologia', RESEED, 0 )

PRINT N'Deleteting Area.AreaDiCompetenza Table'
DELETE FROM Area.AreaDiCompetenza 
DBCC CHECKIDENT ( 'Area.AreaDiCompetenza', RESEED, 0 )

PRINT N'Deleteting Catene.TipoRemunerazione Table'
DELETE FROM Catene.TipoRemunerazione
DBCC CHECKIDENT ( 'Catene.TipoRemunerazione', RESEED, 0 )

PRINT N'Deleteting Negozio.TipologiaArredo  Table'
DELETE FROM Negozio.TipologiaArredo
DBCC CHECKIDENT ( 'Negozio.TipologiaArredo', RESEED, 0 )

PRINT N'Deleteting Negozio.DimensioneAreaVendita  Table'
DELETE FROM Negozio.DimensioneAreaVendita 
DBCC CHECKIDENT ( 'Negozio.DimensioneAreaVendita', RESEED, 0 )

PRINT N'Deleteting Negozio.Cluster Table'
DELETE FROM Negozio.Cluster
DBCC CHECKIDENT ( 'Negozio.Cluster', RESEED, 0 )

PRINT N'Deleteting Negozio.UsaModelloVendita Table'
DELETE FROM Negozio.UsaModelloVendita

PRINT N'Deleteting Negozio.ModelloVendita  Table'
DELETE FROM Negozio.ModelloVendita 
DBCC CHECKIDENT ( 'Negozio.ModelloVendita', RESEED, 0 )

PRINT N'Deleteting Negozio.UsaGestoreCondiviso Table'
DELETE FROM Negozio.UsaGestoreCondiviso

PRINT N'Deleteting Negozio.GestoreCondiviso Table'
DELETE FROM Negozio.GestoreCondiviso
DBCC CHECKIDENT ( 'Negozio.GestoreCondiviso', RESEED, 0 )

PRINT N'Deleteting Disdetta.Richiedente  Table'
DELETE FROM Disdetta.Richiedente
DBCC CHECKIDENT ( 'Disdetta.Richiedente', RESEED, 0 )

PRINT N'Deleteting Area.SegmentazioneCanale Table'
DELETE FROM Area.SegmentazioneCanale 
DBCC CHECKIDENT ( 'Area.SegmentazioneCanale', RESEED, 0 )

PRINT N'Deleteting DettaglioAgenti.MaterialeEspositivo Table'
DELETE FROM DettaglioAgenti.MaterialeEspositivo
DBCC CHECKIDENT ( 'DettaglioAgenti.MaterialeEspositivo', RESEED, 0 )

PRINT N'Deleteting DettaglioAgenti.Dimensionamento Table'
DELETE FROM DettaglioAgenti.Dimensionamento
DBCC CHECKIDENT ( 'DettaglioAgenti.Dimensionamento', RESEED, 0 ) 