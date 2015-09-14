
-- ============================================= 
-- Author:              Diego Fronda 
-- Create date: 08/05/2015 
-- ============================================= 
CREATE PROCEDURE [Utenti].[SP_Utenti_Get] @IDUtente int 
AS 
BEGIN 
        
        SET NOCOUNT ON; 

    
        SELECT IDUtente, 
                        U.Nome, 
                        Cognome,					
						Email,
						UserID,
						P.IDProfilo
                        
        FROM Utenti.Utente as U (nolock) 
		inner join Utenti.Profilo AS P on U.IDProfilo = P.IDProfilo
        WHERE IDUtente = @IDUtente 

END