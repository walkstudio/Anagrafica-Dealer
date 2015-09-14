

-- =============================================
-- Author:		Luca Filieri
-- Create date: 08/05/2015
-- =============================================
CREATE PROCEDURE [Utenti].[SP_Profilo_Get] @IDProfilo int
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT IDProfilo,
			NomeProfilo,
			ArchivioDataBase,
			ArchivioCruscotto,
			ReportAnomalie,
			ReportScarti,
			Amministrazione,
			RagioniSocialiCorrelate,
			Portafoglio,
			Eccezioni
	FROM Utenti.Profilo (nolock)
	WHERE IDProfilo = @IDProfilo

END