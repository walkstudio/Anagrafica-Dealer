CREATE TABLE [Dealer].[Canale] (
    [IDCanale]          INT           IDENTITY (1, 1) NOT NULL,
    [NomeCanale]        NVARCHAR (50) NOT NULL,
    [DescrizioneCanale] NVARCHAR (50) NULL,
    CONSTRAINT [PK_Canale] PRIMARY KEY CLUSTERED ([IDCanale] ASC)
);



