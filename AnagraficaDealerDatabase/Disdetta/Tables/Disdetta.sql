CREATE TABLE [Disdetta].[Disdetta] (
    [VecchioCodice]        NVARCHAR (50)  NULL,
    [DataTerminePreavviso] DATE           NULL,
    [DataInvioDisdetta]    DATE           NULL,
    [IDRichiedente]        INT            NULL,
    [GiorniPreavviso]      INT            NULL,
    [Note]                 NVARCHAR (MAX) NULL,
    [IDDealer]             INT            NOT NULL,
    CONSTRAINT [PK_Disdetta] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_Disdetta_Dealer] FOREIGN KEY ([IDDealer]) REFERENCES [Dealer].[Dealer] ([IDDealer]),
    CONSTRAINT [FK_Disdetta_Richiedente] FOREIGN KEY ([IDRichiedente]) REFERENCES [Disdetta].[Richiedente] ([IDRichiedente])
);










GO
CREATE TRIGGER [Disdetta].[TR_DisdettaChangeLog] 
   ON Disdetta.Disdetta
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(VecchioCodice) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'VecchioCodice', D.VecchioCodice, I.VecchioCodice
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(DataTerminePreavviso) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DataTerminePreavviso', CONVERT( NVARCHAR(50), D.DataTerminePreavviso ), CONVERT( NVARCHAR(50), I.DataTerminePreavviso )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(DataInvioDisdetta) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DataInvioDisdetta', CONVERT( NVARCHAR(50), D.DataInvioDisdetta ), CONVERT( NVARCHAR(50), I.DataInvioDisdetta )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(IDRichiedente) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDRichiedente', DSC.Richiedente, ISC.Richiedente
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Disdetta.Richiedente ISC ON I.IDRichiedente = ISC.IDRichiedente
		LEFT JOIN Disdetta.Richiedente DSC ON D.IDRichiedente = DSC.IDRichiedente

		IF ( UPDATE(GiorniPreavviso) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'GiorniPreavviso', CONVERT( NVARCHAR(50), D.GiorniPreavviso ), CONVERT( NVARCHAR(50), I.GiorniPreavviso )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(Note) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Note', D.Note, I.Note
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
	END
END