CREATE TABLE [Negozio].[ModelloVendita] (
    [IDModelloVendita] INT           IDENTITY (1, 1) NOT NULL,
    [ModelloVendita]   NVARCHAR (50) NOT NULL,
    [Attivo]           BIT           NOT NULL,
    CONSTRAINT [PK_ModelloVendita] PRIMARY KEY CLUSTERED ([IDModelloVendita] ASC)
);





