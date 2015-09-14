CREATE TABLE [Catene].[TipoRemunerazione] (
    [IDTipoRemunerazione] INT           IDENTITY (1, 1) NOT NULL,
    [TipoRemunerazione]   NVARCHAR (50) NOT NULL,
    [Attivo]              BIT           NOT NULL,
    CONSTRAINT [PK_TipoRemunerazione] PRIMARY KEY CLUSTERED ([IDTipoRemunerazione] ASC)
);







