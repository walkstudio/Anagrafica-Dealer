CREATE TABLE [Area].[AreaCommittenti] (
    [AccordiParticolari]    BIT           NULL,
    [DataContratto]         DATE          NULL,
    [FirmaDigitale]         BIT           NULL,
    [IDProvinciaRea]        INT           NULL,
    [Rea]                   NVARCHAR (50) NULL,
    [IDSegmentazioneCanale] INT           NULL,
    [IDAreaDiCompetenza]    INT           NULL,
    [IDDealer]              INT           NOT NULL,
    CONSTRAINT [PK_AreaCommittenti] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_AreaCommittenti_Area] FOREIGN KEY ([IDDealer]) REFERENCES [Area].[Area] ([IDDealer]),
    CONSTRAINT [FK_AreaCommittenti_Provincia] FOREIGN KEY ([IDProvinciaRea]) REFERENCES [Utility].[Provincia] ([IDProvincia]),
    CONSTRAINT [FK_AreaCommittenti_SegmentazioneCanale] FOREIGN KEY ([IDSegmentazioneCanale]) REFERENCES [Area].[SegmentazioneCanale] ([IDSegmentazioneCanale]),
    CONSTRAINT [FK_Ha_AreaDiCompetenza] FOREIGN KEY ([IDAreaDiCompetenza]) REFERENCES [Area].[AreaDiCompetenza] ([IDAreaDiCompetenza])
);










GO
CREATE TRIGGER [Area].[TR_AreaCommittentiChangeLog] 
   ON  [Area].[AreaCommittenti] 
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(AccordiParticolari) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'AccordiParticolari', CONVERT(  NVARCHAR(50), D.AccordiParticolari ), CONVERT(  NVARCHAR(50), I.AccordiParticolari )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(DataContratto) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DataContratto', CONVERT( NVARCHAR(50), D.DataContratto ), CONVERT( NVARCHAR(50), I.DataContratto )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(FirmaDigitale) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'FirmaDigitale', CONVERT(  NVARCHAR(50), D.FirmaDigitale ), CONVERT(  NVARCHAR(50), I.FirmaDigitale )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(IDProvinciaRea) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDProvinciaRea', CONVERT( NVARCHAR(50), DP.Nome ), CONVERT( NVARCHAR(50), IP.Nome )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Utility.Provincia IP ON I.IDProvinciaRea = IP.IDProvincia
		LEFT JOIN Utility.Provincia DP ON D.IDProvinciaRea = DP.IDProvincia

		IF ( UPDATE(Rea) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Rea', D.Rea, I.Rea
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(IDSegmentazioneCanale) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDSegmentazioneCanale', DSC.SegmentazioneCanale, ISC.SegmentazioneCanale
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Area.SegmentazioneCanale ISC ON I.IDSegmentazioneCanale = ISC.IDSegmentazioneCanale
		LEFT JOIN Area.SegmentazioneCanale DSC ON D.IDSegmentazioneCanale = DSC.IDSegmentazioneCanale

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