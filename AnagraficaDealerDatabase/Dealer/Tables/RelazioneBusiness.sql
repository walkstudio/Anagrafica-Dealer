CREATE TABLE [Dealer].[RelazioneBusiness] (
    [IDRelazioneBusiness] INT           IDENTITY (1, 1) NOT NULL,
    [IDDealerBusiness]    INT           NOT NULL,
    [IDDealerConsumer]    INT           NOT NULL,
    [Relazione]           NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_RelazioneBusiness] PRIMARY KEY CLUSTERED ([IDRelazioneBusiness] ASC),
    CONSTRAINT [FK_RelazioneBusiness_Dealer] FOREIGN KEY ([IDDealerConsumer]) REFERENCES [Dealer].[Dealer] ([IDDealer]),
    CONSTRAINT [FK_RelazioneBusiness_DealerBusiness] FOREIGN KEY ([IDDealerBusiness]) REFERENCES [Dealer].[DealerBusiness] ([IDDealerBusiness])
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RelazioneBusiness]
    ON [Dealer].[RelazioneBusiness]([IDDealerConsumer] ASC, [IDDealerBusiness] ASC);

