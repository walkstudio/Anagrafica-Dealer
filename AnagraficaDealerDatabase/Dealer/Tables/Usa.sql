CREATE TABLE [Dealer].[Usa] (
    [IDTipoDealer] INT NOT NULL,
    [IDCampoDati]  INT NOT NULL,
    CONSTRAINT [PK_Usa_1] PRIMARY KEY CLUSTERED ([IDTipoDealer] ASC, [IDCampoDati] ASC),
    CONSTRAINT [FK_Usa_CampoDati] FOREIGN KEY ([IDCampoDati]) REFERENCES [Utenti].[CampoDati] ([IDCampoDati]),
    CONSTRAINT [FK_Usa_TipoDealer] FOREIGN KEY ([IDTipoDealer]) REFERENCES [Dealer].[TipoDealer] ([IDTipoDealer])
);

