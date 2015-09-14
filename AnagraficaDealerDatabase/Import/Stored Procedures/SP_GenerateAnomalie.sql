
CREATE PROCEDURE Import.SP_GenerateAnomalie 
	@IDImportazione INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @IDTipoAnomaliaParent INT = 2
	DECLARE @IDMotivazioneParent INT = 2
	DECLARE @IDTipoAnomaliaOperativita INT = 1
	DECLARE @IDMotivazioneOperativita INT = 1
	DECLARE @IDStatoDealerDisattivo INT = 2
	DECLARE @IDTipoDealerPosPos INT = 2
	DECLARE @IDTipoDealerPint INT = 3
	DECLARE @IDTipoDealerSubAgente INT = 5

	-- Generate Parent inactive anomaly for Points
	INSERT INTO Import.Anomalie ( IDTipoAnomalia, IDDealer, IDMotivazione, IDImportazione )
	SELECT @IDTipoAnomaliaParent, D.IDDealer, @IDMotivazioneParent, @IDImportazione
	FROM Dealer.Dealer D
	INNER JOIN InfoGenerali.InfoPoint IP ON D.IDDealer = IP.IDDealer
	INNER JOIN Dealer.Dealer MD ON IP.IDMasterDealer = MD.IDDealer
	WHERE MD.IDStato = @IDStatoDealerDisattivo

	-- Generate Parent inactive anomaly for Pos Pod and Sub Agenti
	INSERT INTO Import.Anomalie ( IDTipoAnomalia, IDDealer, IDMotivazione, IDFunzionario, IDImportazione )
	SELECT @IDTipoAnomaliaParent, D.IDDealer, @IDMotivazioneParent, VC.IDFunzionario, @IDImportazione
	FROM Dealer.Dealer D
	INNER JOIN Vendite.VenditeCanali VC ON D.IDDealer = VC.IDDealer
	INNER JOIN Dealer.Dealer DD ON DD.Codice = LEFT( D.Codice, 5 )
	WHERE DD.IDStato = @IDStatoDealerDisattivo AND 
	( D.IDTipoDealer = @IDTipoDealerPosPos OR D.IDTipoDealer = @IDTipoDealerSubAgente )

	-- Generate Operatività anomaly for Points
	INSERT INTO Import.Anomalie ( IDTipoAnomalia, IDDealer, IDMotivazione, IDImportazione )
	SELECT @IDTipoAnomaliaOperativita, D.IDDealer, @IDMotivazioneOperativita, @IDImportazione
	FROM Dealer.Dealer D
	INNER JOIN Area.Area A ON D.IDDealer = A.IDDealer
	WHERE IDOperativita IS NULL AND
		D.IDTipoDealer = @IDTipoDealerPint

	-- Generate Operatività anomaly for All other dealers
	INSERT INTO Import.Anomalie ( IDTipoAnomalia, IDDealer, IDMotivazione, IDFunzionario, IDImportazione )
	SELECT @IDTipoAnomaliaOperativita, D.IDDealer, @IDMotivazioneOperativita, VC.IDFunzionario, @IDImportazione
	FROM Dealer.Dealer D
	INNER JOIN Vendite.VenditeCanali VC ON D.IDDealer = VC.IDDealer
	INNER JOIN Area.Area A ON D.IDDealer = A.IDDealer
	WHERE IDOperativita IS NULL AND
		D.IDTipoDealer != @IDTipoDealerPint
END