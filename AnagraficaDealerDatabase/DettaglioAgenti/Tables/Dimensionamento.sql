CREATE TABLE [DettaglioAgenti].[Dimensionamento] (
    [IDDimensionamento] INT           IDENTITY (1, 1) NOT NULL,
    [Dimensionamento]   NVARCHAR (50) NOT NULL,
    [Attivo]            BIT           NOT NULL,
    CONSTRAINT [PK_Dimensionamento] PRIMARY KEY CLUSTERED ([IDDimensionamento] ASC)
);





