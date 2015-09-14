

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 11/06/2015
-- =============================================
CREATE PROCEDURE [Import].[SP_Funzionario_GetAll] 
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT IDFunzionario,Nome
	FROM Import.Funzionario
	
END