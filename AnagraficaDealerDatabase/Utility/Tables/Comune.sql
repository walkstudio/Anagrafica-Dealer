CREATE TABLE [Utility].[Comune] (
    [IDComune]    INT           IDENTITY (1, 1) NOT NULL,
    [Nome]        NVARCHAR (50) NOT NULL,
    [CAP]         NCHAR (5)     NOT NULL,
    [CodiceIstat] NCHAR (4)     NOT NULL,
    [IDProvincia] INT           NOT NULL,
    CONSTRAINT [PK_Comune] PRIMARY KEY CLUSTERED ([IDComune] ASC),
    CONSTRAINT [FK_Appartiene_Comune] FOREIGN KEY ([IDProvincia]) REFERENCES [Utility].[Provincia] ([IDProvincia])
);



