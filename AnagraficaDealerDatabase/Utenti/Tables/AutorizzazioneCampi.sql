CREATE TABLE [Utenti].[AutorizzazioneCampi] (
    [IDAutorizzazioneCampi] INT IDENTITY (1, 1) NOT NULL,
    [Autorizzazione]        INT NOT NULL,
    [IDCampoDati]           INT NOT NULL,
    CONSTRAINT [PK_AutorizzazioneCampi] PRIMARY KEY CLUSTERED ([IDAutorizzazioneCampi] ASC),
    CONSTRAINT [FK_Controlla_CampoDati] FOREIGN KEY ([IDCampoDati]) REFERENCES [Utenti].[CampoDati] ([IDCampoDati])
);



