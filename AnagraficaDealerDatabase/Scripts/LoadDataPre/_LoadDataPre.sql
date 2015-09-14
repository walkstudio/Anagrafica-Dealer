PRINT N'Deleteting Utenti.CampoDati Table'
DELETE FROM Utenti.CampoDati
DBCC CHECKIDENT ( 'Utenti.CampoDati', RESEED, 0 )
:r .\Utenti_CampoDati.sql

PRINT N'Deleteting Dealer.Usa Table'
DELETE FROM Dealer.Usa
:r .\Dealer_Usa.sql

PRINT N'Deleteting Utenti.AutorizzazioneCampi Table'
DELETE FROM Utenti.AutorizzazioneCampi
DBCC CHECKIDENT ( 'Utenti.AutorizzazioneCampi', RESEED, 0 )
:r .\Utenti_AutorizzazioneCampi.sql

PRINT N'Deleteting Utenti.Usa Table'
DELETE FROM Utenti.Usa
:r .\Utenti_Usa.sql

PRINT N'Deleteting Utenti.Accede Table'
DELETE FROM Utenti.Accede
:r .\Utenti_Accede.sql

:r .\Dealer_Canale.sql

--Popolo le tabelle delle combo a selezione multipla
:r .\Area_Operativita.sql
:r .\Area_Tipologia.sql

:r .\Catene_TipoRemunerazione.sql
:r .\Negozio_TipologiaArredo.sql
:r .\Negozio_DimensioneAreaVendita.sql

:r .\Negozio_GestoreCondiviso.sql
:r .\Disdetta_Richiedente.sql

:r .\DettaglioAgenti_MaterialeEspositivo.sql
:r .\DettaglioAgenti_Dimensionamento.sql


--:r .\Area_AreaDiCompetenza.sql
--PRINT N'Deleteting Area.AreaDiCompetenza Table'
--DELETE FROM Area.AreaDiCompetenza 
--DBCC CHECKIDENT ( 'Area.AreaDiCompetenza', RESEED, 0 )

:r .\Negozio_Cluster.sql
--PRINT N'Deleteting Negozio.Cluster Table'
--DELETE FROM Negozio.Cluster
--DBCC CHECKIDENT ( 'Negozio.Cluster', RESEED, 0 )

:r .\Negozio_ModelloVendita.sql
--PRINT N'Deleteting Negozio.UsaModelloVendita Table'
--DELETE FROM Negozio.UsaModelloVendita

--PRINT N'Deleteting Negozio.ModelloVendita  Table'
--DELETE FROM Negozio.ModelloVendita 
--DBCC CHECKIDENT ( 'Negozio.ModelloVendita', RESEED, 0 )

:r .\Area_SegmentazioneCanale.sql
--PRINT N'Deleteting Area.SegmentazioneCanale Table'
--DELETE FROM Area.SegmentazioneCanale 
--DBCC CHECKIDENT ( 'Area.SegmentazioneCanale', RESEED, 0 )

:r .\Dealer_Stato.sql







