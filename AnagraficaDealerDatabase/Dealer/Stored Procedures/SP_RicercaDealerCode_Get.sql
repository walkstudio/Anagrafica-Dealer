



-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 10/06/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_RicercaDealerCode_Get]
@DealerCode varchar(11)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Distinct TOP 8 Codice from Dealer.Dealer where Codice LIKE @DealerCode + '%' Order by Codice 

END