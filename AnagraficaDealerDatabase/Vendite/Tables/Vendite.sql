CREATE TABLE [Vendite].[Vendite] (
    [IDArea]      INT           NULL,
    [CAP]         NCHAR (5)     NULL,
    [Localita]    NVARCHAR (75) NULL,
    [Nome1]       NVARCHAR (50) NULL,
    [IDProvincia] INT           NULL,
    [IDDealer]    INT           NOT NULL,
    [IDZona]      INT           NULL,
    CONSTRAINT [PK_Vendite] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_Vendite_Dealer] FOREIGN KEY ([IDDealer]) REFERENCES [Dealer].[Dealer] ([IDDealer]),
    CONSTRAINT [FK_Vendite_Provincia] FOREIGN KEY ([IDProvincia]) REFERENCES [Utility].[Provincia] ([IDProvincia])
);







