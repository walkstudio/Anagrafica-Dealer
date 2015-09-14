
CREATE PROCEDURE Dealer.SP_RelazioniDealer_Delete @IDRelazione int, @IDTipoDealer int
AS
BEGIN
	
	SET NOCOUNT ON;
	SET XACT_ABORT ON 
	BEGIN TRANSACTION
	IF @IDTipoDealer =1
		begin
		DELETE FROM Dealer.RelazioneConsumer
					 WHERE IDRelazioneConsumer = @IDRelazione
		end
	IF @IDTipoDealer = 2
		begin
			DELETE FROM Dealer.RelazioneBusiness
				 WHERE IDRelazioneBusiness = @IDRelazione
		end
	COMMIT TRANSACTION
END