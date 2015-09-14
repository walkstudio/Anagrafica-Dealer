CREATE TABLE [DettaglioAgenti].[DettaglioAgenti] (
    [IDMaterialeEspositivo] INT           NULL,
    [Plurimandatario]       BIT           NULL,
    [ZonaAssegnata]         NVARCHAR (50) NULL,
    [IDDimensionamento]     INT           NULL,
    [IDDealer]              INT           NOT NULL,
    CONSTRAINT [PK_DettaglioAgenti] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_DettaglioAgenti_Dealer] FOREIGN KEY ([IDDealer]) REFERENCES [Dealer].[Dealer] ([IDDealer]),
    CONSTRAINT [FK_DettaglioAgenti_Dimensionamento] FOREIGN KEY ([IDDimensionamento]) REFERENCES [DettaglioAgenti].[Dimensionamento] ([IDDimensionamento]),
    CONSTRAINT [FK_DettaglioAgenti_MaterialeEspositivo] FOREIGN KEY ([IDMaterialeEspositivo]) REFERENCES [DettaglioAgenti].[MaterialeEspositivo] ([IDMaterialeEspositivo])
);






GO
CREATE TRIGGER [DettaglioAgenti].[TR_DettaglioAgentiChangeLog] 
   ON [DettaglioAgenti].[DettaglioAgenti]
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(IDMaterialeEspositivo) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDMaterialeEspositivo', DA.MaterialeEspositivo, IA.MaterialeEspositivo
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN DettaglioAgenti.MaterialeEspositivo IA ON I.IDMaterialeEspositivo = IA.IDMaterialeEspositivo
		LEFT JOIN DettaglioAgenti.MaterialeEspositivo DA ON D.IDMaterialeEspositivo = DA.IDMaterialeEspositivo

		IF ( UPDATE(Plurimandatario) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Plurimandatario', CONVERT( NVARCHAR(50), D.Plurimandatario ), CONVERT( NVARCHAR(50), I.Plurimandatario )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(ZonaAssegnata) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'ZonaAssegnata', D.ZonaAssegnata, I.ZonaAssegnata
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer

		IF ( UPDATE(IDDimensionamento) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDDimensionamento', DA.Dimensionamento, IA.Dimensionamento
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN DettaglioAgenti.Dimensionamento IA ON I.IDDimensionamento = IA.IDDimensionamento
		LEFT JOIN DettaglioAgenti.Dimensionamento DA ON D.IDDimensionamento = DA.IDDimensionamento
	END
END