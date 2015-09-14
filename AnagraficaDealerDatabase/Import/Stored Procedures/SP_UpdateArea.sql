CREATE PROCEDURE [Import].[SP_UpdateArea]
	@Nome NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Area.AreaDiCompetenza( NomeArea, Attivo )
		VALUES ( @Nome, 1 )

END