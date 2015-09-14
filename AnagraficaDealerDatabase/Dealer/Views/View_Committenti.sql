
CREATE VIEW [Dealer].[View_Committenti]
AS
SELECT        Dealer.Dealer.IDDealer, Dealer.Dealer.Indirizzo, Dealer.Dealer.PIVA, Dealer.Dealer.Telefono, Dealer.Dealer.Fax, Dealer.Dealer.DataModifica, 
                         Dealer.Dealer.IDUtente, Dealer.Dealer.IDTipoDealer, Dealer.Dealer.IDStato, Dealer.Dealer.Codice, Dealer.Stato.NomeStato AS Stato, 
                         Dealer.TipoDealer.NomeTipoDealer, InfoGenerali.InfoCommittenti.BOL, InfoGenerali.InfoCommittenti.DataAperturaCodice, 
                         InfoGenerali.InfoCommittenti.DataChiusuraCodice, InfoGenerali.InfoCommittenti.DealerAssociatiAttivi, 
                         InfoGenerali.InfoCommittenti.DealerAssociatiInattivi AS DealerAssociatiDisattivi, InfoGenerali.InfoCommittenti.FideiussioneAffitto, 
                         InfoGenerali.InfoCommittenti.FideiussioneCommerciale, Area.Operativita.Operativita, Area.Tipologia.Tipologia, InfoGenerali.InfoGenerali.CodiceFornitore, 
                         InfoGenerali.InfoGenerali.CodiceVogi, InfoGenerali.InfoGenerali.EMail, InfoGenerali.InfoGenerali.PEC, Area.AreaCommittenti.AccordiParticolari, 
                         Area.AreaCommittenti.DataContratto, Area.AreaCommittenti.FirmaDigitale, Area.AreaCommittenti.Rea, Area.AreaDiCompetenza.NomeArea AS AreaDiCompetenza, 
                         Dealer.CondizioniPagamento.NomeCondizioniPagamento AS CondizioniPagamento, Dealer.Canale.NomeCanale, 
                         Negozio.NegozioCommittenti.ClassificazioneMaster, Negozio.NegozioCommittenti.FT, Negozio.NegozioCommittenti.FTE, Negozio.NegozioCommittenti.PT, 
                         Negozio.NegozioCommittenti.NumeroVetrine, Negozio.NegozioCommittenti.Piu12, Negozio.Negozio.Telefono AS TelefonoNegozio, Negozio.Negozio.NomeTitolare, 
                         Negozio.Negozio.Supporti, Negozio.Cluster.Cluster, Catene.TipoRemunerazione.TipoRemunerazione, Vendite.Vendite.CAP, Vendite.Vendite.Localita, 
                         Vendite.Vendite.Nome1, Utility.Provincia.Nome AS Provincia, Utility.Regione.Nome AS Regione, Disdetta.Disdetta.VecchioCodice, 
                         Disdetta.Disdetta.DataTerminePreavviso, Disdetta.Disdetta.DataInvioDisdetta, Disdetta.Disdetta.GiorniPreavviso, Disdetta.Disdetta.Note, Utility.Zona.Nome AS Area, 
                         Disdetta.DettaglioDisdetta.DataDisdetta, Vendite.VenditeCanali.Cliente, Vendite.VenditeCanali.GruppoPrezzi, Vendite.VenditeCanali.Magazzino, 
                         Vendite.VenditeCanali.Nome2, Utenti.Funzionario.AGL AS CodiceFunzionario, Utenti.Funzionario.Nome AS Funzionario, 
                         Utenti.AreaManager.VKBUR AS CodiceAreaManager, Utenti.AreaManager.Nome AS AreaManager, ISNULL(Vendite.Vendite.Nome1, '') 
                         + ' ' + ISNULL(Vendite.VenditeCanali.Nome2, '') AS RagioneSociale, Disdetta.Richiedente.Richiedente, Area.SegmentazioneCanale.SegmentazioneCanale, 
                         ProvinciaRea.Nome AS ProvRea, Negozio.Negozio.CFTitolare, Negozio.Negozio.EmailTitolare, Dealer.Dealer.DataModificaUtente, Dealer.Canale.IDCanale, 
                         Utility.Zona.IDZona AS IDArea, Utility.Regione.IDRegione, Utility.Provincia.IDProvincia, Area.SegmentazioneCanale.IDSegmentazioneCanale, 
                         Negozio.Negozio.NomeContatto, Dealer.Canale.DescrizioneCanale AS Canale, Area.IDOperativita AS IDOperativita
