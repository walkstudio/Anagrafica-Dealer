-- =============================================
-- Author:		Diego Fronda
-- Create date: 19/05/2015
-- =============================================

CREATE PROCEDURE [Dealer].[SP_DealerBusiness_Insert] @Codice nchar(11), @Nome nvarchar(75),
                                                    @Indirizzo nvarchar(75)
    --                                                @Esiste bit OUTPUT
    AS
	BEGIN
    SET NOCOUNT ON; 
	SET XACT_ABORT ON 
	BEGIN TRANSACTION
        --exec Dealer.SP_DealerBusiness_Exists @Codice,@Esiste OUTPUT

		--IF @Esiste = 0
		--BEGIN						    
				INSERT INTO Dealer.DealerBusiness (Codice,Nome,Indirizzo) VALUES
           (@Codice,@Nome,@Indirizzo)

	    --END

	COMMIT TRANSACTION


END