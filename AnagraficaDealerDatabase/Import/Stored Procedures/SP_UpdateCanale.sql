CREATE PROCEDURE Import.SP_UpdateCanale
	@Nome NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Dealer.Canale( NomeCanale )
		VALUES ( @Nome )

END