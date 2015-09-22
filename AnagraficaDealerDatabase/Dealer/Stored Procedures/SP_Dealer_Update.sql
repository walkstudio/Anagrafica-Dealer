-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Dealer].[SP_Dealer_Update]
									@IDUtente int,
									@DealerUpdateXml as XML = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--	DECLARE @Text varchar(max) 
--	SET @Text = 
--'<DealerUpdate>
--<Dealer IDDealer="11">
--	<Variazioni>
--		<Variazione NomeCampo="Operativita" DatoVecchio="" DatoNuovo="Si" /> 
--		<Variazione NomeCampo="Richiedente" DatoVecchio="" DatoNuovo="Si da Dealer" /> 
--		<Variazione NomeCampo="DataTerminePreavviso" DatoVecchio="" DatoNuovo="01/01/2001" /> 
--		<Variazione NomeCampo="VecchioCodice" DatoVecchio="" DatoNuovo="1.1" /> 
--		<Variazione NomeCampo="AreaDiCompetenza" DatoVecchio="" DatoNuovo="CENTRO" /> 
--		<Variazione NomeCampo="CodiceFornitore" DatoVecchio="" DatoNuovo="Test1" /> 
--		<Variazione NomeCampo="CodiceVogi" DatoVecchio="" DatoNuovo="Test1" /> 
--		<Variazione NomeCampo="FirmaDigitale" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="DataContratto" DatoVecchio="" DatoNuovo="01/01/2001" /> 
--		<Variazione NomeCampo="FideiussioneAffitto" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="DataInvioDisdetta" DatoVecchio="" DatoNuovo="01/01/2001" /> 
--		<Variazione NomeCampo="FideiussioneCommerciale" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="GiorniPreavviso" DatoVecchio="" DatoNuovo="1" /> 
--		<Variazione NomeCampo="ProvRea" DatoVecchio="" DatoNuovo="AGRIGENTO" /> 
--		<Variazione NomeCampo="Rea" DatoVecchio="" DatoNuovo="Test1" /> 
--		<Variazione NomeCampo="Note" DatoVecchio="" DatoNuovo="Test1" /> 
--		<Variazione NomeCampo="Pec" DatoVecchio="" DatoNuovo="Test1@Test1.Test1" /> 
--		<Variazione NomeCampo="NomeTitolare" DatoVecchio="" DatoNuovo="Test1" /> 
--		<Variazione NomeCampo="Cluster" DatoVecchio="" DatoNuovo="BRONZE" /> 
--		<Variazione NomeCampo="CFTitolare" DatoVecchio="" DatoNuovo="Test1" /> 
--		<Variazione NomeCampo="NumeroVetrine" DatoVecchio="" DatoNuovo="1" /> 
--		<Variazione NomeCampo="EmailTitolare" DatoVecchio="" DatoNuovo="Test1@Test1.Test1" /> 
--		<Variazione NomeCampo="TelefonoNegozio" DatoVecchio="" DatoNuovo="Test1" /> 
--		<Variazione NomeCampo="OrarioApertura" DatoVecchio="--|--|--|--|;--|--|--|--|;--|--|--|--|;--|--|--|--|;" DatoNuovo="8:00|12:00|15:00|20:00|Lu#Ma#Me#Gi#Ve#;9:00|--|--|21:00|Sa#Do#;--|--|--|--|;--|--|--|--|;" /> 
--		<Variazione NomeCampo="SegmentazioneCanale" DatoVecchio="" DatoNuovo="ag promoter" /> 
--		<Variazione NomeCampo="TipoRemunerazione" DatoVecchio="" DatoNuovo="DEDICATA" /> 
--		<Variazione NomeCampo="Piu12" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="Supporti" DatoVecchio="" DatoNuovo="Test1" /> 
--	</Variazioni>
--</Dealer>
--<Dealer IDDealer="12">
--	<Variazioni>
--		<Variazione NomeCampo="DataAperturaNegozio" DatoVecchio="" DatoNuovo="02/02/2002" /> 
--		<Variazione NomeCampo="Operativita" DatoVecchio="" DatoNuovo="No" /> 
--		<Variazione NomeCampo="Richiedente" DatoVecchio="" DatoNuovo="Si da Vodafone" /> 
--		<Variazione NomeCampo="DataTerminePreavviso" DatoVecchio="" DatoNuovo="02/02/2002" /> 
--		<Variazione NomeCampo="Tipologia" DatoVecchio="" DatoNuovo="no pos / no pod" /> 
--		<Variazione NomeCampo="DataChiusuraNegozio" DatoVecchio="" DatoNuovo="02/02/2002" /> 
--		<Variazione NomeCampo="VecchioCodice" DatoVecchio="" DatoNuovo="2.2" /> 
--		<Variazione NomeCampo="AreaDiCompetenza" DatoVecchio="" DatoNuovo="NORD/E" /> 
--		<Variazione NomeCampo="Pec" DatoVecchio="" DatoNuovo="Test2@Test2.Test2" /> 
--		<Variazione NomeCampo="CodiceFornitore" DatoVecchio="" DatoNuovo="Test2" /> 
--		<Variazione NomeCampo="MagazzinoCentralizzato" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="CodiceVogi" DatoVecchio="" DatoNuovo="Test2" /> 
--		<Variazione NomeCampo="DataInvioDisdetta" DatoVecchio="" DatoNuovo="02/02/2002" /> 
--		<Variazione NomeCampo="GiorniPreavviso" DatoVecchio="" DatoNuovo="2" /> 
--		<Variazione NomeCampo="Note" DatoVecchio="" DatoNuovo="Test2" /> 
--		<Variazione NomeCampo="NomeTitolare" DatoVecchio="" DatoNuovo="Test2" /> 
--		<Variazione NomeCampo="TipologiaArredo" DatoVecchio="" DatoNuovo="Canale MD: Vetrinette Vodafone (0-10)" /> 
--		<Variazione NomeCampo="CFTitolare" DatoVecchio="" DatoNuovo="Test2" /> 
--		<Variazione NomeCampo="Longitudine" DatoVecchio="" DatoNuovo="2" /> 
--		<Variazione NomeCampo="EmailTitolare" DatoVecchio="" DatoNuovo="Test2@Test2.Test2" /> 
--		<Variazione NomeCampo="Latitudine" DatoVecchio="" DatoNuovo="2" /> 
--		<Variazione NomeCampo="TelefonoNegozio" DatoVecchio="" DatoNuovo="Test2" /> 
--		<Variazione NomeCampo="Insegna" DatoVecchio="" DatoNuovo="Test2" /> 
--		<Variazione NomeCampo="ValoreAffitto" DatoVecchio="" DatoNuovo="2" /> 
--		<Variazione NomeCampo="CentroCommerciale" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="Cluster" DatoVecchio="" DatoNuovo="GOLD" /> 
--		<Variazione NomeCampo="NumeroVetrine" DatoVecchio="" DatoNuovo="2" /> 
--		<Variazione NomeCampo="OrarioApertura" DatoVecchio="8:00|13:00|15:00|19:00|Lu#Ma#Me#Gi#Ve#;9:00|20:00|--|--|Sa#Do#;--|--|--|--|;10:00|--|--|21:00|Ve#;" DatoNuovo="8:00|13:00|15:00|19:00|Lu#Ma#Me#Gi#Ve#;9:00|20:00|--|--|Sa#Do#;--|--|--|--|;--|--|--|--|;" /> 
--		<Variazione NomeCampo="DatiCateneAm" DatoVecchio="" DatoNuovo="Test2" /> 
--		<Variazione NomeCampo="GestoreCondiviso" DatoVecchio="FASTWEB|H3G|MEDIASET|SKY|WIND|" DatoNuovo="FASTWEB|H3G|MEDIASET|" /> 
--		<Variazione NomeCampo="DatiCateneFunzionario" DatoVecchio="" DatoNuovo="Test2" /> 
--		<Variazione NomeCampo="SegmentazioneCanale" DatoVecchio="" DatoNuovo="apple" /> 
--		<Variazione NomeCampo="NegozioTop" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="TipoRemunerazione" DatoVecchio="" DatoNuovo="STD" /> 
--		<Variazione NomeCampo="ShopInStore" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="Supporti" DatoVecchio="" DatoNuovo="Test2" /> 
--	</Variazioni>
--</Dealer>

