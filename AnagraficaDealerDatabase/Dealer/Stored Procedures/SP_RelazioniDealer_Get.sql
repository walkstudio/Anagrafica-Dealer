

-- =============================================
-- Author:		Gabriele Oberti
-- Create date: 18/05/2015
-- =============================================
CREATE PROCEDURE [Dealer].[SP_RelazioniDealer_Get] @IDRelazione int, @IDTipoDealer int
AS
BEGIN
	
	SET NOCOUNT ON;

IF(@IDTipoDealer = 1)
	BEGIN
		SELECT  RC.IDRelazioneConsumer AS IDRelazione,
				RC.Relazione AS NomeRelazione,
				D1.IDDealer AS IDDealerConsumer,
				D1.Codice AS CodiceDealerConsumer,
				D1.Indirizzo AS IndirizzoDealerConsumer,
				V1.Nome1 AS RagioneSocialeDealerConsumer,
				S1.NomeStato AS StatoDealerConsumer,
				C1.NomeCanale AS CanaleDealerConsumer,
				1 AS IDTipoDealer,
				D2.IDDealer AS IDDealer,
				D2.Codice AS CodiceDealer,
				D2.Indirizzo AS IndirizzoDealer,
				V2.Nome1 AS RagioneSocialeDealer,
				S2.NomeStato AS StatoDealer,
				C2.NomeCanale AS CanaleDealer	
		FROM Dealer.RelazioneConsumer RC (nolock) INNER JOIN Dealer.Dealer D1 (nolock) ON RC.IDDealer1 = D1.IDDealer
													INNER JOIN Vendite.Vendite V1 (nolock) ON D1.IDDealer = V1.IDDealer
													INNER JOIN Dealer.CanaliDealer CD1 (nolock) ON CD1.IDDealer = D1.IDDealer
													INNER JOIN Dealer.Canale C1 (nolock) ON CD1.IDCanale = C1.IDCanale
													INNER JOIN Dealer.Stato S1 (nolock) ON D1.IDStato = S1.IDStato

													INNER JOIN Dealer.Dealer D2 (nolock) ON RC.IDDealer2 = D2.IDDealer
													INNER JOIN Vendite.Vendite V2 (nolock) ON D2.IDDealer = V2.IDDealer
													INNER JOIN Dealer.CanaliDealer CD2 (nolock) ON CD2.IDDealer = D2.IDDealer
													INNER JOIN Dealer.Canale C2 (nolock) ON CD2.IDCanale = C2.IDCanale
													INNER JOIN Dealer.Stato S2 (nolock) ON D2.IDStato = S2.IDStato

		WHERE RC.IDRelazioneConsumer = @IDRelazione
	END
ELSE IF(@IDTipoDealer = 2)		
	BEGIN
		SELECT  RB.IDRelazioneBusiness AS IDRelazione,
				RB.Relazione AS NomeRelazione,
				D1.IDDealer AS IDDealerConsumer,
				D1.Codice AS CodiceDealerConsumer,
				D1.Indirizzo AS IndirizzoDealerConsumer,
				V1.Nome1 AS RagioneSocialeDealerConsumer,
				S1.NomeStato AS StatoDealerConsumer,
				C1.NomeCanale AS CanaleDealerConsumer,
				2 AS IDTipoDealer,
				D2.IDDealerBusiness AS IDDealer,
				D2.Codice AS CodiceDealer,
				D2.Indirizzo AS IndirizzoDealer,
				D2.Nome AS RagioneSocialeDealer,
				'' AS StatoDealer,
				'' AS CanaleDealer
			
						
		FROM Dealer.RelazioneBusiness RB (nolock) INNER JOIN Dealer.Dealer D1 (nolock) ON RB.IDDealerConsumer = D1.IDDealer
													INNER JOIN Vendite.Vendite V1 (nolock) ON D1.IDDealer = V1.IDDealer
													INNER JOIN Dealer.DealerBusiness D2 (nolock) ON RB.IDDealerBusiness = D2.IDDealerBusiness
													INNER JOIN Dealer.CanaliDealer CD1 (nolock) ON CD1.IDDealer = D1.IDDealer
													INNER JOIN Dealer.Canale C1 (nolock) ON CD1.IDCanale = C1.IDCanale
													INNER JOIN Dealer.Stato S1 (nolock) ON D1.IDStato = S1.IDStato

		WHERE RB.IDRelazioneBusiness = @IDRelazione
	END

	
END