CREATE TABLE [Utenti].[Profilo] (
    [IDProfilo]               INT           IDENTITY (1, 1) NOT NULL,
    [ArchivioDataBase]        BIT           NOT NULL,
    [ArchivioCruscotto]       BIT           NOT NULL,
    [NomeProfilo]             NVARCHAR (50) NOT NULL,
    [ReportAnomalie]          BIT           NOT NULL,
    [ReportScarti]            BIT           NOT NULL,
    [Portafoglio]             BIT           NOT NULL,
    [Amministrazione]         BIT           NOT NULL,
    [RagioniSocialiCorrelate] INT           NOT NULL,
    [Eccezioni]               BIT           NOT NULL,
    CONSTRAINT [PK_Profilo] PRIMARY KEY CLUSTERED ([IDProfilo] ASC)
);





