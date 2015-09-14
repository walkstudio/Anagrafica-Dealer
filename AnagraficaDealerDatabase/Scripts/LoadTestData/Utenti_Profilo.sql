USE [AnagraficaDealer]
GO

DECLARE @IDProfilo int;
DECLARE @inserted_ids TABLE ([id] INT);

--------------------------------------------------------------
--Creo il profilo
INSERT INTO Utenti.Profilo (NomeProfilo,ArchivioDataBase,ArchivioCruscotto,ReportAnomalie,ReportScarti,Amministrazione,Portafoglio,RagioniSocialiCorrelate,Eccezioni)
		VALUES ('Sistema', 1, 1, 1, 1, 1, 1, 2, 1 )

SET @IDProfilo = (SELECT SCOPE_IDENTITY())
		
--Replico i permessi di accesso ai campi dalla Table Utenti.CampoDati alla Table Utenti.AutorizzazioneCampi
INSERT INTO Utenti.AutorizzazioneCampi (IDCampoDati, Autorizzazione)
	OUTPUT inserted.IDAutorizzazioneCampi INTO @inserted_ids
	SELECT IDCampoDati, PermessoDiDefault 
		FROM Utenti.CampoDati

--Creo le associazioni fra i record inseriti nella Table Utenti.AutorizzazioneCampi e la Table Utenti.Usa
INSERT INTO Utenti.Usa (IDProfilo, IDAutorizzazioneCampi)
	SELECT @IDProfilo, id from @inserted_ids

DELETE FROM @inserted_ids;

---------------------------------------------------------------
--Creo il profilo
INSERT INTO Utenti.Profilo (NomeProfilo,ArchivioDataBase,ArchivioCruscotto,ReportAnomalie,ReportScarti,Amministrazione,Portafoglio,RagioniSocialiCorrelate,Eccezioni)
		VALUES ('Profilo1_Test', 1, 1, 1, 1, 1, 1, 2, 1 )

SET @IDProfilo = (SELECT SCOPE_IDENTITY())
		
--Replico i permessi di accesso ai campi dalla Table Utenti.CampoDati alla Table Utenti.AutorizzazioneCampi
INSERT INTO Utenti.AutorizzazioneCampi (IDCampoDati, Autorizzazione)
	OUTPUT inserted.IDAutorizzazioneCampi INTO @inserted_ids
	SELECT IDCampoDati, PermessoDiDefault 
		FROM Utenti.CampoDati

--Creo le associazioni fra i record inseriti nella Table Utenti.AutorizzazioneCampi e la Table Utenti.Usa
INSERT INTO Utenti.Usa (IDProfilo, IDAutorizzazioneCampi)
	SELECT @IDProfilo, id from @inserted_ids

DELETE FROM @inserted_ids;

---------------------------------------------------------------
--Creo il profilo
INSERT INTO Utenti.Profilo (NomeProfilo,ArchivioDataBase,ArchivioCruscotto,ReportAnomalie,ReportScarti,Amministrazione,Portafoglio,RagioniSocialiCorrelate,Eccezioni)
		VALUES ('Profilo2_Test', 0, 0, 0, 0, 0, 0, 1, 0 )

SET @IDProfilo = (SELECT SCOPE_IDENTITY())
		
--Replico i permessi di accesso ai campi dalla Table Utenti.CampoDati alla Table Utenti.AutorizzazioneCampi
INSERT INTO Utenti.AutorizzazioneCampi (IDCampoDati, Autorizzazione)
	OUTPUT inserted.IDAutorizzazioneCampi INTO @inserted_ids
	SELECT IDCampoDati, PermessoDiDefault 
		FROM Utenti.CampoDati

--Creo le associazioni fra i record inseriti nella Table Utenti.AutorizzazioneCampi e la Table Utenti.Usa
INSERT INTO Utenti.Usa (IDProfilo, IDAutorizzazioneCampi)
	SELECT @IDProfilo, id from @inserted_ids

DELETE FROM @inserted_ids;

---------------------------------------------------------------
--Creo il profilo
INSERT INTO Utenti.Profilo (NomeProfilo,ArchivioDataBase,ArchivioCruscotto,ReportAnomalie,ReportScarti,Amministrazione,Portafoglio,RagioniSocialiCorrelate,Eccezioni)
		VALUES ('Profilo3_Test', 0, 0, 0, 0, 1, 1, 1, 1 )

SET @IDProfilo = (SELECT SCOPE_IDENTITY())
		
--Replico i permessi di accesso ai campi dalla Table Utenti.CampoDati alla Table Utenti.AutorizzazioneCampi
INSERT INTO Utenti.AutorizzazioneCampi (IDCampoDati, Autorizzazione)
	OUTPUT inserted.IDAutorizzazioneCampi INTO @inserted_ids
	SELECT IDCampoDati, PermessoDiDefault 
		FROM Utenti.CampoDati

--Creo le associazioni fra i record inseriti nella Table Utenti.AutorizzazioneCampi e la Table Utenti.Usa
INSERT INTO Utenti.Usa (IDProfilo, IDAutorizzazioneCampi)
	SELECT @IDProfilo, id from @inserted_ids

DELETE FROM @inserted_ids;

---------------------------------------------------------------