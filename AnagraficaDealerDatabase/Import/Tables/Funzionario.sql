CREATE TABLE [Import].[Funzionario] (
    [IDFunzionario] INT           IDENTITY (1, 1) NOT NULL,
    [AgL]           NVARCHAR (3)  NOT NULL,
    [Nome]          NVARCHAR (50) NOT NULL,
    [UpdateID]      INT           NULL,
    CONSTRAINT [PK_Funzionario_1] PRIMARY KEY CLUSTERED ([IDFunzionario] ASC)
);

