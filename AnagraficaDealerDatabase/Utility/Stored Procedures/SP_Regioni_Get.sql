

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 10/06/2015
-- =============================================
CREATE PROCEDURE [Utility].[SP_Regioni_Get] 
@IDZona varchar(30)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @where varchar(200);
	declare @strSQL varchar(max);
	DECLARE @ElementValue int;
	declare @currentRow int;
	set @currentRow=1;
	set @where = '1=1';

	if(@IDZona<>'' and @IDZona<>'0')
	BEGIN
		DECLARE zone_cursor CURSOR FOR 
		Select ElementValue from Utility.Split(';',@IDZona)

		set @where = 'p.IDZona in (';

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


	set @strSQL = 'SELECT Distinct(R.Nome),R.IDRegione
	FROM Utility.Regione R join Utility.Provincia P on R.IDRegione = P.IDRegione 
	Where ' + @where + ' group by R.IDRegione,R.Nome'

	exec(@strSQL);

END