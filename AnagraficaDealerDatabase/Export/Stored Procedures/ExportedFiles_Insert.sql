-- =============================================
-- Author:		Gabriele Oberti08/06/2015<Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Export].[ExportedFiles_Insert] @FilePath nvarchar(250), @FileName nvarchar(50), @FileType tinyint, @IDImportazione int
AS
BEGIN

	SET NOCOUNT ON;
	SET XACT_ABORT ON
	BEGIN TRANSACTION

	If RIGHT(@FilePath,'1') <> '/' 
		SET @FilePath = @FilePath + '/' + cast(year(getdate()) as varchar(4)) + '/'
	Else
		SET @FilePath = @FilePath + cast(year(getdate()) as varchar(4)) + '/'
	
			INSERT INTO Export.ExportedFiles
					  (FilePath
					  ,[FileName]
					  ,FileType
					  ,DataExport
					  ,IDImportazione)
				VALUES
					  (@FilePath
					  ,@FileName
					  ,@FileType
					  ,getDate()
					  ,@IDImportazione)


				IF(@FileType = 2)
				BEGIN
						UPDATE [Import].[Importazioni]
									  SET [ExportScarti] = 1
									  WHERE IDImportazione = @IDImportazione
				END
				ELSE IF (@FileType = 3)
				BEGIN
						UPDATE [Import].[Importazioni]
									  SET [ExportAnomalie] = 1
										WHERE IDImportazione = @IDImportazione
				END
		
	COMMIT TRANSACTION

END