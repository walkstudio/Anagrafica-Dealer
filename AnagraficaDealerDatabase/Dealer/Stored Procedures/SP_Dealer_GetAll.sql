

-- =============================================
-- Author:		Gabriele Oberti
-- Create date: 18/05/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_Dealer_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;

    
	
        SELECT IDDealer, 
				Codice, 
				Indirizzo, 
				PIVA, 
				Telefono, 
				Fax, 
				D.IDTipoDealer,
				NomeTipoDealer, 
				IDUtente, 
				D.IDStato,
				NomeStato
		FROM Dealer.Dealer D (nolock) INNER JOIN Dealer.TipoDealer TD (nolock) ON d.IDTipoDealer = TD.IDTipoDealer
										INNER JOIN Dealer.Stato S (nolock) ON D.IDStato = S.IDStato

END