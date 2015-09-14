-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Dealer].[SP_Dealer_Get] @IDDealer int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDTipoDealer int

	SELECT @IDTipoDealer = Dealer.Dealer.IDTipoDealer FROM Dealer.Dealer WHERE Dealer.IDDealer = @IDDealer

	IF @IDTipoDealer = 1
		SELECT * FROM Dealer.View_Committenti (nolock) WHERE Dealer.View_Committenti.IDDealer = @IDDealer

	IF @IDTipoDealer = 2
		SELECT * FROM Dealer.View_PosPod (nolock) WHERE Dealer.View_PosPod.IDDealer = @IDDealer

	IF @IDTipoDealer = 3
		SELECT * FROM Dealer.View_Point (nolock) WHERE Dealer.View_Point.IDDealer = @IDDealer
		
	IF @IDTipoDealer = 4
		SELECT * FROM Dealer.View_AgentiCommittenti (nolock) WHERE Dealer.View_AgentiCommittenti.IDDealer = @IDDealer
		
	IF @IDTipoDealer = 5
		SELECT * FROM Dealer.View_SubAgenti (nolock) WHERE Dealer.View_SubAgenti.IDDealer = @IDDealer



END