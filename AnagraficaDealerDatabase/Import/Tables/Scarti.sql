CREATE TABLE [Import].[Scarti] (
    [IDScarti]       INT            IDENTITY (1, 1) NOT NULL,
    [IDImportazione] INT            NULL,
    [CodiceDealer]   NVARCHAR (11)  NULL,
    [IDTipoDealer]   INT            NULL,
    [Errori]         NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Scarti] PRIMARY KEY CLUSTERED ([IDScarti] ASC),
    CONSTRAINT [FK_Scarti_Importazioni] FOREIGN KEY ([IDImportazione]) REFERENCES [Import].[Importazioni] ([IDImportazione]),
    CONSTRAINT [FK_Scarti_TipoDealer] FOREIGN KEY ([IDTipoDealer]) REFERENCES [Dealer].[TipoDealer] ([IDTipoDealer])
);









