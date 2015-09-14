CREATE TABLE [Negozio].[NegozioPosPod] (
    [FT]                      INT           NULL,
    [Geolocalizzazione]       BIT           NULL,
    [Insegna]                 NVARCHAR (50) NULL,
    [Latitudine]              DECIMAL (18)  NULL,
    [Longitudine]             DECIMAL (18)  NULL,
    [FTE]                     INT           NULL,
    [PT]                      INT           NULL,
    [NumeroVetrine]           INT           NULL,
    [ShopInStore]             BIT           NULL,
    [ValoreAffitto]           SMALLMONEY    NULL,
    [IDTipologiaArredo]       INT           NULL,
    [IDDimensioneAreaVendita] INT           NULL,
    [IDDealer]                INT           NOT NULL,
    CONSTRAINT [PK_NegozioPosPod] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_NegozioPosPod_Negozio] FOREIGN KEY ([IDDealer]) REFERENCES [Negozio].[Negozio] ([IDDealer]),
    CONSTRAINT [FK_Pos_Dispone_DimensioneAreaVendita] FOREIGN KEY ([IDDimensioneAreaVendita]) REFERENCES [Negozio].[DimensioneAreaVendita] ([IDDimensioneAreaVendita]),
    CONSTRAINT [FK_Pos_Possiede_TipologiaArredo] FOREIGN KEY ([IDTipologiaArredo]) REFERENCES [Negozio].[TipologiaArredo] ([IDTipologiaArredo])
);






GO
CREATE TRIGGER [Negozio].[TR_NegozioPosPodChangeLog] 
   ON [Negozio].NegozioPosPod
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(Geolocalizzazione) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Geolocalizzazione', CONVERT(  NVARCHAR(50), D.Geolocalizzazione ), CONVERT(  NVARCHAR(50), I.Geolocalizzazione )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(Insegna) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Insegna', D.Insegna, I.Insegna
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(Latitudine) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Latitudine', CONVERT(  NVARCHAR(50), D.Latitudine ), CONVERT(  NVARCHAR(50), I.Latitudine )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(Longitudine) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Longitudine', CONVERT(  NVARCHAR(50), D.Longitudine ), CONVERT(  NVARCHAR(50), I.Longitudine )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(NumeroVetrine) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'NumeroVetrine', CONVERT(  NVARCHAR(50), D.NumeroVetrine ), CONVERT(  NVARCHAR(50), I.NumeroVetrine )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(ShopInStore) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'ShopInStore', CONVERT(  NVARCHAR(50), D.ShopInStore ), CONVERT(  NVARCHAR(50), I.ShopInStore )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(ValoreAffitto) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'ValoreAffitto', CONVERT(  NVARCHAR(50), D.ValoreAffitto ), CONVERT(  NVARCHAR(50), I.ValoreAffitto )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(IDTipologiaArredo) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDTipologiaArredo', DSC.TipologiaArredo, ISC.TipologiaArredo
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Negozio.TipologiaArredo ISC ON I.IDTipologiaArredo = ISC.IDTipologiaArredo
		LEFT JOIN Negozio.TipologiaArredo DSC ON D.IDTipologiaArredo = DSC.IDTipologiaArredo

		IF ( UPDATE(IDDimensioneAreaVendita) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDDimensioneAreaVendita', DSC.DimensioneAreaVendita, ISC.DimensioneAreaVendita
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Negozio.DimensioneAreaVendita ISC ON I.IDDimensioneAreaVendita = ISC.IDDimensioneAreaVendita
		LEFT JOIN Negozio.DimensioneAreaVendita DSC ON D.IDDimensioneAreaVendita = DSC.IDDimensioneAreaVendita
	END
END