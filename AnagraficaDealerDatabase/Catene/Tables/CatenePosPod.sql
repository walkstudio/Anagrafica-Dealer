CREATE TABLE [Catene].[CatenePosPod] (
    [DatiCateneAM]          NVARCHAR (50) NULL,
    [DatiCateneFunzionario] NVARCHAR (50) NULL,
    [IDDealer]              INT           NOT NULL,
    CONSTRAINT [PK_CatenePosPod] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_CatenePosPod_Catene] FOREIGN KEY ([IDDealer]) REFERENCES [Catene].[Catene] ([IDDealer])
);




GO
CREATE TRIGGER [Catene].[TR_CatenePosPodChangeLog] 
   ON [Catene].[CatenePosPod]
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(DatiCateneAM) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DatiCateneAM', D.DatiCateneAM, I.DatiCateneAM
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(DatiCateneAM) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DatiCateneAM', D.DatiCateneAM, I.DatiCateneAM
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
	END
END