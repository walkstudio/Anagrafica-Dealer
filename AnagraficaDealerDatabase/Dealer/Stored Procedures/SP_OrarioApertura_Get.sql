-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Dealer].[SP_OrarioApertura_Get] 
									@IDDealer int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT        Negozio.OrarioDiApertura.IDOrarioApertura, Negozio.OrarioDiApertura.DalleMattina, Negozio.OrarioDiApertura.AlleMattina, 
                         Negozio.OrarioDiApertura.DallePomeriggio, Negozio.OrarioDiApertura.AllePomeriggio, Negozio.OrarioDiApertura.Lun, Negozio.OrarioDiApertura.Mar, 
                         Negozio.OrarioDiApertura.Mer, Negozio.OrarioDiApertura.Gio, Negozio.OrarioDiApertura.Ven, Negozio.OrarioDiApertura.Sab, Negozio.OrarioDiApertura.Dom
FROM            Negozio.OrarioDiApertura INNER JOIN
                         Negozio.Apre ON Negozio.OrarioDiApertura.IDOrarioApertura = Negozio.Apre.IDOrarioApertura
WHERE        (Negozio.Apre.IDDealer = @IDDealer)
ORDER BY DalleMattina, AlleMattina, DallePomeriggio, AllePomeriggio

END