CREATE TABLE [Negozio].[Negozio] (
    [ComuneISTAT]   NVARCHAR (50) NULL,
    [CostiVari]     SMALLMONEY    NULL,
    [Telefono]      NVARCHAR (50) NULL,
    [NomeContatto]  NVARCHAR (50) NULL,
    [NomeTitolare]  NVARCHAR (50) NULL,
    [Supporti]      NVARCHAR (50) NULL,
    [IDCluster]     INT           NULL,
    [IDDealer]      INT           NOT NULL,
    [CFTitolare]    NVARCHAR (50) NULL,
    [EmailTitolare] NVARCHAR (50) NULL,
    [Dipendenti]    INT           NULL,
    CONSTRAINT [PK_Negozio] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_Appartiene_Cluster] FOREIGN KEY ([IDCluster]) REFERENCES [Negozio].[Cluster] ([IDCluster]),
    CONSTRAINT [FK_Negozio_Dealer] FOREIGN KEY ([IDDealer]) REFERENCES [Dealer].[Dealer] ([IDDealer])
);












GO
CREATE TRIGGER [Negozio].[TR_NegozioChangeLog] 
   ON [Negozio].[Negozio]
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(ComuneISTAT) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'ComuneISTAT', D.ComuneISTAT, I.ComuneISTAT
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(CostiVari) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'CostiVari', CONVERT(  NVARCHAR(50), D.CostiVari ), CONVERT(  NVARCHAR(50), I.CostiVari )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(Telefono) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Telefono', D.Telefono, I.Telefono
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(NomeContatto) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'NomeContatto', D.NomeContatto, I.NomeContatto
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(NomeTitolare) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'NomeTitolare', D.NomeTitolare, I.NomeTitolare
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(Supporti) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Supporti', D.Supporti, I.Supporti
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(IDCluster) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDCluster', CONVERT( NVARCHAR(50), DP.Cluster ), CONVERT( NVARCHAR(50), IP.Cluster )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Negozio.Cluster IP ON I.IDCluster = IP.IDCluster
		LEFT JOIN Negozio.Cluster DP ON D.IDCluster = DP.IDCluster

		IF ( UPDATE(CFTitolare) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'CFTitolare', D.CFTitolare, I.CFTitolare
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(EmailTitolare) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'EmailTitolare', D.EmailTitolare, I.EmailTitolare
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
	END
END