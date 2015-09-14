CREATE TABLE [Negozio].[OrarioDiApertura] (
    [IDOrarioApertura] INT           IDENTITY (1, 1) NOT NULL,
    [DalleMattina]     NVARCHAR (10) NOT NULL,
    [AlleMattina]      NVARCHAR (10) NULL,
    [DallePomeriggio]  NVARCHAR (10) NULL,
    [AllePomeriggio]   NVARCHAR (10) NOT NULL,
    [Lun]              BIT           NOT NULL,
    [Mar]              BIT           NOT NULL,
    [Mer]              BIT           NOT NULL,
    [Gio]              BIT           NOT NULL,
    [Ven]              BIT           NOT NULL,
    [Sab]              BIT           NOT NULL,
    [Dom]              BIT           NOT NULL,
    CONSTRAINT [PK_OrarioDiApertura] PRIMARY KEY CLUSTERED ([IDOrarioApertura] ASC)
);





