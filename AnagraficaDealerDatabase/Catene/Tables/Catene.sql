CREATE TABLE [Catene].[Catene] (
    [IDTipoRemunerazione] INT NULL,
    [IDDealer]            INT NOT NULL,
    CONSTRAINT [PK_Catene] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_Catene_Dealer] FOREIGN KEY ([IDDealer]) REFERENCES [Dealer].[Dealer] ([IDDealer]),
    CONSTRAINT [FK_Catene_TipoRemunerazione] FOREIGN KEY ([IDTipoRemunerazione]) REFERENCES [Catene].[TipoRemunerazione] ([IDTipoRemunerazione])
);






GO
CREATE TRIGGER [Catene].[TR_CateneChangeLog] 
   ON  [Catene].[Catene] 
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(IDTipoRemunerazione) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDTipoRemunerazione', DC.TipoRemunerazione, IC.TipoRemunerazione
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Catene.TipoRemunerazione IC ON I.IDTipoRemunerazione = IC.IDTipoRemunerazione
		LEFT JOIN Catene.TipoRemunerazione DC ON D.IDTipoRemunerazione = DC.IDTipoRemunerazione
	END
END