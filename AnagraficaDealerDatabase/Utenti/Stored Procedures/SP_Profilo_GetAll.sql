

-- =============================================
-- Author:		Luca Filieri
-- Create date: 08/05/2015
-- =============================================
CREATE PROCEDURE [Utenti].[SP_Profilo_GetAll]
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
	where IDProfilo <> 0
END