CREATE TABLE [Negozio].[UsaGestoreCondiviso] (
    [IDDealer]           INT NOT NULL,
    [IDGestoreCondiviso] INT NOT NULL,
    CONSTRAINT [PK_UsaGestoreCondiviso] PRIMARY KEY CLUSTERED ([IDDealer] ASC, [IDGestoreCondiviso] ASC),
    CONSTRAINT [FK_UsaGestoreCondiviso_GestoreCondiviso] FOREIGN KEY ([IDGestoreCondiviso]) REFERENCES [Negozio].[GestoreCondiviso] ([IDGestoreCondiviso]),
    CONSTRAINT [FK_UsaGestoreCondiviso_Negozio] FOREIGN KEY ([IDDealer]) REFERENCES [Negozio].[Negozio] ([IDDealer])
);

