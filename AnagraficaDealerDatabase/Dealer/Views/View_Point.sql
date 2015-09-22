CREATE VIEW Dealer.View_Point
AS
SELECT        Dealer.Dealer.IDDealer, Dealer.Dealer.Indirizzo, Dealer.Dealer.PIVA, Dealer.Dealer.Telefono, Dealer.Dealer.Fax, Dealer.Dealer.DataModifica, 
                         Dealer.Dealer.IDUtente, Dealer.Dealer.IDTipoDealer, Dealer.Dealer.IDStato, Dealer.Dealer.Codice, Dealer.Stato.NomeStato AS Stato, 
                         Dealer.TipoDealer.NomeTipoDealer, Area.Operativita.Operativita, Area.Tipologia.Tipologia, InfoGenerali.InfoGenerali.CodiceFornitore, 
                         InfoGenerali.InfoGenerali.CodiceVogi, InfoGenerali.InfoGenerali.EMail, InfoGenerali.InfoGenerali.PEC, 
                         Dealer.CondizioniPagamento.NomeCondizioniPagamento AS CondizioniPagamento, Dealer.Canale.NomeCanale, Negozio.Negozio.Telefono AS TelefonoNegozio, 
                         Negozio.Negozio.NomeTitolare, Negozio.Negozio.Supporti, Negozio.Cluster.Cluster, Vendite.Vendite.CAP, Vendite.Vendite.Localita, Vendite.Vendite.Nome1, 
                         Utility.Provincia.Nome AS Provincia, Utility.Regione.Nome AS Regione, Disdetta.Disdetta.VecchioCodice, Disdetta.Disdetta.DataTerminePreavviso, 
                         Disdetta.Disdetta.DataInvioDisdetta, Disdetta.Disdetta.GiorniPreavviso, Disdetta.Disdetta.Note, Disdetta.DettaglioDisdetta.DataDisdetta, 
                         Vendite.VenditeCanali.Cliente, Vendite.VenditeCanali.GruppoPrezzi, Vendite.VenditeCanali.Magazzino, Vendite.VenditeCanali.Nome2, 
                         Utenti.Funzionario.AGL AS CodiceFunzionario, Utenti.Funzionario.Nome AS Funzionario, Utenti.AreaManager.VKBUR AS CodiceAreaManager, 
                         Utenti.AreaManager.Nome AS AreaManager, Negozio.TipologiaArredo.TipologiaArredo, InfoGenerali.InfoPoint.DataAperturaNegozio, 
                         InfoGenerali.InfoPoint.DataChiusuraNegozio, Area.AreaPoint.CentroCommerciale, Area.AreaPoint.FirmaDigitale, Area.AreaPoint.Rea, 
                         Negozio.NegozioPoint.IndirizzoSpedizioneMateriale, Negozio.NegozioPoint.NumeroVetrine, Negozio.NegozioPoint.PointSpecial, 
                         Negozio.DimensioneAreaVendita.DimensioneAreaVendita, ISNULL(Vendite.Vendite.Nome1, '') + ' ' + ISNULL(Vendite.VenditeCanali.Nome2, '') AS RagioneSociale, 
                         Disdetta.Richiedente.Richiedente, ProvinciaRea.Nome AS ProvRea, Negozio.Negozio.CFTitolare, Negozio.Negozio.EmailTitolare, Dealer.Dealer.DataModificaUtente, 
                         Dealer.Canale.IDCanale, Utility.Regione.IDRegione, Utility.Provincia.IDProvincia, Negozio.Negozio.NomeContatto, Dealer.Canale.DescrizioneCanale AS Canale, 
                         Area.Area.IDOperativita, Vendite.Vendite.IDZona AS IDArea, Utility.Zona.Nome AS Area
