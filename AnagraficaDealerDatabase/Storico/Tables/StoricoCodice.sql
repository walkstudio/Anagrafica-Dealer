CREATE TABLE [Storico].[StoricoCodice] (
    [IDStoricoCodice] INT           IDENTITY (1, 1) NOT NULL,
    [Codice]          NVARCHAR (50) NOT NULL,
    [DataInizio]      DATETIME      NOT NULL,
    [DataFine]        DATETIME      NOT NULL,
    [IDUtente]        INT           NOT NULL,
    [IDDealer]        INT           NOT NULL,
    CONSTRAINT [PK_StoricoCodice] PRIMARY KEY CLUSTERED ([IDStoricoCodice] ASC),
    CONSTRAINT [FK_Modifica_Codice_Utente] FOREIGN KEY ([IDUtente]) REFERENCES [Utenti].[Utente] ([IDUtente]),
    CONSTRAINT [FK_Subentro_Dealer] FOREIGN KEY ([IDDealer]) REFERENCES [Dealer].[Dealer] ([IDDealer])
);

