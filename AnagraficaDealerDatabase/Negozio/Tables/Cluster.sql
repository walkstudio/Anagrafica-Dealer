CREATE TABLE [Negozio].[Cluster] (
    [IDCluster] INT           IDENTITY (1, 1) NOT NULL,
    [Cluster]   NVARCHAR (50) NOT NULL,
    [Attivo]    BIT           NOT NULL,
    CONSTRAINT [PK_Cluster] PRIMARY KEY CLUSTERED ([IDCluster] ASC)
);



