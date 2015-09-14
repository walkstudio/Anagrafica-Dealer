

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 11/06/2015
-- =============================================
CREATE PROCEDURE [Utility].[SP_Comuni_Get] 
@IDProvincia varchar(30)
AS
BEGIN
	
	SET NOCOUNT ON;
	declare @where varchar(max);
	if(@IDProvincia='0')
			set @where = ' 1=1 '
	else
		set @where = ' IDProvincia = ' + @IDProvincia 
	exec ('SELECT C.IDComune,C.Nome FROM Utility.Comune C where ' +  @where  + ' Order by C.Nome')


END