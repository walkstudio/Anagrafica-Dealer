


-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 08/07/2015
-- =============================================
CREATE PROCEDURE [Negozio].[SP_Cluster_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT IDCluster,Cluster
	FROM Negozio.Cluster
	where Attivo=1
	
END