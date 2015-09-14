

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 10/06/2015
-- =============================================
CREATE PROCEDURE [Utility].[SP_AreaManager_GetAll] 
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT IDAreaManager,Nome
	FROM Utenti.AreaManager 
	
END