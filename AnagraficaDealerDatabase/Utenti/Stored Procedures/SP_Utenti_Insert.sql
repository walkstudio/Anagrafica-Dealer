-- =============================================
-- Author:		Diego Fronda
-- Create date: 08/05/2015
-- =============================================

CREATE PROCEDURE [Utenti].[SP_Utenti_Insert] @Nome nvarchar(50), @Cognome nvarchar(50),
@Email nvarchar(50),@UserID nvarchar(50), @IDProfilo int,@Attivo bit, @IDUtente int OUTPUT, @Esiste bit OUTPUT

AS
	BEGIN
	SET XACT_ABORT ON 
	BEGIN TRANSACTION
	SET NOCOUNT ON;
	exec Utenti.SP_Utenti_Exists @UserID,@Esiste OUTPUT
		IF @Esiste = 0
			BEGIN
				INSERT INTO Utenti.Utente (UserID, Nome, Cognome, Email, IDProfilo, Attivo)
			
				VALUES (upper(@UserID), @Nome, @Cognome, @Email, @IDProfilo, 1)
				set @IDUtente = (SELECT SCOPE_IDENTITY())
			END

	COMMIT TRANSACTION


END