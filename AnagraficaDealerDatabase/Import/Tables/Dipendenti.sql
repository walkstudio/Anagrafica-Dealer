CREATE TABLE [Import].[Dipendenti] (
    [IDDipendente]     INT           IDENTITY (1, 1) NOT NULL,
    [Username]         NVARCHAR (50) NULL,
    [Nome]             NVARCHAR (50) NULL,
    [Cognome]          NVARCHAR (50) NULL,
    [CodiceFiscale]    NVARCHAR (50) NULL,
    [Figura]           NVARCHAR (50) NULL,
    [Stato]            NVARCHAR (50) NULL,
    [Email]            NVARCHAR (50) NULL,
    [Telefono]         NVARCHAR (50) NULL,
    [CodiceDealer]     NVARCHAR (50) NULL,
    [OmnipointID]      NVARCHAR (50) NULL,
    [SistemiAbilitati] NVARCHAR (50) NULL,
    [DataModifica]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_Dipendenti_1] PRIMARY KEY CLUSTERED ([IDDipendente] ASC)
);

