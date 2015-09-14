CREATE TABLE [Import].[Anomalie] (
    [IDAnomalia]     INT     IDENTITY (1, 1) NOT NULL,
    [IDTipoAnomalia] TINYINT NOT NULL,
    [IDDealer]       INT     NULL,
    [IDMotivazione]  INT     NOT NULL,
    [IDFunzionario]  INT     NULL,
    [IDImportazione] INT     NOT NULL,
    CONSTRAINT [PK_Import.Anomalie] PRIMARY KEY CLUSTERED ([IDAnomalia] ASC)
);







