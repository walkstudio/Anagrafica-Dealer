CREATE TABLE [Utility].[TokenPermission] (
    [TokenID]            NVARCHAR (12)  NOT NULL,
    [Application]        NVARCHAR (50)  NOT NULL,
    [Query]              NVARCHAR (MAX) NOT NULL,
    [Abilitato]          BIT            NOT NULL,
    [AbilitatoDescCampi] BIT            NOT NULL,
    [TabelleInQuery]     NVARCHAR (MAX) NOT NULL,
    [CampiInQuery]       NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_TokenPermission] PRIMARY KEY CLUSTERED ([TokenID] ASC, [Application] ASC)
);



