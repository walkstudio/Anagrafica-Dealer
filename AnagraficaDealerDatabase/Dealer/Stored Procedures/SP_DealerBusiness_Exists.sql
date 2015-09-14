-- =============================================
-- Author:		Diego Fronda
-- Create date: 19/05/2015
-- =============================================

CREATE PROCEDURE [Dealer].[SP_DealerBusiness_Exists] @Codice nvarchar(11),@Esiste bit Output

AS
	BEGIN
	
	SET NOCOUNT ON;
	Set @Esiste = (SELECT COUNT(*) As Esiste
						FROM Dealer.DealerBusiness(nolock) 
							WHERE Codice = @Codice)

		--IF((SELECT Count(*) from Dealer.DealerBusiness (nolock) WHERE @Codice = Codice)=0)
		--set @IDDealerBusiness = 0
		----Else
		--set @IDDealerBusiness = (Select IDDealerBusiness from Dealer.DealerBusiness (nolock) WHERE @Codice = Codice)
				
                
	
END