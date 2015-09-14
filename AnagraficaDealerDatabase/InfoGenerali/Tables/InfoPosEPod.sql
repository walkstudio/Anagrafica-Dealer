CREATE TABLE [InfoGenerali].[InfoPosEPod] (
    [CentroAssistenzaTecnica] NVARCHAR (50) NULL,
    [BOL]                     NVARCHAR (50) NULL,
    [DataAperturaNegozio]     DATE          NULL,
    [DataChiusuraNegozio]     DATE          NULL,
    [DataAperturaCodice]      DATE          NULL,
    [DataChiusuraCodice]      DATE          NULL,
    [Regione]                 NVARCHAR (50) NULL,
    [IDDealer]                INT           NOT NULL,
    CONSTRAINT [PK_InfoPosEPod] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_InfoPosEPod_InfoGenerali] FOREIGN KEY ([IDDealer]) REFERENCES [InfoGenerali].[InfoGenerali] ([IDDealer])
);






GO
CREATE TRIGGER [InfoGenerali].[TR_InfoPosEPodChangeLog] 
   ON [InfoGenerali].InfoPosEPod
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(CentroAssistenzaTecnica) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'CentroAssistenzaTecnica', D.CentroAssistenzaTecnica, I.CentroAssistenzaTecnica
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(BOL) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'BOL', D.BOL, I.BOL
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

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

		IF ( UPDATE(Regione) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Regione', D.Regione, I.Regione
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
	END
END