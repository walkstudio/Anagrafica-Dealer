-- =============================================
-- Author:		Diego Fronda
-- Create date: 08/05/2015
-- =============================================

CREATE PROCEDURE [Utenti].[SP_Utenti_Update] @Nome nvarchar(50), @Cognome nvarchar(50),
@Email nvarchar(50), @UserID nvarchar(50), @IDProfilo int, @IDUtente int OUTPUT

AS
	BEGIN
	SET XACT_ABORT ON 
	BEGIN TRANSACTION
	SET NOCOUNT ON;
	
		BEGIN 

				UPDATE  Utenti.Utente SET Email=@Email,			                       
										  IDProfilo=@IDProfilo

				                    where UserID=@UserID
        END
    COMMIT TRANSACTION
END