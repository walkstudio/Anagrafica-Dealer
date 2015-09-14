CREATE TABLE [Area].[AreaPosPod] (
    [CentroCommerciale]      BIT NULL,
    [MagazzinoCentralizzato] BIT NULL,
    [NegozioTop]             BIT NULL,
    [IDSegmentazioneCanale]  INT NULL,
    [IDDealer]               INT NOT NULL,
    [IDAreaDiCompetenza]     INT NULL,
    CONSTRAINT [PK_AreaPosPod] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_AreaPosPod_Area] FOREIGN KEY ([IDDealer]) REFERENCES [Area].[Area] ([IDDealer]),
    CONSTRAINT [FK_AreaPosPod_AreaDiCompetenza] FOREIGN KEY ([IDAreaDiCompetenza]) REFERENCES [Area].[AreaDiCompetenza] ([IDAreaDiCompetenza]),
    CONSTRAINT [FK_AreaPosPod_SegmentazioneCanale] FOREIGN KEY ([IDSegmentazioneCanale]) REFERENCES [Area].[SegmentazioneCanale] ([IDSegmentazioneCanale])
);








GO
CREATE TRIGGER [Area].[TR_AreaPosPodChangeLog] 
   ON  [Area].[AreaPosPod] 
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(CentroCommerciale) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'CentroCommerciale', CONVERT( NVARCHAR(50), D.CentroCommerciale ), CONVERT( NVARCHAR(50), I.CentroCommerciale )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(MagazzinoCentralizzato) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'MagazzinoCentralizzato', CONVERT( NVARCHAR(50), D.MagazzinoCentralizzato ), CONVERT( NVARCHAR(50), I.MagazzinoCentralizzato )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(NegozioTop) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'NegozioTop', CONVERT( NVARCHAR(50), D.NegozioTop ), CONVERT( NVARCHAR(50), I.NegozioTop )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(IDSegmentazioneCanale) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDSegmentazioneCanale', DA.SegmentazioneCanale, IA.SegmentazioneCanale
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Area.SegmentazioneCanale IA ON I.IDSegmentazioneCanale = IA.IDSegmentazioneCanale
		LEFT JOIN Area.SegmentazioneCanale DA ON D.IDSegmentazioneCanale = DA.IDSegmentazioneCanale

		IF ( UPDATE(IDAreaDiCompetenza) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDAreaDiCompetenza', DA.NomeArea, IA.NomeArea
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Area.AreaDiCompetenza IA ON I.IDAreaDiCompetenza = IA.IDAreaDiCompetenza
		LEFT JOIN Area.AreaDiCompetenza DA ON D.IDAreaDiCompetenza = DA.IDAreaDiCompetenza
	END
END