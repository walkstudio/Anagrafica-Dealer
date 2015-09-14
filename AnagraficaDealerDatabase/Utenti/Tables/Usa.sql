CREATE TABLE [Utenti].[Usa] (
    [IDProfilo]             INT NOT NULL,
    [IDAutorizzazioneCampi] INT NOT NULL,
    CONSTRAINT [PK_Usa] PRIMARY KEY CLUSTERED ([IDProfilo] ASC, [IDAutorizzazioneCampi] ASC),
    CONSTRAINT [FK_Usa_AutorizzazioneCampi] FOREIGN KEY ([IDAutorizzazioneCampi]) REFERENCES [Utenti].[AutorizzazioneCampi] ([IDAutorizzazioneCampi]),
    CONSTRAINT [FK_Usa_Profilo] FOREIGN KEY ([IDProfilo]) REFERENCES [Utenti].[Profilo] ([IDProfilo])
);



