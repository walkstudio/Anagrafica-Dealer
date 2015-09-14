CREATE TABLE [Disdetta].[DettaglioDisdetta] (
    [DataDisdetta] DATE NULL,
    [IDDealer]     INT  NOT NULL,
    CONSTRAINT [PK_DettaglioDisdetta] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_DettaglioDisdetta_Disdetta] FOREIGN KEY ([IDDealer]) REFERENCES [Disdetta].[Disdetta] ([IDDealer])
);






GO
CREATE TRIGGER [Disdetta].[TR_DettaglioDisdettaChangeLog] 
   ON [Disdetta].DettaglioDisdetta
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(DataDisdetta) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'DataDisdetta', CONVERT( NVARCHAR(50), D.DataDisdetta ), CONVERT( NVARCHAR(50), I.DataDisdetta )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
	END
END