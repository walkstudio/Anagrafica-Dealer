

-- =============================================
-- Author:		Luca Filieri
-- Create date: 11/05/2015
-- =============================================
CREATE PROCEDURE [Utenti].[SP_ProfiloAutorizzazioneCampi_GetAll] @IDProfilo int, @IDTipoDealer int = null
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @tipoDealerIdsTable table (id int)

	IF(@IDTipoDealer is null)
	BEGIN 
		INSERT INTO @tipoDealerIdsTable(id) 
		SELECT IDTipoDealer FROM Dealer.TipoDealer
	END
	ELSE
	BEGIN
		INSERT INTO @tipoDealerIdsTable(id) values (@IDTipoDealer)
	END

	IF(SELECT COUNT(*) FROM Utenti.Usa WHERE IDProfilo = @IDProfilo) > 0 
	BEGIN
		SELECT DISTINCT Utenti.AutorizzazioneCampi.IDCampoDati, Utenti.CampoDati.NomeCampo, Utenti.CampoDati.NomeTabella, Utenti.CampoDati.PermessoModificabile, 
			Utenti.AutorizzazioneCampi.Autorizzazione, Utenti.AutorizzazioneCampi.IDAutorizzazioneCampi, TipoWebControl, COALESCE(NomeCampoFrontEnd, NomeCampo) AS NomeCampoFrontEnd
		FROM Utenti.AutorizzazioneCampi INNER JOIN
			Utenti.CampoDati ON Utenti.AutorizzazioneCampi.IDCampoDati = Utenti.CampoDati.IDCampoDati INNER JOIN
			Utenti.Usa AS UtentiUsa ON Utenti.AutorizzazioneCampi.IDAutorizzazioneCampi = UtentiUsa.IDAutorizzazioneCampi INNER JOIN 
			Dealer.Usa AS DealerUsa ON DealerUsa.IDCampoDati = Utenti.CampoDati.IDCampoDati 
		WHERE UtentiUsa.IDProfilo = @IDProfilo AND DealerUsa.IDTipoDealer IN (SELECT id FROM @tipoDealerIdsTable)
		ORDER BY NomeTabella, NomeCampo
	END
	ELSE
	BEGIN
		SELECT IDCampoDati, NomeCampo, NomeTabella, PermessoModificabile, PermessoDiDefault AS Autorizzazione, 0 AS IDAutorizzazioneCampi, TipoWebControl, COALESCE(NomeCampoFrontEnd, NomeCampo) AS NomeCampoFrontEnd
		FROM Utenti.CampoDati
		ORDER BY NomeTabella, NomeCampo
	END
	
END