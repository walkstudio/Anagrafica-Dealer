CREATE TABLE [Utility].[ArchivioRicerca] (
    [IDRicerca] INT           IDENTITY (1, 1) NOT NULL,
    [Utente]    NVARCHAR (30) NOT NULL,
    [Ricerca]   XML           NOT NULL,
    CONSTRAINT [PK_ArchivioRicerca] PRIMARY KEY CLUSTERED ([IDRicerca] ASC)
);

