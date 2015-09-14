CREATE TABLE [Dealer].[CanaliDealer] (
    [IDDealer]              INT NOT NULL,
    [IDCanale]              INT NULL,
    [IDCondizioniPagamento] INT NULL,
    CONSTRAINT [PK_CanaliDealer] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_CanaliDealer_Dealer] FOREIGN KEY ([IDDealer]) REFERENCES [Dealer].[Dealer] ([IDDealer]),
    CONSTRAINT [FK_Dispone_CondizioniPagamento] FOREIGN KEY ([IDCondizioniPagamento]) REFERENCES [Dealer].[CondizioniPagamento] ([IDCondizioniPagamento]),
    CONSTRAINT [FK_Utilizza_Canale] FOREIGN KEY ([IDCanale]) REFERENCES [Dealer].[Canale] ([IDCanale])
);








GO
CREATE TRIGGER Dealer.TR_StoricoCanale_Update
   ON Dealer.CanaliDealer 
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @IDUtente INT
	DECLARE @CurrentDateTime DATETIME = GETDATE()

	SET @IDUtente = ( SELECT IDUtente
					  FROM Utenti.Utente
					  WHERE UserID = USER_NAME() )
	BEGIN TRANSACTION

	BEGIN TRY 

		UPDATE Storico.StoricoCanale
			SET DataFine = @CurrentDateTime
		FROM inserted I
		WHERE Storico.StoricoCanale.IDDealer = I.IDDealer AND Storico.StoricoCanale.DataFine IS NULL

		INSERT INTO Storico.StoricoCanale ( Canale, DataInizio, IDDealer, IDUtente )
		SELECT C.DescrizioneCanale, @CurrentDateTime, I.IDDealer, @IDUtente
		FROM inserted I INNER JOIN
			Dealer.Canale C ON I.IDCanale = C.IDCanale
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
	END CATCH

	IF @@TRANCOUNT > 0
		COMMIT TRANSACTION

END
GO
DISABLE TRIGGER [Dealer].[TR_StoricoCanale_Update]
    ON [Dealer].[CanaliDealer];


GO
CREATE TRIGGER Dealer.TR_StoricoCanale_Insert
   ON Dealer.CanaliDealer 
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @IDUtente INT

	SET @IDUtente = ( SELECT IDUtente
					  FROM Utenti.Utente
					  WHERE UserID = USER_NAME() )

	INSERT INTO Storico.StoricoCanale ( Canale, DataInizio, IDDealer, IDUtente )
	SELECT C.DescrizioneCanale, GETDATE(), I.IDDealer, @IDUtente
	FROM inserted I INNER JOIN
		Dealer.Canale C ON I.IDCanale = C.IDCanale

END
GO
DISABLE TRIGGER [Dealer].[TR_StoricoCanale_Insert]
    ON [Dealer].[CanaliDealer];