FROM            Dealer.Dealer INNER JOIN
                         Dealer.Stato ON Dealer.Dealer.IDStato = Dealer.Stato.IDStato INNER JOIN
                         Dealer.TipoDealer ON Dealer.Dealer.IDTipoDealer = Dealer.TipoDealer.IDTipoDealer LEFT OUTER JOIN
                         InfoGenerali.InfoGenerali ON Dealer.Dealer.IDDealer = InfoGenerali.InfoGenerali.IDDealer LEFT OUTER JOIN
                         InfoGenerali.InfoCommittenti ON InfoGenerali.InfoGenerali.IDDealer = InfoGenerali.InfoCommittenti.IDDealer LEFT OUTER JOIN
                         Dealer.CanaliDealer ON Dealer.Dealer.IDDealer = Dealer.CanaliDealer.IDDealer LEFT OUTER JOIN
                         Dealer.Canale ON Dealer.CanaliDealer.IDCanale = Dealer.Canale.IDCanale LEFT OUTER JOIN
                         Dealer.CondizioniPagamento ON Dealer.CanaliDealer.IDCondizioniPagamento = Dealer.CondizioniPagamento.IDCondizioniPagamento LEFT OUTER JOIN
                         Area.Area ON Dealer.Dealer.IDDealer = Area.Area.IDDealer LEFT OUTER JOIN
                         Area.AreaCommittenti ON Area.Area.IDDealer = Area.AreaCommittenti.IDDealer LEFT OUTER JOIN
                         Area.SegmentazioneCanale ON Area.AreaCommittenti.IDSegmentazioneCanale = Area.SegmentazioneCanale.IDSegmentazioneCanale LEFT OUTER JOIN
                         Area.Operativita ON Area.Area.IDOperativita = Area.Operativita.IDOperativita LEFT OUTER JOIN
                         Area.Tipologia ON Area.Area.IDTipologia = Area.Tipologia.IDTipologia LEFT OUTER JOIN
                         Area.AreaDiCompetenza ON Area.AreaCommittenti.IDAreaDiCompetenza = Area.AreaDiCompetenza.IDAreaDiCompetenza LEFT OUTER JOIN
                         Negozio.Negozio ON Dealer.Dealer.IDDealer = Negozio.Negozio.IDDealer LEFT OUTER JOIN
                         Negozio.NegozioCommittenti ON Negozio.Negozio.IDDealer = Negozio.NegozioCommittenti.IDDealer LEFT OUTER JOIN
                         Negozio.Cluster ON Negozio.Negozio.IDCluster = Negozio.Cluster.IDCluster LEFT OUTER JOIN
                         Catene.Catene ON Dealer.Dealer.IDDealer = Catene.Catene.IDDealer LEFT OUTER JOIN
                         Catene.TipoRemunerazione ON Catene.Catene.IDTipoRemunerazione = Catene.TipoRemunerazione.IDTipoRemunerazione LEFT OUTER JOIN
                         Vendite.Vendite ON Dealer.Dealer.IDDealer = Vendite.Vendite.IDDealer LEFT OUTER JOIN
                         Vendite.VenditeCanali ON Vendite.Vendite.IDDealer = Vendite.VenditeCanali.IDDealer LEFT OUTER JOIN
                         Disdetta.Disdetta ON Dealer.Dealer.IDDealer = Disdetta.Disdetta.IDDealer LEFT OUTER JOIN
                         Disdetta.DettaglioDisdetta ON Disdetta.Disdetta.IDDealer = Disdetta.DettaglioDisdetta.IDDealer LEFT OUTER JOIN
                         Disdetta.Richiedente ON Disdetta.Disdetta.IDRichiedente = Disdetta.Richiedente.IDRichiedente LEFT OUTER JOIN
                         Utenti.Funzionario ON Vendite.VenditeCanali.IDFunzionario = Utenti.Funzionario.IDFunzionario LEFT OUTER JOIN
                         Utenti.AreaManager ON Vendite.VenditeCanali.IDAreaManager = Utenti.AreaManager.IDAreaManager LEFT OUTER JOIN
                         Utility.Provincia ON Vendite.Vendite.IDProvincia = Utility.Provincia.IDProvincia LEFT OUTER JOIN
                         Utility.Provincia AS ProvinciaRea ON Area.AreaCommittenti.IDProvinciaRea = ProvinciaRea.IDProvincia LEFT OUTER JOIN
                         Utility.Regione ON Utility.Provincia.IDRegione = Utility.Regione.IDRegione LEFT OUTER JOIN
                         Utility.Zona ON Utility.Provincia.IDZona = Utility.Zona.IDZona
