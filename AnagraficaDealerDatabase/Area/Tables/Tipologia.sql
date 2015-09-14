CREATE TABLE [Area].[Tipologia] (
    [IDTipologia] INT           IDENTITY (1, 1) NOT NULL,
    [Tipologia]   NVARCHAR (50) NOT NULL,
    [Attivo]      BIT           NOT NULL,
    CONSTRAINT [PK_Tipologia] PRIMARY KEY CLUSTERED ([IDTipologia] ASC)
);





