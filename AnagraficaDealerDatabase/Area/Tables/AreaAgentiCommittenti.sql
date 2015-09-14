CREATE TABLE [Area].[AreaAgentiCommittenti] (
    [DataContratto]  DATE          NULL,
    [FirmaDigitale]  BIT           NULL,
    [IDProvinciaRea] INT           NULL,
    [Rea]            NVARCHAR (50) NULL,
    [IDDealer]       INT           NOT NULL,
    CONSTRAINT [PK_AreaAgentiCommittenti] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_AreaAgentiCommittenti_Area] FOREIGN KEY ([IDDealer]) REFERENCES [Area].[Area] ([IDDealer]),
    CONSTRAINT [FK_AreaAgentiCommittenti_Provincia] FOREIGN KEY ([IDProvinciaRea]) REFERENCES [Utility].[Provincia] ([IDProvincia])
);






GO
CREATE TRIGGER  [Area].[TR_AreaAgentiChangeLog]
   ON  [Area].[AreaAgentiCommittenti]
   AFTER INSERT,UPDATE
AS 
BEGIN

	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(DataContratto) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DataContratto', CONVERT( NVARCHAR(50), D.DataContratto ), CONVERT( NVARCHAR(50), I.DataContratto )
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