USE [AnagraficaDealer]
GO

INSERT INTO Dealer.Dealer
                         (Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        ('Indirizzo Dealer 1', '11111111111', '111 1111111', '111 1111111', GETDATE(), 1, 1, 1, '11111.11111', 'AG')

INSERT INTO Dealer.Dealer
                         (Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        ('Indirizzo Dealer 2', '22222222', '222 2222222', '222 2222', GETDATE(), 1, 1, 1, '22222.22222', 'AG')

INSERT INTO Dealer.Dealer
                         (Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        ('Indirizzo Dealer 3', '333333333', '333 1111111', '333 1111111', GETDATE(), 2, 2, 1, '33333.33333', 'WE')

INSERT INTO Dealer.Dealer
                         (Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        ('Indirizzo Dealer 4', '4444444', '444 2222222', '444 2222', GETDATE(), 2, 2, 1, '44444.44444', 'WE')

INSERT INTO Dealer.Dealer
                         (Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        ('Indirizzo Dealer 5', '5555555', '555 1111111', '555 1111111', GETDATE(), 1, 3, 1, '55555.55555', 'WE')

INSERT INTO Dealer.Dealer
                         (Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        ('Indirizzo Dealer 6', '66666', '666 2222222', '666 2222', GETDATE(), 1, 3, 1, '66666.66666', 'WE')

INSERT INTO Dealer.Dealer
                         (Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        ('Indirizzo Dealer 7', '77777', '77777 1111111', '77777 1111111', GETDATE(), 1, 4, 1, '77777.77777', 'AG')

INSERT INTO Dealer.Dealer
                         (Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        ('Indirizzo Dealer 8', '88888', '88888 2222222', '88888 2222', GETDATE(), 1, 4, 1, '88888.88888', 'AG')

INSERT INTO Dealer.Dealer
                         (Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        ('Indirizzo Dealer 9', '99999', '999 1111111', '999 1111111', GETDATE(), 1, 5, 1, '99999.99999', 'WE')

INSERT INTO Dealer.Dealer
                         (Indirizzo, PIVA, Telefono, Fax, DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        ('Indirizzo Dealer 10', '101010', '1010 2222222', '1010 2222', GETDATE(), 1, 5, 1, '10101.10101', 'WE')


INSERT INTO Dealer.Dealer
                         (DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        (GETDATE(), 1, 1, 1, '11.11', 'AG')

INSERT INTO Dealer.Dealer
                         (DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        (GETDATE(), 1, 2, 1, '12.12', 'WE')

INSERT INTO Dealer.Dealer
                         (DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        (GETDATE(), 1, 3, 1, '13.13', 'WE')

INSERT INTO Dealer.Dealer
                         (DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        (GETDATE(), 1, 4, 1, '14.14', 'AG')

INSERT INTO Dealer.Dealer
                         (DataModifica, IDUtente, IDTipoDealer, IDStato, Codice, Funz)
VALUES        (GETDATE(), 1, 5, 1, '15.15', 'WE')