FROM            Dealer.Dealer INNER JOIN
                         Dealer.Stato ON Dealer.Dealer.IDStato = Dealer.Stato.IDStato INNER JOIN
                         Dealer.TipoDealer ON Dealer.Dealer.IDTipoDealer = Dealer.TipoDealer.IDTipoDealer LEFT OUTER JOIN
                         Dealer.CanaliDealer ON Dealer.Dealer.IDDealer = Dealer.CanaliDealer.IDDealer LEFT OUTER JOIN
                         Dealer.Canale ON Dealer.CanaliDealer.IDCanale = Dealer.Canale.IDCanale LEFT OUTER JOIN
                         Dealer.CondizioniPagamento ON Dealer.CanaliDealer.IDCondizioniPagamento = Dealer.CondizioniPagamento.IDCondizioniPagamento LEFT OUTER JOIN
                         InfoGenerali.InfoGenerali ON Dealer.Dealer.IDDealer = InfoGenerali.InfoGenerali.IDDealer LEFT OUTER JOIN
                         InfoGenerali.InfoPoint ON InfoGenerali.InfoGenerali.IDDealer = InfoGenerali.InfoPoint.IDDealer LEFT OUTER JOIN
                         Area.Area ON Dealer.Dealer.IDDealer = Area.Area.IDDealer LEFT OUTER JOIN
                         Area.Operativita ON Area.Area.IDOperativita = Area.Operativita.IDOperativita LEFT OUTER JOIN
                         Area.Tipologia ON Area.Area.IDTipologia = Area.Tipologia.IDTipologia LEFT OUTER JOIN
                         Area.AreaPoint ON Area.Area.IDDealer = Area.AreaPoint.IDDealer LEFT OUTER JOIN
                         Negozio.Negozio ON Dealer.Dealer.IDDealer = Negozio.Negozio.IDDealer LEFT OUTER JOIN
                         Negozio.Cluster ON Negozio.Negozio.IDCluster = Negozio.Cluster.IDCluster LEFT OUTER JOIN
                         Negozio.NegozioPoint ON Negozio.Negozio.IDDealer = Negozio.NegozioPoint.IDDealer LEFT OUTER JOIN
                         Negozio.TipologiaArredo ON Negozio.NegozioPoint.IDTipologiaArredo = Negozio.TipologiaArredo.IDTipologiaArredo LEFT OUTER JOIN
                         Negozio.DimensioneAreaVendita ON 
                         Negozio.NegozioPoint.IDDimensioneAreaVendita = Negozio.DimensioneAreaVendita.IDDimensioneAreaVendita LEFT OUTER JOIN
                         Vendite.Vendite ON Dealer.Dealer.IDDealer = Vendite.Vendite.IDDealer LEFT OUTER JOIN
                         Vendite.VenditeCanali ON Vendite.Vendite.IDDealer = Vendite.VenditeCanali.IDDealer LEFT OUTER JOIN
                         Disdetta.Disdetta ON Dealer.Dealer.IDDealer = Disdetta.Disdetta.IDDealer LEFT OUTER JOIN
                         Disdetta.DettaglioDisdetta ON Disdetta.Disdetta.IDDealer = Disdetta.DettaglioDisdetta.IDDealer LEFT OUTER JOIN
                         Disdetta.Richiedente ON Disdetta.Disdetta.IDRichiedente = Disdetta.Richiedente.IDRichiedente LEFT OUTER JOIN
                         Utenti.Funzionario ON Vendite.VenditeCanali.IDFunzionario = Utenti.Funzionario.IDFunzionario LEFT OUTER JOIN
                         Utenti.AreaManager ON Vendite.VenditeCanali.IDAreaManager = Utenti.AreaManager.IDAreaManager LEFT OUTER JOIN
                         Utility.Provincia ON Vendite.Vendite.IDProvincia = Utility.Provincia.IDProvincia LEFT OUTER JOIN
                         Utility.Provincia AS ProvinciaRea ON Area.AreaPoint.IDProvinciaRea = ProvinciaRea.IDProvincia LEFT OUTER JOIN
                         Utility.Regione ON Utility.Provincia.IDRegione = Utility.Regione.IDRegione LEFT OUTER JOIN
                         Utility.Zona ON Vendite.Vendite.IDZona = Utility.Zona.IDZona
