CREATE VIEW Dealer.View_PosPod
AS
SELECT        Dealer.Dealer.IDDealer, Dealer.Dealer.Indirizzo, Dealer.Dealer.PIVA, Dealer.Dealer.Telefono, Dealer.Dealer.Fax, Dealer.Dealer.DataModifica, 
                         Dealer.Dealer.IDUtente, Dealer.Dealer.IDTipoDealer, Dealer.Dealer.IDStato, Dealer.Dealer.Codice, Dealer.Stato.NomeStato AS Stato, 
                         Dealer.TipoDealer.NomeTipoDealer, Area.Operativita.Operativita, Area.Tipologia.Tipologia, InfoGenerali.InfoGenerali.CodiceFornitore, 
                         Dealer.CondizioniPagamento.NomeCondizioniPagamento AS CondizioniPagamento, Dealer.Canale.NomeCanale, Negozio.Negozio.NomeTitolare, 
                         Negozio.Negozio.Supporti, Negozio.Cluster.Cluster, Vendite.Vendite.CAP, Vendite.Vendite.Localita, Vendite.Vendite.Nome1, Utility.Provincia.Nome AS Provincia, 
                         Utility.Regione.Nome AS Regione, Disdetta.Disdetta.VecchioCodice, Disdetta.Disdetta.DataTerminePreavviso, Disdetta.Disdetta.DataInvioDisdetta, 
                         Disdetta.Disdetta.GiorniPreavviso, Disdetta.Disdetta.Note, Disdetta.DettaglioDisdetta.DataDisdetta, Vendite.VenditeCanali.Cliente, 
                         Vendite.VenditeCanali.GruppoPrezzi, Vendite.VenditeCanali.Magazzino, Vendite.VenditeCanali.Nome2, Utenti.Funzionario.AGL AS CodiceFunzionario, 
                         Utenti.Funzionario.Nome AS Funzionario, Utenti.AreaManager.VKBUR AS CodiceAreaManager, Utenti.AreaManager.Nome AS AreaManager, 
                         Negozio.NegozioPosPod.FT, Negozio.NegozioPosPod.FTE, Negozio.NegozioPosPod.PT, Negozio.NegozioPosPod.NumeroVetrine, Negozio.NegozioPosPod.Insegna,
                          Negozio.NegozioPosPod.Latitudine, Negozio.NegozioPosPod.Longitudine, Negozio.NegozioPosPod.ShopInStore, Negozio.NegozioPosPod.ValoreAffitto, 
                         Negozio.TipologiaArredo.TipologiaArredo, Catene.CatenePosPod.DatiCateneAM, Catene.CatenePosPod.DatiCateneFunzionario, Area.AreaPosPod.CentroCommerciale,
                          Area.AreaPosPod.MagazzinoCentralizzato, Area.AreaPosPod.NegozioTop, InfoGenerali.InfoPosEPod.BOL, InfoGenerali.InfoPosEPod.DataAperturaNegozio, 
                         InfoGenerali.InfoPosEPod.CentroAssistenzaTecnica, ISNULL(Vendite.Vendite.Nome1, '') + ' ' + ISNULL(Vendite.VenditeCanali.Nome2, '') AS RagioneSociale, 
                         InfoGenerali.InfoPosEPod.DataChiusuraNegozio, InfoGenerali.InfoPosEPod.DataAperturaCodice, InfoGenerali.InfoPosEPod.DataChiusuraCodice, 
                         InfoGenerali.InfoGenerali.CodiceVogi, InfoGenerali.InfoGenerali.EMail, InfoGenerali.InfoGenerali.PEC, Negozio.Negozio.Telefono AS TelefonoNegozio, 
                         Negozio.Negozio.EmailTitolare, Negozio.Negozio.CFTitolare, Catene.TipoRemunerazione.TipoRemunerazione, Disdetta.Richiedente.Richiedente, 
                         Area.SegmentazioneCanale.SegmentazioneCanale, Dealer.Dealer.DataModificaUtente, Dealer.Canale.IDCanale, Utility.Regione.IDRegione, 
                         Utility.Provincia.IDProvincia, Area.SegmentazioneCanale.IDSegmentazioneCanale, Negozio.Negozio.NomeContatto, 
                         Negozio.DimensioneAreaVendita.DimensioneAreaVendita, Dealer.Canale.DescrizioneCanale AS Canale, Area.Area.IDOperativita, Vendite.Vendite.IDArea, 
                         AreaDiCompetenza_1.NomeArea AS Area, Area.AreaPosPod.IDAreaDiCompetenza, Area.AreaDiCompetenza.NomeArea AS AreaDiCompetenza
