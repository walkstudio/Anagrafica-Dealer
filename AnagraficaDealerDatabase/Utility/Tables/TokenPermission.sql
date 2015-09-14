CREATE TABLE [Utility].[TokenPermission] (
    [ID]          INT          IDENTITY (1, 1) NOT NULL,
    [TokenID]     INT          NOT NULL,
    [Application] VARCHAR (50) NOT NULL,
    [Abilitato]   BIT          NOT NULL,
    CONSTRAINT [PK_Token] PRIMARY KEY CLUSTERED ([ID] ASC)
);

