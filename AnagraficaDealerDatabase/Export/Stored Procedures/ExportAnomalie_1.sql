
-- =============================================
-- Author:		Gabriele Oberti
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Export].[ExportAnomalie] @IDTipoAnomalia tinyint, @IDImportazione int
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT D.Codice AS Codice, 
		Nome1 AS [Ragione Sociale],	
		Motivazione AS Motivazione, 
		F.Nome AS	Funzionario,	
		TD.NomeTipoDealer AS [Tipo dealer]
		FROM Import.Anomalie A (nolock) INNER JOIN Dealer.Dealer D (nolock) 
					ON A.IDDealer = D.IDDealer
										INNER JOIN Dealer.TipoDealer TD (nolock) 
					ON D.IDTipoDealer = TD.IDTipoDealer
										INNER JOIN Vendite.Vendite V (nolock)
					ON D.IDDealer = V.IDDealer
										INNER JOIN Utenti.Funzionario F (nolock) 
					ON A.IDFunzionario = F.IDFunzionario
										INNER JOIN Import.AnomalieMotivazione M (nolock)
					ON A.IDMotivazione = M.IDMotivazioneAnomalia
										INNER JOIN Import.AnomalieTipo TA (nolock)
					ON A.IDTipoAnomalia = TA.IDTipoAnomalia

									LEFT JOIN Import.Importazioni I (nolock)
					ON A.IDImportazione = I.IDImportazione 

		WHERE A.IDTipoAnomalia = @IDTipoAnomalia AND I.IDImportazione = @IDImportazione
		Order by Codice desc

END