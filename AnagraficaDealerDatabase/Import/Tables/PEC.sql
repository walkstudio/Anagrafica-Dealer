CREATE TABLE [Import].[PEC] (
    [IDPEC]   INT            IDENTITY (1, 1) NOT NULL,
    [Cliente] NVARCHAR (50)  NOT NULL,
    [PEC]     NVARCHAR (250) NOT NULL,
    [Data]    DATE           NOT NULL,
    [Ora]     TIME (7)       NOT NULL,
    [Stato]   NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_PEC] PRIMARY KEY CLUSTERED ([IDPEC] ASC)
);

