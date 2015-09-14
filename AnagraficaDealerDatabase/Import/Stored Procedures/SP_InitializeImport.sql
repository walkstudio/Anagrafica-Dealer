CREATE PROCEDURE Import.SP_InitializeImport
	@IDImportazione INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

    -- Stato 1: Importing
	-- Stato 2: Imported OK
	-- Stato 3: Imported with Scarti
	-- Stato 4: Imported with Anomalie
	-- Stato 5: IMported with Scarti and Anomalie

	INSERT INTO Import.Importazioni ( DataImportazione, Stato, AnagraficheAggiornate, AnagraficheScartate, ExportScarti, ExportAnomalie )
		VALUES( GETDATE(), 1, 0, 0, 0, 0 )

	SET @IDImportazione = SCOPE_IDENTITY()
END