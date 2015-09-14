USE [AnagraficaDealer]
GO

--INSERT INTO Dealer.Stato ( NomeStato )
--	VALUES ( 'Attivo' )

--INSERT INTO Dealer.Stato ( NomeStato )
--	VALUES ( 'Disattivo' )

--INSERT INTO Dealer.Stato ( NomeStato )
--	VALUES ( 'Sospeso' )

--INSERT INTO Dealer.Stato ( NomeStato )
--	VALUES ( 'Inerte' )

--INSERT INTO Dealer.Stato ( NomeStato )
--	VALUES ( 'In Disdetta' )

IF(SELECT COUNT(IDStato) FROM Dealer.Stato WHERE NomeStato = 'In Disdetta') = 0
INSERT INTO Dealer.Stato ( NomeStato )	VALUES ( 'In Disdetta' )