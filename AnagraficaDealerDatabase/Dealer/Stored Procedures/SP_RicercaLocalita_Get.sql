

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 08/07/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_RicercaLocalita_Get] 
@Localita varchar(50),
@Provincia varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	declare @query varchar(max)
	set @query= 'select distinct top 8 Localita
	from
		Vendite.Vendite
	where
		Localita LIKE ''%'+@Localita+'%''
		AND
		IDProvincia in ('+@Provincia+')
		order by  Localita'

		exec (@query)
END