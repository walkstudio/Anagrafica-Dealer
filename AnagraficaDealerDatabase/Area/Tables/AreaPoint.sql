CREATE TABLE [Area].[AreaPoint] (
    [AccordiParticolari] BIT           NULL,
    [CentroCommerciale]  BIT           NULL,
    [FirmaDigitale]      BIT           NULL,
    [IDProvinciaRea]     INT           NULL,
    [Rea]                NVARCHAR (50) NULL,
    [IDDealer]           INT           NOT NULL,
    CONSTRAINT [PK_AreaPoint] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_AreaPoint_Area] FOREIGN KEY ([IDDealer]) REFERENCES [Area].[Area] ([IDDealer]),
    CONSTRAINT [FK_AreaPoint_Provincia] FOREIGN KEY ([IDProvinciaRea]) REFERENCES [Utility].[Provincia] ([IDProvincia])
);






GO
CREATE TRIGGER [Area].[TR_AreaPointChangeLog] 
   ON  [Area].[AreaPoint] 
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(AccordiParticolari) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'AccordiParticolari', CONVERT( NVARCHAR(50), D.AccordiParticolari ), CONVERT( NVARCHAR(50), I.AccordiParticolari )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(CentroCommerciale) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'CentroCommerciale', CONVERT( NVARCHAR(50), D.CentroCommerciale ), CONVERT( NVARCHAR(50), I.CentroCommerciale )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(FirmaDigitale) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'FirmaDigitale', CONVERT( NVARCHAR(50), D.FirmaDigitale ), CONVERT( NVARCHAR(50), I.FirmaDigitale )
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
	END
END