WHERE        (Dealer.Dealer.IDTipoDealer = 1)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 4, @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_Committenti';




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N'     Begin Table = "VenditeCanali (Vendite)"
            Begin Extent = 
               Top = 39
               Left = 1160
               Bottom = 303
               Right = 1412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Disdetta (Disdetta)"
            Begin Extent = 
               Top = 37
               Left = 457
               Bottom = 225
               Right = 713
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DettaglioDisdetta (Disdetta)"
            Begin Extent = 
               Top = 0
               Left = 720
               Bottom = 95
               Right = 890
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Richiedente (Disdetta)"
            Begin Extent = 
               Top = 306
               Left = 38
               Bottom = 401
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Funzionario (Utenti)"
            Begin Extent = 
               Top = 94
               Left = 166
               Bottom = 206
               Right = 336
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AreaManager (Utenti)"
            Begin Extent = 
               Top = 210
               Left = 982
               Bottom = 322
               Right = 1153
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Provincia (Utility)"
            Begin Extent = 
               Top = 60
               Left = 1020
               Bottom = 229
               Right = 1202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProvinciaRea"
            Begin Extent = 
               Top = 2118
               Left = 555
               Bottom = 2247
               Right = 725
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Regione (Utility)"
            Begin Extent = 
               Top = 108
               Left = 889
               Bottom = 203
               Right = 1059
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Zona (Utility)"
            Begin Extent = 
               Top = 67
               Left = 1009
               Bottom = 162
               Right = 1179
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
         Width = 1980
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
         Width = 2115
         Width = 1500
         Width = 1860
         Width = 1500
         Width = 1500
         Width = 1500
', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_Committenti';






















GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'         Bottom = 292
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CondizioniPagamento (Dealer)"
            Begin Extent = 
               Top = 267
               Left = 1367
               Bottom = 362
               Right = 1607
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Area (Area)"
            Begin Extent = 
               Top = 338
               Left = 1175
               Bottom = 465
               Right = 1354
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AreaCommittenti (Area)"
            Begin Extent = 
               Top = 11
               Left = 152
               Bottom = 213
               Right = 365
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SegmentazioneCanale (Area)"
            Begin Extent = 
               Top = 435
               Left = 88
               Bottom = 530
               Right = 305
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Operativita (Area)"
            Begin Extent = 
               Top = 206
               Left = 1321
               Bottom = 301
               Right = 1491
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tipologia (Area)"
            Begin Extent = 
               Top = 34
               Left = 1220
               Bottom = 129
               Right = 1390
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AreaDiCompetenza (Area)"
            Begin Extent = 
               Top = 304
               Left = 1205
               Bottom = 420
               Right = 1408
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Negozio (Negozio)"
            Begin Extent = 
               Top = 175
               Left = 236
               Bottom = 391
               Right = 434
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "NegozioCommittenti (Negozio)"
            Begin Extent = 
               Top = 72
               Left = 1233
               Bottom = 270
               Right = 1441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cluster (Negozio)"
            Begin Extent = 
               Top = 40
               Left = 1510
               Bottom = 135
               Right = 1680
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Catene (Catene)"
            Begin Extent = 
               Top = 251
               Left = 854
               Bottom = 346
               Right = 1060
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipoRemunerazione (Catene)"
            Begin Extent = 
               Top = 83
               Left = 900
               Bottom = 178
               Right = 1106
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vendite (Vendite)"
            Begin Extent = 
               Top = 375
               Left = 1080
               Bottom = 566
               Right = 1279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
    ', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_Committenti';


















GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[50] 4[19] 2[12] 3) )"
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
         Left = -39
      End
      Begin Tables = 
         Begin Table = "Dealer (Dealer)"
            Begin Extent = 
               Top = 28
               Left = 631
               Bottom = 361
               Right = 859
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stato (Dealer)"
            Begin Extent = 
               Top = 282
               Left = 466
               Bottom = 392
               Right = 640
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipoDealer (Dealer)"
            Begin Extent = 
               Top = 259
               Left = 775
               Bottom = 370
               Right = 959
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InfoGenerali (InfoGenerali)"
            Begin Extent = 
               Top = 319
               Left = 85
               Bottom = 448
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InfoCommittenti (InfoGenerali)"
            Begin Extent = 
               Top = 137
               Left = 965
               Bottom = 390
               Right = 1207
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CanaliDealer (Dealer)"
            Begin Extent = 
               Top = 247
               Left = 266
               Bottom = 359
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Canale (Dealer)"
            Begin Extent = 
               Top = 146
               Left = 48
      ', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_Committenti';
















GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane4', @value = N'         Width = 1500
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3870
         Alias = 1410
         Table = 2595
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
', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_Committenti';

















