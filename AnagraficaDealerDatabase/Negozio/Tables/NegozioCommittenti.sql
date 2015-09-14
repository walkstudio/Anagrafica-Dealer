CREATE TABLE [Negozio].[NegozioCommittenti] (
    [ClassificazioneMaster] NVARCHAR (50) NULL,
    [FT]                    INT           NULL,
    [FTE]                   INT           NULL,
    [NumeroVetrine]         INT           NULL,
    [PT]                    INT           NULL,
    [Piu12]                 BIT           NULL,
    [IDDealer]              INT           NOT NULL,
    CONSTRAINT [PK_NegozioCommittenti] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_NegozioCommittenti_Negozio] FOREIGN KEY ([IDDealer]) REFERENCES [Negozio].[Negozio] ([IDDealer])
);




GO
CREATE TRIGGER [Negozio].[TR_NegozioCommittentiChangeLog] 
   ON [Negozio].NegozioCommittenti
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(ClassificazioneMaster) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'ClassificazioneMaster', D.ClassificazioneMaster, I.ClassificazioneMaster
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(NumeroVetrine) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'NumeroVetrine', CONVERT(  NVARCHAR(50), D.NumeroVetrine ), CONVERT(  NVARCHAR(50), I.NumeroVetrine )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(Piu12) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Piu12', CONVERT(  NVARCHAR(50), D.Piu12 ), CONVERT(  NVARCHAR(50), I.Piu12 )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
	END
END