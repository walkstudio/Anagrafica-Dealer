-- =============================================
-- Author:		Diego Fronda
-- Create date: 21/05/2015
-- =============================================

CREATE PROCEDURE [Dealer].[SP_DealerBusiness_Update] @IDDealerBusiness int, @Codice nchar(11), @Nome nvarchar(75),
@Indirizzo nvarchar(75)

AS
	BEGIN
	SET XACT_ABORT ON 
	BEGIN TRANSACTION
	SET NOCOUNT ON;
	
		BEGIN 

				UPDATE  Dealer.DealerBusiness SET Nome=@Nome,			                       
										  Indirizzo=@Indirizzo,
										  Codice = @Codice

				                    where IDDealerBusiness=@IDDealerBusiness
        END
    COMMIT TRANSACTION
END