--<Dealer IDDealer="13">
--	<Variazioni>
--		  <Variazione NomeCampo="IndirizzoSpedizioneMateriale" DatoVecchio="" DatoNuovo="Test3" /> 
--		  <Variazione NomeCampo="DataAperturaNegozio" DatoVecchio="" DatoNuovo="03/03/2003" /> 
--		  <Variazione NomeCampo="Operativita" DatoVecchio="" DatoNuovo="No" /> 
--		  <Variazione NomeCampo="Richiedente" DatoVecchio="" DatoNuovo="Consensuale" /> 
--		  <Variazione NomeCampo="DataTerminePreavviso" DatoVecchio="" DatoNuovo="03/03/2003" /> 
--		  <Variazione NomeCampo="DataChiusuraNegozio" DatoVecchio="" DatoNuovo="03/03/2003" /> 
--		  <Variazione NomeCampo="VecchioCodice" DatoVecchio="" DatoNuovo="3.3" /> 
--		  <Variazione NomeCampo="CodiceFornitore" DatoVecchio="" DatoNuovo="Test3" /> 
--		  <Variazione NomeCampo="Pec" DatoVecchio="" DatoNuovo="Test3@Test3.Test3" /> 
--		  <Variazione NomeCampo="CodiceVogi" DatoVecchio="" DatoNuovo="Test3" /> 
--		  <Variazione NomeCampo="FirmaDigitale" DatoVecchio="False" DatoNuovo="True" /> 
--		  <Variazione NomeCampo="ProvRea" DatoVecchio="" DatoNuovo="AREZZO" /> 
--		  <Variazione NomeCampo="Rea" DatoVecchio="" DatoNuovo="Test3" /> 
--		  <Variazione NomeCampo="GiorniPreavviso" DatoVecchio="" DatoNuovo="3" /> 
--		  <Variazione NomeCampo="Note" DatoVecchio="" DatoNuovo="Test3" /> 
--		  <Variazione NomeCampo="NomeTitolare" DatoVecchio="" DatoNuovo="Test3" /> 
--		  <Variazione NomeCampo="CentroCommerciale" DatoVecchio="False" DatoNuovo="True" /> 
--		  <Variazione NomeCampo="CFTitolare" DatoVecchio="" DatoNuovo="Test3" /> 
--		  <Variazione NomeCampo="EmailTitolare" DatoVecchio="" DatoNuovo="Test3@Test3.Test3" /> 
--		  <Variazione NomeCampo="DimensioneAreaVendita" DatoVecchio="" DatoNuovo="40-59" /> 
--		  <Variazione NomeCampo="TelefonoNegozio" DatoVecchio="" DatoNuovo="Test3" /> 
--		  <Variazione NomeCampo="NumeroVetrine" DatoVecchio="" DatoNuovo="3" /> 
--		  <Variazione NomeCampo="TipologiaArredo" DatoVecchio="" DatoNuovo="Canale MD: Vetrinette Vodafone (0-10)" /> 
--		  <Variazione NomeCampo="OrarioApertura" DatoVecchio="--|--|--|--|;--|--|--|--|;--|--|--|--|;--|--|--|--|;" DatoNuovo="7:00|12:00|14:00|19:00|Lu#Ma#Me#Gi#Ve#;8:00|--|--|20:00|Sa#Do#;--|--|--|--|;--|--|--|--|;" /> 
--		  <Variazione NomeCampo="PointSpecial" DatoVecchio="False" DatoNuovo="True" /> 
--		  <Variazione NomeCampo="Supporti" DatoVecchio="" DatoNuovo="Test3" /> 
--		  <Variazione NomeCampo="GestoreCondiviso" DatoVecchio="ROSSONE|TIM|TIM-H3G|" DatoNuovo="SKY|TIM|TIM-H3G|" /> 
--	</Variazioni>
--</Dealer>

