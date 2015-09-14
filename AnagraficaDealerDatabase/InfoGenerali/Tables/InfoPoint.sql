CREATE TABLE [InfoGenerali].[InfoPoint] (
    [DataAperturaNegozio] DATE NULL,
    [DataChiusuraNegozio] DATE NULL,
    [IDMasterDealer]      INT  NULL,
    [IDDealer]            INT  NOT NULL,
    CONSTRAINT [PK_InfoPoint] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_InfoPoint_InfoGenerali] FOREIGN KEY ([IDDealer]) REFERENCES [InfoGenerali].[InfoGenerali] ([IDDealer])
);








GO
CREATE TRIGGER [InfoGenerali].[TR_InfoPointChangeLog] 
   ON [InfoGenerali].[InfoPoint]
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(DataAperturaNegozio) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DataAperturaNegozio', CONVERT(  NVARCHAR(50), D.DataAperturaNegozio ), CONVERT(  NVARCHAR(50), I.DataAperturaNegozio )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(DataChiusuraNegozio) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DataChiusuraNegozio', CONVERT(  NVARCHAR(50), D.DataChiusuraNegozio ), CONVERT(  NVARCHAR(50), I.DataChiusuraNegozio )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(IDMasterDealer) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDMasterDealer', CONVERT(  NVARCHAR(50), DMD.Codice ), CONVERT(  NVARCHAR(50), IMD.Codice )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Dealer.Dealer IMD ON I.IDMasterDealer = IMD.IDDealer
		LEFT JOIN Dealer.Dealer DMD ON D.IDMasterDealer = DMD.IDDealer

	END
END