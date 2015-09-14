CREATE TABLE [Utenti].[Funzionario] (
    [IDFunzionario] INT           IDENTITY (1, 1) NOT NULL,
    [AGL]           NVARCHAR (3)  NOT NULL,
    [Nome]          NVARCHAR (50) NOT NULL,
    [Attivo]        BIT           CONSTRAINT [DF_Funzionario_Attivo] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Funzionario] PRIMARY KEY CLUSTERED ([IDFunzionario] ASC)
);





