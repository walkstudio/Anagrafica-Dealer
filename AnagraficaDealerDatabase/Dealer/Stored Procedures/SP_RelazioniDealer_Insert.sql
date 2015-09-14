

-- =============================================
-- Author:		Gabriele Oberti
-- Create date: 25/05/2015
-- =============================================
Create PROCEDURE [Dealer].SP_RelazioniDealer_Insert @NomeRelazione nvarchar(50), @IDTipoDealer int, @IDDealer1 int, @IDDealer2 int
AS
BEGIN
	
	SET NOCOUNT ON;
 
	SET XACT_ABORT ON 
	BEGIN TRANSACTION
IF(@IDTipoDealer = 1)
	BEGIN
							    
		INSERT INTO Dealer.RelazioneConsumer(IDDealer1,IDDealer2,Relazione) VALUES
           (@IDDealer1,@IDDealer2,@NomeRelazione)

	    
	
	END
ELSE IF(@IDTipoDealer = 2)		
	BEGIN
		INSERT INTO Dealer.RelazioneBusiness(IDDealerBusiness,IDDealerConsumer,Relazione) VALUES
           (@IDDealer2,@IDDealer1,@NomeRelazione)
	END

	COMMIT TRANSACTION
END