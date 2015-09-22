CREATE VIEW Dealer.View_AgentiCommittenti
AS
SELECT        Dealer.Dealer.IDDealer, Dealer.Dealer.Indirizzo, Dealer.Dealer.PIVA, Dealer.Dealer.Telefono, Dealer.Dealer.Fax, Dealer.Dealer.DataModifica, 
                         Dealer.Dealer.IDUtente, Dealer.Dealer.IDTipoDealer, Dealer.Dealer.IDStato, Dealer.Dealer.Codice, Dealer.Stato.NomeStato AS Stato, 
                         Dealer.TipoDealer.NomeTipoDealer, Area.Operativita.Operativita, Area.Tipologia.Tipologia, InfoGenerali.CodiceFornitore, InfoGenerali.CodiceVogi, InfoGenerali.EMail, 
                         InfoGenerali.PEC, Dealer.CondizioniPagamento.NomeCondizioniPagamento AS CondizioniPagamento, Dealer.Canale.NomeCanale, 
                         Negozio.Negozio.Telefono AS TelefonoNegozio, Negozio.Negozio.NomeTitolare, Negozio.Negozio.Supporti, Negozio.Cluster.Cluster, 
                         Catene.TipoRemunerazione.TipoRemunerazione, Vendite.Vendite.CAP, Vendite.Vendite.Localita, Vendite.Vendite.Nome1, Utility.Provincia.Nome AS Provincia, 
                         Utility.Regione.Nome AS Regione, Disdetta.Disdetta.VecchioCodice, Disdetta.Disdetta.DataTerminePreavviso, Disdetta.Disdetta.DataInvioDisdetta, 
                         Disdetta.Disdetta.GiorniPreavviso, Disdetta.Disdetta.Note, Disdetta.DettaglioDisdetta.DataDisdetta, Vendite.VenditeCanali.Cliente, 
                         Vendite.VenditeCanali.GruppoPrezzi, Vendite.VenditeCanali.Magazzino, Vendite.VenditeCanali.Nome2, Utenti.Funzionario.AGL AS CodiceFunzionario, 
                         Utenti.Funzionario.Nome AS Funzionario, Utenti.AreaManager.VKBUR AS CodiceAreaManager, Utenti.AreaManager.Nome AS AreaManager, 
                         InfoGenerali.InfoAgentiCommittenti.BOL, InfoGenerali.InfoAgentiCommittenti.DataAperturaCodice, InfoGenerali.InfoAgentiCommittenti.DataChiusuraCodice, 
                         Area.AreaAgentiCommittenti.DataContratto, Area.AreaAgentiCommittenti.FirmaDigitale, Area.AreaAgentiCommittenti.Rea, 
                         Negozio.NegozioAgenti.IndirizzoSpedizioneMateriale, ISNULL(Vendite.Vendite.Nome1, '') + ' ' + ISNULL(Vendite.VenditeCanali.Nome2, '') AS RagioneSociale, 
                         Negozio.Negozio.CFTitolare, Negozio.Negozio.EmailTitolare, Vendite.VenditeCanali.FlagCancellazione, Disdetta.Richiedente.Richiedente, 
                         DettaglioAgenti.DettaglioAgenti.Plurimandatario, DettaglioAgenti.MaterialeEspositivo.MaterialeEspositivo, DettaglioAgenti.DettaglioAgenti.ZonaAssegnata, 
                         DettaglioAgenti.Dimensionamento.Dimensionamento, ProvinciaRea.Nome AS ProvRea, Dealer.Dealer.DataModificaUtente, Dealer.Canale.IDCanale, 
                         Utility.Regione.IDRegione, Utility.Provincia.IDProvincia, Negozio.Negozio.NomeContatto, Dealer.Canale.DescrizioneCanale AS Canale, Area.Area.IDOperativita, 
                         Vendite.Vendite.IDArea, Area.AreaDiCompetenza.NomeArea AS Area