FROM            Dealer.Dealer INNER JOIN
                         Dealer.Stato ON Dealer.Dealer.IDStato = Dealer.Stato.IDStato INNER JOIN
                         Dealer.TipoDealer ON Dealer.Dealer.IDTipoDealer = Dealer.TipoDealer.IDTipoDealer LEFT OUTER JOIN
                         Dealer.CanaliDealer ON Dealer.Dealer.IDDealer = Dealer.CanaliDealer.IDDealer LEFT OUTER JOIN
                         Dealer.Canale ON Dealer.CanaliDealer.IDCanale = Dealer.Canale.IDCanale LEFT OUTER JOIN
                         Dealer.CondizioniPagamento ON Dealer.CanaliDealer.IDCondizioniPagamento = Dealer.CondizioniPagamento.IDCondizioniPagamento LEFT OUTER JOIN
                         InfoGenerali.InfoGenerali ON Dealer.Dealer.IDDealer = InfoGenerali.InfoGenerali.IDDealer LEFT OUTER JOIN
                         InfoGenerali.InfoPosEPod ON InfoGenerali.InfoGenerali.IDDealer = InfoGenerali.InfoPosEPod.IDDealer LEFT OUTER JOIN
                         Area.Area ON Dealer.Dealer.IDDealer = Area.Area.IDDealer LEFT OUTER JOIN
                         Area.AreaPosPod ON Area.Area.IDDealer = Area.AreaPosPod.IDDealer LEFT OUTER JOIN
                         Area.Operativita ON Area.Area.IDOperativita = Area.Operativita.IDOperativita LEFT OUTER JOIN
                         Area.Tipologia ON Area.Area.IDTipologia = Area.Tipologia.IDTipologia LEFT OUTER JOIN
                         Area.AreaDiCompetenza ON Area.AreaDiCompetenza.IDAreaDiCompetenza = Area.AreaPosPod.IDAreaDiCompetenza LEFT OUTER JOIN
                         Vendite.Vendite ON Dealer.Dealer.IDDealer = Vendite.Vendite.IDDealer LEFT OUTER JOIN
                         Area.AreaDiCompetenza AS AreaDiCompetenza_1 ON Vendite.Vendite.IDArea = AreaDiCompetenza_1.IDAreaDiCompetenza LEFT OUTER JOIN
                         Area.SegmentazioneCanale ON Area.AreaPosPod.IDSegmentazioneCanale = Area.SegmentazioneCanale.IDSegmentazioneCanale LEFT OUTER JOIN
                         Negozio.Negozio ON Dealer.Dealer.IDDealer = Negozio.Negozio.IDDealer LEFT OUTER JOIN
                         Negozio.Cluster ON Negozio.Negozio.IDCluster = Negozio.Cluster.IDCluster LEFT OUTER JOIN
                         Negozio.NegozioPosPod ON Negozio.Negozio.IDDealer = Negozio.NegozioPosPod.IDDealer LEFT OUTER JOIN
                         Negozio.DimensioneAreaVendita ON 
                         Negozio.DimensioneAreaVendita.IDDimensioneAreaVendita = Negozio.NegozioPosPod.IDDimensioneAreaVendita LEFT OUTER JOIN
                         Negozio.TipologiaArredo ON Negozio.NegozioPosPod.IDTipologiaArredo = Negozio.TipologiaArredo.IDTipologiaArredo LEFT OUTER JOIN
                         Catene.Catene ON Dealer.Dealer.IDDealer = Catene.Catene.IDDealer LEFT OUTER JOIN
                         Catene.TipoRemunerazione ON Catene.Catene.IDTipoRemunerazione = Catene.TipoRemunerazione.IDTipoRemunerazione LEFT OUTER JOIN
                         Catene.CatenePosPod ON Catene.Catene.IDDealer = Catene.CatenePosPod.IDDealer LEFT OUTER JOIN
                         Vendite.VenditeCanali ON Vendite.Vendite.IDDealer = Vendite.VenditeCanali.IDDealer LEFT OUTER JOIN
                         Disdetta.Disdetta ON Dealer.Dealer.IDDealer = Disdetta.Disdetta.IDDealer LEFT OUTER JOIN
                         Disdetta.DettaglioDisdetta ON Disdetta.Disdetta.IDDealer = Disdetta.DettaglioDisdetta.IDDealer LEFT OUTER JOIN
                         Disdetta.Richiedente ON Disdetta.Disdetta.IDRichiedente = Disdetta.Richiedente.IDRichiedente LEFT OUTER JOIN
                         Utenti.Funzionario ON Vendite.VenditeCanali.IDFunzionario = Utenti.Funzionario.IDFunzionario LEFT OUTER JOIN
                         Utenti.AreaManager ON Vendite.VenditeCanali.IDAreaManager = Utenti.AreaManager.IDAreaManager LEFT OUTER JOIN
                         Utility.Provincia ON Vendite.Vendite.IDProvincia = Utility.Provincia.IDProvincia LEFT OUTER JOIN
                         Utility.Regione ON Utility.Provincia.IDRegione = Utility.Regione.IDRegione LEFT OUTER JOIN
                         Utility.Zona ON Utility.Provincia.IDZona = Utility.Zona.IDZona
