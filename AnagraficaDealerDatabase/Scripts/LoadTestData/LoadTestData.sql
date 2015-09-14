PRINT N'Utility'
:r ..\LoadData\Utility_Zona.sql
:r ..\LoadData\Utility_Regione.sql
:r ..\LoadData\Utility_Provincia.sql
:r ..\LoadData\Utility_Comune.sql

PRINT N'Dealer'
:r ..\LoadTestData\Dealer_Canale.sql
:r ..\LoadData\Dealer_CondizioniPagamento.sql
:r ..\LoadData\Dealer_Stato.sql
:r ..\LoadData\Dealer_TipoDealer.sql

PRINT N'Utenti'
:r ..\LoadData\Utenti_CampoDati.sql
:r .\Utenti_Profilo.sql
:r .\Utenti_Utente.sql
:r .\Utenti_Accede.sql
:r .\Utenti_AutorizzazioneCampi.sql
:r .\Utenti_Usa.sql

:r ..\LoadData\Import_AnomalieTipo.sql
:r ..\LoadData\Import_AnomalieMotivazione.sql

PRINT N'Dealer_Usa'
:r ..\LoadData\Dealer_Usa.sql

--Sequenza di creazione di un Dealer

--Tabelle a valori multipli (DropDownList)

PRINT N'Tabelle di apoggio'
:r ..\LoadData\Area_Tipologia.sql
:r ..\LoadData\Area_Operativita.sql
:r ..\LoadData\Area_AreaDiCompetenza.sql
:r ..\LoadData\Catene_TipoRemunerazione.sql
:r .\Negozio_OrarioDiApertura.sql
:r ..\LoadData\Negozio_TipologiaArredo.sql
:r ..\LoadData\Negozio_DimensioneAreaVendita.sql
:r ..\LoadData\Negozio_Cluster.sql
:r ..\LoadData\Negozio_ModelloVendita.sql
:r ..\LoadData\Negozio_GestoreCondiviso.sql
:r ..\LoadData\Disdetta_Richiedente.sql
:r ..\LoadData\Area_SegmentazioneCanale.sql
:r ..\LoadData\DettaglioAgenti_MaterialeEspositivo.sql
:r ..\LoadData\DettaglioAgenti_Dimensionamento.sql


PRINT N'AM-FUNZ'
:r .\Utenti_Funzionario.sql
:r .\Utenti_AreaManager.sql

--Dati Dealer
PRINT N'Creazione Dealer'
:r .\Dealer_Dealer.sql
:r .\Dealer_CanaliDealer.sql

:r .\InfoGenerali_InfoGenerali.sql
:r .\InfoGenerali_InfoCommittenti.sql
:r .\InfoGenerali_InfoPosPod.sql
:r .\InfoGenerali_InfoPoint.sql
:r .\InfoGenerali_InfoAgentiCommittenti.sql
:r .\InfoGenerali_InfoSubAgenti.sql

:r .\Area_Area.sql
:r .\Area_AreaCommittenti.sql
:r .\Area_AreaPosPod.sql
:r .\Area_AreaPoint.sql
:r .\Area_AreaAgentiCommittenti.sql
:r .\Area_AreaSubAgenti.sql

:r .\Negozio_Negozio.sql
:r .\Negozio_Apre.sql
:r .\Negozio_NegozioCommittenti.sql
:r .\Negozio_NegozioPosPod.sql
:r .\Negozio_NegozioPoint.sql
:r .\Negozio_NegozioAgenti.sql
:r .\Negozio_UsaModelloVendita.sql
:r .\Negozio_UsaGestoreCondiviso.sql

:r .\Catene_Catene.sql
:r .\Catene_CatenePosPod.sql

:r .\Vendite_Vendite.sql
:r .\Vendite_VenditeCanali.sql

:r .\Disdetta_Disdetta.sql
:r .\Disdetta_DettaglioDisdetta.sql

:r .\DettaglioAgenti_DettaglioAgenti.sql

:r .\Storico_StoricoCanale.sql
:r .\Storico_StoricoCodice.sql
:r .\Storico_StoricoIndirizzo.sql
