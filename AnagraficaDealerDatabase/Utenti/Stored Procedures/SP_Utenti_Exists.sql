-- =============================================
-- Author:		Diego Fronda
-- Create date: 08/05/2015
-- =============================================

CREATE PROCEDURE [Utenti].[SP_Utenti_Exists] @UserID nvarchar(50), @Esiste bit output
AS
	BEGIN
	SET NOCOUNT ON;
	Set @Esiste = (SELECT COUNT(*) As Esiste
						FROM Utenti.Utente(nolock) 
							WHERE UserID = @UserID)
	END