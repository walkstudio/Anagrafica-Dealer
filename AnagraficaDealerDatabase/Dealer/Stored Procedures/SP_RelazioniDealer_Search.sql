

-- =============================================
-- Author:		Gabriele Oberti
-- Create date: 18/05/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_RelazioniDealer_Search] @IDTipoDealer int, 
														@CodiceDealer nvarchar(75), 
														@RagioneSociale nvarchar(75),
														@Relazione nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

	Declare @CodiceDealerNew nvarchar(75)
	IF(@CodiceDealer = '') 
			SET @CodiceDealerNew = '%'
	ELSE
			SET @CodiceDealerNew = REPLACE(@CodiceDealer, '*','%')


	Declare @RagioneSocialeNew nvarchar(75)
	IF(@RagioneSociale = '') 
			SET @RagioneSocialeNew = '%'
	ELSE
			SET @RagioneSocialeNew = REPLACE(@RagioneSociale, '*','%')

	Declare @RelazioneNew nvarchar(50)
	IF(@Relazione = '') 
			SET @RelazioneNew = '%'
	ELSE
			SET @RelazioneNew = REPLACE(@Relazione, '*','%')


IF(@IDTipoDealer = 1)
	BEGIN
		SELECT  RC.IDRelazioneConsumer AS IDRelazione,
				RC.Relazione AS NomeRelazione,
				D1.IDDealer AS IDDealerConsumer,
				D1.Codice AS CodiceDealerConsumer,
				D1.Indirizzo AS IndirizzoDealerConsumer,
				V1.Nome1 AS RagioneSocialeDealerConsumer,
				1 AS IDTipoDealer,
				D2.IDDealer AS IDDealer,
				D2.Codice AS CodiceDealer,
				D2.Indirizzo AS IndirizzoDealer,
				V2.Nome1 AS RagioneSocialeDealer			
		FROM Dealer.RelazioneConsumer RC (nolock) INNER JOIN Dealer.Dealer D1 (nolock) ON RC.IDDealer1 = D1.IDDealer
													INNER JOIN Vendite.Vendite V1 (nolock) ON D1.IDDealer = V1.IDDealer
													INNER JOIN Dealer.Dealer D2 (nolock) ON RC.IDDealer2 = D2.IDDealer
													INNER JOIN Vendite.Vendite V2 (nolock) ON D2.IDDealer = V2.IDDealer

		WHERE (D1.Codice like @CodiceDealerNew OR D2.Codice like @CodiceDealerNew) AND
				(V1.Nome1 like @RagioneSocialeNew OR V2.Nome1 like @RagioneSocialeNew) AND
				(RC.Relazione like @RelazioneNew)
	END
ELSE IF(@IDTipoDealer = 2)		
	BEGIN
		SELECT  RB.IDRelazioneBusiness AS IDRelazione,
				RB.Relazione AS NomeRelazione,
				D1.IDDealer AS IDDealerConsumer,
				D1.Codice AS CodiceDealerConsumer,
				D1.Indirizzo AS IndirizzoDealerConsumer,
				V1.Nome1 AS RagioneSocialeDealerConsumer,
				2 AS IDTipoDealer,
				D2.IDDealerBusiness AS IDDealer,
				D2.Codice AS CodiceDealer,
				D2.Indirizzo AS IndirizzoDealer,
				D2.Nome AS RagioneSocialeDealer			
		FROM Dealer.RelazioneBusiness RB (nolock) INNER JOIN Dealer.Dealer D1 (nolock) ON RB.IDDealerConsumer = D1.IDDealer
													INNER JOIN Vendite.Vendite V1 (nolock) ON D1.IDDealer = V1.IDDealer
													INNER JOIN Dealer.DealerBusiness D2 (nolock) ON RB.IDDealerBusiness = D2.IDDealerBusiness

		WHERE (D1.Codice like @CodiceDealerNew OR D2.Codice like @CodiceDealerNew) AND
				(V1.Nome1 like @RagioneSocialeNew OR D2.Nome like @RagioneSocialeNew) AND
				(RB.Relazione like @RelazioneNew)
	END
ELSE 
	BEGIN
		SELECT  RC.IDRelazioneConsumer AS IDRelazione,
				RC.Relazione AS NomeRelazione,
				D1.IDDealer AS IDDealerConsumer,
				D1.Codice AS CodiceDealerConsumer,
				D1.Indirizzo AS IndirizzoDealerConsumer,
				V1.Nome1 AS RagioneSocialeDealerConsumer,
				1 AS IDTipoDealer,
				D2.IDDealer AS IDDealer,
				D2.Codice AS CodiceDealer,
				D2.Indirizzo AS IndirizzoDealer,
				V2.Nome1 AS RagioneSocialeDealer			
		FROM Dealer.RelazioneConsumer RC (nolock) INNER JOIN Dealer.Dealer D1 (nolock) ON RC.IDDealer1 = D1.IDDealer
													INNER JOIN Vendite.Vendite V1 (nolock) ON D1.IDDealer = V1.IDDealer
													INNER JOIN Dealer.Dealer D2 (nolock) ON RC.IDDealer2 = D2.IDDealer
													INNER JOIN Vendite.Vendite V2 (nolock) ON D2.IDDealer = V2.IDDealer

		WHERE (D1.Codice like @CodiceDealerNew OR D2.Codice like @CodiceDealerNew) AND
				(V1.Nome1 like @RagioneSocialeNew OR V2.Nome1 like @RagioneSocialeNew) AND
				(RC.Relazione like @RelazioneNew)

		UNION ALL

		SELECT  RB.IDRelazioneBusiness AS IDRelazione,
				RB.Relazione AS NomeRelazione,
				D1.IDDealer AS IDDealerConsumer,
				D1.Codice AS CodiceDealerConsumer,
				D1.Indirizzo AS IndirizzoDealerConsumer,
				V1.Nome1 AS RagioneSocialeDealerConsumer,
				2 AS IDTipoDealer,
				D2.IDDealerBusiness AS IDDealer,
				D2.Codice AS CodiceDealer,
				D2.Indirizzo AS IndirizzoDealer,
				D2.Nome AS RagioneSocialeDealer			
		FROM Dealer.RelazioneBusiness RB (nolock) INNER JOIN Dealer.Dealer D1 (nolock) ON RB.IDDealerConsumer = D1.IDDealer
													INNER JOIN Vendite.Vendite V1 (nolock) ON D1.IDDealer = V1.IDDealer
													INNER JOIN Dealer.DealerBusiness D2 (nolock) ON RB.IDDealerBusiness = D2.IDDealerBusiness

		WHERE (D1.Codice like @CodiceDealerNew OR D2.Codice like @CodiceDealerNew) AND
				(V1.Nome1 like @RagioneSocialeNew OR D2.Nome like @RagioneSocialeNew) AND
				(RB.Relazione like @RelazioneNew)


	END
END