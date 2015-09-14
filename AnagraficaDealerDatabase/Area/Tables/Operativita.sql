CREATE TABLE [Area].[Operativita] (
    [IDOperativita] INT           IDENTITY (1, 1) NOT NULL,
    [Operativita]   NVARCHAR (50) NOT NULL,
    [Attivo]        BIT           NOT NULL,
    CONSTRAINT [PK_Operativita] PRIMARY KEY CLUSTERED ([IDOperativita] ASC)
);





