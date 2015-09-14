CREATE TABLE [Import].[Importazioni] (
    [IDImportazione]        INT      IDENTITY (1, 1) NOT NULL,
    [DataImportazione]      DATETIME NOT NULL,
    [Stato]                 INT      NOT NULL,
    [AnagraficheAggiornate] INT      NOT NULL,
    [AnagraficheScartate]   INT      NOT NULL,
    [ExportScarti]          BIT      CONSTRAINT [DF_Importazioni_ExportScarti] DEFAULT ((0)) NOT NULL,
    [ExportAnomalie]        BIT      CONSTRAINT [DF_Importazioni_ExportAnomalie] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Importazioni] PRIMARY KEY CLUSTERED ([IDImportazione] ASC)
);





