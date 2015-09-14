CREATE TABLE [Utility].[Provincia] (
    [IDProvincia] INT           IDENTITY (1, 1) NOT NULL,
    [Nome]        NVARCHAR (50) NOT NULL,
    [Sigla]       NCHAR (2)     NOT NULL,
    [IDRegione]   INT           NOT NULL,
    [IDZona]      INT           NOT NULL,
    CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED ([IDProvincia] ASC),
    CONSTRAINT [FK_Appartiene_Zona] FOREIGN KEY ([IDZona]) REFERENCES [Utility].[Zona] ([IDZona]),
    CONSTRAINT [FK_Provincia_Regione] FOREIGN KEY ([IDRegione]) REFERENCES [Utility].[Regione] ([IDRegione])
);





