CREATE TABLE [Area].[Area] (
    [IDOperativita] INT NULL,
    [IDTipologia]   INT NULL,
    [IDDealer]      INT NOT NULL,
    CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_Area_Dealer] FOREIGN KEY ([IDDealer]) REFERENCES [Dealer].[Dealer] ([IDDealer]),
    CONSTRAINT [FK_Ha_Operativita] FOREIGN KEY ([IDOperativita]) REFERENCES [Area].[Operativita] ([IDOperativita]),
    CONSTRAINT [FK_Ha_Tipologia] FOREIGN KEY ([IDTipologia]) REFERENCES [Area].[Tipologia] ([IDTipologia])
);






GO

CREATE TRIGGER [Area].[TR_AreaChangeLog] 
   ON  [Area].[Area] 
   AFTER INSERT,UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(IDOperativita) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Operativita', OD.Operativita, OI.Operativita
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Area.Operativita OI ON I.IDOperativita = OI.IDOperativita
		LEFT JOIN Area.Operativita OD ON D.IDOperativita = OD.IDOperativita

		IF ( UPDATE(IDTipologia) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'Tipologia', TD.Tipologia, TI.Tipologia
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Area.Tipologia TI ON I.IDOperativita = TI.IDTipologia
		LEFT JOIN Area.Tipologia TD ON D.IDOperativita = TD.IDTipologia
	END
END