--<Dealer IDDealer="14">
--	<Variazioni>
--		<Variazione NomeCampo="Operativita" DatoVecchio="" DatoNuovo="Fittizio" /> 
--		<Variazione NomeCampo="Richiedente" DatoVecchio="" DatoNuovo="Consensuale" /> 
--		<Variazione NomeCampo="DataTerminePreavviso" DatoVecchio="" DatoNuovo="4/4/2004" /> 
--		<Variazione NomeCampo="VecchioCodice" DatoVecchio="" DatoNuovo="4.4" /> 
--		<Variazione NomeCampo="ZonaAssegnata" DatoVecchio="" DatoNuovo="Test4" /> 
--		<Variazione NomeCampo="CodiceFornitore" DatoVecchio="" DatoNuovo="Test4" /> 
--		<Variazione NomeCampo="CodiceVogi" DatoVecchio="" DatoNuovo="Test4" /> 
--		<Variazione NomeCampo="DataContratto" DatoVecchio="" DatoNuovo="4/4/2004" /> 
--		<Variazione NomeCampo="FirmaDigitale" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="DataDisdetta" DatoVecchio="" DatoNuovo="4/4/2004" /> 
--		<Variazione NomeCampo="Plurimandatario" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="DataInvioDisdetta" DatoVecchio="" DatoNuovo="4/4/2004" /> 
--		<Variazione NomeCampo="ProvRea" DatoVecchio="" DatoNuovo="BOLOGNA" /> 
--		<Variazione NomeCampo="GiorniPreavviso" DatoVecchio="" DatoNuovo="4" /> 
--		<Variazione NomeCampo="Rea" DatoVecchio="" DatoNuovo="Test4" /> 
--		<Variazione NomeCampo="Pec" DatoVecchio="" DatoNuovo="Test4@Test4.Test4" /> 
--		<Variazione NomeCampo="Note" DatoVecchio="" DatoNuovo="Test4" /> 
--		<Variazione NomeCampo="NomeTitolare" DatoVecchio="" DatoNuovo="Test4" /> 
--		<Variazione NomeCampo="CFTitolare" DatoVecchio="" DatoNuovo="Test4" /> 
--		<Variazione NomeCampo="Cluster" DatoVecchio="" DatoNuovo="MINIMAL" /> 
--		<Variazione NomeCampo="EmailTitolare" DatoVecchio="" DatoNuovo="Test4@Test4.Test4" /> 
--		<Variazione NomeCampo="MaterialeEspositivo" DatoVecchio="" DatoNuovo="GAZEBO" /> 
--		<Variazione NomeCampo="TelefonoNegozio" DatoVecchio="" DatoNuovo="Test4" /> 
--		<Variazione NomeCampo="Dimensionamento" DatoVecchio="" DatoNuovo="Grande" /> 
--		<Variazione NomeCampo="OrarioApertura" DatoVecchio="--|--|--|--|;--|--|--|--|;--|--|--|--|;--|--|--|--|;" DatoNuovo="8:00|12:30|14:30|19:00|Lu#Ma#Me#Gi#Ve#;9:00|13:00|14:00|20:00|Sa#;8:00|--|--|21:00|Do#;--|--|--|--|;" /> 
--	</Variazioni>
--</Dealer>

--<Dealer IDDealer="15">
--	<Variazioni>
--		<Variazione NomeCampo="IndirizzoSpedizioneMateriale" DatoVecchio="" DatoNuovo="Test5" /> 
--		<Variazione NomeCampo="Operativita" DatoVecchio="" DatoNuovo="Fittizio" /> 
--		<Variazione NomeCampo="VecchioCodice" DatoVecchio="" DatoNuovo="Test5" /> 
--		<Variazione NomeCampo="ZonaAssegnata" DatoVecchio="" DatoNuovo="Test5" /> 
--		<Variazione NomeCampo="CodiceFornitore" DatoVecchio="" DatoNuovo="Test5" /> 
--		<Variazione NomeCampo="CodiceVogi" DatoVecchio="" DatoNuovo="Test5" /> 
--		<Variazione NomeCampo="FirmaDigitale" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="DataContratto" DatoVecchio="" DatoNuovo="5/5/2005" /> 
--		<Variazione NomeCampo="Plurimandatario" DatoVecchio="False" DatoNuovo="True" /> 
--		<Variazione NomeCampo="Pec" DatoVecchio="" DatoNuovo="Test5@Test5.Test5" /> 
--		<Variazione NomeCampo="Note" DatoVecchio="" DatoNuovo="Test5" /> 
--		<Variazione NomeCampo="NomeTitolare" DatoVecchio="" DatoNuovo="Test5" /> 
--		<Variazione NomeCampo="CFTitolare" DatoVecchio="" DatoNuovo="Test5" /> 
--		<Variazione NomeCampo="Cluster" DatoVecchio="" DatoNuovo="MINIMAL" /> 
--		<Variazione NomeCampo="EmailTitolare" DatoVecchio="" DatoNuovo="Test5@Test5.Test5" /> 
--		<Variazione NomeCampo="MaterialeEspositivo" DatoVecchio="" DatoNuovo="TAVOLINO" /> 
--		<Variazione NomeCampo="TelefonoNegozio" DatoVecchio="" DatoNuovo="Test5" /> 
--		<Variazione NomeCampo="Dimensionamento" DatoVecchio="" DatoNuovo="Medio" /> 
--		<Variazione NomeCampo="OrarioApertura" DatoVecchio="--|--|--|--|;--|--|--|--|;--|--|--|--|;--|--|--|--|;" DatoNuovo="7:00|--|--|19:30|Ma#Me#Gi#Ve#Sa#Do#;--|--|--|--|;--|--|--|--|;--|--|--|--|;" /> 
--		<Variazione NomeCampo="ModelloVendita" DatoVecchio="PRESIDIO EVENTI|" DatoNuovo="PRESIDIO EVENTI|TELEMKTG|" /> 
--		<Variazione NomeCampo="TipoRemunerazione" DatoVecchio="" DatoNuovo="DEDICATA" /> 
--		<Variazione NomeCampo="Supporti" DatoVecchio="" DatoNuovo="Test5" /> 
--	</Variazioni>
--</Dealer>

