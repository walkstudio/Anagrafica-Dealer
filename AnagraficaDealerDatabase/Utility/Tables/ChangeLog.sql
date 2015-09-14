CREATE TABLE [Utility].[ChangeLog] (
    [IDChangeLog]      INT            IDENTITY (1, 1) NOT NULL,
    [IDUtente]         INT            NOT NULL,
    [IDDealer]         INT            NOT NULL,
    [DataModifica]     DATETIME       NOT NULL,
    [NomeCampo]        NVARCHAR (50)  NOT NULL,
    [ValorePrecedente] NVARCHAR (500) NULL,
    [ValoreNuovo]      NVARCHAR (500) NULL,
    CONSTRAINT [PK_ChangeLog] PRIMARY KEY CLUSTERED ([IDChangeLog] ASC)
);



