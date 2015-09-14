-- =============================================
-- Author:		Matteo Ferrara
-- Create date: 19/06/2015
-- =============================================

CREATE PROCEDURE [Utility].[SP_ArchivioRicerca_Insert] 
@Utente nvarchar(30), 
@Ricerca as xml
AS
	BEGIN
	SET XACT_ABORT ON 
	BEGIN TRANSACTION
	SET NOCOUNT ON;

	Delete from Utility.ArchivioRicerca Where Utente = @Utente

	INSERT INTO Utility.ArchivioRicerca(Utente,Ricerca) values(@Utente, @Ricerca)
			
	COMMIT TRANSACTION


END