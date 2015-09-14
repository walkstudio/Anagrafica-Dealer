

-- =============================================
-- Author:		Gabriele Oberti
-- Create date: 25/05/2015
-- =============================================
Create PROCEDURE [Dealer].[SP_RelazioniDealer_GetDealer] @CodiceDealer nvarchar(50), @RagioneSocialeDealer nvarchar(50), @IDTipoDealer int
AS
BEGIN
	
	SET NOCOUNT ON;

	Declare @CodiceDealerNew nvarchar(75)
	IF(@CodiceDealer = '') 
			SET @CodiceDealerNew = '%'
	ELSE
			SET @CodiceDealerNew = REPLACE(@CodiceDealer, '*','%')


	Declare @RagioneSocialeNew nvarchar(75)
	IF(@RagioneSocialeDealer = '') 
			SET @RagioneSocialeNew = '%'
	ELSE
			SET @RagioneSocialeNew = REPLACE(@RagioneSocialeDealer, '*','%')



IF(@IDTipoDealer = 1)
	BEGIN
		SELECT 	D1.IDDealer AS IDDealer,
				D1.Codice AS CodiceDealer,
				D1.Indirizzo AS IndirizzoDealer,
				V1.Nome1 AS RagioneSocialeDealer		
		FROM Dealer.Dealer D1 (nolock) 
				INNER JOIN Vendite.Vendite V1 (nolock) ON D1.IDDealer = V1.IDDealer									
		WHERE D1.Codice like @CodiceDealerNew AND 
				V1.Nome1 like @RagioneSocialeNew 

	END
ELSE IF(@IDTipoDealer = 2)		
	BEGIN
		SELECT  D2.IDDealerBusiness AS IDDealer,
				D2.Codice AS CodiceDealer,
				D2.Indirizzo AS IndirizzoDealer,
				D2.Nome AS RagioneSocialeDealer
		FROM Dealer.DealerBusiness D2 (nolock)
	    WHERE D2.Codice like @CodiceDealerNew AND 
				D2.Nome like @RagioneSocialeNew 
	END

	
END