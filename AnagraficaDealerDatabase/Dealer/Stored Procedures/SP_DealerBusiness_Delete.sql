

-- =============================================
-- Author:		Diego Fronda
-- Create date: 19/05/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_DealerBusiness_Delete] @IDDealerBusiness int
AS
BEGIN
	
	SET NOCOUNT ON;

    
	Delete from Dealer.DealerBusiness where IDDealerBusiness= @IDDealerBusiness
END