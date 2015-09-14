CREATE TABLE [Negozio].[TipologiaArredo] (
    [IDTipologiaArredo] INT           IDENTITY (1, 1) NOT NULL,
    [TipologiaArredo]   NVARCHAR (50) NOT NULL,
    [Attivo]            BIT           NOT NULL,
    CONSTRAINT [PK_TipologiaArredo] PRIMARY KEY CLUSTERED ([IDTipologiaArredo] ASC)
);



