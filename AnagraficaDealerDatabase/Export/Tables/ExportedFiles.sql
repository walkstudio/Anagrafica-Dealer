CREATE TABLE [Export].[ExportedFiles] (
    [IDExportedFile] INT            IDENTITY (1, 1) NOT NULL,
    [FilePath]       NVARCHAR (250) NOT NULL,
    [FileName]       NVARCHAR (50)  NOT NULL,
    [FileType]       TINYINT        NOT NULL,
    [DataExport]     DATETIME       NOT NULL,
    [IDImportazione] INT            NULL,
    CONSTRAINT [PK_ExportedFiles] PRIMARY KEY CLUSTERED ([IDExportedFile] ASC)
);

