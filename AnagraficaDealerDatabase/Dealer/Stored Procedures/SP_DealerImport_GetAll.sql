

-- =============================================
-- Author:		Diego Fronda
-- Create date: 12/05/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_DealerImport_GetAll] 
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT      Import.EccezioniImport.Codice
	FROM        Import.EccezioniImport (nolock) 
   
END