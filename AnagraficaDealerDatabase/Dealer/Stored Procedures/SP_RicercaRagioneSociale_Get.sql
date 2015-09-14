

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 18/06/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_RicercaRagioneSociale_Get]
@RagioneSociale varchar(11)
AS
BEGIN
	SET NOCOUNT ON;
	select top 8 (isnull(VV.Nome1,'') + ' ' + isnull(VVC.Nome2,'')) AS RagioneSociale
	from
		Vendite.Vendite VV (nolock) join Vendite.VenditeCanali VVC (nolock) 
		on VV.IDDealer = VVC.IDDealer
	where
		concat(VV.Nome1,' ',VVC.Nome2) LIKE '%' + @RagioneSociale + '%' 
		order by  RagioneSociale
	--SELECT TOP 8 Codice from Dealer.Dealer where Codice LIKE @DealerCode+'%' Order by Codice 

END