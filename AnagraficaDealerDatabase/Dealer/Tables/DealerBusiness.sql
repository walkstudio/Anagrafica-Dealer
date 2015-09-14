CREATE TABLE [Dealer].[DealerBusiness] (
    [IDDealerBusiness] INT           IDENTITY (1, 1) NOT NULL,
    [Codice]           NVARCHAR (11) NOT NULL,
    [Nome]             NVARCHAR (75) NOT NULL,
    [Indirizzo]        NVARCHAR (75) NOT NULL,
    CONSTRAINT [PK_DealerBusiness] PRIMARY KEY CLUSTERED ([IDDealerBusiness] ASC)
);





