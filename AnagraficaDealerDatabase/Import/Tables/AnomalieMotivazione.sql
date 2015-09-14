CREATE TABLE [Import].[AnomalieMotivazione] (
    [IDMotivazioneAnomalia] INT            IDENTITY (1, 1) NOT NULL,
    [Motivazione]           NVARCHAR (250) NOT NULL,
    CONSTRAINT [PK_MotivazioneAnomalie] PRIMARY KEY CLUSTERED ([IDMotivazioneAnomalia] ASC)
);





