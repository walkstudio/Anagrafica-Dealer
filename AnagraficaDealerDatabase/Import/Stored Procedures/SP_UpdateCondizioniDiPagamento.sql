CREATE PROCEDURE Import.SP_UpdateCondizioniDiPagamento
	@Nome NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Dealer.CondizioniPagamento ( NomeCondizioniPagamento )
		VALUES ( @Nome )

END