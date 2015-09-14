CREATE TABLE [InfoGenerali].[InfoCommittenti] (
    [BOL]                     NVARCHAR (50) NULL,
    [DataAperturaCodice]      DATE          NULL,
    [DataChiusuraCodice]      DATE          NULL,
    [DealerAssociatiAttivi]   INT           NULL,
    [DealerAssociatiInattivi] INT           NULL,
    [FideiussioneAffitto]     BIT           NULL,
    [FideiussioneCommerciale] BIT           NULL,
    [Regione]                 NVARCHAR (50) NULL,
    [IDDealer]                INT           NOT NULL,
    CONSTRAINT [PK_InfoCommittenti] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_InfoCommittenti_InfoGenerali] FOREIGN KEY ([IDDealer]) REFERENCES [InfoGenerali].[InfoGenerali] ([IDDealer])
);






GO
CREATE TRIGGER [InfoGenerali].[TR_InfoCommittentiChangeLog] 
   ON [InfoGenerali].InfoCommittenti
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
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DataAperturaCodice', CONVERT( NVARCHAR(50), D.DataAperturaCodice ), CONVERT( NVARCHAR(50), I.DataAperturaCodice )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(DataChiusuraCodice) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DataChiusuraCodice', CONVERT( NVARCHAR(50), D.DataChiusuraCodice ), CONVERT( NVARCHAR(50), I.DataChiusuraCodice )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(DealerAssociatiAttivi) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DealerAssociatiAttivi', CONVERT( NVARCHAR(50), D.DealerAssociatiAttivi ), CONVERT( NVARCHAR(50), I.DealerAssociatiAttivi )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(DealerAssociatiInattivi) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DealerAssociatiInattivi', CONVERT( NVARCHAR(50), D.DealerAssociatiInattivi ), CONVERT( NVARCHAR(50), I.DealerAssociatiInattivi )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(FideiussioneAffitto) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'FideiussioneAffitto', CONVERT( NVARCHAR(50), D.FideiussioneAffitto ), CONVERT( NVARCHAR(50), I.FideiussioneAffitto )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(FideiussioneCommerciale) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'FideiussioneCommerciale', CONVERT( NVARCHAR(50), D.FideiussioneCommerciale ), CONVERT( NVARCHAR(50), I.FideiussioneCommerciale )
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