--</DealerUpdate>'

DECLARE @hDoc AS INT

--DECLARE @DealerUpdateXml xml
--SET @DealerUpdateXml = CAST(@Text as xml)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @DealerUpdateXml

SELECT IDDealer, NomeCampo, DatoVecchio, DatoNuovo
INTO #TempTableXml
FROM OPENXML(@hDoc, 'DealerUpdate/Dealer/Variazioni/Variazione')
WITH 
(
IDDealer int '../../@IDDealer',
NomeCampo [varchar](100) '@NomeCampo',
DatoVecchio [varchar](MAX) '@DatoVecchio',
DatoNuovo [varchar](MAX) '@DatoNuovo'
)

EXEC sp_xml_removedocument @hDoc

BEGIN TRANSACTION DealerUpdate

	BEGIN TRY

		DECLARE @IDTipoDealer AS INT

		--Verifico se le Tabelle coinvolte nell'aggiornamento sono già popolate con l'IDDealer altrimenti effettuo l'INSERT
		
		--Preparazione Schema Area per Update successivo
		INSERT INTO InfoGenerali.InfoGenerali (IDDealer)
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM InfoGenerali.InfoGenerali) 
			AND t1.NomeCampo IN (SELECT DISTINCT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'InfoGenerali')

		INSERT INTO InfoGenerali.InfoCommittenti (IDDealer)
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM InfoGenerali.InfoCommittenti) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InfoCommittenti') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InfoCommittenti'))

		INSERT INTO InfoGenerali.InfoPosEPod (IDDealer)
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM InfoGenerali.InfoPosEPod) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InfoPosEPod') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InfoPosEPod'))

		INSERT INTO InfoGenerali.InfoPoint (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM InfoGenerali.InfoPoint) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InfoPoint') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InfoPoint'))

		INSERT INTO InfoGenerali.InfoAgentiCommittenti (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM InfoGenerali.InfoAgentiCommittenti) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InfoAgentiCommittenti') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InfoAgentiCommittenti'))

		INSERT INTO InfoGenerali.InfoSubAgenti (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM InfoGenerali.InfoSubAgenti) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InfoSubAgenti') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'InfoSubAgenti'))


		--Preparazione Schema Area per Update successivo
		INSERT INTO Area.Area (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Area.Area) 
			AND t1.NomeCampo IN (SELECT DISTINCT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'Area')

		INSERT INTO Area.AreaCommittenti (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Area.AreaCommittenti) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AreaCommittenti') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AreaCommittenti'))

		INSERT INTO Area.AreaPosPod(IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Area.AreaPosPod) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AreaPosPod') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AreaPosPod'))

		INSERT INTO Area.AreaPoint(IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Area.AreaPoint) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AreaPoint') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AreaPoint'))

		INSERT INTO Area.AreaAgentiCommittenti (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Area.AreaAgentiCommittenti) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AreaAgentiCommittenti') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AreaAgentiCommittenti'))

		INSERT INTO Area.AreaSubAgenti (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Area.AreaSubAgenti) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AreaSubAgenti') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AreaSubAgenti'))
				

		--Preparazione Schema Catene per Update successivo
		INSERT INTO Catene.Catene (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Catene.Catene) 
			AND t1.NomeCampo IN (SELECT DISTINCT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'Catene')

		INSERT INTO Catene.CatenePosPod (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Catene.CatenePosPod) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CatenePosPod') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CatenePosPod'))


		--Preparazione Schema DettaglioAgenti per Update successivo
		INSERT INTO DettaglioAgenti.DettaglioAgenti (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM DettaglioAgenti.DettaglioAgenti) 
			AND t1.NomeCampo IN (SELECT DISTINCT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'DettaglioAgenti')


		--Preparazione Schema Disdetta per Update successivo
		INSERT INTO Disdetta.Disdetta (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Disdetta.Disdetta) 
			AND t1.NomeCampo IN (SELECT DISTINCT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'Disdetta')
			
		INSERT INTO Disdetta.DettaglioDisdetta (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Disdetta.DettaglioDisdetta) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DettaglioDisdetta') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DettaglioDisdetta'))
					

		--Preparazione Schema Negozio per Update successivo
		INSERT INTO Negozio.Negozio (IDDealer)
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Negozio.Negozio) 
			AND (t1.NomeCampo IN (SELECT DISTINCT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'Negozio')
				OR t1.NomeCampo ='OrarioApertura')

		INSERT INTO Negozio.NegozioCommittenti (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Negozio.NegozioCommittenti) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'NegozioCommittenti') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'NegozioCommittenti'))

		INSERT INTO Negozio.NegozioPosPod (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Negozio.NegozioPosPod) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'NegozioPosPod') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'NegozioPosPod')
					OR t1.NomeCampo ='GestoreCondiviso')

		INSERT INTO Negozio.NegozioPoint (IDDealer) 
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Negozio.NegozioPoint) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'NegozioPoint') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'NegozioPoint')
					OR t1.NomeCampo ='GestoreCondiviso')

		INSERT INTO Negozio.NegozioAgenti (IDDealer)
		SELECT DISTINCT t1.IDDealer
		FROM #TempTableXml t1 
		WHERE t1.IDDealer NOT IN (SELECT IDDealer FROM Negozio.NegozioAgenti) 
			AND (t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'NegozioAgenti') 
				OR 'ID'+t1.NomeCampo IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'NegozioAgenti')
					OR t1.NomeCampo ='ModelloVendita')
		
		
		--Aggiornamenti su Tabelle condivise fra tutte le tipologie di Dealer
		
		--UPDATE SCHEMA InfoGenerali
		UPDATE InfoGenerali.InfoGenerali
		SET CodiceFornitore = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN InfoGenerali.InfoGenerali t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'CodiceFornitore'

		UPDATE InfoGenerali.InfoGenerali
		SET CodiceVogi = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN InfoGenerali.InfoGenerali t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'CodiceVogi'

		--UPDATE InfoGenerali.InfoGenerali
		--SET Email = NULLIF(t1.DatoNuovo,'')
		--FROM #TempTableXml t1
		--INNER JOIN InfoGenerali.InfoGenerali t2 ON t1.IDDealer = t2.IDDealer
		--INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		--WHERE t1.NomeCampo = 'Email'

		UPDATE InfoGenerali.InfoGenerali
		SET PEC = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN InfoGenerali.InfoGenerali t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Pec'


		--UPDATE SCHEMA Area
		UPDATE Area.Area
		SET IDOperativita = (SELECT IDOperativita FROM Area.Operativita WHERE Operativita = t1.DatoNuovo)
		FROM #TempTableXml t1
		INNER JOIN Area.Area t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Operativita'

		UPDATE Area.Area
		SET IDTipologia = (SELECT IDTipologia FROM Area.Tipologia WHERE Tipologia = t1.DatoNuovo)
		FROM #TempTableXml t1
		INNER JOIN Area.Area t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Tipologia'

		--UPDATE SCHEMA Catene
		UPDATE Catene.Catene
		SET IDTipoRemunerazione = (SELECT IDTipoRemunerazione FROM Catene.TipoRemunerazione WHERE TipoRemunerazione = t1.DatoNuovo)
		FROM #TempTableXml t1
		INNER JOIN Catene.Catene t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'TipoRemunerazione'


		--UPDATE SCHEMA DettaglioAgenti
		UPDATE DettaglioAgenti.DettaglioAgenti
		SET ZonaAssegnata = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		DettaglioAgenti.DettaglioAgenti  t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'ZonaAssegnata' 

		UPDATE DettaglioAgenti.DettaglioAgenti
		SET Plurimandatario = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		DettaglioAgenti.DettaglioAgenti  t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Plurimandatario'

		UPDATE DettaglioAgenti.DettaglioAgenti
		SET IDDimensionamento = (SELECT IDDimensionamento FROM DettaglioAgenti.Dimensionamento WHERE Dimensionamento = t1.DatoNuovo)
		FROM #TempTableXml t1
		INNER JOIN DettaglioAgenti.DettaglioAgenti t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Dimensionamento'

		UPDATE DettaglioAgenti.DettaglioAgenti
		SET IDMaterialeEspositivo = (SELECT IDMaterialeEspositivo FROM DettaglioAgenti.MaterialeEspositivo WHERE MaterialeEspositivo = t1.DatoNuovo)
		FROM #TempTableXml t1
		INNER JOIN DettaglioAgenti.DettaglioAgenti t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'MaterialeEspositivo'


		--UPDATE SCHEMA Disdetta
		UPDATE Disdetta.Disdetta
		SET DataInvioDisdetta = NULLIF(Convert(Datetime, t1.DatoNuovo, 103),'')
		FROM #TempTableXml t1
		INNER JOIN Disdetta.Disdetta t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataInvioDisdetta'

		UPDATE Dealer.Dealer
		SET IDStato = 5
		FROM #TempTableXml t1
		INNER JOIN Dealer.Dealer t2 ON t2.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataInvioDisdetta' AND t2.IDStato not in (2,5)

		UPDATE Dealer.Dealer
		SET IDStato = IDStatoSAP
		FROM #TempTableXml t1
		INNER JOIN Dealer.Dealer t2 ON t2.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataInvioDisdetta' AND (t1.DatoNuovo = '' OR t1.DatoNuovo is null)

		UPDATE Disdetta.Disdetta
		SET DataTerminePreavviso = NULLIF(Convert(Datetime, t1.DatoNuovo, 103),'')
		FROM #TempTableXml t1
		INNER JOIN Disdetta.Disdetta t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataTerminePreavviso'

		UPDATE Disdetta.Disdetta
		SET GiorniPreavviso = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Disdetta.Disdetta t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'GiorniPreavviso'

		UPDATE Disdetta.Disdetta
		SET Note = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Disdetta.Disdetta t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Note'

		UPDATE Disdetta.Disdetta
		SET VecchioCodice = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Disdetta.Disdetta t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'VecchioCodice'

		UPDATE Disdetta.Disdetta
		SET IDRichiedente = (SELECT IDRichiedente FROM Disdetta.Richiedente WHERE Richiedente = t1.DatoNuovo)
		FROM #TempTableXml t1
		INNER JOIN Disdetta.Disdetta t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Richiedente'

		UPDATE Disdetta.DettaglioDisdetta
		SET DataDisdetta = NULLIF(Convert(Datetime, t1.DatoNuovo, 103),'')
		FROM #TempTableXml t1
		INNER JOIN Disdetta.DettaglioDisdetta t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataDisdetta'

		--UPDATE SCHEMA Negozio
		UPDATE Negozio.Negozio
		SET NomeTitolare = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Negozio.Negozio t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'NomeTitolare'

		UPDATE Negozio.Negozio
		SET CFTitolare = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Negozio.Negozio t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'CFTitolare'

		UPDATE Negozio.Negozio
		SET EmailTitolare = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Negozio.Negozio t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'EmailTitolare'

		UPDATE Negozio.Negozio
		SET Telefono = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Negozio.Negozio t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'TelefonoNegozio'

		UPDATE Negozio.Negozio
		SET Supporti = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Negozio.Negozio t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Supporti'

		UPDATE Negozio.Negozio
		SET IDCluster = (SELECT IDCluster FROM Negozio.Cluster WHERE Cluster = t1.DatoNuovo)
		FROM #TempTableXml t1
		INNER JOIN Negozio.Negozio t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Cluster'


		--Aggiornamenti su Tabelle dedicate ai Committenti
		SET @IDTipoDealer = 1

		UPDATE InfoGenerali.InfoCommittenti
		SET FideiussioneAffitto = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN InfoGenerali.InfoCommittenti t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'FideiussioneAffitto' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE InfoGenerali.InfoCommittenti
		SET FideiussioneCommerciale = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN InfoGenerali.InfoCommittenti t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'FideiussioneCommerciale' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaCommittenti
		SET IDSegmentazioneCanale = (SELECT IDSegmentazioneCanale FROM Area.SegmentazioneCanale WHERE SegmentazioneCanale = t1.DatoNuovo)
		FROM #TempTableXml t1
		INNER JOIN Area.AreaCommittenti t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'SegmentazioneCanale' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaCommittenti
		SET DataContratto = NULLIF(Convert(Datetime, t1.DatoNuovo, 103),'')
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaCommittenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataContratto' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaCommittenti
		SET FirmaDigitale = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaCommittenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'FirmaDigitale' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaCommittenti
		SET Rea = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaCommittenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Rea' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaCommittenti
		SET IDProvinciaRea = (SELECT IDProvincia FROM Utility.Provincia WHERE Utility.Provincia.Nome = t1.DatoNuovo)
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaCommittenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'ProvRea' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioCommittenti
		SET NumeroVetrine = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioCommittenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'NumeroVetrine' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioCommittenti
		SET Piu12 = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioCommittenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Piu12' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaCommittenti
		SET IDAreaDiCompetenza = (SELECT IDAreaDiCompetenza FROM area.AreaDiCompetenza WHERE NomeArea = t1.DatoNuovo)
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaCommittenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'AreaDiCompetenza' AND t3.IDTipoDealer = @IDTipoDealer


		--Aggiornamenti su Tabelle dedicate ai Pos&Pod
		SET @IDTipoDealer = 2		

		UPDATE InfoGenerali.InfoPosEPod
		SET DataAperturaNegozio = NULLIF(Convert(Datetime, t1.DatoNuovo, 103),'')
		FROM #TempTableXml t1
		INNER JOIN InfoGenerali.InfoPosEPod t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataAperturaNegozio' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE InfoGenerali.InfoPosEPod
		SET DataChiusuraNegozio = NULLIF(Convert(Datetime, t1.DatoNuovo, 103),'')
		FROM #TempTableXml t1
		INNER JOIN InfoGenerali.InfoPosEPod t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataChiusuraNegozio' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaPosPod
		SET IDSegmentazioneCanale = (SELECT IDSegmentazioneCanale FROM Area.SegmentazioneCanale WHERE SegmentazioneCanale = t1.DatoNuovo)
		FROM #TempTableXml t1
		INNER JOIN Area.AreaPosPod t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'SegmentazioneCanale' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaPosPod
		SET NegozioTop = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Area.AreaPosPod t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'NegozioTop' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaPosPod
		SET MagazzinoCentralizzato = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Area.AreaPosPod t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'MagazzinoCentralizzato' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaPosPod
		SET CentroCommerciale = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Area.AreaPosPod t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'CentroCommerciale' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Catene.CatenePosPod 
		SET DatiCateneAM = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Catene.CatenePosPod  t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DatiCateneAM' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Catene.CatenePosPod 
		SET DatiCateneFunzionario = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Catene.CatenePosPod  t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DatiCateneFunzionario' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPosPod 
		SET Insegna = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioPosPod t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Insegna' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPosPod 
		SET Latitudine = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioPosPod t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Latitudine' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPosPod 
		SET Longitudine = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioPosPod t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Longitudine' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPosPod 
		SET NumeroVetrine = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioPosPod t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'NumeroVetrine' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPosPod 
		SET ShopInStore = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioPosPod t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'ShopInStore' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPosPod 
		SET IDTipologiaArredo  = (SELECT IDTipologiaArredo FROM Negozio.TipologiaArredo WHERE TipologiaArredo = t1.DatoNuovo)
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioPosPod t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'TipologiaArredo' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPosPod 
		SET ValoreAffitto = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioPosPod t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'ValoreAffitto' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaPosPod 
		SET IDAreaDiCompetenza = (SELECT IDAreaDiCompetenza FROM area.AreaDiCompetenza WHERE NomeArea = t1.DatoNuovo)
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaPosPod t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'AreaDiCompetenza' AND t3.IDTipoDealer = @IDTipoDealer


		--Aggiornamenti su Tabelle dedicate ai Point
		SET @IDTipoDealer = 3

		UPDATE InfoGenerali.InfoPoint
		SET DataAperturaNegozio = NULLIF(Convert(Datetime, t1.DatoNuovo, 103),'')
		FROM #TempTableXml t1
		INNER JOIN InfoGenerali.InfoPoint t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataAperturaNegozio' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE InfoGenerali.InfoPoint
		SET DataChiusuraNegozio = NULLIF(Convert(Datetime, t1.DatoNuovo, 103),'')
		FROM #TempTableXml t1
		INNER JOIN InfoGenerali.InfoPoint t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataChiusuraNegozio' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaPoint
		SET CentroCommerciale = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1
		INNER JOIN Area.AreaPoint t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'CentroCommerciale' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaPoint
		SET FirmaDigitale = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaPoint t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'FirmaDigitale' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaPoint 
		SET Rea = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaPoint t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Rea' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaPoint
		SET IDProvinciaRea = (SELECT IDProvincia FROM Utility.Provincia WHERE Utility.Provincia.Nome = t1.DatoNuovo)
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaPoint t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'ProvRea' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPoint 
		SET IDDimensioneAreaVendita = (SELECT IDDimensioneAreaVendita FROM Negozio.DimensioneAreaVendita WHERE DimensioneAreaVendita = t1.DatoNuovo)
		FROM #TempTableXml t1
		INNER JOIN Negozio.NegozioPoint t2 ON t1.IDDealer = t2.IDDealer
		INNER JOIN Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DimensioneAreaVendita' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPoint 
		SET IndirizzoSpedizioneMateriale = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioPoint t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'IndirizzoSpedizioneMateriale' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPoint 
		SET NumeroVetrine = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioPoint t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'NumeroVetrine' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPoint 
		SET PointSpecial = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioPoint t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'PointSpecial' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioPoint 
		SET IDTipologiaArredo  = (SELECT IDTipologiaArredo FROM Negozio.TipologiaArredo WHERE TipologiaArredo = t1.DatoNuovo)
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioPoint t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'TipologiaArredo' AND t3.IDTipoDealer = @IDTipoDealer


		--Aggiornamenti su Tabelle dedicate agli AgentiCommittenti
		SET @IDTipoDealer = 4

		UPDATE Area.AreaAgentiCommittenti
		SET DataContratto = NULLIF(Convert(Datetime, t1.DatoNuovo, 103),'')
		FROM #TempTableXml t1 INNER JOIN
		Area.AreaAgentiCommittenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataContratto' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaAgentiCommittenti
		SET FirmaDigitale = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaAgentiCommittenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'FirmaDigitale' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaAgentiCommittenti  
		SET Rea = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaAgentiCommittenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'Rea' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaAgentiCommittenti
		SET IDProvinciaRea = (SELECT IDProvincia FROM Utility.Provincia WHERE Utility.Provincia.Nome = t1.DatoNuovo)
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaAgentiCommittenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'ProvRea' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioAgenti  
		SET IndirizzoSpedizioneMateriale = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioAgenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'IndirizzoSpedizioneMateriale' AND t3.IDTipoDealer = @IDTipoDealer


		--Aggiornamenti su Tabelle dedicate ai SubAgenti
		SET @IDTipoDealer = 5

		UPDATE Area.AreaSubAgenti
		SET DataContratto = NULLIF(Convert(Datetime, t1.DatoNuovo, 103),'') 
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaSubAgenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'DataContratto' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Area.AreaSubAgenti 
		SET FirmaDigitale = NULLIF(t1.DatoNuovo,'')
		FROM #TempTableXml t1 INNER JOIN 
		Area.AreaSubAgenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'FirmaDigitale' AND t3.IDTipoDealer = @IDTipoDealer

		UPDATE Negozio.NegozioAgenti  
		SET IndirizzoSpedizioneMateriale = NULLIF(t1.DatoNuovo,'') 
		FROM #TempTableXml t1 INNER JOIN 
		Negozio.NegozioAgenti t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'IndirizzoSpedizioneMateriale' AND t3.IDTipoDealer = @IDTipoDealer

		--Aggiorno i controlli a scelta multipla 
		--Campo GestoreCondiviso
		DECLARE @IDDealer int, @DatoNuovo varchar(max);
		
		DECLARE GestoreCondiviso_cursor CURSOR FOR
		SELECT t3.IDDealer, t1.DatoNuovo
				FROM #TempTableXml t1 INNER JOIN
				Negozio.Negozio t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
				Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
				WHERE t1.NomeCampo = 'GestoreCondiviso' 

		OPEN GestoreCondiviso_cursor;

		FETCH NEXT FROM GestoreCondiviso_cursor
		INTO @IDDealer, @DatoNuovo;
		WHILE @@FETCH_STATUS = 0
		BEGIN

			DELETE FROM Negozio.UsaGestoreCondiviso 
			WHERE IDDealer = @IDDealer

			INSERT INTO Negozio.UsaGestoreCondiviso (IDDealer, IDGestoreCondiviso)
			SELECT @IDDealer AS IDDealer, IDGestoreCondiviso
			FROM Utility.SplitForUpdate('|', @DatoNuovo) t1 INNER JOIN 
			Negozio.GestoreCondiviso t2 ON t1.ElementValue = t2.GestoreCondiviso

		   FETCH NEXT FROM GestoreCondiviso_cursor
		   INTO @IDDealer, @DatoNuovo;
		END

		CLOSE GestoreCondiviso_cursor;
		DEALLOCATE GestoreCondiviso_cursor;

		--Campo ModelloVendita
		DECLARE ModelloVendita_cursor CURSOR FOR

		SELECT t3.IDDealer, t1.DatoNuovo
		FROM #TempTableXml t1 INNER JOIN
		Negozio.Negozio t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'ModelloVendita' 

		OPEN ModelloVendita_cursor;

		FETCH NEXT FROM ModelloVendita_cursor
		INTO @IDDealer, @DatoNuovo;

		WHILE @@FETCH_STATUS = 0
		BEGIN
			DELETE FROM Negozio.UsaModelloVendita 
			WHERE IDDealer = @IDDealer

			INSERT INTO Negozio.UsaModelloVendita (IDDealer, IDModelloVendita)
			SELECT @IDDealer AS IDDealer, IDModelloVendita
			FROM Utility.SplitForUpdate('|', @DatoNuovo) t1 INNER JOIN 
			Negozio.ModelloVendita t2 ON t1.ElementValue = t2.ModelloVendita
		 
		   FETCH NEXT FROM ModelloVendita_cursor
		   INTO @IDDealer, @DatoNuovo;
		END

		CLOSE ModelloVendita_cursor;
		DEALLOCATE ModelloVendita_cursor;

		--Campo OrarioApertura
		DECLARE OrarioApertura_cursor CURSOR FOR
		SELECT t3.IDDealer, t1.DatoNuovo
		FROM #TempTableXml t1 INNER JOIN
		Negozio.Negozio t2 ON t1.IDDealer = t2.IDDealer INNER JOIN 
		Dealer.Dealer t3 ON t3.IDDealer = t1.IDDealer
		WHERE t1.NomeCampo = 'OrarioApertura' 

		OPEN OrarioApertura_cursor;

		FETCH NEXT FROM OrarioApertura_cursor
		INTO @IDDealer, @DatoNuovo;

		WHILE @@FETCH_STATUS = 0
		BEGIN
			DELETE FROM Negozio.Apre
			WHERE IDDealer = @IDDealer

			SELECT @IDDealer AS IDDealer, *
			INTO #FasceOrarie
			FROM Utility.SplitForUpdate(';', @DatoNuovo) t1 WHERE ElementValue <> ''

			DECLARE @IDFascia int, @FasciaOraria varchar(max);

			DECLARE FasceOrarie_cursor CURSOR FOR
			SELECT * FROM #FasceOrarie

			OPEN FasceOrarie_cursor;

			FETCH NEXT FROM FasceOrarie_cursor
			INTO @IDDealer, @IDFascia, @FasciaOraria;

			WHILE @@FETCH_STATUS = 0
			BEGIN
				SELECT * 
				INTO #Orario
				FROM Utility.SplitForUpdate('|', @FasciaOraria)
				
				DECLARE @dalleMattina varchar(10), @alleMattina varchar(10), @dallePomeriggio varchar(10), @allePomeriggio varchar(10), @lun bit, @mar bit, @mer bit, @gio bit, @ven bit, @sab bit, @dom bit, @giorni varchar(50)

				SELECT @dalleMattina = ElementValue FROM #Orario WHERE IndexValue = 1
				SELECT @alleMattina = ElementValue FROM #Orario WHERE IndexValue = 2
				SELECT @dallePomeriggio = ElementValue FROM #Orario WHERE IndexValue = 3
				SELECT @allePomeriggio = ElementValue FROM #Orario WHERE IndexValue = 4
				SELECT @giorni = ElementValue FROM #Orario Where IndexValue = 5
				--SELECT * FROM Utility.SplitForUpdate('#', @giorni)

				IF (SELECT count(*) FROM Utility.SplitForUpdate('#', @giorni) WHERE ElementValue = 'Lu') > 0 SET @lun = 1 ELSE SET @lun = 0 ;
				IF (SELECT count(*) FROM Utility.SplitForUpdate('#', @giorni) WHERE ElementValue = 'Ma') > 0 SET @mar = 1 ELSE SET @mar = 0 ;
				IF (SELECT count(*) FROM Utility.SplitForUpdate('#', @giorni) WHERE ElementValue = 'Me') > 0 SET @mer = 1 ELSE SET @mer = 0 ;
				IF (SELECT count(*) FROM Utility.SplitForUpdate('#', @giorni) WHERE ElementValue = 'Gi') > 0 SET @gio = 1 ELSE SET @gio = 0 ;
				IF (SELECT count(*) FROM Utility.SplitForUpdate('#', @giorni) WHERE ElementValue = 'Ve') > 0 SET @ven = 1 ELSE SET @ven = 0 ;
				IF (SELECT count(*) FROM Utility.SplitForUpdate('#', @giorni) WHERE ElementValue = 'Sa') > 0 SET @sab = 1 ELSE SET @sab = 0 ;
				IF (SELECT count(*) FROM Utility.SplitForUpdate('#', @giorni) WHERE ElementValue = 'Do') > 0 SET @dom = 1 ELSE SET @dom = 0 ;
				
				--print 'FasciaOraria: IDDealer:' + CONVERT(varchar(50) ,@IDDealer) + ' dalle:' + @dalleMattina + ' alle:' + @alleMattina + ' dalle:' + @dallePomeriggio + ' alle:' + @allePomeriggio + 
				--' giorni: Lu=' + CONVERT(varchar(2) ,@lun) + ' Ma=' + CONVERT(varchar(2) ,@mar) + ' Me=' + CONVERT(varchar(2) ,@mer) + ' Gi=' + CONVERT(varchar(2) ,@gio) + ' Ve=' + CONVERT(varchar(2) ,@ven) +
				--' Sa=' + CONVERT(varchar(2) ,@sab) + ' Dom=' + CONVERT(varchar(2) ,@dom)
				
				DECLARE @IDOrarioApertura int = 0

				SELECT @IDOrarioApertura = IDOrarioApertura FROM Negozio.OrarioDiApertura 
				WHERE dalleMattina = @dalleMattina AND AlleMattina = @alleMattina AND DallePomeriggio = @dallePomeriggio AND AllePomeriggio = @allePomeriggio AND
					Lun = @lun AND Mar = @mar AND Mer = @mer AND Gio = @gio AND Ven = @ven AND Sab = @sab AND Dom = @dom

				IF(@dalleMattina <> '--' OR @AlleMattina <> '--' OR @DallePomeriggio <> '--' OR @AllePomeriggio <> '--' OR
					@Lun <> 0 OR @Mar <> 0 OR @Mer <> 0 OR @Gio <> 0 OR @Ven <> 0 OR @Sab <> 0 OR @Dom <> 0)
				BEGIN
					IF (@IDOrarioApertura > 0)
					BEGIN
						INSERT INTO Negozio.Apre (IDDealer, IDOrarioApertura)
						VALUES (@IDDealer, @IDOrarioApertura)
					END
					ELSE
					BEGIN
						INSERT INTO Negozio.OrarioDiApertura (DalleMattina, AlleMattina, DallePomeriggio, AllePomeriggio, Lun, Mar, Mer, Gio, Ven, Sab, Dom)
						VALUES (@dalleMattina, @alleMattina, @dallePomeriggio, @allePomeriggio, @lun, @mar, @mer, @gio, @ven, @sab, @dom)
				
						INSERT INTO Negozio.Apre (IDDealer, IDOrarioApertura)
						VALUES (@IDDealer, @@IDENTITY)
					END 
				END

				DROP TABLE #Orario

				FETCH NEXT FROM FasceOrarie_cursor
				INTO @IDDealer, @IDFascia, @FasciaOraria;
			END

			CLOSE FasceOrarie_cursor;
			DEALLOCATE FasceOrarie_cursor;
			
			DROP TABLE #FasceOrarie

		   FETCH NEXT FROM OrarioApertura_cursor
		   INTO @IDDealer, @DatoNuovo;
		END

		CLOSE OrarioApertura_cursor;
		DEALLOCATE OrarioApertura_cursor;

		UPDATE Dealer.Dealer SET IDUtente = @IDUtente, DataModificaUtente = getdate() WHERE IDDealer IN (SELECT DISTINCT IDDealer FROM #TempTableXml)

		COMMIT TRANSACTION DealerUpdate

	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION DealerUpdate;
		RETURN ERROR_MESSAGE()
  	END CATCH

	DROP TABLE #TempTableXml

END