

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 06/07/2015
-- =============================================
CREATE PROCEDURE [Negozio].[SP_ModelloVendita_GetAll] 
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT IDModelloVendita,ModelloVendita
	FROM Negozio.ModelloVendita
	where Attivo=1
	
END