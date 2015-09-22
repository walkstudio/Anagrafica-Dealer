CREATE TABLE [Dealer].[Dealer] (
    [IDDealer]           INT           IDENTITY (1, 1) NOT NULL,
    [Indirizzo]          NVARCHAR (75) NULL,
    [PIVA]               NCHAR (11)    NULL,
    [Telefono]           NVARCHAR (50) NULL,
    [Fax]                NVARCHAR (50) NULL,
    [DataModifica]       DATETIME      NOT NULL,
    [IDUtente]           INT           NULL,
    [IDTipoDealer]       INT           NULL,
    [IDStato]            INT           NULL,
    [IDStatoSAP]         INT           NULL,
    [Codice]             NVARCHAR (50) NULL,
    [Attivo]             BIT           CONSTRAINT [DF_Dealer_Attivo] DEFAULT ((1)) NOT NULL,
    [Funz]               NVARCHAR (50) NOT NULL,
    [OmnipointID]        INT           NULL,
    [DataModificaUtente] DATETIME      NULL,
    CONSTRAINT [PK_Dealer] PRIMARY KEY CLUSTERED ([IDDealer] ASC),
    CONSTRAINT [FK_E_TipoDealer] FOREIGN KEY ([IDTipoDealer]) REFERENCES [Dealer].[TipoDealer] ([IDTipoDealer]),
    CONSTRAINT [FK_Modifica_Utente] FOREIGN KEY ([IDUtente]) REFERENCES [Utenti].[Utente] ([IDUtente]),
    CONSTRAINT [FK_Si trova_Stato] FOREIGN KEY ([IDStato]) REFERENCES [Dealer].[Stato] ([IDStato])
);
















GO
CREATE TRIGGER [Dealer].[TR_StoricoIndirizzo_Update]
   ON Dealer.Dealer 
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @IDUtente INT
	DECLARE @CurrentDateTime DATETIME = GETDATE()

	SET @IDUtente = ( SELECT IDUtente
					  FROM Utenti.Utente
					  WHERE UserID = USER_NAME() )

	IF ( UPDATE(Indirizzo) )
	BEGIN
		BEGIN TRANSACTION

		BEGIN TRY 

			UPDATE Storico.StoricoIndirizzo
				SET DataFine = @CurrentDateTime
			FROM inserted I
			WHERE Storico.StoricoIndirizzo.IDDealer = I.IDDealer AND Storico.StoricoIndirizzo.DataFine IS NULL

			INSERT INTO Storico.StoricoIndirizzo ( Indirizzo, DataInizio, IDDealer, IDUtente )
			SELECT I.Indirizzo, @CurrentDateTime, I.IDDealer, @IDUtente
			FROM inserted I
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION
		END CATCH

		IF @@TRANCOUNT > 0
			COMMIT TRANSACTION
	END

	IF ( UPDATE(Codice) )
	BEGIN
		BEGIN TRANSACTION

		BEGIN TRY 

			UPDATE Storico.StoricoCodice
				SET DataFine = @CurrentDateTime
			FROM inserted I
			WHERE Storico.StoricoCodice.IDDealer = I.IDDealer AND Storico.StoricoCodice.DataFine IS NULL

			INSERT INTO Storico.StoricoCodice ( Codice, DataInizio, IDDealer, IDUtente )
			SELECT I.Codice, @CurrentDateTime, I.IDDealer, @IDUtente
			FROM inserted I
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION
		END CATCH

		IF @@TRANCOUNT > 0
			COMMIT TRANSACTION
	END
END
GO



GO
CREATE TRIGGER [Dealer].[TR_StoricoIndirizzo_Insert]
   ON Dealer.Dealer 
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @IDUtente INT

	SET @IDUtente = ( SELECT IDUtente
					  FROM Utenti.Utente
					  WHERE UserID = USER_NAME() )

	IF ( UPDATE(Indirizzo) )
	BEGIN
		INSERT INTO Storico.StoricoIndirizzo( Indirizzo, DataInizio, IDDealer, IDUtente )
		SELECT I.Indirizzo, GETDATE(), I.IDDealer, @IDUtente
		FROM inserted I
	END

	IF ( UPDATE(Codice) )
	BEGIN
		INSERT INTO Storico.StoricoCodice( Codice, DataInizio, IDDealer, IDUtente )
		SELECT I.Codice, GETDATE(), I.IDDealer, @IDUtente
		FROM inserted I
	END
END
GO


