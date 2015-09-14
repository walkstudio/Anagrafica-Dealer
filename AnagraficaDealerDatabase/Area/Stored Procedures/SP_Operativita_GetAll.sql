

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 11/06/2015
-- =============================================
CREATE PROCEDURE [Area].[SP_Operativita_GetAll] 
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT IDOperativita,Operativita
	FROM Area.Operativita 
	
END