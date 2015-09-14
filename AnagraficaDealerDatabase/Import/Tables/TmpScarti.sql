CREATE TABLE [Import].[TmpScarti] (
    [IDTmpScarti]    INT            IDENTITY (1, 1) NOT NULL,
    [IDImportazione] INT            NULL,
    [CodiceDealer]   NVARCHAR (11)  NULL,
    [IDTipoDealer]   INT            NULL,
    [Errori]         NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_TmpScarti] PRIMARY KEY CLUSTERED ([IDTmpScarti] ASC),
    CONSTRAINT [FK_TmpScarti_Importazioni] FOREIGN KEY ([IDImportazione]) REFERENCES [Import].[Importazioni] ([IDImportazione]),
    CONSTRAINT [FK_TmpScarti_TipoDealer] FOREIGN KEY ([IDTipoDealer]) REFERENCES [Dealer].[TipoDealer] ([IDTipoDealer])
);





