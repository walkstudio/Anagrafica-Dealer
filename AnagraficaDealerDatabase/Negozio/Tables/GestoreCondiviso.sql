CREATE TABLE [Negozio].[GestoreCondiviso] (
    [IDGestoreCondiviso] INT           IDENTITY (1, 1) NOT NULL,
    [GestoreCondiviso]   NVARCHAR (50) NOT NULL,
    [Attivo]             BIT           NOT NULL,
    CONSTRAINT [PK_GestoreCondiviso] PRIMARY KEY CLUSTERED ([IDGestoreCondiviso] ASC)
);



