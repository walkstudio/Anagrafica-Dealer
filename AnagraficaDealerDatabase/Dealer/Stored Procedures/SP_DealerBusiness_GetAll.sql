

-- =============================================
-- Author:		Diego Fronda
-- Create date: 17/05/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_DealerBusiness_GetAll] 
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT      Dealer.DealerBusiness.IDDealerBusiness,Dealer.DealerBusiness.Codice,Dealer.DealerBusiness.Nome,Dealer.DealerBusiness.Indirizzo
	FROM        Dealer.DealerBusiness(nolock) 
	
END