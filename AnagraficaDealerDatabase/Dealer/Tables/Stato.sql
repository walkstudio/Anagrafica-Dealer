CREATE TABLE [Dealer].[Stato] (
    [IDStato]   INT           IDENTITY (1, 1) NOT NULL,
    [NomeStato] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Stato] PRIMARY KEY CLUSTERED ([IDStato] ASC)
);