WHERE        (Dealer.Dealer.IDTipoDealer = 2)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 4, @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_PosPod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane4', @value = N' = 1500
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
         Width = 1965
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
         Width = 1950
         Width = 1500
         Width = 1800
         Width = 1650
         Width = 1905
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3555
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
', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_PosPod';










GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N'TipoRemunerazione (Catene)"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 497
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CatenePosPod (Catene)"
            Begin Extent = 
               Top = 594
               Left = 454
               Bottom = 706
               Right = 663
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vendite (Vendite)"
            Begin Extent = 
               Top = 408
               Left = 282
               Bottom = 537
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VenditeCanali (Vendite)"
            Begin Extent = 
               Top = 540
               Left = 920
               Bottom = 669
               Right = 1104
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
         Begin Table = "DettaglioDisdetta (Disdetta)"
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
               Top = 700
               Left = 246
               Bottom = 795
               Right = 416
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
               Top = 541
               Left = 30
               Bottom = 653
               Right = 201
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
            TopColumn = 1
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
         Begin Table = "AreaDiCompetenza_1"
            Begin Extent = 
               Top = 6
               Left = 671
               Bottom = 118
               Right = 873
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
      Begin ColumnWidths = 83
         Width = 284
         Width', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_PosPod';










GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Bottom = 249
               Right = 1108
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InfoPosEPod (InfoGenerali)"
            Begin Extent = 
               Top = 516
               Left = 86
               Bottom = 700
               Right = 338
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
         Begin Table = "AreaPosPod (Area)"
            Begin Extent = 
               Top = 539
               Left = 920
               Bottom = 723
               Right = 1145
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
               Top = 102
               Left = 454
               Bottom = 197
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AreaDiCompetenza (Area)"
            Begin Extent = 
               Top = 138
               Left = 662
               Bottom = 233
               Right = 864
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SegmentazioneCanale (Area)"
            Begin Extent = 
               Top = 1450
               Left = 38
               Bottom = 1545
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Negozio (Negozio)"
            Begin Extent = 
               Top = 330
               Left = 495
               Bottom = 459
               Right = 674
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "Cluster (Negozio)"
            Begin Extent = 
               Top = 348
               Left = 712
               Bottom = 443
               Right = 882
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NegozioPosPod (Negozio)"
            Begin Extent = 
               Top = 172
               Left = 80
               Bottom = 364
               Right = 337
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "DimensioneAreaVendita (Negozio)"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 478
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipologiaArredo (Negozio)"
            Begin Extent = 
               Top = 336
               Left = 478
               Bottom = 468
               Right = 676
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Catene (Catene)"
            Begin Extent = 
               Top = 348
               Left = 920
               Bottom = 443
               Right = 1126
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_PosPod';










GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[18] 2[22] 3) )"
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
               Top = 0
               Left = 14
               Bottom = 296
               Right = 290
            End
            DisplayFlags = 280
            TopColumn = 1
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
               Top = 198
               Left = 282
               Bottom = 312
               Right = 501
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Canale (Dealer)"
            Begin Extent = 
               Top = 170
               Left = 533
               Bottom = 317
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CondizioniPagamento (Dealer)"
            Begin Extent = 
               Top = 252
               Left = 746
               Bottom = 347
               Right = 986
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InfoGenerali (InfoGenerali)"
            Begin Extent = 
               Top = 120
               Left = 934
               ', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_PosPod';









