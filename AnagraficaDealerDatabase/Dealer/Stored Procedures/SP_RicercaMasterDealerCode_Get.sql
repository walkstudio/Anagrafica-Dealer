


-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 09/07/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_RicercaMasterDealerCode_Get]
@DealerCode varchar(11)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT distinct top 8 Codice FROM [AnagraficaDealer].[Dealer].[View_Point] where Codice LIKE '%'+@DealerCode+'%' Order by Codice 

END