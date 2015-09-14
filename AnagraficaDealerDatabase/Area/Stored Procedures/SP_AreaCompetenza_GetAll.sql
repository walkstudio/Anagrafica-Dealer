

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 08/07/2015
-- =============================================
CREATE PROCEDURE [Area].[SP_AreaCompetenza_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT IDAreaDiCompetenza,NomeArea
	FROM Area.AreaDiCompetenza
	where Attivo=1
	
END