CREATE PROCEDURE [Dealer].[SP_TipoDealer_GetAll]
@utente nvarchar(50) = null
AS
BEGIN
	
	SET NOCOUNT ON;

    If @utente is not null
		SELECT Dealer.TipoDealer.IDTipoDealer,
				Dealer.TipoDealer.NomeTipoDealer
					FROM Dealer.TipoDealer (nolock) inner join 
					Utenti.Accede (nolock) on Dealer.TipoDealer.IDTipoDealer = Utenti.Accede.IDTipoDealer inner join
					Utenti.Utente (nolock) on Utenti.Accede.IDProfilo = Utenti.Utente.IDProfilo
		where Utenti.Utente.UserID = @utente
	else
		SELECT Dealer.TipoDealer.IDTipoDealer,
				Dealer.TipoDealer.NomeTipoDealer
					FROM Dealer.TipoDealer (nolock)


END