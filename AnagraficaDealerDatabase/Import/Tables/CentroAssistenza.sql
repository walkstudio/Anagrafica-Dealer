CREATE TABLE [Import].[CentroAssistenza] (
    [IDCentroAssistenza] INT           IDENTITY (1, 1) NOT NULL,
    [CodiceDealer]       NVARCHAR (11) NOT NULL,
    [GreenP]             NVARCHAR (5)  NOT NULL,
    CONSTRAINT [PK_CentroAssistenza] PRIMARY KEY CLUSTERED ([IDCentroAssistenza] ASC)
);

