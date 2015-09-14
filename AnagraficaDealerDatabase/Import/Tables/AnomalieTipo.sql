CREATE TABLE [Import].[AnomalieTipo] (
    [IDTipoAnomalia] INT           IDENTITY (1, 1) NOT NULL,
    [NomeTipo]       NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_AnomalieTipo] PRIMARY KEY CLUSTERED ([IDTipoAnomalia] ASC)
);





