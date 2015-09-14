CREATE TABLE [Area].[SegmentazioneCanale] (
    [IDSegmentazioneCanale] INT           IDENTITY (1, 1) NOT NULL,
    [SegmentazioneCanale]   NVARCHAR (50) NOT NULL,
    [Attivo]                BIT           NOT NULL,
    CONSTRAINT [PK_SegmentazioneCanale] PRIMARY KEY CLUSTERED ([IDSegmentazioneCanale] ASC)
);



