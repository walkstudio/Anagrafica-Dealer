

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 10/06/2015
-- =============================================
CREATE PROCEDURE [Utility].[SP_Zone_GetAll] 
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT IDZona,Nome
	FROM Utility.Zona 
	ORDER BY Nome ASC
	
END