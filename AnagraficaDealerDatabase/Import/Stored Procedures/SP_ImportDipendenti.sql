CREATE PROCEDURE [Import].[SP_ImportDipendenti] 
AS
BEGIN

	DECLARE @Attivo NVARCHAR(50) = 'Active'
	DECLARE @DealerIDData TABLE ( IDDealer INT )

	INSERT INTO Negozio.Negozio (IDDealer, Dipendenti )
	OUTPUT inserted.IDDealer INTO @DealerIDData
	SELECT D.IDDealer, dip.NumeroDipendenti FROM Dealer.Dealer D
	INNER JOIN (
	SELECT DI.CodiceDealer, COUNT( Stato ) AS NumeroDipendenti
		FROM Import.Dipendenti DI
		INNER JOIN Dealer.Dealer DD ON DD.Codice = DI.CodiceDealer
		WHERE DD.IDTipoDealer = 2 AND DI.Stato = @Attivo
		GROUP BY DI.CodiceDealer
	) Dip ON D.Codice = Dip.CodiceDealer
	WHERE D.IDTipoDealer = 2

	UPDATE Negozio.Negozio
	SET Dipendenti = (
		SELECT COUNT( Stato ) AS NumeroDipendenti
		FROM Import.Dipendenti DI
		INNER JOIN Dealer.Dealer DD ON DD.Codice = DI.CodiceDealer
		WHERE DD.IDDealer NOT IN ( SELECT IDDealer FROM @DealerIDData ) AND
			DD.IDTipoDealer = 2 AND DI.Stato = @Attivo
		GROUP BY DI.CodiceDealer
	)
END