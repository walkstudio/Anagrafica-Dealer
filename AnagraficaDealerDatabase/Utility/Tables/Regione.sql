CREATE TABLE [Utility].[Regione] (
    [IDRegione] INT           IDENTITY (1, 1) NOT NULL,
    [Nome]      NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Regione] PRIMARY KEY CLUSTERED ([IDRegione] ASC)
);



