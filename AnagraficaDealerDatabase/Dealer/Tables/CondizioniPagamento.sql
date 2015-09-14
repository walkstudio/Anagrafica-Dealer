CREATE TABLE [Dealer].[CondizioniPagamento] (
    [IDCondizioniPagamento]   INT           IDENTITY (1, 1) NOT NULL,
    [NomeCondizioniPagamento] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_CondizioniPagamento] PRIMARY KEY CLUSTERED ([IDCondizioniPagamento] ASC)
);



