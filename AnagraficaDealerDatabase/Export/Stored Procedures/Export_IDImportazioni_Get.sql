-- =============================================
-- Author:		Gabriele Oberti
-- Create date: 08/06/2015

-- =============================================
CREATE PROCEDURE Export.Export_IDImportazioni_Get @ExportType tinyint 
AS 
BEGIN
	
	SET NOCOUNT ON;

    IF(@ExportType = 2)
		BEGIN
			SELECT IDImportazione
			From Import.Importazioni
			WHERE ExportScarti = 0
		END
	ELSE  IF(@ExportType = 3)
		BEGIN
			SELECT IDImportazione
			From Import.Importazioni
			WHERE ExportAnomalie = 0
		END

END