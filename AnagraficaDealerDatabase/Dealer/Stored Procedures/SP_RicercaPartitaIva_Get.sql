


-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 22/06/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_RicercaPartitaIva_Get]
@PartitaIva varchar(11)
AS
BEGIN
	SET NOCOUNT ON;
	select top 8 PIVA
	from
		Dealer.Dealer
	where
		PIVA LIKE '%'+@PartitaIva+'%' 
		order by  PIVA

END