WHERE        (Dealer.Dealer.IDTipoDealer = 3)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 4, @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_Point';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane4', @value = N'idth = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5070
         Alias = 2055
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_Point';
















GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N'Disdetta (Disdetta)"
            Begin Extent = 
               Top = 540
               Left = 246
               Bottom = 635
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Richiedente (Disdetta)"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 461
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Funzionario (Utenti)"
            Begin Extent = 
               Top = 576
               Left = 725
               Bottom = 688
               Right = 895
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AreaManager (Utenti)"
            Begin Extent = 
               Top = 594
               Left = 38
               Bottom = 706
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Provincia (Utility)"
            Begin Extent = 
               Top = 444
               Left = 712
               Bottom = 573
               Right = 882
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProvinciaRea"
            Begin Extent = 
               Top = 582
               Left = 933
               Bottom = 711
               Right = 1103
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Regione (Utility)"
            Begin Extent = 
               Top = 444
               Left = 920
               Bottom = 539
               Right = 1090
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Zona (Utility)"
            Begin Extent = 
               Top = 498
               Left = 38
               Bottom = 593
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 71
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         W', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_Point';


















GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Bottom = 235
               Right = 1223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InfoPoint (InfoGenerali)"
            Begin Extent = 
               Top = 733
               Left = 678
               Bottom = 873
               Right = 883
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Area (Area)"
            Begin Extent = 
               Top = 6
               Left = 934
               Bottom = 118
               Right = 1104
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Operativita (Area)"
            Begin Extent = 
               Top = 102
               Left = 246
               Bottom = 197
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tipologia (Area)"
            Begin Extent = 
               Top = 59
               Left = 472
               Bottom = 154
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AreaPoint (Area)"
            Begin Extent = 
               Top = 645
               Left = 222
               Bottom = 825
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Negozio (Negozio)"
            Begin Extent = 
               Top = 441
               Left = 419
               Bottom = 729
               Right = 689
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cluster (Negozio)"
            Begin Extent = 
               Top = 263
               Left = 583
               Bottom = 358
               Right = 753
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NegozioPoint (Negozio)"
            Begin Extent = 
               Top = 104
               Left = 961
               Bottom = 328
               Right = 1216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipologiaArredo (Negozio)"
            Begin Extent = 
               Top = 209
               Left = 329
               Bottom = 341
               Right = 527
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DimensioneAreaVendita (Negozio)"
            Begin Extent = 
               Top = 6
               Left = 671
               Bottom = 101
               Right = 898
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vendite (Vendite)"
            Begin Extent = 
               Top = 290
               Left = 250
               Bottom = 419
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VenditeCanali (Vendite)"
            Begin Extent = 
               Top = 425
               Left = 1054
               Bottom = 554
               Right = 1238
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Disdetta (Disdetta)"
            Begin Extent = 
               Top = 462
               Left = 490
               Bottom = 591
               Right = 687
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dettaglio', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_Point';
















GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[17] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Dealer (Dealer)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 323
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stato (Dealer)"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 101
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipoDealer (Dealer)"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 101
               Right = 633
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CanaliDealer (Dealer)"
            Begin Extent = 
               Top = 141
               Left = 413
               Bottom = 255
               Right = 632
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Canale (Dealer)"
            Begin Extent = 
               Top = 160
               Left = 573
               Bottom = 289
               Right = 755
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CondizioniPagamento (Dealer)"
            Begin Extent = 
               Top = 152
               Left = 754
               Bottom = 247
               Right = 994
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InfoGenerali (InfoGenerali)"
            Begin Extent = 
               Top = 47
               Left = 1019
               ', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_Point';

















