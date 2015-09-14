

-- =============================================
-- Author:		Diego Fronda
-- Create date: 21/05/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_DealerBusiness_Get] @IDDealerBusiness int
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT      Dealer.DealerBusiness.IDDealerBusiness,Dealer.DealerBusiness.Codice,Dealer.DealerBusiness.Nome,Dealer.DealerBusiness.Indirizzo
	FROM        Dealer.DealerBusiness(nolock) 
	Where       IDDealerBusiness = @IDDealerBusiness	
END