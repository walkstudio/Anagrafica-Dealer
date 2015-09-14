CREATE TABLE [Utenti].[Utente] (
    [IDUtente]  INT           IDENTITY (1, 1) NOT NULL,
    [Nome]      NVARCHAR (50) NOT NULL,
    [Cognome]   NVARCHAR (50) NOT NULL,
    [Email]     NVARCHAR (50) NULL,
    [UserID]    NVARCHAR (50) NOT NULL,
    [IDProfilo] INT           NOT NULL,
    [Attivo]    BIT           NOT NULL,
    CONSTRAINT [PK_Utente] PRIMARY KEY CLUSTERED ([IDUtente] ASC),
    CONSTRAINT [FK_Appartiene_Profilo] FOREIGN KEY ([IDProfilo]) REFERENCES [Utenti].[Profilo] ([IDProfilo])
);





