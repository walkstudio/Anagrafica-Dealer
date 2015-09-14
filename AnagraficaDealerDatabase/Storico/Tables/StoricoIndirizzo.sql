CREATE TABLE [Storico].[StoricoIndirizzo] (
    [IDStoricoIndirizzo] INT           IDENTITY (1, 1) NOT NULL,
    [Indirizzo]          NVARCHAR (50) NOT NULL,
    [DataInizio]         DATETIME      NOT NULL,
    [DataFine]           DATETIME      NOT NULL,
    [IDUtente]           INT           NOT NULL,
    [IDDealer]           INT           NOT NULL,
    CONSTRAINT [PK_StoricoIndirizzo] PRIMARY KEY CLUSTERED ([IDStoricoIndirizzo] ASC),
    CONSTRAINT [FK_Modifica_Indirizzo_Utente] FOREIGN KEY ([IDUtente]) REFERENCES [Utenti].[Utente] ([IDUtente]),
    CONSTRAINT [FK_Trasloco_Dealer] FOREIGN KEY ([IDDealer]) REFERENCES [Dealer].[Dealer] ([IDDealer])
);

