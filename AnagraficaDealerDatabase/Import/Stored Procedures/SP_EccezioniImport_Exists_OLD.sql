-- =============================================
-- Author:		Diego Fronda
-- Create date: 13/05/2015
-- =============================================

CREATE PROCEDURE [Import].[SP_EccezioniImport_Exists_OLD] @Codice nvarchar(50), @IDDealer int Output

AS
	BEGIN
	
	SET NOCOUNT ON;


		IF((SELECT Count(*) from Dealer.Dealer (nolock) WHERE @Codice = Codice)=0)
		set @IDDealer = (Select IDDealer from Dealer.Dealer (nolock) WHERE @Codice = Codice)
		Else
		set @IDDealer = 0
				
                
	
END