FROM            Dealer.Dealer INNER JOIN
                         Dealer.Stato ON Dealer.Dealer.IDStato = Dealer.Stato.IDStato INNER JOIN
                         Dealer.TipoDealer ON Dealer.Dealer.IDTipoDealer = Dealer.TipoDealer.IDTipoDealer LEFT OUTER JOIN
                         InfoGenerali.InfoGenerali AS InfoGenerali ON Dealer.Dealer.IDDealer = InfoGenerali.IDDealer LEFT OUTER JOIN
                         InfoGenerali.InfoAgentiCommittenti ON InfoGenerali.IDDealer = InfoGenerali.InfoAgentiCommittenti.IDDealer LEFT OUTER JOIN
                         DettaglioAgenti.DettaglioAgenti ON Dealer.Dealer.IDDealer = DettaglioAgenti.DettaglioAgenti.IDDealer LEFT OUTER JOIN
                         DettaglioAgenti.MaterialeEspositivo ON 
                         DettaglioAgenti.DettaglioAgenti.IDMaterialeEspositivo = DettaglioAgenti.MaterialeEspositivo.IDMaterialeEspositivo LEFT OUTER JOIN
                         DettaglioAgenti.Dimensionamento ON DettaglioAgenti.Dimensionamento.IDDimensionamento = DettaglioAgenti.DettaglioAgenti.IDDimensionamento LEFT OUTER JOIN
                         Dealer.CanaliDealer ON Dealer.Dealer.IDDealer = Dealer.CanaliDealer.IDDealer LEFT OUTER JOIN
                         Dealer.Canale ON Dealer.CanaliDealer.IDCanale = Dealer.Canale.IDCanale LEFT OUTER JOIN
                         Dealer.CondizioniPagamento ON Dealer.CanaliDealer.IDCondizioniPagamento = Dealer.CondizioniPagamento.IDCondizioniPagamento LEFT OUTER JOIN
                         Area.Area ON Dealer.Dealer.IDDealer = Area.Area.IDDealer LEFT OUTER JOIN
                         Area.Operativita ON Area.Area.IDOperativita = Area.Operativita.IDOperativita LEFT OUTER JOIN
                         Area.Tipologia ON Area.Area.IDTipologia = Area.Tipologia.IDTipologia LEFT OUTER JOIN
                         Area.AreaAgentiCommittenti ON Area.Area.IDDealer = Area.AreaAgentiCommittenti.IDDealer LEFT OUTER JOIN
                         Vendite.Vendite ON Dealer.Dealer.IDDealer = Vendite.Vendite.IDDealer LEFT OUTER JOIN
                         Area.AreaDiCompetenza ON Vendite.Vendite.IDArea = Area.AreaDiCompetenza.IDAreaDiCompetenza LEFT OUTER JOIN
                         Negozio.Negozio ON Dealer.Dealer.IDDealer = Negozio.Negozio.IDDealer LEFT OUTER JOIN
                         Negozio.NegozioAgenti ON Negozio.Negozio.IDDealer = Negozio.NegozioAgenti.IDDealer LEFT OUTER JOIN
                         Negozio.Cluster ON Negozio.Negozio.IDCluster = Negozio.Cluster.IDCluster LEFT OUTER JOIN
                         Negozio.Apre ON Dealer.Dealer.IDDealer = Negozio.Apre.IDDealer LEFT OUTER JOIN
                         Negozio.OrarioDiApertura ON Negozio.Apre.IDOrarioApertura = Negozio.OrarioDiApertura.IDOrarioApertura LEFT OUTER JOIN
                         Catene.Catene ON Dealer.Dealer.IDDealer = Catene.Catene.IDDealer LEFT OUTER JOIN
                         Catene.TipoRemunerazione ON Catene.Catene.IDTipoRemunerazione = Catene.TipoRemunerazione.IDTipoRemunerazione LEFT OUTER JOIN
                         Vendite.VenditeCanali ON Vendite.Vendite.IDDealer = Vendite.VenditeCanali.IDDealer LEFT OUTER JOIN
                         Disdetta.Disdetta ON Dealer.Dealer.IDDealer = Disdetta.Disdetta.IDDealer LEFT OUTER JOIN
                         Disdetta.DettaglioDisdetta ON Disdetta.Disdetta.IDDealer = Disdetta.DettaglioDisdetta.IDDealer LEFT OUTER JOIN
                         Disdetta.Richiedente ON Disdetta.Disdetta.IDRichiedente = Disdetta.Richiedente.IDRichiedente LEFT OUTER JOIN
                         Utenti.Funzionario ON Vendite.VenditeCanali.IDFunzionario = Utenti.Funzionario.IDFunzionario LEFT OUTER JOIN
                         Utenti.AreaManager ON Vendite.VenditeCanali.IDAreaManager = Utenti.AreaManager.IDAreaManager LEFT OUTER JOIN
                         Utility.Provincia ON Vendite.Vendite.IDProvincia = Utility.Provincia.IDProvincia LEFT OUTER JOIN
                         Utility.Provincia AS ProvinciaRea ON Area.AreaAgentiCommittenti.IDProvinciaRea = ProvinciaRea.IDProvincia LEFT OUTER JOIN
                         Utility.Regione ON Utility.Provincia.IDRegione = Utility.Regione.IDRegione LEFT OUTER JOIN
                         Utility.Zona ON Utility.Provincia.IDZona = Utility.Zona.IDZona
WHERE        (Dealer.Dealer.IDTipoDealer = 4)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 4, @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_AgentiCommittenti';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane4', @value = N' Bottom = 394
               Right = 647
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
      Begin ColumnWidths = 68
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
         Width = 1860
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
         Width = 2445
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
         Column = 4710
         Alias = 1845
         Table = 1995
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
', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_AgentiCommittenti';




















GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N' 0
         End
         Begin Table = "Catene (Catene)"
            Begin Extent = 
               Top = 157
               Left = 85
               Bottom = 252
               Right = 291
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipoRemunerazione (Catene)"
            Begin Extent = 
               Top = 328
               Left = 732
               Bottom = 423
               Right = 938
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vendite (Vendite)"
            Begin Extent = 
               Top = 249
               Left = 1011
               Bottom = 440
               Right = 1210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VenditeCanali (Vendite)"
            Begin Extent = 
               Top = 13
               Left = 355
               Bottom = 277
               Right = 607
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Disdetta (Disdetta)"
            Begin Extent = 
               Top = 77
               Left = 857
               Bottom = 265
               Right = 1113
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DettaglioDisdetta (Disdetta)"
            Begin Extent = 
               Top = 9
               Left = 1133
               Bottom = 104
               Right = 1303
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Richiedente (Disdetta)"
            Begin Extent = 
               Top = 204
               Left = 1302
               Bottom = 299
               Right = 1472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Funzionario (Utenti)"
            Begin Extent = 
               Top = 18
               Left = 191
               Bottom = 130
               Right = 361
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
               Top = 24
               Left = 954
               Bottom = 193
               Right = 1136
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProvinciaRea"
            Begin Extent = 
               Top = 348
               Left = 1764
               Bottom = 477
               Right = 1934
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Regione (Utility)"
            Begin Extent = 
               Top = 28
               Left = 918
               Bottom = 123
               Right = 1088
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
         Begin Table = "AreaDiCompetenza (Area)"
            Begin Extent = 
               Top = 282
               Left = 445
              ', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_AgentiCommittenti';




















GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'     Left = 1524
               Bottom = 481
               Right = 1726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dimensionamento (DettaglioAgenti)"
            Begin Extent = 
               Top = 318
               Left = 1315
               Bottom = 413
               Right = 1513
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CanaliDealer (Dealer)"
            Begin Extent = 
               Top = 443
               Left = 596
               Bottom = 555
               Right = 814
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Canale (Dealer)"
            Begin Extent = 
               Top = 38
               Left = 673
               Bottom = 174
               Right = 845
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CondizioniPagamento (Dealer)"
            Begin Extent = 
               Top = 14
               Left = 102
               Bottom = 109
               Right = 342
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Area (Area)"
            Begin Extent = 
               Top = 251
               Left = 1028
               Bottom = 378
               Right = 1207
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Operativita (Area)"
            Begin Extent = 
               Top = 316
               Left = 237
               Bottom = 411
               Right = 407
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tipologia (Area)"
            Begin Extent = 
               Top = 157
               Left = 1094
               Bottom = 252
               Right = 1264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AreaAgentiCommittenti (Area)"
            Begin Extent = 
               Top = 11
               Left = 80
               Bottom = 216
               Right = 355
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Negozio (Negozio)"
            Begin Extent = 
               Top = 410
               Left = 1068
               Bottom = 671
               Right = 1277
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NegozioAgenti (Negozio)"
            Begin Extent = 
               Top = 165
               Left = 723
               Bottom = 277
               Right = 962
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cluster (Negozio)"
            Begin Extent = 
               Top = 350
               Left = 1141
               Bottom = 445
               Right = 1311
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Apre (Negozio)"
            Begin Extent = 
               Top = 437
               Left = 865
               Bottom = 547
               Right = 1054
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrarioDiApertura (Negozio)"
            Begin Extent = 
               Top = 105
               Left = 63
               Bottom = 405
               Right = 270
            End
            DisplayFlags = 280
            TopColumn =', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_AgentiCommittenti';
















GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[28] 2[15] 3) )"
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
               Top = 85
               Left = 181
               Bottom = 328
               Right = 358
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Stato (Dealer)"
            Begin Extent = 
               Top = 173
               Left = 712
               Bottom = 283
               Right = 886
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipoDealer (Dealer)"
            Begin Extent = 
               Top = 86
               Left = 678
               Bottom = 197
               Right = 862
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InfoGenerali"
            Begin Extent = 
               Top = 126
               Left = 55
               Bottom = 333
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InfoAgentiCommittenti (InfoGenerali)"
            Begin Extent = 
               Top = 31
               Left = 170
               Bottom = 226
               Right = 407
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DettaglioAgenti (DettaglioAgenti)"
            Begin Extent = 
               Top = 214
               Left = 1565
               Bottom = 343
               Right = 1767
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MaterialeEspositivo (DettaglioAgenti)"
            Begin Extent = 
               Top = 386
          ', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_AgentiCommittenti';















