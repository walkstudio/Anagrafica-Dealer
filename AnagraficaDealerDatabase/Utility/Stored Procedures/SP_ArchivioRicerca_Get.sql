-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 19/06/2015
-- =============================================

CREATE PROCEDURE [Utility].[SP_ArchivioRicerca_Get] 
@Utente nvarchar(30), 
@Ricerca xml output
AS
	BEGIN
	SET NOCOUNT ON;

	Select @Ricerca = Ricerca from Utility.ArchivioRicerca Where Utente = @Utente


END