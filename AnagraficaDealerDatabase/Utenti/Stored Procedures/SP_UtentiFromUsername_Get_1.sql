

-- ============================================= 
-- Author:              Gabriele Oberti
-- Create date: 24/06/2015 
-- ============================================= 
Create PROCEDURE [Utenti].[SP_UtentiFromUsername_Get] @Username nvarchar(50) 
AS 
BEGIN 
        
        SET NOCOUNT ON; 

    
        SELECT IDUtente as IDUsername, 
                        U.Nome, 
                        Cognome,
						UserID,
						EMail,
						P.IDProfilo,
						p.NomeProfilo,
						P.ArchivioDataBase,
						p.ArchivioCruscotto,
						p.ReportAnomalie,
						p.ReportScarti,
						p.Portafoglio,
						p.Amministrazione,
						p.RagioniSocialiCorrelate,
						p.Eccezioni
                        
        FROM Utenti.Utente as U (nolock) 
		inner join Utenti.Profilo AS P (nolock) on U.IDProfilo = P.IDProfilo
        WHERE U.UserID = @Username and Attivo = 1 

END