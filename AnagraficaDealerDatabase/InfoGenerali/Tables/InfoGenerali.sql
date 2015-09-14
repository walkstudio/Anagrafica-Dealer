CREATE TABLE [InfoGenerali].[InfoGenerali] (
    [CodiceFornitore] NVARCHAR (50) NULL,
    [CodiceVogi]      NVARCHAR (50) NULL,
    [EMail]           NVARCHAR (50) NULL,
    [PEC]             NVARCHAR (50) NULL,
    [IDDealer]        INT           NOT NULL,
    CONSTRAINT [PK_InfoGenerali] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_InfoGenerali_Dealer] FOREIGN KEY ([IDDealer]) REFERENCES [Dealer].[Dealer] ([IDDealer])
);






GO
CREATE TRIGGER [InfoGenerali].[TR_InfoGeneraliChangeLog] 
   ON [InfoGenerali].InfoGenerali
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(CodiceFornitore) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'CodiceFornitore', D.CodiceFornitore, I.CodiceFornitore
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(CodiceVogi) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'CodiceVogi', D.CodiceVogi, I.CodiceVogi
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(EMail) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'EMail', D.EMail, I.EMail
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(PEC) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'PEC', D.PEC, I.PEC
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
	END
END