CREATE TABLE [Vendite].[VenditePoint] (
    [Data]      DATE NULL,
    [IDRegione] INT  NULL,
    [IDDealer]  INT  NOT NULL,
    CONSTRAINT [PK_VenditePoint] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_VenditePoint_Vendite] FOREIGN KEY ([IDDealer]) REFERENCES [Vendite].[Vendite] ([IDDealer])
);



