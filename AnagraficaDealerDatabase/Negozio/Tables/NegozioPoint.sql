CREATE TABLE [Negozio].[NegozioPoint] (
    [IndirizzoSpedizioneMateriale] NVARCHAR (50) NULL,
    [NumeroVetrine]                INT           NULL,
    [PointSpecial]                 BIT           NULL,
    [IDTipologiaArredo]            INT           NULL,
    [IDDimensioneAreaVendita]      INT           NULL,
    [IDDealer]                     INT           NOT NULL,
    CONSTRAINT [PK_NegozioPoint] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_NegozioPoint_Negozio] FOREIGN KEY ([IDDealer]) REFERENCES [Negozio].[Negozio] ([IDDealer]),
    CONSTRAINT [FK_Point_Dispone_DimensioneAreaVendita] FOREIGN KEY ([IDDimensioneAreaVendita]) REFERENCES [Negozio].[DimensioneAreaVendita] ([IDDimensioneAreaVendita]),
    CONSTRAINT [FK_Point_Possiede_TipologiaArredo] FOREIGN KEY ([IDTipologiaArredo]) REFERENCES [Negozio].[TipologiaArredo] ([IDTipologiaArredo])
);






GO
CREATE TRIGGER [Negozio].[TR_NegozioPointChangeLog] 
   ON [Negozio].NegozioPoint
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

		IF ( UPDATE(NumeroVetrine) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'NumeroVetrine', CONVERT(  NVARCHAR(50), D.NumeroVetrine ), CONVERT(  NVARCHAR(50), I.NumeroVetrine )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(PointSpecial) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'PointSpecial', CONVERT(  NVARCHAR(50), D.PointSpecial ), CONVERT(  NVARCHAR(50), I.PointSpecial )
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