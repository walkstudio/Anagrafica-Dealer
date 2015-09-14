CREATE TABLE [Import].[Committente] (
    [IDCommittente]         INT           IDENTITY (1, 1) NOT NULL,
    [IDArea]                INT           NULL,
    [IDAreaManager]         INT           NULL,
    [BOL]                   NVARCHAR (50) NULL,
    [IDCanale]              INT           NULL,
    [CAP]                   NCHAR (5)     NULL,
    [Cliente]               NVARCHAR (50) NULL,
    [Cliente2]              NVARCHAR (50) NULL,
    [IDCondizioniPagamento] INT           NULL,
    [DataAttivazione]       DATE          NULL,
    [DataDisattivazione]    DATE          NULL,
    [Fax]                   NVARCHAR (50) NULL,
    [FlagCancellazione]     NVARCHAR (50) NULL,
    [IDFunzionario]         INT           NULL,
    [Funzione]              NVARCHAR (50) NULL,
    [GruppiPrezzi]          NVARCHAR (50) NULL,
    [Indirizzo]             NVARCHAR (75) NULL,
    [Localita]              NVARCHAR (75) NULL,
    [MagazzinoDealer]       NVARCHAR (50) NULL,
    [Nome1]                 NVARCHAR (50) NULL,
    [Nome2]                 NVARCHAR (50) NULL,
    [PIVA]                  NVARCHAR (11) NULL,
    [IDProvincia]           INT           NULL,
    [IDRegione]             INT           NULL,
    [IDStato]               INT           NULL,
    [Telefono]              NVARCHAR (50) NULL,
    [Codice]                NVARCHAR (50) NULL,
    [IDDealer]              INT           NULL,
    CONSTRAINT [PK_Committente] PRIMARY KEY CLUSTERED ([IDCommittente] ASC)
);





