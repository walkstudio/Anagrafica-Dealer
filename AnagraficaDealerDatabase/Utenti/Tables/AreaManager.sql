CREATE TABLE [Utenti].[AreaManager] (
    [IDAreaManager] INT           IDENTITY (1, 1) NOT NULL,
    [VKBUR]         NVARCHAR (5)  NOT NULL,
    [Nome]          NVARCHAR (50) NOT NULL,
    [Attivo]        BIT           CONSTRAINT [DF_AreaManager_Attivo] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_AreaManager] PRIMARY KEY CLUSTERED ([IDAreaManager] ASC)
);





