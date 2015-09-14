USE [AnagraficaDealer]
GO

DECLARE @inserted_ids TABLE ([id] INT);

--Replico i permessi di accesso ai campi dalla Table Utenti.CampoDati alla Table Utenti.AutorizzazioneCampi
INSERT INTO Utenti.AutorizzazioneCampi (IDCampoDati, Autorizzazione)
	OUTPUT inserted.IDAutorizzazioneCampi INTO @inserted_ids
	SELECT IDCampoDati, PermessoDiDefault 
		FROM Utenti.CampoDati

--Creo le associazioni fra i record inseriti nella Table Utenti.AutorizzazioneCampi e la Table Utenti.Usa
INSERT INTO Utenti.Usa (IDProfilo, IDAutorizzazioneCampi)
	SELECT 0, id from @inserted_ids

	DELETE FROM @inserted_ids;

	INSERT INTO Utenti.AutorizzazioneCampi (IDCampoDati, Autorizzazione)
	OUTPUT inserted.IDAutorizzazioneCampi INTO @inserted_ids
	SELECT IDCampoDati, PermessoDiDefault 
		FROM Utenti.CampoDati

	--Creo le associazioni fra i record inseriti nella Table Utenti.AutorizzazioneCampi e la Table Utenti.Usa
INSERT INTO Utenti.Usa (IDProfilo, IDAutorizzazioneCampi)
	SELECT 1, id from @inserted_ids

	DELETE FROM @inserted_ids;

	INSERT INTO Utenti.AutorizzazioneCampi (IDCampoDati, Autorizzazione)
	OUTPUT inserted.IDAutorizzazioneCampi INTO @inserted_ids
	SELECT IDCampoDati, PermessoDiDefault 
		FROM Utenti.CampoDati

	--Creo le associazioni fra i record inseriti nella Table Utenti.AutorizzazioneCampi e la Table Utenti.Usa
INSERT INTO Utenti.Usa (IDProfilo, IDAutorizzazioneCampi)
	SELECT 2, id from @inserted_ids

	DELETE FROM @inserted_ids;

	INSERT INTO Utenti.AutorizzazioneCampi (IDCampoDati, Autorizzazione)
	OUTPUT inserted.IDAutorizzazioneCampi INTO @inserted_ids
	SELECT IDCampoDati, PermessoDiDefault 
		FROM Utenti.CampoDati

	--Creo le associazioni fra i record inseriti nella Table Utenti.AutorizzazioneCampi e la Table Utenti.Usa
INSERT INTO Utenti.Usa (IDProfilo, IDAutorizzazioneCampi)
	SELECT 3, id from @inserted_ids

DELETE FROM @inserted_ids;

