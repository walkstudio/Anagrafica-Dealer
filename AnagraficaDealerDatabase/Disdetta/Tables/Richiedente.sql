CREATE TABLE [Disdetta].[Richiedente] (
    [IDRichiedente] INT           IDENTITY (1, 1) NOT NULL,
    [Richiedente]   NVARCHAR (50) NOT NULL,
    [Attivo]        BIT           NOT NULL,
    CONSTRAINT [PK_Richiedente] PRIMARY KEY CLUSTERED ([IDRichiedente] ASC)
);



