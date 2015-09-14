CREATE TABLE [DettaglioAgenti].[MaterialeEspositivo] (
    [IDMaterialeEspositivo] INT           IDENTITY (1, 1) NOT NULL,
    [MaterialeEspositivo]   NVARCHAR (50) NOT NULL,
    [Attivo]                BIT           NOT NULL,
    CONSTRAINT [PK_MaterialeEspositivo] PRIMARY KEY CLUSTERED ([IDMaterialeEspositivo] ASC)
);



