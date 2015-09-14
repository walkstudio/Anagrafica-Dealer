CREATE TABLE [Dealer].[RelazioneConsumer] (
    [IDRelazioneConsumer] INT           IDENTITY (1, 1) NOT NULL,
    [IDDealer1]           INT           NOT NULL,
    [IDDealer2]           INT           NOT NULL,
    [Relazione]           NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_RelazioneConsumer] PRIMARY KEY CLUSTERED ([IDRelazioneConsumer] ASC),
    CONSTRAINT [FK_RelazioneConsumer_Dealer] FOREIGN KEY ([IDDealer1]) REFERENCES [Dealer].[Dealer] ([IDDealer]),
    CONSTRAINT [FK_RelazioneConsumer_Dealer1] FOREIGN KEY ([IDDealer2]) REFERENCES [Dealer].[Dealer] ([IDDealer])
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RelazioneConsumer]
    ON [Dealer].[RelazioneConsumer]([IDDealer1] ASC, [IDDealer2] ASC);

