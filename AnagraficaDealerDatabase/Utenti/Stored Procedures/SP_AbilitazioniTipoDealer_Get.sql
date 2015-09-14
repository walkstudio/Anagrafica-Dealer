

-- =============================================
-- Author:		Luca Filieri
-- Create date: 11/05/2015
-- =============================================
CREATE PROCEDURE [Utenti].[SP_AbilitazioniTipoDealer_Get] @IDProfilo int
AS
BEGIN

SELECT        Dealer.TipoDealer.IDTipoDealer, Dealer.TipoDealer.NomeTipoDealer
FROM            Utenti.Accede INNER JOIN
                         Dealer.TipoDealer ON Utenti.Accede.IDTipoDealer = Dealer.TipoDealer.IDTipoDealer
WHERE Utenti.Accede.IDProfilo = @IDProfilo
							
		


END