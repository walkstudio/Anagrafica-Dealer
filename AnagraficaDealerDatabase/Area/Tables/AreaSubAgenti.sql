CREATE TABLE [Area].[AreaSubAgenti] (
    [DataContratto] DATE NULL,
    [FirmaDigitale] BIT  NULL,
    [IDDealer]      INT  NOT NULL,
    CONSTRAINT [PK_AreaSubAgenti] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_AreaSubAgenti_Area] FOREIGN KEY ([IDDealer]) REFERENCES [Area].[Area] ([IDDealer])
);




GO
CREATE TRIGGER [Area].[TR_AreaSubAgentiChangeLog] 
   ON  [Area].[AreaSubAgenti] 
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
	END
END