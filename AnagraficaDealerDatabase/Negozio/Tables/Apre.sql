CREATE TABLE [Negozio].[Apre] (
    [IDOrarioApertura] INT NOT NULL,
    [IDDealer]         INT NOT NULL,
    CONSTRAINT [PK_Apre] PRIMARY KEY CLUSTERED ([IDOrarioApertura] ASC, [IDDealer] ASC),
    CONSTRAINT [FK_Apre_Negozio] FOREIGN KEY ([IDDealer]) REFERENCES [Negozio].[Negozio] ([IDDealer]),
    CONSTRAINT [FK_Apre_OrarioDiApertura] FOREIGN KEY ([IDOrarioApertura]) REFERENCES [Negozio].[OrarioDiApertura] ([IDOrarioApertura])
);






GO
CREATE TRIGGER [Negozio].[TR_ApreChangeLog] 
   ON [Negozio].Apre
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF ( Utility.FN_GetWebUsername() = USER_NAME() )
	BEGIN
		IF ( UPDATE(IDOrarioApertura) )
		INSERT INTO Utility.ChangeLog( IDUtente, IDDealer, DataModifica, NomeCampo, ValorePrecedente, ValoreNuovo )
		SELECT DD.IDUtente, I.IDDealer, DD.DataModifica, 'IDOrarioApertura', DP.DalleMattina + '-' +
																			 DP.AlleMattina + ' ' +
																			 DP.DallePomeriggio + '-' +
																			 DP.AllePomeriggio + ' ' +
																			 IIF( DP.Lun = 1, 'Lun ', '' ) +
																			 IIF( DP.Mar = 1, 'Mar ', '' ) +
																			 IIF( DP.Mer = 1, 'Mer ', '' ) +
																			 IIF( DP.Gio = 1, 'Gio ', '' ) +
																			 IIF( DP.Ven = 1, 'Ven ', '' ) +
																			 IIF( DP.Sab = 1, 'Sab ', '' ) +
																			 IIF( DP.Dom = 1, 'Dom ', '' ),
																			 IP.DalleMattina + ' ' +
																			 IP.AlleMattina + ' ' +
																			 IP.DallePomeriggio + ' ' +
																			 IP.AllePomeriggio + ' ' +
																			 IIF( IP.Lun = 1, 'Lun ', '' ) +
																			 IIF( IP.Mar = 1, 'Mar ', '' ) +
																			 IIF( IP.Mer = 1, 'Mer ', '' ) +
																			 IIF( IP.Gio = 1, 'Gio ', '' ) +
																			 IIF( IP.Ven = 1, 'Ven ', '' ) +
																			 IIF( IP.Sab = 1, 'Sab ', '' ) +
																			 IIF( IP.Dom = 1, 'Dom ', '' )
		FROM inserted I
		LEFT JOIN deleted D ON I.IDDealer = D.IDDealer
		INNER JOIN Dealer.Dealer DD ON I.IDDealer = DD.IDDealer
		INNER JOIN Negozio.OrarioDiApertura IP ON I.IDOrarioApertura = IP.IDOrarioApertura
		LEFT JOIN Negozio.OrarioDiApertura DP ON D.IDOrarioApertura = DP.IDOrarioApertura
	END
END