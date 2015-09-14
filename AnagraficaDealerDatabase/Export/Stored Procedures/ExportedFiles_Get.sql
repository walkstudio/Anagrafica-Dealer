-- =============================================
-- Author:		Gabriele Oberti
--				08/06/2015
-- Author:		Diego Fronda
--				09/06/2015
-- =============================================
CREATE PROCEDURE [Export].[ExportedFiles_Get] @FileType tinyint
AS
BEGIN

	SET NOCOUNT ON;
	
	IF(@FileType = 1)
		BEGIN
			SELECT FilePath,[FileName], FileType, DataExport
				FROM   Export.ExportedFiles EF (nolock) 
				WHERE  FileType = @FileType
				ORDER BY DataExport DESC
		END
	ELSE
		BEGIN
			--SELECT FilePath,[FileName], FileType, DataExport, EF.IDImportazione, I.DataImportazione, I.Stato, I.AnagraficheScartate, I.AnagraficheAggiornate
			--		FROM   Export.ExportedFiles EF (nolock) LEFT JOIN Import.Importazioni I (nolock) ON EF.IDImportazione = I.IDImportazione
			--		WHERE  FileType = @FileType
			--		ORDER BY DataExport DESC

			SELECT
					DataImportazione,
					Stato,
					AnagraficheAggiornate,
					AnagraficheScartate,
					EE.FilePath FilePathScarti,
					EE.[FileName] FileNameScarti,
					EEAnomalie.FilePath FilePathAnomalie,
					EEAnomalie.[FileName] FileNameAnomalie
			FROM	Import.Importazioni II (nolock)

						left join Export.ExportedFiles EE (nolock)
						on II.IDImportazione = EE.IDImportazione and EE.FileType = 2
						left join Export.ExportedFiles EEAnomalie (nolock)
						on II.IDImportazione = EEAnomalie.IDImportazione and EEAnomalie.FileType = 3

			ORDER BY DataImportazione desc

		END

	
END