CREATE TABLE [Utenti].[Accede] (
    [IDProfilo]    INT NOT NULL,
    [IDTipoDealer] INT NOT NULL,
    CONSTRAINT [PK_Accede] PRIMARY KEY CLUSTERED ([IDProfilo] ASC, [IDTipoDealer] ASC),
    CONSTRAINT [FK_Accede_Profilo] FOREIGN KEY ([IDProfilo]) REFERENCES [Utenti].[Profilo] ([IDProfilo]),
    CONSTRAINT [FK_Accede_TipoDealer] FOREIGN KEY ([IDTipoDealer]) REFERENCES [Dealer].[TipoDealer] ([IDTipoDealer])
);



