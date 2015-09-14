CREATE TABLE [Import].[AreaManager] (
    [IDAreaManager] INT           IDENTITY (1, 1) NOT NULL,
    [VKBUR]         NVARCHAR (5)  NOT NULL,
    [BEZEI]         NVARCHAR (50) NOT NULL,
    [UpdateId]      INT           NULL,
    CONSTRAINT [PK_AreaManager] PRIMARY KEY CLUSTERED ([IDAreaManager] ASC)
);

