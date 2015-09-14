CREATE TABLE [Import].[Point] (
    [IDPoint]         INT           IDENTITY (1, 1) NOT NULL,
    [IDDealer]        INT           NULL,
    [IDArea]          INT           NULL,
    [IDMasterDealer]  INT           NULL,
    [Nome1]           NVARCHAR (50) NOT NULL,
    [PartitaIVA]      NVARCHAR (11) NULL,
    [IDProvincia]     INT           NULL,
    [IDRegione]       INT           NULL,
    [IDStato]         INT           NULL,
    [Telefono]        NVARCHAR (50) NULL,
    [CAP]             NCHAR (5)     NULL,
    [Codice]          NVARCHAR (50) NOT NULL,
    [DataAttivazione] DATE          NULL,
    [Fax]             NVARCHAR (50) NULL,
    [Indirizzo]       NVARCHAR (75) NULL,
    [Localita]        NVARCHAR (75) NULL,
    [OmnipointID]     INT           NULL,
    CONSTRAINT [PK_Point] PRIMARY KEY CLUSTERED ([IDPoint] ASC)
);







