CREATE TABLE [DettaglioAgenti].[DettaglioSubAgenti] (
    [FotocamereAssegnate] INT NULL,
    [StampantiAssegnate]  INT NULL,
    [IDDealer]            INT NOT NULL,
    CONSTRAINT [PK_DettaglioSubAgenti] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_DettaglioSubAgenti_DettaglioAgenti] FOREIGN KEY ([IDDealer]) REFERENCES [DettaglioAgenti].[DettaglioAgenti] ([IDDealer])
);




GO
CREATE TRIGGER [DettaglioAgenti].[TR_DettaglioSubAgentiChangeLog] 
   ON [DettaglioAgenti].[DettaglioSubAgenti]
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(FotocamereAssegnate) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'FotocamereAssegnate', CONVERT( NVARCHAR(50), D.FotocamereAssegnate ), CONVERT( NVARCHAR(50), I.FotocamereAssegnate )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(StampantiAssegnate) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'StampantiAssegnate', CONVERT( NVARCHAR(50), D.StampantiAssegnate ), CONVERT( NVARCHAR(50), I.StampantiAssegnate )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
	END
END