CREATE PROCEDURE [Import].[SP_CreateScartiTable] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO Import.Scarti ( IDImportazione, CodiceDealer, IDTipoDealer, Errori )
SELECT TS.IDImportazione, TS.CodiceDealer, TS.IDTipoDealer,
       STUFF( (SELECT distinct ', ' + Errori E
               FROM Import.TmpScarti TS2
               WHERE TS2.CodiceDealer = TS.CodiceDealer AND
				TS2.IDTipoDealer = TS.IDTipoDealer
               ORDER BY E
               FOR XML PATH(''), TYPE).value('.', 'varchar(max)'),1,1,'')
       AS Errori
       FROM Import.TmpScarti TS
	  GROUP BY IDImportazione, CodiceDealer, IDTipoDealer
END