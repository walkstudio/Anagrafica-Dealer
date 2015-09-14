


-- =============================================
-- Author:		Luca Filieri
-- Create date: 11/05/2015
-- =============================================
CREATE PROCEDURE [Utenti].[SP_AutorizzazioneCampi_Get] @IDProfilo int, @IDDealer int = 0
--, @IDTipoDealer int = null
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @tipoDealerIdsTable table (id int)
	DECLARE @IDTipoDealer int
	--DECLARE @OrderBy varchar(50)


	IF(@IDDealer = 0)
	BEGIN
		INSERT INTO @tipoDealerIdsTable(id) 
		SELECT IDTipoDealer FROM Dealer.TipoDealer
		--SET @OrderBy = 'NomeTabella, NomeCampo'
	END
	ELSE
	BEGIN
		SELECT @IDTipoDealer = Dealer.Dealer.IDTipoDealer FROM Dealer.Dealer WHERE Dealer.IDDealer = @IDDealer
		INSERT INTO @tipoDealerIdsTable(id) VALUES (@IDTipoDealer)
		--SET @OrderBy = 'NomeTabella, Ordinamento, NomeCampo'
	END

	IF(SELECT COUNT(*) FROM Utenti.Usa WHERE IDProfilo = @IDProfilo) > 0
	BEGIN
		IF(@IDDealer = 0)
		BEGIN
			SELECT DISTINCT Utenti.AutorizzazioneCampi.IDCampoDati, Utenti.CampoDati.NomeCampo, Utenti.CampoDati.NomeTabella, Utenti.CampoDati.PermessoModificabile, 
				Utenti.AutorizzazioneCampi.Autorizzazione, Utenti.AutorizzazioneCampi.IDAutorizzazioneCampi, TipoWebControl, COALESCE(NomeCampoFrontEnd, NomeCampo) AS NomeCampoFrontEnd, TipoDato, LunghezzaMassima, Ordinamento
			FROM Utenti.AutorizzazioneCampi INNER JOIN
				Utenti.CampoDati ON Utenti.AutorizzazioneCampi.IDCampoDati = Utenti.CampoDati.IDCampoDati INNER JOIN
				Utenti.Usa AS UtentiUsa ON Utenti.AutorizzazioneCampi.IDAutorizzazioneCampi = UtentiUsa.IDAutorizzazioneCampi INNER JOIN 
				Dealer.Usa AS DealerUsa ON DealerUsa.IDCampoDati = Utenti.CampoDati.IDCampoDati 
			WHERE UtentiUsa.IDProfilo = @IDProfilo AND DealerUsa.IDTipoDealer IN (SELECT id FROM @tipoDealerIdsTable)
			ORDER BY NomeTabella, NomeCampoFrontEnd
		END
		ELSE
		BEGIN
			SELECT DISTINCT Utenti.AutorizzazioneCampi.IDCampoDati, Utenti.CampoDati.NomeCampo, Utenti.CampoDati.NomeTabella, Utenti.CampoDati.PermessoModificabile, 
				Utenti.AutorizzazioneCampi.Autorizzazione, Utenti.AutorizzazioneCampi.IDAutorizzazioneCampi, TipoWebControl, COALESCE(NomeCampoFrontEnd, NomeCampo) AS NomeCampoFrontEnd, TipoDato, LunghezzaMassima, Ordinamento
			FROM Utenti.AutorizzazioneCampi INNER JOIN
				Utenti.CampoDati ON Utenti.AutorizzazioneCampi.IDCampoDati = Utenti.CampoDati.IDCampoDati INNER JOIN
				Utenti.Usa AS UtentiUsa ON Utenti.AutorizzazioneCampi.IDAutorizzazioneCampi = UtentiUsa.IDAutorizzazioneCampi INNER JOIN 
				Dealer.Usa AS DealerUsa ON DealerUsa.IDCampoDati = Utenti.CampoDati.IDCampoDati 
			WHERE UtentiUsa.IDProfilo = @IDProfilo AND DealerUsa.IDTipoDealer IN (SELECT id FROM @tipoDealerIdsTable)
			ORDER BY NomeTabella, Ordinamento, NomeCampoFrontEnd
		END
	END
	ELSE
	BEGIN
		SELECT IDCampoDati, NomeCampo, NomeTabella, PermessoModificabile, PermessoDiDefault AS Autorizzazione, 0 AS IDAutorizzazioneCampi, TipoWebControl, COALESCE(NomeCampoFrontEnd, NomeCampo) AS NomeCampoFrontEnd, TipoDato, LunghezzaMassima, Ordinamento
		FROM Utenti.CampoDati
		ORDER BY NomeTabella, NomeCampoFrontEnd
	END
	
END