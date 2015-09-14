CREATE TABLE [InfoGenerali].[InfoSubAgenti] (
    [BOL]                NVARCHAR (50) NULL,
    [DataChiusuraCodice] DATE          NULL,
    [DataAperturaCodice] DATE          NULL,
    [IDDealer]           INT           NOT NULL,
    CONSTRAINT [PK_InfoSubAgenti] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_InfoSubAgenti_InfoGenerali] FOREIGN KEY ([IDDealer]) REFERENCES [InfoGenerali].[InfoGenerali] ([IDDealer])
);






GO
CREATE TRIGGER [InfoGenerali].[TR_InfoSubAgentiChangeLog] 
   ON [InfoGenerali].InfoSubAgenti
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(BOL) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'BOL', D.BOL, I.BOL
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(DataAperturaCodice) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DataAperturaCodice', CONVERT(  NVARCHAR(50), D.DataAperturaCodice ), CONVERT(  NVARCHAR(50), I.DataAperturaCodice )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(DataChiusuraCodice) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DataChiusuraCodice', CONVERT(  NVARCHAR(50), D.DataChiusuraCodice ), CONVERT(  NVARCHAR(50), I.DataChiusuraCodice )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
	END
END