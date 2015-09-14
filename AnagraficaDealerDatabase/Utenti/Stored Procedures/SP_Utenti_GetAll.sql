
-- ============================================= 
-- Author:              Diego Fronda  
-- Create date: 08/05/2015 
-- ============================================= 
CREATE PROCEDURE [Utenti].[SP_Utenti_GetAll] 
AS 
BEGIN 
        
        SET NOCOUNT ON; 

    
        SELECT          U.IDUtente, 
                        U.Nome, 
                        Cognome,
						Email,
						UserID,
						P.IDProfilo,
						P.NomeProfilo,
						U.Attivo			
			
						 
                        
        FROM Utenti.Utente as U(nolock) 
		inner join Utenti.Profilo (nolock) AS P on U.IDProfilo = P.IDProfilo
		where IDUtente <> 0

END