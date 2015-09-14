CREATE TABLE [Utility].[ExportLista] (
    [IDLista]    INT           IDENTITY (1, 1) NOT NULL,
    [NomeLista]  NCHAR (30)    NOT NULL,
    [QueryLista] VARCHAR (MAX) NOT NULL,
    [Attiva]     BIT           NOT NULL,
    [PathLista]  VARCHAR (255) NULL,
    CONSTRAINT [PK_ExportLista] PRIMARY KEY CLUSTERED ([IDLista] ASC)
);

