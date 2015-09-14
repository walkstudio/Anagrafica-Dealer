USE [AnagraficaDealer]
GO

INSERT INTO Negozio.OrarioDiApertura
                         (DalleMattina, AlleMattina, DallePomeriggio, AllePomeriggio, Lun, Mar, Mer, Gio, Ven, Sab, Dom)
VALUES        ('7:00', '12:00', '16:00', '20:00', 0, 1, 1, 1, 1, 0, 0)

INSERT INTO Negozio.OrarioDiApertura
                         (DalleMattina, AlleMattina, DallePomeriggio, AllePomeriggio, Lun, Mar, Mer, Gio, Ven, Sab, Dom)
VALUES        ('8:00', '13:00', '15:00', '21:00', 0, 0, 0, 0, 0, 1, 1)

INSERT INTO Negozio.OrarioDiApertura
                         (DalleMattina, AlleMattina, DallePomeriggio, AllePomeriggio, Lun, Mar, Mer, Gio, Ven, Sab, Dom)
VALUES        ('9:00', '12:00', '16:00', '19:00', 0, 0, 0, 1, 1, 0, 0)