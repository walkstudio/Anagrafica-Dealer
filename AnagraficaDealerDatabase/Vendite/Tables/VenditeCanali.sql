CREATE TABLE [Vendite].[VenditeCanali] (
    [Cliente]           NVARCHAR (50) NULL,
    [FlagCancellazione] NVARCHAR (50) NULL,
    [IDFunzionario]     INT           NULL,
    [Funzione]          NVARCHAR (50) NULL,
    [GruppoPrezzi]      NVARCHAR (50) NULL,
    [Magazzino]         NVARCHAR (50) NULL,
    [Nome2]             NVARCHAR (50) NULL,
    [IDAreaManager]     INT           NULL,
    [IDRegione]         INT           NULL,
    [IDDealer]          INT           NOT NULL,
    [IDArea]            INT           NULL,
    CONSTRAINT [PK_VenditeCanali] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_VenditeCanali_Vendite] FOREIGN KEY ([IDDealer]) REFERENCES [Vendite].[Vendite] ([IDDealer])
);



