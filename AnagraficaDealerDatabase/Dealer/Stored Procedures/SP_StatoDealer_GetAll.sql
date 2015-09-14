

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 10/06/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_StatoDealer_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT IDStato,
			NomeStato
				FROM Dealer.Stato (nolock)
				ORDER BY NomeStato

END