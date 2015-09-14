
CREATE PROCEDURE [Import].[SP_ImportPEC] 
AS
BEGIN
	SET NOCOUNT ON;

	-- Creo tabella record duplicati
	DECLARE @DuplicatedMail TABLE( Cliente NVARCHAR(50) )

	INSERT INTO @DuplicatedMail ( Cliente )
	SELECT Cliente
	FROM Import.PEC
	GROUP BY Cliente
	HAVING COUNT( Cliente ) > 1

	-- Inserisco nuove mail in record inesistenti
	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.AgenteCommittente A ON ( P.Cliente = RIGHT( A.Cliente, 5 ) OR P.Cliente = RIGHT( A.Cliente, 7 ) )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.AgenteCommittente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.Committente A ON ( P.Cliente = RIGHT( A.Cliente, 5 ) OR P.Cliente = RIGHT( A.Cliente, 7 ) )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.Committente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.Committente A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC 
	FROM Import.PEC P
	INNER JOIN
	Import.PosPod A ON ( P.Cliente = RIGHT( A.Cliente, 5 ) OR P.Cliente = RIGHT( A.Cliente, 7 ) )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.PosPod
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.PosPod A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.SubAgente A ON ( P.Cliente = RIGHT( A.Cliente, 5 ) OR P.Cliente = RIGHT( A.Cliente, 7 ) )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.SubAgente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	-- Aggirnamento recod esistenti
	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.AgenteCommittente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.Committente A ON P.Cliente = RIGHT( A.Cliente, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.Committente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.Committente A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.PosPod A ON P.Cliente = RIGHT( A.Cliente, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.PosPod
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.PosPod A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.SubAgente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	-- Ripeto le operazioni di inserimento/aggirnamento usando il campo Cliente2
	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.AgenteCommittente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.Committente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.Committente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.Committente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.PosPod A ON P.Cliente = RIGHT( A.Cliente2, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.PosPod
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.PosPod A ON P.Cliente = RIGHT( A.Cliente2, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.SubAgente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	-- Aggirnamento recod esistenti
	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.AgenteCommittente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.Committente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.Committente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.Committente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.PosPod A ON P.Cliente = RIGHT( A.Cliente2, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.PosPod
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.PosPod A ON P.Cliente = RIGHT( A.Cliente2, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.SubAgente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente2, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	-- Ripeto tutto considerando il campo client a 7 cartatteri
	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.AgenteCommittente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.Committente A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.Committente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.Committente A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.PosPod A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.PosPod
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.PosPod A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.SubAgente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	-- Aggirnamento recod esistenti
	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.AgenteCommittente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.Committente A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.Committente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.Committente A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.PosPod A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.PosPod
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.PosPod A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.SubAgente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	-- Ripeto le operazioni di inserimento/aggirnamento usando il campo Cliente2
	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.AgenteCommittente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.Committente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.Committente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.Committente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.PosPod A ON P.Cliente = RIGHT( A.Cliente2, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.PosPod
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.PosPod A ON P.Cliente = RIGHT( A.Cliente2, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	INSERT INTO InfoGenerali.InfoGenerali ( IDDealer, EMail )
	SELECT D.IDDealer, P.PEC  
	FROM Import.PEC P
	INNER JOIN
	Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	LEFT JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.SubAgente
	WHERE Cliente IN (
		SELECT P.Cliente  
		FROM Import.PEC P
		INNER JOIN
		Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		LEFT JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE I.IDDealer IS NULL AND DM.Cliente IS NULL AND P.Stato = 1
	)

	-- Aggirnamento recod esistenti
	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.AgenteCommittente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.Committente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.Committente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.Committente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.PosPod A ON P.Cliente = RIGHT( A.Cliente2, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.PosPod
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.PosPod A ON P.Cliente = RIGHT( A.Cliente2, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = P.PEC
	FROM Import.PEC P
	INNER JOIN
	Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato = 1

	DELETE FROM Import.SubAgente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente2, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato = 1
	)

	-- Rimozione Mail Disabilitate
	UPDATE InfoGenerali.InfoGenerali
	SET EMail = NULL
	FROM Import.PEC P
	INNER JOIN
	Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato != 1

	DELETE FROM Import.AgenteCommittente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato != 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = NULL
	FROM Import.PEC P
	INNER JOIN
	Import.Committente A ON P.Cliente = RIGHT( A.Cliente, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato != 1

	DELETE FROM Import.Committente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.Committente A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato != 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = NULL
	FROM Import.PEC P
	INNER JOIN
	Import.PosPod A ON P.Cliente = RIGHT( A.Cliente, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato != 1

	DELETE FROM Import.PosPod
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.PosPod A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato != 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = NULL
	FROM Import.PEC P
	INNER JOIN
	Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente, 5 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato != 1

	DELETE FROM Import.SubAgente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente, 5 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato != 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = NULL
	FROM Import.PEC P
	INNER JOIN
	Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato != 1

	DELETE FROM Import.AgenteCommittente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.AgenteCommittente A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato != 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = NULL
	FROM Import.PEC P
	INNER JOIN
	Import.Committente A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato != 1

	DELETE FROM Import.Committente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.Committente A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato != 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = NULL
	FROM Import.PEC P
	INNER JOIN
	Import.PosPod A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato != 1

	DELETE FROM Import.PosPod
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.PosPod A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato != 1
	)

	UPDATE InfoGenerali.InfoGenerali
	SET EMail = NULL
	FROM Import.PEC P
	INNER JOIN
	Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente, 7 )
	INNER JOIN
	Dealer.Dealer D ON A.Codice = D.Codice
	INNER JOIN
	InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
	LEFT JOIN
	@DuplicatedMail DM ON P.Cliente = DM.Cliente
	WHERE DM.Cliente IS NULL AND P.Stato != 1

	DELETE FROM Import.SubAgente
	WHERE Cliente IN (
		SELECT P.Cliente
		FROM Import.PEC P
		INNER JOIN
		Import.SubAgente A ON P.Cliente = RIGHT( A.Cliente, 7 )
		INNER JOIN
		Dealer.Dealer D ON A.Codice = D.Codice
		INNER JOIN
		InfoGenerali.InfoGenerali I ON D.IDDealer = I.IDDealer
		LEFT JOIN
		@DuplicatedMail DM ON P.Cliente = DM.Cliente
		WHERE DM.Cliente IS NULL AND P.Stato != 1
	)

	-- Gestione record Duplicati
	-- Record Attivi uguali

END