CREATE PROCEDURE [Import].[SP_DeleteEntities] 
AS
BEGIN
	SET NOCOUNT ON;

	-- Logically Delete Point
	UPDATE Dealer.Dealer SET Attivo = 0
	FROM Dealer.Dealer D INNER JOIN Import.PointToHide P ON
		D.IDDealer = P.IDDealer

	-- Logically Delete Pos & Pod
	UPDATE Dealer.Dealer SET Attivo = 0
	FROM Dealer.Dealer D INNER JOIN Import.PosPodToHide P ON
		D.IDDealer = P.IDDealer

	-- Logically Delete Sub Agente
	UPDATE Dealer.Dealer SET Attivo = 0
	FROM Dealer.Dealer D INNER JOIN Import.SubAgenteToHide S ON
		D.IDDealer = S.IDDealer
END