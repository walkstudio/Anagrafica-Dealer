

-- =============================================
-- Author:		Diego Fronda
-- Create date: 13/05/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_DealerImport_Delete] @Codice nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

    
	Delete from Import.EccezioniImport where Codice = @Codice 
END