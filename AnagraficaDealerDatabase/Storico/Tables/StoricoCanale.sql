CREATE TABLE [Storico].[StoricoCanale] (
    [IDStoricoCanale] INT           IDENTITY (1, 1) NOT NULL,
    [Canale]          NVARCHAR (50) NOT NULL,
    [DataInizio]      DATETIME      NOT NULL,
    [DataFine]        DATETIME      NULL,
    [IDUtente]        INT           NOT NULL,
    [IDDealer]        INT           NOT NULL,
    CONSTRAINT [PK_StoricoCanale] PRIMARY KEY CLUSTERED ([IDStoricoCanale] ASC),
    CONSTRAINT [FK_Cambio Canale_Dealer] FOREIGN KEY ([IDDealer]) REFERENCES [Dealer].[Dealer] ([IDDealer]),
    CONSTRAINT [FK_Modifica_Canale_Utente] FOREIGN KEY ([IDUtente]) REFERENCES [Utenti].[Utente] ([IDUtente])
);



