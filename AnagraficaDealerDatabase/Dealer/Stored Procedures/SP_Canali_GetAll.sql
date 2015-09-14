

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 10/06/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_Canali_GetAll] 
@TipoDealer nvarchar(10)
AS
BEGIN
	
	SET NOCOUNT ON;
	declare @query nvarchar(max)
	set @query = 'SELECT Distinct(C.IDCanale),C.DescrizioneCanale as NomeCanale
	FROM Dealer.Canale C inner join Dealer.CanaliTipoDealer CTD on C.IDCanale = CTD.IDCanale
	where CTD.IDTipoDealer in ('+@TipoDealer+')
	Group BY C.IDCanale,C.DescrizioneCanale
	ORDER BY DescrizioneCanale ASC'
	exec (@query)
	
END