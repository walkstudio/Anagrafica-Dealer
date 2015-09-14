CREATE TABLE [Negozio].[NegozioAgenti] (
    [IndirizzoSpedizioneMateriale] NVARCHAR (50) NULL,
    [IDDealer]                     INT           NOT NULL,
    CONSTRAINT [PK_NegozioAgenti] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_NegozioAgenti_Negozio] FOREIGN KEY ([IDDealer]) REFERENCES [Negozio].[Negozio] ([IDDealer])
);






GO
CREATE TRIGGER [Negozio].[TR_NegozioAgentiChangeLog] 
   ON [Negozio].NegozioAgenti
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(IndirizzoSpedizioneMateriale) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IndirizzoSpedizioneMateriale', D.IndirizzoSpedizioneMateriale, I.IndirizzoSpedizioneMateriale
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
	END
END