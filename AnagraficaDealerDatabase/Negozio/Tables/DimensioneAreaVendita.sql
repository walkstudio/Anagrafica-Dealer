CREATE TABLE [Negozio].[DimensioneAreaVendita] (
    [IDDimensioneAreaVendita] INT           IDENTITY (1, 1) NOT NULL,
    [DimensioneAreaVendita]   NVARCHAR (50) NOT NULL,
    [Attivo]                  BIT           NOT NULL,
    CONSTRAINT [PK_DimensioneAreaVendita] PRIMARY KEY CLUSTERED ([IDDimensioneAreaVendita] ASC)
);



