

-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 10/06/2015
-- =============================================
CREATE PROCEDURE [Utility].[SP_SegmentazioneCanale_GetAll] 
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT IDSegmentazioneCanale,SegmentazioneCanale
	FROM Area.SegmentazioneCanale
	where Attivo=1
	
END