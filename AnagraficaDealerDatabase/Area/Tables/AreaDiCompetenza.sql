CREATE TABLE [Area].[AreaDiCompetenza] (
    [IDAreaDiCompetenza] INT           IDENTITY (1, 1) NOT NULL,
    [NomeArea]           NVARCHAR (50) NOT NULL,
    [Attivo]             BIT           NOT NULL,
    CONSTRAINT [PK_AreaDiCompetenza] PRIMARY KEY CLUSTERED ([IDAreaDiCompetenza] ASC)
);





