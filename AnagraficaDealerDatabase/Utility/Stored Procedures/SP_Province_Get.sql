

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 11/06/2015
-- =============================================
CREATE PROCEDURE [Utility].[SP_Province_Get] 
@IDRegione varchar(30)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @where varchar(200);
	declare @strSQL varchar(max);
	DECLARE @ElementValue int;
	declare @currentRow int;
	set @currentRow=1;
	set @where = '1=1';

	if(@IDRegione<>'' and @IDRegione<>'0')
	BEGIN
		DECLARE zone_cursor CURSOR FOR 
		Select ElementValue from Utility.Split(';',@IDRegione)

		set @where = 'P.IDRegione in (';

		OPEN zone_cursor;
		FETCH NEXT FROM zone_cursor
		INTO @ElementValue

		WHILE @@FETCH_STATUS = 0
			BEGIN

				set @where = @where + convert(varchar(2), @ElementValue)
				if(@currentRow<@@CURSOR_ROWS)
					set @where =  @where + ','

				set @currentRow = @currentRow+1
				FETCH NEXT from zone_cursor
				INTO @ElementValue
			END
	
			CLOSE zone_cursor;
			DEALLOCATE zone_cursor;
	
		set @where = @where +')'
	END
	
	--set @where = 'P.IDZona = ' + convert(varchar(10),@IDZona)
    
	

	set @strSQL = 'select P.IDProvincia, concat(P.Sigla,'' - '',P.Nome) as Nome from Utility.Provincia P where ' +  @where + ' order by Nome'

	exec(@strSQL);

END